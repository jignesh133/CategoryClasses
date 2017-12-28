//
//  NSString+Utils.h
//  BAIS
//
//  Created by OWNER on 14/09/17.
//  Copyright © 2017 OWNER. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

-(NSString *)utf8encoding;
-(NSString *)phonenumber;
-(NSString *)removeCharecters:(int)charToRemove;
-(NSString *)methodRemoveFractionZeros;
-(NSString *)methodCommaSepratedAmount;
-(NSString *)methodRemoveString:(NSString *)string withString:(NSString *)newString;
@end
