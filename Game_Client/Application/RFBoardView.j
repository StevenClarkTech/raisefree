@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>
@import "RFCardView.j"

@class AppController

@implementation RFBoardView : CPView
{
    float board_width, board_height;
}


- (id)init
{

    board_width = 50;
    board_height = 400;

    self = [super initWithFrame:CGRectMake(0,0,board_width,board_height)];


    return self;
}


@end