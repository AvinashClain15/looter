//
//  Game.swift
//  Looter
//
//  Created by Avinash CLAIN on 1/19/24.
//

import Foundation

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "elden_ring"),
    Game(name: "Skyrim", genre: .rpg, coverName: "skyrim"),
    Game(name: "Hogwart legacy", genre: .mmorpg, coverName: "Cs2"),
    Game(name: "CS2", genre: .fps, coverName: "hogwart"),
    Game(name: "Assasin's creed Mirage", genre: .looter, coverName: "mirage")
]
