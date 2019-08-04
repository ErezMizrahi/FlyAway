//
//  SplashScreenViewController.swift
//  Flights
//
//  Created by hackeru on 04/08/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit
import Lottie

class SplashScreenViewController: UIViewController, Storyboarded {
   

    @IBOutlet weak var animView: UIView!
    weak var animationView : AnimationView?
    weak var splashDelegate: IStartSearch?

    override func viewDidLoad() {
        super.viewDidLoad()

            loadAnimation(name: "flight2")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
 
    
    
    private func loadAnimation(name : String){
        let animationView = AnimationView(name: name)
        animationView.contentMode = .scaleAspectFit
        animationView.frame = animView.bounds
        animationView.loopMode = .autoReverse
        animView.addSubview(animationView)
        
        animationView.play()
        
        self.animationView = animationView
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        animationView?.frame = animView.bounds
        animationView?.stop()
        animationView?.play()
    }
    
    

    @IBAction func letsStartAction(_ sender: Any) {
        splashDelegate?.letsSearch()
    }
    

}


protocol IStartSearch: class {
    func letsSearch()
}
