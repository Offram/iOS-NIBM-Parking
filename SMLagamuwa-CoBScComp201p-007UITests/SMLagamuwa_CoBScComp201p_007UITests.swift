//
//  SMLagamuwa_CoBScComp201p_007UITests.swift
//  SMLagamuwa-CoBScComp201p-007UITests
//
//  Created by notX on 2021-10-25.
//

import XCTest

class SMLagamuwa_CoBScComp201p_007UITests: XCTestCase {
    
    var app: XCUIApplication!
    var registerButton: XCUIElement!
    
    override func setUp() {
        
            app = XCUIApplication()
            app.launch()
            
            registerButton = app.tables["RegistrationView_RegisterBtn"]
    }
    
    override func tearDown() {
        app = nil
    }
    
    func testExistanceOfUIElements() throws {
        
        XCTAssertTrue(registerButton.exists, "Register button doesn't exist in View")
    }
}
