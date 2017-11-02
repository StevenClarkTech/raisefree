@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;14359;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);
{var the_class = objj_allocateClassPair(CPView, "RFCard"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("card1View", "CPBox"), new objj_ivar("card2View", "CPBox"), new objj_ivar("card1String", "CPString"), new objj_ivar("card2String", "CPString"), new objj_ivar("card1RankLabel", "CPTextField"), new objj_ivar("card2RankLabel", "CPTextField"), new objj_ivar("seatButton", "CPButton"), new objj_ivar("card1SuitLabel", "CPTextField"), new objj_ivar("card2SuitLabel", "CPTextField"), new objj_ivar("playerView", "CPBox"), new objj_ivar("isHeroSeated", "BOOL"), new objj_ivar("showCards", "BOOL"), new objj_ivar("isEmptySeat", "BOOL"), new objj_ivar("hasCards", "BOOL"), new objj_ivar("controller", "AppController"), new objj_ivar("seatNumber", "int"), new objj_ivar("card_width", "float"), new objj_ivar("card_height", "float"), new objj_ivar("card_spacing", "float"), new objj_ivar("playerview_width", "float"), new objj_ivar("playerview_height", "float")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isHeroSeated"), function $RFCard__isHeroSeated(self, _cmd)
{
    return self.isHeroSeated;
}

,["BOOL"]), new objj_method(sel_getUid("setHeroSeated:"), function $RFCard__setHeroSeated_(self, _cmd, newValue)
{
    self.isHeroSeated = newValue;
}

,["void","BOOL"]), new objj_method(sel_getUid("isEmptySeat"), function $RFCard__isEmptySeat(self, _cmd)
{
    return self.isEmptySeat;
}

,["BOOL"]), new objj_method(sel_getUid("setEmptySeat:"), function $RFCard__setEmptySeat_(self, _cmd, newValue)
{
    self.isEmptySeat = newValue;
}

,["void","BOOL"]), new objj_method(sel_getUid("controller"), function $RFCard__controller(self, _cmd)
{
    return self.controller;
}

,["AppController"]), new objj_method(sel_getUid("setController:"), function $RFCard__setController_(self, _cmd, newValue)
{
    self.controller = newValue;
}

,["void","AppController"]), new objj_method(sel_getUid("seatNumber"), function $RFCard__seatNumber(self, _cmd)
{
    return self.seatNumber;
}

,["int"]), new objj_method(sel_getUid("setSeatNumber:"), function $RFCard__setSeatNumber_(self, _cmd, newValue)
{
    self.seatNumber = newValue;
}

,["void","int"]), new objj_method(sel_getUid("init"), function $RFCard__init(self, _cmd)
{
    self.playerview_width = 150;
    self.playerview_height = 50;
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
    ((___r1 = self.card1RankLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", CPFont.isa.objj_msgSend2(CPFont, "boldFontWithName:size:", 'Montserrat', 40)));
    ((___r1 = self.card2RankLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", CPFont.isa.objj_msgSend2(CPFont, "boldFontWithName:size:", 'Montserrat', 45)));
    (self == null ? null : self.isa.objj_msgSend1(self, "configureLabel:", self.card1RankLabel));
    (self == null ? null : self.isa.objj_msgSend1(self, "configureLabel:", self.card2RankLabel));
    ((___r1 = self.card1View), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self.card1RankLabel));
    ((___r1 = self.card2View), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self.card2RankLabel));
    self.seatButton = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, self.card_width * 2 + 10, self.card_width * 2 + 10)));
    ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", (self == null ? null : self.isa.objj_msgSend0(self, "center"))));
    ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", ((___r2 = CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '34495e')), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "colorWithAlphaComponent:", .4)), "bezel-color", CPThemeStateNormal));
    ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor"), "text-color", CPThemeStateNormal));
    ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", ((___r2 = CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '34495e')), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "colorWithAlphaComponent:", .8)), "bezel-color", CPThemeStateHighlighted));
    ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", "SIT DOWN"));
    ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBordered:", YES));
    ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("sitDownClicked:")));
    (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.seatButton));
    (self == null ? null : self.isa.objj_msgSend0(self, "renderPlayerView"));
    return self;
    var ___r1, ___r2;
}

,["id"]), new objj_method(sel_getUid("renderPlayerView"), function $RFCard__renderPlayerView(self, _cmd)
{
    self.playerView = ((___r1 = CPBox.isa.objj_msgSend0(CPBox, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, self.card_height - 20, self.playerview_width, self.playerview_height)));
    ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFillColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '2c3e50')));
    ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBorderColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '34495e')));
    self.isa.objj_msgSend1(self, "addSubview:", self.playerView);
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("configureLabel:"), function $RFCard__configureLabel_(self, _cmd, label)
{
    (label == null ? null : label.isa.objj_msgSend0(label, "sizeToFit"));
    (label == null ? null : label.isa.objj_msgSend1(label, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
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
    (rankLabel == null ? null : rankLabel.isa.objj_msgSend1(rankLabel, "setStringValue:", rank + suit));
    (rankLabel == null ? null : rankLabel.isa.objj_msgSend0(rankLabel, "sizeToFit"));
    (rankLabel == null ? null : rankLabel.isa.objj_msgSend1(rankLabel, "setCenter:", CGPointMake(self.card_width / 2, 25)));
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

,["CPArray","CPString"]), new objj_method(sel_getUid("setEmptySeat:"), function $RFCard__setEmptySeat_(self, _cmd, empty)
{
    self.isEmptySeat = empty;
    if (empty == YES)
    {
        if (self.isHeroSeated == NO)
        {
            ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
            ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        }
        else
        {
            ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
            ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        }
        ((___r1 = self.card1View), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.card2View), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    }
    else
    {
        ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.card1View), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.card2View), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
    }
    var ___r1;
}

,["void","BOOL"]), new objj_method(sel_getUid("sitDownClicked:"), function $RFCard__sitDownClicked_(self, _cmd, sender)
{
    ((___r1 = self.controller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sitDown:", self));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("setShowCards:"), function $RFCard__setShowCards_(self, _cmd, shouldShowCards)
{
    self.showCards = shouldShowCards;
    self.isa.objj_msgSend3(self, "hideCard:withCardView:andLabel:", !shouldShowCards, self.card1View, self.card1RankLabel);
    self.isa.objj_msgSend3(self, "hideCard:withCardView:andLabel:", !shouldShowCards, self.card2View, self.card2RankLabel);
}

,["void","BOOL"]), new objj_method(sel_getUid("hideCard:withCardView:andLabel:"), function $RFCard__hideCard_withCardView_andLabel_(self, _cmd, hide, view, label)
{
    if (hide == YES)
    {
        (view == null ? null : view.isa.objj_msgSend1(view, "setBorderColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
        (view == null ? null : view.isa.objj_msgSend1(view, "setFillColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", 'e74c3c')));
        (label == null ? null : label.isa.objj_msgSend1(label, "setHidden:", YES));
    }
    else
    {
        (view == null ? null : view.isa.objj_msgSend1(view, "setFillColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
        (label == null ? null : label.isa.objj_msgSend1(label, "setHidden:", NO));
    }
}

,["void","BOOL","CPView","CPTextField"]), new objj_method(sel_getUid("setHeroSeated:"), function $RFCard__setHeroSeated_(self, _cmd, heroSeated)
{
    self.isHeroSeated = heroSeated;
}

,["void","BOOL"])]);
}
