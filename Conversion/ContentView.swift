//
//  ContentView.swift
//  Conversion
//
//  Created by Trevor Maltbie on 6/28/21.
//

import SwiftUI

struct ContentView: View {
    
    enum TempType: String, CaseIterable {
        case celsius = "Celsius"
        case fahrenheit = "Fahrenheit"
        case kelvin = "Kelvin"
    }
    
    @State private var userInput = ""
    @State private var inputUnits: TempType = .celsius
    @State private var outputUnits: TempType = .fahrenheit
    
    var conversion: Double {
        let inputAmount = Double(userInput) ?? 0
        var conversionInput: Double = 0
        var conversionResult: Double = 0
        
        switch inputUnits {
        case .celsius:
            conversionInput = inputAmount + 273.15
        case .fahrenheit:
            conversionInput = (inputAmount - 32) * 5 / 9 + 273.15
        case .kelvin:
            conversionInput = inputAmount
        }
        
        switch outputUnits {
        case .celsius:
            conversionResult = conversionInput - 273.15
        case .fahrenheit:
            conversionResult = ((conversionInput - 273.15) * 9 / 5) + 32
        case .kelvin:
            conversionResult = conversionInput
        }
        
        return conversionResult
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("This number...")) {
                    TextField("Enter Amount", text: $userInput)
                        .keyboardType(.decimalPad)
                    Picker("Input Amount", selection: $inputUnits) {
                        ForEach(TempType.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Picker("Input Amount", selection: $outputUnits) {
                        ForEach(TempType.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("\(conversion, specifier: "%.2f")")
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
