*** Settings ***
Library    RPA.Windows
Library    OperatingSystem

*** Variables ***
${VNC_PATH}=  C:/Program Files/TightVNC/tvnviewer.exe

*** Test Cases ***
Open VNC and login to POS app
  [Documentation]  Open TightVNC and login ti POS server
  [Tags]  vnc    smoke
  [Setup]  Windows Run  ${VNC_PATH}
  Open VNC


*** Keywords ***
Open VNC
    Set Value     id:1001    10.159.153.18    enter=True

