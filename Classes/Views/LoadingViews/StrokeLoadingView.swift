//
//  StrokeLoadingView.swift
//  LoadingControllerDemo
//
//  Created by Sapozhnik Ivan on 28.06.16.
//  Copyright © 2016 Sapozhnik Ivan. All rights reserved.
//

import UIKit

class StrokeLoadingView: LoadingView, Animatable {

	var activity = StrokeActivityView()

	override init(frame: CGRect) {
		super.init(frame: frame)
		defaultInitializer()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		defaultInitializer()
	}
	
	private func defaultInitializer() {
        let size = CGSize(width: 34, height: 34)
        activity.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
		addSubview(activity)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
        activity.center = CGPoint(x: bounds.midX, y: bounds.midY)
	}
	
	func startAnimating() {
		
		let delay = 0.0 * Double(NSEC_PER_SEC)
        
        #if swift(>=2.3)
            let time = DispatchTime.now() + delay
            DispatchQueue.main.asyncAfter(deadline: time) {
                // your code here
                self.activity.animating = true
            }
        #else
            let time = DispatchTime.now(dispatch_time(DispatchTime.now(), Int64(delay)))
            dispatch_after(time, DispatchQueue.main, {
                self.activity.animating = true
            })
        #endif
	
	}
	
	func stopAnimating() {
		activity.animating = false
	}
	
}
