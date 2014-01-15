//
//  PlayingCard.h
//  Card Application
//
//  Created by Jason Paolasini on 2013-07-24.
//  Copyright (c) 2013 Jason Paolasini. All rights reserved.
//

#import "Card.h"
@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
@property (nonatomic) NSString * contents;

@property (nonatomic,readonly) NSUInteger score;


+(NSArray *) validSuits;
+(NSUInteger) maxRank;
@end
