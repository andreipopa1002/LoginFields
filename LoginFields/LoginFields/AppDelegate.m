//
//  AppDelegate.m
//  LoginFields
//
//  Created by Popa Andrei on 21/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "AppDelegate.h"
#import "LFFlowManager.h"

@interface AppDelegate ()

@property (nonatomic, strong, readwrite) LFFlowManager *flowManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.flowManager = [LFFlowManager new];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = self.flowManager.rootController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
