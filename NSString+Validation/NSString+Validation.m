//
//  NSString+CategoryString.m
//  FixMe
//
//  Created by rishabh shah on 13/04/17.
//  Copyright © 2017 StrateCore Infoways. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

//--------------------------------------------------------------

/**
 This method Use for Check the text is Blank or filled with real charecters
 
 @return if string text is empty then it returns NO otherwise YES
 */
- (BOOL)validateNotEmpty
{
    if ([self isEqual: [NSNull null]]) {
        return NO;
    }else{
        if ([[self cleanString] length]>0) {
            return YES;
        }
        else{
            return NO;
        }
        //    return ([self cleanString].length != 0);
    }
}
/**
 This method Use for Check the text is Blank or filled with real charecters
 
 @return if string text is empty then it returns YES otherwise NO
 */
-(BOOL)validateIsEmpty{
    
    if ([self isEqual: [NSNull null]]) {
        return YES;
    }else{
        if ([[self cleanString] length]>0) {
            return NO;
        }
        else{
            return YES;
        }
    }
    
}

/**
 this method used for check the string text having minimum length
 
 @param length the compare value with minimum length
 
 @return if string having the minimum length return YES or NO
 */
- (BOOL)validateMinimumLength:(NSInteger)length
{
    return ([self length] >= length);
}

/**
 this method used for check the string text having maximum length
 
 @param length the compare value with maximum length
 
 @return if string having the maximum length return YES or NO
 */
- (BOOL)validateMaximumLength:(NSInteger)length
{
    return ([self length] <= length);
}

//--------------------------------------------------------------
- (BOOL)validateMatchesConfirmation:(NSString *)confirmation
{
    return [self isEqualToString:confirmation];
}

//--------------------------------------------------------------
- (BOOL)validateInCharacterSet:(NSMutableCharacterSet *)characterSet
{
    return ([self rangeOfCharacterFromSet:[characterSet invertedSet]].location == NSNotFound);
}

//--------------------------------------------------------------
- (BOOL)validateAlpha
{
    return [self validateInCharacterSet:[[NSCharacterSet letterCharacterSet] mutableCopy]];
}

//--------------------------------------------------------------
- (BOOL)validateAlphanumeric
{
    return [self validateInCharacterSet:[[NSCharacterSet alphanumericCharacterSet] mutableCopy]];
}

//--------------------------------------------------------------
- (BOOL)validateNumeric

{
    return [self validateInCharacterSet:[[NSCharacterSet decimalDigitCharacterSet] mutableCopy]];
}

//--------------------------------------------------------------
- (BOOL)validateAlphaSpace
{
    NSMutableCharacterSet *characterSet = [NSMutableCharacterSet letterCharacterSet];
    [characterSet addCharactersInString:@" "];
    return [self validateInCharacterSet:characterSet];
}

//--------------------------------------------------------------
- (BOOL)validateAlphanumericSpace
{
    NSMutableCharacterSet *characterSet = [NSMutableCharacterSet alphanumericCharacterSet];
    [characterSet addCharactersInString:@" "];
    return [self validateInCharacterSet:characterSet];
}

//--------------------------------------------------------------
// Alphanumeric characters, underscore (_), and period (.)
- (BOOL)validateUsername
{
    NSMutableCharacterSet *characterSet = [NSMutableCharacterSet alphanumericCharacterSet];
    [characterSet addCharactersInString:@"'_."];
    return [self validateInCharacterSet:characterSet];
}

//--------------------------------------------------------------

- (BOOL)validateEmail
{
    NSString *strMyEmail=[self lowercaseString];
    NSString *regex1 = @"\\A[a-z0-9]+([-._][a-z0-9]+)*@([a-z0-9]+(-[a-z0-9]+)*\\.)+[a-z]{2,4}\\z";
    NSPredicate *test1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];
    return [test1 evaluateWithObject:strMyEmail] ;
}

//--------------------------------------------------------------
- (BOOL)validatePhoneNumber
{
    NSMutableCharacterSet *characterSet = [NSMutableCharacterSet decimalDigitCharacterSet];
    [characterSet addCharactersInString:@"'-*+#,;. "];
    return [self validateInCharacterSet:characterSet];
}

//--------------------------------------------------------------

- (BOOL)ValidatePinCode
{
    NSString *pinRegex = @"^[0-9]{6}$";
    NSPredicate *pinTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pinRegex];
    BOOL pinValidates = [pinTest evaluateWithObject:self];
    return pinValidates;
}

//--------------------------------------------------------------
-(NSString *)cleanString{
    NSString *dd =  [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return [NSString stringWithCString:[dd UTF8String ] encoding:NSUTF8StringEncoding];
    
}
//--------------------------------------------------------------
-(BOOL)ValidateName{
    if ([[self cleanString] length]==0) {
        return  NO;
    }else{
        NSString *regex1 = @"[a-zA-z]+([ '-][a-zA-Z]+)*$";
        NSPredicate *Test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];
        return  [Test evaluateWithObject:self];
    }
}
//--------------------------------------------------------------
-(BOOL)validatePassword{
    NSString *stricterFilterString = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [passwordTest evaluateWithObject:self];
    
    /* Show alert: "Password must be minimum 8 characters,
     at least 1 Uppercase Alphabet, 1 Lowercase Alphabet,
     1 Number and 1 Special Character" */
}

/**
 This method use for check Given number is Numeric or not if user added the wrong numeric value then it return false
 
 @param text Given Textvaue
 
 @return if Numeric then return YES or NO
 */
-(BOOL)isNumeric:(NSString*) text{
    return [[NSScanner scannerWithString:text] scanFloat:NULL];
}
@end
