//
//  HapticFeedBack.swift
//  CodeClanCore
//
//  Created by Mahdi_iOS on 12/01/24.
//


import SwiftUI
import Foundation
extension View {
    func hapticFeedback(feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) -> some View {
        self.modifier(HapticFeedback(feedbackStyle: feedbackStyle))
    }
    func playHaptic(feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle = .light){
        UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
    }
}

open struct HapticFeedback: ViewModifier {
    private let generator: UIImpactFeedbackGenerator
    
    init(feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        generator = UIImpactFeedbackGenerator(style: feedbackStyle)
    }
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                generator.impactOccurred()
            }
    }
}
