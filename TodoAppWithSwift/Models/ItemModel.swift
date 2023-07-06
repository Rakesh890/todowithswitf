//
//  ItemModel.swift
//  TodoAppWithSwift
//
//  Created by Rakesh on 06/07/23.
//

import Foundation

struct ItemModel : Identifiable,Codable{
    let title:String
    let isCompleted:Bool
    let id: String
    
    init(Id: String = UUID().uuidString,
         Title: String,
         IsCompleted: Bool){
        self.id = Id
        self.title = Title
        self.isCompleted = IsCompleted
    }
    
    func updateComplete() -> ItemModel{
        return ItemModel(Id:id,Title: title, IsCompleted:!isCompleted);
    }
}

