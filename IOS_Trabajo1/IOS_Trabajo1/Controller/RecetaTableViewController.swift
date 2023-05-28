import UIKit

class RecetaTableViewController: UITableViewController {
    var recetasManager = RecetasManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recetasManager.load()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recetasManager.recetas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! RecetasCell

        let receta = recetasManager.recetas[indexPath.row]
        
        cell.labelReceta.text = receta.nombre
        cell.labelPais.text = receta.pais
        cell.imgReceta.image = receta.imagenReceta
        cell.imgBandera.image = receta.imagenBandera

        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecetaDetallesSegue",
           let detallesViewController = segue.destination as? RecetaDetallesViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            
            let receta = recetasManager.recetas[indexPath.row]
            detallesViewController.receta = receta
        }
    }
    
    // MARK: - Actions
    
    @IBAction func addReceta(_ sender: Any) {
        let alertController = UIAlertController(title: "Nueva Receta", message: "Ingrese los detalles de la receta", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Nombre de la receta"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "País"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "URL de la imagen de receta"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "URL de la imagen de la bandera"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Origen de la receta"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Pasos de la receta"
        }
        
        let alertAction = UIAlertAction(title: "Guardar", style: .default) { (_) in
            if let nombreReceta = alertController.textFields?[0].text,
               let paisReceta = alertController.textFields?[1].text,
               let urlImagenReceta = alertController.textFields?[2].text,
               let urlImagenBandera = alertController.textFields?[3].text,
               let origenReceta = alertController.textFields?[4].text,
               let pasosReceta = alertController.textFields?[5].text {
                
                // Cargar las imágenes desde las URL proporcionadas
                if let imagenRecetaURL = URL(string: urlImagenReceta),
                   let imagenBanderaURL = URL(string: urlImagenBandera),
                   let imagenRecetaData = try? Data(contentsOf: imagenRecetaURL),
                   let imagenBanderaData = try? Data(contentsOf: imagenBanderaURL),
                   let imagenReceta = UIImage(data: imagenRecetaData),
                   let imagenBandera = UIImage(data: imagenBanderaData) {
                    
                    let nuevaReceta = Receta(nombre: nombreReceta, pais: paisReceta, imagenReceta: imagenReceta, imagenBandera: imagenBandera, origenReceta: origenReceta, pasosReceta: pasosReceta)
                    
                    self.recetasManager.recetas.append(nuevaReceta)
                    self.tableView.reloadData()
                } else {
                    print("Error al cargar las imágenes desde las URL proporcionadas.")
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Eliminar el elemento de la fuente de datos
            recetasManager.recetas.remove(at: indexPath.row)
            
            // Eliminar la celda de la tabla
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - View lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}
