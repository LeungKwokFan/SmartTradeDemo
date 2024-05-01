//
//  ViewController.swift
//  SmartTradeDemo
//
//  Created by Frank Leung on 30/4/2024.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }

    func setUpElements(){
        
        Utilities.styleFilledButton(signUpButton)
        
        Utilities.styleFilledButton(loginButton)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let bundlePath = Bundle.main.path(forResource: "joey", ofType: "mp4")
        
        guard bundlePath != nil else{return}
        
        let url = URL(filePath: bundlePath!)
        
        let item = AVPlayerItem(url: url)
        
        videoPlayer = AVPlayer(playerItem: item)
        
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
//        videoPlayer?.isMuted = true
        
        
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        videoPlayer?.playImmediately(atRate: 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        videoPlayer?.pause()
    }

}

