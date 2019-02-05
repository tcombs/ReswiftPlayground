//
//  createEpicMiddleware.swift
//  ReswiftPlayground
//
//  Created by Tyler Combs on 2/4/19.
//  Copyright © 2019 Monscierge. All rights reserved.
//

import RxSwift
import ReSwift


//public typealias DispatchFunction = (Action) -> Void
//public typealias Middleware<State> = (@escaping DispatchFunction, @escaping () -> State?)
//    -> (@escaping DispatchFunction) -> DispatchFunction

struct ReSwiftObservableInit: Action {}

func createEpicMiddleware(rootEpic: Epic) -> Middleware<RootState> {
    let inputActions = BehaviorSubject<Action>(value: ReSwiftObservableInit())
    let outputActions = rootEpic(inputActions)
    
    return { dispatch, getState in
        outputActions
            .subscribe(onNext: { action in
                dispatch(action)
            })
        return { next in
            return { action in
                next(action)
                inputActions.onNext(action)
            }
        }
    }
}
