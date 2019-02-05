//
//  Epic.swift
//  ReswiftPlayground
//
//  Created by Tyler Combs on 2/4/19.
//  Copyright © 2019 Monscierge. All rights reserved.
//

import RxSwift
import ReSwift
typealias Epic = (_ actionObservable: Observable<Action>) -> Observable<Action>
