//
//  ViewController.swift
//  ReswiftPlayground
//
//  Created by Tyler Combs on 2/4/19.
//  Copyright © 2019 Monscierge. All rights reserved.
//

import UIKit
import ReSwift
class ViewController: UIViewController, StoreSubscriber {
  
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        store.subscribe(self) { (sub: Subscription<RootState>) -> Subscription<CountState> in
//            return sub.select({ (rootState) -> CountState in
//                return rootState.countState
//            }).skipRepeats({ (left, right) -> Bool in
//                return left == right
//            })
//        }
        
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }

    func newState(state: RootState) {
        label.text = String(state.countState.count)
        label.textColor = UIColor(rgb: state.colorState.color)
    }

    @IBAction func lessClicked(_ sender: Any) {
        store.dispatch(DecreaseCount())
    }
    
    @IBAction func moreClicked(_ sender: Any) {
        store.dispatch(IncreaseCount())
    }
    
    @IBAction func randomColor(_ sender: Any) {
        store.dispatch(FetchRandomColor())
    }
}

