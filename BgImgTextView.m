//
//  BgImgTextView.m
//  operation4ios
//
//  Created by sungrow on 2017/3/8.
//  Copyright © 2017年 阳光电源股份有限公司. All rights reserved.
//

#import "BgImgTextView.h"
#import "YQTextView.h"

@interface BgImgTextView ()
/** 背景图片 */
@property (nonatomic, strong) UIImageView *imageView;
/** 带有占位文字的textView */
@property (nonatomic, strong) YQTextView *textView;
@property (nonatomic, strong) NSArray *hTxtConstraint;
@property (nonatomic, strong) NSArray *vTxtConstraint;

@end

@implementation BgImgTextView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor cyanColor];
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textView-bg"]];
        [self addSubview:_imageView];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        NSArray *hImgConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-space-[_imageView]-space-|" options:0 metrics:@{@"space": @0} views:NSDictionaryOfVariableBindings(_imageView)];
        
        NSArray *vImgConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-space-[_imageView]-space-|" options:0 metrics:@{@"space": @0} views:NSDictionaryOfVariableBindings(_imageView)];
        
        [self addConstraints:hImgConstraint];
        [self addConstraints:vImgConstraint];
        
        _textView = [[YQTextView alloc] init];
        _textView.translatesAutoresizingMaskIntoConstraints = NO;
        _textView.backgroundColor = [UIColor clearColor];
        [self addSubview:_textView];
        _hTxtConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-space-[_textView]-space-|" options:0 metrics:@{@"space": @0} views:NSDictionaryOfVariableBindings(_textView)];
        
        _vTxtConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-space-[_textView]-space1-|" options:0 metrics:@{@"space": @0, @"space1": @0} views:NSDictionaryOfVariableBindings(_textView)];
        
        [self addConstraints:_hTxtConstraint];
        [self addConstraints:_vTxtConstraint];
        
    }
    return self;
}

#pragma mark - getter
- (NSString *)text {
    return _textView.text;
}

#pragma mark - setter
- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    _textView.placehoder = placeholder;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    _textView.font = font;
}

- (void)setBgImgName:(NSString *)bgImgName {
    _bgImgName = bgImgName;
    UIImage *image = [UIImage imageNamed:bgImgName];
    if (image) {
        UIImage *newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.width / 2, image.size.height / 2, image.size.width/ 2, image.size.height/ 2) resizingMode:UIImageResizingModeStretch];
        _imageView.image = newImage;
    }
}

- (void)setBgImg:(UIImage *)bgImg {
    _bgImg = bgImg;
    _imageView.image = bgImg;
}

- (void)setText:(NSString *)text {
    _textView.text = text;
}

- (void)setEditable:(BOOL)editable {
    _editable = editable;
    _textView.editable = editable;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    _textView.backgroundColor = backgroundColor;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    _textView.textColor = textColor;
}

- (void)setDelegate:(id<UITextViewDelegate>)delegate {
    _delegate = delegate;
    _textView.delegate = delegate;
}

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets {
    _edgeInsets = edgeInsets;
    [self removeConstraints:_hTxtConstraint];
    [self removeConstraints:_vTxtConstraint];
    
    _hTxtConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-space1-[_textView]-space1-|" options:NSLayoutFormatDirectionLeftToRight metrics:@{@"space1": @(edgeInsets.left), @"space2": @(edgeInsets.right)} views:NSDictionaryOfVariableBindings(_textView)];
    
    _vTxtConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-space3-[_textView]-space4-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"space3": @(edgeInsets.top), @"space4": @(edgeInsets.bottom)} views:NSDictionaryOfVariableBindings(_textView)];
    
    [self addConstraints:_hTxtConstraint];
    [self addConstraints:_vTxtConstraint];
}

@end
