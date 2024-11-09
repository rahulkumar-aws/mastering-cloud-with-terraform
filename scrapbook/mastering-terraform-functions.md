### **Mastering Terraform Functions: A Complete Guide with Examples**

Terraform’s extensive set of built-in functions can help you manipulate data, perform calculations, transform collections, and more, 
making your infrastructure-as-code configurations powerful and flexible. This guide covers Terraform’s functions, categorized by type, 
with code examples to demonstrate their real-world applications.

---

### **1. String Functions**

Terraform’s string functions allow you to manipulate text values, which is essential when creating dynamic names, formatting messages, or extracting parts of a string.

#### Examples

- **Joining a List into a Single String**
  ```hcl
  locals {
    names = ["dev", "staging", "prod"]
  }

  output "joined_names" {
    value = join("-", local.names)  # "dev-staging-prod"
  }
  ```

- **Replacing Part of a String**
  ```hcl
  locals {
    project_name = "my-app-123"
  }

  output "cleaned_name" {
    value = replace(local.project_name, "-123", "")  # "my-app"
  }
  ```

- **Converting Case**
  ```hcl
  output "uppercase" {
    value = upper("terraform")  # "TERRAFORM"
  }
  output "lowercase" {
    value = lower("TERRAFORM")  # "terraform"
  }
  ```

---

### **2. Collection Functions**

These functions help you work with lists and maps. You can sort, filter, and manipulate collections easily.

#### Examples

- **Get the Length of a List or Map**
  ```hcl
  locals {
    instances = ["i-123", "i-456", "i-789"]
  }

  output "instance_count" {
    value = length(local.instances)  # 3
  }
  ```

- **Merge Two Maps**
  ```hcl
  locals {
    default_tags = { Name = "example", Environment = "dev" }
    additional_tags = { Owner = "team" }
  }

  output "merged_tags" {
    value = merge(local.default_tags, local.additional_tags)  
    # { Name = "example", Environment = "dev", Owner = "team" }
  }
  ```

- **Sort a List Alphabetically**
  ```hcl
  locals {
    names = ["Charlie", "Alice", "Bob"]
  }

  output "sorted_names" {
    value = sort(local.names)  # ["Alice", "Bob", "Charlie"]
  }
  ```

---

### **3. Conditional Functions**

Conditional functions allow you to handle multiple possible values based on certain conditions, making configurations dynamic and flexible.

#### Examples

- **Coalescing Values (Finding the First Non-Null)**
  ```hcl
  variable "override" {
    type    = string
    default = null
  }

  locals {
    effective_value = coalesce(var.override, "default-value")
  }

  output "effective_value" {
    value = local.effective_value  # "default-value" if override is null
  }
  ```

- **Getting Distinct Values from a List**
  ```hcl
  locals {
    items = ["apple", "banana", "apple", "orange"]
  }

  output "unique_items" {
    value = distinct(local.items)  # ["apple", "banana", "orange"]
  }
  ```

---

### **4. Type Conversion Functions**

Type conversion functions let you cast values into different types. These are useful for transforming data to the types required by resources or modules.

#### Examples

- **Convert a List to a Set**
  ```hcl
  locals {
    items = ["apple", "banana", "apple"]
  }

  output "unique_items" {
    value = toset(local.items)  # Set with unique items: ["apple", "banana"]
  }
  ```

- **Parse a String to a Number**
  ```hcl
  locals {
    numeric_string = "42"
  }

  output "parsed_number" {
    value = tonumber(local.numeric_string)  # 42
  }
  ```

---

### **5. Numeric Functions**

Numeric functions handle mathematical calculations and manipulations, including rounding and finding minimum or maximum values.

#### Examples

- **Rounding Functions**
  ```hcl
  locals {
    value = 5.75
  }

  output "rounded_up" {
    value = ceil(local.value)  # 6
  }

  output "rounded_down" {
    value = floor(local.value)  # 5
  }
  ```

- **Finding Minimum and Maximum Values**
  ```hcl
  output "minimum_value" {
    value = min(10, 5, 20)  # 5
  }

  output "maximum_value" {
    value = max(10, 5, 20)  # 20
  }
  ```

---

### **6. Date and Time Functions**

Date and time functions let you work with timestamps and time durations, which can be useful in automation scenarios.

#### Examples

- **Getting the Current Timestamp**
  ```hcl
  output "current_time" {
    value = timestamp()  # e.g., "2023-09-01T12:34:56Z"
  }
  ```

- **Adding Time Durations**
  ```hcl
  locals {
    current_time = timestamp()
    future_time  = timeadd(local.current_time, "1h")
  }

  output "one_hour_later" {
    value = local.future_time
  }
  ```

---

### **7. Filesystem and Path Functions**

These functions help manipulate file paths and directory structures, which is useful when dynamically generating or handling files.

#### Examples

- **Extract the Directory Name from a Path**
  ```hcl
  output "directory" {
    value = dirname("/path/to/file.txt")  # "/path/to"
  }
  ```

- **Get the Base Filename**
  ```hcl
  output "filename" {
    value = basename("/path/to/file.txt")  # "file.txt"
  }
  ```

---

### **8. Encoding Functions**

Encoding functions let you encode data in various formats, including JSON, YAML, and base64, making it easier to work with structured data and secure strings.

#### Examples

- **Encoding and Decoding JSON**
  ```hcl
  locals {
    data = { key = "value" }
    json_encoded = jsonencode(local.data)
  }

  output "json_encoded" {
    value = local.json_encoded  # '{"key":"value"}'
  }

  output "decoded_data" {
    value = jsondecode(local.json_encoded)  # { key = "value" }
  }
  ```

- **Base64 Encoding**
  ```hcl
  output "base64_encoded" {
    value = base64encode("hello")  # "aGVsbG8="
  }
  ```

---

### **9. Hashing and Crypto Functions**

These functions are useful for generating hashes for security, integrity checks, or creating unique identifiers.

#### Examples

- **Generating MD5 and SHA Hashes**
  ```hcl
  output "md5_hash" {
    value = md5("my-string")  # MD5 hash of "my-string"
  }

  output "sha256_hash" {
    value = sha256("my-string")  # SHA-256 hash of "my-string"
  }
  ```

---

### **10. Network Functions**

Network functions simplify CIDR calculations and IP address management, which is essential for network configurations.

#### Examples

- **Calculating a Subnet CIDR**
  ```hcl
  locals {
    vpc_cidr = "10.0.0.0/16"
  }

  output "subnet_cidr" {
    value = cidrsubnet(local.vpc_cidr, 8, 1)  # "10.0.1.0/24"
  }
  ```

- **Getting an IP Address in a Subnet**
  ```hcl
  output "third_host_ip" {
    value = cidrhost("10.0.1.0/24", 3)  # "10.0.1.3"
  }
  ```

---

### **11. Debugging and Error Handling Functions**

These functions are useful for troubleshooting Terraform configurations by removing sensitive data from outputs or expanding paths.

#### Examples

- **Mark a Value as Non-Sensitive for Debugging**
  ```hcl
  variable "password" {
    type      = string
    sensitive = true
  }

  output "debug_password" {
    value = nonsensitive(var.password)  # For debugging only
  }
  ```

---

### **Conclusion**

With Terraform’s rich set of functions, you can transform, manipulate, and handle data flexibly and efficiently within your configurations. 
These functions enable dynamic naming, complex logic, type conversion, time handling, and even security-related tasks like hashing and encoding. 
Whether you’re working on basic setups or complex infrastructure automation, mastering these functions is key to getting the most out of Terraform.
