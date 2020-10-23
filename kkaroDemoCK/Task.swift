//
//  Task.swift
//  kkaroDemoCK
//
//  Created by Ana Karolina Costa da Silva on 22/10/20.
//

import UIKit
import CoreData

extension Task {
    
    static func fetchAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [Task] {
        
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "taskName", ascending: true)]

        
        do
            { let results = try AppDelegate.viewContext.fetch(request)
                return results
            } catch {
            fatalError("DEU RUIM")
        }
    }
    
    static func deleteAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        
        Task.fetchAll(viewContext: viewContext).forEach({viewContext.delete($0)})
        try? viewContext.save()
    }
}
