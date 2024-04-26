//
//  Helper.swift
//  Recipe API App
//
//  Created by Fadhli Firdaus on 26/04/2024.
//

import Foundation
import UIKit
import SwiftUI

 let sw = UIScreen.main.bounds.size.width
 let sh = UIScreen.main.bounds.size.height
 let sz = UIScreen.main.bounds.size




struct CustomFontModifier: ViewModifier {
    var fontName: String
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
    }
}

extension View {
    func redBackground() -> some View {
        self.background(Color.red)
    }
    
    func yellowBackground() -> some View {
        self.background(Color.yellow)
    }
    
    func blueBackground() -> some View {
        self.background(Color.blue)
    }
}
