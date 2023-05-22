//
//  Receta.swift
//  IOS_Trabajo1
//
//  Created by Administrador on 12/5/23.
//

import Foundation
import UIKit

class Receta
{
    var nombreReceta: String
    var descripcionReceta: String
    var origenRecetaImagen: UIImage //pais-bandera
    var origenRecetaTexto: String //pais
    var imagenReceta: UIImage
    
    
    init(nombreReceta: String, descripcionReceta: String, origenRecetaImagen: UIImage, origenRecetaTexto: String, imagenReceta: UIImage) {
        self.nombreReceta = nombreReceta
        self.descripcionReceta = descripcionReceta
        self.origenRecetaImagen = origenRecetaImagen
        self.origenRecetaTexto = origenRecetaTexto
        self.imagenReceta = imagenReceta
    }
    
    
    

}
