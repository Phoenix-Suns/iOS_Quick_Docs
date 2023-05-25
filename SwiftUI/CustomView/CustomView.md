# Custom View

## Star Button

```swift
struct FovoriteButton: View {
    // isSet will change by View Action
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FovoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FovoriteButton(isSet: .constant(true))
    }
}

// Using
FovoriteButton(isSet: $isSelect)
```

### Circle Image

```swift
// Return Image
struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}

// Using
CircleImage(image: "turtlerock")
```