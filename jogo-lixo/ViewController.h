//
//  ViewController.h
//  jogo-lixo
//

//  Copyright (c) 2014 Alessandro Camillo Gimenez de Menezes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface ViewController : UIViewController

@property UIButton *botaoDerp;


+ (ViewController *)sharedViewController;


-(void)jogoTerminou;

@end
