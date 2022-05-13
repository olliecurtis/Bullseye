//
//  ContentView.swift
//  Bullseye
//
//  Created by Oliver Curtis on 28/01/2022.
//

import SwiftUI

struct ContentView: View {
  
  @State private var alertIsVisible: Bool = false
  @State private var sliderValue: Double = 50.0
  @State private var game: Game = Game()

  var body: some View {
    VStack {
      Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .bold()
        .kerning(2.0)
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
      Text(String(game.target))
        .kerning(-1.0)
        .font(.largeTitle)
        .fontWeight(.black)
      HStack {
        Text("1")
          .bold()
        Slider(value: self.$sliderValue, in:1.0...100.0)
        Text("100")
          .bold()
      }
      Button(action: {
        print("Hit me tapped")
        self.alertIsVisible = true
      }) {
        Text("Hit me")
      }
      .alert("Hello there!", isPresented: $alertIsVisible) {
        Button("Awesome!") { print("Awesome tapped") }
        Button("Stop!") { print("Stop tapped") }
      } message: {
        let roundedValue: Int = Int(self.sliderValue.rounded())
        Text("The slider's value is \(roundedValue).\n" + "You scored \(self.game.points(sliderValue: roundedValue)) points this round.")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

//  .alert(
//    "Hello there!",
//    isPresented: $alertIsVisible,
//    presenting: {
//      let roundedValue = Int(sliderValue.rounded())
//      return (
//        roundedValue,
//        game.points(sliderValue: roundedValue)
//      )
//    } () as (roundedValue: Int, points: Int)
//  ) { data in
//    Button("Awesome!") {
//      game.startNewRound(points: data.points)
//    }
//  } message: { data in
//    Text("The slider's value is \(data.roundedValue).\n" + "You scored \(data.points) points this round.")
//  }
