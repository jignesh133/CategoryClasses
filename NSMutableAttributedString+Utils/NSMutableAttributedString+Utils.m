//
//  NSMutableAttributedString+Utils.m
//  Almaspedia
//
//  Created by OWNER on 08/11/17.
//  Copyright © 2017 OWNER. All rights reserved.
//

#import "NSMutableAttributedString+Utils.h"
#import "Global.h"

@implementation NSMutableAttributedString (Utils)

// FOR CHANGE FONT AND SIZE
-(NSMutableAttributedString *)methodChangeFont:(NSString *)fontName andSize:(CGFloat)size{
     [self addAttribute:NSFontAttributeName
                           value:[appDelegate setTheFontForAllScreen:fontName :size]
                           range:NSMakeRange(0,self.length)];
    
    return self;
}
// FOR CHANGE FONT COLOR
-(NSMutableAttributedString *)methodChangeFontColor:(UIColor *)color{
    [self addAttribute:NSForegroundColorAttributeName
                           value:color
                           range:NSMakeRange(0,self.length)];
    
    return self;

}
// FOR CHANGE UNDERLINE
-(NSMutableAttributedString *)methodAddUnderline{
    [self addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [self length])];
    return self;
}
@end
