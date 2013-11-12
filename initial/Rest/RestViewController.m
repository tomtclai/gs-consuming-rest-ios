#import "RestViewController.h"

@interface RestViewController ()

@end

@implementation RestViewController

@synthesize greetingId;
@synthesize greetingContent;

- (IBAction)fetchGreeting;
{
    // TODO: add REST request
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchGreeting];
}

@end
