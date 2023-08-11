*** Settings ***
Library    Remote    http://${ADDRESS}:${PORT}
Library    Basic_SupportLib.py

*** Variables ***
${ADDRESS}    127.0.0.1
# ${ADDRESS}    10.105.8.16
${PORT}       8270
${retries}    10

*** Keywords ***
Wait For System Online
    # [Arguments]    ${retries}
    FOR    ${index}    IN RANGE    ${retries}
        ${result} =    Is Device Online    ${ADDRESS}
        Exit For Loop If    '${result}' == 'True'
        Sleep    5sec    "Waiting for system to come back Online"
    END
    Should Be True    ${result}    Failed Ping ${ADDRESS} ${retries} times

# Wait For Remote Robot
#     [Arguments]     ${timeinseconds}
#     FOR    ${retries}  IN RANGE    ${timeinseconds}
#        Log To Console      Waiting for Robot To Ack ${retries}
#        ${status}   ${message}  Run Keyword And Ignore Error    Remote Ack
#        Return From Keyword If      '${status}' == 'PASS'   ${message}
#        Sleep       1sec
#     END
#     Return From Keyword     ${False}

*** Test Cases ***
Count Items in Directory
    ${items1} =    Count Items In Directory    ${CURDIR}
    ${items2} =    Count Items In Directory    ${TEMPDIR}
    Log    ${items1} items in '${CURDIR}' and ${items2} items in '${TEMPDIR}'

Failing Example
    Strings Should Be Equal    Hello    Hello
    Strings Should Be Equal    not      equal
	
Test Mod Cycle
	# ${ret} =    Start Modcycle
    # Log    Test Output Ret=> ${ret}

Test Reboot
    # Start Reboot
    Sleep    2sec
    Wait For System Online
    # ${robot_up} =    Wait For Remote Robot    30
    # Should Be True    ${robot_up}