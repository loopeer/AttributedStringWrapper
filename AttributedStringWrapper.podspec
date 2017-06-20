Pod::Spec.new do |s|

  s.name         = "AttributedStringWrapper"
  s.version      = "1.0.1"
  s.summary      = "A simple packaging for NSAttributedString to make the developers easy to use"

  s.homepage     = "https://github.com/loopeer/AttributedStringWrapper"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.authors            = { "gaoyu" => "gaoyu@loopeer.com" }
  s.social_media_url   = "http://www.jianshu.com/u/c4a4505bef4f"
  s.source       = { :git => "https://github.com/loopeer/AttributedStringWrapper.git", :tag => s.version }
  
  s.source_files  = ["Sources/*.swift", "Sources/AttributedStringWrapper.h"]
  s.public_header_files = ["Sources/AttributedStringWrapper.h"]
    

  s.ios.deployment_target = "8.0"
  s.requires_arc = true
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

end
