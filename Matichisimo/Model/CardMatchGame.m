//
//  CardMatchGame.m
//  Matichisimo
//
//  Created by HUNG YU-TING on 2014/6/13.
//  Copyright (c) 2014年 yt.hung. All rights reserved.
//

#import "CardMatchGame.h"

@interface CardMatchGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Cards

@end

@implementation CardMatchGame

- (NSMutableArray *)cards {

    if (!_cards) {
        _cards = [[NSMutableArray alloc]init];
    } return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {

    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {

    return (index<[self.cards count]) ? self.cards[index] : nil;
}

static const int MATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index {

    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            
            // match against another card
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break; // can only choose two cards for now
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end
