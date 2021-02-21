//
//  ViewController.swift
//  smartbazar
//
//  Created by DoSSi4 on 18.02.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITabBarDelegate{
    @IBOutlet var webview: WKWebView!
    @IBOutlet weak var tabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBar.delegate = self
        webview.load(URLRequest(url: URL(string:"https://smartbazar.kz")!))
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadWebView(_:)), for: .valueChanged)
           webview.scrollView.addSubview(refreshControl)
        
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
            webview.load(URLRequest(url: URL(string: "https://smartbazar.kz/products/75")!))
            
        }
        else if (item.tag == 3){
            webview.load(URLRequest(url: URL(string: "https://smartbazar.kz/products/74")!))
        }
        else if (item.tag == 4){
            webview.load(URLRequest(url: URL(string: "https://smartbazar.kz/products/92")!))
        }
        else if (item.tag == 5){
            webview.load(URLRequest(url: URL(string: "https://smartbazar.kz/products/73")!))
        }
        }
    
    }




