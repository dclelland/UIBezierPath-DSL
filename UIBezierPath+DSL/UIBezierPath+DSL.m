//
//  UIBezierPath+DSL.m
//
//  Created by Daniel Clelland on 10/08/15.
//

#import "UIBezierPath+DSL.h"

@implementation UIBezierPath (DSL)

#pragma mark - Constructors

+ (UIBezierPath *)makePath:(void(^)(DSLBezierPathMaker *))block
{
    DSLBezierPathMaker *maker = [[DSLBezierPathMaker alloc] initWithBezierPath:[UIBezierPath bezierPath]];
    if (block) {
        block(maker);
    }
    return maker.bezierPath;
}

- (UIBezierPath *)makePath:(void(^)(DSLBezierPathMaker *))block
{
    DSLBezierPathMaker *maker = [[DSLBezierPathMaker alloc] initWithBezierPath:[self copy]];
    if (block) {
        block(maker);
    }
    return maker.bezierPath;
}

@end

@implementation DSLBezierPathMaker

- (instancetype)initWithBezierPath:(UIBezierPath *)bezierPath
{
    self = [self init];
    if (self) {
        _bezierPath = bezierPath;
    }
    return self;
}

#pragma mark - Moves

- (DSLBezierPathMaker *(^)(CGPoint point))moveTo
{
    return ^DSLBezierPathMaker *(CGPoint point) {
        [self.bezierPath moveToPoint:point];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGFloat distance, CGFloat direction))move
{
    return ^DSLBezierPathMaker *(CGFloat direction, CGFloat distance) {
        CGPoint point = CGPointMake(self.bezierPath.currentPoint.x + distance * cos(direction), self.bezierPath.currentPoint.x + distance * sin(direction));
        [self.bezierPath moveToPoint:point];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGFloat distance))moveUp
{
    return ^DSLBezierPathMaker *(CGFloat distance) {
        CGPoint point = CGPointMake(self.bezierPath.currentPoint.x, self.bezierPath.currentPoint.y - distance);
        [self.bezierPath moveToPoint:point];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGFloat distance))moveLeft
{
    return ^DSLBezierPathMaker *(CGFloat distance) {
        CGPoint point = CGPointMake(self.bezierPath.currentPoint.x - distance, self.bezierPath.currentPoint.y);
        [self.bezierPath moveToPoint:point];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGFloat distance))moveDown
{
    return ^DSLBezierPathMaker *(CGFloat distance) {
        CGPoint point = CGPointMake(self.bezierPath.currentPoint.x, self.bezierPath.currentPoint.y + distance);
        [self.bezierPath moveToPoint:point];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGFloat distance))moveRight
{
    return ^DSLBezierPathMaker *(CGFloat distance) {
        CGPoint point = CGPointMake(self.bezierPath.currentPoint.x + distance, self.bezierPath.currentPoint.y);
        [self.bezierPath moveToPoint:point];
        return self;
    };
}

#pragma mark - Lines

- (DSLBezierPathMaker *(^)(CGPoint point))lineTo
{
    return ^DSLBezierPathMaker *(CGPoint point) {
        [self.bezierPath addLineToPoint:point];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGFloat distance, CGFloat direction))line
{
    return ^DSLBezierPathMaker *(CGFloat direction, CGFloat distance) {
        CGPoint point = CGPointMake(self.bezierPath.currentPoint.x + distance * cos(direction), self.bezierPath.currentPoint.x + distance * sin(direction));
        [self.bezierPath addLineToPoint:point];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGFloat distance))lineUp
{
    return ^DSLBezierPathMaker *(CGFloat distance) {
        CGPoint point = CGPointMake(self.bezierPath.currentPoint.x, self.bezierPath.currentPoint.y - distance);
        [self.bezierPath addLineToPoint:point];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGFloat distance))lineLeft
{
    return ^DSLBezierPathMaker *(CGFloat distance) {
        CGPoint point = CGPointMake(self.bezierPath.currentPoint.x - distance, self.bezierPath.currentPoint.y);
        [self.bezierPath addLineToPoint:point];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGFloat distance))lineDown
{
    return ^DSLBezierPathMaker *(CGFloat distance) {
        CGPoint point = CGPointMake(self.bezierPath.currentPoint.x, self.bezierPath.currentPoint.y + distance);
        [self.bezierPath addLineToPoint:point];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGFloat distance))lineRight
{
    return ^DSLBezierPathMaker *(CGFloat distance) {
        CGPoint point = CGPointMake(self.bezierPath.currentPoint.x + distance, self.bezierPath.currentPoint.y);
        [self.bezierPath addLineToPoint:point];
        return self;
    };
}

#pragma mark - Arcs

- (DSLBezierPathMaker *(^)(CGPoint center, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise))arcAt
{
    return ^DSLBezierPathMaker *(CGPoint center, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise) {
        [self.bezierPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
        return self;
    };
}

#pragma mark - Curves

- (DSLBezierPathMaker *(^)(CGPoint point, CGPoint controlPoint1, CGPoint controlPoint2))curveTo
{
    return ^DSLBezierPathMaker *(CGPoint point, CGPoint controlPoint1, CGPoint controlPoint2) {
        [self.bezierPath addCurveToPoint:point controlPoint1:controlPoint1 controlPoint2:controlPoint2];
        return self;
    };
}

#pragma mark - Quad curves

- (DSLBezierPathMaker *(^)(CGPoint point, CGPoint controlPoint))quadCurveTo
{
    return ^DSLBezierPathMaker *(CGPoint point, CGPoint controlPoint) {
        [self.bezierPath addQuadCurveToPoint:point controlPoint:controlPoint];
        return self;
    };
}

#pragma mark - Transformations

- (DSLBezierPathMaker *(^)(CGAffineTransform transform))transform
{
    return ^DSLBezierPathMaker *(CGAffineTransform transform) {
        [self.bezierPath applyTransform:transform];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGPoint point))translate
{
    return ^DSLBezierPathMaker *(CGPoint point) {
        [self.bezierPath applyTransform:CGAffineTransformMakeTranslation(point.x, point.y)];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGSize size))scale
{
    return ^DSLBezierPathMaker *(CGSize size) {
        [self.bezierPath applyTransform:CGAffineTransformMakeScale(size.width, size.height)];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGFloat angle))rotate
{
    return ^DSLBezierPathMaker *(CGFloat angle) {
        [self.bezierPath applyTransform:CGAffineTransformMakeRotation(angle)];
        return self;
    };
}

#pragma mark - Paths

- (DSLBezierPathMaker *(^)(UIBezierPath *path))path
{
    return ^DSLBezierPathMaker *(UIBezierPath *path) {
        [self.bezierPath appendPath:path];
        return self;
    };
}

#pragma mark - Rects

- (DSLBezierPathMaker *(^)(CGRect rect))rect
{
    return ^DSLBezierPathMaker *(CGRect rect) {
        [self.bezierPath appendPath:[UIBezierPath bezierPathWithRect:rect]];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGPoint center, CGFloat radius))rectAt
{
    return ^DSLBezierPathMaker *(CGPoint center, CGFloat radius) {
        CGRect rect = CGRectMake(center.x - radius, center.y - radius, radius * 2.0, radius * 2.0);
        [self.bezierPath appendPath:[UIBezierPath bezierPathWithRect:rect]];
        return self;
    };
}

#pragma mark - Ovals

- (DSLBezierPathMaker *(^)(CGRect rect))oval
{
    return ^DSLBezierPathMaker *(CGRect rect) {
        [self.bezierPath appendPath:[UIBezierPath bezierPathWithOvalInRect:rect]];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGPoint center, CGFloat radius))ovalAt
{
    return ^DSLBezierPathMaker *(CGPoint center, CGFloat radius) {
        CGRect rect = CGRectMake(center.x - radius, center.y - radius, radius * 2.0, radius * 2.0);
        [self.bezierPath appendPath:[UIBezierPath bezierPathWithOvalInRect:rect]];
        return self;
    };
}

#pragma mark - Rounded rects

- (DSLBezierPathMaker *(^)(CGRect rect, CGFloat cornerRadius))roundedRect
{
    return ^DSLBezierPathMaker *(CGRect rect, CGFloat cornerRadius) {
        [self.bezierPath appendPath:[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius]];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(CGPoint center, CGFloat radius, CGFloat cornerRadius))roundedRectAt
{
    return ^DSLBezierPathMaker *(CGPoint center, CGFloat radius, CGFloat cornerRadius) {
        CGRect rect = CGRectMake(center.x - radius, center.y - radius, radius * 2.0, radius * 2.0);
        [self.bezierPath appendPath:[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius]];
        return self;
    };
}

#pragma mark - Closure

- (DSLBezierPathMaker *(^)(void))close
{
    return ^DSLBezierPathMaker *(void){
        [self.bezierPath closePath];
        return self;
    };
}

- (DSLBezierPathMaker *(^)(void))closed
{
    return [self close];
}

@end
