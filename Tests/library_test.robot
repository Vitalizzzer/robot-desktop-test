*** Settings ***
Library    RPA.Windows
Library    OperatingSystem
Library    DatabaseLibrary

*** Variables ***
${APP_PATH}=        C:/Users/Vitalii_Rymar/Apps/Library/Library.exe
${AUTHOR}=          New Author
${TITLE}=           New Title
${GENRE}=           Education
${DATE}=            01-Jul-2022
${INFO}=            New book description
${COVER_PATH}=      C:\\Users\\Vitalii_Rymar\\Pictures\\test_book.jpg
${DB_PATH}=         C:\\Users\\Vitalii_Rymar\\Apps\\Library\\Resources\\LibraryDB

*** Test Cases ***
Verify book is added into library application
    [Documentation]  Open library and add a new book.
    [Tags]  Smoke
    [Setup]    Open Library application
    Add a new book
    Check the book exists in DB
    Check the book exists in UI
    Delete books
    [Teardown]    Close Window    id:WindowMain


*** Keywords ***
Open Library application
    Windows Run  ${APP_PATH}

Add a new book
    Set Value         id:TxtAuthor        ${AUTHOR}
    Set Value         id:TxtTitle         ${TITLE}
    Click             id:CmbGenre
    Click             name:${GENRE}
    Click             id:PART_TextBox
    Set Value         id:PART_TextBox     ${DATE}
    Set Value         id:TxtInfo          ${INFO}
    Click             id:BtnImage
    Set Value         class:Edit          ${COVER_PATH}    enter=True
    Click             id:BtnAddBook

Check the book exists in DB
    Connect To Database Using Custom Params    sqlite3    database=r"${DB_PATH}.db", isolation_level=None
    Check If Exists In Database    SELECT * FROM Book WHERE Author='${AUTHOR}'

Check the book exists in UI
    ${rows}=    Get Elements    class:DataGridRow
    FOR    ${row}    IN    ${rows}
        ${cells}=    Get Elements    class:DataGridCell
        FOR    ${cell}    IN    ${cells}
          should be equal   ${cell[0].name}    ${AUTHOR}
          should be equal   ${cell[1].name}    ${TITLE}
          should be equal   ${cell[2].name}    ${GENRE}
        END
    END

Delete books
    ${rows}=    Get Elements    class:DataGridRow
    FOR    ${row}    IN    ${rows}
        Control Window    id:WindowMain
        Right Click  class:DataGridCell
        Click    id:DeleteMenuItem
        Click    id:6
    END



