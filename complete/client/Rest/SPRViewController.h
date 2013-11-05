//
//  SPRViewController.h
//  Rest
//
//  Created by Roy Clarkson on 11/4/13.
//  Copyright (c) 2013 Spring. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPRViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *greetingId;
@property (nonatomic, strong) IBOutlet UILabel *greetingContent;

- (IBAction)fetchGreeting;

@end
