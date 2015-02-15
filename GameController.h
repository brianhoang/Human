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
    
    IBOutletCollection(UIImageView) NSArray *images;
    
    IBOutlet UIImageView* food;
    
    IBOutlet UILabel* scoreLabel;
    IBOutlet UIButton* startGame;
    
    NSTimer* snakeMovement;
}

-(void)snakeMoving;
-(IBAction)start:(id)sender;
-(void)score;
-(void)placeFood;
-(void)gameOver;
@end
