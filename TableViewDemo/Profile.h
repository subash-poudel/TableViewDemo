//
//  Profile.h
//  TableViewDemo
//
//  Created by Subash on 12/9/14.
//  Copyright (c) 2014 Subash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property NSString *name;
@property NSString *descriptionOfPerson;
@property NSString *imageName; 
-(id) initWithName: (NSString *) name descriptionOfPerson:(NSString *) description imageName: (NSString *) imageName;
//-(NSString *) description;
@end
