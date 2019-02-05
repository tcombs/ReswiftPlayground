//
//  combineEpics.swift
//  ReswiftPlayground
//
//  Created by Tyler Combs on 2/4/19.
//  Copyright © 2019 Monscierge. All rights reserved.
//

import RxSwift
import ReSwift


func combineEpics(epics: [Epic]) -> Epic  {
    
    struct FakeAction: Action {}
    let rootEpic: Epic = { actionObservable in
        
        let outputs = epics.map({ epic -> Observable<Action> in
            return epic(actionObservable)
        })
        return Observable.merge(outputs)
    }
    
    return rootEpic
}
