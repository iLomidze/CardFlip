import SwiftUI

/// A struct that represents the main view of the CardFlip
public struct CardFlip: View {
    /// The degree of rotation for the back of the card
    @State var backDegree = 0.0
    /// The degree of rotation for the front of the card
    @State var frontDegree = -90.0
    /// A boolean that keeps track of whether the card is flipped or not
    @State var isFlipped = false
    
    var width : CGFloat = 200
    var height : CGFloat = 250
    let frontImage: Image
    let backImage: Image
    
    /// The duration and delay of the flip animation
    var durationAndDelay : CGFloat = 0.3

    public var body: some View {
        ZStack {
            CardFront(width: width, height: height, image: frontImage, degree: $frontDegree)
            CardBack(width: width, height: height, image: backImage, degree: $backDegree)
        }.onTapGesture {
            flipCard ()
        }
    }
}

// MARK: - Methods
private extension CardFlip {
    /// A function that flips the card by updating the degree of rotation for the front and back of the card
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
/// A struct that provides a preview of the CardFlip
struct CardFlip_Previews: PreviewProvider {
    static var previews: some View {
        CardFlip(
            width: 200,
            height: 250,
            frontImage: Image(systemName: "person.fill"),
            backImage: Image(systemName: "xmark.circle.fill")
        )
    }
}
#endif
