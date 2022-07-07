*** Settings ***
Library    RPA.Windows

*** Test Cases ***
Verify windows calculator addition
    [Setup]  Windows Run   calc.exe
    Control Window    name:Calculator
    Click    id:clearButton
    Send Keys   keys=96+4=
    ${result}=    Get Attribute    id:CalculatorResults    Name
    Log    ${result}
    Should Contain   ${result}  100
    [Teardown]   Close Current Window
