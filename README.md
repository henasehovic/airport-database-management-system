# Airport Database Management System

A relational database project developed in **MySQL** to model and manage the complex operations of a modern airport.

The system provides a centralized database for managing flights, passengers, airlines, aircraft, crew members, baggage, gates, airport staff, tickets, and aircraft maintenance records.

## Overview

Modern airports handle large amounts of interconnected information involving passengers, flights, aircraft, airline operations, baggage, employees, and maintenance.

This project implements a relational **Airport Database Management System (DBMS)** designed to organize this information while maintaining data integrity, reducing redundancy, and enabling efficient data retrieval through SQL queries.

The database was developed using **MySQL 8.0** and follows the principles of relational database design, including entities, relationships, primary keys, foreign keys, constraints, and the three-level database architecture.

## Main Features

The database manages the following areas of airport operations:

* Flight scheduling and tracking
* Passenger management
* Ticket management
* Baggage tracking
* Aircraft management
* Airport and gate management
* Crew member assignments
* Airport staff management
* Aircraft maintenance records
* Airline management

## Database Entities

The system consists of the following main entities:

* **Airport**
* **Airline**
* **Airplane**
* **Flight**
* **Passenger**
* **Ticket**
* **Baggage**
* **Gate**
* **Crew Member**
* **Airplane Crew**
* **Airport Staff**
* **Maintenance Record**

These entities are connected through primary and foreign key relationships that represent real-world airport operations.

## Database Architecture

The database follows the three-level architecture:

### Internal Level

Represents how data is physically stored and accessed, including storage mechanisms and indexes.

### Conceptual Level

Defines the logical structure of the database, including:

* Entities
* Attributes
* Relationships
* Primary keys
* Foreign keys
* Constraints

### External Level

Provides different views of the database depending on the user's role.

For example:

* Passengers can access reservation, ticket, baggage, and flight information.
* Airport personnel can manage flights, gates, aircraft, and staff information.
* Maintenance personnel can access aircraft maintenance records.

## Entity Relationships

The database contains several types of relationships.

### One-to-Many Relationships

Examples include:

* One Airport → Many Gates
* One Airline → Many Airplanes
* One Airplane → Many Flights
* One Flight → Many Tickets
* One Passenger → Many Tickets
* One Passenger → Many Baggage Items
* One Flight → Many Baggage Items
* One Airport → Many Departing Flights
* One Airport → Many Arriving Flights
* One Airport → Many Staff Members

### Many-to-Many Relationship

**Airplane ↔ Crew Member**

An airplane can have multiple crew members, while a crew member can be assigned to multiple airplanes.

This relationship is implemented through the junction table:

```text
Airplane_Crew
```

### One-to-One Relationship

**Airplane ↔ Current Maintenance Record**

The database models the current maintenance information associated with an aircraft.

## Data Types

The database uses a variety of MySQL data types, including:

* `VARCHAR`
* `CHAR`
* `INT`
* `DECIMAL`
* `DATE`
* `DATETIME`
* `TIMESTAMP`
* `BOOLEAN`
* `ENUM`

Examples include:

```text
airport_code       VARCHAR(3)
airport_name       VARCHAR(100)
flight_number      VARCHAR(6)
passport_number    VARCHAR(20)
capacity           INT
weight             DECIMAL(5,2)
price              DECIMAL(10,2)
departure_time     DATETIME
date_of_birth      DATE
is_active          BOOLEAN
```


## Example Database Structure

```text
Airport
   │
   ├── Gate
   │
   ├── Airport Staff
   │
   └── Flight
         │
         ├── Ticket ─── Passenger
         │
         ├── Baggage ── Passenger
         │
         └── Airplane
                 │
                 ├── Airline
                 │
                 ├── Crew Member
                 │
                 └── Maintenance Record
```

## Technologies Used

* **MySQL 8.0**
* **SQL**
* **MySQL Workbench**
* **diagrams.net** for database diagrams

## Learning Outcomes

This project provided practical experience with:

* Relational database design
* Entity-Relationship modeling
* Three-level database architecture
* SQL
* Primary and foreign keys
* Database constraints
* Normalized relational structures
* One-to-one relationships
* One-to-many relationships
* Many-to-many relationships
* Junction tables
* Data integrity
* Complex SQL queries
* Database management systems

## Future Improvements

Possible extensions include:

* Real-time flight information
* Advanced airport security management
* More detailed passenger check-in functionality
* Advanced baggage tracking
* Predictive aircraft maintenance
* Flight delay prediction
* More advanced user roles and permissions
* Additional airports and international flight networks
* Dashboard and analytics functionality

## Authors

**Hena Šehović**
**Berina Juković**
**Berin Žunić **

International University of Sarajevo

**Course:** CS306 – Database Management
**Semester:** Spring 2025

## Documentation

The complete academic project report is available in the `docs/` directory.
