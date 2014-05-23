//
//  ViewController.m
//  jogo-lixo
//
//  Created by Alessandro Camillo Gimenez de Menezes on 14/05/14.
//  Copyright (c) 2014 Alessandro Camillo Gimenez de Menezes. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setBotaoDerp: [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 -50,
                                                                     self.view.frame.size.height/2 -25, 100, 50)]];
    
    [[self botaoDerp] addTarget:self action:@selector(abreJoguinhoManeiro) forControlEvents: UIControlEventTouchUpInside];
    [[self botaoDerp] setTitle:@"click me" forState:UIControlStateNormal];
    
    [self.view addSubview: [self botaoDerp]];
}

-(void )viewDidAppear:(BOOL)animated{
    [self botaoDerp].hidden = NO;
}
-(void)viewWillAppear:(BOOL)animated{
    [self botaoDerp].hidden = NO;
}

- (BOOL)shouldAutorotate{
    return NO;
}

/**
 *  faz exatamente o que o nome diz
 */
-(void)abreJoguinhoManeiro{
    // Configure the view.
    
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;

    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    //trolol
    // Present the scene.
    [skView presentScene:scene];
    [self botaoDerp].hidden = YES;
}

//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    // Configure the view.
//    SKView * skView = (SKView *)self.view;
//    skView.showsFPS = YES;
//    skView.showsNodeCount = YES;
//    
//    // Create and configure the scene.
//    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
//    scene.scaleMode = SKSceneScaleModeAspectFill;
//    //trolol
//    // Present the scene.
//    [skView presentScene:scene];
//}

- (NSUInteger)supportedInterfaceOrientations{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
