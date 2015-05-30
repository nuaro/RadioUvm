//
//  TwitterController.h
//  TabBarApp
//
//  Created by white hat on 19/06/11.
//  Copyright 2011 utc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TwitterController : UIViewController <UITabBarDelegate,UIWebViewDelegate>{
	IBOutlet UIWebView *TheWebView;
	IBOutlet UIActivityIndicatorView *activity;
	
}

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activity;
@property (nonatomic, retain) IBOutlet UIWebView *TheWebView;

-(IBAction)Refresh:(id)sender;
-(IBAction)Home:(id)sender;

@end
