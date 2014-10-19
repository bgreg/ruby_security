class AppDelegate
  attr_reader :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    Cve.new.load_short_list do |cve|
      controller = IssuesController.alloc.initWithData(cve)
      @window.rootViewController =
        UINavigationController.alloc.initWithRootViewController(controller)
    end

    @window.makeKeyAndVisible
    true
  end
end
