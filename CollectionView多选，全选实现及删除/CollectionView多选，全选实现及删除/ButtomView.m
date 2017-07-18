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
        
        self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 50);
        
        
        CGFloat width = self.frame.size.width/2;
        
        self.leftBtn = [[UIButton alloc]init];
        self.leftBtn.frame = CGRectMake(0, 0, width, self.frame.size.height);
//        self.leftBtn.backgroundColor = [UIColor redColor];
        [self.leftBtn setTitle:@"全选" forState:UIControlStateNormal];
         [self.leftBtn setTitle:@"取消全选" forState:UIControlStateSelected];
        [self.leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.leftBtn addTarget:self action:@selector(allSelectedBarEditClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.leftBtn];
        
        
        
        
        
        
        self.rightBtn = [[UIButton alloc]init];
        self.rightBtn.frame = CGRectMake(width, 0, width, self.frame.size.height);
        [self.rightBtn setTitle:@"删除" forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.rightBtn addTarget:self action:@selector(saveCookbook) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:self.rightBtn];
    }
    return self;
}

- (void)allSelectedBarEditClick:(UIButton *)sender {
    
    
    if (self.leftBtn.selected == YES) {
        
        self.leftBtn.selected = !sender.selected;
        //点击去选全选 
       
        if (self.AllSelect) {
            self.AllSelect(@"取消全选");
        }
    }else{
    //点击全选按钮
        sender.selected = YES;
        if (self.AllSelect) {
            self.AllSelect(@"全选");
        }
    }
}

-(void) setAll:(BOOL)All{
    
    if (All == YES) {
        
        [self.leftBtn setTitle:@"取消全选" forState:UIControlStateNormal];
        self.leftBtn.selected = YES;
        
        
    }else{
        
        [self.leftBtn setTitle:@"全选" forState:UIControlStateNormal];
        self.leftBtn.selected = NO;
        
    }
}

-(void)saveCookbook{
    
    
    if (self.deleteBlock) {
        self.deleteBlock();
    }
}

@end
