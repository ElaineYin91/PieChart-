//
//  public.h
//  DrawRectTest
//
//  Created by yinlinlin on 2017/5/26.
//  Copyright © 2017年 yinlinlin. All rights reserved.
//

#ifndef public_h
#define public_h

#import <UIKit/UIKit.h>
typedef enum ChartType : NSInteger {
    ChartType_Circle,
    ChartType_Parts,
}ChartType;



#define PPScreenWidth           [UIScreen mainScreen].bounds.size.width
#define PPScreenHeight          [UIScreen mainScreen].bounds.size.height

#endif /* public_h */
