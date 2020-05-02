//
//  ContentView.swift
//  Bullseye
//
//  Created by Oliver Curtis on 24/04/2020.
//  Copyright © 2020 Oliver Curtis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var alertIsVisible = false
  @State var sliderValue = 50.0
  @State var target = Int.random(in: 1...100)
  @State var total = 0
  @State var round = 1
  
  
  func sliderValueRounded() -> Int {
    Int(sliderValue.rounded())
  }
  
  func amountOff() -> Int {
    abs(target - sliderValueRounded())
  }
  
  func pointsForCurrentRound() -> Int {
    let maximumScore = 100
    var points = maximumScore - amountOff()
    let difference = amountOff()
    if(difference == 0) {
      points += 100
    } else if (difference == 1) {
      points += 50
    }
    return points
  }
  
  func alertTitle() -> String {
    let difference = amountOff()
    let title: String
    if difference == 0 {
      title = "Perfect!"
    } else if difference < 5 {
      title = "You almost had it!"
    } else if difference <= 10 {
      title = "Not bad."
    } else {
      title = "Are you even trying?"
    }
    return title
  }
  
  func resetGame() {
    round = 1
    total = 0
    sliderValue = 50.0
    target = Int.random(in:1...100)
  }
  
  var body: some View {
    VStack {
      Spacer()
      // Target row
      HStack {
        Text("Put the bullseye as close as you can to:")
        Text("\(target)")
      }
      Spacer()
      // Slider row
      HStack {
        Text("1")
        Slider(value: $sliderValue, in:1...100)
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
        return Alert(title: Text(alertTitle()),
               message: Text("The slider's value is \(sliderValueRounded()).\n" + "You scored \(pointsForCurrentRound()) points this round"),
               dismissButton: .default(Text("Play again")) {
                  self.total = self.total + self.pointsForCurrentRound()
                  self.target = Int.random(in:1...100)
                  self.round += 1
                })
      }
      Spacer()
      // Score row
      HStack {
        Button(action: {
          self.resetGame()
        }) {
          Text("Start over")
        }
        Spacer()
        Text("Score:")
        Text("\(total)")
        Spacer()
        Text("Round:")
        Text("\(round)")
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
