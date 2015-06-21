//
//  LFLoginControllerViewController.m
//  LoginFields
//
//  Created by Popa Andrei on 21/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "LFLoginControllerViewController.h"

@interface LFLoginControllerViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LFLoginControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

# pragma mark - UITextFieldDelegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.emailTextField) {
        [self.passwordTextField becomeFirstResponder];
    } else {
        [self loginButtonTapped:nil];
    }
    return YES;
}


# pragma mark - Internal Methods
- (IBAction)loginButtonTapped:(id)sender {
    NSString *errorMessage = [self errorMessage];
    if (errorMessage.length > 0) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                   message:errorMessage
                                  delegate:nil
                         cancelButtonTitle:@"ok"
                         otherButtonTitles:nil] show];
    } else {
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(userDidEnterEmail:andPassword:)]) {
            [self.delegate userDidEnterEmail:self.emailTextField.text andPassword:self.passwordTextField.text];
        }
    }
}

- (NSString *)errorMessage {
    NSMutableString *errorMessage = [NSMutableString new];
    if ([self stringIsValidEmail:self.emailTextField.text] == NO) {
        [errorMessage appendString:NSLocalizedString(@"Invalid email\n", nil)];
    }
    if ([self isPasswordStringLoggerThan6Chars:self.passwordTextField.text] == NO) {
        [errorMessage appendString:NSLocalizedString(@"Password shortter than 6 chars\n", nil)];
    }
    if ([self isFirstCharacterCapital:self.passwordTextField.text] == NO) {
        [errorMessage appendString:NSLocalizedString(@"Password first char not capital letter\n", nil)];
    }
    if ([self isStringContainingNonAlphaNumericCharacters:self.passwordTextField.text] == NO) {
        [errorMessage appendString:NSLocalizedString(@"Password does not contain non alpha numeric chars\n", nil)];
    }
    if ([self isStringContainingNumericalCharacters:self.passwordTextField.text] == NO) {
        [errorMessage appendString:NSLocalizedString(@"Password does not contain numbers\n", nil)];
    }
    return errorMessage;
}

- (BOOL)stringIsValidEmail:(NSString *)checkString {
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (BOOL)isPasswordStringLoggerThan6Chars:(NSString *)password {
    BOOL result = NO;
    if (password.length >= 6) {
        result = YES;
    }
    return result;
}

- (BOOL)isFirstCharacterCapital:(NSString *)password {
    BOOL result = NO;
    NSString *firstCharacter = [password substringWithRange:NSMakeRange(0, 1)];
    if ([firstCharacter isEqualToString:[firstCharacter capitalizedString]]) {
        result = YES;
    }
    return result;
}

- (BOOL)isStringContainingNonAlphaNumericCharacters:(NSString *)password {
    BOOL result = YES;
    password = [password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([password rangeOfCharacterFromSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]].location == NSNotFound) {
        result = NO;
    }
    return result;
}

- (BOOL)isStringContainingNumericalCharacters:(NSString *)password {
    BOOL result = YES;
    if ([password rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location == NSNotFound) {
        result = NO;
    }
    return result;
}

@end
