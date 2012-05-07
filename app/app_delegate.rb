class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = Menu.alloc.initWithStyle(UITableViewStyleGrouped)
    @window.rootViewController.wantsFullScreenLayout = false
    @window.makeKeyAndVisible
    
    true
  end
end
