//
//  Dispatcher.swift
//  Logistics
//
//  Created by Dmytro Shulzhenko on 5/15/19.
//

import Foundation
import RxSwift

public protocol Dispatcher {
    // To declare manually
    
    associatedtype State
    associatedtype Action
    
    // Will be generated

    var bag: DisposeBag { get }
    var state: State { get }
    var action: Action { get }
    
    associatedtype ActionDispatcher
    associatedtype StateDispatcher
    
    var actionDispatcher: ActionDispatcher { get }
    var stateDispatcher: StateDispatcher { get }
}

public extension Dispatcher {
    typealias Reducer = (ActionDispatcher, DisposeBag) -> Void
    
    func reduced(with reducer: Reducer) -> Self {
        reducer(actionDispatcher, bag)
        return self
    }
    
    typealias Middleware = (StateDispatcher, DisposeBag) -> Void
    
    func reduced(with middleware: Middleware) -> Self {
        middleware(stateDispatcher, bag)
        return self
    }
}
