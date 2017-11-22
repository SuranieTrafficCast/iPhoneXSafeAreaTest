//
//  BottomContainer.m
//  iPhoneXUITest
//
//  Created by TrafficCastMBP on 11/22/17.
//  Copyright © 2017 TrafficCastMBP. All rights reserved.
//

#import "BottomContainer.h"

@interface BottomContainer ()
@property (weak, nonatomic) IBOutlet UIButton *btnHide;

@end

@implementation BottomContainer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)hideContainer:(id)sender {
    
    //rotate button
    if(CGAffineTransformIsIdentity(self.btnHide.transform)) {
        [UIView animateWithDuration:0.7
            animations: ^{
                [self.btnHide setTransform:CGAffineTransformMakeRotation(M_PI)];
            }
         
            completion:^(BOOL finished) {
                [self.myBottomContainerDelegate hideBottomContainer];
            }
        ];
        
    } else {
        
        [UIView animateWithDuration:0.7
             animations: ^{
                 self.btnHide.transform = CGAffineTransformIdentity;
             }

             completion:^(BOOL finished) {
                 [self.myBottomContainerDelegate hideBottomContainer];
             }
         ];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
