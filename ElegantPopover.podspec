

Pod::Spec.new do |spec|

  spec.name         = "ElegantPopover"
  spec.version      = "1.0.0"
  spec.summary      = "Highly customisable popovers with different shapes, borders, arrow styles and gradient in iOS."
  spec.description  = <<-DESC
  A Cocoapod which can be used to create highly customisable popovers with different shapes, borders, arrow styles and gradient in iOS.
                   DESC
  spec.homepage     = "https://github.com/prasad1120/ElegantPopover"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "Prasad" => "prasadshinde1120@gmail.com" }
  spec.platform     = :ios, "11.0"
  spec.ios.deployment_target = "11.0"
  spec.source       = { :git => "https://github.com/prasad1120/ElegantPopover.git", :tag => "#{spec.version}" }
  spec.source_files  = "ElegantPopover/**/*.{swift}"
  spec.requires_arc = true
  spec.dependency 'ClippingBezier', '1.0.6'
  spec.swift_version = "4.0"

end
