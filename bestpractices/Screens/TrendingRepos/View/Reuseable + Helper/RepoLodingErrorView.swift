//
//  RepoLodingErrorView.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import UIKit
import Lottie

class RepoLodingErrorView: UIView {
    
    @IBOutlet private weak var retryBtn: UIButton?
    @IBOutlet private var container: RepoLodingErrorView!
    
    @IBOutlet private weak var animationView: AnimationView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
  private func loadView () {
    Bundle.main.loadNibNamed("RepoLodingErrorView", owner: self, options: nil)
    container.loadXib(self)
        
    }
    override func layoutSubviews() {
       animateLottie()
        setupRetryButton()
    }
    
   private func animateLottie() {
        // 1. Set animation content mode
          
          animationView?.contentMode = .scaleAspectFit
          
          // 2. Set animation loop mode
          
         animationView?.loopMode = .loop
          
          // 3. Adjust animation speed
          
          animationView?.animationSpeed = 0.5
          
          // 4. Play animation
         animationView?.play()
       
    }
   private func setupRetryButton() {
        retryBtn?.backgroundColor = .clear
        retryBtn?.layer.cornerRadius = 5
        retryBtn?.layer.borderWidth = 1
    retryBtn?.layer.borderColor = Constants.appPrimaryColor.cgColor
    retryBtn?.setTitleColor(Constants.appPrimaryColor, for: .normal)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
