//
//  LootItem.swift
//  Looter
//
//  Created by Avinash CLAIN on 1/19/24.
//



enum ItemType: String, CaseIterable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
}

import Foundation

struct LootItem : Hashable{
        
        var quantity: Int = 1
        var name: String = ""
        var type: ItemType
        var rarity: Rarity
        var attackStrenght: Int?
        var game: Game
    }
    			
    



