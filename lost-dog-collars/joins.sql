# YOUR SQL CODE GOES HERE
1)
SELECT dog_owners.name AS owner, lost_dog_collars.dog_name AS dog  FROM dog_owners
JOIN lost_dog_collars ON dog_owners.dog_name = lost_dog_collars.dog_name;

2)
SELECT DISTINCT lost_dog_collars.dog_name AS dog FROM lost_dog_collars
FULL OUTER JOIN dog_owners ON dog_owners.dog_name = lost_dog_collars.dog_name
WHERE dog_owners.name IS NULL;

3)
SELECT lost_dog_collars.dog_name AS dog, dog_owners.name AS owner FROM lost_dog_collars
LEFT JOIN dog_owners ON dog_owners.dog_name = lost_dog_collars.dog_name;

4)
SELECT lost_dog_collars.dog_name AS dog, dog_owners.name AS owner FROM lost_dog_collars
RIGHT JOIN dog_owners ON dog_owners.dog_name = lost_dog_collars.dog_name;
