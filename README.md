This project was made by Yonatan Berkovitch and Yair Shprecher
this file describes the procces of the project and specify its components.

### Stage 1 - design ###
1. The Project - Our group in Lev has very clear target, create a database for a university, our part of the project is "dormitories" control
2. The Component - The "dormitories" component contains 7 entities in total: Person, Student, Facility Manager, Dormitory Manager, Cleaner, Building and Room. 
   The description of each Entity:
   Person - represents a person related to the dormitories, and hold information about him like phone number and age
       key: ID. ; fields: PhoneNumber, Age
   Student - A Student living inside the dormitories, contains information relevent to his residence inside the dormitory
       inhert: Person. ; key: ID. ; fields: 
