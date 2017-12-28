//
//  NSMutableAttributedString+Utils.h
//  Almaspedia
//
//  Created by OWNER on 08/11/17.
//  Copyright © 2017 OWNER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (Utils)


-(NSMutableAttributedString *)methodChangeFont:(NSString *)font andSize:(CGFloat)size;

-(NSMutableAttributedString *)methodChangeFontColor:(UIColor *)color;

-(NSMutableAttributedString *)methodAddUnderline;
@end
