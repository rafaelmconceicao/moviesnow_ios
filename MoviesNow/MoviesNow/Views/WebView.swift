import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let videoURL = URL(string: url) {
            let request = URLRequest(url: videoURL)
            webView.load(request)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

