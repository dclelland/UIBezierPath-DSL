//
//  UIBezierPath+DSL.h
//
//  Created by Daniel Clelland on 10/08/15.
//
//  UIBezierPath+DSL provides a simple way to build bezier paths using a psuedo-DSL.
//
//  Inspired by Masonry and TurtleBezierPath:
//  https://github.com/SnapKit/Masonry
//  https://github.com/mindbrix/TurtleBezierPath
//

#import <UIKit/UIKit.h>

@class DSLBezierPathMaker;

@interface UIBezierPath (DSL)

+ (UIBezierPath *)makePath:(void(^)(DSLBezierPathMaker *make))block;

- (UIBezierPath *)makePath:(void(^)(DSLBezierPathMaker *make))block;

@end

static CGFloat DSLDirectionNorth = 1.5 * M_PI;
static CGFloat DSLDirectionNorthEast = 1.75 * M_PI;
static CGFloat DSLDirectionEast = 0.0 * M_PI;
static CGFloat DSLDirectionSouthEast = 0.25 * M_PI;
static CGFloat DSLDirectionSouth = 0.5 * M_PI;
static CGFloat DSLDirectionSouthWest = 0.75 * M_PI;
static CGFloat DSLDirectionWest = 1.0 * M_PI;
static CGFloat DSLDirectionNorthWest = 1.25 * M_PI;

@interface DSLBezierPathMaker : NSObject

@property (readonly) UIBezierPath *bezierPath;

- (instancetype)initWithBezierPath:(UIBezierPath *)bezierPath;

/* Moves */

- (DSLBezierPathMaker *(^)(CGPoint point))moveTo;
- (DSLBezierPathMaker *(^)(CGFloat distance, CGFloat direction))move;
- (DSLBezierPathMaker *(^)(CGFloat distance))moveUp;
- (DSLBezierPathMaker *(^)(CGFloat distance))moveLeft;
- (DSLBezierPathMaker *(^)(CGFloat distance))moveDown;
- (DSLBezierPathMaker *(^)(CGFloat distance))moveRight;

/* Lines */

- (DSLBezierPathMaker *(^)(CGPoint point))lineTo;
- (DSLBezierPathMaker *(^)(CGFloat distance, CGFloat direction))line;
- (DSLBezierPathMaker *(^)(CGFloat distance))lineUp;
- (DSLBezierPathMaker *(^)(CGFloat distance))lineLeft;
- (DSLBezierPathMaker *(^)(CGFloat distance))lineDown;
- (DSLBezierPathMaker *(^)(CGFloat distance))lineRight;

/* Arcs */

- (DSLBezierPathMaker *(^)(CGPoint center, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise))arcAt;

/* Curves */

- (DSLBezierPathMaker *(^)(CGPoint point, CGPoint controlPoint1, CGPoint controlPoint2))curveTo;

/* Quad curves */

- (DSLBezierPathMaker *(^)(CGPoint point, CGPoint controlPoint))quadCurveTo;

/* Translations */

- (DSLBezierPathMaker *(^)(CGAffineTransform transform))transform;
- (DSLBezierPathMaker *(^)(CGPoint point))translate;
- (DSLBezierPathMaker *(^)(CGSize size))scale;
- (DSLBezierPathMaker *(^)(CGFloat angle))rotate;

/* Paths */

- (DSLBezierPathMaker *(^)(UIBezierPath *path))path;

/* Rects */

- (DSLBezierPathMaker *(^)(CGRect rect))rect;
- (DSLBezierPathMaker *(^)(CGPoint center, CGFloat radius))rectAt;

/* Ovals */

- (DSLBezierPathMaker *(^)(CGRect rect))oval;
- (DSLBezierPathMaker *(^)(CGPoint center, CGFloat radius))ovalAt;

/* Rounded rects */

- (DSLBezierPathMaker *(^)(CGRect rect, CGFloat cornerRadius))roundedRect;
- (DSLBezierPathMaker *(^)(CGPoint center, CGFloat radius, CGFloat cornerRadius))roundedRectAt;

/* Closure */

- (DSLBezierPathMaker *(^)(void))close;
- (DSLBezierPathMaker *(^)(void))closed;

@end
