//
//  LFDetailsViewController.m
//  LoginFields
//
//  Created by Popa Andrei on 21/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "LFDetailsViewController.h"

@interface LFDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;

@property (copy, nonatomic) NSString *emailString;
@property (copy, nonatomic) NSString *passwordString;

@end

@implementation LFDetailsViewController

- (instancetype)initWithEmail:(NSString *)emailString andPassword:(NSString *)passwordString {
    self = [super init];
    if (self) {
        _emailString = emailString;
        _passwordString = passwordString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.emailLabel.text = self.emailString;
    self.passwordLabel.text = self.passwordString;
}

@end
