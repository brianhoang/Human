//
//  GameController.m
//  Human
//
//  Created by Brian Hoang on 1/26/15.
//  Copyright (c) 2015 Brian Hoang. All rights reserved.
//

#import "GameController.h"

const uint32_t HEAD_CATEGORY  = 0x1 << 0;
const uint32_t FOOD_CATEGORY  = 0x1 << 1;

int count = 0;
@interface GameController ()

@end

@implementation GameController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    snakeBody = [[NSMutableArray alloc]init];
    //[snakeBody addObject:snakeBlock];
    
   
    for (UIImageView *body in images){
        body.hidden = YES;
    }
    
    [snakeBody addObject:snakeBlock];


    
    //snakeBlock4.hidden = YES;
    snakeBlock5.hidden = YES;

    
    //when view loads up, food will be hidden
    food.hidden = YES;
    
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

-(void)snakeMoving {
    //snakeBlock4.hidden = NO;
   // snakeBlock.center = CGPointMake(snakeBlock.center.x + snakeX, snakeBlock.center.y + snakeY);
    //[snakeBody addObject:snakeBlock];
    
    for (int i = (int)snakeBody.count ; i > 1; i-- ){
        UIImageView* before = [snakeBody objectAtIndex:i-1];
        UIImageView* after = [snakeBody objectAtIndex:i-2];
        before.center = CGPointMake(after.center.x, after.center.y);
    };
        snakeBlock.center = CGPointMake(snakeBlock.center.x + snakeX, snakeBlock.center.y + snakeY);
       // [snakeBody addObject:snakeBlock];

    for (UIImageView *body in snakeBody){
        body.hidden = NO;
    }
    
   // snakeBlock.center = CGPointMake(snakeBlock.center.x + snakeX, snakeBlock.center.y + snakeY);
    
    //if detect collison between head and foo
    if (CGRectIntersectsRect(snakeBlock.frame, food.frame)){
        //replace new food
        [self placeFood];
        count++;
        [snakeBody addObject:[images objectAtIndex:count]];
        
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

-(IBAction)start:(id)sender{
    
    startGame.hidden = YES;
    
    //place food at random position
    [self placeFood];
    food.hidden = NO;
    
    //every 0.3 seconds run snakeMoving
    snakeMovement = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(snakeMoving) userInfo:nil repeats:YES];
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
