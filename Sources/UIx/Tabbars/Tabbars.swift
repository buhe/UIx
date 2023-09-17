//
//  File.swift
//  
//
//  Created by 顾艳华 on 2023/9/16.
//

import Foundation
import SwiftUI

struct TabItemPreferenceKey: PreferenceKey {
    
    typealias Value = [String]
    
    static var defaultValue: [String] = []

    static func reduce(value: inout [String], nextValue: () -> [String]) {
        let next = nextValue()
//        print("reduce: \(next)")
        value.append(contentsOf: next)
    }
}


extension View {
    public func tabbar(_ label: String) -> some View  {
//        print("label: \(label)")
        return self.preference(key: TabItemPreferenceKey.self, value: [
                   label
               ])
        
    }

}

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        Text(text)
            .fontWeight(isSelected ? .heavy : .regular)
            .font(.custom("Avenir", size: 16))
            .padding(.vertical, 10)
            .border(width: isSelected ? 2 : 1, edges: [.bottom], color: .gray)
    }
}

public struct TabBar: View {
    let content: [AnyView]
    @State var tabTitles: [String] = []
    @State var tabIndex: Int = 0
        
    public init<Views>(@ViewBuilder content: @escaping () -> TupleView<Views>) {
        self.content = content().getViews
    }
    
    public var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    // tabbars
                    ForEach(tabTitles.indices, id: \.self) {
                        index in
                        TabBarButton(text: tabTitles[index], isSelected: .constant(tabIndex == index))
                            .onTapGesture { onButtonTapped(index:index) }
                    }
                }
            }
            .padding(.horizontal)
            ForEach(content.indices, id: \.self) { index in
                if index == tabIndex {
                    content[index]
                }
                else {
                    if tabIndex == 0 {
                        // workaround
                        content[index]
                            .hidden()
                            .frame(width: 0,height: 0)
                    }
                }
            }
            Spacer()
        }
        .onPreferenceChange(TabItemPreferenceKey.self) { preferences in
                        
//            print("On \(preferences)")
            preferences.forEach { p in
                if !self.tabTitles.contains(p){
                    self.tabTitles.append(p)
                }
            }
        }
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

