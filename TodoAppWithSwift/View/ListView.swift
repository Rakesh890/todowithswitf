//
//  ListView.swift
//  TodoAppWithSwift
//
//  Created by Rakesh on 06/07/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        ZStack{
            if listViewModel.itemList.isEmpty {
            
                NoListView().transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List(content: {
                    ForEach(listViewModel.itemList, content: {
                        items in
                        
                        ListRowItemView(itemModel: items)
                            .onTapGesture {
                                withAnimation(.spring()){
                                    listViewModel.updateItem(item: items)
                                }
                            }
                   
                    }).onDelete(perform: listViewModel.deletedItem)
                        .onMove(perform: listViewModel.moveItems)
                    
                })
            }
        }.navigationTitle("Todo List").navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add",destination: AddView()))
            }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            ListView()
        }).environmentObject(ListViewModel())
    }
}
