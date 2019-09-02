-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity backward_lite_AXILiteS_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 6;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    -- axi4 lite slave signals
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    -- user signals
    bias                  :in   STD_LOGIC_VECTOR(31 downto 0);
    bias_ap_vld           :in   STD_LOGIC;
    w1                    :in   STD_LOGIC_VECTOR(31 downto 0);
    w1_ap_vld             :in   STD_LOGIC;
    w2                    :in   STD_LOGIC_VECTOR(31 downto 0);
    w2_ap_vld             :in   STD_LOGIC;
    w3                    :in   STD_LOGIC_VECTOR(31 downto 0);
    w3_ap_vld             :in   STD_LOGIC;
    w4                    :in   STD_LOGIC_VECTOR(31 downto 0);
    w4_ap_vld             :in   STD_LOGIC;
    w5                    :in   STD_LOGIC_VECTOR(31 downto 0);
    w5_ap_vld             :in   STD_LOGIC
);
end entity backward_lite_AXILiteS_s_axi;

-- ------------------------Address Info-------------------
-- 0x00 : reserved
-- 0x04 : reserved
-- 0x08 : reserved
-- 0x0c : reserved
-- 0x10 : Data signal of bias
--        bit 31~0 - bias[31:0] (Read)
-- 0x14 : Control signal of bias
--        bit 0  - bias_ap_vld (Read/COR)
--        others - reserved
-- 0x18 : Data signal of w1
--        bit 31~0 - w1[31:0] (Read)
-- 0x1c : Control signal of w1
--        bit 0  - w1_ap_vld (Read/COR)
--        others - reserved
-- 0x20 : Data signal of w2
--        bit 31~0 - w2[31:0] (Read)
-- 0x24 : Control signal of w2
--        bit 0  - w2_ap_vld (Read/COR)
--        others - reserved
-- 0x28 : Data signal of w3
--        bit 31~0 - w3[31:0] (Read)
-- 0x2c : Control signal of w3
--        bit 0  - w3_ap_vld (Read/COR)
--        others - reserved
-- 0x30 : Data signal of w4
--        bit 31~0 - w4[31:0] (Read)
-- 0x34 : Control signal of w4
--        bit 0  - w4_ap_vld (Read/COR)
--        others - reserved
-- 0x38 : Data signal of w5
--        bit 31~0 - w5[31:0] (Read)
-- 0x3c : Control signal of w5
--        bit 0  - w5_ap_vld (Read/COR)
--        others - reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of backward_lite_AXILiteS_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_BIAS_DATA_0 : INTEGER := 16#10#;
    constant ADDR_BIAS_CTRL   : INTEGER := 16#14#;
    constant ADDR_W1_DATA_0   : INTEGER := 16#18#;
    constant ADDR_W1_CTRL     : INTEGER := 16#1c#;
    constant ADDR_W2_DATA_0   : INTEGER := 16#20#;
    constant ADDR_W2_CTRL     : INTEGER := 16#24#;
    constant ADDR_W3_DATA_0   : INTEGER := 16#28#;
    constant ADDR_W3_CTRL     : INTEGER := 16#2c#;
    constant ADDR_W4_DATA_0   : INTEGER := 16#30#;
    constant ADDR_W4_CTRL     : INTEGER := 16#34#;
    constant ADDR_W5_DATA_0   : INTEGER := 16#38#;
    constant ADDR_W5_CTRL     : INTEGER := 16#3c#;
    constant ADDR_BITS         : INTEGER := 6;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(31 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(31 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_bias            : UNSIGNED(31 downto 0) := (others => '0');
    signal int_bias_ap_vld     : STD_LOGIC;
    signal int_w1              : UNSIGNED(31 downto 0) := (others => '0');
    signal int_w1_ap_vld       : STD_LOGIC;
    signal int_w2              : UNSIGNED(31 downto 0) := (others => '0');
    signal int_w2_ap_vld       : STD_LOGIC;
    signal int_w3              : UNSIGNED(31 downto 0) := (others => '0');
    signal int_w3_ap_vld       : STD_LOGIC;
    signal int_w4              : UNSIGNED(31 downto 0) := (others => '0');
    signal int_w4_ap_vld       : STD_LOGIC;
    signal int_w5              : UNSIGNED(31 downto 0) := (others => '0');
    signal int_w5_ap_vld       : STD_LOGIC;


begin
-- ----------------------- Instantiation------------------

-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    case (TO_INTEGER(raddr)) is
                    when ADDR_BIAS_DATA_0 =>
                        rdata_data <= RESIZE(int_bias(31 downto 0), 32);
                    when ADDR_BIAS_CTRL =>
                        rdata_data <= (0 => int_bias_ap_vld, others => '0');
                    when ADDR_W1_DATA_0 =>
                        rdata_data <= RESIZE(int_w1(31 downto 0), 32);
                    when ADDR_W1_CTRL =>
                        rdata_data <= (0 => int_w1_ap_vld, others => '0');
                    when ADDR_W2_DATA_0 =>
                        rdata_data <= RESIZE(int_w2(31 downto 0), 32);
                    when ADDR_W2_CTRL =>
                        rdata_data <= (0 => int_w2_ap_vld, others => '0');
                    when ADDR_W3_DATA_0 =>
                        rdata_data <= RESIZE(int_w3(31 downto 0), 32);
                    when ADDR_W3_CTRL =>
                        rdata_data <= (0 => int_w3_ap_vld, others => '0');
                    when ADDR_W4_DATA_0 =>
                        rdata_data <= RESIZE(int_w4(31 downto 0), 32);
                    when ADDR_W4_CTRL =>
                        rdata_data <= (0 => int_w4_ap_vld, others => '0');
                    when ADDR_W5_DATA_0 =>
                        rdata_data <= RESIZE(int_w5(31 downto 0), 32);
                    when ADDR_W5_CTRL =>
                        rdata_data <= (0 => int_w5_ap_vld, others => '0');
                    when others =>
                        rdata_data <= (others => '0');
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_bias <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (bias_ap_vld = '1') then
                    int_bias <= UNSIGNED(bias); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_bias_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (bias_ap_vld = '1') then
                    int_bias_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_BIAS_CTRL) then
                    int_bias_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_w1 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w1_ap_vld = '1') then
                    int_w1 <= UNSIGNED(w1); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_w1_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (w1_ap_vld = '1') then
                    int_w1_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_W1_CTRL) then
                    int_w1_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_w2 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w2_ap_vld = '1') then
                    int_w2 <= UNSIGNED(w2); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_w2_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (w2_ap_vld = '1') then
                    int_w2_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_W2_CTRL) then
                    int_w2_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_w3 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w3_ap_vld = '1') then
                    int_w3 <= UNSIGNED(w3); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_w3_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (w3_ap_vld = '1') then
                    int_w3_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_W3_CTRL) then
                    int_w3_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_w4 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w4_ap_vld = '1') then
                    int_w4 <= UNSIGNED(w4); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_w4_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (w4_ap_vld = '1') then
                    int_w4_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_W4_CTRL) then
                    int_w4_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_w5 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w5_ap_vld = '1') then
                    int_w5 <= UNSIGNED(w5); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_w5_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (w5_ap_vld = '1') then
                    int_w5_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_W5_CTRL) then
                    int_w5_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
