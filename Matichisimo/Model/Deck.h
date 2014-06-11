//
//  Deck.h
//  Matichisimo
//
//  Created by Hung Yu-Ting on 14/6/11.
//  Copyright (c) 2014年 yt.hung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
