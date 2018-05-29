//
//  imageRequestView.m
//  ABCDN
//
//  Created by 郭学进 on 2018/05/29.
//  Copyright © 2018年 郭学进. All rights reserved.
//

#import "imageRequestView.h"

@implementation imageRequestView

-(UIImageView *)funcD:(NSString *)urlStr{
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
    
    UIImage *image = [UIImage imageWithData:data];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(20, 100, 300, 300);
    return imageView;
}

@end
