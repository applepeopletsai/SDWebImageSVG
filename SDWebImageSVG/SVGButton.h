//
//  SVGButton.h
//  SDWebImageSVG
//
//  Created by Daniel on 2019/4/9.
//  Copyright © 2019 Daniel. All rights reserved.
//

#import "SVGKFastImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SVGButton : SVGKFastImageView
@property (nonatomic, assign, readonly) UIControlState status;

@property (nonatomic, assign) BOOL selected;
@property (nonatomic, copy) void (^actionHandler)(SVGButton *sender);

@property (nonatomic, copy) NSString *normalImageName;
@property (nonatomic, copy) NSString *selectedImageName;

- (instancetype)initWithFrame:(CGRect)frame normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName acitonHandler:(void(^)(SVGButton *sender))acitonHandler;

- (void)addGestureRecognizerWithTarget:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
