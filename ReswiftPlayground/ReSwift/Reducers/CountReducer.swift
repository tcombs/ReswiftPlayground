//
//  CountReducer.swift
//  ReswiftPlayground
//
//  Created by Tyler Combs on 2/4/19.
//  Copyright © 2019 Monscierge. All rights reserved.
//

import ReSwift

func countReducer(action: Action, state: CountState?) -> CountState {
    // if no state has been provided, create the default state
    var state = state ?? CountState()
    
    switch action {
    case _ as IncreaseCount:
        state.count += 1
    case _ as DecreaseCount:
        state.count -= 1
    default:
        break
    }
    
    return state
}
