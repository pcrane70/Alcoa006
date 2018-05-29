//
//  ViewController.m
//  ABCDN
//
//  Created by 郭学进 on 2018/05/29.
//  Copyright © 2018年 郭学进. All rights reserved.
//

#import "ViewController.h"
#import "DefineHong.h"

#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

#import "imageRequestView.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSString *moonUrlStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _moonUrlStr = @"https://www.nasa.gov/sites/default/files/thumbnails/image/moon_3.jpg";
    NSString *riverStr = @"https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/potw1821a.jpg";
    
   UIImageView *im = [self funcD:riverStr];
    [self.view addSubview:im];
}

-(UIImageView *)funcD:(NSString *)urlStr{
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
    
    UIImage *image = [UIImage imageWithData:data];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(20, 100, 300, 300);
    return imageView;
}

-(void)funcE:(UIImage *)image{

    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    iv.frame = self.view.bounds;
    [self.view addSubview:iv];
}

-(void)funcC{
    NSString *getStr = @"https://www.nasa.gov/sites/default/files/thumbnails/image/moon_3.jpg";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:getStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"--==");
        
        UIImage *image = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        UIImageView *iv = [[UIImageView alloc] initWithImage:image];
        iv.frame = self.view.bounds;
        [self.view addSubview:iv];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(void)funcB{
    CGRect cc = self.view.bounds;
    UITableView *tableView = [[UITableView alloc] initWithFrame:cc style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}


-(void)funcA{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"click" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 44, WIDTH_SCREEN, 50);
    [button setBackgroundColor:[UIColor orangeColor]];
    [button addTarget:self action:@selector(buttonSelector) forControlEvents:UIControlEventTouchDown];
    button.tag = 10;
    [self.view addSubview:button];
}
-(void)buttonSelector{
    UIButton *button = [self.view viewWithTag:10];
    button.backgroundColor = [UIColor blackColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
