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
        
        
        [self setLixos: [[SKNode alloc] init]];
        [self addChild: [self lixos]];

        [self animaLixos];
        
    }
    return self;
}

-(void)animaLixos{
    //[[self lixos] runAction: [SKAction moveBy:CGVectorMake(0, -150) duration:2]];
    //Produzir Lixos!
    SKSpriteNode *lixo = [SKSpriteNode spriteNodeWithColor: [UIColor colorWithRed:(arc4random()%255)/255.0
                                                                            green:(arc4random()%255)/255.0
                                                                             blue:(arc4random()%255)/255.0
                                                                            alpha:1.0]
                                                      size: CGSizeMake(30, 50)];
    lixo.position = CGPointMake( (self.frame.size.width/2 + 75), (self.frame.size.height + lixo.frame.size.height/2));
    [[self lixos] addChild: lixo];

    
    for (SKSpriteNode *node in [[self lixos] children] ){
        if (node.position.y + node.size.height/2  < 0) {
            [node removeFromParent];
        }
        [node runAction: [SKAction moveBy:CGVectorMake(0, -150) duration:2]];
        
    }
    [self performSelector:@selector(animaLixos) withObject:nil afterDelay:2];
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
    for (SKSpriteNode *node in [[self lixos] children] ){
        [node runAction: [SKAction rotateByAngle:-(M_PI/2) duration:0.3]];
    }

    animacao = [NSNumber numberWithInt:[animacao intValue] + 1];
    if ([animacao intValue] > 4) {
        animacao = [NSNumber numberWithInt:1];
    }
    [self performSelector:@selector(animaLixosTeste:) withObject:animacao afterDelay:2];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        for (SKSpriteNode *node in [[self lixos] children] ){
            if (CGRectContainsPoint([node frame], location)) {
                [node removeAllActions];
                [node removeFromParent];
                [self addChild:node];
                node.position = location;
                [self setLixoSelecionado: node];
                break;
            }
        }
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [self lixoSelecionado].position = location;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
