@STATIC;1.0;p;15;AppController.jt;8870;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;8;RFCard.jt;8791;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("RFCard.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("deck", "CPMutableArray"), new objj_ivar("card_seat1", "RFCard"), new objj_ivar("contentView", "CPView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    self.deck = ((___r1 = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
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
    (windowView == null ? null : windowView.isa.objj_msgSend1(windowView, "addSubview:", self.contentView));
    var table_width = 650;
    var table_height = 400;
    var table = ((___r1 = CPBox.isa.objj_msgSend0(CPBox, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, table_width, table_height)));
    (table == null ? null : table.isa.objj_msgSend1(table, "setCenter:", ((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "center"))));
    (table == null ? null : table.isa.objj_msgSend1(table, "setBorderWidth:", 4));
    (table == null ? null : table.isa.objj_msgSend1(table, "setBorderType:", CPLineBorder));
    (table == null ? null : table.isa.objj_msgSend1(table, "setBorderColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '097d5b')));
    (table == null ? null : table.isa.objj_msgSend1(table, "setFillColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '0c8f68')));
    (table == null ? null : table.isa.objj_msgSend1(table, "setCornerRadius:", table_height / 2));
    (table == null ? null : table.isa.objj_msgSend1(table, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    ((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", table));
    var label = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (label == null ? null : label.isa.objj_msgSend1(label, "setStringValue:", '♣♦♥♠'));
    (label == null ? null : label.isa.objj_msgSend1(label, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    (label == null ? null : label.isa.objj_msgSend1(label, "setFont:", CPFont.isa.objj_msgSend2(CPFont, "fontWithName:size:", 'Montserrat', 57)));
    (label == null ? null : label.isa.objj_msgSend1(label, "setTextColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '0ea376')));
    (label == null ? null : label.isa.objj_msgSend0(label, "sizeToFit"));
    (label == null ? null : label.isa.objj_msgSend1(label, "setCenter:", CGPointMake(table_width / 2, table_height / 2)));
    (table == null ? null : table.isa.objj_msgSend1(table, "addSubview:", label));
    self.isa.objj_msgSend2(self, "setUpCardViews:forTable:", self.contentView, table);
    var button = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(CGRectGetWidth(((___r2 = self.contentView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds"))) / 2.0, CGRectGetWidth(((___r2 = self.contentView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds"))) / 2.0, 80, 24)));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTitle:", "Deal"));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTarget:", self));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAction:", sel_getUid("swap:")));
    ((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", button));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "orderFront:", self));
    ((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    var ___r1, ___r2;
}

,["void","CPNotification"]), new objj_method(sel_getUid("swap:"), function $AppController__swap_(self, _cmd, sender)
{
}

,["void","id"]), new objj_method(sel_getUid("setUpCardViews:forTable:"), function $AppController__setUpCardViews_forTable_(self, _cmd, view, table)
{
    for (var i = 1; i <= 6; i++)
    {
        var card = ((___r1 = RFCard.isa.objj_msgSend0(RFCard, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
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
        var card1 = ((___r1 = self.deck), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", r1));
        var card2 = ((___r1 = self.deck), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", r2));
        (card == null ? null : card.isa.objj_msgSend1(card, "setCard1String:", card1));
        (card == null ? null : card.isa.objj_msgSend1(card, "setCard2String:", card2));
        (card == null ? null : card.isa.objj_msgSend1(card, "setCenter:", CGPointMake(origin_x + x_coord, origin_y + y_coord)));
        (view == null ? null : view.isa.objj_msgSend1(view, "addSubview:", card));
    }
    var ___r1;
}

,["void","CPView","CPView"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
p;8;RFCard.jt;7485;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;7418;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);
{var the_class = objj_allocateClassPair(CPView, "RFCard"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("card1View", "CPBox"), new objj_ivar("card2View", "CPBox"), new objj_ivar("card1String", "CPString"), new objj_ivar("card2String", "CPString"), new objj_ivar("card1RankLabel", "CPTextField"), new objj_ivar("card2RankLabel", "CPTextField"), new objj_ivar("card1SuitLabel", "CPTextField"), new objj_ivar("card2SuitLabel", "CPTextField"), new objj_ivar("playerView", "CPBox"), new objj_ivar("card_width", "float"), new objj_ivar("card_height", "float"), new objj_ivar("card_spacing", "float"), new objj_ivar("playerview_width", "float")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $RFCard__init(self, _cmd)
{
    self.playerview_width = 150;
    self.card_width = 53;
    self.card_height = 70;
    self.card_spacing = 5;
    self = objj_msgSendSuper1({ receiver:self, super_class:objj_getClass("RFCard").super_class }, "initWithFrame:", CGRectMake(0, 0, self.playerview_width, self.card_height + 40));
    self.card1View = ((___r1 = CPBox.isa.objj_msgSend0(CPBox, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(self.playerview_width / 2 - self.card_width - self.card_spacing / 2, 0, self.card_width, self.card_height)));
    ((___r1 = self.card1View), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFillColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
    (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.card1View));
    self.card2View = ((___r1 = CPBox.isa.objj_msgSend0(CPBox, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(self.playerview_width / 2 + self.card_spacing / 2, 0, self.card_width, self.card_height)));
    ((___r1 = self.card2View), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFillColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
    (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.card2View));
    self.card1RankLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    self.card2RankLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (self == null ? null : self.isa.objj_msgSend1(self, "addLabelToView:", self.card1RankLabel));
    (self == null ? null : self.isa.objj_msgSend1(self, "addLabelToView:", self.card2RankLabel));
    (self == null ? null : self.isa.objj_msgSend0(self, "renderPlayerView"));
    return self;
    var ___r1;
}

,["id"]), new objj_method(sel_getUid("renderPlayerView"), function $RFCard__renderPlayerView(self, _cmd)
{
    self.playerView = ((___r1 = CPBox.isa.objj_msgSend0(CPBox, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, self.card_height - 20, self.playerview_width, 50)));
    ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFillColor:", CPColor.isa.objj_msgSend0(CPColor, "lightGrayColor")));
    ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCornerRadius:", 50 / 2));
    self.isa.objj_msgSend1(self, "addSubview:", self.playerView);
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("addLabelToView:"), function $RFCard__addLabelToView_(self, _cmd, label)
{
    (label == null ? null : label.isa.objj_msgSend0(label, "sizeToFit"));
    (label == null ? null : label.isa.objj_msgSend1(label, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    (label == null ? null : label.isa.objj_msgSend1(label, "setFont:", CPFont.isa.objj_msgSend2(CPFont, "fontWithName:size:", 'Montserrat', 27)));
    self.isa.objj_msgSend1(self, "addSubview:", label);
}

,["void","CPTextField"]), new objj_method(sel_getUid("setCard1String:"), function $RFCard__setCard1String_(self, _cmd, value)
{
    self.card1String = value;
    self.isa.objj_msgSend3(self, "updateLabelForRankLabel:andCardView:withString:", self.card1RankLabel, self.card1View, self.card1String);
}

,["void","CPString"]), new objj_method(sel_getUid("setCard2String:"), function $RFCard__setCard2String_(self, _cmd, value)
{
    self.card2String = value;
    self.isa.objj_msgSend3(self, "updateLabelForRankLabel:andCardView:withString:", self.card2RankLabel, self.card2View, self.card2String);
}

,["void","CPString"]), new objj_method(sel_getUid("updateLabelForRankLabel:andCardView:withString:"), function $RFCard__updateLabelForRankLabel_andCardView_withString_(self, _cmd, rankLabel, cardView, string)
{
    CPLog.info(string);
    var components = self.isa.objj_msgSend1(self, "formattedStringFromEncoded:", string);
    var rank = (components == null ? null : components.isa.objj_msgSend1(components, "objectAtIndex:", 0));
    var suit = (components == null ? null : components.isa.objj_msgSend1(components, "objectAtIndex:", 1));
    (rankLabel == null ? null : rankLabel.isa.objj_msgSend1(rankLabel, "setStringValue:", rank + ' ' + suit));
    (rankLabel == null ? null : rankLabel.isa.objj_msgSend0(rankLabel, "sizeToFit"));
    (rankLabel == null ? null : rankLabel.isa.objj_msgSend1(rankLabel, "setCenter:", CGPointMake((cardView == null ? null : cardView.isa.objj_msgSend0(cardView, "center")).x, CGRectGetHeight((rankLabel == null ? null : rankLabel.isa.objj_msgSend0(rankLabel, "bounds"))) / 2)));
    if ((suit == null ? null : suit.isa.objj_msgSend1(suit, "isEqualToString:", '♥')) || (suit == null ? null : suit.isa.objj_msgSend1(suit, "isEqualToString:", '♦')))
    {
        (rankLabel == null ? null : rankLabel.isa.objj_msgSend1(rankLabel, "setTextColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", 'c0392b')));
    }
    else
    {
        (rankLabel == null ? null : rankLabel.isa.objj_msgSend1(rankLabel, "setTextColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '2c3e50')));
    }
}

,["void","CPTextField","CPView","CPString"]), new objj_method(sel_getUid("formattedStringFromEncoded:"), function $RFCard__formattedStringFromEncoded_(self, _cmd, input)
{
    var rank = (input == null ? null : input.isa.objj_msgSend1(input, "characterAtIndex:", 0));
    var suit = (input == null ? null : input.isa.objj_msgSend1(input, "characterAtIndex:", (input == null ? null : input.isa.objj_msgSend0(input, "length")) - 1));
    if ((suit == null ? null : suit.isa.objj_msgSend1(suit, "isEqualToString:", 'c')))
    {
        suit = '♣';
    }
    else if ((suit == null ? null : suit.isa.objj_msgSend1(suit, "isEqualToString:", 'd')))
    {
        suit = '♦';
    }
    else if ((suit == null ? null : suit.isa.objj_msgSend1(suit, "isEqualToString:", 'h')))
    {
        suit = '♥';
    }
    else if ((suit == null ? null : suit.isa.objj_msgSend1(suit, "isEqualToString:", 's')))
    {
        suit = '♠';
    }
    if ((rank == null ? null : rank.isa.objj_msgSend1(rank, "isEqualToString:", 'T')))
    {
        rank = '10';
    }
    var array = CPArray.isa.objj_msgSend3(CPArray, "arrayWithObjects:", rank, suit, nil);
    return array;
}

,["CPArray","CPString"])]);
}
e;