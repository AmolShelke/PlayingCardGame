//
//  ViewController.h
//  playingCard
//
//  Created by Student P_04 on 14/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *firstScoreLabel;

- (IBAction)cardButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button1;

@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;

@property (weak, nonatomic) IBOutlet UILabel *secondScoreLabel;
@property int min,max;
@property int counter;

@property int player1done,player2done;
@property int isSequence,isTeenPatti,isSequence1,isTeenPatti1;

@end

