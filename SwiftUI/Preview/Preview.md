# Preview Note

- [Preview Note](#preview-note)
  - [Review Size](#review-size)
  - [Preview with List phone](#preview-with-list-phone)
  - [Using EnvironmentObject](#using-environmentobject)
  - [Using Binding](#using-binding)
  - [Multiple Case](#multiple-case)
  - [Preview Grid Row](#preview-grid-row)
  - [Font larger, Dark Mode, Layout Right to Left, Language](#font-larger-dark-mode-layout-right-to-left-language)


## Review Size

```swift
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            // Review size
            .previewLayout(.fixed(width: 300, height: 300)) 
    }
}
```

## Preview with List phone

```swift
struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        // Review on list phone
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            EditView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
```

## Using EnvironmentObject

```swift
struct ListHorizontal: View {
    @EnvironmentObject var modelData: ModelData
    //...
}
struct ListHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        ListVertical()
            .environmentObject(ModelData())
    }
}
```

## Using Binding

```swift
struct FovoriteButton: View {
    @Binding var isSet: Bool
    //...
}
struct FovoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FovoriteButton(isSet: .constant(true))
    }
}

// ===== OR =====
struct FovoriteButton_Previews: PreviewProvider {
  @State static var letSet = false
  static var previews: some View {
    FovoriteButton(isSet: $letSet)
  }
}
```

## Multiple Case

```swift
struct ListHorizontalItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListHorizontalItem(landmark: landmarks[0])
            ListHorizontalItem(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
```

## Preview Grid Row

```swift
struct GridVerticalItem_Previews: PreviewProvider {
    static var previews: some View {
        
        Grid {
            GridRow {
                GridVerticalItem(item: "Item 1")
            }
        }
        // Review size
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
```

## Font larger, Dark Mode, Layout Right to Left, Language

```swift
.environment(\.sizeCategory, .extraLarge) // Font larger
.environment(\.colorScheme, .dark)  // Dark Mode
.environment(\.layoutDirection, .rightToLeft)   // Layout Right to Left
.environment(\.locale, Locale(identifier: "ar"))    // Language
```

