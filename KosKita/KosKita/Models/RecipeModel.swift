//
//  RecipeModel.swift
//  KosKita
//
//  Created by Heical Chandra on 24/03/24.
//

import Foundation

struct RecipeModel: Identifiable, Codable {
    let id: String
    let title: String
    let image: String
    let ingridients: [String]
    let video: String
    let tutorial: String
    let isBookmarked: Bool
    
    init(id: String = UUID().uuidString, title: String, image: String, ingridients: [String], video: String, tutorial: String, isBookmarked: Bool){
        self.id = id
        self.title = title
        self.image = image
        self.ingridients = ingridients
        self.video = video
        self.tutorial = tutorial
        self.isBookmarked = isBookmarked
    }
    
    func addBookmark() -> RecipeModel {
        return RecipeModel(id: id, title: title, image: image, ingridients: ingridients, video: video, tutorial: tutorial, isBookmarked: !isBookmarked)
    }
    

}
