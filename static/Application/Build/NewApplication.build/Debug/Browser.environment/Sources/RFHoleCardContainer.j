@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;12;RFCardView.jt;17196;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("RFCardView.j", YES);
{var the_class = objj_allocateClassPair(CPView, "RFHoleCardContainer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("cardView1", "RFCardView"), new objj_ivar("cardView2", "RFCardView"), new objj_ivar("card1String", "CPString"), new objj_ivar("card2String", "CPString"), new objj_ivar("playerString", "CPString"), new objj_ivar("playerLabel", "CPTextField"), new objj_ivar("chipCount", "int"), new objj_ivar("chipCountLabel", "CPTextField"), new objj_ivar("seatButton", "CPButton"), new objj_ivar("playerView", "CPBox"), new objj_ivar("isHeroSeated", "BOOL"), new objj_ivar("showCards", "BOOL"), new objj_ivar("isEmptySeat", "BOOL"), new objj_ivar("hasCards", "BOOL"), new objj_ivar("controller", "AppController"), new objj_ivar("seatNumber", "int"), new objj_ivar("card_width", "float"), new objj_ivar("card_height", "float"), new objj_ivar("card_spacing", "float"), new objj_ivar("playerview_width", "float"), new objj_ivar("playerview_height", "float")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("playerString"), function $RFHoleCardContainer__playerString(self, _cmd)
{
    return self.playerString;
}

,["CPString"]), new objj_method(sel_getUid("setPlayerString:"), function $RFHoleCardContainer__setPlayerString_(self, _cmd, newValue)
{
    self.playerString = newValue;
}

,["void","CPString"]), new objj_method(sel_getUid("chipCount"), function $RFHoleCardContainer__chipCount(self, _cmd)
{
    return self.chipCount;
}

,["int"]), new objj_method(sel_getUid("setChipCount:"), function $RFHoleCardContainer__setChipCount_(self, _cmd, newValue)
{
    self.chipCount = newValue;
}

,["void","int"]), new objj_method(sel_getUid("isHeroSeated"), function $RFHoleCardContainer__isHeroSeated(self, _cmd)
{
    return self.isHeroSeated;
}

,["BOOL"]), new objj_method(sel_getUid("setHeroSeated:"), function $RFHoleCardContainer__setHeroSeated_(self, _cmd, newValue)
{
    self.isHeroSeated = newValue;
}

,["void","BOOL"]), new objj_method(sel_getUid("isEmptySeat"), function $RFHoleCardContainer__isEmptySeat(self, _cmd)
{
    return self.isEmptySeat;
}

,["BOOL"]), new objj_method(sel_getUid("setEmptySeat:"), function $RFHoleCardContainer__setEmptySeat_(self, _cmd, newValue)
{
    self.isEmptySeat = newValue;
}

,["void","BOOL"]), new objj_method(sel_getUid("controller"), function $RFHoleCardContainer__controller(self, _cmd)
{
    return self.controller;
}

,["AppController"]), new objj_method(sel_getUid("setController:"), function $RFHoleCardContainer__setController_(self, _cmd, newValue)
{
    self.controller = newValue;
}

,["void","AppController"]), new objj_method(sel_getUid("seatNumber"), function $RFHoleCardContainer__seatNumber(self, _cmd)
{
    return self.seatNumber;
}

,["int"]), new objj_method(sel_getUid("setSeatNumber:"), function $RFHoleCardContainer__setSeatNumber_(self, _cmd, newValue)
{
    self.seatNumber = newValue;
}

,["void","int"]), new objj_method(sel_getUid("init"), function $RFHoleCardContainer__init(self, _cmd)
{
    self.playerview_width = 150;
    self.playerview_height = 55;
    self.card_width = CGRectGetWidth(((___r1 = ((___r2 = RFCardView.isa.objj_msgSend0(RFCardView, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "init"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")));
    self.card_height = CGRectGetHeight(((___r1 = ((___r2 = RFCardView.isa.objj_msgSend0(RFCardView, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "init"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")));
    self.card_spacing = 5;
    self = objj_msgSendSuper1({ receiver:self, super_class:objj_getClass("RFHoleCardContainer").super_class }, "initWithFrame:", CGRectMake(0, 0, self.playerview_width, self.card_height + 40));
    self.cardView1 = ((___r1 = RFCardView.isa.objj_msgSend0(RFCardView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    ((___r1 = self.cardView1), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", CGPointMake(self.playerview_width / 2 - self.card_spacing / 2 - self.card_width / 2, ((___r2 = self.cardView1), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "center")).y)));
    (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.cardView1));
    self.cardView2 = ((___r1 = RFCardView.isa.objj_msgSend0(RFCardView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    ((___r1 = self.cardView2), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", CGPointMake(self.playerview_width / 2 + self.card_spacing / 2 + self.card_width / 2, ((___r2 = self.cardView1), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "center")).y)));
    (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.cardView2));
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

,["id"]), new objj_method(sel_getUid("renderPlayerView"), function $RFHoleCardContainer__renderPlayerView(self, _cmd)
{
    self.playerView = ((___r1 = CPBox.isa.objj_msgSend0(CPBox, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, self.card_height - 20, self.playerview_width, self.playerview_height)));
    ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFillColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '2c3e50')));
    ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBorderColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '34495e')));
    var font_size = 13;
    self.playerLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    ((___r1 = self.playerLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    ((___r1 = self.playerLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", CPFont.isa.objj_msgSend2(CPFont, "fontWithName:size:", 'Montserrat', font_size)));
    ((___r1 = self.playerLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 1, .7)));
    ((___r1 = self.playerLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    ((___r1 = self.playerLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", CGPointMake(self.playerview_width / 2, ((___r2 = self.playerLabel), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "center")).y + 5)));
    ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self.playerLabel));
    self.chipCountLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    ((___r1 = self.chipCountLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    ((___r1 = self.chipCountLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", CPFont.isa.objj_msgSend2(CPFont, "fontWithName:size:", 'Montserrat', font_size)));
    ((___r1 = self.chipCountLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", 'f1c40f')));
    ((___r1 = self.chipCountLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    ((___r1 = self.chipCountLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", CGPointMake(self.playerview_width / 2, self.playerview_height - 15)));
    ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self.chipCountLabel));
    var seperator = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, self.playerview_width - 50, 2)));
    (seperator == null ? null : seperator.isa.objj_msgSend1(seperator, "setBackgroundColor:", CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 1, .1)));
    (seperator == null ? null : seperator.isa.objj_msgSend1(seperator, "setCenter:", CGPointMake(self.playerview_width / 2, self.playerview_height / 2)));
    ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", seperator));
    self.isa.objj_msgSend1(self, "addSubview:", self.playerView);
    var ___r1, ___r2;
}

,["void"]), new objj_method(sel_getUid("setPlayerString:"), function $RFHoleCardContainer__setPlayerString_(self, _cmd, string)
{
    self.playerString = string;
    ((___r1 = self.playerLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", string));
    ((___r1 = self.playerLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    ((___r1 = self.playerLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", CGPointMake(self.playerview_width / 2, ((___r2 = self.playerLabel), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "center")).y)));
    var ___r1, ___r2;
}

,["void","CPString"]), new objj_method(sel_getUid("setChipCount:"), function $RFHoleCardContainer__setChipCount_(self, _cmd, count)
{
    self.chipCount = count;
    ((___r1 = self.chipCountLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "$" + count));
    ((___r1 = self.chipCountLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    ((___r1 = self.chipCountLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", CGPointMake(self.playerview_width / 2, self.playerview_height - 15)));
    var ___r1;
}

,["void","int"]), new objj_method(sel_getUid("setCard1String:"), function $RFHoleCardContainer__setCard1String_(self, _cmd, value)
{
    self.card1String = value;
    ((___r1 = self.cardView1), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCardString:", value));
    var ___r1;
}

,["void","CPString"]), new objj_method(sel_getUid("setCard2String:"), function $RFHoleCardContainer__setCard2String_(self, _cmd, value)
{
    self.card2String = value;
    ((___r1 = self.cardView2), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCardString:", value));
    var ___r1;
}

,["void","CPString"]), new objj_method(sel_getUid("setEmptySeat:"), function $RFHoleCardContainer__setEmptySeat_(self, _cmd, empty)
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
        ((___r1 = self.cardView1), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.cardView2), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    }
    else
    {
        ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.cardView1), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.cardView2), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
    }
    var ___r1;
}

,["void","BOOL"]), new objj_method(sel_getUid("sitDownClicked:"), function $RFHoleCardContainer__sitDownClicked_(self, _cmd, sender)
{
    ((___r1 = self.controller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sitDown:", self));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("setShowCards:"), function $RFHoleCardContainer__setShowCards_(self, _cmd, shouldShowCards)
{
    self.showCards = shouldShowCards;
    self.isa.objj_msgSend2(self, "hideCard:withCardView:", !shouldShowCards, self.cardView1);
    self.isa.objj_msgSend2(self, "hideCard:withCardView:", !shouldShowCards, self.cardView2);
}

,["void","BOOL"]), new objj_method(sel_getUid("hideCard:withCardView:"), function $RFHoleCardContainer__hideCard_withCardView_(self, _cmd, hide, view)
{
    if (hide == YES)
    {
        ((___r1 = view.cardBox), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBorderColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
        ((___r1 = view.cardBox), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFillColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", 'e74c3c')));
        ((___r1 = view.rankLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    }
    else
    {
        ((___r1 = view.cardBox), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFillColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
        ((___r1 = view.rankLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
    }
    var ___r1;
}

,["void","BOOL","RFCardView"]), new objj_method(sel_getUid("setHeroSeated:"), function $RFHoleCardContainer__setHeroSeated_(self, _cmd, heroSeated)
{
    self.isHeroSeated = heroSeated;
    if (self.isEmptySeat == YES)
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
        ((___r1 = self.cardView1), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.cardView2), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    }
    else
    {
        ((___r1 = self.seatButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.playerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.cardView1), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.cardView2), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
    }
    var ___r1;
}

,["void","BOOL"])]);
}
