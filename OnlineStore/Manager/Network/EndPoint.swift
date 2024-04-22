//
//  EndPoint.swift
//  OnlineStore
//
//  Created by NikitaKorniuk   on 22.04.24.
//

import Foundation

enum EndPoint {
    case getProducts
    case getProductDetails(id: Int)
    case getCategories
    case getFilteredProducts(limit: Int?, offset: Int?, category: String?)
    case searchProductsByTitle(title: String)

    var path: String {
        switch self {
        case .getProducts, .getFilteredProducts, .searchProductsByTitle:
            return "/api/v1/products"
        case .getProductDetails(let id):
            return "/api/v1/products/\(id)"
        case .getCategories:
            return "/api/v1/categories"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .getFilteredProducts(let limit, let offset, let category):
            var items = [URLQueryItem]()
            if let limit = limit {
                items.append(URLQueryItem(name: "limit", value: String(limit)))
            }
            if let offset = offset {
                items.append(URLQueryItem(name: "offset", value: String(offset)))
            }
            if let category = category {
                items.append(URLQueryItem(name: "category", value: category))
            }
            return items.isEmpty ? nil : items
        case .searchProductsByTitle(let title):
            return [URLQueryItem(name: "title", value: title)]
        default:
            return nil
        }
    }
}
