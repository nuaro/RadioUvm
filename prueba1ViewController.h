//
//  prueba1ViewController.h
//  prueba1
//
//  Created by white hat on 14/06/11.
//  Copyright 2011 utc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AudioStreamer;

@interface prueba1ViewController : UIViewController <UIActionSheetDelegate>{
	IBOutlet UIImageView *Imagen;
	IBOutlet UIPickerView *emisoraPicker;
	NSArray *emisoras;
	AudioStreamer *streamer;
	UIActivityIndicatorView *spinner;
	//IBOutlet UIActivityIndicatorView *activity;
	//BOOL play;
}


@property(nonatomic,retain) UIPickerView *emisoraPicker;
//@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activity;
@property(nonatomic,retain) UIActivityIndicatorView *spinner;

-(IBAction)reproducir:(id) sender emisora:(NSInteger) index;
-(IBAction)pausar:(id) sender;
- (IBAction) cambiarEmisora:(id)sender;
	

@end

