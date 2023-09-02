//
//  DotView.swift
//  
//
//  Created by Daniel on 16.03.2021.
//

import SwiftUI

public struct DotView: View {
    
    // MARK: - Private
    
    private let delay: Double
    private let size: CGFloat
    private let color: Color
    
    // MARK: - State
    
    @State private var scale: CGFloat = 0.5
    
    // MARK: - Init
    
    public init(size: CGFloat, delay: Double, color: Color) {
        self.delay = delay
        self.size = size
        self.color = color
    }
    
    // MARK: - Body
    
    public var body: some View {
        Circle()
            .frame(width: size, height: size)
            .scaleEffect(scale)
            .foregroundColor(color)
            .animation(Animation.easeInOut(duration: 0.6).repeatForever().delay(delay))
            .onAppear {
                withAnimation {
                    self.scale = 1
                }
            }
    }
}

struct DotView_Previews: PreviewProvider {
    static var previews: some View {
        DotView(size: 30, delay: 0, color: .blue)
    }
}
