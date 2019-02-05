//
//  ColorActions.swift
//  ReswiftPlayground
//
//  Created by Tyler Combs on 2/4/19.
//  Copyright © 2019 Monscierge. All rights reserved.
//

import ReSwift

struct FetchRandomColor: Action {}
struct RandomColorSuccess: Action {
    let color: Int
}
