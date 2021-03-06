//
//  PlayingCard.m
//  Card Application
//
//  Created by Jason Paolasini on 2013-07-24.
//  Copyright (c) 2013 Jason Paolasini. All rights reserved.
//

#import "PlayingCard.h"
#import "Card.h"

@implementation PlayingCard
@synthesize suit = _suit;



-(int) match:(NSArray *)otherCards{
    int score = 0;
    
    if (otherCards.count == 1){
        PlayingCard *otherCard = [otherCards lastObject];
        
        if([otherCard.suit isEqualToString:self.suit]){
            
            score = 1;
            
        }
        else if(otherCard.rank == self.rank){
            
            score= 4;
        }
        
    }
    return score;
}



- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


+(NSArray *)rankStrings{
    
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];

}

+(NSArray *)validSuits{
    return @[@"♥",@"♦",@"♣",@"♠"];
}

-(void) setSuit:(NSString *)suit

{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}
+(NSUInteger)maxRank {return [self rankStrings].count-1;}

-(void)setRank:(NSUInteger)rank{
    if (rank<=[PlayingCard maxRank]){
        _rank = rank;
    }
}


@end
