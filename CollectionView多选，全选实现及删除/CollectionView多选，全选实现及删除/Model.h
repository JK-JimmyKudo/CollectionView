//
//  Model.h
//  CollectionView多选，全选实现及删除
//
//  Created by DFSJ on 2017/7/12.
//  Copyright © 2017年 dfsj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic,assign) NSInteger dele;
@property (nonatomic,copy) NSString *name;

+(instancetype)modelDict:(NSDictionary *)dict;

@end
