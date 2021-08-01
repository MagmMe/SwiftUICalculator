//
//  ContentView.swift
//  SwiftUI Calculator APP
//
//  Created by Marcin Magiera on 21/07/2021.
//

import SwiftUI

enum CalculatorButton: String{
    
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case decimal
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "X"
        case .divide: return "/"
        case .percent: return "%"
        case .plusMinus: return "+/-"
        case .equals: return "="
        case .decimal: return "."
        default:
            return "AC"
        }
    }
    
    var backgroundColor: Color{
        switch self {
        case .zero, .decimal, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return Color(.orange)
        }
    }
}

// Einvorment object
// This is global aplication state

class GlobalEinvorment: ObservableObject {
    @Published var display = "45"
}


struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEinvorment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    
    
    var body: some View {
        

        ZStack(alignment: .bottom){
            
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 12){
                HStack(alignment:.top){
                    Spacer()
                    Text("Kalkulator finansowy")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        
                }.padding()
                
                HStack{
                    Spacer()
                    Text(env.display).foregroundColor(.white)
                        .font(.system(size:64))
                }.padding()
              
                
                // Looping through 2 dimensional array
                ForEach(buttons, id: \.self){row in
                    HStack (spacing: 12){
                        ForEach(row, id: \.self){button in
                            
                            Button(action: {
                                
                                // Action to create maths
                                self.env.display = button.title
                                
                            }) {
                                Text(button.title)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5 * 12) / 4
)
                                    .foregroundColor(.white)
                                    .background(button.backgroundColor)
                                    .cornerRadius(self.buttonWidth(button: button))
                            }
                            
                            
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 5 * 12) / 4 * 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEinvorment())
    }
}
