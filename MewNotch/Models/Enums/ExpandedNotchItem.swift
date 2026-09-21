//
//  ExpandedNotchItem.swift
//  MewNotch
//
//  Created by Monu Kumar on 28/04/25.
//


import Foundation

enum ExpandedNotchItem: String, CaseIterable, Codable, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case Mirror
    case NowPlaying
    case Bash
    
    var displayName: String {
        switch self {
        case .Mirror:
            return NSLocalizedString("Mirror", comment: "")
        case .NowPlaying:
            return NSLocalizedString("Now Playing", comment: "")
        case .Bash:
            return NSLocalizedString("Bash Command", comment: "")
        }
    }
    
    var imageSystemName: String {
        switch self {
        case .Mirror:
            return "video.fill"
        case .NowPlaying:
            return "music.note"
        case .Bash:
            return "terminal"
        }
    }
}
