@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>

@implementation RFConsoleView : CPView
{
	CPSlider slider;
}

- (id)initWithFrame:(CGRect)frame
{


    self = [super initWithFrame:frame];
    [self setBackgroundColor:[[CPColor whiteColor] colorWithAlphaComponent: .08]] ;

    slider = [[CPSlider alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame)-200,0,200,50)];
        [slider setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];

   [self addSubview:slider];
   [slider setValue:20 forThemeAttribute:@"track-width"];
      [slider setValue:CGSizeMake(50,50) forThemeAttribute:@"knob-size"];

   //[slider setValue:[CPColor blackColor] forThemeAttribute:@"knob-color"];
      //[slider setSliderType:CPLinearSlider];

    return self;
}

@end