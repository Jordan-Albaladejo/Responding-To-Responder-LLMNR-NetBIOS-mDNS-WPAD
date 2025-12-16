# Responding To Responder - A Guide for Securing LLMNR, NetBIOS, mDNS and WPAD

![Ruggard Cybersecurity Engineer](https://github.com/Jordan-Albaladejo/Responding-To-Responder-LLMNR-NetBIOS-mDNS-WPAD/blob/main/Assets/Images/Responding%20to%20Responder%20Icon.png)

This repository provides practical guidance and scripts for defending Windows environments against Responder tool attacks. Blocking, defending and securing common discovery protocols: LLMNR, NetBIOS, mDNS and WPAD via Intune.    

## Steps of where to go first in this repo:  

1️⃣ Read the PDF guide: [Responding To Responder - PDF Guide](https://github.com/Jordan-Albaladejo/Responding-To-Responder-LLMNR-NetBIOS-mDNS-WPAD/blob/main/Guide/Responding%20to%20Responder%20Guide%200001.pdf)    
     

2️⃣ Access the exported JSON Intune Configuration Policies: 

  - 📄 [Disable LLMNR Intune - Intune JSON File](https://github.com/Jordan-Albaladejo/Responding-To-Responder-LLMNR-NetBIOS-mDNS-WPAD/blob/main/Configuration%20Policies/%F0%9F%9B%A1%EF%B8%8F%20Internal%20Baseline%20_%20Disable%20LLMNR.json)
      - Brief Explination: This will disable Local-Link Multicast Name Resolution (LLMNR) in the environment, by enabling: Turn off multicast name resolution and Turn off smart multi homed name resolution.    
  See more details in PDF guide (Step 1).     

    
  - 📄 [LLMNR, NetBIOS, mDNS, WPAD, LM, NTLM Security - Intune JSON File](https://github.com/Jordan-Albaladejo/Responding-To-Responder-LLMNR-NetBIOS-mDNS-WPAD/blob/main/Configuration%20Policies/%F0%9F%9B%A1%EF%B8%8F%20Internal%20Baseline%20_%20LLMNR%2C%20NetBIOS%2C%20mDNS%2C%20WPAD%2C%20LM%2C%20NTLM%20Security.json)    
  - 📄 [Network Auth Security - Intune JSON File](https://github.com/Jordan-Albaladejo/Responding-To-Responder-LLMNR-NetBIOS-mDNS-WPAD/blob/main/Configuration%20Policies/%F0%9F%9B%A1%EF%B8%8F%20Internal%20Baseline%20_%20Network%20Auth%20Security.json)   
  - 📄 [Password and Credential Hash Security - Intune JSON File](https://github.com/Jordan-Albaladejo/Responding-To-Responder-LLMNR-NetBIOS-mDNS-WPAD/blob/main/Configuration%20Policies/%F0%9F%9B%A1%EF%B8%8F%20Internal%20Baseline%20_%20Password%20and%20Credential%20Hash%20Security.json)
      - Brief Explination: These three are respecting additional measures to lock down further what each protocol can do, as well as NTLM and LM credential network travel and hash storage security. See more details in PDF guide from page 13 (Step 1).     

    
3️⃣ Access the exported PowerShell Platform scripts:    
  - 🪄 [Disable mDNS - Platform Script](https://github.com/Jordan-Albaladejo/Responding-To-Responder-LLMNR-NetBIOS-mDNS-WPAD/blob/main/Platform%20Scripts/DisableMDNS.ps1)
      - Brief Explination: This script will look to see if existing DWORD "EnableMDNS" is present and set to "0", if not create and/or update.    
  
  - 🪄 [Disable NetBIOS - Platform Script](https://github.com/Jordan-Albaladejo/Responding-To-Responder-LLMNR-NetBIOS-mDNS-WPAD/blob/main/Platform%20Scripts/DisableNetBIOS.ps1)
      - Brief Explination: This script will iterate over the listed NIC (Ensuring it applies change to all) checking if DWORD "NetbiosOptions" is present and set to "2", if not create and/or update. This will ensure each NIC has the NetBIOS setting: "Disable NetBIOS over TCP/IP" set.
          - Special credit to [Credit of NetBIOS disable method](https://woshub.com/how-to-disable-netbios-over-tcpip-and-llmnr-using-gpo/) for method of DWORD.     
  
  - 🪄 [Disable WPAD - Platform Script](https://github.com/Jordan-Albaladejo/Responding-To-Responder-LLMNR-NetBIOS-mDNS-WPAD/blob/main/Platform%20Scripts/DisableWPAD.ps1)
      - Brief Explination: This script will look to see if existing DWORD "DisableWPAD" is present and set to "1", if not create and/or update.      
      
     
 ### 🚨 DISCLAIMER 🚨      
 
 Remember that any changes made in your and/or client environment is **YOUR** express responsibility, **YOUR** due diligance is required in assessing the environment for custom configurations, risk acceptace and requirements.    
 Any actions, configurations, or deployments undertaken based on the information provided in this document are solely the responsibility of the recipient. Jordan Albaladejo and any affiliated entity disclaim all liability for any outcomes resulting from the use or implementation of these solutions.     

 > #### *Happy defending* 🛡️⚔️
