//
//  GameController.m
//  Human
//
//  Created by Brian Hoang on 1/26/15.
//  Copyright (c) 2015 Brian Hoang. All rights reserved.
//

#import "GameController.h"


int count = 0;

@interface GameController ()

@end

@implementation GameController

- (void)viewDidLoad {
    [super viewDidLoad];
    


    //creates an mutable array
    snakeBody = [[NSMutableArray alloc]init];
    
    //add head to snakebody
    [snakeBody addObject:snakeBlock];

    //makes all imageview in outlet collection hidden
    for (UIImageView *body in images){
        body.hidden = YES;
    }
    
    restart.hidden = YES;
    
    //when view loads up, food will be hidden
    food.hidden = YES;
    
        snakeMovement = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(snakeMoving) userInfo:nil repeats:YES];
    
    
    // Do any additional setup after loading the view.
    snakeX = 30;
    snakeY = 0;
    snakeHorizontalMovement = YES;
    
    //if we swipe left run method moveleft
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveLeft)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveUp)];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveDown)];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipeDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)snakeMoving{
    
    //happens every .3 seconds
    //iterates through array moving the body
    if(moving == YES){
    for (int i = (int)snakeBody.count ; i > 1; i-- ){
        UIImageView* before = [snakeBody objectAtIndex:i-1];
        UIImageView* after = [snakeBody objectAtIndex:i-2];
        before.center = CGPointMake(after.center.x, after.center.y);
    };
        //updates head
        snakeBlock.center = CGPointMake(snakeBlock.center.x + snakeX, snakeBlock.center.y + snakeY);

    //makes body not hidden
    for (UIImageView *body in snakeBody){
        body.hidden = NO;
    }
    
    //if detect collison between head and foo
    if (CGRectIntersectsRect(snakeBlock.frame, food.frame)){
        //replace new food
        [self placeFood];
        count++;
        //adds another body segment 
        [snakeBody addObject:[images objectAtIndex:count]];
        //update scores
        [self score];
    }
     
    //sets boundaries for outer border
    if (snakeBlock.center.x < 20 || snakeBlock.center.x > 634 || snakeBlock.center.y < 37 || snakeBlock.center.y > 337)
    {
        [self gameOver];
    }
        
  }
}

-(void)moveLeft {
    if (snakeHorizontalMovement == NO){
        snakeX = -30;
        snakeY = 0;
        snakeHorizontalMovement = YES;
    }
}

-(void)moveRight {
    if (snakeHorizontalMovement == NO){
        snakeX = 30;
        snakeY = 0;
        snakeHorizontalMovement = YES;
    }
}

-(void)moveUp {
    if (snakeHorizontalMovement == YES){
        snakeX = 0;
        snakeY = -30;
        snakeHorizontalMovement = NO;
    }
}


-(void)moveDown {
    if (snakeHorizontalMovement == YES){
        snakeX = 0;
        snakeY = 30;
        snakeHorizontalMovement = NO;
    }
}


-(void)placeFood {
    
    foodX = arc4random() % 586; //min x = 40, max x = 625, took difference
    foodX = foodX + 40; //when random number retruns < 40
    
    foodY = arc4random() % 310; //y = 20, y max = 330
    foodY = foodY + 20;
    
    food.center = CGPointMake(foodX, foodY);
}

-(void)score
{
    scoreLabel.text = [NSString stringWithFormat:@"Score: %i", count];
}

-(void)gameOver
{
    restart.hidden = NO;
    moving = NO;
   // [snakeBody removeAllObjects];

    [self newGame];
    
}

-(void)newGame
{
    startGame.hidden = NO;
}

-(IBAction)start:(id)sender{
    
    count = 0;
    [self score];
    restart.hidden = YES;
    //start snake movement
    moving = YES;

    snakeBlock.center = CGPointMake(304, 157);
    
    //place food at random position
    [self placeFood];
    food.hidden = NO;
    
    //every 0.3 seconds run snakeMoving
    [snakeBody removeAllObjects];
    snakeBlock.center = CGPointMake(304, 157);
    startGame.hidden = YES;
    for (UIImageView* img in images){
        img.hidden = YES;
    }
    [snakeBody addObject:snakeBlock];

    snakeX = 30;
    snakeY = 0;

    snakeHorizontalMovement = YES;

    

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
