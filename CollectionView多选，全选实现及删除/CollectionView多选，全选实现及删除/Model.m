//
//  Model.m
//  CollectionView多选，全选实现及删除
//
//  Created by DFSJ on 2017/7/12.
//  Copyright © 2017年 dfsj. All rights reserved.
//

#import "Model.h"

@implementation Model

+(instancetype) modelDict:(NSDictionary *)dict{


    Model *model = [[Model alloc]init];
    

    [model setValuesForKeysWithDictionary:dict];

    return model;
}

-(void) setValue:(id)value forUndefinedKey:(NSString *)key{}

+(void) loadDataArray:(NSArrayMblock)arrar{

    NSArray *array = @[@{@"id":@"2213419",@"posterfid2":@"http://app.img.3dov.cn/2016/7/08/6156C0B67099996E5F9442760B3CB26B_360x480.jpg",@"vname":@"体验“蛋碎”之痛",@"connerMark":@"0"},
                       @{@"id":@"2213419",@"posterfid2":@"http://app.img.3dov.cn/2017/1/16/1E00C027BF27CD34104EA2B153350F97_360x480.jpg",@"vname":@"VR公益之珊瑚礁的保护",@"connerMark":@"0"},
                       @{@"id":@"2213419",@"posterfid2":@"http://app.img.3dov.cn/2016/11/07/24B26016D1EE04103052BCFC7EF166F0_360x480.jpg",@"vname":@"《Help》完整版",@"connerMark":@"4"},
                       @{@"id":@"2213419",@"posterfid2":@"http://app.img.3dov.cn/4760FD41FB1D80575F7610AB95299241_360x480.jpg",@"vname":@"忍者神龟：变种时代",@"connerMark":@"4"},
                       @{@"id":@"2213419",@"posterfid2":@"http://app.img.3dov.cn/2017/1/24/83964B6BE09F1409ECE02A36E697199F_360x480.jpg",@"vname":@"美国拆迁办最终抵不过钉子户",@"connerMark":@"0"},
                       @{@"id":@"2213419",@"posterfid2":@"http://app.img.3dov.cn/2016/12/07/7A435223D8939F2588962D691C2567C8_360x480.jpg",@"vname":@"致我们终将逝去的英雄",@"connerMark":@"0"}];


    NSMutableArray *arr = [NSMutableArray array];
    
    for (NSDictionary *item in array) {
        
        Model *model = [Model modelDict:item];
        
        [arr addObject:model];
    }
    
    arrar(arr);

}

@end
