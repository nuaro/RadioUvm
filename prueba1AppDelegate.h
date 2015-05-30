//
//  prueba1AppDelegate.h
//  prueba1
//
//  Created by white hat on 14/06/11.
//  Copyright 2011 utc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class prueba1ViewController;

@interface prueba1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    prueba1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet prueba1ViewController *viewController;

@end

