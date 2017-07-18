//
//  ViewController.m
//  CollectionView多选，全选实现及删除
//
//  Created by DFSJ on 2017/7/12.
//  Copyright © 2017年 dfsj. All rights reserved.
//

#define UIScreenWidth     [UIScreen mainScreen].bounds.size.width

#define UIScreenHeight     [UIScreen mainScreen].bounds.size.height
#define LLWeakSelf(type)  __weak typeof(self)type = self


#import "ViewController.h"
#import "HomeShelfCollectionViewCell.h"
#import "ButtomView.h"
#import "Model.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic,strong) UICollectionView *CollectVShelf;

@property (nonatomic,strong) NSMutableArray *arrIMG;

@property (nonatomic,assign,getter=isCLickMode) BOOL CLickMode;

@property (nonatomic,strong) ButtomView *buttomView;

@property (nonatomic,strong) NSMutableArray *mutaArrForDelete;

@property (nonatomic,assign,getter=isEditing) BOOL Editing;

@property (nonatomic,strong) Model *model;
//标注全选和取消全选状态
@property (nonatomic,assign,getter=isAllS) BOOL AllS;

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
    
    
    
    LLWeakSelf(weakself);
    self.buttomView.AllSelect = ^(NSString *str) {
        
        if ([str isEqualToString:@"取消全选"]) {
            weakself.AllS = NO;
            weakself.buttomView.All = NO;
            
        }else{
            
            weakself.AllS = YES;
            weakself.buttomView.All = YES;
        }
        [weakself AllSelect];
    };
    
    self.buttomView.deleteBlock = ^{
        [weakself saveCookbook];
    };

    [self loadCelldata];
}

//全选
-(void)AllSelect{
    
    int i = 0;
    if (self.AllS) {
        for (Model *model in self.arrIMG) {
            //改变模型状态
            model.select=@"1";
            //增加数量
            i++;
        }
        
    }else{
        
        for (Model *model in self.arrIMG) {
            //改变模型状态
            model.select=@"0";
            //增加数量
            i--;
        }
        
    }
    [self loadData];
}



- (void)endEditingBarEditClick:(UIBarButtonItem *)sender {

    
    if ([sender.title isEqualToString:@"编辑"]){
        sender.title = @"取消";
        

        self.Editing  = YES;
        [self enterEditingModeAnimate];

    }else{
        
        sender.title = @"编辑";
        self.Editing  = NO;
        [self enterEditingModeAnimate];
        
        int i = 0;
        //获取模型
        for (Model *model in self.arrIMG) {
            //改变模型状态
            model.select=@"0";
            //增加数量
            i--;
        }
        
        [self loadData];
    }
}


#pragma mark - 编辑模式动画
- (void)enterEditingModeAnimate
{
    if (self.Editing) {
        [UIView animateWithDuration:0.1 animations:^{
            
            self.buttomView.frame = CGRectMake(0, UIScreenHeight - 50, UIScreenWidth, 50);
        }];
    }else
    {
        [UIView animateWithDuration:0.1 animations:^{
            
            self.buttomView.frame = CGRectMake(0, UIScreenHeight, UIScreenWidth, 50);
        }];
    }
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
    
    Model *model = self.arrIMG[indexPath.row];
    cell.model = self.arrIMG[indexPath.row];
    [cell cellInfoWithDictionary:model withEditingMode:self.Editing];

    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width-3*10)/2, 170);
}

//边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

//点击选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self clickCollectionCell:indexPath];

}


-(void)saveCookbook{
    
    
    int i = 0;
    
    for (Model *Model in self.arrIMG) {
        
        if ([Model.select intValue] == 1)
        {
            i++;
        }
    }
    
    if (i != 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确认删除选中项么？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
    
    if (i == 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选中删除内容" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSMutableArray *deleteData = [NSMutableArray array];
    
    for (Model *mode in self.arrIMG) {
        if ([mode.select intValue] == 1)
        {
            [deleteData addObject:mode];
            
        }
    }
    if (buttonIndex == 1) {
        //             执行删除操作
        [self.arrIMG removeObjectsInArray:deleteData];
        [self loadData];
 
    }
    
}

- (void)clickCollectionCell:(NSIndexPath *)indexPath{
    
    int i = 0;
    
    Model *item = self.arrIMG[indexPath.row];
    
    if (self.Editing == YES) {
        //        编辑模式
        if ([item.select intValue]==1 ){
            item.select = @"0";
        }else{
            item.select = @"1";
        }
        //获取所有模型，判断select ，如果select 为1  让i++  这个记录是为了全选功能的实现
        for (Model *model in self.arrIMG) {
            if ([model.select isEqualToString:@"1"]) {
                i++;
            }
        }
        
        if(i==self.arrIMG.count){
            
            self.buttomView.All = YES;
            
        }else{
            
            self.buttomView.All = NO;
        }
        
        [self loadData];

    }else{
        NSLog(@" 点击cell 视频播放 ");
    }
}





- (void) loadCelldata{
    
    
    [Model loadDataArray:^(NSMutableArray *array) {
        self.arrIMG = array;
    }];
    [self.CollectVShelf reloadData];
}

-(NSMutableArray *)arrIMG{
    if (_arrIMG == nil) {
        _arrIMG = [NSMutableArray array];
    }
    return _arrIMG;
}


@end
