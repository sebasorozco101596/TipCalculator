//
//  CalculatorVM.swift
//  TipCalculator
//
//  Created by Juan Sebastian Orozco Buitrago on 2/12/23.
//

import Foundation
import Combine

class CalculatorVM {
    
    private var cancellables = Set<AnyCancellable>()
    
    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }
    
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }
    
    func transform(input: Input) -> Output {
        
        input.tipPublisher.sink { tip in
            print("the tip percent is \(tip.stringValue)")
        }.store(in: &cancellables)
        
        let result = Result(
            amountPerPerson: 500,
            totalBill: 1000,
            totalTip: 200)
        
        return Output(updateViewPublisher: Just(result).eraseToAnyPublisher())
    }
}
