//
//  CardGameViewController.m
//  Card Application
//
//  Created by Jason Paolasini on 2013-07-16.
//  Copyright (c) 2013 Jason Paolasini. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"




@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic,strong) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic,strong) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *gameInteraction;
@property (strong, nonatomic) NSString *information;
@property (strong, nonatomic) NSArray * cardInput;

@end





@implementation CardGameViewController

-(void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
}



-(CardMatchingGame *) game{
    
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc]init]];
    
    return _game;
}




-(void)setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    [self updateUI];
    
    
}


-(void) updateUI{
    
    for(UIButton *cardButton in self.cardButtons){
        
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        
        cardButton.alpha =card.isUnplayable ? 0.3 : 1.0 ;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score:%d",self.game.score];
        
     
        if(card.isFaceUp){
            

            
            NSArray *cardInput = self.game.matchingCards;
        
            
                
             
                if([cardInput[0] isEqual: @1])
                {
                    self.information = [NSString stringWithFormat:@"4 points for matching suits %@ & %@",cardInput[1],cardInput[2]];
                    
                    
                }
                else if ([cardInput[0] isEqual:@4])
                {
                   self.information = [NSString stringWithFormat:@"16 points for matching rank %@ & %@",cardInput[1],cardInput[2]];
                    
                }
                else if([cardInput[0] isEqual:@0]){
                    self.information = [NSString stringWithFormat:@"-2 points, %@ & %@ Don't Match!",cardInput[1],cardInput[2]];
                    
                }
            
            
            
            // sets the label in the game
            
            if (!self.flipCount){
                
                self.gameInteraction.text = @"Make Your First Card Selection";
                
            }
            
            else{
                self.gameInteraction.text = self.information;
            }
            
            
            
        }
    }
                    
}

-(IBAction)flipCard:(UIButton*)sender{
    
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    
    
    self.flipCount++;
    [self updateUI];
    
    
    
}
@end