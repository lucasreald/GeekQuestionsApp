//
//  ButtonsStyle.swift
//  GeekQuestions
//
//  Created by Lucas Real Dias on 10/05/23.
//

import SwiftUI

// MARK: - ContentView button style
struct ButtonStyleMain: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 270)
            .padding(12)
            .font(.custom("Righteous-Regular", size: 30))
            .background(Color("color4"))
            .foregroundColor(Color("color3"))
            .cornerRadius(12)
            .shadow(color: .black, radius: 3)
    }
}

extension View {
    func buttonStyleMain() -> some View {
        modifier(ButtonStyleMain())
    }
}

// MARK: - QuestionsView button style
struct ButtonStyleQuestions: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 270, height: 35, alignment: .leading)
            .padding()
            .font(.custom("Righteous-Regular", size: 20))
            .foregroundColor(Color("color3"))
    }
}

extension View {
    func buttonStyleQuestions() -> some View {
        modifier(ButtonStyleQuestions())
    }
}

// MARK: - End game button style
struct ButtonStyleEnd: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 150, height: 60)
            .font(.custom("Righteous-Regular", size: 30))
            .foregroundColor(Color("color3"))
            .background(Color("color2"))
            .cornerRadius(10)
            .shadow(color: .black, radius: 3)
            .padding()
    }
}

extension View {
    func buttonStyleEnd() -> some View {
        modifier(ButtonStyleEnd())
    }
}

