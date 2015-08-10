# UIBezierPath+DSL

UIBezierPath+DSL provides a simple way to build bezier paths using a psuedo-DSL.

### Examples:

```objc
/* Examples go here */
```

### Full API:

UIBezierPath (DSL)

```objc
+ (UIBezierPath *)makePath:(void(^)(DSLBezierPathMaker *make))block;

- (UIBezierPath *)makePath:(void(^)(DSLBezierPathMaker *make))block;
```

DSLBezierPathMaker

```objc
.moveTo(CGPoint point);
.move(CGFloat distance, CGFloat direction);
.moveUp(CGFloat distance);
.moveLeft(CGFloat distance);
.moveDown(CGFloat distance);
.moveRight(CGFloat distance);

.lineTo(CGPoint point);
.line(CGFloat distance, CGFloat direction);
.lineUp(CGFloat distance);
.lineLeft(CGFloat distance);
.lineDown(CGFloat distance);
.lineRight(CGFloat distance);

.arcAt(CGPoint center, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise);

.curveTo(CGPoint point, CGPoint controlPoint1, CGPoint controlPoint2);

.quadCurveTo(CGPoint point, CGPoint controlPoint);

.transform(CGAffineTransform transform);
.translate(CGPoint point);
.scale(CGSize size);
.rotate(CGFloat angle);

.path(UIBezierPath *path);

.rect(CGRect rect);
.rectAt(CGPoint center, CGFloat radius);

.oval(CGRect rect);
.ovalAt(CGPoint center, CGFloat radius);

.roundedRect(CGRect rect, CGFloat cornerRadius);
.roundedRectAt(CGPoint center, CGFloat radius, CGFloat cornerRadius);

.close();
.closed();
```
