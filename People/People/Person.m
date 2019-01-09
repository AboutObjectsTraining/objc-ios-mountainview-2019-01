// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"
#import "Dog.h"

@implementation Person

// Convenience Initializers
- (instancetype)init {
    return [self initWithFirstName:nil lastName:nil];
}

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName {
    return [self initWithFirstName:firstName lastName:lastName dog:nil];
}

// Designated Initializer
- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              dog:(Dog *)dog
{
    self = [super init];
    if (self == nil) return nil;
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    
    if (_dog == nil) {
        _dog = [[Dog alloc] init];
    }
    
    return self;
}


- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Class is %@, name is %@", self.class, self.fullName];
}


- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.dog;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}

//@synthesize lastName = _lastName;
//@synthesize firstName = _firstName;
//
//- (NSString *)firstName {
//    return _firstName;
//}
//- (void)setFirstName:(NSString *)newValue {
//    _firstName = [newValue copy];
//}

@end
