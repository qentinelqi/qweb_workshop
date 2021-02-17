*** Settings ***
Library                     QWeb

*** Test Cases ***
Table exercises
    OpenBrowser             file://${CURDIR}/../examples/table.html   chrome      # if test page has been store locally to c:\automation folder
    # 1 - Focus on the table using *UseTable*
    UseTable    Firstname

    #2 - Get the amount of rows in a table including headers
    ${rows}=    GetTableRow     //last

    #3 - Get the amount of rows in table excluding headers
    ${rows}=    GetTableRow     //last  skip_header=True

    #4 - Find row index for row that contains text *Jane*. Do not include headers!
    ${rows}=    GetTableRow     Jane    skip_header=True

    #5 - Get the first name on third row.
    ${first_name}=    GetCellText    r3c2

    #6 -Verify that the first name on second row is "Jane"
    VerifyTable  r2c2   Jane

    #7 - Click "Copy email" button in row that contains word "John"
    ClickCell   r?John/c4      tag=button
