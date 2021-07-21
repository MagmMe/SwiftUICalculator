//
//  ContentView.swift
//  SwiftUI Calculator APP
//
//  Created by Marcin Magiera on 21/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    let  buttons = [
        ["7", "8", "9", "X"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", ".", "="]
    ]
    
    var body: some View {
        VStack{
            
            ForEach(buttons, id: \.self){row in
                HStack{
                    ForEach(row, id: \.self){button in
                        Text(button)
                            .font(.system(size: 32))
                            .frame(width:80, height:80)
                    }
                }
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
