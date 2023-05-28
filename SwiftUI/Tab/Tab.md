# Tab

```swift
struct Tab: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        // TAB UI
        TabView(selection: $selection) {
            // View 1
            Text("Tab 1 Content")
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            // View 2
            Text("Tab 2 Content")
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
```