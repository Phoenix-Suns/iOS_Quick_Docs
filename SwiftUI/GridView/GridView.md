# GridView

- [GridView](#gridview)
  - [Vertical Grid](#vertical-grid)
  - [Horizontal Grid](#horizontal-grid)


## Vertical Grid

```swift
struct GridVertical: View {
    let data = (1...1000).map { "Item \($0)" }
    
    // Column Config (3 Column)
    let columns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        //GridItem(.flexible(minimum: 80)),
        //GridItem(.fixed(80))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    // ===== Item View =====
                    //Text(item)
                    GridVerticalItem(item: item)
                }
            }
            .padding(.horizontal)
        }
        // Height
        .frame(height: 500)
    }
}

struct GridVertical_Previews: PreviewProvider {
    static var previews: some View {
        GridVertical()
    }
}

// ===== Item View =====
struct GridVerticalItem: View {
    var item: String
    
    var body: some View {
        Label(item, systemImage: "photo")
    }
}

struct GridVerticalItem_Previews: PreviewProvider {
    static var previews: some View {
        Grid {
            GridRow {
                GridVerticalItem(item: "Item 1")
            }
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
```

## Horizontal Grid

```swift
struct GridHorizontal: View {
    let data = (1...1000).map { "Item \($0)" }
    
    // Rows Config (3 Rows)
    let rows = [
        //GridItem(.adaptive(minimum: 100)),
        //GridItem(.fixed(100)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10)),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    // Item View
                    //Text(item)
                    GridVerticalItem(item: item)
                }
            }
            .padding(.horizontal)
            .frame(height: 500) // Height
        }
    }
}

struct GridHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        GridHorizontal()
    }
}
```