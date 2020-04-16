*** Settings ***
Suite Setup       Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database
Library           DatabaseLibrary
Library           OperatingSystem
Variables         variables.py

*** Variables ***

# robot -d Results ConnectToMySQL.robot

*** Test Cases ***
Create person table
    # robot -d Results -i smoke ConnectToMySQL.robot
    [Tags]  db  smoke
    Execute SQL String    CREATE TABLE person (id integer unique,first_name varchar(30),last_name varchar(30));


Insert person into table
    # robot -d Results -i insert ConnectToMySQL.robot
    [Tags]  db  insert
    Execute SQL String  INSERT INTO person (id, first_name, last_name) VALUES (1237, 'Homer', 'Simpson');


Delete Person row
    # robot -d Results -i delete ConnectToMySQL.robot
    [Tags]  db  delete
    Execute SQL String  DELETE FROM person WHERE id = 1237;


Update person name
    # robot -d Results -i update ConnectToMySQL.robot
    [Tags]  db  update
    Execute SQL String  UPDATE person SET first_name = 'Homer Jay' WHERE id = 1237;