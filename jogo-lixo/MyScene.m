//
//  MyScene.m
//  jogo-lixo
//
//  Created by Alessandro Camillo Gimenez de Menezes on 14/05/14.
//  Copyright (c) 2014 Alessandro Camillo Gimenez de Menezes. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        [self setLixeiraMetal: [SKSpriteNode spriteNodeWithColor: [UIColor yellowColor] size:CGSizeMake(30, 50)]];
        [self lixeiraMetal].position = CGPointMake(75, self.frame.size.height/2 +180);
        [self setLixeiraPapel: [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(30, 50)]];
        [self lixeiraPapel].position = CGPointMake(75, self.frame.size.height/2 +60);
        [self setLixeiraVidro: [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(30, 50)]];
        [self lixeiraVidro].position = CGPointMake(75, self.frame.size.height/2 -60);
        [self setLixeiraPlastico: [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(30, 50)] ];
        [self lixeiraPlastico].position = CGPointMake(75, self.frame.size.height/2 -180);
        
        [self addChild: [self lixeiraMetal]];
        [self addChild: [self lixeiraPapel]];
        [self addChild: [self lixeiraVidro]];
        [self addChild: [self lixeiraPlastico]];
        
        
        [self setLixo1: [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(30, 50)]];
        [self lixo1].position = CGPointMake(self.frame.size.width/2 + 75, self.frame.size.height/2 +300);
        [self setLixo2: [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(30, 50)]];
        [self lixo2].position = CGPointMake(self.frame.size.width/2 + 75, self.frame.size.height/2 +180);
        [self setLixo3: [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(30, 50)]];
        [self lixo3].position = CGPointMake(self.frame.size.width/2 + 75, self.frame.size.height/2 +60);
        [self setLixo4: [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(30, 50)]];
        [self lixo4].position = CGPointMake(self.frame.size.width/2 + 75, self.frame.size.height/2 -60);
        [self setLixo5: [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(30, 50)]];
        [self lixo5].position = CGPointMake(self.frame.size.width/2 + 75, self.frame.size.height/2 -180);
        [self setLixo6: [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(30, 50)]];
        [self lixo6].position = CGPointMake(self.frame.size.width/2 + 75, self.frame.size.height/2 -300);
        
        
        [self setLixos: [[SKNode alloc] init]];
        
        [[self lixos] addChild: [self lixo1]];
        [[self lixos] addChild: [self lixo2]];
        [[self lixos] addChild: [self lixo3]];
        [[self lixos] addChild: [self lixo4]];
        [[self lixos] addChild: [self lixo5]];
        [[self lixos] addChild: [self lixo6]];
        
        [self addChild: [self lixos]];
        
        [self animaLixosTeste: [NSNumber numberWithInt:1]];
        
    }
    return self;
}

-(void)animaLixos{
    [[self lixos] runAction: [SKAction moveBy:CGVectorMake(0, -150) duration:2]];

}



-(void)animaLixosTeste: (NSNumber* )animacao{
    
    switch ([animacao intValue]) {
        case 1:
            [[self lixos] runAction: [SKAction moveBy:CGVectorMake(0, -100) duration:2]];
            break;
        case 2:
            [[self lixos] runAction: [SKAction moveBy:CGVectorMake(-100, 0) duration:2]];
            break;
        case 3:
            [[self lixos] runAction: [SKAction moveBy:CGVectorMake(0, 100) duration:2]];
            break;
        case 4:
            [[self lixos] runAction: [SKAction moveBy:CGVectorMake(100, 0) duration:2]];
            break;
    }
    [[self lixo1] runAction: [SKAction rotateByAngle:-(M_PI/2) duration:0.3]];
    [[self lixo2] runAction: [SKAction rotateByAngle:-(M_PI/2) duration:0.3]];
    [[self lixo3] runAction: [SKAction rotateByAngle:-(M_PI/2) duration:0.3]];
    [[self lixo4] runAction: [SKAction rotateByAngle:-(M_PI/2) duration:0.3]];
    [[self lixo5] runAction: [SKAction rotateByAngle:-(M_PI/2) duration:0.3]];
    [[self lixo6] runAction: [SKAction rotateByAngle:-(M_PI/2) duration:0.3]];
    
    animacao = [NSNumber numberWithInt:[animacao intValue] + 1];
    if ([animacao intValue] > 4) {
        animacao = [NSNumber numberWithInt:1];
    }
    [self performSelector:@selector(animaLixosTeste:) withObject:animacao afterDelay:2];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        sprite.position = location;
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        [self addChild:sprite];
//    }

    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
