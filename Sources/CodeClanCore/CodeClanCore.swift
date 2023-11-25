//
//  CodeClanCore.swift
//  CodeClanCore
//
//  Created by Mahdi_iOS on 09/08/23.
//

import Foundation
public class CodeClanCore{
    public static let title = "Core title"
    
    
}

public func logMessage(_ message: Any, type: LogingType = .warning,isFull: Bool = false){
    Global.Funcs.log(message,type: type,isFull: isFull)
}
//MARK: Globals NameSapce
public enum Global {
    public enum Vars {
        
    }
    
    public enum Funcs {
        
    }
    
    public enum Constants {
        
    }
    
    public enum Keys {
        
    }
}
//MARK: Server Models
public enum ServerModels {
    public enum Response {
        
    }
    
    public enum DTO {
        
    }
}

//MARK: HTTPRequestHelpers
enum HTTP {
    enum Heplers {
        
    }
}
