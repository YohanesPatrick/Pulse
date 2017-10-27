
/*
 This is where you will be getting your data from a different source.
 */

import UIKit

class Data {
    
    static func getData(completion: @escaping ([Model]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            var data = [Model]()
            data.append(Model(title: "Blood Glucose", image: [], data1: "6", data2: "8"))
            data.append(Model(title: "HBA1C", image: [], data1: "9", data2: "6"))
            data.append(Model(title: "Weight", image: [], data1: "100", data2: "80"))
            data.append(Model(title: "Mood", image: [], data1: "bad", data2: "good"))
            data.append(Model(title: "Activity", image: [], data1: "50%", data2: "100%"))

            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
    
    static func getProfile(completion: @escaping (ProfileModel?) -> ()){
        DispatchQueue.global(qos: .userInteractive).async {
            let data = ProfileModel(Name: "Yohanes Patrik H", day: "Monday", date: "January 21,9999" , ProfilePicture:#imageLiteral(resourceName: "Artboard 2"))
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
