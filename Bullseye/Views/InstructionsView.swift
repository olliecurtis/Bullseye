//
//  InstructionsView.swift
//  Bullseye
//
//  Created by Oliver Curtis on 13/05/2022.
//

import SwiftUI

struct InstructionsView: View {
	
	@Binding var game: Game
	
	var body: some View {
		VStack {
			InstructionText(text: "Put the Bullseye as close as you can to")
				.padding(.leading, 30.0)
				.padding(.trailing, 30.0)
			BigNumberText(text: String(game.target))
		}
	}
}
