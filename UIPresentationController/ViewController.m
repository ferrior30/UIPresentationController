//
//  ViewController.m
//  UIPresentationController
//
//  Created by ChenWei on 16/5/18.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "CWPresentationController.h"
#import "PresentationController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentSecond:(UIButton *)sender {
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    
    secondVc.modalPresentationStyle = UIModalPresentationCustom;
    secondVc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    secondVc.preferredContentSize = secondVc.view.bounds.size;
    
    PresentationController *presentationController = [[PresentationController alloc] initWithPresentedViewController:secondVc presentingViewController:self];

    secondVc.transitioningDelegate = presentationController;
    
    [self presentViewController:secondVc animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
}

@end
