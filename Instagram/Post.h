//
//  Post.h
//  Instagram
//
//  Created by Emma Qian on 7/9/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Parse/Parse.h"
@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSString *username;

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFile *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withLatitude: (double)latitude withLongitude: (double)longitude withCompletion: (PFBooleanResultBlock  _Nullable)completion;

@end
