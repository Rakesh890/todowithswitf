//
//  TodoAppWithSwiftApp.swift
//  TodoAppWithSwift
//
//  Created by Rakesh on 06/07/23.
//

import SwiftUI

@main
struct TodoAppWithSwiftApp: App {
    
    ///declare state
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
//                NoListView()
                ListView()
            })
            .environmentObject(listViewModel)
        }
    }
}
