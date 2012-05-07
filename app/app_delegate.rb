class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController Menu.alloc.initWithStyle(UITableViewStyleGrouped)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    
    true
  end
end
