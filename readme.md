# WS 2024 APIs

## ����������� ��� ���������� � ����������

### �������

- Session2 - API ��� ������ ����� ������� 2� ������
- Session5 - API ��� ������� � 5� ������

### ����������

1. ��� ������� ���������� **.NET 7** � ���������� �������� �������:

- Microsoft.EntityFrameworkCore
- Microsoft.EntityFrameworkCore.Design
- Microsoft.EntityFrameworkCore.SqlServer
- Microsoft.EntityFrameworkCore.Tools
- Microsoft.VisualStudio.Web.CodeGeneration.Design

2. ���������� ��

![Database](./Images/Database.png)

3. �������� ��������� ��

```bash
Scaffold-DbContext "Data Source=localhost;Initial Catalog=DbName;Integrated Security=True;TrustServerCertificate=True" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models/Db -force
```

### ��� ���������

#### Session2

������� � �������� ���������� ������� � ���������

#### Session5

� **SSMS** ��������� ������ [session5.sql](./Scripts) � �������� ������ ����������� � ��������� ��