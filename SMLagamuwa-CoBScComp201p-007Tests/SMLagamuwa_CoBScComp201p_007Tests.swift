//
//  SMLagamuwa_CoBScComp201p_007Tests.swift
//  SMLagamuwa-CoBScComp201p-007Tests
//
//  Created by notX on 2021-10-25.
//

import XCTest
@testable import SMLagamuwa_CoBScComp201p_007

class SMLagamuwa_CoBScComp201p_007Tests: XCTestCase {

    var sut: RegistrationViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = RegistrationViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCTAssertTrue(sut.email.isEmpty)
        XCTAssertTrue(sut.pass.isEmpty)
        XCTAssertTrue(sut.repass.isEmpty)
        XCTAssertTrue(sut.nibmID.isEmpty)
        XCTAssertTrue(sut.vehicleNo.isEmpty)
        XCTAssertTrue(sut.name.isEmpty)
        XCTAssertTrue(!sut.showPrompt)
        
        XCTAssertTrue(sut.passwordsMatch())
        XCTAssertTrue(!sut.isPasswordValid())
        XCTAssertTrue(!sut.isEmailValid())
        XCTAssertTrue(!sut.isNibmIdValid())
        XCTAssertTrue(!sut.isVehicleNoValid())
        XCTAssertTrue(!sut.isNameValid())
        XCTAssertTrue(!sut.isNicValid())
        XCTAssertTrue(!sut.isSignUpComplete)
        
        XCTAssertEqual(sut.confirmPwPrompt, "")
        XCTAssertEqual(sut.emailPrompt, "")
        XCTAssertEqual(sut.passwordPrompt, "")
        XCTAssertEqual(sut.nibmIdPrompt, "")
        XCTAssertEqual(sut.vehicleNoPrompt, "")
        XCTAssertEqual(sut.namePrompt, "")
        XCTAssertEqual(sut.nicPrompt, "")
        
    }
    
    func showPromptTest() throws {
        
        sut.showPrompt = true
        
        XCTAssertTrue(sut.email.isEmpty)
        XCTAssertTrue(sut.pass.isEmpty)
        XCTAssertTrue(sut.repass.isEmpty)
        XCTAssertTrue(sut.nibmID.isEmpty)
        XCTAssertTrue(sut.vehicleNo.isEmpty)
        XCTAssertTrue(sut.name.isEmpty)
        XCTAssertTrue(sut.showPrompt)
        
        XCTAssertTrue(sut.passwordsMatch())
        XCTAssertTrue(!sut.isPasswordValid())
        XCTAssertTrue(!sut.isEmailValid())
        XCTAssertTrue(!sut.isNibmIdValid())
        XCTAssertTrue(!sut.isVehicleNoValid())
        XCTAssertTrue(!sut.isNameValid())
        XCTAssertTrue(!sut.isNicValid())
        XCTAssertTrue(!sut.isSignUpComplete)
        
        XCTAssertEqual(sut.confirmPwPrompt, "")
        XCTAssertEqual(sut.emailPrompt, "Enter a valid email address")
        XCTAssertEqual(sut.passwordPrompt, "Must be between 5 and 15 characters")
        XCTAssertEqual(sut.nibmIdPrompt, "Enter a valid NIBM ID")
        XCTAssertEqual(sut.vehicleNoPrompt, "Enter a valid Vehicle Number")
        XCTAssertEqual(sut.namePrompt, "Enter a name with characters between 5 and 100 including space")
        XCTAssertEqual(sut.nicPrompt, "Enter a valid nic. 9 numbers ending with v/x or 12 numbers")
        
        sut.pass = "1234"
        sut.repass = "12345"
        XCTAssertTrue(!sut.passwordsMatch())
        XCTAssertEqual(sut.confirmPwPrompt, "Password fields do not match")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


