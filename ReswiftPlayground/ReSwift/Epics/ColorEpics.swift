//
//  ColorEpics.swift
//  ReswiftPlayground
//
//  Created by Tyler Combs on 2/5/19.
//  Copyright © 2019 Monscierge. All rights reserved.
//

import RxSwift
import ReSwift

class ColorEpics {
    
    private let repository: RandomColorRepository
    
    init(repository: RandomColorRepository) {
        self.repository = repository
    }
    
    lazy var fetchRandomColorEpic: Epic = {
        return { (actionObservable: Observable<Action>) in
            
            return actionObservable.filter({ (action: Action) -> Bool in
                let isOfType = action is FetchRandomColor
                return isOfType
            })
                .flatMap({ (action) -> Observable<Action> in
                    return self.repository.fetchRandomColor()
                        .asObservable()
                        .map({ (c) -> Action in
                            return RandomColorSuccess(
                                color: c
                            )
                        })
                })
        }
    }()
    
    var epics: [Epic] { return [fetchRandomColorEpic] }
}
