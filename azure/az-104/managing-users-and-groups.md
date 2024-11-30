## **Configure and Manage User and Group Accounts**

### **Objectives**

---

### **1. User Accounts**

User accounts represent individual identities within your Microsoft Entra ID (formerly Azure AD). These accounts can belong to:
- Internal employees
- External partners
- Guest users (B2B collaboration)

#### **Creating and Managing User Accounts**
1. **Add a New User**:
   - Navigate to the **Microsoft Entra admin center**.
   - Go to **Users > All users** and click **+ New User**.
   - Fill in the details:
     - **User Type**: Assign as Member (internal) or Guest (external).
     - **Username**: Specify a unique name in the organization domain.
     - **Roles**: Assign roles such as Global Admin or custom roles.
     - **Group Membership**: Add to specific groups during creation.
   - Save the user.

2. **Edit User Accounts**:
   - Modify user properties such as job title, department, or group membership.

3. **Delete User Accounts**:
   - Deleting users removes access to all associated resources.
   - Deleted accounts can be restored from the **Deleted Users** section for up to 30 days.

---

### **2. Bulk Operation**

Bulk operations are useful for managing a large number of users or groups simultaneously.

#### **Steps to Perform Bulk User Operations**
1. **Download Bulk User Template**:
   - In the Microsoft Entra admin center, navigate to **Users > Bulk Create**.
   - Download the CSV template.

2. **Populate the CSV File**:
   - Add user details such as display name, username, and group membership.
   - Ensure the CSV file complies with the format specified by Microsoft.

3. **Upload the CSV File**:
   - Use the **Bulk Create** or **Bulk Update** option to upload the file.
   - Monitor the status in the **Bulk Operations** log.

#### **Key Bulk Operations**:
- **Create Users**: Add multiple users at once.
- **Update Users**: Modify attributes for existing users.
- **Delete Users**: Remove multiple users by uploading a list.

---

### **3. Group Accounts**

Groups are used to manage access and permissions for collections of users. Groups can simplify access management by assigning permissions to the group rather than individual users.

#### **Types of Groups**
1. **Microsoft Entra Security Groups**:
   - Used for managing permissions to Azure resources.
   - Example: Assigning access to a virtual machine.

2. **Microsoft 365 Groups**:
   - Used for collaboration in Microsoft 365 apps like Teams, SharePoint, and Outlook.

#### **Creating and Managing Groups**
1. **Create a Group**:
   - Navigate to **Groups > + New Group**.
   - Select Group Type (Security or Microsoft 365).
   - Assign a name, description, and membership type:
     - **Assigned**: Add members manually.
     - **Dynamic User**: Membership is based on user attributes.
     - **Dynamic Device**: Membership is based on device attributes.

2. **Add or Remove Members**:
   - Open the group and add or remove members as required.

3. **Assign Permissions**:
   - Use the group to manage access to Azure resources, apps, or roles.

---

### **4. Self-Service Password Reset (SSPR)**

SSPR allows users to reset their passwords without admin intervention, reducing IT overhead and improving user experience.

#### **Enabling SSPR**
1. **Navigate to the Microsoft Entra Admin Center**:
   - Go to **Password Reset** under the **Manage** section.

2. **Configure SSPR Settings**:
   - **Select Users**: Choose a group or set SSPR for all users.
   - **Authentication Methods**:
     - Users must verify their identity using one or more methods:
       - Email
       - Mobile app notification/code
       - Security questions
   - **Registration**: Enforce users to register their authentication methods.

3. **Customize Notifications**:
   - Enable email notifications for password reset events.
   - Notify users on password changes.

4. **Test SSPR**:
   - Test the feature by attempting a password reset for a test user account.

---

### **5. Multi-Tenant Environments**

A multi-tenant environment allows multiple organizations or tenants to share a single Microsoft Entra ID instance while maintaining their own secure and isolated identity domains.

#### **Key Features**
1. **B2B Collaboration**:
   - Add external users (guests) from other tenants to collaborate securely.
   - Guest users are managed through **Access Packages** and **Entitlement Management**.

2. **Cross-Tenant Access Settings**:
   - Configure **Default Settings** to control access for users in other tenants.
   - Customize **Inbound** and **Outbound** access policies for specific tenants.
   - Define **Trust Settings** for Multi-Factor Authentication (MFA) and device compliance.

3. **Managing Users in Multi-Tenant Environments**:
   - Share applications and resources across tenants.
   - Enable seamless collaboration using **Teams**, **SharePoint**, or other services.

#### **Configuration Steps**:
1. Navigate to **Microsoft Entra admin center**.
2. Go to **External Identities > Cross-tenant access settings**.
3. Configure the following:
   - **Organizational Settings**: Add trusted tenants for collaboration.
   - **User Access Settings**: Set restrictions for guest access.
   - **Conditional Access**: Enforce policies like MFA or compliant devices.

---

### **Quick Tips for Exam Success**
- Understand how **B2B Collaboration** works in multi-tenant environments.
- Familiarize yourself with cross-tenant access settings and trust configurations.
- Practice adding guest users and managing access to shared applications.
- Know how to enable and configure **SSPR** and troubleshoot common issues.
