configuration MakeWebServer
{

Import-DscResource -ModuleName @{ModuleName = 'xWebAdministration';ModuleVersion = '1.19.0.0'}
Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

    WindowsFeature WebServer
    {
        Ensure  = 'Present'
        Name    = 'Web-Server'
    }

    # IIS Site Default Values
    xWebSiteDefaults SiteDefaults
    {
        ApplyTo                 = 'Machine'
        LogFormat               = 'IIS'
        LogDirectory            = 'C:\inetpub\logs\LogFiles'
        TraceLogDirectory       = 'C:\inetpub\logs\FailedReqLogFiles'
        DefaultApplicationPool  = 'DefaultAppPool'
        AllowSubDirConfig       = 'true'
        DependsOn               = '[WindowsFeature]WebServer'
    }

    # IIS App Pool Default Values
    xWebAppPoolDefaults PoolDefaults
    {
       ApplyTo               = 'Machine'
       ManagedRuntimeVersion = 'v4.0'
       IdentityType          = 'ApplicationPoolIdentity'
       DependsOn             = '[WindowsFeature]WebServer'
    }

     File WebContent
    {
        Ensure          = "Present"
        SourcePath      = $SourcePath
        DestinationPath = $DestinationPath
        Recurse         = $true
        Type            = "Directory"
        DependsOn       = "[WindowsFeature]AspNet45"
    }

    xWebsite NewWebsite
    {
        Ensure          = "Present"
        Name            = $WebSiteName
        State           = "Started"
        PhysicalPath    = $DestinationPath
        DependsOn       = "[File]WebContent"
        BindingInfo     = MSFT_xWebBindingInformation
        {
            Protocol              = 'https'
            Port                  = '443'
            CertificateStoreName  = 'MY'
            CertificateThumbprint = 'BB84DE3EC423DDDE90C08AB3C5A828692089493C'
            HostName              = $Website
            IPAddress             = '*'
            SSLFlags              = '1'
        }
    }

}
