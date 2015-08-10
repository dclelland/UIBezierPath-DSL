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

DSLBezierPathMaker : NSObject

```objc : NSObject

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

```
