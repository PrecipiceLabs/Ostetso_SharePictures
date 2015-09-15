//
//  FFInfoDialogVC.m
//
//  Copyright 2014 Precipice Labs, Inc. All rights reserved.
//

#import "FFInfoDialogVC.h"
#import "HomeViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation FFInfoDialogVC


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        
    }
    return self;
}

- (void)dealloc
{
    //[super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (UIScrollView *) scrollView
{
    if ([_webView respondsToSelector: @selector(scrollView)])
    {
        return _webView.scrollView;
    }
    else 
    {
        for (UIView *subview in [_webView subviews])
        {
            if ([subview isKindOfClass:[UIScrollView class]])
            {
                return (UIScrollView *)subview;
            }
        }
    }
    
    return nil;
}

- (void) viewWillAppear:(BOOL)animated
{
}

-(void) viewWillDisappear:(BOOL)animated
{
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
        [[UIApplication sharedApplication] openURL:[request URL]];
        return NO;
    }
    return YES;
}


- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    _webView.backgroundColor = [UIColor blackColor];
    _webView.opaque = YES;
    
    UIScrollView *scrollView = [self scrollView];
    if (scrollView)
    {
        CGRect origframe = _webView.frame;
        CGRect frame = origframe;
        frame.size.height = 1;
        _webView.frame = frame;
        CGSize fittingSize = [_webView sizeThatFits:CGSizeZero];
        frame.size = fittingSize;
        _webView.frame = origframe;
    }
}

#pragma mark - View lifecycle


// Touch on the nav bar scross the view to the top
- (void) touchNavBar
{
    UIScrollView *scrollView = [self scrollView];
    if (scrollView)
    {
        [scrollView scrollRectToVisible: CGRectMake(0, 0, 10, 10) animated: YES];
    }
}

- (void) setupNavbarGestureRecognizer 
{
    // recognise taps on navigation bar to hide
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self 
                                                                                        action:@selector(touchNavBar)];
    gestureRecognizer.numberOfTapsRequired = 1;

    // create a view which covers most of the tap bar to
    // manage the gestures - if we use the navigation bar
    // it interferes with the nav buttons
    CGRect frame = CGRectMake(self.view.frame.size.width/4, 0, self.view.frame.size.width/2, 44);
    UIView *navBarTapView = [[UIView alloc] initWithFrame:frame];
    //[_navigationBar addSubview:navBarTapView];
    navBarTapView.backgroundColor = [UIColor clearColor];
    [navBarTapView setUserInteractionEnabled:YES];
    [navBarTapView addGestureRecognizer:gestureRecognizer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavbarGestureRecognizer];

    if (_ffVC.isIPad)
    {
        CGRect ipadFrame = _ffVC.view.frame;
        self.view.frame = ipadFrame;
    }
    
#if 0   // iOS 5.0 and later  
    UIScrollView *scrollView = _webView.scrollView;
    scrollView.alwaysBounceHorizontal = NO;
    scrollView.directionalLockEnabled = YES;
#endif    

    _webView.allowsInlineMediaPlayback = YES;
    _webView.delegate = self;    
    
    NSBundle *bundle = [NSBundle mainBundle];

    NSString *helpFile = @"SharePictures_Info";
    NSString *pathToHTML = [bundle pathForResource:helpFile ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:pathToHTML isDirectory:NO];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];

}

- (void)viewDidUnload
{
    _webView = nil;
    _activityIndicator = nil;
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Consume the begin so nobody else gets it.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void) allowInteraction: (BOOL) allow
{
    if (allow)
    {
        [_activityIndicator stopAnimating];   
    }
    else
    {
        [_activityIndicator startAnimating];
    }
    
    [_webView setUserInteractionEnabled: allow];
    //[_navigationBar setUserInteractionEnabled: allow];
}

- (void) setFPViewController: (HomeViewController *)ffVC
{
    _ffVC = ffVC;
}


@end
