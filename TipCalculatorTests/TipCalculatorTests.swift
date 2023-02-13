//
//  TipCalculatorTests.swift
//  TipCalculatorTests
//
//  Created by Juan Sebastian Orozco Buitrago on 2/11/23.
//

import XCTest
import Mockingbird
import Combine
@testable import TipCalculator

final class TipCalculatorTests: XCTestCase {
    
    // sut -> System under test
    private var sut: CalculatorVM!
    private var cancellables: Set<AnyCancellable>!
    
    private let logoViewTapSubject = PassthroughSubject<Void, Never>()
    
    // Mocking
    //let mockAudioPlayer = mock(AudioPlayerServiceProtocol.self)

    override func setUp() {
        //sut = .init(audioPlayerService: mockAudioPlayer)
        sut = .init()
        cancellables = .init()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        cancellables = nil
    }
    
    func testResultWithoutTipFor1Person() {
        // given
        let bill: Double = 100.0
        let tip: Tip = .none
        let split: Int = 1
        
        let input = buildInput(bill: bill, tip: tip, split: split)
        // when
        let output = sut.transform(input: input)
        // then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 100)
            XCTAssertEqual(result.totalBill, 100)
            XCTAssertEqual(result.totalTip, 0)
        }.store(in: &cancellables)
    }
    
    private func buildInput(bill: Double, tip: Tip, split: Int) -> CalculatorVM.Input {
        return .init(
            billPublisher: Just(bill).eraseToAnyPublisher(),
            tipPublisher: Just(tip).eraseToAnyPublisher(),
            splitPublisher: Just(split).eraseToAnyPublisher(),
            logoViewTapPublisher: logoViewTapSubject.eraseToAnyPublisher()
        )
    }

}
