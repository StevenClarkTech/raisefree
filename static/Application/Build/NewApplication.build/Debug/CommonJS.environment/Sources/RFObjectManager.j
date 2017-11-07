@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;10;RFPlayer.jt;2440;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("RFPlayer.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "RFObjectManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("playerDictionary", "CPDictionary")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("playerDictionary"), function $RFObjectManager__playerDictionary(self, _cmd)
{
    return self.playerDictionary;
}

,["CPDictionary"]), new objj_method(sel_getUid("setPlayerDictionary:"), function $RFObjectManager__setPlayerDictionary_(self, _cmd, newValue)
{
    self.playerDictionary = newValue;
}

,["void","CPDictionary"]), new objj_method(sel_getUid("init"), function $RFObjectManager__init(self, _cmd)
{
    self = objj_msgSendSuper0({ receiver:self, super_class:objj_getClass("RFObjectManager").super_class }, "init");
    self.playerDictionary = (___r1 = CPDictionary.isa.objj_msgSend0(CPDictionary, "alloc"), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithObjects:forKeys:", [CPNull.isa.objj_msgSend0(CPNull, "null"), CPNull.isa.objj_msgSend0(CPNull, "null"), CPNull.isa.objj_msgSend0(CPNull, "null"), CPNull.isa.objj_msgSend0(CPNull, "null"), CPNull.isa.objj_msgSend0(CPNull, "null"), CPNull.isa.objj_msgSend0(CPNull, "null")], ["seat1", "seat2", "seat3", "seat4", "seat5", "seat6"]));
    return self;
    var ___r1;
}

,["id"]), new objj_method(sel_getUid("initWithFakeData"), function $RFObjectManager__initWithFakeData(self, _cmd)
{
    self = objj_msgSendSuper0({ receiver:self, super_class:objj_getClass("RFObjectManager").super_class }, "init");
    self.playerDictionary = (___r1 = CPDictionary.isa.objj_msgSend0(CPDictionary, "alloc"), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithObjects:forKeys:", [((___r2 = RFPlayer.isa.objj_msgSend0(RFPlayer, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "initWithName:andChips:", "Jake", 3183)), CPNull.isa.objj_msgSend0(CPNull, "null"), ((___r2 = RFPlayer.isa.objj_msgSend0(RFPlayer, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "initWithName:andChips:", "Anthony", 1337)), CPNull.isa.objj_msgSend0(CPNull, "null"), CPNull.isa.objj_msgSend0(CPNull, "null"), CPNull.isa.objj_msgSend0(CPNull, "null")], ["seat1", "seat2", "seat3", "seat4", "seat5", "seat6"]));
    return self;
    var ___r1, ___r2;
}

,["id"])]);
}
