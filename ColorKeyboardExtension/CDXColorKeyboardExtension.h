//
//
// CDXColorKeyboardExtension.h
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

#import "CDXKeyboardExtensions.h"
#import "CDXColorKeyboardExtensionViewController.h"


// A protocol for a responder which supports the color keyboard extension.
@protocol CDXColorKeyboardExtensionProtocol

@required

- (CDXColor *)textCDXColor;
- (void)setTextCDXColor:(CDXColor *)color;

- (CDXColor *)backgroundCDXColor;
- (void)setBackgroundCDXColor:(CDXColor *)color;

@end


// A keyboard extension which shows a color chooser.
@interface CDXColorKeyboardExtension : NSObject <CDXKeyboardExtension> {
    
@protected
    CDXColorKeyboardExtensionViewController *_viewController;
    
}

@property (nonatomic, retain) IBOutlet CDXColorKeyboardExtensionViewController *viewController;

- (void)extensionInitialize;

- (NSString *)extensionTitle;
- (UIView *)extensionView;

- (void)extensionWillBecomeActive;
- (void)extensionDidBecomeActive;
- (void)extensionWillBecomeInactive;
- (void)extensionDidBecomeInactive;

+ (CDXColorKeyboardExtension *)sharedInstance;

@end

