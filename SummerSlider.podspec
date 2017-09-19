
Pod::Spec.new do |s|
  s.name             = 'SummerSlider'
  s.version          = '0.1.5'
  s.summary          = 'Custom UISlider library '
  s.description      = <<-DESC
TODO: The iOS Custom Slider library that can distinguish the parts where the advertisement of the video player comes out.
                       DESC

  s.homepage         = 'https://github.com/superbderrick/SummerSlider'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SuperbDerrick' => 'kang.derrick@gmail.com' }
  s.source           = { :git => 'https://github.com/superbderrick/SummerSlider.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'SummerSlider/*.swift'
  

end
