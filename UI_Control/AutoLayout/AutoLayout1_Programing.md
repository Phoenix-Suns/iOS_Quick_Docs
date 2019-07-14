# AutoLayout by Code

## Simple Start

```swift
class FirstViewController: UIViewController {
    
    var redView: UIView!
    var didUpdateViewConstraints = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        // Create Red View
        redView = UIView()
        redView.backgroundColor = UIColor.red
        redView.translatesAutoresizingMaskIntoConstraints = false   // apply AutoLayout, using when create View by code
        view.addSubview(redView)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if !didUpdateViewConstraints {
            let redViewConstraints = [
                NSLayoutConstraint(item: redView!, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0),
                // === Setup First Constrain Here ===
            ]
            NSLayoutConstraint.activate(redViewConstraints)
            
            didUpdateViewConstraints = true
        }
        super.updateViewConstraints()
    }
}
```
