//
//
// CDXSettingsViewTableCell.m
//
//
// Copyright (c) 2009 Arne Harren <ah@0xc0.de>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "CDXSettingsViewTableCell.h"
#import "CDXSettings.h"


@implementation CDXSettingsViewTableCell

#define LogFileComponent lcl_cCDXSettingsViewController

@synthesize label = _label;
@synthesize swtch = _swtch;

@synthesize key = _key;

- (id)init {
    LogInvocation();
    
    if ((self = [super init])) {
        // nothing to do
    }
    return self;
}

- (void) dealloc {
    LogInvocation();
    
    self.label = nil;
    self.swtch = nil;
    
    [super dealloc];
}

- (IBAction)swtchValueChanged {
    LogInvocation();
    
    [CDXSettings setBool:_swtch.on forKey:_key];
}

- (void)configureWithKey:(CDXSettingsKey)key {
    LogInvocation();
    
    self.key = key;
    
    self.label.text = [CDXSettings labelForKey:key];
    _swtch.on = [CDXSettings boolForKey:key];
}

@end

