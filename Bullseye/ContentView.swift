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
  
  var body: some View {
    VStack {
      Text("Welcome!")
        .font(.title)
        .fontWeight(.semibold)
        .foregroundColor(Color.orange)
      Button(action: {
        self.alertIsVisible = true
      }) {
        Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
          .fontWeight(.medium)
      }
      .alert(isPresented: $alertIsVisible) {
        () ->
          Alert in
            return Alert(title: Text("Hello there!"), message: Text("This is my first popup"), dismissButton: .default(Text("Awesome")))
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 896, height: 414))
  }
}
