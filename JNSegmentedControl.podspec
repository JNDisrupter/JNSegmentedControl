Pod::Spec.new do |s|

s.name         = "JNSegmentedControl"
s.version      = "1.0.0"
s.summary      = "JNSegmentedControl is animated segmented control for iOS applications."
s.description  = "JNSegmentedControl is an easy to use, animated segmented control for iOS written in Swift. JNSegmentedControl supports 3 main styles of segments."
s.homepage     = "https://github.com/JNDisrupter"
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.authors      = { "Jayel Zaghmoutt" => "eng.jayel.z@gmail.com", "Mohammad Nabulsi" => "mohammad.s.nabulsi@gmail.com", "Mohammad Ihmouda" => "mkihmouda@gmail.com" }
s.platform     = :ios
s.platform     = :ios, "9.0"
s.source       = { :path => '.' }
s.source_files = "JNSegmentedControl/**/*.{swift}"
s.resources    = "JNSegmentedControl/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
s.swift_version = "4.2"
end
