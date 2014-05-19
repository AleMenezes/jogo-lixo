//
//  MyScene.h
//  jogo-lixo
//

//  Copyright (c) 2014 Alessandro Camillo Gimenez de Menezes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "MascarasColisao.h"

@interface MyScene : SKScene <SKPhysicsContactDelegate>

@property SKSpriteNode *lixeiraMetal;
@property SKSpriteNode *lixeiraPapel;
@property SKSpriteNode *lixeiraVidro ;
@property SKSpriteNode *lixeiraPlastico;

@property SKLabelNode *pontuacao;

@property SKSpriteNode *lixoSelecionado;

@property NSMutableArray *lixos;


@end
