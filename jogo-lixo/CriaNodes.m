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
    SKSpriteNode *node;
    if ([material isEqualToString:@"Metal"]) {
        node = [SKSpriteNode spriteNodeWithColor: [UIColor yellowColor] size:CGSizeMake(30, 50)];
        [node setPhysicsBody: [SKPhysicsBody bodyWithRectangleOfSize: node.size ]];
        node.physicsBody.categoryBitMask = lixoMetal;
        node.position = CGPointMake(75, frame.size.height/2 +180);
    }
    if ([material isEqualToString:@"Papel"]) {
        node = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(30, 50)];
        [node setPhysicsBody: [SKPhysicsBody bodyWithRectangleOfSize: node.size ]];
        node.physicsBody.categoryBitMask = lixoPapel;
        node.position = CGPointMake(75, frame.size.height/2 +60);
    }
    if ([material isEqualToString:@"Vidro"]) {
        node = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(30, 50)];
        [node setPhysicsBody: [SKPhysicsBody bodyWithRectangleOfSize: node.size ]];
        node.physicsBody.categoryBitMask = lixoVidro;
        node.position = CGPointMake(75, frame.size.height/2 -60);
    }
    if ([material isEqualToString:@"Plastico"]) {
        node = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(30, 50)];
        [node setPhysicsBody: [SKPhysicsBody bodyWithRectangleOfSize: node.size ]];
        node.physicsBody.categoryBitMask = lixoPlastico;
        node.position = CGPointMake(75, frame.size.height/2 -180);
    }
    
    node.physicsBody.collisionBitMask = 0;
    
    return node;
}


+(SKSpriteNode *)lixoAleatorioNoFrame: (CGRect)frame{
    SKSpriteNode *node = [SKSpriteNode spriteNodeWithColor: [UIColor colorWithRed:(arc4random()%255)/255.0
                                                                          green:(arc4random()%255)/255.0
                                                                           blue:(arc4random()%255)/255.0
                                                                          alpha:1.0]
                                                    size: CGSizeMake(30, 50)];
    node.position = CGPointMake( (frame.size.width/2 + 75), (frame.size.height + frame.size.height/2));
    
    
    return node;
}

@end
