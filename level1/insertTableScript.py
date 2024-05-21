import random
import string
from datetime import datetime, timedelta

# Helper functions to generate random data
def generate_phone_number():
    return '05' + ''.join(random.choices(string.digits, k=8))

def generate_name():
    names = ['John', 'Emily', 'David', 'Sarah', 'Mark', 'Jennifer', 'Michael', 'Katherine', 'Andrew',
             'Jessica', 'Christopher', 'Lauren', 'Matthew', 'Rachel', 'Anthony', 'Stephanie', 'Robert', 'Melissa',
             'Brian', 'Amanda', 'William', 'Ashley', 'Jonathan', 'Elizabeth', 'Nicholas', 'Taylor', 'Kevin', 'Victoria',
             'Brandon', 'Olivia', 'Jacob', 'Madison', 'Eric', 'Megan', 'Steven', 'Samantha', 'Thomas', 'Danielle',
             'Tyler', 'Nicole', 'Adam', 'Gabrielle', 'Benjamin', 'Hannah', 'Patrick', 'Chloe', 'Timothy', 'Alyssa',
             'Richard', 'Alexandra', 'Philip', 'Natalie', 'Charles', 'Mackenzie', 'Jeffrey', 'Morgan', 'Ryan', 'Kayla',
             'Scott', 'Julia', 'Donald', 'Grace', 'Joshua', 'Amelia', 'Daniel', 'Sydney', 'Joseph', 'Brianna', 'Peter',
             'Jasmine', 'George', 'Isabella', 'Edward', 'Kaitlyn', 'Francis', 'Faith', 'Martin', 'Caroline', 'Derek',
             'Sara', 'Victor', 'Paige', 'Raymond', 'Emma', 'Arthur', 'Avery', 'Louis', 'Lily', 'Walter', 'Evelyn',
             'Gregory', 'Aubrey', 'Henry', 'Brooke', 'Stephen', 'Lila', 'Harold', 'Hailey', 'Gerald', 'Claire', 'Kenneth',
             'Allison', 'Roger', 'Sophie', 'Lawrence', 'Leah', 'Norman', 'Sadie', 'Samuel', 'Nora', 'Albert', 'Ellie',
             'Frank', 'Madeline', 'Ralph', 'Ariana', 'Wayne', 'Riley', 'Keith', 'Bella', 'Howard', 'Peyton', 'Eugene',
             'Skylar', 'Roy', 'Aaliyah', 'Terry', 'Gabriella', 'Roger', 'Jocelyn', 'Frederick', 'Angelina', 'Leonard', 'Makayla',
             'Oscar', 'Kennedy', 'Clarence', 'Adriana', 'Lester', 'Mia', 'Glenn', 'Isabelle', 'Jared', 'Maya', 'Joel', 'Elise',
             'Max', 'Violet', 'Levi', 'Anna', 'Trevor', 'Gianna', 'Nathan', 'Jordyn', 'Bradley', 'Piper', 'Landon', 'Haley',
             'Miles', 'Kylie', 'Aaron', 'Londyn', 'Cameron', 'Layla', 'Dennis', 'Makenna', 'Isaac', 'Aria', 'Calvin', 'Mariah',
             'Alex', 'Rylee', 'Carl', 'Alexis', 'Roland', 'Audrey', 'Eddie', 'Isabel', 'Gordon', 'Mckenzie', 'Isaiah', 'Adalyn',
             'Harry', 'Delaney', 'Jerome', 'Julianna', 'Ronald']
    return random.choice(names)

def generate_shift():
    return random.choice(['morning', 'evening', 'noon'])

def generate_date(start_year=2000, end_year=2023):
    start_date = datetime(start_year, 1, 1)
    end_date = datetime(end_year, 12, 31)
    random_date = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    return random_date.strftime("%Y-%m-%d")
    
def generate_major():
    majors = ["Computer Science", "Mechanical Engineering", "Business Administration", "Psychology", "Biology", "Nursing", 
    "Political Science", "Economics", "History", "English Literature", "Environmental Science", "Sociology", "Accounting", 
    "Graphic Design", "Physics"]
    return random.choice(majors)
    
def generate_department():
    deps = ["Finances", "Asset Management", "Legal Department", "Public Relations", "Research and Development", 
    "Customer Service", "Finances", "Asset Management", "Quality Assurance", "Legal Department"]
    return random.choice(deps)

# Functions to generate SQL insert statements for each entity
def gen_person(ID):
    return f"INSERT INTO Person (ID, Age, PhoneNumber, Name) VALUES ({ID}, {random.randint(25, 50)}, '{generate_phone_number()}', '{generate_name()}');"

def gen_building(ID):
    return f"INSERT INTO Building (BuildingID) VALUES ({ID});"

def gen_room(BID, RID):
    return f"INSERT INTO Room (RoomID, BuildingID, MaxCapacity) VALUES ({RID}, {BID}, {random.randint(4, 8)});"

def gen_worker(ID):
    return f"INSERT INTO Worker (ID, HireDate) VALUES ({ID}, '{generate_date()}');"

def gen_student(ID, RID, BID):
    return f"INSERT INTO Student (ID, RoomID, BuildingID, EnrollmentDate, Major) VALUES ({ID}, {RID}, {BID}, '{generate_date()}', '{generate_major()}');"

def gen_manager(ID):
    return f"INSERT INTO Manager (ID, Department) VALUES ({ID}, '{generate_department()}');"

def gen_cleaner(ID):
    return f"INSERT INTO Cleaner (ID, Shift) VALUES ({ID}, '{generate_shift()}');"

def gen_worksin(ID, BID):
    return f"INSERT INTO WorksIn (ID, BuildingID) VALUES ({ID}, {BID});"

# Function to generate SQL insert statements for all entities
def generate_insert_statements():
    statements = []
    num_records = 400

    # Generate Building records
    for i in range(1, num_records + 1):
        statements.append(gen_building(i))
        statements.append(gen_room(i, 1))
        statements.append(gen_room(i, 2))


    # Generate Person records
    for i in range(1, 3 * num_records + 1):
        statements.append(gen_person(i))
        
    for i in range(1, num_records + 1):
        place = random.randint(0, 2)
        for j in range(3):
            if place == j:
                statements.append(gen_student(j * num_records + i, random.randint(1, 2), random.randint(1, num_records + 1)))
            else:
                statements.append(gen_worker(j * num_records + i))
                statements.append(gen_worksin(j * num_records + i, random.randint(1, num_records + 1)))
                
    for i in range(1, 2 * num_records + 1):
        place = random.randint(0, 1)
        for j in range(2):
            if place == j:
                statements.append(gen_cleaner(j * num_records + i))
            else:
                statements.append(gen_manager(j * num_records + i))
    return statements

# Generate the insert statements
insert_statements = generate_insert_statements()

# Write the statements to insertTable.sql file
with open('insertTable.sql', 'w') as file:
    file.write('\n'.join(insert_statements))

print("insertTable.sql file generated successfully!")
