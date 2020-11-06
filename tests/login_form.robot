*** Settings ***
Resource        base.robot

Test Setup      Nova Sessão
Test Teardown   Encerra Sessão

*** Test Cases ***
Login com sucesso
    Go To                               ${url}/login
    Login With                          stark           jarvis!
    Should See Logged User              Tony Stark

Senha invalida
    [tags]                              login_error
    Go To                               ${url}/login
    Login With                          stark           abc123
    Should Contain Login Alert          Senha é invalida!

Usuário não existe
    [tags]                              login_user404
    Go To                               ${url}/login
    Login With                          Asoares         123456
    Should Contain Login Alert          O usuário informado não está cadastrado!

*** Keywords ***
Login With
    [Arguments]     ${uname}    ${pass}

    Input Text              css:input[name=username]      ${uname}
    Input Text              css:input[name=password]      ${pass}
    Click Element           class:fa-sign-in

Should Contain Login Alert
    [Arguments]             ${expect_message}

    ${message}=             Get WebElement                id:flash
    Should Contain          ${message.text}               ${expect_message}

Should See Logged User
    [Arguments]     ${full_name}

    Page Should Contain     Olá, Tony Stark. Você acessou a área logada!