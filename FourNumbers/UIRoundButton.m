//
//  UIRoundButton.m
//  OekakiApp
//
//  Created by 村上 晋太郎 on 2014/02/04.
//  Copyright (c) 2014年 村上 晋太郎. All rights reserved.
//

#import "UIRoundButton.h"

@implementation UIRoundButton

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        CGSize size = self.frame.size;
        self.layer.cornerRadius = MIN(size.width, size.height) * 0.5;
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
