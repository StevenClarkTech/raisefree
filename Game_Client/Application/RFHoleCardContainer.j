@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>
@import "RFCardView.j"

@class AppController

@implementation RFHoleCardContainer : CPView
{

	RFCardView 			cardView1;
	RFCardView			cardView2;

    CPString			card1String;
    CPString			card2String;
 

    CPString			playerString @accessors(setter=setPlayerString);
    CPTextField			playerLabel;

    int 				chipCount @accessors(setter=setChipCount);
    CPTextField			chipCountLabel;

	CPButton            seatButton;

    CPBox				playerView;

    BOOL 				isHeroSeated @accessors(setter=setHeroSeated); // configures the view based on whether hero is sat

    BOOL                showCards;
    BOOL  				isEmptySeat @accessors(setter=setEmptySeat);
    BOOL  				hasCards;

    AppController controller @accessors(setter=setController);

    int seatNumber @accessors(setter=setSeatNumber);

    float card_width, card_height, card_spacing, playerview_width, playerview_height;
}

- (id)init
{

	playerview_width = 150;
	playerview_height = 55;
	card_width = CGRectGetWidth([[[RFCardView alloc] init] bounds]);
	card_height = CGRectGetHeight([[[RFCardView alloc] init] bounds]);
	card_spacing = 5;
	self = [super initWithFrame:CGRectMake(0,0,playerview_width,card_height+40)];

    cardView1 = [[RFCardView alloc] init];
    [cardView1 setCenter: CGPointMake(playerview_width/2 - card_spacing/2 - card_width/2, [cardView1 center].y)];
    [self addSubview: cardView1];

    cardView2 = [[RFCardView alloc] init];
    [cardView2 setCenter: CGPointMake(playerview_width/2 + card_spacing/2 + card_width/2, [cardView1 center].y)];
    [self addSubview: cardView2];

	seatButton = [[CPButton alloc] initWithFrame: CGRectMake(0,0,card_width*2+10,card_width*2+10)];
	[seatButton setCenter: [self center]];
    [seatButton setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];

    [seatButton setValue:[[CPColor colorWithHexString:'34495e'] colorWithAlphaComponent: .4] forThemeAttribute:@"bezel-color" inState:CPThemeStateNormal];
    [seatButton setValue:[CPColor whiteColor] forThemeAttribute:@"text-color" inState:CPThemeStateNormal];
    [seatButton setValue:[[CPColor colorWithHexString:'34495e'] colorWithAlphaComponent: .8] forThemeAttribute:@"bezel-color" inState:CPThemeStateHighlighted];
    [seatButton setTitle:"SIT DOWN"];
    [seatButton setTarget:self];
    [seatButton setBordered:YES];
    [seatButton setAction:@selector(sitDownClicked:)];
    [self addSubview:seatButton];

    [self renderPlayerView];

    return self;
}

- (void)renderPlayerView
{
	playerView = [[CPBox alloc] initWithFrame:CGRectMake(0,card_height-20,playerview_width,playerview_height)];
	[playerView setFillColor:[CPColor colorWithHexString:'2c3e50']];
	[playerView setBorderColor: [CPColor colorWithHexString:'34495e']]; //34495e
	//[playerView setCornerRadius: playerview_height/2];
	var font_size = 13;

	playerLabel = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    [playerLabel setStringValue:"Steven4294"];
    [playerLabel setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [playerLabel setFont:[CPFont fontWithName:'Montserrat' size:font_size]];
    [playerLabel setTextColor:[CPColor colorWithWhite:1 alpha:.7]];
    [playerLabel sizeToFit];
    [playerLabel setCenter:CGPointMake(playerview_width/2, [playerLabel center].y+5)];

    //[playerLabel setAlignment:CPCenterTextAlignment];
	[playerView addSubview:playerLabel];

	chipCountLabel = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    [chipCountLabel setStringValue:"$1000"];
    [chipCountLabel setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [chipCountLabel setFont:[CPFont fontWithName:'Montserrat' size:font_size]];
    [chipCountLabel setTextColor:[CPColor colorWithHexString:'f1c40f']];
    [chipCountLabel sizeToFit];
    [chipCountLabel setCenter:CGPointMake(playerview_width/2, playerview_height-15)];

	[playerView addSubview:chipCountLabel];

	var seperator = [[CPView alloc] initWithFrame:CGRectMake(0,0,playerview_width-50,2)];
	[seperator setBackgroundColor:[CPColor colorWithWhite:1 alpha:.1]];
	[seperator setCenter:CGPointMake(playerview_width/2, playerview_height/2)];
	[playerView addSubview:seperator];

	[self addSubview:playerView];
}
- (void)setPlayerString:(CPString)string{
	playerString = string;
    [playerLabel setStringValue:string];
     [playerLabel sizeToFit];
    [playerLabel setCenter:CGPointMake(playerview_width/2, [playerLabel center].y)];


}

- (void)setChipCount:(int)count{
	chipCount = count;
    [chipCountLabel setStringValue:"$"+count];
    [chipCountLabel sizeToFit];
    [chipCountLabel setCenter:CGPointMake(playerview_width/2, playerview_height-15)];

    CPLog("should update chip count");

}


- (void)setCard1String:(CPString)value
{
	card1String = value;
	[cardView1 setCardString:value];
}

- (void)setCard2String:(CPString)value
{
	card2String = value;
	[cardView2 setCardString:value];
}

//♣♦♥♠

/*
 *   This renders the view if no one is sitting here 
 */
- (void)setEmptySeat:(BOOL)empty
{
	isEmptySeat = empty;
	if (empty == YES) {
		if (isHeroSeated == NO) {
		    [seatButton setHidden: NO];
		    [playerView setHidden: YES];
		}
		else{
			[seatButton setHidden:YES];
			[playerView setHidden:NO];
		}


	    [cardView1 setHidden:YES];
	    [cardView2 setHidden:YES];
	}
	else{
		[seatButton setHidden:YES];
				[playerView setHidden:NO];

		[cardView1 setHidden:NO];
	    [cardView2 setHidden:NO];
	}
}

- (void)sitDownClicked:(id)sender
{
	[controller sitDown:self];
}

- (void)setShowCards:(BOOL)shouldShowCards
{
	showCards  = shouldShowCards;

	[self hideCard:!shouldShowCards withCardView:cardView1];
	[self hideCard:!shouldShowCards withCardView:cardView2];
}

- (void)hideCard:(BOOL)hide withCardView:(RFCardView)view
{
	if (hide == YES) {
		[view.cardBox setBorderColor: [CPColor whiteColor]];
		[view.cardBox setFillColor:[CPColor colorWithHexString:'e74c3c']] ;
		[view.rankLabel setHidden: YES];
	}
	else{
		[view.cardBox setFillColor:[CPColor whiteColor]] ;
		[view.rankLabel setHidden: NO];
	}
}

- (void)setHeroSeated:(BOOL)heroSeated
{
	isHeroSeated = heroSeated;

	if (isEmptySeat == YES) {
		if (isHeroSeated == NO) {
		    [seatButton setHidden: NO];
		    [playerView setHidden: YES];
		}
		else{
			[seatButton setHidden:YES];
			[playerView setHidden:NO];
		}

	    [cardView1 setHidden:YES];
	    [cardView2 setHidden:YES];
	}
	else{
		[seatButton setHidden:YES];
		[playerView setHidden:NO];
		[cardView1 setHidden:NO];
	    [cardView2 setHidden:NO];
	}

}


@end