@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;1630;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "RFPlayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("playerName", "CPString"), new objj_ivar("chipCount", "int"), new objj_ivar("balanceRemaining", "int")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("playerName"), function $RFPlayer__playerName(self, _cmd)
{
    return self.playerName;
}

,["CPString"]), new objj_method(sel_getUid("setPlayerName:"), function $RFPlayer__setPlayerName_(self, _cmd, newValue)
{
    self.playerName = newValue;
}

,["void","CPString"]), new objj_method(sel_getUid("chipCount"), function $RFPlayer__chipCount(self, _cmd)
{
    return self.chipCount;
}

,["int"]), new objj_method(sel_getUid("setChipCount:"), function $RFPlayer__setChipCount_(self, _cmd, newValue)
{
    self.chipCount = newValue;
}

,["void","int"]), new objj_method(sel_getUid("balanceRemaining"), function $RFPlayer__balanceRemaining(self, _cmd)
{
    return self.balanceRemaining;
}

,["int"]), new objj_method(sel_getUid("setBalanceRemaining:"), function $RFPlayer__setBalanceRemaining_(self, _cmd, newValue)
{
    self.balanceRemaining = newValue;
}

,["void","int"]), new objj_method(sel_getUid("initWithName:andChips:"), function $RFPlayer__initWithName_andChips_(self, _cmd, name, chips)
{
    self = objj_msgSendSuper0({ receiver:self, super_class:objj_getClass("RFPlayer").super_class }, "init");
    self.playerName = name;
    self.chipCount = chips;
    return self;
}

,["id","CPString","int"])]);
}
