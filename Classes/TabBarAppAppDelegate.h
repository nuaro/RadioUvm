//
//  TabBarAppAppDelegate.h
//  TabBarApp
//
//  Created by white hat on 19/06/11.
//  Copyright 2011 utc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarAppAppDelegate : NSObject <UIApplicationDelegate,UITabBarDelegate> {
    UIWindow *window;
	IBOutlet UITabBarController *TabBarController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *TabBarController;

@end

