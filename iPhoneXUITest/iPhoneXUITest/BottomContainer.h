//
//  BottomContainer.h
//  iPhoneXUITest
//
//  Created by TrafficCastMBP on 11/22/17.
//  Copyright © 2017 TrafficCastMBP. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HideContainerProtcol
-(void)hideBottomContainer;
@end

@interface BottomContainer : UIViewController

@property(nonatomic, weak) id<HideContainerProtcol>myBottomContainerDelegate;

@end
