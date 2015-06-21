//
//  LFLoginControllerViewController.h
//  LoginFields
//
//  Created by Popa Andrei on 21/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LFLoginControllerDelegate <NSObject>

- (void)userDidEnterEmail:(NSString *)email andPassword:(NSString *)password;

@end

@interface LFLoginControllerViewController : UIViewController

@property (nonatomic, weak, readwrite) id<LFLoginControllerDelegate> delegate;

@end
