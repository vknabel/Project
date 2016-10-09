import XCTest
@testable import Project
import ProjectTests

var tests = [XCTestCaseEntry]()
tests += ProjectTests.allTests()
XCTMain(tests)
