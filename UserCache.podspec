Pod::Spec.new do |s|

  s.name         = "UserCache"
  s.version      = "0.1.1"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.summary      = "User Cache written in Swift"
  s.homepage     = "https://github.com/comodinx/UserCache"
  s.authors      = { "Nicolas Molina" => "comodinx@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/comodinx/UserCache.git", :tag => '0.1.1' }

  s.source_files = "Sources/*.swift"

  s.deprecated_in_favor_of = 'SimpleCache'

end
