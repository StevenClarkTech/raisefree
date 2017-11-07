@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>
@import "RFPlayer.j"

@implementation RFObjectManager : CPObject
{
	CPDictionary playerDictionary @accessors(getter=playerDictionary);
}

- (id)init
{

    self = [super init];

    playerDictionary = @{
		@"seat1": [CPNull null],
		@"seat2": [CPNull null],
		@"seat3": [CPNull null],
		@"seat4": [CPNull null],
		@"seat5": [CPNull null],
		@"seat6": [CPNull null]
    };

    return self;
}

- (id)initWithFakeData
{

    self = [super init];

    playerDictionary = @{
		@"seat1": [[RFPlayer alloc] initWithName:@"Jake" andChips:3183],
		@"seat2": [CPNull null],
		@"seat3": [[RFPlayer alloc] initWithName:@"Anthony" andChips:1337],
		@"seat4": [CPNull null],
		@"seat5": [CPNull null],
		@"seat6": [[RFPlayer alloc] initWithName:@"Steven" andChips:569],
    };

    return self;
}

- (RFPlayer)hero{
	return [[RFPlayer alloc] initWithName:@"Hero" andChips:1000];
}

@end