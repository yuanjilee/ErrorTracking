#
#  Be sure to run `pod spec lint ErrorTracking.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "ErrorTracking"
  s.version      = "0.1"
  s.summary      = "ErrorTracking SDK."
  s.description  = <<-DESC
                    Worktile iOS bug track.
                   DESC

  s.homepage     = "https://github.com/yuanjilee/ErrorTracking"

  s.license          = { :type => 'Copyright', :text => <<-LICENSE
    © 2019 Worktile.com
    LICENSE
  }

  s.author       = { "yuanjilee" => "824528524@qq.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/yuanjilee/ErrorTracking.git", :tag => "#{s.version}" }

  s.source_files = "ErrorTracking.framework/Headers/*.{h}"
  s.vendored_frameworks = 'ErrorTracking.framework'

  s.pod_target_xcconfig = {
        'ARCHS[sdk=iphonesimulator*]' => '$(ARCHS_STANDARD_64_BIT)'
    }
  



end
