= has_and_belongs_to_many: "    * :class_name - specify the class name of the association. Use it only if that name can\xE2\x80\x99t be inferred from the association name. So has_and_belongs_to_many :projects will by default be linked to the Project class, but if the real class name is SuperProject, you\xE2\x80\x99ll have to specify it with this option.
    * :join_table - specify the name of the join table if the default based on lexical order isn\xE2\x80\x99t what you want. WARNING: If you\xE2\x80\x99re overwriting the table name of either class, the table_name method MUST be declared underneath any has_and_belongs_to_many declaration in order to work.
    * :foreign_key - specify the foreign key used for the association. By default this is guessed to be the name of this class in lower-case and \"_id\" suffixed. So a Person class that makes a has_and_belongs_to_many association will use \"person_id\" as the default foreign_key.
    * :association_foreign_key - specify the association foreign key used for the association. By default this is guessed to be the name of the associated class in lower-case and \"_id\" suffixed. So if the associated class is Project, the has_and_belongs_to_many association will use \"project_id\" as the default association foreign_key.
    * :conditions - specify the conditions that the associated object must meet in order to be included as a \"WHERE\" sql fragment, such as \"authorized = 1\".
    * :order - specify the order in which the associated objects are returned as a \"ORDER BY\" sql fragment, such as \"last_name, first_name DESC\"
    * :uniq - if set to true, duplicate associated objects will be ignored by accessors and query methods
    * :finder_sql - overwrite the default generated SQL used to fetch the association with a manual one
    * :delete_sql - overwrite the default generated SQL used to remove links between the associated classes with a manual one
    * :insert_sql - overwrite the default generated SQL used to add links between the associated classes with a manual one
    * :extend - anonymous module for extending the proxy, see \"Association extensions\".
    * :include - specify second-order associations that should be eager loaded when the collection is loaded.
    * :group: An attribute name by which the result should be grouped. Uses the GROUP BY SQL-clause.
    * :limit: An integer determining the limit on the number of rows that should be returned.
    * :offset: An integer determining the offset from where the rows should be fetched. So at 5, it would skip the first 4 rows.
    * :select: By default, this is * as in SELECT * FROM, but can be changed if you for example want to do a join, but not include the joined columns.
"
