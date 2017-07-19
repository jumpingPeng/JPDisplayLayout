//
//  AutolayoutTableViewCell.m
//  DisplayLayout
//
//  Created by 贾鹏 on 2016/7/19.
//  Copyright © 2016年 贾鹏. All rights reserved.
//


#import "AutolayoutTableViewCell.h"
@interface AutolayoutTableViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *headerImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLable;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UITextView *contentLabel;

@end

@implementation AutolayoutTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.headerImageView.layer.cornerRadius = self.headerImageView.frame.size.height/2;
    self.headerImageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configCellData:(TestDataModel *)model {
        
    [self.headerImageView setImage:[[ImageCache shareInstance] getCacheImage:model.imageName]];
    [self.titleLable setText:model.title];
    [self.timeLabel setText:model.time];
    [self.contentLabel setText:model.content];
}

@end
