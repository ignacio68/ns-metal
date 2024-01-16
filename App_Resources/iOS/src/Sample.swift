import SwiftUI

struct MetalSample: View {
    @State var start = Date()
    @State var tapCount: CGFloat = 0

    var body: some View {
        ZStack {
            TimelineView(.animation) { context in
                Rectangle()
                    .foregroundStyle(.white)
                    .timeLines(
                        seconds: context.date.timeIntervalSince1970 - self.start.timeIntervalSince1970,
                        tapValue: tapCount
                    )
            }
            Button(action: {
               self.tapCount += 1
            }) {
                Text("Metal is Dope")
            }
        }
    }
}

@objc
class MetalSampleProvider: UIViewController, SwiftUIProvider {
    private var swiftUI: MetalSample?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    required public init() {
        super.init(nibName: nil, bundle: nil)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        swiftUI = MetalSample()
        setupSwiftUIView(content: swiftUI)
    }

    /// Receive data from NativeScript
    func updateData(data: NSDictionary) {}
    /// Allow sending of data to NativeScript
    var onEvent: ((NSDictionary) -> ())?
}


extension View {

    func timeLines(seconds: Double,  tapValue: CGFloat ) -> some View {
        self
            .colorEffect(
                ShaderLibrary.default.timeLines(
                    .boundingRect,
                    .float(seconds),
                    .float(tapValue))
            )
    }
}
