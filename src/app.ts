import { createApp, registerElement } from "nativescript-vue";
// import { registerSwiftUI, SwiftUI, UIDataDriver } from "@nativescript/swift-ui";
import { SFSymbol } from "./SFSymbol";
import Home from "./components/Home.vue";

// we could also run `ns typings ios` to include our custom types if desired
// declare var CoolBackgroundProvider: any;
// registerSwiftUI("coolBackground", (view) => new UIDataDriver(CoolBackgroundProvider.alloc().init(), view));
// registerElement("SwiftUI", () => SwiftUI);

createApp(Home).start();
