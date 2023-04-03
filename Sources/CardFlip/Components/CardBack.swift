//
//  SwiftUIView.swift
//  
//
//  Created by Irakli Lomidze on 03.04.23.
//

import SwiftUI

struct CardBack: View {
    let width : CGFloat
    let height : CGFloat
    let image: Image
    /// The degree of rotation for the card
    @Binding var degree : Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            image
                .resizable()
                .frame(width: width, height: height)
                .foregroundColor(.red)
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

// MARK: - Preview
#if DEBUG
/// A struct that provides a preview of the back of the card
struct CardBack_Previews: PreviewProvider {
    static var previews: some View {
        CardBack(
            width: 200,
            height: 250,
            image: Image(systemName: "xmark.circle.fill"),
            degree: Binding<Double>.constant(0)
        )
    }
}
#endif
