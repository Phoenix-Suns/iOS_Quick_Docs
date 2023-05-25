# Button

## Custom Style

```swift
struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
            // Scale when click
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(Animation.easeOut(duration: 0.2), value: UUID())
    }
}

struct ContentView: View {
    var body: some View {
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(BlueButton())
    }
}
```