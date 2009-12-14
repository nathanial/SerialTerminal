//
//  CommunicationController.h
//  SerialTerminal
//
//  Created by Nathanial Hartman on 12/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface CommunicationController : NSViewController {
	IBOutlet NSTextField *command;
	IBOutlet NSTextView *output;
}

@property (retain) NSTextField *command;
@property (retain) NSTextView *output;

-(IBAction)invokeCommand:(id)sender;

@end
