//
//  DeckModel.swift
//  KosKita
//
//  Created by Heical Chandra on 27/03/24.
//

import Foundation

struct DeckModel: Identifiable, Codable {
    let id: String
    let item1: String
    let item2: String
    let item3: String
    let isBookmarked: Bool
    
    init(id: String = UUID().uuidString, item1: String, item2: String, item3: String, isBookmarked: Bool){
        self.id = id
        self.item1 = item1
        self.item2 = item2
        self.item3 = item3
        self.isBookmarked = isBookmarked
    }
    
    func BookmarkDeck() -> DeckModel {
        return DeckModel(id: id, item1: item1, item2: item2, item3: item3, isBookmarked: !isBookmarked)
    }
}
