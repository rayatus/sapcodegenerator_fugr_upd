# SAPCodeGenerator update Function group
Code generator which creates a function group for creating, updating and deleting entries in a given database table so that this function modules could be executed IN UPDATE TASK.

By executing transaction **ZDBFRAMEWORK_WIZ_UPD** a wizard will ask for:
- Development class where the function group will be created.
- Namespace, allowing to set any development namespace allowed in the system including Z, Y, T...
- DataBase table for which the generated functions will create, delete or update the given entries.
- Once all the required data is provided it will allow to modify default ABAP artefact names before being generated.

As result of the execution following ABAP artefacts will be created:
- Function group
- Function module for single row execution
- Function module for massive row execution
- Dictionary table type used in massive function module 


Requieres **sapcodegenerator_base** repository (https://github.com/rayatus/sapcodegenerator_base)
