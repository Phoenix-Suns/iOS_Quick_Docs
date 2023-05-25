# Send Data form Views

## Send String

```swift
struct SendMessageView: View {
    @State private var message: String = ""
    
    var body: some View {
        HStack {
            TextField(
                "Message",
                text: $message
            )
            
            NavigationLink {
                // ===== Send Text =====
                ReceiveMessageView(messageBack: $message)
            } label: {
                Label("Send", systemImage: "paperplane.fill")
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct ReceiveMessageView: View {
    var messageBack: String
    //...
}
```

## Callback String

```swift
struct ReceiveMessageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // Callback data
    var callback: ((_ messageBack: String) -> ())?
    @Binding var messageBack: String
    
    var body: some View {
        VStack {
            TextField(
                "Message",
                text: $messageBack
            )
            
            // Callback Message
            Button {
                // ===== Callback Text ====
                callback?(messageBack)
                presentationMode.wrappedValue.dismiss() // Go back

            } label: {
                Label("Send back message", systemImage: "arrowshape.turn.up.backward.2.fill")
            }
        }
    }
}

struct ReceiveMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveMessageView(messageBack: .constant(""))
    }
}
```