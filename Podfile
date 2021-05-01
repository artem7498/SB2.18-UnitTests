# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


use_frameworks!

def testing_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'SB2.18 UnitTests' do
  pod 'Magics'
  pod 'RealmSwift'
  testing_pods
end

target 'SB2.18 UnitTestsTests' do
  pod 'Magics'
  pod 'OHHTTPStubs/Swift'
  pod 'RealmSwift'
    testing_pods
end

target 'SB2.18 UnitTestsUITests' do
    testing_pods
end



#target 'SB2.18 UnitTests' do
#  # Comment the next line if you don't want to use dynamic frameworks
#  use_frameworks!
#
#  # Pods for SB2.18 UnitTests
#
#  target 'SB2.18 UnitTestsTests' do
#    inherit! :search_paths
#    # Pods for testing
#  end
#
#  target 'SB2.18 UnitTestsUITests' do
#    # Pods for testing
#  end
#
#end
