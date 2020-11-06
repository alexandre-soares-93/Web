*** Settings ***
Resource        base.robot

Test Setup      Nova Sessão
Test Teardown   Encerra Sessão

*** Variables ***
${check_thor}       id:thor
${check_iron}       css:input[value='iron-man']
${check_panther}    xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando opção com id
    Go To                           ${url}/checkboxes
    Select checkbox                 ${check_thor}
    Checkbox Should be Selected     ${check_thor}

Marcando opção com CSS Selector
    Go To                           ${url}/checkboxes
    Select checkbox                 ${check_iron}
    Checkbox Should be Selected     ${check_iron}

Marcando opção com Xpath
    [tags]      blackpanther
    Go To                           ${url}/checkboxes
    Select checkbox                 ${check_panther} 
    Checkbox Should be Selected     ${check_panther} 
