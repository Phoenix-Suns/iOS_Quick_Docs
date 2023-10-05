# ViewPager

```swift
TabView {
    Text("First")
    Text("Second")
    Text("Third")
    Text("Fourth")
}
.tabViewStyle(.page)
.indexViewStyle(.page(backgroundDisplayMode: .always))
.onAppear {
// Dot color
    UIPageControl.appearance().currentPageIndicatorTintColor = .whiskey
    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
}
```