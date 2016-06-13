#
#  Be sure to run `pod spec lint JXGuideFigure.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
s.name          = "JXGuideFigure"
  s.version       = "0.0.1"
    s.license       = "MIT"
      s.summary       = "Fast confige newer copyright images used on iOS, which implement by Objective-C."
        s.homepage      = "https://github.com/WowJesse/JXGuideFigure"
          s.author        = { "WowJesse" => "1281772704@qq.com" }
            s.source        = { :git => "https://github.com/WowJesse/JXGuideFigure.git", :tag => "0.0.1" }
              s.requires_arc  = true
                s.description   = <<-DESC
                        一句话搞定新版本 引导图 .... .... ..... ...... ...... ..... ..... ..... .....
                                                      DESC
                                                        s.source_files  = "JXGuideFigure/*"
                                                          s.platform      = :ios, '7.0'
                                                            s.framework     = 'Foundation', 'UIKit' 

end
