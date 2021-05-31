//
//  stackCell.h
//  UIStackView_TableCell_auto
//
//  Created by Wusu on 2021/5/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface stackCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
/** <#属性#> */
@property (nonatomic, strong) NSDictionary *dict;

@end

NS_ASSUME_NONNULL_END
