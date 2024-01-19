import SwiftUI

enum Rarity: String, CaseIterable {
    case common, uncommon, rare, epic, legendary, unique

    var color: Color {
        switch self {
        case .common:
            return Color.gray
        case .uncommon:
            return Color.green
        case .rare:
            return Color.blue
        case .epic:
            return Color.purple
        case .legendary:
            return Color.orange
        case .unique:
            return Color.red
        }
    }
}


struct AddItemView: View {
    @State private var rarity = Rarity.common
    @State private var name = ""
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) private var dismiss
    @State private var selectedGame = Game.emptyGame
    @State  var itemType = ItemType.unknown
    @State private var value = 0
    @State private var hasAttackStat = false
    @State private var value2 = 0
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            
            Section {
                Picker("Jeu", selection: $selectedGame) {
                    ForEach(availableGames, id: \.id) { game in
                        Text(game.name).tag(game)
                    }
                
                }
                Stepper("Combien : \(value)", value: $value )
            }
            
            Section{
                HStack{
                    Text("Type")
                    Spacer()
                    Text(itemType.rawValue)
                   
                }
                
                Picker("Type d'objet \(itemType.rawValue)", selection: $itemType) {
                    ForEach(ItemType.allCases, id: \.self) { itemType in
                        Text(String(describing: itemType.rawValue))
                                        }
                                    }
                    .pickerStyle(SegmentedPickerStyle())
            }
            
            Section{
                Toggle("Item d'attaque?", isOn: $hasAttackStat)
                if hasAttackStat == true {
                    Stepper("Force d'attaque : \(value2)", value: $value2 )
                }
            }
            
            
            
        }

       
            
            
            Section {
                Button("Ajouter") {
                    inventory.addItem(item: LootItem(quantity: value, name: name, type: itemType, rarity: rarity, attackStrenght: value, game: selectedGame))
                    dismiss()
                }
            }
        }
    }



#Preview {
    AddItemView()
}
