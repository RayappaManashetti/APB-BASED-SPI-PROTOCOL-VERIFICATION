APB BASED SPI PROTOCOL VERIFICATION USING UVM TESTBENCH



\# APB-Based SPI Controller Verification Using UVM



\## Overview



This project focuses on the functional verification of an APB-Based SPI Controller using the Universal Verification Methodology (UVM). The SPI Controller acts as an APB slave and provides serial communication capabilities through the SPI protocol.



The verification environment is designed to ensure compliance with APB protocol specifications, SPI protocol functionality, register access mechanisms, error handling, and corner-case scenarios.



\---



\## Project Objectives



\- Verify APB read and write transactions.

\- Verify SPI data transmission and reception.

\- Validate SPI Master functionality.

\- Verify clock polarity (CPOL) and clock phase (CPHA) modes.

\- Verify interrupt generation.

\- Achieve high functional coverage.

\- Develop reusable and scalable UVM components.



\---



\## DUT Architecture



\### APB Interface



The DUT acts as an APB slave and receives configuration commands from the APB master.



Supported APB Signals:



| Signal | Description |

|----------|------------|

| PCLK | APB Clock |

| PRESETn | Active Low Reset |

| PSEL | Slave Select |

| PENABLE | Enable Signal |

| PWRITE | Read/Write Control |

| PADDR | Address Bus |

| PWDATA | Write Data |

| PRDATA | Read Data |

| PREADY | Transfer Completion |

| PSLVERR | Error Indication |



\---



\### SPI Interface



Supported SPI Signals:



| Signal | Description |

|----------|------------|

| SCLK | Serial Clock |

| MOSI | Master Out Slave In |

| MISO | Master In Slave Out |

| CS\_N | Chip Select |



Supported SPI Modes:



\- Mode 0 (CPOL=0, CPHA=0)

\- Mode 1 (CPOL=0, CPHA=1)

\- Mode 2 (CPOL=1, CPHA=0)

\- Mode 3 (CPOL=1, CPHA=1)



\---





