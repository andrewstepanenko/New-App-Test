//
//  btntest.swift
//  Do Test
//
//  Created by Степаненко Андрей on 31.01.2024.
//

import SwiftUI

struct btntest: View {
    var body: some View {
        VStack {
            Group {
                Button(action: {
                    print("tapped!")
                }, label: {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(Color.green)
                        .cornerRadius(15)
                        .padding()
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
    }
}

struct btntest_Previews: PreviewProvider {
    static var previews: some View {
        btntest()
    }
}
