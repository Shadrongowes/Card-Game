//
//  Deck.h
//  Card Application
//
//  Created by Jason Paolasini on 2013-07-16.
//  Copyright (c) 2013 Jason Paolasini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(void)addCard:(Card *)card atTop:(BOOL) atTop;
-(Card *)drawRandomCard;


@end
