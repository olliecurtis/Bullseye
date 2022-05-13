//
//  ContentView.swift
//  Bullseye
//
//  Created by Oliver Curtis on 28/01/2022.
//

import SwiftUI

struct ContentView: View {
	
	@State private var alertIsVisible = false
	@State private var sliderValue = 50.0
	@State private var game = Game()
	
	var body: some View {
		ZStack {
			Color("BackgroundColor")
				.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			VStack {
				InstructionsView(game: $game)
				SliderView(sliderValue: $sliderValue)
				ButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
			}.padding()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
		ContentView()
			.previewLayout(.fixed(width: 568, height: 320))
		ContentView()
			.preferredColorScheme(.dark)
		ContentView()
			.preferredColorScheme(.dark)
			.previewLayout(.fixed(width: 568, height: 320))
	}
}
