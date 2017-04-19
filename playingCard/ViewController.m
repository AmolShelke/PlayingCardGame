//
//  ViewController.m
//  playingCard
//
//  Created by Student P_04 on 14/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.player1done=0;
    self.player2done=0;
    
    
    self.min=2;
    self.max=14;
    self.counter=0;
    
    self.button1.tag=0;
    self.button2.tag=0;
    self.button3.tag=0;
    self.button4.tag=0;
    self.button5.tag=0;
    self.button6.tag=0;
    
}
-(void)reset
{
    [self.firstScoreLabel setText:@""];
    [self.secondScoreLabel setText:@""];
    
    UIImage *imv=[UIImage imageNamed:@"back"];
    
    [self.button1 setBackgroundImage:imv forState:UIControlStateNormal];
    
    [self.button2 setBackgroundImage:imv forState:UIControlStateNormal];
    
    [self.button3 setBackgroundImage:imv forState:UIControlStateNormal];
    
    [self.button4 setBackgroundImage:imv forState:UIControlStateNormal];
    
    [self.button5 setBackgroundImage:imv forState:UIControlStateNormal];
    
    [self.button6 setBackgroundImage:imv forState:UIControlStateNormal];
    
    
    [self.button1 setTitle:@"1" forState:UIControlStateNormal];
    [self.button2 setTitle:@"1" forState:UIControlStateNormal];
    [self.button3 setTitle:@"1" forState:UIControlStateNormal];
    [self.button4 setTitle:@"1" forState:UIControlStateNormal];
    [self.button5 setTitle:@"1" forState:UIControlStateNormal];
    [self.button6 setTitle:@"1" forState:UIControlStateNormal];
    
}
-(void)playAgain
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"" message:@"Play Again?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
        }];
    
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            nil;
        [self viewDidLoad];
        [self reset];
        }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:^{
            nil;
        }];
        

}
-(void)ShowWinner
{
    NSString *msg;
    if(self.isTeenPatti && self.isTeenPatti1)
    {
        NSInteger firstCardtag=self.button1.tag;
        NSInteger secondCardtag=self.button4.tag;
        if(firstCardtag==1)
        {
            msg=@"Player 1 Winner";
        }
        else if(secondCardtag==1)
        {
            msg=@"Player 2 Winner";
        }
        else if(firstCardtag > secondCardtag)
        {
            msg=@"Player 1 Winner";
        }
        else
        {
            msg=@"Player 2 Winner";
        }
    }
    else if (self.isTeenPatti)
    {
        msg=@"Player 1 Winner";
    }
    else if(self.isTeenPatti1)
    {
        msg=@"Player 2 Winner";
    }
    else if(self.isSequence && self.isSequence1)
    {
        NSInteger firstplayer,secondplayer;
        firstplayer=self.button1.tag+self.button2.tag+self.button3.tag;
        secondplayer=self.button4.tag+self.button5.tag+self.button6.tag;
        
        if(firstplayer==6)
        {
            msg=@"Player 1 Winner";
        }
        else if(secondplayer==6)
        {
            msg=@"Player 2 Winner";
        }
        else if(firstplayer > secondplayer)
        {
            msg=@"Player 1 Winner";
        }
        else
        {
            msg=@"Player 2 Winner";
        }
    }
    else if (self.isSequence)
    {
        msg=@"Player 1 Winner";
    }
    else if (self.isSequence1)
    {
        msg=@"Player 2 Winner";
    }
    else
    {
        //random cards
        NSInteger player1,player2;
        if(self.button1.tag > self.button2.tag && self.button1.tag >self.button3.tag)
        {
            player1=self.button1.tag;
        }
        else if (self.button2.tag > self.button1.tag && self.button2.tag >self.button3.tag)
        {
            player1=self.button2.tag;

        }
        else
        {
            player1=self.button3.tag;
        }
        
        
        if(self.button4.tag > self.button5.tag && self.button4.tag >self.button6.tag)
        {
            player2=self.button4.tag;
        }
        else if (self.button5.tag > self.button4.tag && self.button5.tag >self.button6.tag)
        {
            player2=self.button5.tag;
            
        }
        else
        {
            player2=self.button6.tag;
        }
        
        
        if(player1 >player2)
        {
            msg=@"Player 1 Winner";
        }
        else
        {
            msg=@"Player 2 Winner";
        }
        
    }
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Winner!!!!!!!" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
        
        [self playAgain];
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:^{
        nil;
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(int)TeenPatti:(NSInteger)a andSecondCardButton:(NSInteger)b andThirdCardButton:(NSInteger)c
{
    int sucess=0;
    //a=1,b=1,c=1;
    if(a==b && a==c)
    {
        sucess=1;
    }
    return sucess;
}
-(int)Sequence:(NSInteger)a andSecondCardButton:(NSInteger)b andThirdCardButton:(NSInteger)c
{
    int sucess=0;
    NSInteger p,q,r;
    p=a,q=b,r=c;
    
    if(p>q && p>r)
    {
        NSInteger t=p-1;
        if(t==q || t==r)
        {
            t=t-1;
            if(t==q || t==r)
            {
                sucess=1;
            }
        }
    }
    else if(q>p && q>r)
    {
        NSInteger t=q-1;
        if(t==p || t==r)
        {
            t=t-1;
            if(t==p || t==r)
            {
                sucess=1;
            }
        }
    }
    else
    {
        NSInteger t=r-1;
        if(t==p || t==q)
        {
            t=t-1;
            if(t==p || t==q)
            {
                sucess=1;
            }
        }
    }
    return sucess;

}

- (IBAction)cardButton:(id)sender
{
    UIButton *button=sender;
     //int isSequence=0,isTeenPatti=0,isSequence1=0,isTeenPatti1=0;
    //int player1done=0,player2done=0;
    
    CGFloat height=button.frame.size.height;
    NSLog(@"Height%lf",height);
    int ran=rand() % self.max - self.min + self.min;
    NSLog(@"%d",ran);
    
 if(![button.titleLabel.text isEqualToString:@"y"])
 {
     [button setTitle:@"y" forState:UIControlStateNormal];

    if(ran==1)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"A.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=1;
    }
    else if(ran==2)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=2;
    }
    else if(ran==3)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=3;
    }
    else if(ran==4)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=4;
    }
    else if(ran==5)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"5.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=5;
    }
    else if(ran==6)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"6.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=6;
    }
    else if(ran==7)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"7.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=7;
    }
    else if(ran==8)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"8.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=8;
    }
    else if(ran==9)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"9.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=9;
    }
    else if(ran==10)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"10.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=10;
    }
    else if(ran==11)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Q.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=11;
    }
    else if(ran==12)
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"j.png"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=12;
    }
    else
    {
        UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"k.jpeg"]];
        [button setBackgroundImage:imv.image forState:UIControlStateNormal];
        self.counter++;
        button.tag=13;
    }
     
     if(self.button1.tag!=0 && self.button2.tag!=0 &&self.button3.tag!=0)
     {
         self.player1done=1;
         NSInteger b1=self.button1.tag;
         NSInteger b2=self.button2.tag;
         NSInteger b3=self.button3.tag;
         
         
         self.isTeenPatti=[self TeenPatti:b1 andSecondCardButton:b2 andThirdCardButton:b3];
         if(self.isTeenPatti)
         {
             [self.firstScoreLabel setText:@"TeenPatti"];
         }
         else
         {
             self.isSequence=[self Sequence:b1 andSecondCardButton:b2 andThirdCardButton:b3];
             
             if(self.isSequence)
             {
                 [self.firstScoreLabel setText:@"Sequence"];
             }
             else
             {
                 [self.firstScoreLabel setText:@"Random cards"];
             }
         }
         
     }
     
  if(self.button4.tag!=0 && self.button5.tag!=0 &&self.button6.tag!=0)
    {
        self.player2done=1;
        NSInteger b4=self.button4.tag;
        NSInteger b5=self.button5.tag;
        NSInteger b6=self.button6.tag;
        
        
        self.isTeenPatti1=[self TeenPatti:b4 andSecondCardButton:b5 andThirdCardButton:b6];
        
        if(self.isTeenPatti1)
        {
            [self.secondScoreLabel setText:@"TeenPatti"];
        }
        else
        {
         self.isSequence1=[self Sequence:b4 andSecondCardButton:b5 andThirdCardButton:b6];
            if(self.isSequence1)
            {
                [self.secondScoreLabel setText:@"Sequence"];
            }
            else
            {
                 [self.secondScoreLabel setText:@"Random Cards"];
            }
        }
        
    }
     if(self.player1done==1 && self.player2done==1)
     {
         [self ShowWinner];
     }
     
 }
 
}
@end
