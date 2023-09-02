//
//  BlurViewModifier.swift
//  
//
//  Created by Daniel on 17.03.2021.
//

import Foundation
import SwiftUI

struct BlurViewModifier<TopView: View>: ViewModifier {

    // MARK: Private properties

    let destination: TopView
    let blurRadius: CGFloat
    
    // MARK: - Binding
    
    @Binding var binding: Bool

    // MARK: - View body
    func body(content: Content) -> some View {
        ZStack {
            if !binding {
                content
            } else {
//                content.blur(radius: blurRadius)
                content
                destination
            }
        }
    }
}
