//
//  Card.m
//  Matichisimo
//
//  Created by Hung Yu-Ting on 14/6/11.
//  Copyright (c) 2014年 yt.hung. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards {
    
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
