//
//  ViewCodable.swift
//  homework_login_viewcode
//
//  Created by Victor Pizetta on 24/03/22.
//

import UIKit

public protocol ViewCodable {

    func buildHierarchy()

    func setupConstraints()

    func applyAdditionalChanges()
}

public extension ViewCodable {

    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

    func buildHierarchy() {}

    func setupConstraints() {}

    func applyAdditionalChanges() {}
}
