//
//  displayViewController.swift
//  SlideshowApp
//
//  Created by MacBookAir on 2018/03/01.
//  Copyright © 2018年 taro.yamada. All rights reserved.
//

import UIKit

class displayViewController: UIViewController {

    @IBOutlet weak var imageView2: UIImageView!
    
    
    
    // 受け取るためのプロパティ（変数）を宣言しておく
    var imagex:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像を読み込む
        let image = UIImage(named: imagex)
        // Do any additional setup after loading the view.
        //画像を表示
        imageView2.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //前の画面に戻るボタン
    @IBAction func backButton(_ sender: Any) {
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
