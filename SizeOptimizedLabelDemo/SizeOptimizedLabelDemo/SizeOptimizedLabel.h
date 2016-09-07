//
//  SizeOptimizedLabel.h
//
//  Created by Muhammad Hamiz Ahmed on 9/7/16.
//  Copyright © 2016 Muhammad Hamiz Ahmed. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface SizeOptimizedLabel : UILabel

@property(nonatomic) IBInspectable NSInteger screenSize;
@property(nonatomic) IBInspectable NSInteger maxFontSize;
@property(nonatomic) IBInspectable NSInteger minFontSize;
@end
