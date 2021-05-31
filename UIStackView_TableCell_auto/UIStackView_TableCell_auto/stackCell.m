//
//  stackCell.m
//  UIStackView_TableCell_auto
//
//  Created by Wusu on 2021/5/31.
//

#import "stackCell.h"
#import "Masonry.h"

@interface stackCell()
@property (nonatomic, strong) UIStackView *stack1View;

/** <#属性#> */
@property (nonatomic, strong) UILabel *titleL;

/** <#属性#> */
@property (nonatomic, strong) UIImageView *imageV;

/** <#属性#> */
@property (nonatomic, strong) UIView *descL;

@end

@implementation stackCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString * cellIDE = @"stackCell";
    
    stackCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIDE];
    if (cell == nil)
    {
        cell = [[stackCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIDE];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    
    
    self.stack1View = [[UIStackView alloc]init];
    self.stack1View.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.stack1View.layer.cornerRadius = 10;
    
    self.stack1View.clipsToBounds = YES;

//    stackView.axis = UILayoutConstraintAxisHorizontal;
//    stackView.distribution = UIStackViewDistributionFillEqually;
//    stackView.alignment = UIStackViewAlignmentFill;
//
    /****
     UIStackViewDistributionFill   宽 填满
     UIStackViewDistributionFillEqually    宽 填满 大小一样
     UIStackViewDistributionFillProportionally 按比例
     */
    self.stack1View.axis = UILayoutConstraintAxisVertical; //子view朝向                  比较重要的4个属性1
    self.stack1View.distribution = UIStackViewDistributionFill; //主轴 属性决定了其管理的视图在沿着其轴向上的布局
    self.stack1View.alignment = UIStackViewAlignmentCenter; //纵轴 Alignment 属性决定了其管理的视图在垂直于其轴向上的布局
    self.stack1View.spacing = 10; //属性决定了其管理的视图间的最小间隙
    //重要
    
    
    
//    self.stack1View.translatesAutoresizingMaskIntoConstraints = NO;
    
   
    self.titleL = [[UILabel alloc]init];
    self.titleL.font = [UIFont systemFontOfSize:16];
    self.titleL.numberOfLines = 0;
    self.titleL.backgroundColor = [UIColor redColor];
    
    self.imageV = [[UIImageView alloc]init];
    self.imageV.clipsToBounds = YES;
    [self.imageV setImage:[UIImage imageNamed:@"a1"]];
    self.imageV.contentMode = UIViewContentModeScaleAspectFill;
    
    
    self.descL = [[UIView alloc]init];
    self.descL.backgroundColor = [UIColor grayColor];
    
    UILabel * descText =  [[UILabel alloc]init];
    descText.font = [UIFont systemFontOfSize:12];
    descText.text = @"5000热度值";
    UILabel * descStart = [[UILabel alloc]init];
    descStart.font = [UIFont systemFontOfSize:12];
    descStart.text = @"更新时间 2021-05-31";
    
    
    [self.contentView addSubview:self.stack1View];
    [self.stack1View addArrangedSubview:self.titleL];
    [self.stack1View addArrangedSubview:self.imageV];
    [self.stack1View addArrangedSubview:self.descL];
    [self.descL addSubview:descText];
    [self.descL addSubview:descStart];
    
    [self.stack1View mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsMake(9, 9, 9, 9));
        make.left.top.mas_equalTo(10);
        make.right.bottom.mas_equalTo(-10);
    }];
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
//        make..mas_equalTo(kW(30));
        make.left.right.top.mas_equalTo(0);
    }];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleL.mas_bottom).offset(10);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(160);
    }];
    
    [self.descL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageV.mas_bottom).offset(10);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(49);
    }];
    [descText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    [descStart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(descText.mas_right).offset(2);
        make.centerY.mas_equalTo(0);
    }];
    
    

}

- (void)setDict:(NSDictionary *)dict
{
    _dict = dict;
    
    self.titleL.text = [dict objectForKey:@"title"];
    
    self.titleL.hidden = ![[dict objectForKey:@"title"] length];
    
    self.imageV.hidden = [[dict objectForKey:@"img"] intValue];
    
    self.descL.hidden = [[dict objectForKey:@"ad"] intValue];
}

@end
