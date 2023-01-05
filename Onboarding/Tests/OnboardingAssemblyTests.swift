//
//  OnboardingAssemblyTests.swift
//  Onboarding-Unit-Tests
//
//  Created by Егор Бадмаев on 04.01.2023.
//

import XCTest
@testable import Onboarding

class OnboardingAssemblyTests: XCTestCase {
    
    /// SUT.
    var assembly: OnboardingAssembly!
    var context: OnboardingContext!
    
    /**
     In the next tests we will check that the module consists of the correct parts and all dependencies are filled in.
     The tests will differ by creating different contexts
     */
    
    func testAssemblingWithModuleOutput() throws {
        let moduleOutput = SpyOnboardingModuleOutput()
        context = OnboardingContext(moduleOutput: moduleOutput)
        assembly = OnboardingAssembly.assemble(with: context)
        
        XCTAssertNotNil(assembly.input)
        XCTAssertNotNil(assembly.router, "Module router should not be nil")
        XCTAssertNotNil(assembly.viewController)
        
        guard let _ = assembly.viewController as? OnboardingViewController,
              let presenter = assembly.input as? OnboardingPresenter,
              let _ = assembly.router as? OnboardingRouter
        else {
            XCTFail("Module was assebled with wrong components")
            return
        }
        XCTAssertIdentical(moduleOutput, presenter.moduleOutput, "All injected dependencies should be identical")
        /// Unfortunately, it is impossible to access Core Data manager, that is why it is impossible to test its' injecting. DI was tested in `Cookbook/ServiceLocatorTests.swift`.
    }
    
    func testAssemblingWithoutModuleOutput() throws {
        context = OnboardingContext(moduleOutput: nil)
        assembly = OnboardingAssembly.assemble(with: context)
        
        XCTAssertNotNil(assembly.input)
        XCTAssertNotNil(assembly.router)
        XCTAssertNotNil(assembly.viewController)
        
        guard let _ = assembly.viewController as? OnboardingViewController,
              let presenter = assembly.input as? OnboardingPresenter,
              let _ = assembly.router as? OnboardingRouter
        else {
            XCTFail("Module was assebled with wrong components")
            return
        }
        XCTAssertNil(presenter.moduleOutput, "Module output was not provided and should be nil")
    }
}
