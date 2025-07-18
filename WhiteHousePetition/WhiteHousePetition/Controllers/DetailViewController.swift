//
//  DeatailViewController.swift
//  WhiteHousePetition
//
//  Created by Dip on 15/7/25.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    // MARK: -  Properties
    var webView: WKWebView!
    var detailItem: PostModel!
    
    // MARK: -  LoadView
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPettionWithHtml()
    }
    
    // MARK: - Create loadPettionWithHtml method
    
    func loadPettionWithHtml() {
        guard let detailItem = detailItem else { return }
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        \(detailItem.body)
        </body>
        </html>
        """
        webView.loadHTMLString(html, baseURL: nil)
        
    }
    
    
}
