# 🔗 SPI 8-bit Master-Slave Communication

## 📌 Project Overview
This project implements an **8-bit Serial Peripheral Interface (SPI)** system with two modules:
- **Master**: Initiates communication, generates clock, and transmits data.  
- **Slave**: Receives clock and data from the master, and responds accordingly.  

The design demonstrates **full-duplex communication** between master and slave using an 8-bit data frame.

---

## 🛠️ Technical Details
- **Language**: Verilog   
- **Data Width**: 8-bit  
- **Modules**: Master & Slave  
- **Communication Mode**: SPI (configurable for CPOL=0, CPHA=0 )  
- **Clock**: Master-generated clock signal  

---

## ⚙️ Features
1. **Full-duplex transfer**: Data is shifted simultaneously between master and slave.  
2. **Fixed design**: Supports fixed SPI  
3. **Synchronous communication**: Controlled by the master clock.  
4. **Testbench included**: Validates correct transmission and reception of data.

---

## 👨‍💻 Author
- **Tran Duc Anh**  
- Computer Engineering Student, HCMUT  
- Focus: RTL Design & Computer Architecture  

📫 Contact:  
- [Facebook](https://www.facebook.com/anh.tran.78639?locale=vi_VN)  
- [LinkedIn](https://www.linkedin.com/in/anh-tr%E1%BA%A7n-%C4%91%E1%BB%A9c-84116b368/)  
- Email: 20211.tranducanh.dbk@gmail.com  


