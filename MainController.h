//
//  MainController.h
//  SerialTerminal
//
//  Created by Nathanial Hartman on 12/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ConnectionController.h"
#import "CommunicationController.h"


@interface MainController : NSObject {
	IBOutlet NSWindow *window;
	IBOutlet NSProgressIndicator *splashProgress;
	ConnectionController *connectionController;
}

@property (retain) NSWindow *window;
@property (retain) NSProgressIndicator *splashProgress;
@property (retain) ConnectionController *connectionController;

-(void)advanceSplash:(NSTimer *)timer;

@end
