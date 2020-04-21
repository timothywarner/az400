Configuration MakeWebServer
{
    Node "localhost"
    {
        WindowsFeature WebServer {
            Name   = "Web-Server"
            Ensure = "Present"
        }

        WindowsFeature ManagementTools {
            Name   = "Web-Mgmt-Tools"
            Ensure = "Present"
        }

        WindowsFeature DefaultDoc {
            Name   = "Web-Default-Doc"
            Ensure = "Present"
        }
    }
}

# WebServerConfiguration -OutputPath "C:\DscConfiguration"

# Start-DscConfiguration -Wait -Verbose -Path "C:\DscConfiguration"