//
//  Store.swift
//  ReswiftPlayground
//
//  Created by Tyler Combs on 2/4/19.
//  Copyright © 2019 Monscierge. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift

let repository: RandomColorRepository = RandomColorRepository()
let colorEpics = ColorEpics(repository: repository)

let rootEpic = combineEpics(epics: colorEpics.epics())
let epicMiddleware = createEpicMiddleware(rootEpic: rootEpic)


let store = Store<RootState>(reducer: rootReducer, state: nil,  middleware: [epicMiddleware])
