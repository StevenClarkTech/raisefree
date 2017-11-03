/*
 * AppController.j
 * NewApplication
 *
 * Created by You on July 11, 2017.
 * Copyright 2017, Your Company All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>
@import "RFHoleCardContainer.j"
@import "RFBoardView.j"

@implementation AppController : CPObject
{
    CPMutableArray         deck;
    CPMutableArray         playerArray;
    CPMutableArray         cardViewArray;

    RFHoleCardContainer    card_seat1;
    CPView                 contentView;
    RFBoardView            boardView;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    
    deck = [[CPMutableArray alloc] init];
    playerArray = [[CPMutableArray alloc] init];
    cardViewArray = [[CPMutableArray alloc] init];


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
    [contentView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin  | CPViewMaxYMargin];

    [windowView addSubview:contentView];

    var table_width = 650;
    var table_height = 400;
    var space_top = 100;
    var table = [[CPBox alloc] initWithFrame:CGRectMake(0,0,table_width, table_height)];
   // [[table contentView] setBackgroundColor:[CPColor greenColor]];
    [table setCenter:CGPointMake([contentView center].x, table_height/2 + space_top)];
    [table setBorderWidth: 14];
    [table setBorderType: CPLineBorder];
    [table setBorderColor: [CPColor colorWithHexString:'097d5b']];
    [table setFillColor: [CPColor colorWithHexString:'0c8f68']];
    [table setCornerRadius: table_height/2];
    [table setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [contentView addSubview:table];

    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    [label setStringValue:'♣♦♥♠'];
    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label setFont:[CPFont fontWithName:'Montserrat-Bold' size: 57]];
    [label setTextColor:[CPColor colorWithHexString:'0ea376']];
    [label sizeToFit];
    [label setCenter:CGPointMake(table_width/2, table_height/2)];
    [table addSubview: label];

    [self setUpCardViews:contentView forTable:table];

    var button = [[CPButton alloc] initWithFrame: CGRectMake(0, 24, 80, 24)];

    [button setAutoresizingMask:CPViewMinXMargin |
                            CPViewMaxXMargin |
                            CPViewMinYMargin |
                            CPViewMaxYMargin];

    [button setTitle:"CLEAR"];
    [button setTarget:self];
    [button setAction:@selector(clear:)];

    var toggle = [[CPButton alloc] initWithFrame: CGRectMake(0, 0, 80, 24)];

    [toggle setTitle:"TOGGLE"];
    [toggle setTarget:self];
    [toggle setAction:@selector(toggle:)];

    var deal = [[CPButton alloc] initWithFrame: CGRectMake(0, 24*2, 80, 24)];
    [deal setTitle:"DEAL"];
    [deal setTarget:self];
    [deal setAction:@selector(deal:)];

    boardView = [[RFBoardView alloc] init];
    [boardView setCenter:[table center]];

    [contentView addSubview:button];
    [contentView addSubview:deal];
    [contentView addSubview:toggle];
    [contentView addSubview:boardView];

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

- (void)toggle:(id)sender{
      cardViewArray.forEach(function(card) {
        [card setShowCards:!card.showCards];
    });
}

- (void)deal:(id)sender{
      

      // deal the flop

      // deal the turn

      // deal the river
           [boardView reset];

      var array = [[CPArray alloc] init];
      for (var i = 0; i < 5; i++) {
        [array addObject:[self getRandomCard]];
      }

      [boardView setBoardArray:array];

      [boardView dealFlop];


      [boardView performSelector:@selector(dealTurn) withObject:boardView afterDelay:.6];
      [boardView performSelector:@selector(dealRiver) withObject:boardView afterDelay:1.2];

}

- (void)clear:(id)sender{

/*
    var r1 =((Math.random() * Number.MAX_VALUE) % ([deck count])); 
    var r2 =((Math.random() * Number.MAX_VALUE) % ([deck count])); 

    var card1 = [deck objectAtIndex:r1];
    var card2 = [deck objectAtIndex:r2];

    [card_seat1 setCard1String:card1] ;
    [card_seat1 setCard2String:card2] ;*/

      cardViewArray.forEach(function(card) {
        [card setEmptySeat:YES];
    });

     [boardView reset];

}

- (CPString)getRandomCard{
        var r =((Math.random() * Number.MAX_VALUE) % ([deck count])); 
        var card = [deck objectAtIndex:r];
        return card;

}

- (void)setUpCardViews:(CPView)view forTable:(CPView)table{

    // for 6max
    for (var i = 1; i <= 6; i++) {
        var card = [[RFHoleCardContainer alloc] init];
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
        var r3 =(Math.random() * Number.MAX_VALUE) % 3; 
        var chip_count =(Math.random() * Number.MAX_VALUE) % 9999; 

        if (r3 == 0){
          [card setShowCards:NO];
        }
        else{
          [card setShowCards:YES];
        }

        var card1 = [deck objectAtIndex:r1];
        var card2 = [deck objectAtIndex:r2];

        if (r3 == 1) {

        }
        [card setEmptySeat:NO];
        [card setHeroSeated: NO] ;

        [card setChipCount:chip_count];
        if (i == 1) {
          [card setPlayerString:"Anthony"];
        }
        else if (i == 2) {
          [card setPlayerString:"Austin"];
        }
        else if (i == 3) {
          [card setPlayerString:"Chambers"];
        }
        else if (i == 4) {
          [card setPlayerString:"Jackson"];
        }
        else if (i == 5) {
          [card setPlayerString:"RF"];
        }
        [cardViewArray addObject:card];

       // [playerArray addObject:card];

        [card setCard1String:card1] ;
        [card setCard2String:card2] ;
        [card setController: self];
        [card setSeatNumber:i]
        [card setCenter:CGPointMake(origin_x+x_coord, origin_y+y_coord)];
        [view addSubview:card];
               // [card setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    }
}

- (void)configureSeats{

  for (var object in cardViewArray) {
    CPLog.info(object);
  }


}

- (void)sitDown:(RFHoleCardContainer)card{

//
  [card setEmptySeat:NO];
}

@end
