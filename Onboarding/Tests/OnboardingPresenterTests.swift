//
//  OnboardingPresenterTests.swift
//  Onboarding-Unit-Tests
//
//  Created by Егор Бадмаев on 04.01.2023.
//

import XCTest
@testable import Onboarding

class OnboardingPresenterTests: XCTestCase {
    
    let mockRouter = MockOnboardingRouter()
    var spyInteractor: SpyOnboardingInteractor!
    var spyModuleOutput: SpyOnboardingModuleOutput!
    /// SUT.
    var presenter: OnboardingPresenter!
    
    override func setUpWithError() throws {
        spyInteractor = SpyOnboardingInteractor()
        spyModuleOutput = SpyOnboardingModuleOutput()
        presenter = OnboardingPresenter(router: mockRouter, interactor: spyInteractor)
        presenter.moduleOutput = spyModuleOutput
    }
    
    override func tearDownWithError() throws {
        presenter = nil
        spyInteractor = nil
        spyModuleOutput = nil
    }
    
    func testHandleTappingOnContinueButton() throws {
        presenter.handleTappingOnContinueButton()
        
        XCTAssertNotNil(spyInteractor.setHasOnboardedFlag)
        XCTAssertTrue(spyInteractor.setHasOnboardedFlag)
    }
    
    /// From Interactor, close this module.
    func testDidSetHasOnboardedTrue() throws {
        presenter.didSetHasOnboardedTrue()
        
        XCTAssertNotNil(spyModuleOutput.onboardingModuleDidFinishFlag)
        XCTAssertTrue(spyModuleOutput.onboardingModuleDidFinishFlag)
    }
}
