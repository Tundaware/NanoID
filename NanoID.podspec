Pod::Spec.new do |s|
  s.name         = "NanoID"
  s.version      = "1.0.1"
  s.summary      = "Secure, unique, and configurable ID generator"
  s.description  = <<-DESC
  Another Swift implementation of Nano ID.
                   DESC

  s.homepage     = "https://github.com/Tundaware/NanoID"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "George Cox" => "george@tundaware.com" }
  s.social_media_url   = "https://twitter.com/Tundaware"

  s.source = {
    :git => "https://github.com/Tundaware/NanoID.git",
    :tag => s.version.to_s
  }
  s.swift_version = '5.1'

  s.ios.deployment_target = '10.0'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '4.0'
  s.osx.deployment_target = '10.11'

  s.source_files = 'Sources/NanoID/**/*.swift'
end
