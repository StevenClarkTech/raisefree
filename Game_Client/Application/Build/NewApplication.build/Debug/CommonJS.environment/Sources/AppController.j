@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;21;RFHoleCardContainer.ji;13;RFBoardView.ji;15;RFConsoleView.ji;17;RFObjectManager.jt;16064;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("RFHoleCardContainer.j", YES);objj_executeFile("RFBoardView.j", YES);objj_executeFile("RFConsoleView.j", YES);objj_executeFile("RFObjectManager.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("deck", "CPMutableArray"), new objj_ivar("playerArray", "CPMutableArray"), new objj_ivar("cardViewArray", "CPMutableArray"), new objj_ivar("card_seat1", "RFHoleCardContainer"), new objj_ivar("contentView", "CPView"), new objj_ivar("boardView", "RFBoardView"), new objj_ivar("consoleView", "RFConsoleView"), new objj_ivar("objectManager", "RFObjectManager")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    self.deck = ((___r1 = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    self.playerArray = ((___r1 = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    self.cardViewArray = ((___r1 = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    self.objectManager = ((___r1 = RFObjectManager.isa.objj_msgSend0(RFObjectManager, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "initWithFakeData"));
    for (var i = 1; i <= 4; i++)
    {
        for (var j = 1; j <= 13; j++)
        {
            var rank,
                suit;
            rank = j;
            switch(i) {
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
            switch(j) {
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
            ((___r1 = self.deck), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", rank + suit));
        }
    }
    var theWindow = ((___r1 = CPWindow.isa.objj_msgSend0(CPWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask)),
        windowView = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "contentView"));
    (windowView == null ? null : windowView.isa.objj_msgSend1(windowView, "setBackgroundColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '1b1b1b')));
    self.contentView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", (windowView == null ? null : windowView.isa.objj_msgSend0(windowView, "frame"))));
    ((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMaxYMargin));
    (windowView == null ? null : windowView.isa.objj_msgSend1(windowView, "addSubview:", self.contentView));
    var table_width = 650;
    var table_height = 400;
    var space_top = 100;
    var table = ((___r1 = CPBox.isa.objj_msgSend0(CPBox, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, table_width, table_height)));
    (table == null ? null : table.isa.objj_msgSend1(table, "setCenter:", CGPointMake(((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "center")).x, table_height / 2 + space_top)));
    (table == null ? null : table.isa.objj_msgSend1(table, "setBorderWidth:", 14));
    (table == null ? null : table.isa.objj_msgSend1(table, "setBorderType:", CPLineBorder));
    (table == null ? null : table.isa.objj_msgSend1(table, "setBorderColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '097d5b')));
    (table == null ? null : table.isa.objj_msgSend1(table, "setFillColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '0c8f68')));
    (table == null ? null : table.isa.objj_msgSend1(table, "setCornerRadius:", table_height / 2));
    (table == null ? null : table.isa.objj_msgSend1(table, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    ((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", table));
    var consoleHeight = 250;
    self.consoleView = ((___r1 = RFConsoleView.isa.objj_msgSend0(RFConsoleView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, CGRectGetHeight(((___r2 = self.contentView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))) - consoleHeight, CGRectGetWidth(((___r2 = self.contentView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))), consoleHeight)));
    ((___r1 = self.consoleView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinYMargin | CPViewMinXMargin | CPViewMaxXMargin | CPViewWidthSizable));
    (windowView == null ? null : windowView.isa.objj_msgSend1(windowView, "addSubview:", self.consoleView));
    var label = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (label == null ? null : label.isa.objj_msgSend1(label, "setStringValue:", '♣♦♥♠'));
    (label == null ? null : label.isa.objj_msgSend1(label, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    (label == null ? null : label.isa.objj_msgSend1(label, "setFont:", CPFont.isa.objj_msgSend2(CPFont, "fontWithName:size:", 'Montserrat-Bold', 57)));
    (label == null ? null : label.isa.objj_msgSend1(label, "setTextColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '0ea376')));
    (label == null ? null : label.isa.objj_msgSend0(label, "sizeToFit"));
    (label == null ? null : label.isa.objj_msgSend1(label, "setCenter:", CGPointMake(table_width / 2, table_height / 2)));
    (table == null ? null : table.isa.objj_msgSend1(table, "addSubview:", label));
    self.isa.objj_msgSend2(self, "setUpCardViews:forTable:", self.contentView, table);
    var button = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 24, 80, 24)));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTitle:", "CLEAR"));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTarget:", self));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAction:", sel_getUid("clear:")));
    var toggle = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 80, 24)));
    (toggle == null ? null : toggle.isa.objj_msgSend1(toggle, "setTitle:", "TOGGLE"));
    (toggle == null ? null : toggle.isa.objj_msgSend1(toggle, "setTarget:", self));
    (toggle == null ? null : toggle.isa.objj_msgSend1(toggle, "setAction:", sel_getUid("toggle:")));
    var deal = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 24 * 2, 80, 24)));
    (deal == null ? null : deal.isa.objj_msgSend1(deal, "setTitle:", "DEAL"));
    (deal == null ? null : deal.isa.objj_msgSend1(deal, "setTarget:", self));
    (deal == null ? null : deal.isa.objj_msgSend1(deal, "setAction:", sel_getUid("deal:")));
    self.boardView = ((___r1 = RFBoardView.isa.objj_msgSend0(RFBoardView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    ((___r1 = self.boardView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", (table == null ? null : table.isa.objj_msgSend0(table, "center"))));
    ((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", button));
    ((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", deal));
    ((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", toggle));
    ((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self.boardView));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "orderFront:", self));
    var ___r1, ___r2;
}

,["void","CPNotification"]), new objj_method(sel_getUid("toggle:"), function $AppController__toggle_(self, _cmd, sender)
{
    self.cardViewArray.forEach(    function(card)
    {
        (card == null ? null : card.isa.objj_msgSend1(card, "setShowCards:", !card.showCards));
    });
}

,["void","id"]), new objj_method(sel_getUid("deal:"), function $AppController__deal_(self, _cmd, sender)
{
    ((___r1 = self.boardView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reset"));
    var array = ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    for (var i = 0; i < 5; i++)
    {
        (array == null ? null : array.isa.objj_msgSend1(array, "addObject:", self.isa.objj_msgSend0(self, "getRandomCard")));
    }
    ((___r1 = self.boardView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBoardArray:", array));
    ((___r1 = self.boardView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "dealFlop"));
    ((___r1 = self.boardView), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "performSelector:withObject:afterDelay:", sel_getUid("dealTurn"), self.boardView, .6));
    ((___r1 = self.boardView), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "performSelector:withObject:afterDelay:", sel_getUid("dealRiver"), self.boardView, 1.2));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("clear:"), function $AppController__clear_(self, _cmd, sender)
{
    self.cardViewArray.forEach(    function(card)
    {
        (card == null ? null : card.isa.objj_msgSend1(card, "setEmptySeat:", YES));
    });
    ((___r1 = self.boardView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reset"));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("getRandomCard"), function $AppController__getRandomCard(self, _cmd)
{
    var r = Math.random() * Number.MAX_VALUE % ((___r1 = self.deck), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var card = ((___r1 = self.deck), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", r));
    return card;
    var ___r1;
}

,["CPString"]), new objj_method(sel_getUid("setUpCardViews:forTable:"), function $AppController__setUpCardViews_forTable_(self, _cmd, view, table)
{
    for (var i = 1; i <= 6; i++)
    {
        var card = ((___r1 = RFHoleCardContainer.isa.objj_msgSend0(RFHoleCardContainer, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        var origin_x = CGRectGetMinX((table == null ? null : table.isa.objj_msgSend0(table, "frame")));
        var origin_y = CGRectGetMinY((table == null ? null : table.isa.objj_msgSend0(table, "frame")));
        var width = CGRectGetWidth((table == null ? null : table.isa.objj_msgSend0(table, "bounds")));
        var height = CGRectGetHeight((table == null ? null : table.isa.objj_msgSend0(table, "bounds")));
        var x_coord,
            y_coord;
        x_coord = 0;
        y_coord = 0;
        switch(i) {
            case 1:
                x_coord = width / 3;
                break;
            case 2:
                x_coord = 2 * width / 3;
                break;
            case 3:
                x_coord = width;
                y_coord = height / 2;
                break;
            case 4:
                x_coord = 2 * width / 3;
                y_coord = height;
                break;
            case 5:
                x_coord = width / 3;
                y_coord = height;
                break;
            case 6:
                y_coord = height / 2;
                break;
        }
        var r1 = Math.random() * Number.MAX_VALUE % ((___r1 = self.deck), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        var r2 = Math.random() * Number.MAX_VALUE % ((___r1 = self.deck), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        var r3 = Math.random() * Number.MAX_VALUE % 3;
        var chip_count = Math.random() * Number.MAX_VALUE % 9999;
        if (r3 == 0)
        {
            (card == null ? null : card.isa.objj_msgSend1(card, "setShowCards:", NO));
        }
        else
        {
            (card == null ? null : card.isa.objj_msgSend1(card, "setShowCards:", YES));
        }
        var card1 = ((___r1 = self.deck), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", r1));
        var card2 = ((___r1 = self.deck), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", r2));
        if (r3 == 1)
        {
        }
        (card == null ? null : card.isa.objj_msgSend1(card, "setEmptySeat:", NO));
        (card == null ? null : card.isa.objj_msgSend1(card, "setHeroSeated:", NO));
        var key = "seat" + i;
        var player = ((___r1 = ((___r2 = self.objectManager), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "playerDictionary"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", key));
        if (player != CPNull.isa.objj_msgSend0(CPNull, "null"))
        {
            CPLog((player == null ? null : player.isa.objj_msgSend0(player, "playerName")));
            (card == null ? null : card.isa.objj_msgSend1(card, "setPlayerString:", (player == null ? null : player.isa.objj_msgSend0(player, "playerName"))));
            (card == null ? null : card.isa.objj_msgSend1(card, "setChipCount:", (player == null ? null : player.isa.objj_msgSend0(player, "chipCount"))));
        }
        else
        {
            (card == null ? null : card.isa.objj_msgSend1(card, "setEmptySeat:", YES));
            (card == null ? null : card.isa.objj_msgSend1(card, "setHeroSeated:", NO));
        }
        ((___r1 = self.cardViewArray), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", card));
        (card == null ? null : card.isa.objj_msgSend1(card, "setCard1String:", card1));
        (card == null ? null : card.isa.objj_msgSend1(card, "setCard2String:", card2));
        (card == null ? null : card.isa.objj_msgSend1(card, "setController:", self));
        (card == null ? null : card.isa.objj_msgSend1(card, "setSeatNumber:", i));
        (card == null ? null : card.isa.objj_msgSend1(card, "setCenter:", CGPointMake(origin_x + x_coord, origin_y + y_coord)));
        (view == null ? null : view.isa.objj_msgSend1(view, "addSubview:", card));
    }
    var ___r1, ___r2;
}

,["void","CPView","CPView"]), new objj_method(sel_getUid("configureSeats"), function $AppController__configureSeats(self, _cmd)
{
    for (var object in self.cardViewArray)
    {
        CPLog.info(object);
    }
}

,["void"]), new objj_method(sel_getUid("sitDown:"), function $AppController__sitDown_(self, _cmd, card)
{
    (card == null ? null : card.isa.objj_msgSend1(card, "setEmptySeat:", NO));
}

,["void","RFHoleCardContainer"])]);
}
