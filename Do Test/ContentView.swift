//
//  ContentView.swift
//  Do Test
//
//  Created by Степаненко Андрей on 30.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.black.opacity(0.65))
            Text("Hello, user!")
                .font(.system(size: 30, weight: .bold))
            
            Spacer()
        }
        .padding(.top, 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
