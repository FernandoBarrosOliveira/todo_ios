//
//  itemTodo.swift
//  TODO_iOS
//
//  Created by Fernando Barros on 12/05/2018.
//  Copyright © 2018 Joao Paulo. All rights reserved.
//

import Foundation


struct itemTodo {
    var titulo: String
    var descricao: String
    var dataCadastro: Date
    var dataInicio: Date
    var dataFim: Date
    var prioridade: Int // criar um enum
    var status: Bool
    
    func toDictionary() -> Any {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm a"
        return [
            "titulo": titulo,
            "descricao": descricao,
            "dataCadastro": dateFormatter.string(from:dataCadastro),
            "dataInicio": dateFormatter.string(from:dataInicio),
            "dataFim": dateFormatter.string(from:dataFim),
            "prioridade": prioridade,
            "status": status
            
        ]
    }
}
