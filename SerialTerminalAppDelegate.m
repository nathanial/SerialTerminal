//
//  SerialTerminalAppDelegate.m
//  SerialTerminal
//
//  Created by Nathanial Hartman on 12/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SerialTerminalAppDelegate.h"

@implementation SerialTerminalAppDelegate

@synthesize window;
@synthesize mainController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[NSTimer scheduledTimerWithTimeInterval:0.02 target:mainController 
								   selector:@selector(advanceSplash:) 
								   userInfo:nil repeats:YES];
}

@end
