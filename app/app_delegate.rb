class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    DataStore.useDirectory(app_group_container)
    DataStore.storeValue("10.255.255.255", forKey: :mqip) if DataStore.valueForKey(:mqip).nil?

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @storyboard = UIStoryboard.storyboardWithName("Storyboard", bundle: nil)
    @window.rootViewController = @storyboard.instantiateInitialViewController
    @window.makeKeyAndVisible

    true
  end

  def app_group_container
    if (UIDevice.currentDevice.model =~ /simulator/i).nil?  # device
      dir = NSFileManager.defaultManager.containerURLForSecurityApplicationGroupIdentifier("group.com.company.MagicQWatch").path
    else   # simulator workaround with hard coded path
      dev_container = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).last.stringByDeletingLastPathComponent.stringByDeletingLastPathComponent.stringByDeletingLastPathComponent.stringByDeletingLastPathComponent
      dir = dev_container.stringByAppendingPathComponent("Shared").stringByAppendingPathComponent("AppGroup").stringByAppendingPathComponent("407A2697-2DE6-4B2F-B1A2-5C78394FB026")
      Dir.mkdir(dir) unless Dir.exist?(dir)
      
      dir
    end
  end
end
