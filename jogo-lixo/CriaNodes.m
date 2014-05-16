//
//  CriaNodes.m
//  jogo-lixo
//
//  Created by Alessandro Camillo Gimenez de Menezes on 16/05/14.
//  Copyright (c) 2014 Alessandro Camillo Gimenez de Menezes. All rights reserved.
//

#import "CriaNodes.h"


@implementation CriaNodes

+(SKSpriteNode *)lixeiraTipo: (NSString *)material forFrame: (CGRect)frame {
    SKSpriteNode *nodeLixeira;
    if ([material isEqualToString:@"Metal"]) {
        nodeLixeira = [SKSpriteNode spriteNodeWithColor: [UIColor yellowColor] size:CGSizeMake(30, 50)];
        [nodeLixeira setPhysicsBody: [SKPhysicsBody bodyWithRectangleOfSize: nodeLixeira.size ]];
        nodeLixeira.physicsBody.categoryBitMask = lixoMetal;
        nodeLixeira.physicsBody.contactTestBitMask = lixoMetal;
        nodeLixeira.position = CGPointMake(75, frame.size.height/2 +180);
    }
    if ([material isEqualToString:@"Papel"]) {
        nodeLixeira = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(30, 50)];
        [nodeLixeira setPhysicsBody: [SKPhysicsBody bodyWithRectangleOfSize: nodeLixeira.size ]];
        nodeLixeira.physicsBody.categoryBitMask = lixoPapel;
        nodeLixeira.physicsBody.contactTestBitMask = lixoPapel;
        nodeLixeira.position = CGPointMake(75, frame.size.height/2 +60);
    }
    if ([material isEqualToString:@"Vidro"]) {
        nodeLixeira = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(30, 50)];
        [nodeLixeira setPhysicsBody: [SKPhysicsBody bodyWithRectangleOfSize: nodeLixeira.size ]];
        nodeLixeira.physicsBody.categoryBitMask = lixoVidro;
        nodeLixeira.physicsBody.contactTestBitMask = lixoVidro;
        nodeLixeira.position = CGPointMake(75, frame.size.height/2 -60);
    }
    if ([material isEqualToString:@"Plastico"]) {
        nodeLixeira = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(30, 50)];
        [nodeLixeira setPhysicsBody: [SKPhysicsBody bodyWithRectangleOfSize: nodeLixeira.size ]];
        nodeLixeira.physicsBody.categoryBitMask = lixoPlastico;
        nodeLixeira.physicsBody.contactTestBitMask = lixoPlastico;
        nodeLixeira.position = CGPointMake(75, frame.size.height/2 -180);
    }
    nodeLixeira.physicsBody.dynamic = YES;
    nodeLixeira.physicsBody.affectedByGravity = NO;
    nodeLixeira.physicsBody.collisionBitMask = 0; //detecta a colisao mas deixa atravesar
    
    return nodeLixeira;
}


+(SKSpriteNode *)lixoAleatorioNoFrame: (CGRect)frame{
    SKSpriteNode *nodeLixoNovo = [SKSpriteNode spriteNodeWithColor: [UIColor colorWithRed:(arc4random()%255)/255.0
                                                                          green:(arc4random()%255)/255.0
                                                                           blue:(arc4random()%255)/255.0
                                                                          alpha:1.0]
                                                    size: CGSizeMake(30, 50)];
    nodeLixoNovo.position = CGPointMake( (frame.size.width/2 + 75), (frame.size.height + nodeLixoNovo.frame.size.height/2));
    
    [nodeLixoNovo setPhysicsBody: [SKPhysicsBody bodyWithRectangleOfSize: nodeLixoNovo.size ]];
    nodeLixoNovo.physicsBody.dynamic = YES;
    nodeLixoNovo.physicsBody.affectedByGravity = NO;
    switch (arc4random()%4) { //sorteia o tipo de lixo gerado
        case 0:
            nodeLixoNovo.physicsBody.categoryBitMask = lixoMetal;
            //sortearia denovo uma imagem aleatoria deste tipo de lixo;
            break;
        case 1:
            nodeLixoNovo.physicsBody.categoryBitMask = lixoPapel;
            break;
        case 2:
            nodeLixoNovo.physicsBody.categoryBitMask = lixoVidro;
            break;
        case 3:
            nodeLixoNovo.physicsBody.categoryBitMask = lixoPlastico;
            break;
    }
    
    
    return nodeLixoNovo;
}

@end
