//
//  ButtonView.swift
//  Bullseye
//
//  Created by Oliver Curtis on 13/05/2022.
//

import SwiftUI

struct ButtonView: View {
	
	@Binding var alertIsVisible: Bool
	@Binding var sliderValue: Double
	@Binding var game: Game
	
	var body: some View {
		Button(action: {
			print("Hit me tapped")
			alertIsVisible = true
		}) {
			Text("Hit me".uppercased())
				.bold()
				.font(.title3)
		}
		.padding(20.0)
		.background(
			ZStack {
				Color("ButtonColor")
				LinearGradient(
					gradient: Gradient(
						colors: [Color.white.opacity(0.3), Color.clear]
					),
					startPoint: .top,
					endPoint: .bottom
				)
			}
		)
		.foregroundColor(Color.white)
		.cornerRadius(21.0)
		.alert("Hello there!", isPresented: $alertIsVisible) {
			Button("Awesome!") { print("Awesome tapped") }
			Button("Stop!") { print("Stop tapped") }
		} message: {
			let roundedValue = Int(sliderValue.rounded())
			Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round.")
		}
	}
}
