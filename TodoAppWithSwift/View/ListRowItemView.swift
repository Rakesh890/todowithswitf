//
//  ListRowItemView.swift
//  TodoAppWithSwift
//
//  Created by Rakesh on 06/07/23.
//

import SwiftUI

struct ListRowItemView: View {
    let itemModel: ItemModel
    var body: some View {
        HStack(content: {
            Image(systemName: itemModel.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(itemModel.isCompleted ? Color.green : .red)
            Text(itemModel.title)
         Spacer()
        }).padding(.vertical,10).font(.subheadline)
    }
}

struct ListRowItemView_Previews: PreviewProvider {
    static var item1 = ItemModel(Title: "First todo task", IsCompleted: false)
    static var item2 = ItemModel(Title: "First two task", IsCompleted: true)
    static var previews: some View {
        Group{
            ListRowItemView(itemModel: item1)
            ListRowItemView(itemModel: item2)
        }.previewLayout(.sizeThatFits)
    }
}
