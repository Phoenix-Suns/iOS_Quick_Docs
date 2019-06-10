# Navigation: Điều Hướng

https://github.com/codepath/ios_guides/wiki/Understanding-Navigation-in-iOS

```swift
// App Delegate
// === Show View Controller ===
window = UIWindow(frame: UIScreen.main.bounds)
let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)
//let navigation = UINavigationController(rootViewController: homeController)
//window?.rootViewController = navigation
window?.rootViewController = homeController
window?.makeKeyAndVisible()
```

```swift
let controller = SettingViewController(nibName: "SettingViewController", bundle: nil)
let nav = UINavigationController(rootViewController: controller)

// Hiện VC trong Navigation đầu tiên
self.present(nav, animated: true, completion: nil) // use for first Nav VC ==== present - close by Dismiss
// Or
self.show(navigation, sender: self)

// Clear all Stack, về lại nơi Present
self.navigationController?.dismiss(animated: true, completion: nil)


// Hiện VC sau
self.navigationController?.pushViewController(controller, animated: true)

// Đóng VC cuối cùng
self.navigationController?.popViewController(animated: true)
```
