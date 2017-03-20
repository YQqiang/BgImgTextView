//
//  BgImgTextView.h
//  operation4ios
//
//  Created by sungrow on 2017/3/8.
//  Copyright © 2017年 阳光电源股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BgImgTextView : UIView

/**
 背景图片的名称---(有默认图片'textview-bg')
 */
@property (nonatomic, copy) NSString *bgImgName;

/**
 背景图片
 */
@property (nonatomic, strong) UIImage *bgImg;

/**
 占位文字的内容
 */
@property (nonatomic, copy) NSString *placeholder;

/**
 内容的字体大小
 */
@property (nonatomic, strong) UIFont *font;

/**
 内容
 */
@property (nonatomic, copy) NSString *text;

/**
 是否可以编辑
 */
@property (nonatomic, assign) BOOL editable;

/**
 背景颜色---(默认颜色为透明)
 */
@property (nonatomic, strong) UIColor *backgroundColor;

/**
 内容尺寸的内边距
 */
@property (nonatomic, assign) UIEdgeInsets edgeInsets;

/**
 内容文字颜色
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 设置代理
 */
@property (nonatomic, weak) id<UITextViewDelegate> delegate;

@end
