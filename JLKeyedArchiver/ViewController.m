//
//  ViewController.m
//  JLKeyedArchiver
//
//  Created by afyylong on 2017/2/19.
//  Copyright © 2017年 afyylong. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
  
    Student *p = [[Student alloc] init];
    p.name = @"xiaomingggg";
    NSString *path = NSTemporaryDirectory();
    NSString *filePath = [path stringByAppendingPathComponent:@"person.txt"];
    NSLog(@"path:%@",filePath);
    //保存
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
    
    
    //读取
    Student *pp = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"p的name:%@",pp.name);
    
    
    
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
