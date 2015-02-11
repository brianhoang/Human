//
//  GameController.h
//  Human
//
//  Created by Brian Hoang on 1/26/15.
//  Copyright (c) 2015 Brian Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>

int snakeX;
int snakeY;

int foodX;
int foodY;

int currentScore;

BOOL snakeHorizontalMovement;
BOOL snakeBlock4;

NSMutableArray* snakeBody;

@interface GameController : UIViewController
{
    IBOutlet UIImageView* snakeBlock;
    IBOutlet UIImageView* snakeBlock2;
    IBOutlet UIImageView* snakeBlock3;
    
    
    IBOutlet UIImageView* snakeBlock4;
    IBOutlet UIImageView* snakeBlock5;
    IBOutlet UIImageView* snakeBlock6;
    IBOutlet UIImageView* snakeBlock7;
    IBOutlet UIImageView* snakeBlock8;
    
    IBOutlet UIImageView* snakeBlock9;
    IBOutlet UIImageView* snakeBlock10;
    IBOutlet UIImageView* snakeBlock11;
    IBOutlet UIImageView* snakeBlock12;
    IBOutlet UIImageView* snakeBlock13;
    
    IBOutlet UIImageView* snakeBlock14;
    IBOutlet UIImageView* snakeBlock15;
    IBOutlet UIImageView* snakeBlock16;
    IBOutlet UIImageView* snakeBlock17;
    IBOutlet UIImageView* snakeBlock18;
    
    IBOutlet UIImageView* snakeBlock19;
    IBOutlet UIImageView* snakeBlock20;
    IBOutletCollection(UIImageView) NSArray *images;
    
    IBOutlet UIImageView* food;
    
    IBOutlet UILabel* scoreLabel;
    IBOutlet UIButton* startGame;
    
    NSTimer* snakeMovement;
}

-(void)snakeMoving;
-(IBAction)start:(id)sender;
//-(void)score;
-(void)placeFood;

@end
