//
//  ViewController.m
//  CollectionView多选，全选实现及删除
//
//  Created by DFSJ on 2017/7/12.
//  Copyright © 2017年 dfsj. All rights reserved.
//

#define UIScreenWidth     [UIScreen mainScreen].bounds.size.width

#define UIScreenHeight     [UIScreen mainScreen].bounds.size.height


#import "ViewController.h"
#import "HomeShelfCollectionViewCell.h"
#import "ButtomView.h"
#import "Model.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *CollectVShelf;

@property (nonatomic,strong) NSArray *arrIMG;

@property (nonatomic,assign,getter=isCLickMode) BOOL CLickMode;

@property (nonatomic,strong) ButtomView *buttomView;

@property (nonatomic,strong) NSMutableArray *mutaArrForDelete;

@property (nonatomic,assign,getter=isEditing) BOOL Editing;

@property (nonatomic,strong) Model *model;

@end


static NSString *STRIDENT = @"HomeShelfCollectionViewCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

 
    
    
    [self CreatColletionViewAsShelf];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(endEditingBarEditClick:)];
    self.navigationItem.rightBarButtonItem = btn;
    

    
    self.buttomView = [[ButtomView alloc]init];
    [self.view addSubview:self.buttomView];

}



- (void)endEditingBarEditClick:(UIBarButtonItem *)sender {

    
    if ([sender.title isEqualToString:@"编辑"]){
        sender.title = @"取消";
        

        self.Editing  = YES;
        
    }else{
        
        sender.title = @"编辑";

        
        self.Editing  = NO;

    }
    
    [self loadData];
    
}

- (void)loadData {

    [self.CollectVShelf reloadData];
}

- (void)CreatColletionViewAsShelf
{
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.CollectVShelf = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWidth, UIScreenHeight) collectionViewLayout:flowLayout];

    
    [self.CollectVShelf registerClass:[HomeShelfCollectionViewCell class] forCellWithReuseIdentifier:STRIDENT];

    
    
    self.CollectVShelf.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    
    [self.view addSubview:self.CollectVShelf];
    
    self.CollectVShelf.delegate = self;
    
    self.CollectVShelf.dataSource = self;
    
}


//共有多少个单元格
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrIMG.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeShelfCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:STRIDENT forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor yellowColor];

    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 170);
}

//边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 0, 20);
}

//点击选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{


}




@end
