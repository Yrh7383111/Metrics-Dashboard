//
//  ATCOrder.swift
//  DashboardApp
//
//  Created by Florian Marcu on 7/29/18.
//  Copyright © 2018 Instamobile. All rights reserved.
//

import UIKit

class ATCOrder: ATCDashboardItem {
    var receiptNumber: String
    var price: String
    var productName: String
    var customerName: String
    var createdAt: Date
    var gateway: String
    var isNew: Bool
    var isRefund: Bool

    init(price: String, receiptNumber: String, productName: String, customerName: String, createdAt: Date, gateway: String, isNew: Bool, isRefund: Bool, imageURL: String) {
        let separator = " \u{2022} "
        let desc = customerName + separator + gateway + separator + receiptNumber + separator + TimeFormatHelper.string(for: createdAt, format: "MMM dd")
        let properties = [
            ATCDashboardProperty(name: "Creation Date", value: TimeFormatHelper.string(for: createdAt, format: "MMM dd")),
            ATCDashboardProperty(name: "Product Name", value: productName),
            ATCDashboardProperty(name: "Customer Name", value: customerName),
            ATCDashboardProperty(name: "Payment Gateway", value: gateway),
            ATCDashboardProperty(name: "Refund", value: isRefund ? "Yes" : "No"),
            ATCDashboardProperty(name: "Receipt Number", value: receiptNumber),
            ATCDashboardProperty(name: "Final Price", value: price),

            ]
        self.receiptNumber = receiptNumber
        self.price = price
        self.productName = productName
        self.customerName = customerName
        self.createdAt = createdAt
        self.gateway = gateway
        self.isNew = isNew
        self.isRefund = isRefund

        super.init(id: "123", title: productName, valueString: price, valueColor: (isRefund ? "#CC3530" : "#3068CC"), descriptionString: desc, imageURL: imageURL, properties: properties)
    }

    required init(jsonDict: [String: Any]) {
        fatalError()
    }
}
