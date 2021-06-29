//
//  ContentView.swift
//  Conversion
//
//  Created by Trevor Maltbie on 6/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = ""
    @State private var inputUnits = 2
    @State private var outputUnits = 0
    
    let degrees = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convert: Double {
        let input = Double(userInput) ?? 0
        
        let from = Measurement(value: input, unit: UnitLength.meters)
        
        return 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("This number...")) {
                    TextField("degrees", text: $userInput)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("From...")) {
                    Picker("Unit of Length", selection: $inputUnits) {
                        ForEach(0 ..< degrees.count) {
                            Text("\(self.degrees[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Into...")) {
                    Picker("Unit of Length", selection: $outputUnits) {
                        ForEach(0 ..< degrees.count) {
                            Text("\(self.degrees[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result:")) {
                    
                }
            }
            .navigationTitle("Converrrt...")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
