# Windows Desktop Application Testing with Robot Framework
## Documentation
[Robot Framework](https://robotframework.org/)  
[Robot Framework User Guide](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)  
[RPA.Windows](https://robocorp.com/docs/libraries/rpa-framework/rpa-windows)  
[All command line options](https://github.com/robotframework/robotframework/blob/master/doc/userguide/src/Appendices/CommandLineOptions.rst)

## Environment Setup

### Python

- Install [Python 3.9](https://www.python.org/downloads/)

### Robot Framework

- Install Robot Framework by running the command in the Command Prompt or IDE terminal: ```pip install robotframework``` 
- Install libraries:  
```pip install rpaframework```  
```pip install rpaframework-windows```  
```pip install robotframework-databaselibrary```  


### IDE

- Install [PyCharm](https://www.jetbrains.com/pycharm/)
- Install plugin [IntelliBot #patched](https://plugins.jetbrains.com/plugin/17424-intellibot-patched)
- Configure Python interpreter and install packages **robotframework** and **rpaframework-windows** in File -> Settings -> Project -> Python Interpreter

## Execution

Run the following commands in the Command Prompt or IDE terminal:
- To execute all test files in the **Tests** folder:
```robot Tests```

- To execute specific test files in the **Tests** folder:
```robot Tests\library_test.robot```

- To put log, output and report into **Results** folder:
```robot -d Results Tests```

- To set log level:
```robot --logLevel INFO Tests```

- To run tests with tags:
```robot -i myTag Tests```

- To randomize tests execution:
```robot --randomize ALL Tests```

## Report Portal Configuration
- Install library:  
```pip install robotframework-reportportal```  

- In robot.yaml set the Report Portal details
```
--variable RP_ENDPOINT:<REPORT_PORTAL_URL>
--variable RP_LAUNCH:<LAUNCH_NAME>
--variable RP_PROJECT:<PROJECT_NAME>
```

- Add the following arguments to the execution command:  
```-v RP_UUID:xxxxxxxxxxxxxxxx --argumentfile robot.yaml```  
Example of the command:  
```robot -d Results -v RP_UUID:73823d-wd342-sdfsf33 --argumentfile robot.yaml Tests```
