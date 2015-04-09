Pod::Spec.new do |spec|
  spec.name             = 'Dixi'
  spec.version          = '0.1.0'
  spec.license          = { :type => 'MIT' }
  spec.homepage         = 'https://github.com/MihaiDamian/Dixi'
  spec.authors          = { 'Mihai Damian' => 'damianmihairadu@gmail.com' }
  spec.summary          = "Swift operators for autolayout's visual format syntax"
  spec.source           = { :git => 'https://github.com/MihaiDamian/Dixi.git', :tag => spec.version }
  spec.source_files     = 'Dixi/Dixi/**/*.{swift}'
  spec.requires_arc     = true

  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
end