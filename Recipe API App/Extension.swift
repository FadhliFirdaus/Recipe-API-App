//
//  Extension.swift
//  Recipe API App
//
//  Created by Fadhli Firdaus on 26/04/2024.
//

import Foundation
import SwiftUI


extension View {
    func customFont(_ fontName: CustomFontName, size fontSize: CGFloat) -> some View {
        self.modifier(CustomFontModifier(fontName: fontName.rawValue, fontSize: fontSize))
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
