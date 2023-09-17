# UIx
UI extension based on SwiftUI.
<details>
<summary>LodingView - Fork of https://github.com/DanielMandea/swiftui-loading-view and minor modifications</summary>

```swift

import SwiftUI
import LoadingView

struct ExampleView: View {
    
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
            Toggle("Show activity indicator", isOn: $isLoading)
            
            // Dots 
            Text("This is My Personal Data")
                .dotsIndicator(when: $isLoading)
                
            // Circle
            Text("This is My Personal Data")
                .circleIndicator(when: $isLoading)
                
            // Container
            Text("This is My Personal Data")
                .containerIndicator(when: $isLoading) {
                    Text("Animated text")
                }
        }
    }
}

```
</details>

<details>
<summary>TabBar</summary>

```swift
struct ContentView: View {

    var body: some View {
        NavigationView {
            VStack{
                TabBar{
                    VStack{
                        Text("A1")
                        Image(systemName: "plus")
                        Text("A1")
                        Text("A1")
                        Text("A1")
                        Text("A1")
                    }
                    .border(.blue)
                    .tabbar("A11111")
                    VStack{
                        Text("A2")
                        Text("A2")
                        Text("A2")
                        Text("A2")
                        Image(systemName: "plus")
                        Text("A2")
                    }
                    .border(.blue)
                    .tabbar("A2222")
                    VStack{
                        Text("A3")
                        Text("A3")
                        Text("A3")
                        Image(systemName: "plus")
                        Text("A3")
                        Text("A3")
                    }
                        .border(.blue)
                        .tabbar("A333333333")
                }
            }
        }
    }
}
```
</details>