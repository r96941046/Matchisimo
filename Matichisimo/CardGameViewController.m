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
@end

@implementation CardGameViewController

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [ NSString stringWithFormat:@"Flips : %d", self.flipCount ];
    NSLog(@"FlipCount changed to %d", self.flipCount);

}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    PlayingCardDeck *playingCardDeck = [[PlayingCardDeck alloc]init];
    NSString *randomCardContents = [playingCardDeck drawRandomCard].contents;
    
    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardBack"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];   
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"]
                          forState:UIControlStateNormal];
        [sender setTitle:randomCardContents forState:UIControlStateNormal];
    }
    self.flipCount++; // calls both getter and setter
}


@end
