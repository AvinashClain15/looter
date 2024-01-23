import SwiftUI



class Inventory: ObservableObject {
    @Published var loot = ["Epée", "Bouclier", "Armure","Baguette magique","Mandragore"]

    @Published var realLoot: [LootItem] = [
        LootItem(quantity: 1, name: "Magic Potion", type: ItemType.magic, rarity: Rarity.legendary, attackStrenght: 10, game: availableGames[0]),
        
        LootItem(quantity: 2, name: "Baguette", type: ItemType.magic, rarity: Rarity.epic, attackStrenght: 10, game: availableGames[1]),
        
        LootItem(quantity: 2, name: "Mandragore", type: ItemType.wind, rarity: Rarity.legendary, attackStrenght: 10, game: availableGames[2]),
        
        LootItem(quantity: 2, name: "Dragon lore", type: ItemType.ring, rarity: Rarity.common, attackStrenght: 10, game: availableGames[3]),
        
        LootItem(quantity: 2, name: "Lame secrète", type: ItemType.dagger, rarity: Rarity.uncommon, attackStrenght: 10, game: availableGames[4]),
    ]
    
    func addItem(item:  LootItem) {
        realLoot.append(LootItem(quantity: item.quantity, name: item.name, type: item.type, rarity: item.rarity, attackStrenght: item.attackStrenght, game: item.game))
    }

}

struct ContentView: View {
    @ObservedObject var inventory = Inventory()
    @State var showAddItemView = false

    var body: some View {
        NavigationStack {
            List {
                Button(action: {
                   
                }, label: {
                    Text("Ajouter")
                })
                
                ForEach(inventory.realLoot, id: \.self) { item in
                    NavigationLink {
                        LootDetailView(item: item) // On passe directement l'item à la vue
                    } label: {
                        HStack{
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(item.rarity.color)
                            Text(item.name + "\n")
                            Text("Quantité : " + String(item.quantity))
                            Text( item.type.rawValue)
                            
                                
                        }
                        .padding()
                    }
                }
              
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
                })
            .navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
                .toolbar(content: { // La barre d'outil de notre page
                    ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                        Button(action: {
                            showAddItemView.toggle() // L'action de notre bouton
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                })
        }
    }
}

#Preview {
    ContentView()
}
