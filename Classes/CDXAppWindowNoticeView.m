//
//
// CDXAppWindowNoticeView.m
//
//
// Copyright (c) 2009-2010 Arne Harren <ah@0xc0.de>
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

#import "CDXAppWindowNoticeView.h"
#import <QuartzCore/QuartzCore.h>


@implementation CDXAppWindowNoticeView

- (void)dealloc {
    qltrace();
    ivar_release_and_clear(background);
    ivar_release_and_clear(imageView);
    [super dealloc];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (self.superview == nil) {
        return;
    }
    
    CALayer *borderLayer = background.layer;
    borderLayer.borderWidth = 0;
    borderLayer.cornerRadius = 9.0;
}    


- (void)hideAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    CDXAppWindowNoticeView *aNoticeView = (CDXAppWindowNoticeView *)context;
    [aNoticeView removeFromSuperview];
}

- (void)hide:(CDXAppWindowNoticeView *)aNoticeView {
    [UIView beginAnimations:nil context:aNoticeView];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(hideAnimationDidStop:finished:context:)];
    aNoticeView.alpha = 0;
    [UIView commitAnimations];
}

- (void)showImageNamed:(NSString *)name timeInterval:(NSTimeInterval)timeInterval window:(UIWindow *)window {
    [window addSubview:self];
    UIDeviceOrientation orientation = [[CDXAppWindowManager sharedAppWindowManager] deviceOrientation];
    imageView.transform = [CDXAppWindowManager transformForDeviceOrientation:orientation];
    imageView.image = [UIImage imageNamed:name];
    [self performSelector:@selector(hide:) withObject:self afterDelay:timeInterval];
}

@end
