//
//  ContentView.swift
//  WeSplit
//
//  Created by Izaan Saleem on 22/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var amountForTheCheck: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    /*let tempratureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var selectedFromTemprature: String = ""
    @State private var selectedToTemprature: String = ""
    @State private var enteredTemprature = ""
    var calculatedTemprature: Double {
        let enteredTemprature = Double(enteredTemprature) ?? 0.0
        if selectedFromTemprature == selectedToTemprature { return enteredTemprature }
        if selectedFromTemprature == "Celsius" && selectedToTemprature == "Fahrenheit" {
            return (enteredTemprature * 9/5) + 32
        } else if selectedFromTemprature == "Celsius" && selectedToTemprature == "Kelvin" {
            return enteredTemprature + 273.15
        } else if selectedFromTemprature == "Fahrenheit" && selectedToTemprature == "Celsius" {
            return (enteredTemprature - 32) * 5/9
        } else if selectedFromTemprature == "Fahrenheit" && selectedToTemprature == "Kelvin" {
            return (enteredTemprature - 32) * 5/9 + 273.15
        } else if selectedFromTemprature == "Kelvin" && selectedToTemprature == "Celsius" {
            return enteredTemprature - 273.15
        } else if selectedFromTemprature == "Kelvin" && selectedToTemprature == "Fahrenheit" {
            return (enteredTemprature - 273.15) * 9/5 + 32
        }
        return 0
    }
    
    @State private var inputLength = ""
    @State private var inputLengthUnit = "Meters"
    @State private var outputLengthUnit = "Meters"
    let lengthUnits = ["Meters", "KMs", "Feet", "Yards", "Miles"]
    
    var convertedLengthValue: Double {
        let inputLengthDouble = Double(inputLength) ?? 0
        let inputInMeters = convertToMeters(value: inputLengthDouble, unit: inputLengthUnit)
        return convertFromMeters(value: inputInMeters, unit: outputLengthUnit)
    }
    
    @State private var inputTimeValue = ""
    @State private var inputTimeUnit = "Seconds"
    @State private var outputTimeUnit = "Seconds"
    
    let timeUnits = ["Seconds", "Minutes", "Hours", "Days"]
    
    var convertedTimeValue: Double {
        let inputValueDouble = Double(inputTimeValue) ?? 0
        let inputInSeconds = convertToSeconds(value: inputValueDouble, unit: inputTimeUnit)
        return convertFromSeconds(value: inputInSeconds, unit: outputTimeUnit)
    }
    
    
    @State private var inputVolumeValue = ""
    @State private var inputVolumeUnit = "Milliliters"
    @State private var outputVolumeUnit = "Milliliters"
    
    let volumeUnits = ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]

    var convertedValue: Double {
        let inputVolumeValueDouble = Double(inputVolumeValue) ?? 0
        let inputInMilliliters = convertToMilliliters(value: inputVolumeValueDouble, unit: inputVolumeUnit)
        return convertFromMilliliters(value: inputInMilliliters, unit: outputVolumeUnit)
    }*/

    
    var body: some View {
        NavigationStack {
            /*Form {
                Section("Temperature conversion") {
                    TextField("Temprature", text: $enteredTemprature)
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    Picker("From", selection: $selectedFromTemprature) {
                        ForEach(tempratureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("To", selection: $selectedToTemprature) {
                        ForEach(tempratureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    Text("Result: \(calculatedTemprature)")
                        .padding()
                }
                Section("Length Conversion") {
                    TextField("Enter value", text: $inputLength)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("From", selection: $inputLengthUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Picker("To", selection: $outputLengthUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("Result: \(convertedLengthValue.formatted())")
                        .padding()
                }
                Section("Time Conversion") {
                    TextField("Enter value", text: $inputTimeValue)
                        .keyboardType(.decimalPad)
                    Picker("From", selection: $inputTimeUnit) {
                        ForEach(timeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("To", selection: $outputTimeUnit) {
                        ForEach(timeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    Text("Result: \(convertedTimeValue.formatted())")
                        .padding()
                }
                Section("Volume Conversion") {
                    TextField("Enter value", text: $inputVolumeValue)
                        .keyboardType(.decimalPad)
                    Picker("From", selection: $inputVolumeUnit) {
                        ForEach(volumeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("To", selection: $outputVolumeUnit) {
                        ForEach(volumeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    Text("Result: \(convertedValue.formatted())")
                        .padding()
                }
            }*/
            Form {
                Section {
                    TextField(
                        "Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                }
                .pickerStyle(.navigationLink)
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Amount for the check") {
                    Text(amountForTheCheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .background(tipPercentage > 0 ? Color.clear : Color.red)
                }
            }
            .navigationTitle("Conversion")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        /*NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI")
            Button("Tap Count: \(tapCount)") {
                self.tapCount += 1
            }
            .padding()
        }*/
    }
    
    func convertToMeters(value: Double, unit: String) -> Double {
        switch unit {
        case "Meters":
            return value
        case "KMs":
            return value * 1000
        case "Feet":
            return value / 3.28084
        case "Yards":
            return value / 1.09361
        case "Miles":
            return value * 1609.34
        default:
            return value
        }
    }
    
    func convertFromMeters(value: Double, unit: String) -> Double {
        switch unit {
        case "Meters":
            return value
        case "KMs":
            return value / 1000
        case "Feet":
            return value * 3.28084
        case "Yards":
            return value * 1.09361
        case "Miles":
            return value / 1609.34
        default:
            return value
        }
    }
    
    func convertToSeconds(value: Double, unit: String) -> Double {
        switch unit {
        case "Seconds":
            return value
        case "Minutes":
            return value * 60
        case "Hours":
            return value * 3600
        case "Days":
            return value * 86400
        default:
            return value
        }
    }
    
    func convertFromSeconds(value: Double, unit: String) -> Double {
        switch unit {
        case "Seconds":
            return value
        case "Minutes":
            return value / 60
        case "Hours":
            return value / 3600
        case "Days":
            return value / 86400
        default:
            return value
        }
    }
    
    func convertToMilliliters(value: Double, unit: String) -> Double {
        switch unit {
        case "Milliliters":
            return value
        case "Liters":
            return value * 1000
        case "Cups":
            return value * 236.588
        case "Pints":
            return value * 473.176
        case "Gallons":
            return value * 3785.41
        default:
            return value
        }
    }
    
    func convertFromMilliliters(value: Double, unit: String) -> Double {
        switch unit {
        case "Milliliters":
            return value
        case "Liters":
            return value / 1000
        case "Cups":
            return value / 236.588
        case "Pints":
            return value / 473.176
        case "Gallons":
            return value / 3785.41
        default:
            return value
        }
    }
}

#Preview {
    ContentView()
}
