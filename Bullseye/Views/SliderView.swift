//
//  SliderView.swift
//  Bullseye
//
//  Created by Oliver Curtis on 13/05/2022.
//

import SwiftUI

struct SliderView: View {
	
	@Binding var sliderValue: Double
	
	var body: some View {
		HStack {
			SliderLabelText(text: "1")
			Slider(value: $sliderValue, in:1.0...100.0)
			SliderLabelText(text: "100")
		}
		.padding()
	}
}
