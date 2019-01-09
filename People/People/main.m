// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>
#import "Person.h"

void CreatePerson(void) {
    Person *fred = [[Person alloc] init];
    
    fred.firstName = @"Fred";
    fred.lastName = @"Smith";
    
//    [fred setFirstName:@"Fred"];
//    [fred setLastName:@"Smith"];
//    
//    fred->_age = 42;
    
    NSLog(@"Class is %@, name is %@", fred.class,  fred.fullName);
    NSLog(@"%@", [fred description]);
    NSLog(@"%@", fred);
    
    [(id)fred bark];
}

void FancyInitializers() {
    Person *sally = [[Person alloc] initWithFirstName:@"Sally" lastName:@"Benson"];
    NSLog(@"firstName: %@, lastName: %@", sally.firstName, sally.lastName);
}

void DoClassClusters() {
    NSString *s1 = [NSString alloc];
//    NSString *s2 = [NSString alloc];
//    NSString *s3 = [NSMutableString alloc];
//    NSArray *a1 = [NSArray alloc];
//    [s1 initWithFormat:@"Hello %@", @"World"];
    
    NSLog(@"%@", s1);
    
    
    NSString *foo = [NSString stringWithContentsOfFile:@"/tmp/XXXXmain.m" encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", foo);
}

int main(int argc, const char * argv[]) {
    CreatePerson();
    DoClassClusters();
    FancyInitializers();
    return 0;
}
