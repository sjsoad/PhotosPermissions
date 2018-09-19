Pod::Spec.new do |s|

# 1
s.platform = :ios
s.swift_version = '4.2'
s.ios.deployment_target = '10.0'
s.name = "SKPhotosPermissions"
s.summary = "SKPhotosPermissions allows you to check Photos permissions"
s.requires_arc = true

# 2
s.version = "0.0.6"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Serhii Kostian" => "skostyan666@gmail.com" }

# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/sjsoad/PhotosPermissions"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/sjsoad/PhotosPermissions.git", :tag => "#{s.version}"}

# 7
s.framework = "Photos"

# 8
s.source_files = "PhotosPermissions/**/*.{swift}"

end
