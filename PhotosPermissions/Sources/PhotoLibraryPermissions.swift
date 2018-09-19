//
//  PhotoLibraryPermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Photos

public protocol PhotoLibraryPermissions {
    
    func requestPermissions(handler: @escaping (PHAuthorizationStatus) -> Void)
    func permissionsState() -> PHAuthorizationStatus
}

open class DefaultPhotoLibraryPermissions: PhotoLibraryPermissions {
    
    public func requestPermissions(handler: @escaping (PHAuthorizationStatus) -> Void) {
        PHPhotoLibrary.requestAuthorization { _ in
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }
                handler(self.permissionsState())
            }
        }
    }
    
    public func permissionsState() -> PHAuthorizationStatus {
        return PHPhotoLibrary.authorizationStatus()
    }
    
}
