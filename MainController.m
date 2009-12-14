//
//  MainController.m
//  SerialTerminal
//
//  Created by Nathanial Hartman on 12/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MainController.h"
#import "ConnectionController.h"
#import "CommunicationController.h"


@implementation MainController

@synthesize window;
@synthesize splashProgress;
@synthesize connectionController;

-(void)advanceSplash:(NSTimer *)timer
{
	if([splashProgress doubleValue] < 100){
		[splashProgress incrementBy:1.0];
	}
	else {
		[timer invalidate];
		connectionController = [[ConnectionController alloc] initWithNibName:@"Connection" bundle:nil];
		NSView *v = [connectionController view];
		NSSize currentSize = [[window contentView] frame].size;
		NSSize newSize = [v frame].size;
		float deltaWidth = newSize.width - currentSize.width;
		float deltaHeight = newSize.height - currentSize.height;
		NSRect windowFrame = [window frame];
		windowFrame.size.height += deltaHeight;
		windowFrame.origin.y -= deltaHeight;
		windowFrame.size.width += deltaWidth;
		
		[window setContentView:nil];
		[window setFrame:windowFrame display:YES animate:YES];
		[window setContentView:v];
	}
}

-(void)dealloc 
{
	[connectionController release];
	[super dealloc];
}

@end
