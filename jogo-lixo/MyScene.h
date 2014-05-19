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

@property NSMutableArray *lixos;
@property SKSpriteNode *lixoSelecionado;

@property SKLabelNode *labelPontuacao;
@property int valorPontuacao;

@property BOOL lixoSendoSegurado;

@end
