//
//  ViewController.m
//  CAReplicatorLayerDemo
//
//  Created by ZhouDamon on 16/3/15.
//  Copyright © 2016年 ZhouDamon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self musicAnimation];
//    [self activityIndicatorAnimation];
    [self followAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)musicAnimation
{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer new];
    replicatorLayer.bounds = CGRectMake(0, 0, 200, 100);
    replicatorLayer.backgroundColor = [UIColor grayColor].CGColor;
    replicatorLayer.position = CGPointMake(self.view.center.x, self.view.center.y - 150);
    [self.view.layer addSublayer:replicatorLayer];
    
    CALayer *subLayer = [CALayer new];
    subLayer.bounds = CGRectMake(0, 0, 8, 40);
    subLayer.cornerRadius = 2.0f;
    subLayer.position = CGPointMake(10, 115);
    subLayer.backgroundColor = [UIColor redColor].CGColor;
    [replicatorLayer addSublayer:subLayer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.fromValue = @(subLayer.position.y);
    basicAnimation.toValue = @(subLayer.position.y-30);
    basicAnimation.repeatCount = INFINITY;
    basicAnimation.autoreverses = YES;
    basicAnimation.duration = 0.5;
    [subLayer addAnimation:basicAnimation forKey:@"position.y"];
    
    replicatorLayer.instanceCount = 9;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20.0, 0.0, 0.0);
    replicatorLayer.instanceDelay = 0.35;
//    replicatorLayer.instanceColor = [UIColor redColor].CGColor;
    replicatorLayer.masksToBounds = YES;
}

- (void)activityIndicatorAnimation
{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer new];
    replicatorLayer.bounds = CGRectMake(0, 0, 200, 200);
    replicatorLayer.backgroundColor = [UIColor grayColor].CGColor;
    replicatorLayer.position = CGPointMake(self.view.center.x, self.view.center.y + 10);
    [self.view.layer addSublayer:replicatorLayer];

    CALayer *subLayer = [CALayer new];
    subLayer.bounds = CGRectMake(0, 0, 14, 14);
    subLayer.position = CGPointMake(100, 40);
    subLayer.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    subLayer.borderWidth = 1.0;
    subLayer.cornerRadius = 2.0;
    [replicatorLayer addSublayer:subLayer];
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @1.0;
    scale.toValue = @0.1;
    scale.duration = 1.5;
    scale.repeatCount = INFINITY;
//    scale.autoreverses = YES;
    [subLayer addAnimation:scale forKey:nil];
    
    replicatorLayer.instanceCount = 15;
    CGFloat angle = (2 * M_PI)/15;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1.0);
    replicatorLayer.instanceDelay = 1.5/15;
    subLayer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1);
}

- (void)followAnimation
{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer new];
    replicatorLayer.bounds = self.view.bounds;
    replicatorLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75].CGColor;
    replicatorLayer.position = self.view.center;
    [self.view.layer addSublayer:replicatorLayer];
    
    CALayer *subLayer = [CALayer new];
    subLayer.bounds = CGRectMake(0, 0, 10, 10);
    subLayer.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    subLayer.borderColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    subLayer.borderWidth = 1.0;
    subLayer.cornerRadius = 5.0;
    subLayer.shouldRasterize = YES;
    subLayer.rasterizationScale = [UIScreen mainScreen].scale;
    [replicatorLayer addSublayer:subLayer];
    
    CAKeyframeAnimation *move = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    move.path = [self path];
    move.repeatCount = INFINITY;
    move.duration = 4.0;
//    move.autoreverses = YES;
    [subLayer addAnimation:move forKey:nil];
    
    replicatorLayer.instanceDelay = 0.1;
    replicatorLayer.instanceCount = 20;
    replicatorLayer.instanceColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:1.0].CGColor;
    replicatorLayer.instanceGreenOffset = -0.03;
}

- (CGPathRef)path
{
    UIBezierPath *bezierPath = [UIBezierPath new];
    [bezierPath moveToPoint:(CGPointMake(31.5, 78.5))];
    [bezierPath addLineToPoint:(CGPointMake(31.5, 23.5))];
    [bezierPath addCurveToPoint:CGPointMake(58.5, 38.5) controlPoint1:CGPointMake(31.5, 23.5) controlPoint2:CGPointMake(62.46, 18.69)];
    [bezierPath addCurveToPoint:CGPointMake(53.5, 45.5) controlPoint1:CGPointMake(57.5, 43.5) controlPoint2:CGPointMake(53.5, 45.5)];
    [bezierPath addLineToPoint:(CGPointMake(43.5, 48.5))];
    [bezierPath addLineToPoint:(CGPointMake(53.5, 66.5))];
    [bezierPath addLineToPoint:(CGPointMake(62.5, 51.5))];
    [bezierPath addLineToPoint:(CGPointMake(70.5, 66.5))];
    [bezierPath addLineToPoint:(CGPointMake( 86.5, 23.5))];
    [bezierPath addLineToPoint:(CGPointMake(86.5, 78.5))];
//    [bezierPath addLineToPoint:(CGPointMake(31.5, 78.5))];
//    [bezierPath addLineToPoint:(CGPointMake(31.5, 71.5))];
    [bezierPath closePath];
    
    CGAffineTransform T = CGAffineTransformMakeScale(3.0, 3.0);
    return CGPathCreateCopyByTransformingPath(bezierPath.CGPath, &T);
}

@end
