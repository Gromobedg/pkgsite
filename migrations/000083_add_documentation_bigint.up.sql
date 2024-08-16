-- Copyright 2021 The Go Authors. All rights reserved.
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file.

BEGIN;

ALTER TABLE documentation ADD COLUMN id_bigint bigint;

CREATE OR REPLACE FUNCTION update_documentation_id() RETURNS TRIGGER AS $BODY$
BEGIN
    NEW.id=nextval('sequence_documentation_id');
    -- Update id_bigint with the same value on insert/update.
    NEW.id_bigint=NEW.id;
    RETURN NEW;
END
$BODY$ LANGUAGE PLPGSQL;
ALTER SEQUENCE sequence_documentation_id OWNED BY documentation.id;

END;
