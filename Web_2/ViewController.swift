//
//  ViewController.swift
//  Web_2
//
//  Created by 성신혜 on 1/23/25.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var MyWebView: WKWebView!
    @IBOutlet weak var MyActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        MyWebView.load(myRequest)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 처음 접속시 로드 되는 사이트 주소
        loadWebPage("http://2sam.net")
        MyWebView.navigationDelegate = self
    }
 
    @IBAction func btnGoToUrl(_ sender: UIButton) {
    }
    
    @IBAction func btnGoSit1(_ sender: UIButton) {
    }
    
  
    @IBAction func btnGoSite2(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadHtmlSTring(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
    }
}

