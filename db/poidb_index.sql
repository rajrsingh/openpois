CREATE INDEX poibasetype_myid_idx ON poibasetype USING btree (myid);
CREATE INDEX poibasetype_pid_idx ON poibasetype USING btree (parentid);
CREATE INDEX poitermtype_myid_idx ON poitermtype USING btree (myid);
CREATE INDEX poitermtype_pid_idx ON poitermtype USING btree (parentid);
CREATE INDEX poitermtype_value_idx ON poitermtype USING btree (value);
CREATE INDEX poitermtype_id_idx ON poitermtype USING btree (id);
CREATE INDEX poitermtype_objname_idx ON poitermtype USING btree (objname);
CREATE INDEX location_pid_idx ON location USING btree (parentid);
CREATE INDEX location_myid_idx ON location USING btree (myid);
CREATE INDEX geo_oid_idx ON geo(oid);
CREATE INDEX geo_geompt_idx ON geo USING GIST (geompt);
CREATE INDEX geo_pid_idx ON geo (parentid);
CREATE INDEX geo_geogpt_idx on geo USING GIST (geogpt);
