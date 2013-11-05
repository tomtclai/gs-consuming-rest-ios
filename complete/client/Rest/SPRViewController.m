//
//  SPRViewController.m
//  Rest
//
//  Created by Roy Clarkson on 11/4/13.
//  Copyright (c) 2013 Spring. All rights reserved.
//

#import "SPRViewController.h"

@interface SPRViewController ()

- (void)fetchGreetingDidFailWithError:(NSError *)error;

@end

@implementation SPRViewController

@synthesize greetingId;
@synthesize greetingContent;

- (IBAction)fetchGreeting;
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/greeting"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        if (data.length > 0 && connectionError == nil)
        {
            NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
            self.greetingContent.text = [greeting objectForKey:@"content"];
        }
        else
        {
            [self fetchGreetingDidFailWithError:connectionError];
        }
    }];
}

- (void)fetchGreetingDidFailWithError:(NSError *)error
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Connection Error"
                                                        message:[error localizedDescription]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchGreeting];
}

@end
