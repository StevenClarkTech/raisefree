@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>

@class AppController

@implementation RFCard : CPView
{

	CPBox              card1View;
    CPBox              card2View;

    CPString			card1String;
    CPString			card2String;

    CPTextField			card1RankLabel;
    CPTextField			card2RankLabel;
	CPButton            seatButton;

    CPTextField			card1SuitLabel;
    CPTextField			card2SuitLabel;

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
	 playerview_height = 50;
	 card_width = 53;
	 card_height = 70;
	 card_spacing = 5;
	self = [super initWithFrame:CGRectMake(0,0,playerview_width,card_height+40)];

//	[self setBackgroundColor:[CPColor blueColor]];

	card1View = [[CPBox alloc] initWithFrame:CGRectMake((playerview_width/2) - card_width - (card_spacing/2),0,card_width,card_height)];
    //[card1View setBackgroundColor:[CPColor lightGrayColor]];
    [card1View setFillColor:[CPColor whiteColor]];
    [self addSubview:card1View];

    card2View = [[CPBox alloc] initWithFrame:CGRectMake((playerview_width/2) + (card_spacing/2),0,card_width,card_height)];
   // [card2View setBackgroundColor:[CPColor darkGrayColor]];
       [card2View setFillColor:[CPColor whiteColor]];

    [self addSubview:card2View];


	card1RankLabel = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    card2RankLabel = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];


    [self configureLabel:card1RankLabel];
    [self configureLabel:card2RankLabel];

    [card1View addSubview:card1RankLabel];
    [card2View addSubview:card2RankLabel];

	seatButton = [[CPButton alloc] initWithFrame: CGRectMake(0,0,card_width*2+10,card_width*2+10)];
	[seatButton setCenter: [self center]];
    [seatButton setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];

		    //[button setBezelStyle:CPTexturedSquareBezelStyle];
		   // [button setButtonType:CPOnOffButton];

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

- (void)renderPlayerView{
	playerView = [[CPBox alloc] initWithFrame:CGRectMake(0,card_height-20,playerview_width,playerview_height)];
	[playerView setFillColor:[CPColor colorWithHexString:'2c3e50']];

	    [playerView setBorderColor: [CPColor colorWithHexString:'34495e']]; //34495e

	//[playerView setCornerRadius: playerview_height/2];
	[self addSubview:playerView];
}

- (void)configureLabel:(CPTextField)label{

	[label sizeToFit];
	[label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    	[label setFont:[CPFont boldFontWithName:'Montserrat' size:30]];
}

- (void)setCard1String:(CPString)value{

	card1String = value;
	[self updateLabelForRankLabel:card1RankLabel andCardView:card1View withString:card1String];
}

- (void)setCard2String:(CPString)value{

	card2String = value;
	[self updateLabelForRankLabel:card2RankLabel andCardView:card2View withString:card2String];
}

- (void)updateLabelForRankLabel:(CPTextField)rankLabel andCardView:(CPView)cardView withString:(CPString)string{

    CPLog.info(string);

	var components = [self formattedStringFromEncoded:string];
	var rank = [components objectAtIndex:0];
	var suit = [components objectAtIndex:1];

	[rankLabel setStringValue:rank + suit] ;
	[rankLabel sizeToFit]
 //   [rankLabel setCenter:CGPointMake([cardView center].x, CGRectGetHeight([rankLabel bounds])/2) ];
 [rankLabel setCenter:CGPointMake(card_width/2, 25)];

    if ([suit isEqualToString:'♥'] || [suit isEqualToString:'♦']) {
    	[rankLabel setTextColor:[CPColor colorWithHexString:'c0392b']];
    }
    else{
    	[rankLabel setTextColor:[CPColor colorWithHexString:'2c3e50']];
    }
}

// Tc -> 10 ♣
- (CPArray)formattedStringFromEncoded:(CPString)input{
 	var rank = [input characterAtIndex:0];
 	var suit = [input characterAtIndex:([input length] - 1)];	

	 if ([suit isEqualToString:'c']) {
	 	suit = '♣';
	 }
	 else if ([suit isEqualToString:'d']){
	 	suit = '♦';
	 }
	 else if ([suit isEqualToString:'h']){
	 	suit = '♥';
	 }
	 else if ([suit isEqualToString:'s']){
	 	suit = '♠';
	 }

	if ([rank isEqualToString:'T']) {
		rank = '10';
	}

	var array = [CPArray arrayWithObjects:rank,suit,nil];

   return array;
}
//♣♦♥♠

/*
 *   This renders the view if no one is sitting here 
 */
- (void)setEmptySeat:(BOOL)empty{
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


	    [card1View setHidden:YES];
	    [card2View setHidden:YES];
	}
	else{
		[seatButton setHidden:YES];
				[playerView setHidden:NO];

		[card1View setHidden:NO];
	    [card2View setHidden:NO];
	}
}

- (void)sitDownClicked:(id)sender{
	[controller sitDown:self];
}
- (void)setShowCards:(BOOL)shouldShowCards{

	showCards  = shouldShowCards;

	[self hideCard:!shouldShowCards withCardView:card1View andLabel:card1RankLabel];
	[self hideCard:!shouldShowCards withCardView:card2View andLabel:card2RankLabel];
}

- (void)hideCard:(BOOL)hide withCardView:(CPView)view andLabel:(CPTextField)label{
	if (hide == YES) {
		[view setBorderColor: [CPColor whiteColor]];
		[view setFillColor:[CPColor colorWithHexString:'e74c3c']] ;
		[label setHidden: YES];
	}
	else{
		[view setFillColor:[CPColor whiteColor]] ;
		[label setHidden: NO];
	}
}

- (void)setHeroSeated:(BOOL)heroSeated{
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


	    [card1View setHidden:YES];
	    [card2View setHidden:YES];
	}
	else{
		[seatButton setHidden:YES];
				[playerView setHidden:NO];

		[card1View setHidden:NO];
	    [card2View setHidden:NO];
	}

}


@end