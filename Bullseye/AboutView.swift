//
//  AboutView.swift
//  Bullseye
//
//  Created by Oliver Curtis on 02/05/2020.
//  Copyright © 2020 Oliver Curtis. All rights reserved.
//

import SwiftUI

struct AboutView: View {
  
  let beige = Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
  
  struct AboutHeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
        .font(Font.custom("Chalkboard SE", size: 30))
        .foregroundColor(Color.black)
        .padding(.top, 20)
        .padding(.bottom, 20)
    }
  }
  
  struct AboutBodyStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
        .font(Font.custom("Chalkboard SE", size: 16))
        .foregroundColor(Color.black)
        .padding(.leading, 60)
        .padding(.trailing, 60)
        .padding(.bottom, 20)
    }
  }
  
  var body: some View {
    Group{
      VStack{
        Text("🎯 Bullseye 🎯").modifier(AboutHeadingStyle())
        Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(AboutBodyStyle())
        Text("Your goal is to place tghe slider as close as possible to the target value. The closer you are, the more points you score").modifier(AboutBodyStyle())
        Text("Enjoy!").modifier(AboutBodyStyle())
      }
      .navigationBarTitle("About Bullseye")
      .background(beige)
    }
    .background(Image("Background"))
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
      AboutView().previewLayout(.fixed(width: 896, height: 414))
  }
}
