//
//  CardMatchingGame.h
//  Card Application
//
//  Created by Jason Paolasini on 2013-07-25.
//  Copyright (c) 2013 Jason Paolasini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
-(id)initWithCardCount:(NSInteger)cardCount usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger) index;
-(Card *)cardAtIndex:(NSUInteger) index;

@property (nonatomic,readonly) int score;
@property (nonatomic,readonly) NSArray *matchingCards;





@end
