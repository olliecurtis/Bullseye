//
//  ContentView.swift
//  Bullseye
//
//  Created by Oliver Curtis on 24/04/2020.
//  Copyright © 2020 Oliver Curtis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var alertIsVisible: Bool = false
  @State var sliderValue: Double = 50.0
  
  var body: some View {
    VStack {
      Spacer()
      // Target row
      HStack {
        Text("Put the bullseye as close as you can to:")
        Text("100")
      }
      Spacer()
      // Slider row
      HStack {
        Text("1")
        Slider(value: self.$sliderValue, in:1...100)
        Text("100")
      }
      Spacer()
      // Button row
      Button(action: {
        self.alertIsVisible = true
      }) {
        Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
          .fontWeight(.medium)
      }
      .alert(isPresented: $alertIsVisible) { () -> Alert in
        let roundedValue: Int = Int(self.sliderValue.rounded())
        return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(roundedValue)."), dismissButton: .default(Text("Play again")))
      }
      Spacer()
      // Score row
      HStack {
        Button(action: {}) {
          Text("Start over")
        }
        Spacer()
        Text("Score:")
        Text("999999")
        Spacer()
        Text("Round:")
        Text("1")
        Spacer()
        Button(action: {}) {
          Text("Info")
        }
      }
      .padding(.bottom, 20)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 896, height: 414))
  }
}
