CREATE TABLE production.parts(
    part_id   INT NOT NULL, 
    part_name VARCHAR(100)
); --no primary key 

INSERT INTO 
    production.parts(part_id, part_name)
VALUES
    (1,'Frame'),
    (2,'Head Tube'),
    (3,'Handlebar Grip'),
    (4,'Shock Absorber'),
    (5,'Fork');

SELECT 
    part_id, 
    part_name
FROM 
    production.parts
WHERE 
    part_id = 5;

	CREATE TABLE production.part_prices(
    part_id int,
    valid_from date,
    price decimal(18,4) not null,
    PRIMARY KEY(part_id, valid_from) 
);
ALTER TABLE production.parts
ADD PRIMARY KEY(part_id);

--WHEN TABLE HAS NO PRIMARY KEY :
CREATE CLUSTERED INDEX ix_parts_id
ON production.parts (part_id);  


