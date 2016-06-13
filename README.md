# JXGuideFigure




    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

         self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
         self.window.backgroundColor=[UIColor clearColor];
    
    
          //项目控制器
          
          ViewController *vc = [[ViewController alloc] init];

        //*********  仅仅一句话  就可以自动判断是否是新版本，如果是新版本 则设置数组中的图片作为引导图。
          [JXGuideFigure figureWithImages:@[@"1",@"2",@"3",@"4"] finashMainViewController:vc];
        //*********
    
    
         [self.window makeKeyAndVisible];
          return YES;
    
    
}
