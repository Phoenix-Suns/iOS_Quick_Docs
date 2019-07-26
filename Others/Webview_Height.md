# Get Height of Webview

- Wait a few second after Webview load done

```swift
@IBOutlet var webviewContent: WKWebView!
private let timeForGetHeight: Float = 5.0 //5 second
private var timerForGetHeight: Timer?
private var counterForGetHeight: Float = 0.0

// MARK: Webview Events
extension PostContentView: WKNavigationDelegate {

    // Webview finish loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

        webView.evaluateJavaScript("document.readyState", completionHandler: { (complete, error) in
            if complete != nil {
                print("document.readyState")
                self.setWebviewHeight()

                // Run Timer to get Webview Height
                self.counterForGetHeight = timeForGetHeight
                self.timerForGetHeight = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
                    // Countdown endtime to Stop
                    self.counterForGetHeight -= 1
                    if self.counterForGetHeight <= 0 {
                        timer.invalidate()
                        return
                    }
                    self.setWebviewHeight()
                })
            }
        })
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == WKNavigationType.linkActivated {
            // Click link: Redirected to browser.
            print("link click")
            if let url = navigationAction.request.url,
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
                print(url)
            }
            decisionHandler(.cancel)
            return
        }
        print("not link click")
        decisionHandler(.allow)
    }

    @objc func setWebviewHeight() {
        //document.body.scrollHeight: Height not decrease after increase
        self.webviewContent.evaluateJavaScript("document.documentElement.scrollHeight", completionHandler: { (height, error) in
            let heightCG = height as? CGFloat ?? 0
            if heightCG != self.webviewContent.frame.height {
                print("Webview new height: \(heightCG)")
                self.webviewContent.snp.updateConstraints { maker in
                    maker.height.equalTo(heightCG)
                }
            }
        })
    }
}
```

---
