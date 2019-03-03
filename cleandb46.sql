SET
    @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
    UNIQUE_CHECKS = 0;
SET
    @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
    FOREIGN_KEY_CHECKS = 0;
SET
    @OLD_SQL_MODE = @@SQL_MODE,
    SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';

-- -------------------------------------
-- Drop Table 'Tenant'
-- -------------------------------------
    DROP TABLE `Tenant`;
-- -------------------------------------
-- Drop Table 'LeaseAgreement'
-- -------------------------------------
    DROP TABLE `LeaseAgreement`;
-- -------------------------------------
-- Drop Table 'Apartment'
-- -------------------------------------
    DROP TABLE `Apartment`;
-- -------------------------------------
-- Drop Table 'Manager'
-- -------------------------------------
    DROP TABLE `Manager`;
-- -------------------------------------
-- Drop Table 'Person'
-- -------------------------------------
    DROP TABLE `Person`;
-- -------------------------------------
-- Drop Table 'Skill'
-- -------------------------------------
    DROP TABLE `Skill`;
-- -------------------------------------
-- Drop Table 'Technician'
-- -------------------------------------
    DROP TABLE `Technician`;
-- -------------------------------------
-- Drop Table 'Employee'
-- -------------------------------------
    DROP TABLE `Employee`;
-- -------------------------------------
-- Drop Table 'Building'
-- -------------------------------------
    DROP TABLE `Building`;
-- -------------------------------------
-- Drop Table 'EmergencyContact'
-- -------------------------------------
    DROP TABLE `EmergencyContact`;

SET
    FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET
    UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
