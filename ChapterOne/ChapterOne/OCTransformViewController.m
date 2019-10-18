//
//  OCTransformViewController.m
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/10/18.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "OCTransformViewController.h"

@interface OCTransformViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation OCTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    CATransformLayer
    //    创建第一个cube
        CATransform3D ct1 = CATransform3DIdentity;
        //x轴位移
        ct1 = CATransform3DTranslate(ct1, -100, 0, 0);
        //创建cube的六个面
        CALayer * cube1 = [self cubeWithTransform:ct1];
        [self.containerView.layer addSublayer:cube1];
        
    //    创建第二个cube
        CATransform3D ct2 = CATransform3DIdentity;
        //x轴平移100
        ct2 = CATransform3DTranslate(ct2, 100, 0, 0);
        //绕着X轴旋转-45
        ct2 = CATransform3DRotate(ct2, -M_PI_4, 1, 0, 0);
        //绕着Y轴旋转-45
        ct2 = CATransform3DRotate(ct2, -M_PI_4, 0, 1, 0);
        CALayer * cube2 = [self cubeWithTransform:ct2];
        [self.containerView.layer addSublayer:cube2];
}

//创建layer并设置背景色和transform
-(CALayer *)faceWithTransform:(CATransform3D)transform{
    CALayer * face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);
    CGFloat red = (rand()/(double)INT_MAX);
    CGFloat green = (rand()/(double)INT_MAX);
    CGFloat blue = (rand()/(double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
    face.transform = transform;
    return face;
}

//创建transformLayer，并添加layer
-(CALayer*)cubeWithTransform:(CATransform3D)transform{
    //create cube layer
    CATransformLayer * cube = [CATransformLayer layer];
    //add cube face 1，Z轴位移50
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];
    //add cube face 2，Z轴位移-50，Y轴旋转M_PI
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    //add cube face 3,X轴位移50，Y轴旋转M_PI_2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    //add cube face 4,X轴位移-50，Y轴旋转-M_PI_2
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    //add cube face 5,Y轴位移50，X轴旋转M_PI_2
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    //add cube face 6,Y轴位移-50，X轴旋转-M_PI_2
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    CGSize containerSize = self.containerView.bounds.size;
    cube.position = CGPointMake(containerSize.width/2.0, containerSize.height/2.0);
    cube.transform = transform;
    return cube;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
