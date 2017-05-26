//
//  ChartViewController.m
//  DrawRectTest
//
//  Created by yinlinlin on 2017/5/26.
//  Copyright © 2017年 yinlinlin. All rights reserved.
//

#import "ChartViewController.h"
#import "YLCircleChart.h"
@interface ChartViewController ()
{
    CGFloat _percentage;
    YLCircleChart * _circleChart;
}
@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutUI];
}

- (void)layoutUI {
    if (self.type == ChartType_Circle) {
        [self createCircleChart1];
    } else if (self.type == ChartType_Parts) {
        [self createCircleChart2];
    }
}

- (void)createCircleChart1 {
    _percentage = 0.7;
    _circleChart = [[YLCircleChart alloc] initWithFrame:CGRectMake(0, 100, PPScreenWidth, PPScreenHeight - 64 - 100) startAngle:150 endAngle:390 percentage:_percentage];
    [self.view addSubview:_circleChart];
    
    UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(20, PPScreenWidth + 100, PPScreenWidth - 80, 20)];
    slider.maximumValue = 100;
    slider.minimumValue = 0;
    slider.maximumTrackTintColor = [UIColor lightGrayColor];
    slider.minimumTrackTintColor = [UIColor greenColor];
    slider.value = _percentage * 100;
    [slider addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}


- (void)sliderChange:(UISlider *)sender {
    _percentage = sender.value / 100.0;
    _circleChart.percentage = _percentage;
    [_circleChart setNeedsDisplay];
}

- (void)createCircleChart2 {
    CGFloat total = 0;
    NSMutableArray * dataSource = [NSMutableArray arrayWithCapacity:5];
    NSArray * colors = @[[UIColor redColor], [UIColor grayColor], [UIColor yellowColor], [UIColor purpleColor], [UIColor blueColor], [UIColor brownColor]];
    for (NSInteger i = 0; i < colors.count; i ++ ) {
        YLPartModel * model = [[YLPartModel alloc] init];
        model.color = colors[i];
        model.number = 100 + 50 * i;
        total += model.number;
        model.title = [NSString stringWithFormat:@"Part%zd:%0.1f%%",i,model.number/total*100];
        [dataSource addObject:model];
    }
    _circleChart = [[YLCircleChart alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, self.view.bounds.size.width - 40)  parts:dataSource total:total];
    [self.view addSubview:_circleChart];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
