//
//  OPCustomSegue.m
//  timetotea
//
//  Created by Oleh Podhornyi on 25.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import "OPCustomSegue.h"

@implementation OPCustomSegue

-(void) perform {
    UIViewController* source = self.sourceViewController;
    UIViewController* destination = self.destinationViewController;
    
    [UIView transitionFromView:source.view toView:destination.view duration:0.05f options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        NSLog(@"Transition is finished");    }];
}

@end
