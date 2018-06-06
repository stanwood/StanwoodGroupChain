Pod::Spec.new do |s|
  s.name             = 'StanwoodGroupChain'
  s.version          = '0.1.1'
  s.summary          = 'This is beginning of the GroupChain architecture'


  s.description      = <<-DESC
This is beginning of the GroupChain architecture
                       DESC

  s.homepage         = 'https://github.com/stanwood/StanwoodGroupChain'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tal Zion' => 'tal.zion@stanwood.io' }
  s.source           = { :git => 'https://github.com/stanwood/StanwoodGroupChain.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'StanwoodGroupChain/Classes/**/*'
end
