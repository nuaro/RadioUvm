//
//  TwitterController.m
//  TabBarApp
//
//  Created by white hat on 19/06/11.
//  Copyright 2011 utc. All rights reserved.
//

#import "TwitterController.h"


@implementation TwitterController

@synthesize activity, TheWebView;

-(IBAction)Refresh:(id)sender{
	[TheWebView reload];
}
-(IBAction)Home:(id)sender{
	activity.hidden= FALSE;
	NSURL *url = [NSURL URLWithString:@"http://twitter.com/#!/radiouvm" ];
	NSURLRequest *request = [NSURLRequest requestWithURL:url ];
	[TheWebView loadRequest: request ];
}
-(void)webViewDidStartLoad:(UIWebView *)TheWebView{
	[activity startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)TheWebView{
	activity.hidden= TRUE;
	[activity stopAnimating];
}
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (void)viewDidLoad {
	
	NSURL *url = [NSURL URLWithString:@"http://twitter.com/#!/radiouvm" ];
	//http://search.twitter.com/search?q=&lang=all&rpp=5&ref=RadioUVM
	NSURLRequest *request = [NSURLRequest requestWithURL:url ];
	[TheWebView loadRequest: request ];
	[[self TheWebView] setDelegate: self];
	activity.hidden= FALSE;
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
	
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
