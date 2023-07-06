//
//  ListViewModel.swift
//  TodoAppWithSwift
//
//  Created by Rakesh on 06/07/23.
//

import Foundation

class ListViewModel: ObservableObject{
    @Published var itemList: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    ///Lets define local storgae key
    let itemsKey: String = "items_list";
    
    init(){
        getItems()
    }
    
    ///Save into storage
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(itemList){
            ///Store list data into locall storage using userDerfault
            UserDefaults.standard.setValue(encodeData, forKey: itemsKey)
        }
    }

    
    ///Getting data from local storages
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else{
            return
        }
        ///Wiil decode data from get into string
        ///which will convert into your model type and assign to the items list;
        guard let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data) else{return };
        
        self.itemList = saveItems;
    }
    
    ///add items
    func addItems(title: String){
        let newItem = ItemModel(Title: title, IsCompleted: false)
        
        itemList.append(newItem);
    }
    
    func updateItem(item: ItemModel){
        if let index = itemList.firstIndex(where: {$0.id == item.id}){
            itemList[index] = item.updateComplete();
        }
    }
    
    func deletedItem(index: IndexSet){
        itemList.remove(atOffsets: index)
    }
    
    func moveItems(from: IndexSet, to : Int){
        itemList.move(fromOffsets: from, toOffset: to)
    }
    
}
