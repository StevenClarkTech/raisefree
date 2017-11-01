@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;7418;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);
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
