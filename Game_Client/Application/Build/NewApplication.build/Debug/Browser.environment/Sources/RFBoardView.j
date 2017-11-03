@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;12;RFCardView.jt;3472;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("RFCardView.j", YES);
{var the_class = objj_allocateClassPair(CPView, "RFBoardView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("boardArray", "CPArray"), new objj_ivar("arrayOfCards", "CPArray"), new objj_ivar("board_width", "float"), new objj_ivar("board_height", "float"), new objj_ivar("card_spacing", "float")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("boardArray"), function $RFBoardView__boardArray(self, _cmd)
{
    return self.boardArray;
}

,["CPArray"]), new objj_method(sel_getUid("setBoardArray:"), function $RFBoardView__setBoardArray_(self, _cmd, newValue)
{
    self.boardArray = newValue;
}

,["void","CPArray"]), new objj_method(sel_getUid("init"), function $RFBoardView__init(self, _cmd)
{
    self.card_spacing = 10;
    self.board_width = 53 * 5 + 5 * self.card_spacing;
    self.board_height = 70;
    self = objj_msgSendSuper1({ receiver:self, super_class:objj_getClass("RFBoardView").super_class }, "initWithFrame:", CGRectMake(0, 0, self.board_width, self.board_height));
    self.arrayOfCards = ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return self;
    var ___r1;
}

,["id"]), new objj_method(sel_getUid("setBoardArray:"), function $RFBoardView__setBoardArray_(self, _cmd, array)
{
    self.arrayOfCards = ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    self.boardArray = array;
    var ___r1;
}

,["void","CPArray"]), new objj_method(sel_getUid("reset"), function $RFBoardView__reset(self, _cmd)
{
    self.arrayOfCards.forEach(    function(card)
    {
        (card == null ? null : card.isa.objj_msgSend0(card, "removeFromSuperview"));
    });
}

,["void"]), new objj_method(sel_getUid("dealCardAtIndex:"), function $RFBoardView__dealCardAtIndex_(self, _cmd, i)
{
    var card = ((___r1 = RFCardView.isa.objj_msgSend0(RFCardView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var card_width = CGRectGetWidth((card == null ? null : card.isa.objj_msgSend0(card, "frame")));
    (card == null ? null : card.isa.objj_msgSend1(card, "setCardString:", ((___r1 = self.boardArray), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i))));
    self.isa.objj_msgSend1(self, "addSubview:", card);
    ((___r1 = self.arrayOfCards), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", card));
    (card == null ? null : card.isa.objj_msgSend1(card, "setCenter:", CGPointMake(card_width * (i + 1) + (i - 2) * self.card_spacing, (card == null ? null : card.isa.objj_msgSend0(card, "center")).y)));
    var ___r1;
}

,["void","int"]), new objj_method(sel_getUid("dealFlop"), function $RFBoardView__dealFlop(self, _cmd)
{
    self.arrayOfCards.forEach(    function(card)
    {
        CPLog(card);
    });
    for (var i = 0; i <= 2; i++)
    {
        self.isa.objj_msgSend1(self, "dealCardAtIndex:", i);
    }
}

,["void"]), new objj_method(sel_getUid("dealTurn"), function $RFBoardView__dealTurn(self, _cmd)
{
    self.isa.objj_msgSend1(self, "dealCardAtIndex:", 3);
}

,["void"]), new objj_method(sel_getUid("dealRiver"), function $RFBoardView__dealRiver(self, _cmd)
{
    self.isa.objj_msgSend1(self, "dealCardAtIndex:", 4);
}

,["void"])]);
}
