//
//  ButtomView.h
//  CollectionView多选，全选实现及删除
//
//  Created by DFSJ on 2017/7/13.
//  Copyright © 2017年 dfsj. All rights reserved.
//

#import <UIKit/UIKit.h>
//删除
typedef void(^DeleteBlock)();
typedef void(^AllSelectBlock)(NSString *str);
typedef void(^SelectBlock)();

@interface ButtomView : UIView


@property (nonatomic,strong) UIButton *leftBtn;

@property (nonatomic,strong) UIButton *rightBtn;


@property (nonatomic,copy) DeleteBlock deleteBlock;
@property (nonatomic,copy) AllSelectBlock AllSelect;
@property (nonatomic,copy) SelectBlock  select;

@property (nonatomic,assign) BOOL All;

@end
