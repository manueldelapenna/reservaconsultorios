-- $Id: pgsql.sql 2496 2012-10-14 12:28:51Z cimorrison $

-- Add a month_relative column so that monthly repeats can be converted to the
-- new format.   The conversion itself is done in post.inc

ALTER TABLE %DB_TBL_PREFIX%repeat
ADD COLUMN month_relative varchar(4) DEFAULT NULL;
