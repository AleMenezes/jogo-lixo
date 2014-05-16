//
//  MyScene.h
//  jogo-lixo
//

//  Copyright (c) 2014 Alessandro Camillo Gimenez de Menezes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

static const uint32_t lixoMetal = 0x1 << 0;
static const uint32_t lixoPapel = 0x1 << 1;
static const uint32_t lixoVidro = 0x1 << 2;
static const uint32_t lixoPlastico = 0x1 << 3;

@interface MyScene : SKScene

@property SKSpriteNode *lixeiraMetal;
@property SKSpriteNode *lixeiraPapel;
@property SKSpriteNode *lixeiraVidro ;
@property SKSpriteNode *lixeiraPlastico;

@property SKSpriteNode *lixoSelecionado;
//@property SKSpriteNode *lixo1;
//@property SKSpriteNode *lixo2;
//@property SKSpriteNode *lixo3;
//@property SKSpriteNode *lixo4;
//@property SKSpriteNode *lixo5;
//@property SKSpriteNode *lixo6;

@property SKNode *lixos;


@end
