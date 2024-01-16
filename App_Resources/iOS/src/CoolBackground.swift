//
//  Space.swift
//  Cool Loaders
//
//  Created by vijay verma on 24/12/23.
//

import SwiftUI

struct CoolBackground: View {

    var shaderColor: Shader {
        let function = ShaderFunction(
            library: .default,
            name: "aqua"
        )
        let shader = Shader(function: function, arguments: [])
        return shader
    }

    @State private var circleRotation1: Double = 0.0
    @State private var circleRotation2: Double = 0.0


    let start = Date()
    @State private var xOffset = -500.0 // Start offscreen to the left

    var body: some View {
                        ZStack{
                            TimelineView(.animation) { context in
                                Rectangle()
                                    .foregroundStyle(.white)
                                    // .aqua(
                                    //     seconds: context.date.timeIntervalSince1970 - self.start.timeIntervalSince1970
                                    // )
                                    .starField(
                                        seconds: context.date.timeIntervalSince1970 - self.start.timeIntervalSince1970
                                    )
                                    // .circleLoader(
                                    //     seconds: context.date.timeIntervalSince1970 - self.start.timeIntervalSince1970
                                    // )
                            }
                        }
                        // .frame(width: 400, height: 400)
                    }
}
// Nativescript
@objc
class CoolBackgroundProvider: UIViewController, SwiftUIProvider {
    private var swiftUI: CoolBackground?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    required public init() {
        super.init(nibName: nil, bundle: nil)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        swiftUI = CoolBackground()
        setupSwiftUIView(content: swiftUI)
    }

    /// Receive data from NativeScript
    func updateData(data: NSDictionary) {}
    /// Allow sending of data to NativeScript
    var onEvent: ((NSDictionary) -> ())?
}


extension View {
    func circleLoader(seconds: Double) -> some View {
        self
            .colorEffect(
                ShaderLibrary.default.circleLoader(.boundingRect, .float(seconds))
            )
    }
}

extension View {
    func starField(seconds: Double) -> some View {
        self
            .colorEffect(
                ShaderLibrary.default.starField(.boundingRect, .float(seconds))
            )
    }
}

extension View {
    func aqua(seconds: Double) -> some View {
        self
            .colorEffect(
                ShaderLibrary.default.aqua(.boundingRect, .float(seconds))
            )
    }
}