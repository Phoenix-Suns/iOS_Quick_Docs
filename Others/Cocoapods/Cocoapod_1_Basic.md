# Cocoapod (dependency manager) - Project Package Manager

## Install on Mac

> sudo gem install cocoapods

## Setup on Project

1/ Create Podfile

> pod init
> pod install

2/ Open project by file: *.xcworkspace
3/ In podFile add dependency:

```swift
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    // Add Pakage here
    // ...
end
```

4/ Install dependences in Podfile, run:

> pod install

---

**References**
<https://cocoapods.org/>
