//
//  ViewController.swift
//  smartbazar
//
//  Created by DoSSi4 on 18.02.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITabBarDelegate, WKNavigationDelegate{
    @IBOutlet var webview: WKWebView!
    @IBOutlet weak var tabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBar.delegate = self
        webview.navigationDelegate = self
        webview.load(URLRequest(url: URL(string:"https://smartbazar.kz")!))
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadWebView(_:)), for: .valueChanged)
           webview.scrollView.addSubview(refreshControl)
        webview.allowsBackForwardNavigationGestures = true
        webview.allowsLinkPreview = true
        webview.sizeToFit()
        
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host{
            if host.contains("smartbazar.kz"){
                decisionHandler(.allow)
                return
            }
        }
            decisionHandler(.cancel)
        
    }
    @objc func reloadWebView(_ sender: UIRefreshControl){
        webview?.reload()
        sender.endRefreshing()
    
    }
        
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    
        if(item.tag == 1){
            webview.load(URLRequest(url: URL(string: "https://smartbazar.kz")!))
        }
        else if (item.tag == 2){
            webview.load(URLRequest(url: URL(string: "https://smartbazar.kz/catalog")!))
        }
        else if (item.tag == 3){
            webview.load(URLRequest(url: URL(string: "https://smartbazar.kz/wishlist")!))
        }
        else if (item.tag == 4){
            webview.load(URLRequest(url: URL(string: "https://smartbazar.kz/cart")!))
        }
        else if (item.tag == 5){
            webview.load(URLRequest(url: URL(string: "https://smartbazar.kz/profile")!))
        }
        }
    
    
    }




