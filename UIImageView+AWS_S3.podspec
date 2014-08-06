Pod::Spec.new do |s|
  s.platform     = :ios
  s.ios.deployment_target = '6.0'
  s.name         = 'UIImageView+AWS_S3'
  s.version      = '0.1.0'
  s.summary      = 'UIImageView+AWS_S3 extends AFAmazonS3Client to allow setting an image view image using an Amazon S3 resource path'
  s.homepage     = 'https://github.com/JRG-Developer/UIImageView-AWS_S3'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Joshua Greene' => 'jrg.developer@gmail.com' }
  s.source   	 = { :git => 'https://github.com/JRG-Developer/UIImageView-AWS_S3.git',
                     :tag => "#{s.version}"}
  s.requires_arc = true
  s.frameworks = 'UIKit'
  s.dependency 'AFAmazonS3Client', '~> 2.0'
  s.source_files = 'UIImageView+AWS_S3/*.{h,m}'
end