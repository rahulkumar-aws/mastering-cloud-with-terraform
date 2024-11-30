## **Administer Identity**

![Administer Identity](./images/Azure-104-Administer-Identity-Overview.jpg "Administer Identity")


### Objectives
- Configure Microsoft Entra ID
    - Introduction to Microsoft Entra ID
    - Microsoft Entra ID concepts
    - Microsoft Entra ID Editions
    - Configure Device Identities

### **Objective 1: Configure Microsoft Entra ID**

---

### **1. Introduction to Microsoft Entra ID**

Microsoft Entra ID (formerly Azure Active Directory) is Microsoft’s cloud-based identity and access management service. It enables organizations to:
- Securely manage access to resources such as Azure services, Microsoft 365 apps, and third-party applications.
- Provide authentication, including multifactor authentication (MFA).
- Offer seamless single sign-on (SSO) to users for secure access.

#### **Key Features**
- Identity protection
- Conditional access
- Self-service password reset (SSPR)
- Role-based access control (RBAC)
- Integration with on-premises Active Directory using Azure AD Connect

#### **Use Cases**
- Centralized identity management for cloud and hybrid environments.
- Application and device management.
- Secure access to resources through Zero Trust principles.

---

### **2. Microsoft Entra ID Concepts**

#### **Core Components**
1. **Users**: Individual identities within the organization, including employees, partners, and guests.
2. **Groups**: Collections of users for managing access to resources.
3. **Roles**: Permissions assigned to users or groups to perform specific tasks.
4. **Applications**: Integration of enterprise apps for authentication and access.
5. **Devices**: Enrolled devices managed within the organization.

#### **Authentication Methods**
- Password-based authentication
- Multifactor Authentication (MFA)
- Certificate-based authentication
- Windows Hello for Business

#### **Synchronization**
- Azure AD Connect synchronizes on-premises Active Directory with Microsoft Entra ID.
- Password Hash Synchronization (PHS) and Pass-Through Authentication (PTA) options.

---

### **3. Microsoft Entra ID Editions**

Microsoft Entra ID comes in multiple editions, each tailored to different needs.

| **Edition**                | **Features**                                                                                  |
|----------------------------|----------------------------------------------------------------------------------------------|
| **Free**                   | Basic identity management, user/group management, and SSO for Microsoft 365.                |
| **Microsoft Entra ID P1**  | Advanced identity management, Conditional Access, and hybrid identity support.              |
| **Microsoft Entra ID P2**  | Includes all P1 features + Identity Protection, Privileged Identity Management (PIM).       |
| **Microsoft 365 Apps**     | Basic features included with a Microsoft 365 subscription for application management.       |

---

### **4. Configure Device Identities**

Device identities allow organizations to manage and secure the devices accessing their resources.

#### **Device Registration**
- Devices are registered to Microsoft Entra ID to enable identity-based security policies.
- Supports Windows, macOS, iOS, and Android devices.

#### **Steps to Configure Device Identities**
1. **Enable Device Registration**:
   - Go to the Microsoft Entra admin center.
   - Navigate to **Devices > Device Settings**.
   - Configure settings for **Users may join devices to Microsoft Entra ID** and **Require Multifactor Authentication to join devices**.

2. **Manage Device Identity**:
   - Use policies like **Conditional Access** to enforce device compliance.
   - Configure device trust for hybrid environments by integrating with Intune.

3. **Monitor Device Activity**:
   - Use **Microsoft Entra Insights** to monitor device sign-ins and activity.

#### **Device Authentication Modes**
- Azure AD-registered: For personal devices.
- Azure AD-joined: For corporate devices.
- Hybrid Azure AD-joined: For devices joined to an on-premises Active Directory and registered in Microsoft Entra ID.

---

### **Quick Tips for the Exam**
- Understand the differences between **Azure AD editions** (Free, P1, P2).
- Know how **Conditional Access** policies apply to devices and users.
- Familiarize yourself with the configuration options in the **Microsoft Entra admin center**.
- Practice registering and managing devices using labs or sandbox environments.
