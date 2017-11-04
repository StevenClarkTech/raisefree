@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>

@implementation RFPlayer : CPObject
{
	CPString 		playerName @accessors;
	int 			chipCount @accessors;
	int 			balanceRemaining @accessors; // the amount of $ the player has in the bank
}

- (id)initWithName:(CPString)name andChips:(int)chips{

	self = [super init];

	playerName = name;
	chipCount = chips;

	return self;
}

@end