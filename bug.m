In Objective-C, a subtle bug can occur when using KVO (Key-Value Observing) with custom setters. If a setter modifies other properties, and those properties also have KVO observers, it can lead to unexpected behavior or infinite loops.  Consider this example:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@end

@implementation MyClass
- (void)setName:(NSString *)newName {
    _name = newName;
    self.fullName = [NSString stringWithFormat:@"%@ LastName", newName]; //Modifying fullName here
}

- (void)setFullName:(NSString *)newFullName {
    _fullName = newFullName;
    // ... some other actions ...
}
@end
```

If `fullName` also has KVO observers, changing `name` will trigger the `setName:` method, which then changes `fullName`, triggering its observer, potentially leading to a recursive call and a crash or unexpected behavior. 