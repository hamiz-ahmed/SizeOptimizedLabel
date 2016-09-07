//
//  SizeOptimizedLabel.m
//
//  Created by Muhammad Hamiz Ahmed on 9/7/16.
//  Copyright © 2016 Muhammad Hamiz Ahmed. All rights reserved.
//

#import "SizeOptimizedLabel.h"

#define WIDTH_3_5_INCH 320
#define WIDTH_4_INCH   320
#define WIDTH_4_7_INCH 375
#define WIDTH_5_5_INCH 414

typedef NS_ENUM(NSUInteger, ScreenSize) {
    ScreenSizeUnknown = 0,
    ScreenSize3_5inch = 1,
    ScreenSize4inch   = 2,
    ScreenSize4_7inch = 3,
    ScreenSize5_5inch = 4
};

@implementation SizeOptimizedLabel

- (void) awakeFromNib {
    [super awakeFromNib];
    [self adjustFontSizeWRTScreen];
}


#pragma mark - Adjustable font label Methods

- (void)adjustFontSizeWRTScreen {
    CGFloat fontSize = [self getFontSizeWRTScreen];
    [self setFont:[UIFont fontWithName:self.font.fontName size:fontSize]];
}

- (CGFloat)getFontSizeWRTScreen {
    CGFloat ratio = [self getFontRatio:self.screenSize];
    CGFloat calculatedFontSize = round(CGRectGetWidth([UIScreen mainScreen].bounds) * ratio);
    
    if (calculatedFontSize>_maxFontSize &&_maxFontSize!=0)
        return _maxFontSize;
    
    if (calculatedFontSize<_minFontSize &&_minFontSize!=0)
        return _minFontSize;
    
    return calculatedFontSize;
}

- (CGFloat)getFontRatio:(NSInteger)size {
   NSArray *screenWidths = @[[NSNumber numberWithInteger:CGRectGetWidth([UIScreen mainScreen].bounds)],
                             [NSNumber numberWithInteger:WIDTH_3_5_INCH],
                             [NSNumber numberWithInteger:WIDTH_4_INCH],
                             [NSNumber numberWithInteger:WIDTH_4_7_INCH],
                             [NSNumber numberWithInteger:WIDTH_5_5_INCH]];
    
    NSNumber *width = screenWidths[size];
    
    CGFloat ratio = self.font.pointSize/[width floatValue];
    return ratio;
}

@end
