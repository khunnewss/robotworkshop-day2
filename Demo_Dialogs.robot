*** Settings ***  #trl+space and select settings
Library    Dialogs

*** Test Cases ***
Demo pause dialog
    Log    Step1
    Dialogs.Pause Execution    Test pause    #dialogs. Ctrl+space then select pause execution
    #ใช้เพื่อหยุดแล้วลองกดเทสเองว่าเกิดอะไรขึ้น ทำไมเมื่อกี้มันใช้ไม่ได้
    Log     Step2