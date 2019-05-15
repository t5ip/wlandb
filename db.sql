CREATE DATABASE IF NOT EXISTS wlandb;

USE wlandb;

CREATE TABLE IF NOT EXISTS access_points (
	access_point_id INT AUTO_INCREMENT,
 	bssid VARCHAR(18) NOT NULL,
	first_time_seen DATETIME,
	last_time_seen DATETIME,
	privacy VARCHAR(8),
	cipher VARCHAR(8),
	authentication VARCHAR(8),
	essid VARCHAR(32),
	PRIMARY KEY (access_point_id),
    UNIQUE INDEX (bssid, essid)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS stations (
	station_id INT AUTO_INCREMENT,
	station_mac VARCHAR(18),
	first_time_seen DATETIME,
	last_time_seen DATETIME,
 	bssid VARCHAR(18) NOT NULL,
	probed_essids TEXT,
	PRIMARY KEY (station_id),
    UNIQUE INDEX (station_mac)
) ENGINE=INNODB;
