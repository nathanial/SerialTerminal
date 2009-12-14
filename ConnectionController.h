//
//  ConnectionController.h
//  SerialTerminal
//
//  Created by Nathanial Hartman on 12/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CommunicationController.h"


@interface ConnectionController : NSViewController <NSComboBoxDataSource> {
	IBOutlet NSComboBox *port;
	IBOutlet NSComboBox *baud;
	IBOutlet NSComboBox *parity;
	IBOutlet NSComboBox *flow;
}

@property (retain) NSComboBox *port;
@property (retain) NSComboBox *baud;
@property (retain) NSComboBox *parity;
@property (retain) NSComboBox *flow;

-(IBAction) connectSerial:(id)sender;
-(void) selectDefaultOptions;
-(Boolean)validateParameters;

@end
