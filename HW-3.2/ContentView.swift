//
//  ContentView.swift
//  HW-3.2
//
//  Created by Виталий Подшибякин on 10.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack() {
            Color(.blue)
                .ignoresSafeArea()
            VStack (spacing: 30){
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.init(red: redSliderValue / 255, green: greenSliderValue / 255, blue: blueSliderValue / 255))
                    .frame(height: 150)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 5))
                
                SliderView(value: $redSliderValue)
                    .tint(.red)
                SliderView(value: $greenSliderValue)
                    .tint(.green)
                SliderView(value: $blueSliderValue)
                    .tint(.blue)
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderView: View {
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(.white)
            Slider(value: $value, in: 0...255, step: 1)
            TextField("", value: $value, format: .number.notation(.compactName))
                .keyboardType(.decimalPad)
                
                .frame(width: 50)
                .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                )
                .background()
        }
    }
}
