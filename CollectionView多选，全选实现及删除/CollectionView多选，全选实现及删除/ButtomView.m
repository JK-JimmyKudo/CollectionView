//
//  ButtomView.m
//  CollectionView多选，全选实现及删除
//
//  Created by DFSJ on 2017/7/13.
//  Copyright © 2017年 dfsj. All rights reserved.
//

#import "ButtomView.h"

@implementation ButtomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
        
        
        CGFloat width = self.frame.size.width/2;
        
        self.leftBtn = [[UIButton alloc]init];
        self.leftBtn.frame = CGRectMake(0, 0, width, self.frame.size.height);
        self.leftBtn.backgroundColor = [UIColor redColor];
        [self.leftBtn setTitle:@"全选" forState:UIControlStateNormal];
         [self.leftBtn setTitle:@"取消全选" forState:UIControlStateSelected];
        [self.leftBtn addTarget:self action:@selector(allSelectedBarEditClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.leftBtn];
        
        
        
        
        
        
        self.rightBtn = [[UIButton alloc]init];
        self.rightBtn.frame = CGRectMake(width, 0, width, self.frame.size.height);
        [self.rightBtn setTitle:@"删除" forState:UIControlStateNormal];
        [self addSubview:self.rightBtn];
    }
    return self;
}

- (void)allSelectedBarEditClick:(UIButton *)sender {
    
    
    if (self.leftBtn.selected == YES) {
        
        self.leftBtn.selected = !sender.selected;
        //点击去选全选 
        NSLog(@" quxiao全选 ");
    }else{
    //点击全选按钮
        sender.selected = YES;
          NSLog(@" 全选 ");
        
    }
}
@end
