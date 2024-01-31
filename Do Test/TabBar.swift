//
//  TabBar.swift
//  Do Test
//
//  Created by Степаненко Андрей on 31.01.2024.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "list.bullet.clipboard")
                Text("Home")
            }
            
            ContentView().tabItem() {
                Image(systemName: "person")
                Text("Account")
            }
        }
        .tint(.accentColor)
    }
}



struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
