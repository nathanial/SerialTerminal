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
@synthesize dataBits;
@synthesize stopBits;

-(void)selectDefaultOptions
{
	[port selectItemAtIndex:0];
	[baud selectItemAtIndex:0];
	[parity selectItemAtIndex:0];
	[flow selectItemAtIndex:0];
	[dataBits selectItemAtIndex:0];
	[stopBits selectItemAtIndex:0];
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
			case 0: return @"2400";
			case 1: return @"4800";
			case 2: return @"9600";
			case 3: return @"19200";
			case 4: return @"38400";
			case 5: return @"57600";
			case 6: return @"115200";
		}
	} else if (aComboBox == parity) {
		switch (index) {
			case 0: return @"Even";
			case 1: return @"Odd";
			case 2: return @"None";
		}
	} else if (aComboBox == flow) {
		switch (index) {
			case 0: return @"Xon / Xoff";
			case 1: return @"Hardware";
			case 2: return @"None";
		}
	} else if(aComboBox == dataBits){
		switch(index){
			case 0: return @"8";
			case 1: return @"7";
			case 2: return @"6";
			case 3: return @"5";
		}
	} else if (aComboBox == stopBits) {
		switch(index){
			case 0: return @"1";
			case 1: return @"2";
		}
	}
	return nil;
}

-(NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox
{
	if (aComboBox == port) {
		return 3;
	} else if (aComboBox == baud) {
		return 7;	
	} else if (aComboBox == parity) {
		return 3;
	} else if (aComboBox == flow) {
		return 3;
	} else if (aComboBox == dataBits){
		return 4;
	} else if (aComboBox == stopBits){
		return 2;
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
	NSInteger dataBitsIndex = [dataBits indexOfSelectedItem];
	if(dataBitsIndex < 0){
		NSRunAlertPanel(@"Validation Failed",
						@"You must select the number of Data Bits", 
						@"Ok", nil, nil);
		return NO;
	}
	NSInteger stopBitsIndex = [stopBits indexOfSelectedItem];
	if(stopBitsIndex < 0){
		NSRunAlertPanel(@"Validation Failed",
						@"You must select the number of Stop Bits",
						@"Yes", nil, nil);
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
	[dataBits release];
	[stopBits release];
	[super dealloc];
}

@end
