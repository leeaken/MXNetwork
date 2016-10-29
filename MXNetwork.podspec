Pod::Spec.new do |s|


  s.name         = "MXNetwork"
  s.version      = "0.1.0"
  s.summary      = "MXNetwork 是一个网络组件库"
  s.homepage     = "https://github.com/leeaken/MXNetwork"

  #s.license      = "MIT"
  s.license       = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "aken" => "leearten@sina.com" }
  s.ios.deployment_target = "7.0"
  s.requires_arc = true

  s.source       = { :git => "https://github.com/leeaken/MXNetwork.git", :tag => s.version.to_s }
  
  s.source_files  = "MXNetwork/*.{h,m}"
  #s.exclude_files = 'MXNetwork/Vender'

  s.framework = "CFNetwork"
  #s.dependency "AFNetworking", "~> 3.0"

end
