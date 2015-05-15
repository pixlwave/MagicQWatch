class InterfaceController < WKInterfaceController

  def initWithContext(context)
    super

    DataStore.useDirectory(app_group_container)
    @crep = MQ::CREP.new
    
    return self
  end

  def willActivate
    @crep.host = DataStore.valueForKey(:mqip) || "255.255.255.255"
    NSLog "Using host: #{@crep.host}"
  end

  def didDeactivate
    # This method is called when watch view controller is no longer visible
  end

  def enterCommand
    self.presentTextInputControllerWithSuggestions(nil, allowedInputMode: WKTextInputModePlain, completion: lambda { |results| parseSpeech(results) })
  end

  def parseSpeech(results)
    unless results.nil?
      crp = MQ::CRP.parse(results.first)
      crp.each { |c| @crep.send(c) } unless crp.nil?
    end
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
