//
//  Model.h
//  CollectionView多选，全选实现及删除
//
//  Created by DFSJ on 2017/7/12.
//  Copyright © 2017年 dfsj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NSArrayMblock)(NSMutableArray *array);

@interface Model : NSObject

@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *posterfid2;
@property (nonatomic,copy) NSString *vname;
@property (nonatomic,copy) NSString *connerMark;
@property (nonatomic,copy) NSString *select;

@property (nonatomic,copy) NSArrayMblock arrayBlock;

+(instancetype)modelDict:(NSDictionary *)dict;

+(void) loadDataArray:(NSArrayMblock) arrar;



@end
