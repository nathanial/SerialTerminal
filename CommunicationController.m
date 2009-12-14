//
//  CommunicationController.m
//  SerialTerminal
//
//  Created by Nathanial Hartman on 12/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CommunicationController.h"


@implementation CommunicationController

@synthesize command;
@synthesize output;

-(IBAction)invokeCommand:(id)sender
{
	NSString *commandString = [command stringValue];
	commandString = [commandString stringByAppendingString:@"\n"];
    [output replaceCharactersInRange: NSMakeRange ([[output string] length], 0)
						  withString: commandString];
	[output scrollRangeToVisible: NSMakeRange([[output string] length], 0)];
	[command setStringValue:@""];
}

-(void)dealloc 
{
	[command release];
	[output release];
	[super dealloc];
}

@end
