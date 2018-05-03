//
//  PhotoLibraryPermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import Photos
import SKServicePermissions

open class PhotoLibraryPermissions: NSObject, ServicePermissions {
    
    public typealias PermissionsState = PHAuthorizationStatus
    
    public func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        PHPhotoLibrary.requestAuthorization { [weak self] _ in
            guard let strongSelf = self else { return }
            handler(strongSelf.permissionsState())
        }
    }
    
    public func permissionsState() -> PermissionsState {
        return PHPhotoLibrary.authorizationStatus()
    }
    
}
