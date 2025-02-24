To fix this, avoid modifying observed properties within the setter. Use a separate method or use `willChangeValueForKey:` and `didChangeValueForKey:` to manage KVO manually and break the recursive loop. 

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@end

@implementation MyClass
- (void)setName:(NSString *)newName {
    [self willChangeValueForKey:@