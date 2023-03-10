# ScrollViewWithScrollOffset

SwiftUI ScrollView with content offset.

<table>
<tr>
<td><img src="Examples/demo1.gif"/></td>
</tr>
</table>

## Features
- easiest way to get `contentOffset` of ScrollView

# Installing
Swift Package Manager:
```
https://github.com/Jnis/ScrollViewWithScrollOffset.git
```

# Usage

1) Usage

``` swift
import ScrollViewWithScrollOffset

@State var scrollOffset: CGFloat = 0 // 1

ScrollViewWithScrollOffset(scrollOffset: $scrollOffset, content: { // 2
   // your view ...
})
```

2) Example with image (gif example):

``` swift
import ScrollViewWithScrollOffset

struct ContentView: View {
    @State var scrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollViewWithScrollOffset(scrollOffset: $scrollOffset, content: {
            VStack {
                image
                Color.gray.frame(height: 1000)
            }
        })
    }
    
    var image: some View {
        GeometryReader { proxy in
            Image(systemName: "heart.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, min(0, -scrollOffset))
                .frame(width: proxy.size.width,
                       height: proxy.size.height + max(0, scrollOffset))
                .offset(CGSize(width: 0, height: min(0, -scrollOffset)))
        }
        .aspectRatio(CGSize(width: 375, height: 280), contentMode: .fit)
    }
}
```

You can find more examples inside `/Examples` folder.

# License 
MIT
