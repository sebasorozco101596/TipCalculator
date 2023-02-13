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
    // Mock
    private var audioPlayerService: MockAudioPlayerService!
    
    // Mocking

    override func setUp() {
        // initializing the mock
        audioPlayerService = .init()
        // sending the mock by parameter
        sut = .init(audioPlayerService: audioPlayerService)
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
    
    func testSoundPlayedAndCalculatorResetOnLogoViewTap() {
        //given
        let input = buildInput(bill: 100.0, tip: .tenPercent, split: 2)
        let output = sut.transform(input: input)
        let expectation1 = XCTestExpectation(description: "reset calculator called")
        let expectation2 = audioPlayerService.expectation
        
        //then
        output.resetCalculatorPublisher.sink { _ in
            expectation1.fulfill()
        }.store(in: &cancellables)
        
        //when
        logoViewTapSubject.send()
        wait(for: [expectation1, expectation2], timeout: 1.0)
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

//MARK: - Mock class of audio player service
class MockAudioPlayerService: AudioPlayerServiceProtocol {
    var expectation = XCTestExpectation(description: "playSound is called")
    func playSound() {
        expectation.fulfill()
    }
}
