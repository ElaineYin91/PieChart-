//
//  ViewController.m
//  DrawRectTest
//
//  Created by yinlinlin on 15/11/8.
//  Copyright © 2015年 yinlinlin. All rights reserved.
//

#import "ViewController.h"

#import "ChartViewController.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray * _titles;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self createCircleChart2];
    _titles = @[@"圆环",@"百分比饼图"];
    UITableView * table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, PPScreenWidth, PPScreenHeight - 64) style:UITableViewStylePlain];
    [self.view addSubview:table];
    table.delegate = self;
    table.dataSource = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [_titles objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChartViewController * chart = [[ChartViewController alloc] init];
    ChartType chartType = ChartType_Circle;
    switch (indexPath.row) {
        case 0:
        {
            chartType = ChartType_Circle;
        
        }
            break;
        case 1:
        {
            chartType = ChartType_Parts;
            
        }
            break;
        default:
            break;
    }
    chart.type = chartType;
    [self.navigationController pushViewController:chart animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
