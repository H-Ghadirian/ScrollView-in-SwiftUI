//
//  ContentView.swift
//  Swiftui scrollview
//
//  Created by Ghadirian, Hamed, HSE24 DE on 20.06.22.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: 0, height: 0)
                    .onChange(
                        of: geometry.frame(in: .global).midY) { midY in
                            print("midY: \(midY)")
                        }
            }
            VStack {
                ForEach(0..<50) { index in
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.accentColor)
                }
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    print("Scroll")
                    if value.translation.height > 0 {
                        print("Scroll up")
                    } else {
                        print("Scroll down")
                    }
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
