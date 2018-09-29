//
//  ViewController.m
//  PixelShader
//
//  Created by Dan Jiang on 2018/9/27.
//  Copyright © 2018年 Dan Jiang. All rights reserved.
//

#import "ViewController.h"
#import "RWTBaseShader.h"

@interface ViewController ()

@property (strong, nonatomic) RWTBaseShader* shader;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Set up context
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    // Set up view
    GLKView *glkView = (GLKView *)self.view;
    glkView.context = context;
    
    // OpenGL ES settings
//    glClearColor(1.f, 0.f, 0.f, 1.f);
    glClearColor(.16f, 0.f, .22f, 1.f);
    
    // Initialize shader
    self.shader = [[RWTBaseShader alloc] initWithVertexShader:@"RWTBase" fragmentShader:@"RWTMoon"];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self.shader renderInRect:rect atTime:self.timeSinceFirstResume];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
