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

@end
