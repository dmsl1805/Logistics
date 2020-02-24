//
//  Observer.swift
//  Logistics
//
//  Created by Dmytro Shulzhenko on 5/15/19.
//

import Foundation
import RxSwift

// MARK: Observer
// Like Any Observer but accepts only next events.

public final class SafeObserver<Element> {
    private let observer: AnyObserver<Element>
    
    public init(_ observer: AnyObserver<Element>) {
        self.observer = observer
    }
    
    public func next(_ element: Element) {
        observer.onNext(element)
    }
    
    public func complete() {
        observer.onCompleted()
    }
}

public extension SafeObserver where Element == Void {
    func next() {
        next(())
    }
}

public extension ObservableType {
    func bind(to observer: SafeObserver<Element>) -> Disposable {
        bind(to: observer, handleError: { logFatal($0) })
    }
    
    func bind(
        to observer: SafeObserver<Element>,
        handleError: @escaping (Error) -> Void
    ) -> Disposable {
        subscribe(onNext: observer.next, onError: handleError)
    }
}

func logFatal(_ error: Error) {
    assertionFailure("SafeObserver does not accept errors \(error)")
}
