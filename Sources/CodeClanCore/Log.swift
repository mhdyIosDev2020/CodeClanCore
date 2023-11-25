//
//  Log.swift
//  CodeClanCore
//
//  Created by Mahdi_iOS on 13/08/23.
//

import Foundation
//MARK: - log
extension Global.Funcs {
    
    static func safePrint(_ message: String) {
        //FATAL: uncomment
        #if DEBUG
        print(message)
        #endif
    }
    
    static private func printLogHead() {
        safePrint("◽️-------------------------- \n \n")
    }
    
    static private func printLogTail() {
        safePrint("◼️-------------------------- \n \n")
    }
    
    static private func bareLog(isFull: Bool, _ message: Any, file: String = #file, function: String = #function, line: Int = #line, type: LogingType = .warning) {
        
        let moreDetail = isFull ? "file: \(file) \n function: \(function) \n line: \(line) \n" : ""
        let message = moreDetail + "\(type.rawValue) \n\n \(message)" + " l0G"
        safePrint(message)
    }
    
    static func fullLog(_ message: Any, file: String = #file, function: String = #function, line: Int = #line, type: LogingType = .warning) {
        printLogHead()
        bareLog(isFull: true, message, type: type)
        printLogTail()
    }
    
    public static func log(_ message: Any, type: LogingType = .warning,isFull: Bool = false) {
        printLogHead()
        bareLog(isFull: isFull, message, type: type)
        printLogTail()
    }

    static func headedLog(_ message: Any, type: LogingType = .warning) {
        printLogHead()
        bareLog(isFull: false, message, type: type)
    }
    
    static func tailedLog(_ message: Any, type: LogingType = .warning) {
        bareLog(isFull: false, message, type: type)
        printLogTail()
    }
    
}
public enum LogingType: String {
    case warning = "🟡🟡🟡🟡"
    case error = "🔴🔴🔴🔴"
    case ok = "🟢🟢🟢🟢"
    case action = "⚪️⚪️⚪️⚪️"
    case canceled = "🔵🔵🔵🔵"
    case other = "🟣🟣🟣🟣"
}
