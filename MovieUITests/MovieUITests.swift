//
//  MovieUITests.swift
//  MovieUITests
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import XCTest

final class MovieUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchMovieWithTitle() {
        let app = XCUIApplication()
        app.launch()
        let movie = app.textFields["title"]
        movie.tap()
        movie.typeText("avatar")
        app.buttons["Search"].tap()
    }
    
    func testAdvanceSearchMovieWithTitle() {
        let app = XCUIApplication()
        app.launch()
        let movie = app.textFields["title"]
        movie.tap()
        movie.typeText("avatar")
        app.buttons["Advanced Filter"].tap()
        let year = app.textFields["year"]
        year.tap()
        year.typeText("2009")
        app.buttons["Search"].tap()
    }
    
    func testCollectionViewMovieWithTitle() {
        let app = XCUIApplication()
        app.launch()
        let movie = app.textFields["title"]
        movie.tap()
        movie.typeText("avatar")
        app.buttons["Advanced Filter"].tap()
        let year = app.textFields["year"]
        year.tap()
        year.typeText("2009")
        app.buttons["Search"].tap()
        app.collectionViews.cells.element(boundBy:0).tap()
        app.staticTexts.element(matching: .any, identifier: "Avatar")
        app.staticTexts.element(matching: .any, identifier: "Action, Adventure, Fantasy")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
