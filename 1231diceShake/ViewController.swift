//
//  ViewController.swift
//  1231diceShake
//
//  Created by 蔡家雯 on 2019/12/31.
//  Copyright © 2019 lesley tsai. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVPlayer?
    
    //使用outletcollection 建立outlet array
    @IBOutlet var diceImages: [UIImageView]!
    //圖片名稱
    let diceImageName = ["one","two","three","four","five","six"]
    
    //搖動iphone的固定寫法
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        for imageView in diceImages{
                imageView.image = UIImage(named: diceImageName.randomElement()!)
            }
        //將mp3加入shakesoung並讓它播放
            let shakesound = Bundle.main.url(forResource: "shake", withExtension: "mp3")!
            player = AVPlayer(url: shakesound)
            player?.play()
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //一開始讓骰子看不見 isHidden
        for imageView in diceImages{
            imageView.isHidden = true
        }
    }
    //顯示隱藏的siwtch開關
    @IBAction func showHideImageSwitch(_ sender: UISwitch) {
        for imageView in diceImages{
            imageView.isHidden = !sender.isOn
        }
    }
    //跟上述搖動一樣效果的按鈕
    @IBAction func shakePressBtn(_ sender: UIButton) {
        for imageView in diceImages{
            imageView.image = UIImage(named: diceImageName.randomElement()!)
        }
        let shakesound = Bundle.main.url(forResource: "shake", withExtension: "mp3")!
        player = AVPlayer(url: shakesound)
        player?.play()
    }
}


