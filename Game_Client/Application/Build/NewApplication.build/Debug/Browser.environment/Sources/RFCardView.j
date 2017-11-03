@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;5169;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);
{var the_class = objj_allocateClassPair(CPView, "RFCardView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("cardBox", "CPBox"), new objj_ivar("cardString", "CPString"), new objj_ivar("rankLabel", "CPTextField"), new objj_ivar("suitLabel", "CPTextField"), new objj_ivar("card_width", "float"), new objj_ivar("card_height", "float")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("cardString"), function $RFCardView__cardString(self, _cmd)
{
    return self.cardString;
}

,["CPString"]), new objj_method(sel_getUid("setCardString:"), function $RFCardView__setCardString_(self, _cmd, newValue)
{
    self.cardString = newValue;
}

,["void","CPString"]), new objj_method(sel_getUid("init"), function $RFCardView__init(self, _cmd)
{
    self.card_width = 53;
    self.card_height = 70;
    self = objj_msgSendSuper1({ receiver:self, super_class:objj_getClass("RFCardView").super_class }, "initWithFrame:", CGRectMake(0, 0, self.card_width, self.card_height));
    self.cardBox = ((___r1 = CPBox.isa.objj_msgSend0(CPBox, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, self.card_width, self.card_height)));
    ((___r1 = self.cardBox), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFillColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
    (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.cardBox));
    self.rankLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    ((___r1 = self.rankLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    ((___r1 = self.rankLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    ((___r1 = self.rankLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", CPFont.isa.objj_msgSend2(CPFont, "boldFontWithName:size:", 'Montserrat', 30)));
    ((___r1 = self.cardBox), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self.rankLabel));
    return self;
    var ___r1;
}

,["id"]), new objj_method(sel_getUid("setCardString:"), function $RFCardView__setCardString_(self, _cmd, string)
{
    self.cardString = string;
    self.isa.objj_msgSend3(self, "updateLabelForRankLabel:andCardView:withString:", self.rankLabel, self.cardBox, string);
}

,["void","CPString"]), new objj_method(sel_getUid("updateLabelForRankLabel:andCardView:withString:"), function $RFCardView__updateLabelForRankLabel_andCardView_withString_(self, _cmd, textField, cardView, string)
{
    var components = self.isa.objj_msgSend1(self, "formattedStringFromEncoded:", string);
    var rank = (components == null ? null : components.isa.objj_msgSend1(components, "objectAtIndex:", 0));
    var suit = (components == null ? null : components.isa.objj_msgSend1(components, "objectAtIndex:", 1));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setStringValue:", rank + suit));
    (textField == null ? null : textField.isa.objj_msgSend0(textField, "sizeToFit"));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setCenter:", CGPointMake(self.card_width / 2, 25)));
    if ((suit == null ? null : suit.isa.objj_msgSend1(suit, "isEqualToString:", '♥')) || (suit == null ? null : suit.isa.objj_msgSend1(suit, "isEqualToString:", '♦')))
    {
        (textField == null ? null : textField.isa.objj_msgSend1(textField, "setTextColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", 'c0392b')));
    }
    else
    {
        (textField == null ? null : textField.isa.objj_msgSend1(textField, "setTextColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", '2c3e50')));
    }
}

,["void","CPTextField","CPView","CPString"]), new objj_method(sel_getUid("formattedStringFromEncoded:"), function $RFCardView__formattedStringFromEncoded_(self, _cmd, input)
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
