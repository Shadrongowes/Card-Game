//
//  Card.h
//  Card Application
//
//  Created by Jason Paolasini on 2013-07-24.
//  Copyright (c) 2013 Jason Paolasini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic,strong) NSString *contents;
@property (nonatomic,getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;
-(int) match:(NSArray *) otherCards;
@end
