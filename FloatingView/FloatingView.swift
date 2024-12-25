//
//  FloatingView.swift
//  FloatingView
//
//  Created by Abdul Momen on 25/12/24.
//

import SwiftUI

public extension View {
    func floatingView<FloatingContent: View>(
        allowUserInteraction: Binding<Bool>,
        @ViewBuilder customContent: @escaping () -> FloatingContent
    ) -> some View {
        self.modifier(FloatingViewModifier(allowUserInteraction: allowUserInteraction, floatingContent: customContent))
    }
}

struct FloatingViewModifier<FloatingContent: View>: ViewModifier {
    @Binding var allowUserInteraction: Bool
    let floatingContent: () -> FloatingContent
    
    @State private var height: CGFloat = 150
    @State private var opacity: CGFloat = 0
    @State private var position: Positions = .small {
        didSet {
            switchHeight()
        }
    }
    
    func body(content underlyingContent: Content) -> some View {
        ZStack {
            // Background overlay
            Rectangle()
                .fill(Color.black).opacity(opacity)
                .onTapGesture {
                    if position == .large {
                        position = .small
                    }
                }
            
            // Floating view content
            VStack(spacing: 0) {
                Spacer()
                
                floatingContent()
                    .frame(height: height)
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                position = value.translation.height > 0 ? .small : .large
                            }
                    )
            }
            
            underlyingContent
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func switchHeight() {
        withAnimation(.easeInOut(duration: 0.10)) {
            height = position == .small ? 150 : 300
            opacity = position == .small ? 0 : 0.20
            allowUserInteraction = position == .small
        }
    }
    
    enum Positions {
        case small
        case large
    }
}

