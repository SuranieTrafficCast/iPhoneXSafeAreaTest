//
//  ViewController.m
//  iPhoneXUITest
//
//  Created by TrafficCastMBP on 11/22/17.
//  Copyright © 2017 TrafficCastMBP. All rights reserved.
//

#import "ViewController.h"
#import "CenterContainer.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *vTopContainer;
@property (weak, nonatomic) IBOutlet UIButton *btnToggle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topContainerTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerContainerTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerContainerHeight;
@property (nonatomic, strong) BottomContainer* vBottomContainer;
@property (nonatomic, strong) CenterContainer* vCenterContainer;
@property (nonatomic, assign) int iMajorVersion;
@property (nonatomic, assign) int iDeviceType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //get device ~ note: on sim this will show either iPhone Simulator or your laptop/desktop, you need to be tethered to see actual decvice returned
    NSString* strDeviceType = [UIDevice currentDevice].name;
    
    //gonna simulate device type for testing
    self.iDeviceType = 8;
    
    //get os
    self.iMajorVersion = (int)[[NSProcessInfo processInfo] operatingSystemVersion].majorVersion;
}

- (void) viewDidLayoutSubviews {
    
   
    
    //os == 11 && device type == 8.0
    if (self.iMajorVersion == 11 && self.iDeviceType <= 8) {
        
        self.topContainerTopConstraint.constant = -20;
        self.centerContainerTopConstraint.constant = 78;
        self.centerContainerHeight.constant = self.centerContainerHeight.constant + 20.0;
        
    } else {
        
        //will this matter if someone is running less than 11 - they won't be on an X and not have safe areas
        
    }
    
}

#pragma mark - Hide Bottom Delegate Method

- (void) hideBottomContainer {
    
    if (CGAffineTransformIsIdentity(self.vBottomContainer.view.transform)) {
        
        [UIView animateWithDuration:0.4
                         animations: ^{
                             [self.vBottomContainer.view setTransform:CGAffineTransformMakeTranslation(self.vBottomContainer.view.frame.origin.x, self.vBottomContainer.view.frame.origin.y + (self.vBottomContainer.view.frame.size.height - 45.0))];
                         }
         
                         completion:^(BOOL finished) {
                             [self resetCenterContainerHeight:YES];
                         }
         ];
        
    } else {
        [UIView animateWithDuration:0.4
                         animations: ^{
                             self.vBottomContainer.view.transform = CGAffineTransformIdentity;
                         }
         
                         completion:^(BOOL finished) {
                            [self resetCenterContainerHeight:NO];
                         }
         ];
        
    }
    
}

- (void) resetCenterContainerHeight : (BOOL) isBottomContainerHidden {
    
    CGRect containerFrame = self.vCenterContainer.view.frame;
    if (isBottomContainerHidden) {
        containerFrame.size.height = containerFrame.size.height + (self.vBottomContainer.view.frame.size.height - 45.0);
    } else {
        containerFrame.size.height = containerFrame.size.height - (self.vBottomContainer.view.frame.size.height - 45.0);
    }
    
    [UIView animateWithDuration:0.4
                     animations: ^{
                         [self.vCenterContainer.view setFrame:containerFrame];
                     }
     
                     completion:^(BOOL finished) {
                         
                     }
     ];
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toBottomContainer"]) {
        self.vBottomContainer = (BottomContainer*)segue.destinationViewController;
        self.vBottomContainer.myBottomContainerDelegate = self;
    } else if ([segue.identifier isEqualToString:@"toCenterContainer"]) {
        self.vCenterContainer = (CenterContainer*)segue.destinationViewController;
    }
}

- (void) viewDidAppear:(BOOL)animated {
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
