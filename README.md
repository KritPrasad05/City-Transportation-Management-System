**Transportation Management System Database**

Overview:
The Transportation Management System (TMS) Database is designed to efficiently manage transportation logistics, route planning, and passenger information for a transportation company. It provides a robust foundation for organizing and optimizing transportation operations.

Components:
Tables:

TransportationMode: Stores transportation modes such as buses, trains, and subways.
Route: Contains information about transportation routes, including start and end stations.
Station: Stores details about stations including their names, locations, and accessibility.
Route_Use_Mode: Represents the many-to-many relationship between routes and transportation modes.
Trip: Stores trip details such as start and end times, average speed, and delays.
Passenger: Contains information about passengers including their origin and destination stations.
Travels_To_Passenger_Station: Represents the many-to-many relationship between passengers and stations.
Maintenance: Stores maintenance activities related to routes, including start and end times and descriptions.
Construction: Contains information about construction activities, including the affected area and impact.
TrafficIncident: Stores details about traffic incidents such as location, type, and duration.
Feedback: Contains passenger feedback including ratings and comments.
Affected_By_Maintenance: Represents the many-to-many relationship between routes and maintenance activities.
Affected_By_Construction: Represents the many-to-many relationship between routes and construction activities.
Affected_By_Traffic: Represents the many-to-many relationship between routes and traffic incidents.
Weather: Stores weather information related to trips.
TripPassenger: Represents the many-to-many relationship between trips and passengers.
StationWeather: Stores weather information related to stations.
StopAt: Represents the relationship between routes and stations where stops occur.
RouteStop: Contains information about the number of stops at each station for a route.
Foreign Key Constraints:

Ensures data integrity by enforcing relationships between tables.
Primary Key Constraints:

Provides a unique identifier for each record in a table.
Indexes:

Improves query performance by indexing primary and foreign key columns.
Usage:
This database can be used as the backend for a Transportation Management System application. It facilitates efficient management of transportation operations, route planning, passenger information, and feedback collection.

Technologies Used:
Oracle SQL
User Interface:
A user interface for this project has been developed using Oracle Apex. The interface provides an intuitive platform for interacting with the database and managing transportation operations effectively.

Contributions:
Contributions and feedback are welcome. Feel free to fork the repository, make changes, and submit pull requests to enhance the functionality and usability of the Transportation Management System Database.
