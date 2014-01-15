//
//  CardMatchingGame.m
//  Card Application
//
//  Created by Jason Paolasini on 2013-07-25.
//  Copyright (c) 2013 Jason Paolasini. All rights reserved.
//

#import "CardMatchingGame.h"


@interface CardMatchingGame();
@property (strong,nonatomic) NSMutableArray* cards;
@property (nonatomic,readwrite) int score;
@property (nonatomic,readwrite) NSArray* matchingCards;
@end


@implementation CardMatchingGame

#define MATCH_BONUS 4
#define MATCH_PENALTY 2
#define FLIP_COST 1

-(NSMutableArray*) cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
    
}

-(id)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if(self)
    {
        for(int i = 0; i <count;i++){
            
            Card *card = [deck drawRandomCard];
            
            if(!card){
                self = nil;
            }
            else{
                self.cards[i] = card;
                
            }
            
        }
        
        
    }
    
    return self;
}

-(Card *) cardAtIndex:(NSUInteger)index
{
    return(index<self.cards.count) ? self.cards[index]:nil;
    
}

-(void)flipCardAtIndex:(NSUInteger)index
{
    
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        if(!card.isFaceUp){
            for(Card *otherCard in self.cards){
                if(otherCard.isFaceUp && !otherCard.isUnplayable){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score +=matchScore * MATCH_BONUS;
                        
                        if(matchScore == 1){
                            self.matchingCards = @[@1,card.contents,otherCard.contents];
                        }
                        else {
                            self.matchingCards = @[@4,card.contents,otherCard.contents];
                            
                        }
                        
                        
                        
                        
                    }
                    else{
                        otherCard.faceUp = NO;
                        self.score -= MATCH_PENALTY;
                        self.matchingCards = @[@0,card.contents,otherCard.contents];
                            
                        
                    }
                    break;
                    
                }
            }
            self.score-=FLIP_COST;
            
        }
        card.faceUp = !card.faceUp;
    }
    
    
}

@end
