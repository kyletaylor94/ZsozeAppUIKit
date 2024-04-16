//
//  LottieAnimations.swift
//  ZsozeAppUIKit
//
//  Created by Turdesan Csaba on 16/04/2024.
//

import Foundation
import Lottie
import UIKit

class LottieAnimations: UIViewController {
    private var animationView: LottieAnimationView?

    override func viewDidLoad() {

      super.viewDidLoad()
            
      animationView = .init(name: "Animation - 1713282500452")
      animationView!.frame = view.bounds
      animationView!.contentMode = .scaleAspectFit
      animationView!.loopMode = .loop
      animationView!.animationSpeed = 0.5
      
      view.addSubview(animationView!)
      animationView!.play()
      
    }
}
