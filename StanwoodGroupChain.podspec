Pod::Spec.new do |s|
  s.name             = 'StanwoodGroupChain'
  s.version          = '1.0.2'
  s.summary          = 'GroupChain architecture groups task'


  s.description      = 'GroupChain architecture groups task, and it is managed under the Chain-of-Responsibility design pattern.'

  s.homepage         = 'https://github.com/stanwood/StanwoodGroupChain'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'stanwood' => 'ios.frameworks@stanwood.io' }
  s.source           = { :git => 'https://github.com/stanwood/StanwoodGroupChain.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'

  s.source_files = 'StanwoodGroupChain/Classes/**/*'
end
