//
//  RecipeModel.swift
//  KosKita
//
//  Created by Heical Chandra on 24/03/24.
//

import Foundation

struct RecipeModel: Identifiable, Codable {
    let id: Int
    let title: String
    let image: String
    let ingridients: [String]
    let video: String
    let tutorial: String
    let isBookmarked: Bool
    
    init(id: Int, title: String, image: String, ingridients: [String], video: String, tutorial: String, isBookmarked: Bool){
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

// Dummy data

//extension RecipeModel {
//    static func dummyData() -> [RecipeModel] {
//        return [
//            RecipeModel(title: "Spaghetti Carbonara", image: "spaghetti_carbonara", ingridients: ["Spaghetti", "Egg", "Bacon", "Parmesan Cheese", "Black Pepper", "Salt"], video: "https://www.youtube.com/watch?v=nT8gYLO6kZE", tutorial: "Follow the video tutorial for instructions.", isBookmarked: false),
//            RecipeModel(title: "Chicken Alfredo", image: "chicken_alfredo", ingridients: ["Chicken Breast", "Fettuccine Pasta", "Heavy Cream", "Butter", "Garlic", "Parmesan Cheese", "Salt", "Black Pepper"], video: "https://www.youtube.com/watch?v=3iHBXKFSTpQ", tutorial: "Follow the video tutorial for instructions.", isBookmarked: false),
//            RecipeModel(title: "Vegetable Stir-Fry", image: "vegetable_stir_fry", ingridients: ["Broccoli", "Carrots", "Bell Peppers", "Snow Peas", "Garlic", "Soy Sauce", "Vegetable Oil", "Sesame Oil"], video: "https://www.youtube.com/watch?v=yydK9nJsAsI", tutorial: "Follow the video tutorial for instructions.", isBookmarked: false)
//            // Add more dummy data as needed
//        ]
//    }
//}
