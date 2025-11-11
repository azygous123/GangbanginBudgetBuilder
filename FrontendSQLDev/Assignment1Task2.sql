select owners.OID, owners.LastName, pets.PetID, pets.Name
From Pets
Join owns On pets.PetID = owns.PetID
Join owners on owns.OID = owners.OID
where owners.AnnualIncome < 100000;