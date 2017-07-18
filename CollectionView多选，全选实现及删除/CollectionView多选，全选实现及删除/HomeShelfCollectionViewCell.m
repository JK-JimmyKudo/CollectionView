//
//  HomeShelfCollectionViewCell.m
//  CollectionView多选，全选实现及删除
//
//  Created by DFSJ on 2017/7/12.
//  Copyright © 2017年 dfsj. All rights reserved.
//

#import "HomeShelfCollectionViewCell.h"
#import "Model.h"
#import "UIViewExt.h"

@interface HomeShelfCollectionViewCell ()

@property (nonatomic, weak) UIImageView *iconView;

@property (nonatomic, weak) UILabel *nameLabel;

@property (nonatomic,weak) UIImageView *imageView;

@property (nonatomic,weak) UILabel *label;

@property (nonatomic,weak) UILabel *timeLabel;

@property (nonatomic,weak) UIButton *selBtn;


@property (nonatomic, strong) UIView *selectedView;             //选中状态视图

@property (nonatomic,strong) UIImageView *connerMarkImageView;

@property (nonatomic,strong) UIImageView *panoramaImageView;
@property (nonatomic, strong) UIView *backGroundView;
@end


@implementation HomeShelfCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self layoutSubviewsUI];
        [self layoutSubviewsFrame];

        
    }
    return self;
}

-(void)layoutSubviewsUI{
    
    UIView *backGroundView = [[UIView alloc]init];
    [self.contentView addSubview:backGroundView];
    self.backGroundView = backGroundView;
    
    
    // 添加所有子控件
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    self.iconView = iconView;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.backGroundView addSubview:iconView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:nameLabel];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:13.0];
    self.nameLabel = nameLabel;
    [self.backGroundView addSubview:nameLabel];
    
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    self.imageView.image = [UIImage imageNamed:@"MobilePlayer"];
    
    [self.backGroundView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc]init];
    [self.contentView addSubview:label];
    self.label = label;
    //        self.label.text = @"剩余45分57秒";
    self.label.font = [UIFont systemFontOfSize:8];
    [self.backGroundView addSubview:label];
    
    UILabel *timeLabel = [[UILabel alloc]init];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    self.timeLabel.font = [UIFont systemFontOfSize:10];
    [self.backGroundView addSubview:timeLabel];
    
    
    self.connerMarkImageView = [[UIImageView alloc]init];
    [self.backGroundView addSubview:self.connerMarkImageView];
//    [self.connerMarkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.right.mas_equalTo(2);
//        make.top.mas_equalTo(0);
//        make.width.mas_equalTo(33);
//        make.height.mas_equalTo(15);
//        
//    }];
    
    
    self.selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    self.selectedView.backgroundColor = [UIColor clearColor];
    [self.backGroundView addSubview:self.selectedView];
    
    
    
    UIView *halfAlphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    halfAlphaView.backgroundColor = [UIColor whiteColor];
    halfAlphaView.alpha = 0.5;
    [self.selectedView addSubview:halfAlphaView];
    
    UIImageView *selectedImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.width-25, self.height-150, 17, 17)];
    selectedImage.image = [UIImage imageNamed:@"cache_select"];
    selectedImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.selectedView addSubview:selectedImage];
    
    
    
    self.panoramaImageView = [[UIImageView alloc]init];
    self.panoramaImageView.frame = CGRectMake(0, 0, 30, 30);
    [self.backGroundView addSubview:self.panoramaImageView];
    
    
    
    
}


- (void)layoutSubviewsFrame {
    
    CGFloat backGroundViewX = 0;
    CGFloat backGroundViewY = 0;
    CGFloat backGroundViewW = self.width;
    CGFloat backGroundViewH = self.height;
    self.backGroundView.frame = CGRectMake(backGroundViewX, backGroundViewY, backGroundViewW, backGroundViewH);
    
    
    CGFloat iconW = self.width;
    CGFloat iconH = 333/3;
    CGFloat iconX = (self.width - iconW) * 0.5;
    CGFloat iconY = 0;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    CGFloat nameX = 0;
    CGFloat nameY = CGRectGetMaxY(self.iconView.frame)+8;
    CGFloat nameW = self.width;
    CGFloat nameH = 59/3;
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    CGFloat ImageX = nameX+3;
    CGFloat ImageY = CGRectGetMaxY(self.nameLabel.frame)+1;
    CGFloat ImageW = 28/3;
    CGFloat ImageH = 40/3;
    self.imageView.frame = CGRectMake(ImageX, ImageY, ImageW, ImageH);
    
    
    
    CGFloat LabelX = nameX+15;
    CGFloat LabelY = CGRectGetMaxY(self.nameLabel.frame);
    CGFloat LabelW = nameW;
    CGFloat LabelH = 50/3;
    self.label.frame = CGRectMake(LabelX, LabelY, LabelW, LabelH);
    
    
    CGFloat timeLabelX = CGRectGetMaxX(self.label.frame)-15;
    CGFloat timeLabelY = CGRectGetMaxY(self.nameLabel.frame);
    CGFloat timeLabelW = 180/3;
    CGFloat timeLabelH = 50/3;
    self.timeLabel.frame = CGRectMake(timeLabelX, timeLabelY, timeLabelW, timeLabelH);
    
    
    CGFloat selBtnX = self.width - 80/3;
    CGFloat selBtnY = 20/3;
    CGFloat selBtnW = 60/3;
    CGFloat selBtnH = 60/3;
    self.selBtn.frame = CGRectMake(selBtnX, selBtnY, selBtnW, selBtnH);
    
}

-(void) setModel:(Model *)model{

    self.nameLabel.text = model.vname;
    
    self.nameLabel.textColor = [UIColor blackColor];
    
    NSURL *url = [NSURL URLWithString:model.posterfid2];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image2=[UIImage imageWithData:data];
    [self.iconView setImage:image2];
    


    int index=[model.connerMark intValue];
    self.connerMarkImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.connerMarkImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"cornermark_%d",index]];
    

}

-(void) cellInfoWithDictionary:(Model *)model withEditingMode:(BOOL)isEditing{
    self.selectedView.hidden = YES;
    
    if (isEditing) {
        
        if ([model.select intValue] == 1) {
            
            self.selectedView.hidden = NO;
        }
    }
}
    
@end
