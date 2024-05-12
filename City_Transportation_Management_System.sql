-- Create TransportationMode table
CREATE TABLE TransportationMode (
    mode_id NUMBER PRIMARY KEY,
    mode_name VARCHAR2(255)
);

-- Create Route table
CREATE TABLE Route (
    route_id NUMBER PRIMARY KEY,
    start_station VARCHAR2(255),
    end_station VARCHAR2(255)
);

-- Create Station table
CREATE TABLE Station (
    station_id NUMBER PRIMARY KEY,
    name VARCHAR2(255),
    latitude FLOAT,
    longitude FLOAT,
    accessibility VARCHAR2(255)
);

-- Create RouteMode table for many-to-many relationship between Route and TransportationMode
CREATE TABLE ROUTE_USES_MODE (
    route_id NUMBER,
    mode_id NUMBER,
    PRIMARY KEY (route_id, mode_id),
    FOREIGN KEY (route_id) REFERENCES Route(route_id),
    FOREIGN KEY (mode_id) REFERENCES TransportationMode(mode_id)
);

-- Create Trip table
CREATE TABLE Trip (
    trip_id NUMBER PRIMARY KEY,
    route_id NUMBER,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    average_speed FLOAT,
    delay NUMBER,
    FOREIGN KEY (route_id) REFERENCES Route(route_id)
);

-- Create Passenger table
CREATE TABLE Passenger (
    passenger_id NUMBER PRIMARY KEY,
    origin_station VARCHAR2(255),
    destination_station VARCHAR2(255),
    travel_time NUMBER
);

-- Create PassengerStation table for many-to-many relationship between Passenger and Station
CREATE TABLE "TRAVELS_TO(PASSENGER-STATION)" 
   (	"PASSENGER_ID" NUMBER, 
	"STATION_ID" NUMBER, 
	 PRIMARY KEY ("PASSENGER_ID", "STATION_ID")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "TRAVELS_TO(PASSENGER-STATION)" ADD FOREIGN KEY ("PASSENGER_ID")
	  REFERENCES "PASSENGER" ("PASSENGER_ID") ENABLE;
  ALTER TABLE "TRAVELS_TO(PASSENGER-STATION)" ADD FOREIGN KEY ("STATION_ID")
	  REFERENCES "STATION" ("STATION_ID") ENABLE;

-- Create Maintenance table
CREATE TABLE Maintenance (
    maintenance_id NUMBER PRIMARY KEY,
    route_id NUMBER,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    description VARCHAR2(255),
    FOREIGN KEY (route_id) REFERENCES Route(route_id)
);

-- Create Construction table
CREATE TABLE Construction (
    construction_id NUMBER PRIMARY KEY,
    area VARCHAR2(255),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    impact VARCHAR2(255)
);

-- Create TrafficIncident table
CREATE TABLE TrafficIncident (
    incident_id NUMBER PRIMARY KEY,
    location VARCHAR2(255),
    type VARCHAR2(255),
    start_time TIMESTAMP,
    end_time TIMESTAMP
);

-- Create Feedback table
CREATE TABLE Feedback (
    feedback_id NUMBER PRIMARY KEY,
    passenger_id NUMBER,
    rating NUMBER,
    comments VARCHAR2(255),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);

-- Create RouteMaintenance table for many-to-many relationship between Route and Maintenance
CREATE TABLE AFFECTED_BY_Maintenance (
    route_id NUMBER,
    maintenance_id NUMBER,
    PRIMARY KEY (route_id, maintenance_id),
    FOREIGN KEY (route_id) REFERENCES Route(route_id),
    FOREIGN KEY (maintenance_id) REFERENCES Maintenance(maintenance_id)
);

-- Create RouteConstruction table for many-to-many relationship between Route and Construction
CREATE TABLE AFFECTED_BY_CONSTRUCTION (
    route_id NUMBER,
    construction_id NUMBER,
    PRIMARY KEY (route_id, construction_id),
    FOREIGN KEY (route_id) REFERENCES Route(route_id),
    FOREIGN KEY (construction_id) REFERENCES Construction(construction_id)
);

-- Create RouteTrafficIncident table for many-to-many relationship between Route and TrafficIncident
CREATE TABLE AFFECTED_BY_Traffic (
    route_id NUMBER,
    incident_id NUMBER,
    PRIMARY KEY (route_id, incident_id),
    FOREIGN KEY (route_id) REFERENCES Route(route_id),
    FOREIGN KEY (incident_id) REFERENCES TrafficIncident(incident_id)
);

CREATE TABLE Weather (
    trip_id NUMBER,
    "date" DATE,
    temperature FLOAT,
    precipitation FLOAT,
    wind_speed FLOAT,
    CONSTRAINT fk_trip_id FOREIGN KEY (trip_id) REFERENCES Trip(trip_id),
    CONSTRAINT weather_pk PRIMARY KEY ("date")
);

-- Create TripPassenger table
CREATE TABLE TripPassenger (
    trip_id NUMBER,
    passenger_id NUMBER,
    PRIMARY KEY (trip_id, passenger_id),
    FOREIGN KEY (trip_id) REFERENCES Trip(trip_id),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);

-- Create StationWeather table
CREATE TABLE StationWeather (
    "date" DATE,
    station_id NUMBER,
    CONSTRAINT pk_StationWeather PRIMARY KEY ("date", station_id),
    CONSTRAINT fk_date FOREIGN KEY ("date") REFERENCES Weather("date"),
    CONSTRAINT fk_station_id FOREIGN KEY (station_id) REFERENCES Station(station_id)
);

-- Create RouteStationRelation table
CREATE TABLE StopAt (
    route_id INT,
    station_id INT,
    FOREIGN KEY (route_id) REFERENCES Route(route_id),
    FOREIGN KEY (station_id) REFERENCES Station(station_id)
);
-- Create RouteStop table
CREATE TABLE RouteStop (
    route_id INT,
    Num_stops INT,
    station_id INT,
    FOREIGN KEY (route_id) REFERENCES Route(route_id),
    FOREIGN KEY (station_id) REFERENCES Station(station_id)
);
