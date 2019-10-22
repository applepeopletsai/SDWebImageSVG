//
//  ViewController.m
//  SDWebImageSVG
//
//  Created by Daniel on 2019/4/9.
//  Copyright © 2019 Daniel. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImageSVGCoder/SDWebImageSVGCoder.h>

#import "SVGButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    SVGKImage *image1 = [SVGKImage imageNamed:@"test"];
//    SVGKImageView *imageView1 = [[SVGKFastImageView alloc] initWithSVGKImage:image1];
//    [imageView1 setFrame: CGRectMake(100,100,100,100)];
//    [self.view addSubview:imageView1];
//
//    SVGKImage *image2 = [SVGKImage imageNamed:@"tiger"];
//    SVGKImageView *imageView2 = [[SVGKFastImageView alloc] initWithSVGKImage:image2];
//    [imageView2 setFrame: CGRectMake(100,200,100,100)];
//    [self.view addSubview:imageView2];
    
    
    SVGButton *button1 = [[SVGButton alloc] initWithFrame:CGRectMake(100,300,100,100) normalImageName:@"tea" selectedImageName:@"pizza" acitonHandler:^(SVGButton * _Nonnull sender) {
        sender.selected = !sender.selected;
        NSLog(@"button1 status: %lu",(unsigned long)sender.status);
    }];
    [self.view addSubview:button1];
    
    
    SVGButton *button2 = [[SVGButton alloc] initWithFrame:CGRectMake(100,400,100,100)];
    [self.view addSubview:button2];
    button2.selectedImageName = @"pizza";
    button2.normalImageName = @"tea";
    button2.selected = YES;
//    button2.actionHandler = ^(SVGButton *sender) {
//        sender.selected = !sender.selected;
//        NSLog(@"button2 status: %lu",(unsigned long)sender.status);
//    };
    [button2 addGestureRecognizerWithTarget:self action:@selector(test)];
}

- (void)test {
    NSLog(@"test");
}


@end
