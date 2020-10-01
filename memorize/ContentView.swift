//
//  ContentView.swift
//  memorize
//
//  Created by Rafael Freitas on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return ZStack(content: {
            RoundedRectangle(cornerRadius: 10.0)
                .fill()
            RoundedRectangle(cornerRadius: 10.0)
                .stroke()
            Text("👻")
        })
        .padding()
        .foregroundColor(.orange)
    }
}
































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
