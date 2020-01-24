Pod::Spec.new do |spec|
  spec.name         = "NanoID"
  spec.version      = "1.0.0"
  spec.summary      = "Secure, unique, and configurable ID generator"
  spec.description  = <<-DESC
  A Swift implementation of NanoID for generating configurable length unique, secure, IDs.
                   DESC

  spec.swift_version = "5.1"

  spec.homepage     = "https://github.com/Tundaware/NanoID"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "George Cox" => "george@tundaware.com" }
  spec.social_media_url   = "https://twitter.com/tundaware"
  spec.ios.deployment_target = '11.0'
  spec.tvos.deployment_target = '11.0'
  spec.watchos.deployment_target = '4.0'
  spec.osx.deployment_target = '10.12'

  spec.source       = { :git => "https://github.com/Tundaware/NanoID.git", :tag => "v#{spec.version.to_s}" }

  spec.source_files  = "Sources/NanoID/**/*.swift"
end
