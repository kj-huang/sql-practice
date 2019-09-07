SELECT * FROM language;

-- ----------------------------
-- Before Trigger
-- ----------------------------

-- Change Delimiter
DELIMITER //

CREATE TRIGGER Language_Before_Insert
	BEFORE INSERT on language
	FOR EACH ROW
	BEGIN
		SET NEW.name = CONCAT(UPPER(SUBSTRING(NEW.name,1,1)),
													LOWER(SUBSTRING(NEW.name FROM 2)));
	END //

-- Change Delimiter
DELIMITER ;

-- Insert Data
INSERT INTO language(name) VALUES ('spanish');
INSERT INTO language(name) VALUES ('CHINESE');
INSERT INTO language(name) VALUES ('mARDArIN');

-- Select Data
SELECT * FROM language;

-- ----------------------------
-- Do House Keeping
-- ----------------------------
DROP TRIGGER Language_Before_Insert;

-- ----------------------------
-- After Trigger
-- ----------------------------
CREATE TABLE Audit_Language (
	lang_id TINYINT(3),
	name CHAR(20),
	last_update TIMESTAMP,
	RowValue CHAR(20)
);

-- Change Delimiter
DELIMITER //

CREATE TRIGGER Language_After_Update
	AFTER UPDATE on language
	FOR EACH ROW
	BEGIN
		-- INSERT old value
		INSERT INTO Audit_Language(lang_id, name, last_update, RowValue)
		VALUES (OLD.language_id, OLD.name, OLD.last_update, 'Before Update');

		-- INSERT new value
		INSERT INTO Audit_Language(lang_id, name, last_update, RowValue)
		VALUES (NEW.language_id, NEW.name, NEW.last_update, 'After Update');
	END //

-- Change Delimiter
DELIMITER ;

-- UPDATE Value
UPDATE language
SET name = 'Spanish-New'
WHERE language_id = 10;

UPDATE language
SET name = 'Chinese-New'
WHERE language_id = 11;

-- SELECT Values
SELECT * FROM Audit_Language;

DROP TABLE Language_After_Update;
DROP TRIGGER Language_Before_Insert;