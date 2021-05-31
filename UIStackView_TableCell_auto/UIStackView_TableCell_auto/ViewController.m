//
//  ViewController.m
//  UIStackView_TableCell_auto
//
//  Created by Wusu on 2021/5/31.
//


#import "ViewController.h"
#import "stackCell.h"
/* 屏幕宽度 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/* 屏幕高度 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
/** <#属性#> */
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.barTitle = @"测试";
    
    [self addTableView];
    
    [self setupDataSource];
}
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)setupDataSource{
    NSDictionary * dict1 = @{@"title":@"测试1 uistackView 只显示title(用到Masonry + 系统自动算高 + UIStackView)",
                             @"img":@"1",
                             @"ad":@"1",
    };
    NSDictionary * dict2 = @{@"title":@"测试2 uistackView 任意组合 (用到Masonry + 系统自动算高 + UIStackView)",
                             @"img":@"0",
                             @"ad":@"1",
    };
    NSDictionary * dict3 = @{@"title":@"测试3 - 不显示图片 uistackView 任意组合 (用到Masonry + 系统自动算高 + UIStackView)",
                             @"img":@"1",
                             @"ad":@"0",
    };
    NSDictionary * dict4 = @{@"title":@"测试4 - 全显 uistackView 任意组合 (用到Masonry + 系统自动算高 + UIStackView)",
                             @"img":@"0",
                             @"ad":@"0",
    };
    NSDictionary * dict5 = @{@"title":@"测试4 - 全显 下一个 不显示任何东西 uistackView 任意组合 (用到Masonry + 系统自动算高 + UIStackView)",
                             @"img":@"0",
                             @"ad":@"0",
    };
    NSDictionary * dict6 = @{@"title":@"",
                             @"img":@"1",
                             @"ad":@"1",
    };
    
    [self.dataSource addObjectsFromArray:@[dict1,dict2, dict3, dict4,dict5,dict6]];
    [self.tableView reloadData];
  
#warning makr - 用到Masonry + 系统自动算高 + （UIStackView  +  view hidden 属性）
    /**            1.使用 UITableViewAutomaticDimension
                   2.任意显示与隐藏view  而不用多写代码 多行 view 之间不会产生间隙
     */
    
}

#pragma mark - 创建视图
- (void)addTableView {
    // self.view.bounds
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50 , kScreenWidth, kScreenHeight- 50) style:UITableViewStyleGrouped];
//    self.tableView.backgroundColor = [UIColor colorWithHex:@"f6f6f6"];
//    self.tableView.backgroundColor = [UIColor redColor];
    // 除6文件外 背景换
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIView *footView = [[UIView alloc] init];
    footView.frame = CGRectMake(0, 0, kScreenWidth, 10);
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0.01)]; //就是因为这个
//    UIView *headView = [[UIView alloc] init];
//    headView.frame = CGRectMake(0, 0, kScreenWidth, 0);
//  除6文件外 背景换  footView.backgroundColor = [UIColor colorWithHex:@"f6f6f6"];
    self.tableView.tableFooterView = footView;
//    self.tableView.tableHeaderView = headView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.estimatedRowHeight = 44;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;

//    self.tableView.contentInset = UIEdgeInsetsMake(-10, 0, 0, 0);
    
    [self.tableView registerClass:[stackCell class] forCellReuseIdentifier:@"stackCell"];
//    [self.tableView registerClass:[SXZXTest2Cell class] forCellReuseIdentifier:@"SXZXTest2Cell"];
    [self.view addSubview:self.tableView];
//    AdjustsScrollViewInsetNever(self, self.tableView);
}

#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    stackCell * cell = [stackCell cellWithTableView:tableView];
    cell.dict = [self.dataSource objectAtIndex:indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    return UITableViewAutomaticDimension;
//    return [tableView fd_heightForCellWithIdentifier:@"SXZXTest2Cell" configuration:^(SXZXTest2Cell * cell) {
//        cell.dict = [self.dataSource mdf_safeObjectAtIndex:indexPath.row];
//    }];
}

@end
