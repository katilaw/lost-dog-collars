# YOUR SQL CODE GOES HERE
system 'psql dog_park < schema.sql'

def db_connection
  begin
    connection = PG.connect(dbname: "dog_park")
    yield(connection)
  ensure
    connection.close
  end
end

SELECT lost_dog_collars.dog_name, dog_owners.name
  FROM lost_dog_collars
  LEFT JOIN dog_owners
  ON (lost_dog_collars.dog_name = dog_owners.dog_name)
  WHERE dog_owners.name IS NULL;

SELECT lost_dog_collars.dog_name, dog_owners.name
  FROM lost_dog_collars
  INNER JOIN dog_owners
  ON (lost_dog_collars.dog_name = dog_owners.dog_name);

SELECT lost_dog_collars.dog_name, dog_owners.name
  FROM lost_dog_collars
  LEFT JOIN dog_owners
  ON (lost_dog_collars.dog_name = dog_owners.dog_name);

SELECT lost_dog_collars.dog_name, dog_owners.name
  FROM lost_dog_collars
  RIGHT JOIN dog_owners
  ON (lost_dog_collars.dog_name = dog_owners.dog_name);
