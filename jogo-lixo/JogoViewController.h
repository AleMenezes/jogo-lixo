//
//  JogoViewController.h
//  jogo-lixo
//
//  Created by Alessandro Camillo Gimenez de Menezes on 16/06/14.
//  Copyright (c) 2014 Alessandro Camillo Gimenez de Menezes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface JogoViewController : UIViewController


@property UIButton *botaoDerp;

+(JogoViewController *)sharedJogoViewController;
-(void)jogoTerminou;
-(void)abreJoguinhoManeiro;

@end
