//
//  SerialTerminalAppDelegate.h
//  SerialTerminal
//
//  Created by Nathanial Hartman on 12/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainController.h"

@interface SerialTerminalAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	IBOutlet MainController *mainController;
}

@property (assign) IBOutlet NSWindow *window;
@property (retain) MainController *mainController;

@end
