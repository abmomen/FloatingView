# Floating View for SwiftUI

This SwiftUI extension provides a floating view that can be dynamically expanded or collapsed based on user interaction. It is designed to overlay content on top of the main view and animate its expansion or contraction with drag gestures. This modifier also supports controlling user interaction when the floating view is small or large.

## Features

- **Interactive Floating View**: The floating content can be dragged up or down to expand or collapse.
- **Customizable Content**: You can provide custom floating content using a closure.
- **User Interaction Control**: The ability to lock user interaction when the floating view is small.
- **Smooth Animations**: The transition between small and large positions is animated.

## Requirements

- SwiftUI (iOS 13+)
- Xcode 11+

## Installation

You can integrate this code into your SwiftUI project by copying the extension and modifier into your project files.

## Usage

To use the floating view modifier in your SwiftUI view, you can call the `floatingView` modifier on any `View` that you want to display the floating content.

### Example:

```swift
import SwiftUI
import FloatingView

struct ContentView: View {
    @State var allowUserInteraction = true
    
    var body: some View {
        VStack {
            Text("Click me")
                .onTapGesture {
                    print("Hello")
                }
            
        }
        .allowsHitTesting(allowUserInteraction)
        .floatingView(allowUserInteraction: $allowUserInteraction) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue)
        }
        .ignoresSafeArea()
    }
}
```

### Parameters:
- **allowUserInteraction**: A `Binding<Bool>` that controls whether user interaction is allowed when the floating view is collapsed (small).
- **customContent**: A closure that provides the custom floating view content.

## How It Works

- The floating view appears as a small, draggable container. It can be dragged up to expand, or dragged down to collapse.
- The background overlay changes its opacity as the view expands and collapses, providing a clear visual indication of the floating view's state.
- When the view is collapsed (small), user interaction with the underlying content is allowed. When expanded (large), interaction with the content below is blocked.

### Floating View States
- **Small**: The floating view is collapsed. The height is 150 and opacity is 0.
- **Large**: The floating view is expanded. The height is 300 and opacity is 0.2.

## Customization

You can customize the floating view's size, opacity, and behavior by adjusting the `height` values in the `switchHeight` method or modifying the transition animations.

## License

This code is available under the MIT License.
