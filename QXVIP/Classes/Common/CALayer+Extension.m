//
//  CALayer+Extension.m
//  QXMember
//
//  Created by iMac on 2020/9/3.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "CALayer+Extension.h"

@implementation CALayer (Extension)
- (void)setBorderColorFromUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}
@end
