*** Settings ***
Resource  resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser
Test Setup      Reset Counter

*** Test Cases ***
When counter is set to 10 the value is ten
    Go To  ${HOME_URL}
    Fill Text  input[name="value"]  10
    Click  button >> text=Aseta
    Get Text  body  *=  nappia painettu 10 kertaa

When counter has a value and it is set to a new value the new value is shown
    Go To  ${HOME_URL}
    Click  button >> text=Paina
    Click  button >> text=Paina
    Click  button >> text=Paina
    Get Text  body  *=  nappia painettu 3 kertaa
    Fill Text  input[name="value"]  0
    Click  button >> text=Aseta
    Get Text  body  *=  nappia painettu 0 kertaa
