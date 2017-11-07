@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;1592;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);
{var the_class = objj_allocateClassPair(CPView, "RFConsoleView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("slider", "CPSlider")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $RFConsoleView__initWithFrame_(self, _cmd, frame)
{
    self = objj_msgSendSuper1({ receiver:self, super_class:objj_getClass("RFConsoleView").super_class }, "initWithFrame:", frame);
    (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColor:", ((___r1 = CPColor.isa.objj_msgSend0(CPColor, "whiteColor")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "colorWithAlphaComponent:", .08))));
    self.slider = ((___r1 = CPSlider.isa.objj_msgSend0(CPSlider, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(CGRectGetWidth(frame) - 200, 0, 200, 50)));
    ((___r1 = self.slider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
    (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.slider));
    ((___r1 = self.slider), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forThemeAttribute:", 20, "track-width"));
    ((___r1 = self.slider), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forThemeAttribute:", CGSizeMake(50, 50), "knob-size"));
    return self;
    var ___r1;
}

,["id","CGRect"])]);
}
