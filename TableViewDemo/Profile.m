//
//  Profile.m
//  TableViewDemo
//
//  Created by Subash on 12/9/14.
//  Copyright (c) 2014 Subash. All rights reserved.
//

#import "Profile.h"

@implementation Profile

-(id) initWithName: (NSString *) name descriptionOfPerson:(NSString *) description imageName: (NSString *) imageName{
    self = [super init];
    if (self) {
        self.name = name;
        self.descriptionOfPerson = description;
        self.imageName = imageName;
    }
    return self;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@ : %@",self.name, self.descriptionOfPerson];
}
@end
