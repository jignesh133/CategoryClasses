//
//  NSString+CategoryString.h
//  FixMe
//
//  Created by rishabh shah on 13/04/17.
//  Copyright © 2017 StrateCore Infoways. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)

- (BOOL)validateNotEmpty;
- (BOOL)validateIsEmpty;

- (BOOL)validateMinimumLength:(NSInteger)length;
- (BOOL)validateMaximumLength:(NSInteger)length;

- (BOOL)validateMatchesConfirmation:(NSString *)confirmation;
- (BOOL)validateInCharacterSet:(NSMutableCharacterSet *)characterSet;

- (BOOL)validateAlpha;
- (BOOL)validateAlphanumeric;
- (BOOL)validateNumeric;
- (BOOL)validateAlphaSpace;
- (BOOL)validateAlphanumericSpace;

- (BOOL)validateUsername;
- (BOOL)validateEmail;
- (BOOL)validatePhoneNumber;
- (BOOL)ValidatePinCode;

- (BOOL)ValidateName;
- (BOOL)validatePassword;

-(NSString *)cleanString;

-(BOOL)isNumeric:(NSString*) text;

@end
