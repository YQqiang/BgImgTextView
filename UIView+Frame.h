//
//  UIView+Frame.h
//  operation4ios
//
//  Created by sungrow on 2017/3/8.
//  Copyright © 2017年 阳光电源股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/** 控件大小 */
@property (nonatomic,assign)CGSize size;
/** 宽度 */
@property (nonatomic,assign)CGFloat width;
/** 高度 */
@property (nonatomic,assign)CGFloat height;
/** x值 */
@property (nonatomic,assign)CGFloat x;
/** y值 */
@property (nonatomic,assign)CGFloat y;

@end
