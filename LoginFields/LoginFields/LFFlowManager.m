//
//  LFFlowManager.m
//  LoginFields
//
//  Created by Popa Andrei on 21/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "LFFlowManager.h"
#import "LFLoginControllerViewController.h"
#import "LFDetailsViewController.h"

@interface LFFlowManager() <LFLoginControllerDelegate>

@property (nonatomic, strong, readwrite) UINavigationController *rootController;

@end

@implementation LFFlowManager

- (UINavigationController *)rootController {
    if (_rootController == nil) {
        LFLoginControllerViewController *loginViewController = [LFLoginControllerViewController new];
        loginViewController.delegate = self;
        _rootController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    }
    return _rootController;
}

# pragma mark - LFLoginControllerDelegate methods

- (void)userDidEnterEmail:(NSString *)email andPassword:(NSString *)password {
    LFDetailsViewController *detailsViewController = [[LFDetailsViewController alloc] initWithEmail:email andPassword:password];
    [self.rootController pushViewController:detailsViewController animated:YES];
}



@end
