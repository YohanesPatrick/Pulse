
/*
 This is the model class that holds your data.
 This model is what is shown in a tableview, collectionview, pickerview row, etc.
 */

import UIKit

class Model {
    var title = ""
    var image: [UIImage]?
    var data1 = ""
    var data2 = ""
    
    init(title: String, image: [UIImage]?, data1: String, data2: String) {
        self.title = title
        self.image = image
        self.data1 = data1
        self.data2 = data2
    }
}
