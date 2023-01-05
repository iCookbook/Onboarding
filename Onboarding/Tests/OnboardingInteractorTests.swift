//
//  OnboardingInteractorTests.swift
//  Onboarding-Unit-Tests
//
//  Created by Егор Бадмаев on 04.01.2023.
//

import XCTest
@testable import Onboarding

class OnboardingInteractorTests: XCTestCase {
    
    var presenter: SpyOnboardingPresenter!
    /// SUT.
    var interactor: OnboardingInteractor!
    
    override func setUpWithError() throws {
        interactor = OnboardingInteractor()
        presenter = SpyOnboardingPresenter()
        interactor.presenter = presenter
    }
    
    override func tearDownWithError() throws {
        interactor = nil
        presenter = nil
    }
    
    func testSettingHasOnboardedTrue() throws {
        interactor.setHasOnboardedTrue()
        
        XCTAssertTrue(UserDefaults.hasOnboarded)
        XCTAssertTrue(presenter.didSetHasOnboardedFlag)
    }
}
