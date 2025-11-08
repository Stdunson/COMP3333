//
//  ViewController.swift
//  sdunson_animationMusic
//
//  Created by Shavaughn Dunson on 10/30/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var PlayButton: UIButton!
    
    var myImages: [UIImage] = []
    var songPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // load images
        for i in 1...6{
            myImages.append(UIImage(named: "p\(i).png")!)
            
        }
        PlayButton.setTitle("PLAY", for: .normal)
        imageView.animationImages = myImages
        imageView.animationDuration = 1.0
        imageView.image = myImages[0]
        
        let song = Bundle.main.path(forResource: "BadDay", ofType: "mp3")
        let url = URL(fileURLWithPath: song!)
        do{
            songPlayer = try AVAudioPlayer(contentsOf: url)
        }catch{
            print("Error loading audio")
        }
        
    }

    @IBAction func playPause(_ sender: Any) {
        if imageView.isAnimating{
            imageView.stopAnimating()
            PlayButton.setTitle("PLAY", for: .normal)
            imageView.image = myImages[0]
            songPlayer.stop()
        }else{
            imageView.startAnimating()
            PlayButton.setTitle("STOP", for: .normal)
            songPlayer.play()
        }
    }
    
    
}

