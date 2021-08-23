$xq = 'git@git.snowballfinance.com:ios'
$github = 'git@github.com:'

source "#{$github}CocoaPods/Specs"
source "#{$xq}/cocoapodsspecs"

target 'YYY123' do
pod 'AFNetworking'
pod 'MLeaksFinder', :commit => 'cdb1bb6', :git=> "#{$xq}/MLeaksFinder", :configurations => 'Debug'
end
