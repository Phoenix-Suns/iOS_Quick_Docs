# Observable (iOS 17)

## View send to View

```swift
@Observable final class Store<State, Action> {
    typealias Reduce = (State, Action) -> State
    
    private(set) var state: State
    private let reduce: Reduce
    
    init(initialState state: State, reduce: @escaping Reduce) {
        self.state = state
        self.reduce = reduce
    }
    
    func send(_ action: Action) {
        state = reduce(state, action)
    }
}

struct ContentView: View {
    @State private var store = Store<AppState, AppAction>(
        initialState: .init(),
        reduce: reduce
    )
    
    var body: some View {
        ProductsView()
            .environment(store)
    }
}

struct ProductsView: View {
    @Environment(Store<AppState, AppAction>.self) var store
    
    var body: some View {
        List(store.state.products, id: \.self) { product in
            Text(product)
        }
        .onAppear {
            store.send(.fetch)
        }
    }
}
```

## Apply for ViewModel (@Observable, @Bindable)

```swift
@Observable final class AuthViewModel {
    var username = ""
    var password = ""
    
    var isAuthorized = false
    
    func authorize() {
        isAuthorized.toggle()
    }
}

struct AuthView: View {
    @Bindable var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            if !viewModel.isAuthorized {
                TextField("username", text: $viewModel.username)
                SecureField("password", text: $viewModel.password)
                
                Button("authorize") {
                    viewModel.authorize()
                }
            } else {
                Text("Hello, \(viewModel.username)")
            }
        }
    }
}
```