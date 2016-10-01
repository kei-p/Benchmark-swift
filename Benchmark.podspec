Pod::Spec.new do |s|
  s.name         = "Benchmark"
  s.version      = "0.0.1"
  s.summary      = "Simple tool for measure time used to execute"

  s.homepage     = "https://github.com/kei-p/Benchmark-swift"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "kei-p" => "muddyapesjm66@gmail.com" }
  s.platform     = :ios

  s.source       = { :git => "https://github.com/kei-p/Benchmark-swift.git", :branch => "master" }
  s.source_files  = "Benchmark", "Benchmark/**/*.{h,m}"
end
