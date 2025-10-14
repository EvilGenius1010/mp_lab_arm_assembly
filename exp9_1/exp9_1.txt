#include <lpc21xx.h>

void delay(void);

int main(void)
{
    unsigned long int c = 0xFF0000;

    // Set P0.16 to P0.23 as output
    IODIR0 = c;

    // Set peripheral clock to CCLK/2
    VPBDIV = 0x02;

    // Timer0 configuration
    T0MCR = (1 << 0) | (1 << 1);  // Interrupt and reset on MR0
    T0MR0 = 1000000;              // Match value
    T0PR = 29;                    // Prescaler

    while (1)
    {
        IOSET0 = c;   // Turn ON LEDs
        delay();
        c -= 0x10000; // Shift LED pattern
        IOCLR0 = 0xFF0000; // Turn OFF LEDs
    }
}

void delay(void)
{
    T0TCR = 0x01; // Start Timer0

    while (!(T0IR & 0x01)); // Wait for MR0 match interrupt

    T0IR = 0x01;  // Clear interrupt flag
    T0TCR = 0x02; // Reset Timer0
}
