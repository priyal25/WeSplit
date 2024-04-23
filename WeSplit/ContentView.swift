//
//  ContentView.swift
//  WeSplit
//
//  Created by Priyal on 10/30/23.
//

import SwiftUI

struct ContentView: View {
        

    @State private var checkAmount = 0.0
    @State private var numberOfPeopleIndex = 0
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    @FocusState private var amountIsFocused: Bool


    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeopleIndex + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)

                    Picker("Number of people", selection: $numberOfPeopleIndex) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }.pickerStyle(.menu)
                }
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: "USD"))
                }
            }.navigationTitle("We Split")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
