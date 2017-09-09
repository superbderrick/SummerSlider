
Pod::Spec.new do |s|
  s.name             = 'SummerSlider'
  s.version          = '0.1.0'
  s.summary          = 'Custom Slider library '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: The iOS Custom Slider library that can distinguish the parts where the advertisement of the video player comes out.
                       DESC

  s.homepage         = 'https://github.com/superbderrick/SummerSlider'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kang.derrick@gmail.com' => 'kang.derrick@gmail.com' }
  s.source           = { :git => 'https://github.com/superbderrick/SummerSlider.git', :tag => s.version.to_s }
  

  s.ios.deployment_target = '8.0'

  s.source_files = 'SummerSlider/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SummerSlider' => ['SummerSlider/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
