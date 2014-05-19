//
//  MyScene.m
//  jogo-lixo
//
//  Created by Alessandro Camillo Gimenez de Menezes on 14/05/14.
//  Copyright (c) 2014 Alessandro Camillo Gimenez de Menezes. All rights reserved.
//

#import "MyScene.h"
#import "CriaNodes.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        self.physicsWorld.contactDelegate = self; // TORNA A COLISAO POSIVEL!!! TINHA ESQUECIDO ISSO
        
        [self setPontuacao: [[SKLabelNode alloc] initWithFontNamed:@"Verdana"]];
        
        [self setLixeiraMetal: [CriaNodes lixeiraTipo:@"Metal" forFrame: self.frame]];
        [self setLixeiraPapel: [CriaNodes lixeiraTipo:@"Papel" forFrame: self.frame]];
        [self setLixeiraVidro: [CriaNodes lixeiraTipo:@"Vidro" forFrame: self.frame]];
        [self setLixeiraPlastico: [CriaNodes lixeiraTipo:@"Plastico" forFrame: self.frame] ];

        
        [self addChild: [self lixeiraMetal]];
        [self addChild: [self lixeiraPapel]];
        [self addChild: [self lixeiraVidro]];
        [self addChild: [self lixeiraPlastico]];
        
        
        [self setLixos: [[NSMutableArray alloc] init]];

        //[self addChild: [self lixos]];

        [self animaLixos];
        //[self animaLixosTeste: [NSNumber numberWithInt:2]];
        
    }
    return self;
}

-(void)animaLixos{
    //Produzir Lixos com animacao de movimento!
    //e verifica se ele ja andou pra fora da tela para remove-lo
    
    SKSpriteNode *lixo = [CriaNodes lixoAleatorioNoFrame: self.frame];
    [[self lixos] addObject: lixo];
    [self addChild:lixo];

    for (SKSpriteNode *nodeLixo in [self lixos] ){
        if (nodeLixo.position.y + nodeLixo.size.height/2  < 0) {
            [nodeLixo removeFromParent];
        }
        else{
            [nodeLixo runAction: [SKAction moveBy:CGVectorMake(0, -150) duration:2]];
        }
    }
    [self performSelector:@selector(animaLixos) withObject:nil afterDelay:2];
}

-(void)animaLixosTeste: (NSNumber* )animacao{    
    switch ([animacao intValue]) {
        case 1:
            for (SKSpriteNode *node in [self lixos]){
                [node runAction: [SKAction moveBy:CGVectorMake(0, -100) duration:2]];
                [node runAction: [SKAction rotateByAngle:-(M_PI/2) duration:0.3]];
            }
            break;
        case 2:
            for (SKSpriteNode *node in [self lixos]){
                [node runAction: [SKAction moveBy:CGVectorMake(-100, 0) duration:2]];
                [node runAction: [SKAction rotateByAngle:-(M_PI/2) duration:0.3]];
            }
            break;
        case 3:
            for (SKSpriteNode *node in [self lixos]){
                [node runAction: [SKAction moveBy:CGVectorMake(0, 100) duration:2]];
                [node runAction: [SKAction rotateByAngle:-(M_PI/2) duration:0.3]];
            }
            break;
        case 4:
            for (SKSpriteNode *node in [self lixos]){
                [node runAction: [SKAction moveBy:CGVectorMake(100, 0) duration:2]];
                [node runAction: [SKAction rotateByAngle:-(M_PI/2) duration:0.3]];
            }
            break;
    }

    animacao = [NSNumber numberWithInt:[animacao intValue] + 1];
    if ([animacao intValue] > 4) {
        animacao = [NSNumber numberWithInt:1];
    }
    [self performSelector:@selector(animaLixosTeste:) withObject:animacao afterDelay:2];
}

-(void) didBeginContact:(SKPhysicsContact *)contact{
    SKPhysicsBody *firstBody, *secondBody;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else{
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
//    if((firstBody.categoryBitMask == lixeiraMetal && secondBody.categoryBitMask == lixoMetal) || (firstBody.categoryBitMask == lixoMetal && secondBody.categoryBitMask == lixeiraMetal)){
//        NSLog(@"Colisao entre lixo e lixeira de metal");
//    }
    
    //verifica a colisao foi entre lixo deo tipo metal e a lixeira de metal
    if (firstBody.categoryBitMask == lixeiraMetal) {
        if (secondBody.categoryBitMask == lixoMetal) {
            [secondBody.node removeFromParent];
            
            //da os pontos por ter acertado o lixo de metal
        }
    }
    else{
        if (firstBody.categoryBitMask == lixoMetal) {
            if (secondBody.categoryBitMask == lixeiraMetal) {
                [firstBody.node removeFromParent];
                
                //da os pontos por ter acertado o lixo de metal
            }
        }
    }
    
    //verifica a colisao foi entre lixo deo tipo papel e a lixeira de papel
    if (firstBody.categoryBitMask == lixeiraPapel) {
        if (secondBody.categoryBitMask == lixoPapel) {
            [secondBody.node removeFromParent];
            
            //da os pontos por ter acertado o lixo de papel
        }
    }
    else{
        if (firstBody.categoryBitMask == lixoPapel) {
            if (secondBody.categoryBitMask == lixeiraPapel) {
                [firstBody.node removeFromParent];
                //da os pontos por ter acertado o lixo de papel
            }
        }
    }
    
    //verifica a colisao foi entre lixo deo tipo metal e a lixeira de vidro
    if (firstBody.categoryBitMask == lixeiraVidro) {
        if (secondBody.categoryBitMask == lixoVidro) {
            [secondBody.node removeFromParent];
            //da os pontos por ter acertado o lixo de vidro
        }
    }
    else{
        if (firstBody.categoryBitMask == lixoVidro) {
            if (secondBody.categoryBitMask == lixeiraVidro) {
                [firstBody.node removeFromParent];
                
                //da os pontos por ter acertado o lixo de vidro
            }
        }
    }
    
    //verifica a colisao foi entre lixo deo tipo metal e a lixeira de plastico
    if (firstBody.categoryBitMask == lixeiraPlastico) {
        if (secondBody.categoryBitMask == lixoPlastico) {
            [secondBody.node removeFromParent];
            
            //da os pontos por ter acertado o lixo de plastico
        }
    }
    else{
        if (firstBody.categoryBitMask == lixoPlastico) {
            if (secondBody.categoryBitMask == lixeiraPlastico) {
                [firstBody.node removeFromParent];
                
                //da os pontos por ter acertado o lixo de plastico
            }
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        for (SKSpriteNode *node in [self lixos] ){
            if (CGRectContainsPoint([node frame], location)) {
                [[self lixos] removeObject: node];
                [node removeAllActions];
                [node runAction: [SKAction moveTo:location duration:0.05]];
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
        [[self lixoSelecionado] runAction: [SKAction moveTo:location duration:0.05]];
        //[self lixoSelecionado].position = location;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [[self lixoSelecionado] removeFromParent];
    [[self lixos] removeObject: [self lixoSelecionado]];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
