//
//  RootReducer.swift
//  ReswiftPlayground
//
//  Created by Tyler Combs on 2/4/19.
//  Copyright © 2019 Monscierge. All rights reserved.
//


import ReSwift

func rootReducer(action: Action, state: RootState?) -> RootState {
    return RootState(
        countState: countReducer(action: action, state: state?.countState),
        colorState: colorReducer(action: action, state: state?.colorState)
    )
}
