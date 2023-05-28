# Animation

```swift
struct AnimationPage: View {
    @State private var isChange = false
    
    var body: some View {
        VStack {
            Button("Action") {
                // ===== Run Animation =====
                withAnimation(.spring()) {
                    self.isChange.toggle()
                }
            }
            .font(.title)
            
            Spacer()
            
            if isChange {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
                    .frame(width: 200, height: 200)

                    // === Set Animation Type ===
                    .transition(.scale(scale: 2))   
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .frame(width: 200, height: 200)

                // === Animation without withAnimation ===
                .rotationEffect(isChange ? .degrees(90) : .degrees(0))
                .scaleEffect(isChange ? 1.2 : 1)
                
        }
        .padding()
    }
}
```

## Transition Animation Config 

```swift
.transition(.moveAndFade)
.transition(.slide)
.transition(.opacity) // Fade
.transition(.move(edge: .bottom))   // .leading, .trailing .top .bottom
.transition(.offset(x: 10, y: 10))  // Move with position

// Scale
.transition(.scale)
.transition(.scale(scale: 0.5))
.transition(.scale(anchor: UnitPoint(x: 1, y: 0)))

UnitPoint(x: 1, y: 0) -- transitions towards top right
UnitPoint(x: -1, y: 0) -- transitions towards top left
UnitPoint(x: 0, y: 1) -- transitions towards bottom left
UnitPoint(x: 0, y: -1) -- transitions towards bottom right

// add 2 transition
.transition(.slide.combined(with: .scale))
.transition(.move(edge: .trailing)
    .combined(with: .move(edge: .top)))
```

## Custom Animation

```swift
static func ripple() -> Animation {
    Animation.spring(dampingFraction: 0.5)
        .speed(2)
}

// Using
view.animation(.ripple())
```