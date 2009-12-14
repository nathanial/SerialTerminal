//
//  ConnectionController.m
//  SerialTerminal
//
//  Created by Nathanial Hartman on 12/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ConnectionController.h"


@implementation ConnectionController

@synthesize port;
@synthesize baud;
@synthesize parity;
@synthesize flow;

-(void)selectDefaultOptions
{
	[port selectItemAtIndex:0];
	[baud selectItemAtIndex:0];
	[parity selectItemAtIndex:0];
	[flow selectItemAtIndex:0];
}

-(id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index
{
	if (aComboBox == port) {
		switch (index) {
			case 0: return @"COM1";
			case 1: return @"COM2";
			case 2: return @"COM3";
		}
	} else if (aComboBox == baud) {
		switch (index) {
			case 0: return @"9600";
			case 1: return @"2400";
		}

	} else if (aComboBox == parity) {
		switch (index) {
			case 0: return @"1";
			case 1: return @"2";
		}
	} else if (aComboBox == flow) {
		switch (index) {
			case 0: return @"Hardware";
			case 1: return @"Software";
			case 2: return @"None";
		}
	} 
	return nil;
}

-(NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox
{
	if (aComboBox == port) {
		return 3;
	} else if (aComboBox == baud) {
		return 2;	
	} else if (aComboBox == parity) {
		return 2;
	} else if (aComboBox == flow) {
		return 3;
	}
	return 0;
}

-(IBAction)connectSerial:(id)sender
{
	if(![self validateParameters]) return;
	
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	[nc postNotificationName:@"ConnectSerial" object:nil];
}

-(Boolean)validateParameters 
{
	NSInteger portIndex = [port indexOfSelectedItem];
	if(portIndex < 0){
		NSRunAlertPanel(@"Validation Failed",
						@"You must select a Port",
						@"Ok", nil, nil);
		return NO;
	}
	NSInteger baudIndex = [baud indexOfSelectedItem];
	if(baudIndex < 0){
		NSRunAlertPanel(@"Validation Failed",
						@"You must select a Baud",
						@"Ok", nil, nil);
		return NO;
	}
	NSInteger parityIndex = [parity indexOfSelectedItem];
	if(parityIndex < 0){
		NSRunAlertPanel(@"Validation Failed",
						@"You must select a Parity",
						@"Ok", nil, nil);
		return NO;
	}
	NSInteger flowIndex = [flow indexOfSelectedItem];
	if(flowIndex < 0){
		NSRunAlertPanel(@"Validation Failed",
						@"You must select a Flow",
						@"Ok", nil, nil);
		return NO;
	}	
	return YES;
}


-(void)dealloc 
{
	[port release];
	[baud release];
	[parity release];
	[flow release];
	[super dealloc];
}

@end
