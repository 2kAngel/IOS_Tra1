//
//  Receta.swift
//  IOS_TRabajo1
//
//  Created by Administrador on 28/5/23.
//

import Foundation
import UIKit

class Receta {
    var nombre: String
    var pais: String
    var imagenReceta: UIImage
    var imagenBandera: UIImage
    var origenReceta: String
    var pasosReceta: String
    
    init(nombre: String, pais: String, imagenReceta: UIImage, imagenBandera: UIImage, origenReceta: String, pasosReceta: String) {
        self.nombre = nombre
        self.pais = pais
        self.imagenReceta = imagenReceta
        self.imagenBandera = imagenBandera
        self.origenReceta = origenReceta
        self.pasosReceta = pasosReceta
    }

}
