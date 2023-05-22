//
//  MainTableViewController.swift
//  IOS_Trabajo1
//
//  Created by Administrador on 15/5/23.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var recetas = [Receta]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let receta1 = Receta(nombreReceta: "Arroz a la cubana", descripcionReceta: "El arroz a la cubana es un plato tradicional de la cocina cubana que se caracteriza por su sencillez y sabores distintivos. Aunque su origen específico no está completamente claro, se cree que se desarrolló en Cuba durante el siglo XIX.", origenRecetaImagen: UIImage(named: "banderaCuba")!, origenRecetaTexto: "CUBA", imagenReceta: UIImage(named: "arrozCubana")!)
        
        let receta2 = Receta(nombreReceta: "Paella", descripcionReceta: "La paella es un plato tradicional de la cocina española, originario de la región de Valencia. Se trata de un arroz cocinado en una sartén amplia y poco profunda, conocida como paellera, que se sazona con azafrán y se mezcla con una variedad de ingredientes como pollo, conejo, mariscos, verduras y especias. La paella es famosa por su característica costra dorada en la base del arroz, conocida como socarrat, que le proporciona un sabor distintivo. Es considerada uno de los platos más emblemáticos de España y se ha popularizado en todo el mundo.", origenRecetaImagen: UIImage(named: "banderaEspaña")!, origenRecetaTexto: "ESPAÑA", imagenReceta: UIImage(named: "paella")!)
        
        let receta3 = Receta(nombreReceta: "Shushi", descripcionReceta: "El sushi es un plato típico de la cocina japonesa que se ha vuelto muy popular a nivel mundial. Consiste en pequeños bocados de arroz condimentado con vinagre de arroz y acompañados de pescado crudo, mariscos, vegetales o huevas. Los ingredientes se suelen enrollar en una lámina de alga nori o se presentan en forma de bolas de arroz cubiertas con el ingrediente principal. El sushi se sirve generalmente con salsa de soja, wasabi y jengibre encurtido. Su origen se remonta a varios siglos atrás en Japón, donde se desarrolló como una forma de conservación del pescado mediante la fermentación del arroz. Con el tiempo, esta técnica evolucionó y se convirtió en la preparación de sushi que conocemos hoy en día", origenRecetaImagen: UIImage(named: "japon")!, origenRecetaTexto: "JAPON", imagenReceta: UIImage(named: "shushi")!)
        
        recetas = [receta1,receta2,receta3]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recetas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! MainTableViewCell
        
        cell.tituloLabel.text = recetas[indexPath.row].nombreReceta
        cell.descrTV.text = recetas[indexPath.row].descripcionReceta
        cell.paisLabel.text = recetas[indexPath.row].origenRecetaTexto
        cell.imagenReceta.image = recetas[indexPath.row].imagenReceta
        cell.imagenPais.image = recetas[indexPath.row].origenRecetaImagen
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
   /*
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    

    

}
