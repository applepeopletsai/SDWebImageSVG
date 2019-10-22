//
//  SVGButton.m
//  SDWebImageSVG
//
//  Created by Daniel on 2019/4/9.
//  Copyright © 2019 Daniel. All rights reserved.
//

#import "SVGButton.h"
#import "SVGKFastImageView.h"

@interface SVGButton ()
@property (nonatomic, strong) SVGKImage *normalImage;
@property (nonatomic, strong) SVGKImage *selectedImage;
@end

@implementation SVGButton

#pragma mark - Public Init Method
- (instancetype)initWithFrame:(CGRect)frame normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName acitonHandler:(void(^)(SVGButton *sender))acitonHandler {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.actionHandler = acitonHandler;
        self.normalImage = [SVGKImage imageNamed:normalImageName];
        self.selectedImage = [SVGKImage imageNamed:selectedImageName];
        self.selected = NO;
        
        [self configureGesture];
    }
    return self;
}

#pragma mark - Public Mehtod
- (void)addGestureRecognizerWithTarget:(id)target action:(SEL)action {
    [self setUserInteractionEnabled:YES];
    
    for (UITapGestureRecognizer *recognizer in self.gestureRecognizers) {
        [self removeGestureRecognizer:recognizer];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}

#pragma mark - Setter
- (void)setSelected:(BOOL)selected {
    [self resetImage:(selected) ? self.selectedImage : self.normalImage];
    _selected = selected;
    _status = (selected) ? UIControlStateSelected : UIControlStateNormal;
}

- (void)setNormalImageName:(NSString *)normalImageName {
    _normalImageName = normalImageName;
    _normalImage = [SVGKImage imageNamed:normalImageName];
    
    if (!self.selected) {
        [self resetImage:_normalImage];
    }
}

- (void)setSelectedImageName:(NSString *)selectedImageName {
    _selectedImageName = selectedImageName;
    _selectedImage = [SVGKImage imageNamed:selectedImageName];
    
    if (self.selected) {
        [self resetImage:_selectedImage];
    }
}

- (void)setActionHandler:(void (^)(SVGButton *sender))actionHandler {
    _actionHandler = actionHandler;
    
    [self configureGesture];
}

#pragma mark - Privete Method
- (void)resetImage:(SVGKImage *)image {
    if (!image) {return;}
    [super setImage:image];
    self.tileRatio = CGSizeZero;
}

- (void)configureGesture {
    if (self.actionHandler) {
        [self setUserInteractionEnabled:YES];

        for (UITapGestureRecognizer *recognizer in self.gestureRecognizers) {
            [self removeGestureRecognizer:recognizer];
        }

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
        [self addGestureRecognizer:tap];
    }
}

- (void)tapGesture {
    if (self.actionHandler) {
        self.actionHandler(self);
    }
}

@end
