# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'headingCar' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for headingCar
	pod 'UICircularProgressRing'
    #pod 'RxBluetoothKit'
    pod 'RxBluetoothKit'

end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            # Configure Pod targets for Xcode 8 compatibility
            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end
