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
@synthesize communicationController;

-(id)init 
{
	self = [super init];
	NSNotificationCenter *ns = [NSNotificationCenter defaultCenter];
	[ns addObserver:self selector:@selector(openCommunications:) name:@"ConnectSerial" object:nil];
	
	return self;
}

-(void)advanceSplash:(NSTimer *)timer
{
	if([splashProgress doubleValue] < 100){
		[splashProgress incrementBy:1.0];
	}
	else {
		[timer invalidate];
		connectionController = [[ConnectionController alloc] initWithNibName:@"Connection" bundle:nil];
		NSView *v = [connectionController view];
		[self resizeWindow:v];
	}
}

-(void)openCommunications:(NSNotification *)note
{
	communicationController = [[CommunicationController alloc] initWithNibName:@"Communication" bundle:nil];
	NSView *v = [communicationController view];
	[self resizeWindow:v];
}

-(void)resizeWindow:(NSView *)aView
{
	NSSize currentSize = [[window contentView] frame].size;
	NSSize newSize = [aView frame].size;
	float deltaWidth = newSize.width - currentSize.width;
	float deltaHeight = newSize.height - currentSize.height;
	NSRect windowFrame = [window frame];
	windowFrame.size.height += deltaHeight;
	windowFrame.origin.y -= deltaHeight;
	windowFrame.size.width += deltaWidth;
	
	[window setContentView:nil];
	[window setFrame:windowFrame display:YES animate:YES];
	[window setContentView:aView];
}

-(void)dealloc 
{
	[connectionController release];
	[communicationController release];
	[super dealloc];
}

@end
