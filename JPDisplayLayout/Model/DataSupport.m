//
//  DataSupport.m
//  DisplayLayout
//
//  Created by 贾鹏 on 2016/7/19.
//  Copyright © 2016年 贾鹏. All rights reserved.
//


#import "DataSupport.h"
#import "TestDataModel.h"
#import <UIKit/UIKit.h>
#define contentText @"从明天起，做一个幸福的人喂马、劈柴，周游世界；从明天起，关心粮食和蔬菜；我有一所房子，面朝大海，春暖花开；从明天起，和每一个亲人通信，告诉他们我的幸福；那幸福的闪电告诉我的，我将告诉每一个人；给每一条河每一座山取一个温暖的名字，陌生人，我也为你祝福，愿你有一个灿烂的前程，愿你有情人终成眷属。愿你在尘世获得幸福，我只愿面朝大海，春暖花开。    我们不要去和别人相比较，比较会累死个人。我们要让自己去努力，适合自己的就是幸福的。大清早别人有了，自己没有，那又如何呢？因为每个人都是这样，人与人之间谁都有可能在前面，人的一生偶尔谁在前面，也偶尔谁在后面，我们不必处处在前，那样的人生是很辛苦的，真正的辛苦！当别人在前面不气，不嫉妒，当自己在前面时不狂躁，时刻一颗安宁的心，我们的人生才会更宁静。不要别人前面就累，自己前面就轻松。我们允许世界发光，我们也允许自己有瑕疵，不优秀，然后平静地去努力。"

@interface DataSupport()
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UpdateDataSourceBlock updateDataBlock;
@end

@implementation DataSupport

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dataSource = [[NSMutableArray alloc] initWithCapacity:50];
        [self addTestData];
    }
    return self;
}

- (void)setUpdataDataSourceBlock:(UpdateDataSourceBlock) updateDataBlock {
    self.updateDataBlock = updateDataBlock;
}

#pragma mark - Prevate Method
- (void)addTestData {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("zeluli.concurrent", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_semaphore_t lock = dispatch_semaphore_create(1);
    
    for (int i = 0; i < 50; i ++) {
        dispatch_group_async(group, concurrentQueue, ^{
            dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
            [self createTestModel];
            dispatch_semaphore_signal(lock);
        });
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self updateDataSource];
    });
}

- (void)createTestModel {
    TestDataModel * model = [[TestDataModel alloc] init];
    model.title = @"行歌";
    
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    [dataFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    model.time = [dataFormatter stringFromDate:[NSDate date]];
    
    NSString *imageName = [NSString stringWithFormat:@"%d.jpg", arc4random() % 6];
    model.imageName =imageName;
    
    NSInteger endIndex = arc4random() % contentText.length;
    model.content = [contentText substringToIndex:endIndex];
    
    model.textHeight = [self countTextHeight:model.content];
    model.cellHeight = model.textHeight + 60;
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:model.content];
    text.font = [UIFont systemFontOfSize:14];
    text.lineSpacing = 3;
    model.attributeContent = text;
    
    model.attributeTitle = [[NSAttributedString alloc] initWithString:model.title];
    model.attributeTime = [[NSAttributedString alloc] initWithString:model.time];
    
    [self.dataSource addObject:model];
}

-(CGFloat)countTextHeight:(NSString *) text {
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 0;
    UIFont *font = [UIFont systemFontOfSize:14];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 30, CGFLOAT_MAX) options:options context:nil];
    return rect.size.height + 40;
}

- (void)updateDataSource {
    if (self.updateDataBlock != nil) {
        self.updateDataBlock(self.dataSource);
    }
}

@end
