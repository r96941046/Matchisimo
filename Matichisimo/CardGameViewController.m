//
//  CardGameViewController.m
//  Matichisimo
//
//  Created by HUNG YU-TING on 2014/6/11.
//  Copyright (c) 2014年 yt.hung. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController

- (Deck *)deck {
    
    if (!_deck) {
        _deck = [self createDeck];
    } return _deck;

}

- (Deck *)createDeck {
    
    return [[PlayingCardDeck alloc]init];
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [ NSString stringWithFormat:@"Flips : %d", self.flipCount ];
    NSLog(@"FlipCount changed to %d", self.flipCount);

}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardBack"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];   
    } else {
        Card *randomCard = [self.deck drawRandomCard];
        if (randomCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"]
                              forState:UIControlStateNormal];
            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
        }
      
    }
    self.flipCount++; // calls both getter and setter
}


@end
