*** Test Cases ***
IF ELSE condition
    [Documentation]
    ...    My student grade
    ...    >= 80 = A
    ...    70 - 79 =B
    ...    60-69=C
    ...    50-59=D
    ...    <50=F
    ...    
    #ควรใส่ S เวลาเป็นพหูพจหรือเปน list จะได้รู้และจำได้
    @{student grades} =    Create List    23    67    80    90
    
# use for loop with condition
    FOR    ${grade}    IN    @{student grades}  # แทนค่า${grade}แทนค่า แต่ละvalueในlist
        Log    ${grade}
      #  Log student grade based on score    ${grade}
    ${actual grade} =     Get student grade based on score      ${grade}    #ส่งgradeไปให้score1 และ return gradeมาที่actual grade


        #ใช้ else if ดีกว่า if เฉยๆ เพราะ ทำทีเดียวค่อยได้ค่ามาเลยจบ performance ก็ดีกว่า

#        Run Keyword If    ${grade} >= 80    Log    A
 #       ...    ELSE IF    70<= ${grade}<=79    Log    B
 #       ...    ELSE IF    60 <= ${grade} <= 69    Log    C
 #       ...    ELSE IF    50 <= ${grade} <= 59    Log    D
 #       ...    ELSE   Log    F
        # Keykord if every step      
  #      Run Keyword If    70 <= ${grade} <= 79    Log    B
   #     Run Keyword If    60 <= ${grade} <= 69    Log    C
    #    Run Keyword If    50 <= ${grade} <= 59    Log    D
     #   Run Keyword If    ${grade} < 50    Log    F
    END
    
*** Keywords ***
Get student grade based on score
    [Arguments]    ${score1}
    [Return]    ${grade}
    ${grade} =    Set Variable    F
    ${grade} =    Set Variable If    ${score1} >=80    A     ${grade}
    ${grade} =    Set Variable If    70<= ${score1} <=79    B     ${grade}
    ${grade} =    Set Variable If    60 <= ${score1} <= 69    C     ${grade}
    ${grade} =    Set Variable If    50 <= ${score1} <= 59    D     ${grade}
    ${grade} =    Set Variable If    ${score1} < 50    F     ${grade}

Log student grade based on score     
    [Arguments]    ${score}
            Run Keyword If    ${score} >= 80    Log    A
        ...    ELSE IF    70<= ${score}<=79    Log    B
        ...    ELSE IF    60 <= ${score} <= 69    Log    C
        ...    ELSE IF    50 <= ${score} <= 59    Log    D
        ...    ELSE   Log    F