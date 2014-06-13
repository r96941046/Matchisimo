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

@end
