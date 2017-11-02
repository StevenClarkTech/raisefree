@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>
@import "RFCardView.j"

@class AppController

@implementation RFBoardView : CPView
{
    CPArray               boardArray @accessors(setter=setBoardArray);
    CPArray               arrayOfCards;
    float   board_width, board_height, card_spacing;

}


- (id)init
{
    card_spacing = 10;
    board_width = 53*5+5*card_spacing;
    board_height = 70;

    self = [super initWithFrame:CGRectMake(0,0,board_width,board_height)];
    arrayOfCards = [[CPArray alloc] init];

    //[self setBackgroundColor:[CPColor lightGrayColor]];
    return self;
}

- (void)setBoardArray:(CPArray)array{
    arrayOfCards = [[CPArray alloc] init];
    boardArray = array;
}

- (void)reset{
arrayOfCards.forEach(function(card) {
        [card removeFromSuperview];
    });
}

- (void)dealCardAtIndex:(int)i{

    var card = [[RFCardView alloc] init];
    var card_width = CGRectGetWidth([card frame]);
    [card setCardString:[boardArray objectAtIndex:i]] ;
    [self addSubview:card];
    [arrayOfCards addObject:card];
    [card setCenter: CGPointMake(card_width*(i+1)+((i-2)*card_spacing), [card center].y)];
}

- (void)dealFlop
{
arrayOfCards.forEach(function(card) {
CPLog(card);
    });    

    for (var i = 0; i <= 2; i++) {
       [self dealCardAtIndex:i];
    }
}

- (void)dealTurn{
    [self dealCardAtIndex:3];
}


- (void)dealRiver{
    [self dealCardAtIndex:4];
}


@end