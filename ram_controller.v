// ram_controller.v
// A synchronous, single-port Block RAM (BRAM) controller with an array of 16x8-bit memory slots.

module ram_controller (
    input        clk,        // System Clock
    input        rst_n,      // Active-low asynchronous reset
    input        we,         // Write Enable control (1 = Write, 0 = Read)
    input  [3:0] addr,       // 4-bit Address bus (accesses 16 unique slots)
    input  [7:0] din,        // 8-bit Data Input bus (data to save)
    output reg [7:0] dout    // 8-bit Data Output bus (data retrieved)
);

    // Declare the internal memory array: 16 depth x 8-bit width
    reg [7:0] ram_memory [15:0];
    integer i;

    // Synchronous Memory Operations Block
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Clear out data output line
            dout <= 8'd0;
            // Optional: Initialize all memory slots to zero upon master reset
            for (i = 0; i < 16; i = i + 1) begin
                ram_memory[i] <= 8'd0;
            end
        end else begin
            if (we) begin
                // Write Phase: Store incoming data into designated address slot
                ram_memory[addr] <= din;
            end else begin
                // Read Phase: Fetch stored data from designated address slot
                dout <= ram_memory[addr];
            end
        end
    end

endmodule
