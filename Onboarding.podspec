Pod::Spec.new do |s|
  s.name             = 'Onboarding'
  s.version          = '1.2.0'
  s.summary          = 'Project\'s "Onboarding" module.'
  s.homepage         = 'https://github.com/htmlprogrammist/Onboarding'
  s.screenshots     = 'https://user-images.githubusercontent.com/60363270/210895101-0d205d0b-a320-4c60-bec1-b1e8a4d41f20.jpeg',
                      'https://user-images.githubusercontent.com/60363270/210895135-cbd57450-37ae-45cf-bbd1-e8387ec579d9.jpeg',
                      'https://user-images.githubusercontent.com/60363270/210895147-6c1221b7-53e8-4d65-8f7c-d98769007dce.jpeg'
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
