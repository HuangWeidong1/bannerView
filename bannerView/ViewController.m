//
//  ViewController.m
//  bannerView
//
//  Created by 中软mini025 on 15/10/29.
//  Copyright (c) 2015年 中软mini025. All rights reserved.
//

#import "ViewController.h"
#define Screen_width [UIScreen mainScreen].bounds.size.width
#define Screen_heigth [UIScreen mainScreen].bounds.size.height
#define imageCount 2
@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView* _banner;
    UIImageView* _imageView;
    UIPageControl* _pageCtr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initImage];
    [self initPageControl];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI
{
    _banner = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 22, Screen_width, 80)];
    _banner.contentOffset = CGPointZero;
    _banner.delegate = self;
    _banner.pagingEnabled = YES;
    _banner.bounces = NO;
    _banner.showsVerticalScrollIndicator = NO;
    _banner.showsHorizontalScrollIndicator = NO;
//    _banner.backgroundColor = [UIColor redColor];
    [self.view addSubview:_banner];
}
-(void)initImage
{
    _banner.contentSize = CGSizeMake(Screen_width*imageCount, 80);
    for (int index = 0; index<imageCount; index++) {
        NSString* imageName = [NSString stringWithFormat:@"image_%d.png",index];
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:imageName];
        _imageView.frame = CGRectMake(Screen_width*index, 0, Screen_width, 80);
        _imageView.tag = 1000+index;
        _imageView.backgroundColor = [UIColor redColor];
        [_banner addSubview:_imageView];
    }

}
-(void)initPageControl
{
    _pageCtr = [[UIPageControl alloc] initWithFrame:CGRectMake((Screen_width -100)/2, 64, 100, 44)];
    _pageCtr.numberOfPages = imageCount;
    _pageCtr.currentPage = 0;
    [self.view addSubview:_pageCtr];
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = _banner.frame.size.width;
    NSLog(@"%f",_banner.contentOffset.x);
    int page = (int)(floor((_banner.contentOffset.x-pageWidth/2)/pageWidth)+1);
//    _pageCtr.frame = CGRectMake(_imageView.frame.size.width*page+_imageView.frame.size.width/2-50, _imageView.frame.size.height-44 , 100, 44);
    _pageCtr.currentPage = page;
}                                               // any offset changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
} // any zoom scale changes

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{

}
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {

}
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{

}// called on finger up as we are moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

}// called when scroll view grinds to a halt

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
} // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return nil;
}     // return a view that will be scaled. if delegate returns nil, nothing happens
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {

} // called before the scroll view begins zooming its content
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{

}// scale between minimum and maximum. called after any 'bounce' animations

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return NO;
}// return a yes if you want to scroll to the top. if not defined, assumes YES
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{

}// called when scrolling animation finished. may be called immediately if already at top
@end
