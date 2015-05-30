//
//  prueba1ViewController.m
//  prueba1
//
//  Created by white hat on 14/06/11.
//  Copyright 2011 utc. All rights reserved.
//

#import "prueba1ViewController.h"
#import "AudioStreamer.h"
#import <QuartzCore/CoreAnimation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CFNetwork/CFNetwork.h>

@implementation prueba1ViewController

@synthesize emisoraPicker,spinner;

// Actions

	// Cambiar Emisora
- (IBAction) cambiarEmisora:(id)sender{
	UIActionSheet *elegir = [[UIActionSheet alloc] initWithTitle:@"Elegir Emisora" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"RadioUVM FM",@"RadioUVM Rock",@"RadioUVM Electrónica",@"RadioUVM Sesión Chile",@"RadioUVM Dance",@"RadioUVM Pop",nil];
	[elegir showFromRect:self.view.bounds inView:self.view animated:YES];
	[elegir release];
	
}

	// UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *) sender clickedButtonAtIndex:(NSInteger) index{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	//NSNumber *indice = [[NSNumber alloc] initWithInt:index];
	NSLog(@"%d",index);
	
	if (index !=6) {
		[defaults setInteger:index forKey:@"indice"]; //cmilo lo cambio
		[defaults synchronize];//cmilo lo cambio
		[self reproducir:self emisora:index];
	}
}

//
// destroyStreamer
//
// Removes the streamer, the UI update timer and the change notification
//
- (void)destroyStreamer
{
	if (streamer)
	{
		[[NSNotificationCenter defaultCenter]
		 removeObserver:self
		 name:ASStatusChangedNotification
		 object:streamer];
		
		[streamer stop];
		[streamer release];
		streamer = nil;
	}
}

//
// createStreamer
//
// Creates or recreates the AudioStreamer object.
//
- (void)createStreamer:(NSString *) urlString
{
	
	
	[self destroyStreamer];
	
/*
	NSString *escapedValue =
	[(NSString *)CFURLCreateStringByAddingPercentEscapes(
														 nil,
														 (CFStringRef)t,
														 NULL,
														 NULL,
														 kCFStringEncodingUTF8)
	 autorelease];
*/	
	NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"%@",urlString);
	streamer = [[AudioStreamer alloc] initWithURL:url];
	
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(playbackStateChanged:)
	 name:ASStatusChangedNotification
	 object:streamer];
}


-(IBAction) pausar:(id)sender{
	
	[streamer stop];
}
	 -(IBAction) reproducir:(id)sender emisora:(NSInteger)index {
	NSString *urlString;
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	index = [defaults integerForKey:@"indice"];
		 
	switch (index) {

		case 1:
			urlString = @"http://radiouvm.hopto.org:8010";
			//Imagen.image = [UIImage imageNamed:@"UVM Rock.jpg"];
			break;
		case 2:
			urlString = @"http://radiouvm.hopto.org:8000";
			//Imagen.image = [UIImage imageNamed:@"UVM Electronica.jpg"];
			break;
		case 3:
			urlString = @"http://radiouvm.hopto.org:8030";
			//Imagen.image = [UIImage imageNamed:@"UVM Sesion Chile.jpg"];
			break;
		case 4:
			urlString = @"http://radiouvm.hopto.org:8040";
			//Imagen.image = [UIImage imageNamed:@"UVM Dance.jpg"];
			break;
		case 5:
			urlString = @"http://radiouvm.hopto.org:8050";
			//Imagen.image = [UIImage imageNamed:@"UVM Pop.jpg"];
			break;
//
		
		default:
			urlString = @"http://200.24.229.253:8020";
			//Imagen.image = [UIImage imageNamed:@"UVM Pop.jpg"];
			NSLog(@"Reproducir Fm");
		  	break;	
			
		
	}
    
	[self createStreamer:urlString];
	
	[streamer start];
		 /*
		 UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		 [spinner setCenter:CGPointMake(163, 305)];
		 if ([streamer isWaiting])
		 {
			 spinner.hidden = NO;
			 [self.view addSubview:spinner];
			 [spinner startAnimating];
			 //[self setButtonImage:[UIImage imageNamed:@"loadingbutton.png"]];
		 }
		 else if ([streamer isPlaying])
		 {
			 [spinner stopAnimating];
			 
			 spinner.hidden = YES;
			 //[self setButtonImage:[UIImage imageNamed:@"stopbutton.png"]];
		 }
		 else if ([streamer isIdle])
		 {
			 [self destroyStreamer];
			 [spinner stopAnimating];
			 [spinner release];
			 //[self setButtonImage:[UIImage imageNamed:@"playbutton.png"]];
		 }
	*/
		 /*
	if (play == YES) {
			[self createStreamer:urlString];
			[streamer start];
	}
	else {
		[streamer stop];
	}
*/
	
	
/*	if(![[UIApplication sharedApplication] openURL:url]) {
		NSLog(@"Problem Steve Jobs? Mega Fail to load streaming");
	}
 */
	
}
// playbackStateChanged:
//
// Invoked when the AudioStreamer
// reports that its playback status has changed.
//
- (void)playbackStateChanged:(NSNotification *)aNotification
{
	

	
	
	if ([streamer isWaiting])
	{
		
		spinner.hidden = NO;
		[spinner startAnimating];
		[self.view addSubview:spinner];
		
		//[spinner startAnimating];
		//[self setButtonImage:[UIImage imageNamed:@"loadingbutton.png"]];
	}
	else if ([streamer isPlaying])
	{
		[spinner stopAnimating];
		//[self.view removeSubview:spinner];
		//spinner.hidden = YES;
		//[spinner release];
		//[self setButtonImage:[UIImage imageNamed:@"stopbutton.png"]];
	}
	else if ([streamer isIdle])
	{
		//spinner.hidden = YES;
		//[spinner release];
		[self destroyStreamer];
		[spinner stopAnimating];
		
		//[self setButtonImage:[UIImage imageNamed:@"playbutton.png"]];
	}
	//[spinner release];
}
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	emisoras = [[NSArray alloc] initWithObjects: @"RadioUVM Pop", @"RadioUVM Rock",@"RadioUVM Electrónica",@"RadioUVM Sesion-Chile",@"RadioUVM Dance",nil];
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	if ([defaults objectForKey:@"indice"] == nil) {
		[defaults setInteger:0 forKey:@"indice"];
		[defaults synchronize];
	}
	
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[spinner setCenter:CGPointMake(163, 305)];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[self destroyStreamer];
	[emisoraPicker release];
	[emisoras release];
	
    [super dealloc];
}

@end
