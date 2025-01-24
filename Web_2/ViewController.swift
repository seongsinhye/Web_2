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
    
    // myWebView 가 로딩중일때 중간에 로딩 원 돌아가도록
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        MyActivityIndicator.startAnimating()
        MyActivityIndicator.isHidden = false
    }
    // 로딩 완료시 원 돌아가는거 멈추기
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        MyActivityIndicator.stopAnimating()
        MyActivityIndicator.isHidden = true
    }
    // 로딩 실패시 원 돌아가는거 멈추기
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
        MyActivityIndicator.stopAnimating()
        MyActivityIndicator.isHidden = true
    }
    
    // 검색 영역에 http 있는지 체크 후 없으면 http:// 붙여주는 함수
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
 
    // Go 버튼 클릭시 주소에 적힌 곳으로 이동 함
    @IBAction func btnGoToUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGoSit1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    
  
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    
    @IBAction func btnLoadHtmlSTring(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"http://2sam.net\"> 2sam</a>으로 이동 </p>"
        MyWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        MyWebView.load(myRequest)
        
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        MyWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        MyWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        MyWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        MyWebView.goForward()
    }
}

