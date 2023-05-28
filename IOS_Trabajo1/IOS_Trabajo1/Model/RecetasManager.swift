//
//  RecetasManager.swift
//  IOS_TRabajo1
//
//  Created by Administrador on 27/5/23.
//

import Foundation
import UIKit



class RecetasManager
{
    static let sharedInstance = RecetasManager()
    
    var recetas: [Receta] = []
    
    private init() {
            // Inicialización de datos de ejemplo
        recetas.append(Receta(nombre: "Paella", pais: "España", imagenReceta: UIImage(named: "Paella")!, imagenBandera: UIImage(named: "banderaEspaña")!, origenReceta: "Origen: España, específicamente de la región de Valencia.", pasosReceta: "Pasos para realizar la paella: Algunos pasos básicos para preparar una paella tradicional son los siguientes:Calentar aceite de oliva en una paellera.Agregar el pollo troceado y el conejo y dorarlos. Añadir las verduras (judías verdes, garrofón) y sofreír. Incorporar el tomate y dejar que se cocine. Agregar el arroz y mezclar bien. Verter el caldo (generalmente caldo de pollo) y distribuir los ingredientes de manera uniforme. Cocinar a fuego medio-alto durante unos minutos y luego reducir el fuego. Distribuir los mariscos, como gambas y mejillones, sobre la paella. Cocinar hasta que el arroz esté tierno y el caldo se haya absorbido. Dejar reposar unos minutos antes de servir."))
        
        recetas.append(Receta(nombre: "Shushi", pais: "Japon", imagenReceta: UIImage(named: "Shushi")!, imagenBandera: UIImage(named: "banderaJapon")!, origenReceta: "Origen: Japón.", pasosReceta: "Pasos para realizar el sushi: A continuación, se mencionan algunos pasos generales para hacer sushi:Cocinar el arroz para sushi según las instrucciones del fabricante.Mientras el arroz se enfría, preparar los ingredientes, como pescado crudo (sashimi), mariscos, verduras y condimentos.Cortar el pescado en rebanadas delgadas y preparar otros ingredientes, como pepino, aguacate o zanahoria, en tiras delgadas.Extender una esterilla de bambú para sushi (makisu) y colocar una hoja de alga nori sobre ella.Humedecer las manos con agua para evitar que el arroz se pegue y tomar una porción de arroz cocido.Extender el arroz uniformemente sobre el alga nori, dejando un borde vacío en la parte superior.Colocar los ingredientes preparados en el centro del arroz.Enrollar la esterilla de bambú, presionando suavemente para asegurar el sushi.Repetir el proceso para hacer más rollos de sushi con diferentes ingredientes.Una vez hechos los rollos, cortarlos en trozos más pequeños con un cuchillo afilado.Servir el sushi con salsa de soja, wasabi y jengibre encurtido (gari)."))
                       
        }
    
    
    //Guardar Recetas
    // Guardar Recetas
    func save() {
        let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: recetas, requiringSecureCoding: false)
        UserDefaults.standard.set(encodedData, forKey: "recetas")
    }

    // Cargar Recetas
    func load() {
        if let encodedData = UserDefaults.standard.object(forKey: "recetas") as? Data {
            if let savedRecetas = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedData) as? [Receta] {
                recetas = savedRecetas
            }
        }
    }

}
