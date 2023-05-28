# ListView

- [ListView](#listview)
  - [Vertical List](#vertical-list)
  - [Horizontal List](#horizontal-list)


## Vertical List

```swift
struct ListVertical: View {
    let data = (1...1000).map { "Item \($0)" }

    var body: some View {
            List {
                // Header
                //Toggle(isOn: $showFavoritesOnly) {
                //    Text("Favorites only")
                //}

                // List View
                ForEach(data, id: \.self) { item in
                    ListVerticalRow(item: item)
                }
            }
        }
}

struct ListVertical_Previews: PreviewProvider {
    static var previews: some View {
        ListVertical()
    }
}

// ===== Item =====
struct ListVerticalRow: View {
    var item: String
    
    var body: some View {
        Label(item, systemImage: "tray.full.fill")
            .padding()
    }
}

struct ListVerticalRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            ListVerticalRow(item: "Item 1")
            ListVerticalRow(item: "Item 2")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
```

## Horizontal List

```swift
struct ListHorizontal: View {
    let data = (1...1000).map { "Item \($0)" }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 0) {
                ForEach(data, id: \.self) { item in
                    // ===== Item View =====
                    ListHorizontalItem(item: item)
                }
            }
        }
        .frame(height: 100) // Height
    }
}

struct ListHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        ListVertical()
    }
}

// ===== Item =====
struct ListHorizontalItem: View {
    var item: String
    
    var body: some View {
        Label(item, systemImage: "tray.full.fill")
            .padding()
    }
}

struct ListHorizontalItem_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            ListHorizontalItem(item: "Item 1")
            ListHorizontalItem(item: "Item 2")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
```