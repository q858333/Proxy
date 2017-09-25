//
//  ViewController.m
//  ProxyTest
//
//  Created by dengbin on 2017/9/25.
//  Copyright © 2017年 dengbin. All rights reserved.
//

#import "ViewController.h"
#import "MyProxy.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self connectionDelegate:nil];

    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)connectionDelegate:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://www.daka.com/login?username=daka&pwd=123"];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];



    [request setHTTPMethod:@"POST"];


    NSString *body = @"bodyParam1=BodyValue1&bodyParam2=BodyValue2";
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];



    [NSURLConnection connectionWithRequest:request delegate:[MyProxy proxyWithConsignor:self]];

    
    
    
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{

    NSLog(@"didReceiveData");
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connectionDidFinishLoading");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
