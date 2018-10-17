//
//  GNCellVM.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/10/16.
//  Copyright © 2018 XXDS. All rights reserved.
//

import Foundation
import Kingfisher


class GNCellViewModel {
    

    var title = MutableProperty("")
    var name = MutableProperty("")
    var image = MutableProperty(UIImage.init())
    var model =  MutableProperty(Model())
    
    init() {
        
        model.signal.observeValues { [unowned self] (newValue) in
            
            guard self.model.value.song_id == newValue.song_id else {
                
                self.title.value = newValue.title!
                self.name.value = newValue.artist_name!
                
                KingfisherManager.shared.retrieveImage(with: ImageResource.init(downloadURL: URL.init(string: newValue.pic_big!)!), options: nil, progressBlock: nil, completionHandler: { (image, _, _, _) in
                    
                    if image != nil {
                        
                        self.image.value = image!
                    }
                })
                return
            }
        }
    }
    
    
}
