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
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    [self setBotaoDerp: [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 -50,
                                                                     self.view.frame.size.height/2 -25, 100, 50)]];
    
    [[self botaoDerp] addTarget:self action:@selector(abreJoguinhoManeiro) forControlEvents: UIControlEventTouchUpInside];
    [[self botaoDerp] setTitle:@"click me" forState:UIControlStateNormal];
    
    [self.view addSubview: [self botaoDerp]];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
}
-(void )viewDidAppear:(BOOL)animated{

}


- (BOOL)shouldAutorotate{
    return NO;
}

/**
 *  faz exatamente o que o nome diz
 */
-(void)abreJoguinhoManeiro{    
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;

    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    //trolol
    // Present the scene.
    [skView presentScene:scene];

    [self jogoEmAndamento];
}

/**
 *  quando o jogo comecar a rodar, esconde os elementos da view neste metodo para que eles nao fiquem ativos dirante o jogo
 */
-(void)jogoEmAndamento{
    [self botaoDerp].alpha = 0.0;
}


/**
 *  quando o jogo terminar, mostra novamente os elementos da view.
 *  este metodo teve ter o cabecalho no .h para que seja visivel no singleton
 */
-(void)jogoTerminou{
    [self botaoDerp].alpha = 1.0;
}

- (NSUInteger)supportedInterfaceOrientations{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


/**
 *  metodo para criar singleton deste ViewController
 *
 *  @return o priprio singleton
 */
+(ViewController*)sharedViewController{
    static ViewController *sharedViewController = nil;
    if (!sharedViewController){
        sharedViewController = [[super allocWithZone:nil]init];
    }
    return sharedViewController;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedViewController];
}


@end
