//
//  ColorReducer.swift
//  ReswiftPlayground
//
//  Created by Tyler Combs on 2/4/19.
//  Copyright © 2019 Monscierge. All rights reserved.
//

import ReSwift
import UIKit

let colors = [UIColor.white, UIColor.green, UIColor.red, UIColor.yellow, UIColor.purple, UIColor.cyan]
func colorReducer(action: Action, state: ColorState?) -> ColorState {
    // if no state has been provided, create the default state
    var state = state ?? ColorState()
    
    switch action {
    case let a as RandomColorSuccess:
        state.color = a.color
    default:
        break
    }
    
    return state
}
