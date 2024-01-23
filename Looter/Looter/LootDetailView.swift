//
//  LootDetailView.swift
//  Looter
//
//  Created by Avinash CLAIN on 1/23/24.
//

import SwiftUI

struct LootDetailView: View {
     var item:LootItem
    @State var isAnimating = false
    
    var body: some View {
        
        
    
        VStack(alignment: .leading){
            Text("Détail de l'item")
                
            
        }.frame(maxWidth: .infinity, alignment: .top)
        
            VStack{
                
                    ZStack{
                        
                            
                        Rectangle()
                            .foregroundColor(item.rarity.color)
                            .frame(width: 100, height: 100)
                            .cornerRadius(15)
                            .shadow( color: item.rarity.color, radius: 14)
                        Text(item.type.rawValue)
                    }
               
               
                
              
               
            }
            .padding()
            .rotation3DEffect(
                            .init(degrees: isAnimating ? 360 : 0),
                            axis: (x: isAnimating ? 1 : 0, y: isAnimating ? 0.8 : 0, z: 0)
                        )
                        .shadow(color: Color(item.rarity.color), radius: isAnimating ? 100 : 0)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                withAnimation(.spring()) {
                                    self.isAnimating = true
                                }
                            }
                        }
        Text(item.name)
            .foregroundColor(item.rarity.color)
            .font(.system(size:35))
          
        
        Spacer()
        VStack{
            
            if(item.quantity == 1){
                ZStack{
                    Rectangle()
                        .frame(width: 200,height: 50)
                        .cornerRadius(15)
                    Text("Item unique 🏆")
                        .foregroundStyle(Color.white)
                        
                }
                
            }
        }
        Spacer()
        
        List{
            Section(header:Text("Information")){
                
                VStack{
                    
                    HStack{
                        Image(item.game.coverName!)
                            .frame(width: 58,height: 58)
                            .cornerRadius(4)
                            .foregroundColor(Color.gray)
                            .padding()
                          
                        Text(item.game.name)
                       
                    }
                    Text("In-game:" + item.name)
                 
                    Text("Puissance (ATQ) : "+String(item.attackStrenght!) )
               
                    Text("Possédé(s) " + String(item.quantity))
                    
                    Text("Rareté : " + item.rarity.rawValue)
                    
                    
                }.background(Color.white)
                
            }
        }.listStyle(InsetGroupedListStyle())
        
        
           
        
        
    }
}

struct LootDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LootDetailView(item: LootItem(quantity: 1, name: "Sample Item", type: .bow, rarity: .common, attackStrenght: 10, game: Game(name: "Sample Game", genre: .rpg, coverName: "sample_cover")))
    }
}
