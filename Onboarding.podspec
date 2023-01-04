Pod::Spec.new do |s|
  s.name             = 'Onboarding'
  s.version          = '1.1.0'
  s.summary          = 'Project\'s "Onboarding" module.'
  s.homepage         = 'https://github.com/htmlprogrammist/Onboarding'
  s.author           = { 'htmlprogrammist' => '60363270+htmlprogrammist@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/iCookbook/Onboarding.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.source_files = 'Onboarding/Sources/**/*.{swift}'
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Onboarding/Tests/**/*.{swift}'
  end
  
  s.dependency 'Resources'
  s.dependency 'CommonUI'
  s.dependency 'Persistence'
end
