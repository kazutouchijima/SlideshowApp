//
//  ViewController.swift
//  SlideshowApp
//
//  Created by MacBookAir on 2018/02/26.
//  Copyright © 2018年 taro.yamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    //Outlet
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    
    //画像の配列
    let images:[String] = ["IMG_4174.jpg","IMG_4187.jpg","IMG_4172.jpg"]
    //配列のナンバー
    var number:Int = 0
    
    var timer: Timer!
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    //var transScale = CGAffineTransform()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //画像を読み込む
        let image = UIImage(named: images[number])
        
        //画像を表示
        imageView.image = image
        
        //画像をタップすると拡大
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.onTapImage(_:))))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のDisplayViewControllerを取得する
        let displayViewController:displayViewController = segue.destination as! displayViewController
        
        displayViewController.imagex = images[number]
       
    }
    
    
    //進むボタン
    @IBAction func goButton(_ sender: Any) {
        number = number + 1
        
        //画像が３枚なので、numberが３より大きくなったら0になる
        if(number > images.count) {
            number = 0
        }
        imageView.image = UIImage(named: images[number])
    }
    
    
    //戻るボタン
    @IBAction func backButton(_ sender: Any) {
        number = number - 1
        //画像が３枚なので、numberが-３より大きくなったら０になる
        if(number < -images.count) {
            number = 0
        }
        imageView.image = UIImage(named: images[number])
    }
 
    
    //更新用関数 updateTimer()
    @objc func updateTimer(timer: Timer) {
        
        
        //画像を読み込む
        let image = UIImage(named: images[number])
        
        //画像を表示
        imageView.image = image
        
        number += 1
        
        self.timer?.invalidate()
 
        
        
    }
    
    //再生/停止ボタン
    @IBAction func playStopButton(_ sender: Any) {
       // if self.timer != nil {
        
            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
            goButton.isEnabled  = false //進むボタンを停止
            backButton.isEnabled  = false //戻るボタンを停止
        //}
        
    }
    
    //@objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
       
        // 画像を拡大
        //performSegue(withIdentifier: "displayViewController", sender: nil)
    //}
    
    //ボタンを押すと画面を遷移
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
        
        // 画像を拡大する.
        let myScaleUpView: UIImageView = UIImageView(frame:  CGRect(x: 100, y: 120, width: 100, height: 100))
        
        // Viewに追加する.
        self.view.addSubview(myScaleUpView)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }


}

