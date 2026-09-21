//
//  HUDEnums.swift
//  MewNotch
//
//  Created by Monu Kumar on 23/03/25.
//

import Foundation

enum HUDStyle: String, CaseIterable, Identifiable, Codable {
    var id: String { rawValue }
    
    case Minimal
    case Progress
    case Notched
    
    var displayName: String {
        switch self {
        case .Minimal:
            return NSLocalizedString("Minimal", comment: "")
        case .Progress:
            return NSLocalizedString("Progress", comment: "")
        case .Notched:
            return NSLocalizedString("Notched", comment: "")
        }
    }
}
