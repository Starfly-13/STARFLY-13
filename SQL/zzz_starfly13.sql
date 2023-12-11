-- zzz_starfly13.sql
-- Populate a starfly13 database with some initial data

-- insert admin rows
INSERT INTO admin (ckey, rank) VALUES ('lectronyx', 'Host');
INSERT INTO admin (ckey, rank) VALUES ('veloxi',    'Host');

-- insert admin_ranks rows
INSERT INTO admin_ranks (rank, flags, exclude_flags, can_edit_flags) VALUES ('Moderator',        8194,    0,     0);
INSERT INTO admin_ranks (rank, flags, exclude_flags, can_edit_flags) VALUES ('TrialAdmin',      13318,    0,     0);
INSERT INTO admin_ranks (rank, flags, exclude_flags, can_edit_flags) VALUES ('Admin',           16255,    0,     0);
INSERT INTO admin_ranks (rank, flags, exclude_flags, can_edit_flags) VALUES ('SeniorAdmin',     65535,    0, 65535);
INSERT INTO admin_ranks (rank, flags, exclude_flags, can_edit_flags) VALUES ('Host',            65535,    0, 65535);
INSERT INTO admin_ranks (rank, flags, exclude_flags, can_edit_flags) VALUES ('DevelopmentHead', 65535,    0, 65535);
INSERT INTO admin_ranks (rank, flags, exclude_flags, can_edit_flags) VALUES ('Coder',           13872, 8192,     0);
