//
//  ContentView.swift
//  Shared
//
//  Created by 邱緯輔 on 2021/9/29.
//

import SwiftUI

struct ContentView: View {
    let cat: String = "(cat)"
    
    var body: some View {
        Text("Hello, world!(cat😺)" + cat)
            .padding()
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

