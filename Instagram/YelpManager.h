//
//  YelpManager.h
//  Instagram
//
//  Created by Emma Qian on 7/12/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YelpManager : NSObject
- (void)getEvents:(NSString *)latitude withLongitude:(NSString *)longitude withCompletion:(void(^)(NSDictionary *categories, NSError *error))completion;
@end
