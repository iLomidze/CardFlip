import SwiftUI

/// A struct that represents the main view of the CardFlip
public struct CardFlip: View {
    // MARK: Properties
    /// The degree of rotation for the back of the card
    @State private  var backDegree = 0.0
    /// The degree of rotation for the front of the card
    @State private var frontDegree = -90.0
    /// A boolean that keeps track of whether the card is flipped or not
    @State private var isOpen = false
    
    /// The duration and delay of the flip animation
    private var durationAndDelay : CGFloat = 0.3
    
    private let width : CGFloat
    private let height : CGFloat
    private let frontImage: Image
    private let backImage: Image
    
    public init (
        cardState: CardState = .closed,
        width: CGFloat,
        height: CGFloat,
        frontImage: Image,
        backImage: Image
    ) {
        self.isOpen = cardState.isOpen
        self.width = width
        self.height = height
        self.frontImage = frontImage
        self.backImage = backImage
    }

    public var body: some View {
        ZStack {
            CardFront(width: width, height: height, image: frontImage, degree: $frontDegree)
            CardBack(width: width, height: height, image: backImage, degree: $backDegree)
        }.onAppear{
            setInitialDegrees(for: isOpen)
        }
        .onTapGesture {
            flipCard ()
        }
    }
}

private extension CardFlip {
    func setInitialDegrees(for cardState: Bool) {
        if cardState {
            self.backDegree = 90
            self.frontDegree = 0
        }
    }
}

// MARK: - API Methods
public extension CardFlip {
    /// A function that flips the card by updating the degree of rotation for the front and back of the card
    func flipCard () {
        isOpen = !isOpen
        if isOpen {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
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
            cardState: .closed,
            width: 200,
            height: 250,
            frontImage: Image(systemName: "person.fill"),
            backImage: Image(systemName: "xmark.circle.fill")
        )
    }
}
#endif
