//
//  DeckModel.swift
//  KosKita
//
//  Created by Heical Chandra on 27/03/24.
//

import Foundation

struct DeckModel: Identifiable, Codable {
    let id: String
    let item1: Int
    let item2: Int
    let item3: Int
    let isBookmarked: Bool
    
    init(id: String = UUID().uuidString, item1: Int, item2: Int, item3: Int, isBookmarked: Bool){
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
