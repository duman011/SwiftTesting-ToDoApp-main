//
//  SwiftTestingUITests.swift
//  SwiftTestingUITests
//
//
//  Created by Yaşar Duman on 16.09.2023.
//
import XCTest

class SwiftTestingUITests: XCTestCase {
    
    func testToDoItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        
        let addButton = app.navigationBars["SwiftTesting.View"].buttons["Add"]
        
        let textField =  app.alerts["Add Item"].scrollViews.otherElements.collectionViews.textFields["Enter Item"]
        
        let okBUtton = app.alerts["Add Item"].scrollViews.otherElements.buttons["OK"]
        
        let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do").element
        
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okBUtton.tap()
        
        XCTAssertTrue(addedCell.exists) // exists -> addedCell varmı diye kontrol eder
        

    }
    
    func testDeleteItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        
        let addButton = app.navigationBars["SwiftTesting.View"].buttons["Add"]
        
        let textField =  app.alerts["Add Item"].scrollViews.otherElements.collectionViews.textFields["Enter Item"]
        
        let okBUtton = app.alerts["Add Item"].scrollViews.otherElements.buttons["OK"]
        
        let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do").element
        
        
        //tables
        
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]

        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okBUtton.tap()
        
        addedCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addedCell.exists)// exists -> addedCell Yokmu diye kontrol eder
                                           
    
    }
 
}
