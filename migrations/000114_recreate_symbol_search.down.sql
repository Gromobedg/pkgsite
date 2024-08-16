-- Copyright 2021 The Go Authors. All rights reserved.
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file.

BEGIN;

ALTER TABLE search_documents ALTER COLUMN package_path_id TYPE INTEGER;

ALTER TABLE symbol_search_documents ALTER COLUMN package_path_id TYPE INTEGER;
ALTER TABLE symbol_search_documents ALTER COLUMN symbol_name_id TYPE INTEGER;
ALTER TABLE symbol_search_documents ADD COLUMN build_contexts text[] NOT NULL;
ALTER TABLE symbol_search_documents DROP COLUMN unit_id;

END;
