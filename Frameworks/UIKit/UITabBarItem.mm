//******************************************************************************
//
// Copyright (c) 2015 Microsoft Corporation. All rights reserved.
//
// This code is licensed under the MIT License (MIT).
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//******************************************************************************

#include "Starboard.h"
#include "UIKit/UIView.h"
#include "UIKit/UITabBar.h"
#include "UIBarItemInternal.h"
#include "LoggingNative.h"

static const wchar_t* TAG = L"UITabBarItem";

@implementation UITabBarItem {
    idretaintype(NSString) _title, _badgeValue;
}

- (NSObject*)initWithCoder:(NSCoder*)coder {
    _title = [coder decodeObjectForKey:@"UITitle"];
    _tag = [coder decodeIntegerForKey:@"UITag"];
    _image = [coder decodeObjectForKey:@"UIImage"];

    if ([coder containsValueForKey:@"UIEnabled"]) {
        _enabled = [coder decodeIntegerForKey:@"UIEnabled"];
        //_enabled = true;
    } else {
        _enabled = true;
    }

    if ([coder containsValueForKey:@"UISystemItem"]) {
        int val = [coder decodeIntegerForKey:@"UISystemItem"];
        if (val == 0) {
            _title = @"More";
            _image = [UIImage imageNamed:@"/img/more.png"];
        }
    }
    return self;
}

/**
 @Status Interoperable
*/
- (UITabBarItem*)initWithTitle:(NSString*)title image:(UIImage*)image tag:(NSInteger)tag {
    _title.attach([title copy]);
    _tag = tag;
    _image = image;
    _enabled = TRUE;

    return self;
}

/**
 @Status Stub
*/
- (UITabBarItem*)initWithTabBarSystemItem:(UITabBarSystemItem)sysItem tag:(NSInteger)tag {
    UNIMPLEMENTED();
    _title = @"Sys";
    _tag = tag;
    _enabled = TRUE;

    return self;
}

- (void)setTitle:(NSString*)newTitle {
    _title.attach([newTitle copy]);
}

/**
 @Status Stub
*/
- (void)setBadgeValue:(NSString*)badgeValue {
    UNIMPLEMENTED();
    _badgeValue = badgeValue;
}

/**
 @Status Stub
*/
- (NSString*)badgeValue {
    UNIMPLEMENTED();
    return _badgeValue;
}

- (void)setImage:(UIImage*)newImage {
    _image = newImage;
}

/**
 @Status Stub
*/
- (void)setFinishedSelectedImage:(UIImage*)finishedSelected withFinishedUnselectedImage:(UIImage*)unselected {
    UNIMPLEMENTED();
    _image = finishedSelected;
    TraceVerbose(TAG, L"setFinishedSelectedImage not supported");
}

- (void)setTitleTextAttributes:(NSObject*)attributes forState:(NSUInteger)state {
    TraceVerbose(TAG, L"setTitleTextAttributes not supported");
}

- (void)setTitlePositionAdjustment:(CGPoint)adjustment {
    TraceVerbose(TAG, L"setTitlePositionAdjustment not supported");
}

- (void)setAccessibilityLabel:(NSString*)label {
    TraceVerbose(TAG, L"setAccessibilityLabel not supported");
}

- (void)setImageInsets:(UIEdgeInsets)insets {
    TraceVerbose(TAG, L"setImageInsets not supported");
}

- (void)setEnabled:(BOOL)enabled {
    _enabled = enabled;
}

- (BOOL)enabled {
    return _enabled;
}

- (NSString*)title {
    return _title;
}

- (NSInteger)tag {
    return _tag;
}

- (void)setTag:(NSInteger)tag {
    _tag = tag;
}

- (UIImage*)image {
    return _image;
}

- (void)dealloc {
    _title = nil;
    _image = nil;
    _badgeValue = nil;

    [super dealloc];
}

+ (id)appearance {
    return [UIAppearanceSetter appearanceWhenContainedIn:nil forUIClass:self];
}

+ (id)appearanceWhenContainedIn:(id)containedClass, ... {
    id curClass = [self class];

    va_list pReader;
    va_start(pReader, containedClass);

    id curVal = va_arg(pReader, id);

    while (curVal != nil) {
        assert(0);
        curVal = va_arg(pReader, id);
    }

    va_end(pReader);

    return [UIAppearanceSetter appearanceWhenContainedIn:containedClass forUIClass:self];
}
@end
