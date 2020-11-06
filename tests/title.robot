*** Settings ***
Resource    Web\base.robot

Test Setup      Nova Sessão
Test Teardown   Encerra Sessão


*** Test Cases ***
Deve validar o titulo
    Title Should Be     Training Wheels Protocol
