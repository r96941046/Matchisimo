//
//  Card.h
//  Matichisimo
//
//  Created by Hung Yu-Ting on 14/6/11.
//  Copyright (c) 2014年 yt.hung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
