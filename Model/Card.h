//
//  Card.h
//  Matchismo
//
//  Created by David Calvert on 2/6/14.
//  Copyright (c) 2014 David Calvert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;

@end
