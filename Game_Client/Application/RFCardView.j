@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>

@class AppController

@implementation RFCardView : CPView
{

	CPBox               cardBox;

    CPString			cardString @accessors(setter=setCardString);

    CPTextField			rankLabel;
    CPTextField			suitLabel;

    float card_width, card_height;
}


- (id)init
{

    card_width = 53;
    card_height = 70;

    self = [super initWithFrame:CGRectMake(0,0,card_width,card_height)];


    cardBox = [[CPBox alloc] initWithFrame:CGRectMake(0,0,card_width,card_height)];
    [cardBox setFillColor:[CPColor whiteColor]];
    [self addSubview:cardBox];

    rankLabel = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    [rankLabel sizeToFit];
    [rankLabel setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [rankLabel setFont:[CPFont boldFontWithName:'Montserrat' size:30]];

    [cardBox addSubview:rankLabel];

    return self;
}

- (void)setCardString:(CPString)string{

    cardString = string;
    [self updateLabelForRankLabel:rankLabel andCardView:cardBox withString:string];
}

- (void)updateLabelForRankLabel:(CPTextField)textField andCardView:(CPView)cardView withString:(CPString)string{

    CPLog.info(string);

    var components = [self formattedStringFromEncoded:string];
    var rank = [components objectAtIndex:0];
    var suit = [components objectAtIndex:1];

    [textField setStringValue:rank + suit] ;
    [textField sizeToFit]
 //   [rankLabel setCenter:CGPointMake([cardView center].x, CGRectGetHeight([rankLabel bounds])/2) ];
 [textField setCenter:CGPointMake(card_width/2, 25)];

    if ([suit isEqualToString:'♥'] || [suit isEqualToString:'♦']) {
        [textField setTextColor:[CPColor colorWithHexString:'c0392b']];
    }
    else{
        [textField setTextColor:[CPColor colorWithHexString:'2c3e50']];
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

@end