//
//  SecondViewController.m
//  UIPresentationController
//
//  Created by ChenWei on 16/5/18.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "SecondViewController.h"
#import "CWPresentationController.h"
#import "PresentationController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
    self.view.backgroundColor = [UIColor brownColor];
    self.view.bounds = CGRectMake(0, 0, 350, 200);
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(50, 20, 0, 0);
    [btn setTitle:@"Preent -> third" forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(presentThird:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.frame = CGRectMake(50, 80, 0, 0);
    [btn2 setTitle:@"sizeChange" forState:UIControlStateNormal];
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(sizeChanged) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)sizeChanged {
    CGRect rect = self.view.frame;
    rect.size.height -= 120;
    
    __weak typeof(self) weakS = self;
    [UIView animateWithDuration:5 animations:^{
        weakS.view.frame = rect;
    }];
}

- (CGSize)preferredContentSize {
    return self.view.bounds.size;
}

- (void)presentThird:(UIButton *)button {
    UIViewController *third = [UIViewController new];
    third.view.autoresizingMask = UIViewAutoresizingNone;
    third.preferredContentSize = self.preferredContentSize;


    third.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
      PresentationController *presentationController = [[PresentationController alloc] initWithPresentedViewController:third presentingViewController:self];
//    [presentationController shouldRemovePresentersView];

    third.transitioningDelegate =  presentationController;
    third.modalPresentationStyle = UIModalPresentationCustom;

    third.view.backgroundColor = [UIColor greenColor];
    
    [self presentViewController:third animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
