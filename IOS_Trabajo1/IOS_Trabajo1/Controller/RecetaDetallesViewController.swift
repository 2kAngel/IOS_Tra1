//
//  RecetaDetallesViewController.swift
//  IOS_TRabajo1
//
//  Created by Administrador on 28/5/23.
//

import UIKit

class RecetaDetallesViewController: UIViewController {

    
    var receta: Receta?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if let receta = receta {
            labelNombreReceta.text = receta.nombre
            imgReceta.image = receta.imagenReceta
            textViewPasos.text = receta.pasosReceta
            textViewOrigen.text = receta.origenReceta
        }
        
        
    }
    
    
    @IBOutlet weak var labelNombreReceta: UILabel!
    
    @IBOutlet weak var imgReceta: UIImageView!
    
    @IBOutlet weak var textViewPasos: UITextView!
    
    @IBOutlet weak var textViewOrigen: UITextView!
    
    
    

   
}
