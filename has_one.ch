= has_one: "Options for has_one:

  

  :class_name - specify the class name of the association. Use it only if that name can\xE2\x80\x99t be inferred from the association name. So has_one :manager will by default be linked to the Manager class, but if the real class name is Person, you\xE2\x80\x99ll have to specify it with this option.

  

  :conditions - specify the conditions that the associated object must meet in order to be included as a \"WHERE\" sql fragment, such as \"rank = 5\".

  

  :order - specify the order from which the associated object will be picked at the top. Specified as an \"ORDER BY\" sql fragment, such as \"last_name, first_name DESC\"

  

  :dependent - if set to :destroy (or true) all the associated objects are destroyed when this object is. Also, association is assigned.

  

  :foreign_key - specify the foreign key used for the association. By default this is guessed to be the name of this class in lower-case and \"_id\" suffixed. So a Person class that makes a has_one association will use \"person_id\" as the default foreign_key.

  

  :include - specify second-order associations that should be eager loaded when this object is loaded.
"
