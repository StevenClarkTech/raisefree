@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>

@implementation RFCard : CPView
{

	CPBox              card1View;
    CPBox              card2View;

    CPString			card1String;
    CPString			card2String;

    CPTextField			card1RankLabel;
    CPTextField			card2RankLabel;

    CPTextField			card1SuitLabel;
    CPTextField			card2SuitLabel;

    CPBox				playerView;

    float card_width, card_height, card_spacing, playerview_width;
}

- (id)init
{

	 playerview_width = 150;
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
    [self addLabelToView:card1RankLabel];
    [self addLabelToView:card2RankLabel];

    [self renderPlayerView];

    return self;
}

- (void)renderPlayerView{
	playerView = [[CPBox alloc] initWithFrame:CGRectMake(0,card_height-20,playerview_width,50)];
	[playerView setFillColor:[CPColor lightGrayColor]];
	[playerView setCornerRadius: 50/2];
	[self addSubview:playerView];
}

- (void)addLabelToView:(CPTextField)label{

	[label sizeToFit];
	[label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	[label setFont:[CPFont fontWithName:'Montserrat' size: 27]];
    [self addSubview:label];
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

	[rankLabel setStringValue:rank + ' ' + suit] ;
	[rankLabel sizeToFit]
    [rankLabel setCenter:CGPointMake([cardView center].x, CGRectGetHeight([rankLabel bounds])/2) ];

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

@end