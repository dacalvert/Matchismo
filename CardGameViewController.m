//
//  CardGameViewController.m
//  Matchismo
//
//  Created by David Calvert on 2/5/14.
//  Copyright (c) 2014 David Calvert. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@end

@implementation CardGameViewController

- (Deck *) cardDeck
{
    if (!_cardDeck) {
        _cardDeck = [[PlayingCardDeck alloc]init];
    }
    return _cardDeck;
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flipcount = %d", flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                      forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card *card = [self.cardDeck drawRandomCard];
        if (!card) {
            sender.enabled = NO;
        } else {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:[card contents] forState:UIControlStateNormal];
        }
    }
    self.flipCount++;

}

//- (IBAction)touchCardButton:(UIButton *)sender {
//    
//    if ([sender.currentTitle length]) {
//        UIImage *image = [UIImage imageNamed:@"cardback"];
//        [sender setImage:image forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//    } else {
//        UIImage *image = [UIImage imageNamed:@"cardfront"];
//
//        [sender setImage:image forState:UIControlStateNormal];
//        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
//
//    }
//    NSLog(@"%@",[NSString stringWithFormat: @"Title:%@",[sender titleForState:UIControlStateNormal]]);
//    self.flipCount++;
//}


@end
