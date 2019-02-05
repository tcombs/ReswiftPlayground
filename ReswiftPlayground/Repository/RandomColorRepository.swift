//
//  RandomColorRepository.swift
//  ReswiftPlayground
//
//  Created by Tyler Combs on 2/5/19.
//  Copyright © 2019 Monscierge. All rights reserved.
//

import Foundation
import RxSwift

class RandomColorRepository {
    
    private let colors = [0xFB3640, 0x6E8898, 0x1D7874, 0x94E8B4, 0x2364AA]
    func fetchRandomColor() -> Single<Int> {
        return Single.just(colors.randomElement()!)
    }
}
