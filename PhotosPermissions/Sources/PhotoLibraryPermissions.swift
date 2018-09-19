//
//  PhotoLibraryPermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Photos

public protocol PhotoLibraryPermissions {
    
    typealias PermissionsState = PHAuthorizationStatus
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void)
    func permissionsState() -> PermissionsState
}

open class DefaultPhotoLibraryPermissions: PhotoLibraryPermissions {
    
    public init() {}
    
    public func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        PHPhotoLibrary.requestAuthorization { _ in
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }
                handler(self.permissionsState())
            }
        }
    }
    
    public func permissionsState() -> PermissionsState {
        return PHPhotoLibrary.authorizationStatus()
    }
    
}
