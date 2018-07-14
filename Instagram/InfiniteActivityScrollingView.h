//
//  InfiniteActivityScrollingView.h
//  Instagram
//
//  Created by Emma Qian on 7/13/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

@interface InfiniteActivityScrollingView : UIView

@property (class, nonatomic, readonly) CGFloat defaultHeight;

- (void)startAnimating;
- (void)stopAnimating;

@end

