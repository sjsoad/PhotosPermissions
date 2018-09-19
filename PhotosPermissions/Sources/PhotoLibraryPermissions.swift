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
        PHPhotoLibrary.requestAuthorization { [weak self] _ in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                handler(strongSelf.permissionsState())
            }
        }
    }
    
    public func permissionsState() -> PHAuthorizationStatus {
        return PHPhotoLibrary.authorizationStatus()
    }
    
}
