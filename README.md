<img width="1536" height="1024" alt="UVM APB-SPI Verification Architecture" src="https://github.com/user-attachments/assets/e3cdf680-11fb-43e4-99b0-3033b71a6724" /># APB-Based SPI Protocol Verification Using SystemVerilog and UVM

## 📌 Project Overview

This project focuses on the functional verification of an **SPI (Serial Peripheral Interface) protocol using an APB (Advanced Peripheral Bus) interface**. The verification environment is developed using **SystemVerilog and the Universal Verification Methodology (UVM)** to validate data transfers, protocol behavior, and SPI configuration modes.

The testbench incorporates **UVM components, SystemVerilog Assertions (SVA), and functional coverage** to improve verification quality and measure the completeness of the verification process.

Eight test scenarios are verified by varying the SPI configuration parameters **CPOL (Clock Polarity), CPHA (Clock Phase), and MSBFE (Most Significant Bit First Enable)**.

## 🎯 Project Objectives

- Verify SPI data transfers through an APB-based interface.
- Validate the interaction between APB control and data signals and SPI serial communication.
- Verify all eight combinations of CPOL, CPHA, and MSBFE.
- Develop reusable UVM components for stimulus generation, driving, monitoring, and checking.
- Use SystemVerilog Assertions to validate protocol behavior.
- Implement functional coverage to measure configuration and scenario coverage.
- Compare expected and observed data using a scoreboard.

## 🛠️ Technologies and Methodologies

| Technology | Purpose |
|---|---|
| SystemVerilog | Testbench development and verification logic |
| UVM | Modular, reusable verification environment |
| SystemVerilog Assertions (SVA) | Protocol and timing-property checking |
| Functional Coverage | Coverage measurement for SPI configurations |
| APB Protocol | Register access and peripheral control |
| SPI Protocol | Serial data communication verification |

## 🏗️ Verification Environment Architecture

The testbench is organized into reusable components for APB and SPI verification.

### Key Components

**1. Sequence Item Classes**
- `APB Sequence Item`: Represents APB transaction information, including address, control, and write-data fields.
- `SPI Sequence Item`: Represents SPI transaction information and associated configuration parameters.

**2. Interfaces**
- `APB Interface`: Groups APB signals and provides connectivity between the APB verification components and the design under test (DUT).
- `SPI Interface`: Groups SPI signals, including serial clock, chip select, MOSI, and MISO, as applicable to the DUT.

**3. Drivers**
- `APB Driver`: Drives APB transactions to configure and access the SPI peripheral through the APB interface.
- `SPI Driver`: Drives SPI-related inputs through the SPI interface, as required by the verification architecture.

**4. Scoreboard**
- Checks data consistency between the APB and SPI sides of the design.
- Compares APB write data (`PWDATA`) with SPI MOSI data.
- Compares APB read data (`PRDATA`) with SPI MISO data, according to the implemented transaction mapping.

**5. Assertions**
- SystemVerilog Assertions can be used to check protocol requirements, signal stability, valid transfer sequences, and timing relationships.
- Assertions help detect protocol violations during simulation.

**6. Functional Coverage**
- Tracks the tested combinations of CPOL, CPHA, and MSBFE.
- Helps identify untested configuration scenarios and measure verification completeness.

## 🔬 SPI Configuration and Test Scenarios

The verification environment covers all eight combinations of the three configuration parameters.

| Test Case | CPOL | CPHA | MSBFE |
|---|---:|---:|---:|
| TC_01 | 0 | 0 | 0 |
| TC_02 | 0 | 1 | 0 |
| TC_03 | 1 | 0 | 0 |
| TC_04 | 1 | 1 | 0 |
| TC_05 | 0 | 0 | 1 |
| TC_06 | 0 | 1 | 1 |
| TC_07 | 1 | 0 | 1 |
| TC_08 | 1 | 1 | 1 |

### Configuration Parameters

- **CPOL (Clock Polarity):** Determines the idle level of the SPI serial clock.
- **CPHA (Clock Phase):** Determines the clock edge used for data sampling relative to the SPI clock cycle.
- **MSBFE (Most Significant Bit First Enable):** Controls the data transmission bit order according to the DUT's configuration definition.

The eight scenarios provide complete combination coverage of the three binary configuration parameters. This represents **100% configuration-combination coverage** when all eight combinations are exercised and confirmed by functional coverage. It does not, by itself, establish 100% overall functional or code coverage.

## 🔍 Scoreboard and Data Integrity Checking

The scoreboard checks data consistency across the APB and SPI interfaces.

| Comparison | Verification Purpose |
|---|---|
| `PWDATA` vs. `MOSI` | Checks whether APB write data matches the corresponding SPI-transmitted data |
| `PRDATA` vs. `MISO` | Checks whether APB read data matches the corresponding SPI-received data |

The comparisons are performed according to the implemented transaction mapping and data alignment rules. A mismatch indicates a potential data-integrity issue that requires investigation.

## 📊 Assertions and Functional Coverage

### SystemVerilog Assertions

Assertions support protocol-level verification by checking properties such as:

- Valid APB setup and access phases.
- APB control-signal stability during an active transfer, where required by the protocol.
- Correct SPI clock polarity and phase behavior.
- Valid data sampling and shifting relationships.
- Expected control and data-signal behavior during transactions.

*The exact properties depend on the assertions implemented in the testbench.*

### Functional Coverage

Functional coverage is used to track whether the intended SPI configurations have been exercised.

Coverage goals include:

- CPOL values: `0` and `1`.
- CPHA values: `0` and `1`.
- MSBFE values: `0` and `1`.
- All eight combinations of CPOL, CPHA, and MSBFE.

A cross-coverage model can be used to measure the configuration combinations and identify missing scenarios.

## ▶️ Simulation and Verification Flow

1. Compile the DUT, interfaces, transaction classes, UVM components, and assertion or coverage files.
2. Configure the simulator and UVM environment.
3. Run the required test case for each CPOL, CPHA, and MSBFE combination.
4. Generate APB transactions to configure and access the SPI peripheral.
5. Drive and monitor SPI communication through the SPI interface.
6. Collect transaction data and perform scoreboard comparisons.
7. Evaluate assertion results and functional coverage.
8. Review simulation logs, investigate mismatches, and confirm the expected test outcomes.

**Note:** The exact compilation and simulation commands depend on the simulator and project file structure.

## 📁 Project Structure

The following is a suggested repository organization. Update the filenames to match the actual source files in your project.

```text
APB-SPI-Protocol-Verification/
├── README.md
├── rtl/
│   └── spi_apb_dut.sv
├── tb/
│   ├── interfaces/
│   │   ├── apb_interface.sv
│   │   └── spi_interface.sv
│   ├── sequence_items/
│   │   ├── apb_sequence_item.sv
│   │   └── spi_sequence_item.sv
│   ├── sequences/
│   ├── drivers/
│   │   ├── apb_driver.sv
│   │   └── spi_driver.sv
│   ├── monitors/
│   ├── agents/
│   ├── env/
│   │   └── scoreboard.sv
│   ├── assertions/
│   ├── coverage/
│   └── tests/
└── sim/
    └── simulation_files
```

## ✅ Verification Summary

- Implemented an APB-based SPI protocol verification environment using SystemVerilog and UVM.
- Developed separate sequence item classes for APB and SPI transactions.
- Created dedicated APB and SPI interfaces.
- Implemented drivers for APB transactions and SPI-related stimulus.
- Developed scoreboard checks for APB write/read data and SPI MOSI/MISO data.
- Verified eight combinations of CPOL, CPHA, and MSBFE.
- Incorporated assertion-based checking and functional coverage into the verification approach.

## 🚀 Skills Demonstrated

- SystemVerilog testbench development
- UVM-based verification architecture
- Transaction-level stimulus generation
- APB and SPI protocol verification
- Driver and interface development
- Scoreboard-based data integrity checking
- Assertion-based verification
- Functional coverage and cross coverage
- Simulation debugging and verification analysis

## UVM Testbench Architecture

  <img width="1536" height="1024" alt="UVM APB-SPI Verification Architecture" src="https://github.com/user-attachments/assets/e4e9769a-82f9-462e-8b40-17d6f42e0a16" />


## 👨‍💻 Conclusion

This project demonstrates a structured approach to verifying an APB-controlled SPI peripheral using SystemVerilog and UVM. By combining transaction-based stimulus, protocol checking, scoreboard comparisons, assertions, and functional coverage, the environment supports systematic verification of SPI configuration modes and data-transfer behavior.

The project also demonstrates practical knowledge of reusable verification components and the principles of coverage-driven verification.

---

**Keywords:** `SystemVerilog` `UVM` `APB` `SPI` `SVA` `Functional Coverage` `Scoreboard` `Protocol Verification` `RTL Verification` `Verification Environment`
