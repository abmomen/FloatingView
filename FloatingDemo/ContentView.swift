//
//  ContentView.swift
//  FloatingDemo
//
//  Created by Abdul Momen on 25/12/24.
//

import SwiftUI
import FloatingView

struct ContentView: View {
    @State var allowUserInteraction = true
    
    var body: some View {
        ZStack {
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
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
