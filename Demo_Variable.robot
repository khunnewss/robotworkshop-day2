*** Test Cases ***
Demo Scalar
     [Documentation]    
    ...    This test casr for demo scalar
    ...    commentแบบ เป็นคำขยายความ
    ...    
    ${username}    Set Variable    John
    ${password}    BuiltIn.Set Variable    welcome1
    #try to printlog hello user
    Log     Hello${username}and ${password}
    Log        Hi${username}
    #set nickname
    ${nickname}    Set variable    Mr J
    
Demo List
    @{product name}    Create List    Iphone11    Android12    Windows phone
    log Many     @{product name} 
    log    ${product name[1]}      #นับตัวแรกคือ 0 ต่อมาคือ 1
    
Demo Dictionary
    &{user1}        Create Dictionary    username=John1    password=welcome1
    &{user2}        Create Dictionary    username=Mary    password=welcome2    
    Log    ${user1.username}
    Log    ${user2.username}
    

    