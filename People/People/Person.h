#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject

//- (NSString *)firstName;
//- (void)setFirstName:(NSString *)newValue;

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName;

// Designated Initializer
- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              dog:(Dog *)dog;


@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, readonly) NSString *fullName;

@property (nonatomic) NSInteger age;

@property (nonatomic, strong) Dog *dog;

@end
