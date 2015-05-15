# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'MagicQWatch'
  app.icons = ['Icon.png', 'Icon@2x.png', 'Icon@3x.png']
  app.version = '1.0'
  app.identifier = 'com.company.MagicQWatch'
  app.deployment_target = '8.2'
  app.provisioning_profile = 'Development.mobileprovision'
  app.entitlements['com.apple.security.application-groups'] = ['group.com.company.MagicQWatch']

  app.target 'Watch', :extension
end
