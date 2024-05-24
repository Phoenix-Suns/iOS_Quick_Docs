# Review in IOS 17

## Dark mode

```swift
#Preview {
    ContentView()
        .preferredColorScheme(.dark)    // Dark mode

}
```

## Multiple reivew

```swift
#Preview("Empty state") {
    ItemsView(data: .empty)
}

#Preview("Error state") {
    ItemsView(data: .error)
}
```

## IOS Version

```swift
@available(iOS 17, *)
#Preview(traits: .landscapeLeft) {
    ContentView()
}
```

## Landscape, fixed layout

```swift
#Preview(traits: .landscapeLeft)
#Preview(traits: .fixedLayout(width: 300, height: 300))
```

## Binding

```swift
#Preview {
    @State var pickerItem: String = ""
    return VideoPlayerView(pickerItem: $pickerItem)
}
```

## Name

```swift
#Preview("Article List View") {
    //...
}
```