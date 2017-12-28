//
//  NSString+Utils.m
//  BAIS
//
//  Created by OWNER on 14/09/17.
//  Copyright © 2017 OWNER. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)


-(NSString *)utf8encoding{
    
 return [NSString stringWithUTF8String:[[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] cStringUsingEncoding:NSUTF8StringEncoding]];
}

-(NSString *)phonenumber{
    return [self stringByReplacingOccurrencesOfString:@"[^0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [self length])];
}
-(NSString *)removeCharecters:(int)charToRemove{
    if ([self length] > 0) {
       return  [self substringToIndex:[self length] - charToRemove];
    }
    return self;
}
-(NSString *)methodRemoveFractionZeros{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 20;
    NSString *result = [formatter stringFromNumber:[NSNumber numberWithFloat:[self floatValue]]];
    return result;
}
-(NSString *)methodCommaSepratedAmount{
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle]; // this line is important!
    return  [formatter stringFromNumber:[NSNumber numberWithDouble:[self longLongValue]]];

}
-(NSString *)methodRemoveString:(NSString *)string withString:(NSString *)newString{
    return [self stringByReplacingOccurrencesOfString:string withString:newString];
}

@end
