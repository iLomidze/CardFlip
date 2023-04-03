//
//  File.swift
//  
//
//  Created by Irakli Lomidze on 04.04.23.
//

import Foundation

public extension CardFlip {
    /// State - if card is open or closed
    enum CardState {
        case open
        case closed
        
        var isOpen: Bool {
            self == .open
        }
        var isClosed: Bool {
            self == .closed
        }
    }
}
