/*
 * AppController.j
 * NewApplication
 *
 * Created by You on July 11, 2017.
 * Copyright 2017, Your Company All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>
@import "RFCard.j"

@implementation AppController : CPObject
{
    CPMutableArray         deck;
    RFCard                 card_seat1;
    CPView                  contentView;

}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    
    deck = [[CPMutableArray alloc] init];
    for (var i = 1; i <= 4; i++)
    {
        for (var j = 1; j <= 13; j++)
        {
            var rank, suit;
            rank = j;
             switch (i)
             {
                 case 1:
                      suit = 'd';
                      break;
                 case 2:
                      suit = 'c';
                      break;
                 case 3:
                      suit = 'h';
                      break;
                 case 4:
                      suit = 's';
                      break;
             }   
            switch (j)
             {
                 case 1:
                      rank = 'A';
                      break;
                 case 10:
                      rank = 'T';
                      break;
                 case 11:
                      rank = 'J';
                      break;
                 case 12:
                      rank = 'Q';
                      break;
                 case 13:
                      rank = 'K';
                      break;
             }             
         [deck addObject: rank+suit];
        }
    }

    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
    windowView = [theWindow contentView];
    [windowView setBackgroundColor: [CPColor colorWithHexString:'1b1b1b']];

     contentView = [[CPView alloc] initWithFrame:[windowView frame]];
     [windowView addSubview:contentView];

    var table_width = 650;
    var table_height = 400;
    var table = [[CPBox alloc] initWithFrame:CGRectMake(0,0,table_width, table_height)];
   // [[table contentView] setBackgroundColor:[CPColor greenColor]];
    [table setCenter:[contentView center]];
    [table setBorderWidth: 4];
    [table setBorderType: CPLineBorder];
    [table setBorderColor: [CPColor colorWithHexString:'097d5b']];
    [table setFillColor: [CPColor colorWithHexString:'0c8f68']];
    [table setCornerRadius: table_height/2];
    [table setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [contentView addSubview:table];



    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    [label setStringValue:'♣♦♥♠'];
    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label setFont:[CPFont fontWithName:'Montserrat' size: 57]];
    [label setTextColor:[CPColor colorWithHexString:'0ea376']];
    [label sizeToFit];
    [label setCenter:CGPointMake(table_width/2, table_height/2)];
    [table addSubview: label];

    [self setUpCardViews:contentView forTable:table];

    var button = [[CPButton alloc] initWithFrame: CGRectMake(
                CGRectGetWidth([contentView bounds])/2.0 ,
                CGRectGetWidth([contentView bounds])/2.0 ,
                80, 24
                )];

    [button setAutoresizingMask:CPViewMinXMargin |
                            CPViewMaxXMargin |
                            CPViewMinYMargin |
                            CPViewMaxYMargin];

    [button setTitle:"Deal"];

    [button setTarget:self];
    [button setAction:@selector(swap:)];
    [contentView addSubview:button];

    [theWindow orderFront:self];
            [contentView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];


    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

- (void)swap:(id)sender{

/*
    var r1 =((Math.random() * Number.MAX_VALUE) % ([deck count])); 
    var r2 =((Math.random() * Number.MAX_VALUE) % ([deck count])); 

    var card1 = [deck objectAtIndex:r1];
    var card2 = [deck objectAtIndex:r2];

    [card_seat1 setCard1String:card1] ;
    [card_seat1 setCard2String:card2] ;*/

}

- (void)setUpCardViews:(CPView)view forTable:(CPView)table{



    // for 6max
        for (var i = 1; i <= 6; i++) {
    var card = [[RFCard alloc] init];
        //[test setBackgroundColor:[CPColor greenColor]];
        var origin_x = CGRectGetMinX([table frame]);
        var origin_y = CGRectGetMinY([table frame]);
        var width = CGRectGetWidth([table bounds]);
        var height = CGRectGetHeight([table bounds]);

        var x_coord, y_coord;
        x_coord = 0;
        y_coord = 0;
        switch (i)
             {
                 case 1:
                      x_coord = width/3;
                      break;
                 case 2:
                      x_coord = 2*width/3;
                      break;
                 case 3:
                      x_coord = width;
                      y_coord = height/2;
                      break;
                 case 4:
                      x_coord = 2*width/3;
                      y_coord = height;
                      break;
                 case 5:
                      x_coord = width/3;
                      y_coord = height;
                      break;
                 case 6:
                      y_coord = height/2;
                      break;
             } 

        var r1 =((Math.random() * Number.MAX_VALUE) % ([deck count])); 
    var r2 =((Math.random() * Number.MAX_VALUE) % ([deck count])); 

    var card1 = [deck objectAtIndex:r1];
    var card2 = [deck objectAtIndex:r2];

    [card setCard1String:card1] ;
    [card setCard2String:card2] ;
        [card setCenter:CGPointMake(origin_x+x_coord, origin_y+y_coord)];
        [view addSubview:card];
           // [card setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];


    }

}

@end
