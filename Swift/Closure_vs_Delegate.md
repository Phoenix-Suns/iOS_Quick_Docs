# So sánh Closure và Delegate

- [So sánh Closure và Delegate](#So-s%C3%A1nh-Closure-v%C3%A0-Delegate)
  - [Closure vs Function](#Closure-vs-Function)
  - [Delegate](#Delegate)
    - [Khai báo ở VC2](#Khai-b%C3%A1o-%E1%BB%9F-VC2)
    - [Nhận Dữ liệu ở VC1](#Nh%E1%BA%ADn-D%E1%BB%AF-li%E1%BB%87u-%E1%BB%9F-VC1)
  - [Closure](#Closure)
    - [Khai báo ở VC2 (Closure)](#Khai-b%C3%A1o-%E1%BB%9F-VC2-Closure)
    - [Nhận Dữ liệu ở VC1 (Closure)](#Nh%E1%BA%ADn-D%E1%BB%AF-li%E1%BB%87u-%E1%BB%9F-VC1-Closure)

## Closure vs Function

```swift
func plus2num(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }

let plus2numV2: (Int, Int) -> Int = { (num1, num2) -> Int in
    return num1 + num2
}

// Using
let result = plus2num(num1: num1, num2: num2)
let result = plus2numV2(num1, num2)
```

## Delegate

### Khai báo ở VC2

```swift
class SecondViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!

    var receiveDelegate: ReceiveDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func closeVCTouch(_ sender: Any) {
        let message = messageTextField.text ?? ""
        receiveDelegate?.onReceiveMessage(value: message)
        self.navigationController?.popViewController(animated: true)
    }
}
```

### Nhận Dữ liệu ở VC1

```swift
protocol ReceiveDelegate {
    func onReceiveMessage(value: String)
}

class FirstViewController: UIViewController {
    // ...
    @IBAction func goToSecondViewControllerTouch(_ sender: Any) {
        let controller = SecondViewController(nibName: "SecondViewController", bundle: nil)
        controller.receiveDelegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension FirstViewController: ReceiveDelegate {
    func onReceiveMessage(value: String) {
        // Receive data from VC 2
        messageLabel.text = value
    }
}
```

## Closure

### Khai báo ở VC2 (Closure)

```swift
typealias ReceiveHandle = ((String) -> Void)

class SecondViewController: UIViewController {

    //...

    //var receiveDelegate: ReceiveDelegate?
    //var receiveHandle: ((String) -> Void)?    // Có thể khai báo trực tiếp
    var receiveHandle: ReceiveHandle?

    @IBAction func closeVCTouch(_ sender: Any) {
        let message = messageTextField.text ?? ""
        //receiveDelegate?.onReceiveMessage(value: message)
        receiveHandle?(message)
        self.navigationController?.popViewController(animated: true)
    }
}
```

### Nhận Dữ liệu ở VC1 (Closure)

```swift
class FirstViewController: UIViewController {
    // ...
    @IBAction func goToSecondViewControllerTouch(_ sender: Any) {
        let controller = SecondViewController(nibName: "SecondViewController", bundle: nil)
        //controller.receiveDelegate = self
        controller.receiveHandle = { message in
            self.messageLabel.text = message
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

/*
extension FirstViewController: ReceiveDelegate {
    func onReceiveMessage(value: String) {
        // Receive data from VC 2
        messageLabel.text = value
    }
}
*/
```
