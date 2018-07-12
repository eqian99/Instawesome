//
//  ComposeViewController.h
//  Instagram
//
//  Created by Emma Qian on 7/9/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Mapkit/Mapkit.h"

@interface ComposeViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UITextField *composeLabel;
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (assign, nonatomic) CLLocationCoordinate2D coord;

@end
