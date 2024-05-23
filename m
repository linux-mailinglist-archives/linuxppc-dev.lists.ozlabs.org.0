Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id D690F8CD2E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 14:56:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IB1RXDJN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlSgh6m6Mz78xG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 22:50:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IB1RXDJN;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlSfx6ncTz3vgX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 22:49:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716468568;
	bh=YYQRQzaY+DyfQXSoe4ta0+Ysx0rHz9C5KsorM/pyHDc=;
	h=From:To:Cc:Subject:Date:From;
	b=IB1RXDJNbHmPilaJUm2xX1OU1aZsZZMEHVflP+gFxSKRa6+aU7ipDoCUvtOV8Hnh+
	 Mog6kc9Z+xyQhWzBxbEDXAEmDYCk/PTQ7WdNbELCWeheaYzIXbQy5h1FsJu74flyah
	 X/kmrYPRqlqWPORft+tDXdR7EoAhQDsiBDFGWjOMGuLKTLGzcflYzs46gP+tBBeO7Q
	 n63H6WvVg3VrlSuA2GB5RH/flgCVc/uMlmC4xJz4cYKWl8TlgOEoBqIlJfVkWgrRiC
	 Kw3TejhM0OZIq7NsT5WSCj9HuIQJrq7Nkl9um81c05fDE3s9VcQ/EQMlJQgSAJPyL8
	 ku0YDb8z9i2jA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VlSfw19k5z4wb2;
	Thu, 23 May 2024 22:49:28 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>
Subject: bnx2x: UBSAN: array-index-out-of-bounds in
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c
Date: Thu, 23 May 2024 22:49:27 +1000
Message-ID: <87pltc4rs8.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi folks,

I'm seeing an UBSAN warning when loading the bnx2x module on my Power8 machine:

  ------------[ cut here ]------------
  UBSAN: array-index-out-of-bounds in ../drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c:1529:11
  index 20 is out of range for type 'stats_query_entry [19]'
  CPU: 1 PID: 3870 Comm: NetworkManager Not tainted 6.9.0-dirty #17
  Hardware name: IBM,8408-E8E POWER8E (raw) 0x4b0201 0xf000004 of:IBM,FW860.B3 (SV860_245) hv:phyp pSeries
  Call Trace:
    dump_stack_lvl+0x80/0xe8 (unreliable)
    __ubsan_handle_out_of_bounds+0xc4/0x110
    bnx2x_stats_init+0x6f0/0x724 [bnx2x]
    bnx2x_post_irq_nic_init+0x2bc/0x51c [bnx2x]
    bnx2x_nic_load+0xd74/0x2de0 [bnx2x]
    bnx2x_open+0x194/0x310 [bnx2x]
    __dev_open+0x16c/0x22c
    __dev_change_flags+0x258/0x2f4
    dev_change_flags+0x3c/0x9c
    do_setlink+0x35c/0x13b4
    __rtnl_newlink+0x9b8/0xd88
    rtnl_newlink+0x70/0xac
    rtnetlink_rcv_msg+0x380/0x578
    netlink_rcv_skb+0x80/0x190
    rtnetlink_rcv+0x28/0x3c
    netlink_unicast+0x2bc/0x3d4
    netlink_sendmsg+0x21c/0x54c
    ____sys_sendmsg+0x28c/0x3c0
    ___sys_sendmsg+0xcc/0x128
    __sys_sendmsg+0x94/0xf4
    system_call_exception+0x174/0x320
    system_call_common+0x160/0x2c4

It seems there's some confusion about how many queues there should be, earlier the driver prints:
 
  [  480.692141] bnx2x 0010:01:00.0: set number of queues to 21

But the stats array only has space for 19?

Loading the driver with num_queues=18 avoids the warning.

This naive patch does fix it, but is probably just papering over the issue:

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
index e2a4e1088b7f..7fe3562fa8a9 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
@@ -1263,7 +1263,7 @@ enum {
 struct bnx2x_fw_stats_req {
 	struct stats_query_header hdr;
 	struct stats_query_entry query[FP_SB_MAX_E1x+
-		BNX2X_FIRST_QUEUE_QUERY_IDX];
+		BNX2X_FIRST_QUEUE_QUERY_IDX + 2];
 };
 
 struct bnx2x_fw_stats_data {


Full dmesg leading up to the UBSAN report below.

cheers


$ modprobe bnx2x
[  480.575366] bnx2x 0010:01:00.0: msix capability found
[  480.594616] bnx2x 0010:01:00.0: me reg PF num: 0
[  480.594747] bnx2x 0010:01:00.0: This is a physical function
[  480.594754] bnx2x 0010:01:00.0: Cnic support is on
[  480.594760] bnx2x 0010:01:00.0: Max num of status blocks 31
[  480.594766] bnx2x 0010:01:00.0: Allocated netdev with 91 tx and 31 rx queues
[  480.594781] bnx2x 0010:01:00.0: chip is in 2_PORT_MODE
[  480.594787] bnx2x 0010:01:00.0: pf_id: 0
[  480.594792] bnx2x 0010:01:00.0: chip ID is 0x168e1000
[  480.594802] bnx2x 0010:01:00.0: flash_size 0x200000 (2097152)
[  480.594815] bnx2x 0010:01:00.0: shmem offset 0x3c6c80  shmem2 offset 0x3c575c
[  480.594824] bnx2x 0010:01:00.0: hw_config 0x000f0001
[  480.594831] bnx2x 0010:01:00.0: bc_ver 70A04
[  480.594939] bnx2x 0010:01:00.0: not WoL capable
[  480.594948] bnx2x 0010:01:00.0: part number 0-0-0-0
[  480.594963] bnx2x 0010:01:00.0: IGU Normal Mode
[  480.595077] bnx2x 0010:01:00.0: igu_dsb_id 0  igu_base_sb 1  igu_sb_cnt 31
               base_fw_ndsb 1
[  480.595086] bnx2x 0010:01:00.0: shmem2base 0x3c575c, size 412, mfcfg offset 16
[  480.595096] bnx2x 0010:01:00.0: single function mode
[  480.595107] bnx2x 0010:01:00.0: lane_config 0x00000000  speed_cap_mask0 0x005c0000  link_config0 0x00000000
[  480.595118] bnx2x: [bnx2x_phy_probe:12595(eth%d)]Begin phy probe
[  480.595124] bnx2x: [bnx2x_phy_probe:12608(eth%d)]phy_config_swapped 0, phy_index 0, actual_phy_idx 0
[  480.595137] bnx2x: [bnx2x_populate_int_phy:12217(eth%d)]:chip_id = 0x168e1000
[  480.595147] bnx2x: [bnx2x_populate_int_phy:12335(eth%d)]Internal phy port=0, addr=0x1, mdio_ctl=0x8000
[  480.595162] bnx2x: [bnx2x_phy_def_cfg:12505(eth%d)]Default config phy idx 0 cfg 0x0 speed_cap_mask 0x5c0000
[  480.595171] bnx2x: [bnx2x_phy_probe:12608(eth%d)]phy_config_swapped 0, phy_index 1, actual_phy_idx 1
[  480.595184] bnx2x: [bnx2x_populate_ext_phy:12463(eth%d)]phy_type 0xd00 port 0 found in index 1
[  480.595192] bnx2x: [bnx2x_populate_ext_phy:12465(eth%d)]             addr=0x10, mdio_ctl=0x8000
[  480.595202] bnx2x: [bnx2x_phy_def_cfg:12505(eth%d)]Default config phy idx 1 cfg 0x0 speed_cap_mask 0x5c0000
[  480.595210] bnx2x: [bnx2x_phy_probe:12608(eth%d)]phy_config_swapped 0, phy_index 2, actual_phy_idx 2
[  480.595218] bnx2x: [bnx2x_phy_probe:12658(eth%d)]End phy probe. #phys found 2
[  480.595226] bnx2x 0010:01:00.0: phy_addr 0x1
[  480.595231] bnx2x 0010:01:00.0: supported 0x70ec 0x0
[  480.595237] bnx2x 0010:01:00.0: req_line_speed 0  req_duplex 1 req_flow_ctrl 0x0 advertising 0x70ec
[  480.595255] bnx2x 0010:01:00.0: max_iscsi_conn 0x0
[  480.595265] bnx2x 0010:01:00.0: max_fcoe_conn 0x0
[  480.595273] bnx2x 0010:01:00.0: msix_table_size 32
[  480.595278] bnx2x 0010:01:00.0: fp_array_size 31
[  480.595307] bnx2x 0010:01:00.0: txq_array_size 91
[  480.632980] bnx2x 0010:01:00.0: fw_seq 0x00000007
[  480.632994] bnx2x 0010:01:00.0: Entering Previous Unload Flow
[  480.633001] bnx2x 0010:01:00.0: No need to release hw/nvram locks
[  480.661401] bnx2x 0010:01:00.0: Common unload Flow
[  480.691399] bnx2x 0010:01:00.0: Finished Previous Unload Flow [0]
[  480.691420] bnx2x 0010:01:00.0: set bp->max_cos to 3
[  480.691426] bnx2x 0010:01:00.0: bp->min_msix_vec_cnt 3
[  480.692131] bnx2x 0010:01:00.0: qm_cid_count 3072
[  480.692141] bnx2x 0010:01:00.0: set number of queues to 21
[  480.692148] bnx2x 0010:01:00.0: msix_table[0].entry = 0 (slowpath)
[  480.692154] bnx2x 0010:01:00.0: msix_table[1].entry = 1 (CNIC)
[  480.692160] bnx2x 0010:01:00.0: msix_table[2].entry = 2 (fastpath #0)
[  480.692167] bnx2x 0010:01:00.0: msix_table[3].entry = 3 (fastpath #1)
[  480.692173] bnx2x 0010:01:00.0: msix_table[4].entry = 4 (fastpath #2)
[  480.692179] bnx2x 0010:01:00.0: msix_table[5].entry = 5 (fastpath #3)
[  480.692185] bnx2x 0010:01:00.0: msix_table[6].entry = 6 (fastpath #4)
[  480.692191] bnx2x 0010:01:00.0: msix_table[7].entry = 7 (fastpath #5)
[  480.692198] bnx2x 0010:01:00.0: msix_table[8].entry = 8 (fastpath #6)
[  480.692204] bnx2x 0010:01:00.0: msix_table[9].entry = 9 (fastpath #7)
[  480.692210] bnx2x 0010:01:00.0: msix_table[10].entry = 10 (fastpath #8)
[  480.692216] bnx2x 0010:01:00.0: msix_table[11].entry = 11 (fastpath #9)
[  480.692222] bnx2x 0010:01:00.0: msix_table[12].entry = 12 (fastpath #10)
[  480.692229] bnx2x 0010:01:00.0: msix_table[13].entry = 13 (fastpath #11)
[  480.692235] bnx2x 0010:01:00.0: msix_table[14].entry = 14 (fastpath #12)
[  480.692241] bnx2x 0010:01:00.0: msix_table[15].entry = 15 (fastpath #13)
[  480.692247] bnx2x 0010:01:00.0: msix_table[16].entry = 16 (fastpath #14)
[  480.692253] bnx2x 0010:01:00.0: msix_table[17].entry = 17 (fastpath #15)
[  480.692259] bnx2x 0010:01:00.0: msix_table[18].entry = 18 (fastpath #16)
[  480.692266] bnx2x 0010:01:00.0: msix_table[19].entry = 19 (fastpath #17)
[  480.692272] bnx2x 0010:01:00.0: msix_table[20].entry = 20 (fastpath #18)
[  480.692278] bnx2x 0010:01:00.0: msix_table[21].entry = 21 (fastpath #19)
[  480.700861] bnx2x 0010:01:00.0: set interrupts successfully
[  480.704240] bnx2x 0010:01:00.0: device name after netdev register eth0
[  480.704253] bnx2x 0010:01:00.0: QLogic BCM57810 10 Gigabit Ethernet (B0) PCI-E found at mem 3fc001800000, IRQ 18, node addr 00:0a:f7:73:c1:00
[  480.704768] bnx2x 0010:01:00.0: 32.000 Gb/s available PCIe bandwidth (5.0 GT/s PCIe x8 link)
[  480.704861] bnx2x 0010:01:00.1: msix capability found
[  480.708107] bnx2x 0010:01:00.0 enP16p1s0f0: renamed from eth0
[  480.724224] bnx2x 0010:01:00.1: me reg PF num: 1
[  480.724379] bnx2x 0010:01:00.1: This is a physical function
[  480.724389] bnx2x 0010:01:00.1: Cnic support is on
[  480.724396] bnx2x 0010:01:00.1: Max num of status blocks 31
[  480.724404] bnx2x 0010:01:00.1: Allocated netdev with 91 tx and 31 rx queues
[  480.724419] bnx2x 0010:01:00.1: chip is in 2_PORT_MODE
[  480.724426] bnx2x 0010:01:00.1: pf_id: 0
[  480.724433] bnx2x 0010:01:00.1: chip ID is 0x168e1000
[  480.724445] bnx2x 0010:01:00.1: flash_size 0x200000 (2097152)
[  480.724461] bnx2x 0010:01:00.1: shmem offset 0x3c7640  shmem2 offset 0x3c5918
[  480.724472] bnx2x 0010:01:00.1: hw_config 0x000f0001
[  480.724481] bnx2x 0010:01:00.1: bc_ver 70A04
[  480.724592] bnx2x: [bnx2x_get_load_status:4581(enP16p1s0f0)]GLOB_REG=0x00000000
[  480.724603] bnx2x: [bnx2x_get_load_status:4585(enP16p1s0f0)]load mask for engine 1 = 0x0
[  480.724614] bnx2x: [bnx2x_get_load_status:4581(enP16p1s0f0)]GLOB_REG=0x00000000
[  480.724622] bnx2x: [bnx2x_get_load_status:4585(enP16p1s0f0)]load mask for engine 0 = 0x0
[  480.724637] bnx2x: [bnx2x_nic_load:2631(enP16p1s0f0)]Starting NIC load
[  480.724645] bnx2x: [bnx2x_nic_load:2632(enP16p1s0f0)]CNIC is disabled
[  480.724652] bnx2x: [bnx2x_ilt_set_info:8658(enP16p1s0f0)]ilt client[CDU]: start 0, end 74, psz 0x8000, flags 0x2, hw psz 3
[  480.724664] bnx2x: [bnx2x_ilt_set_info:8679(enP16p1s0f0)]ilt client[QM]: start 75, end 122, psz 0x1000, flags 0x0, hw psz 0
[  480.724675] bnx2x: [bnx2x_ilt_set_info:8698(enP16p1s0f0)]ilt client[SRC]: start 123, end 138, psz 0x1000, flags 0x0, hw psz 0
[  480.724688] bnx2x: [bnx2x_ilt_set_info:8715(enP16p1s0f0)]ilt client[TM]: start 139, end 143, psz 0x1000, flags 0x0, hw psz 0
[  480.724700] bnx2x: [bnx2x_nic_load:2658(enP16p1s0f0)]num queues: 21
[  480.724706] bnx2x 0010:01:00.1: not WoL capable
[  480.724726] bnx2x 0010:01:00.1: part number 0-0-0-0
[  480.724768] bnx2x 0010:01:00.1: IGU Normal Mode
[  480.724939] bnx2x 0010:01:00.1: igu_dsb_id 0  igu_base_sb 1  igu_sb_cnt 31
               base_fw_ndsb 1
[  480.724972] bnx2x 0010:01:00.1: shmem2base 0x3c5918, size 412, mfcfg offset 16
[  480.725003] bnx2x 0010:01:00.1: single function mode
[  480.725032] bnx2x 0010:01:00.1: lane_config 0x00000000  speed_cap_mask0 0x005c0000  link_config0 0x00000000
[  480.725062] bnx2x: [bnx2x_phy_probe:12595(eth%d)]Begin phy probe
[  480.725089] bnx2x: [bnx2x_phy_probe:12608(eth%d)]phy_config_swapped 0, phy_index 0, actual_phy_idx 0
[  480.725125] bnx2x: [bnx2x_populate_int_phy:12217(eth%d)]:chip_id = 0x168e1000
[  480.725152] bnx2x: [bnx2x_populate_int_phy:12335(eth%d)]Internal phy port=0, addr=0x1, mdio_ctl=0x8000
[  480.725193] bnx2x: [bnx2x_phy_def_cfg:12505(eth%d)]Default config phy idx 0 cfg 0x0 speed_cap_mask 0x5c0000
[  480.725214] bnx2x: [bnx2x_phy_probe:12608(eth%d)]phy_config_swapped 0, phy_index 1, actual_phy_idx 1
[  480.725226] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 0 cos 0
[  480.725246] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 0 cos 1
[  480.725249] bnx2x: [bnx2x_populate_ext_phy:12463(eth%d)]phy_type 0xd00 port 0 found in index 1
[  480.725269] bnx2x: [bnx2x_populate_ext_phy:12465(eth%d)]             addr=0x11, mdio_ctl=0x8000
[  480.725270] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 0 cos 2
[  480.725305] bnx2x: [bnx2x_phy_def_cfg:12505(eth%d)]Default config phy idx 1 cfg 0x0 speed_cap_mask 0x5c0000
[  480.725342] bnx2x: [bnx2x_phy_probe:12608(eth%d)]phy_config_swapped 0, phy_index 2, actual_phy_idx 2
[  480.725357] bnx2x: [bnx2x_phy_probe:12658(eth%d)]End phy probe. #phys found 2
[  480.725374] bnx2x 0010:01:00.1: phy_addr 0x1
[  480.725385] bnx2x 0010:01:00.1: supported 0x70ec 0x0
[  480.725393] bnx2x 0010:01:00.1: req_line_speed 0  req_duplex 1 req_flow_ctrl 0x0 advertising 0x70ec
[  480.725414] bnx2x 0010:01:00.1: max_iscsi_conn 0x0
[  480.725426] bnx2x 0010:01:00.1: max_fcoe_conn 0x0
[  480.725434] bnx2x 0010:01:00.1: msix_table_size 32
[  480.725441] bnx2x 0010:01:00.1: fp_array_size 31
[  480.725472] bnx2x 0010:01:00.1: txq_array_size 91
[  480.725489] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 1 cos 0
[  480.725509] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 1 cos 1
[  480.725528] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 1 cos 2
[  480.725721] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 2 cos 0
[  480.725746] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 2 cos 1
[  480.725770] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 2 cos 2
[  480.725967] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 3 cos 0
[  480.725991] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 3 cos 1
[  480.726010] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 3 cos 2
[  480.726193] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 4 cos 0
[  480.726215] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 4 cos 1
[  480.726238] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 4 cos 2
[  480.726412] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 5 cos 0
[  480.726433] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 5 cos 1
[  480.726455] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 5 cos 2
[  480.726663] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 6 cos 0
[  480.726688] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 6 cos 1
[  480.726709] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 6 cos 2
[  480.726898] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 7 cos 0
[  480.726921] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 7 cos 1
[  480.726941] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 7 cos 2
[  480.727091] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 8 cos 0
[  480.727110] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 8 cos 1
[  480.727127] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 8 cos 2
[  480.727299] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 9 cos 0
[  480.727320] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 9 cos 1
[  480.727344] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 9 cos 2
[  480.727504] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 10 cos 0
[  480.727523] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 10 cos 1
[  480.727539] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 10 cos 2
[  480.727676] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 11 cos 0
[  480.727694] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 11 cos 1
[  480.727710] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 11 cos 2
[  480.727858] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 12 cos 0
[  480.727878] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 12 cos 1
[  480.727898] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 12 cos 2
[  480.728071] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 13 cos 0
[  480.728094] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 13 cos 1
[  480.728113] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 13 cos 2
[  480.728287] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 14 cos 0
[  480.728309] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 14 cos 1
[  480.728328] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 14 cos 2
[  480.728496] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 15 cos 0
[  480.728517] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 15 cos 1
[  480.728536] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 15 cos 2
[  480.728714] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 16 cos 0
[  480.728738] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 16 cos 1
[  480.728759] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 16 cos 2
[  480.728940] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 17 cos 0
[  480.728963] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 17 cos 1
[  480.728987] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 17 cos 2
[  480.729174] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 18 cos 0
[  480.729199] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 18 cos 1
[  480.729221] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 18 cos 2
[  480.729400] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 19 cos 0
[  480.729427] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 19 cos 1
[  480.729450] bnx2x: [bnx2x_alloc_fp_mem_at:4581(enP16p1s0f0)]allocating tx memory of fp 19 cos 2
[  480.731207] bnx2x: [bnx2x_set_real_num_queues:2017(enP16p1s0f0)]Setting real num queues to (tx, rx) (60, 20)
[  480.731222] bnx2x: [bnx2x_setup_tc:4289(enP16p1s0f0)]mapping priority 0 to tc 0
[  480.731231] bnx2x: [bnx2x_setup_tc:4289(enP16p1s0f0)]mapping priority 1 to tc 0
[  480.731240] bnx2x: [bnx2x_setup_tc:4289(enP16p1s0f0)]mapping priority 2 to tc 0
[  480.731248] bnx2x: [bnx2x_setup_tc:4289(enP16p1s0f0)]mapping priority 3 to tc 0
[  480.731256] bnx2x: [bnx2x_setup_tc:4289(enP16p1s0f0)]mapping priority 4 to tc 0
[  480.731264] bnx2x: [bnx2x_setup_tc:4289(enP16p1s0f0)]mapping priority 5 to tc 0
[  480.731275] bnx2x: [bnx2x_setup_tc:4289(enP16p1s0f0)]mapping priority 6 to tc 0
[  480.731283] bnx2x: [bnx2x_setup_tc:4289(enP16p1s0f0)]mapping priority 7 to tc 0
[  480.731291] bnx2x: [bnx2x_setup_tc:4309(enP16p1s0f0)]mapping tc 0 to offset 0 count 20
[  480.731300] bnx2x: [bnx2x_setup_tc:4309(enP16p1s0f0)]mapping tc 1 to offset 20 count 20
[  480.731310] bnx2x: [bnx2x_setup_tc:4309(enP16p1s0f0)]mapping tc 2 to offset 40 count 20
[  480.731341] bnx2x: [bnx2x_nic_load:2717(enP16p1s0f0)]napi added
[  480.731354] bnx2x: [bnx2x_set_pf_load:4512(enP16p1s0f0)]Old GEN_REG_VAL=0x00000000
[  480.731367] bnx2x 0010:01:00.0: fw_seq 0x00000009
[  480.731375] bnx2x 0010:01:00.0: drv_pulse 0x17d
[  480.766791] bnx2x 0010:01:00.1: fw_seq 0x00000007
[  480.766801] bnx2x 0010:01:00.1: Entering Previous Unload Flow
[  480.766808] bnx2x 0010:01:00.1: No need to release hw/nvram locks
[  480.791410] bnx2x 0010:01:00.1: Common unload Flow
[  480.821407] bnx2x 0010:01:00.1: Finished Previous Unload Flow [0]
[  480.821430] bnx2x 0010:01:00.1: set bp->max_cos to 3
[  480.821437] bnx2x 0010:01:00.1: bp->min_msix_vec_cnt 3
[  480.822071] bnx2x 0010:01:00.1: qm_cid_count 3072
[  480.822081] bnx2x 0010:01:00.1: set number of queues to 21
[  480.822087] bnx2x 0010:01:00.1: msix_table[0].entry = 0 (slowpath)
[  480.822093] bnx2x 0010:01:00.1: msix_table[1].entry = 1 (CNIC)
[  480.822100] bnx2x 0010:01:00.1: msix_table[2].entry = 2 (fastpath #0)
[  480.822106] bnx2x 0010:01:00.1: msix_table[3].entry = 3 (fastpath #1)
[  480.822113] bnx2x 0010:01:00.1: msix_table[4].entry = 4 (fastpath #2)
[  480.822119] bnx2x 0010:01:00.1: msix_table[5].entry = 5 (fastpath #3)
[  480.822125] bnx2x 0010:01:00.1: msix_table[6].entry = 6 (fastpath #4)
[  480.822131] bnx2x 0010:01:00.1: msix_table[7].entry = 7 (fastpath #5)
[  480.822137] bnx2x 0010:01:00.1: msix_table[8].entry = 8 (fastpath #6)
[  480.822143] bnx2x 0010:01:00.1: msix_table[9].entry = 9 (fastpath #7)
[  480.822149] bnx2x 0010:01:00.1: msix_table[10].entry = 10 (fastpath #8)
[  480.822156] bnx2x 0010:01:00.1: msix_table[11].entry = 11 (fastpath #9)
[  480.822162] bnx2x 0010:01:00.1: msix_table[12].entry = 12 (fastpath #10)
[  480.822168] bnx2x 0010:01:00.1: msix_table[13].entry = 13 (fastpath #11)
[  480.822174] bnx2x 0010:01:00.1: msix_table[14].entry = 14 (fastpath #12)
[  480.822180] bnx2x 0010:01:00.1: msix_table[15].entry = 15 (fastpath #13)
[  480.822187] bnx2x 0010:01:00.1: msix_table[16].entry = 16 (fastpath #14)
[  480.822193] bnx2x 0010:01:00.1: msix_table[17].entry = 17 (fastpath #15)
[  480.822199] bnx2x 0010:01:00.1: msix_table[18].entry = 18 (fastpath #16)
[  480.822205] bnx2x 0010:01:00.1: msix_table[19].entry = 19 (fastpath #17)
[  480.822211] bnx2x 0010:01:00.1: msix_table[20].entry = 20 (fastpath #18)
[  480.822217] bnx2x 0010:01:00.1: msix_table[21].entry = 21 (fastpath #19)
[  480.831471] bnx2x 0010:01:00.1: set interrupts successfully
[  480.871402] bnx2x: [bnx2x_nic_load_pmf:2445(enP16p1s0f0)]pmf 1
[  480.871446] bnx2x 0010:01:00.0: Loading bnx2x/bnx2x-e2-7.13.21.0.fw
[  481.412444] bnx2x: [bnx2x_init_hw_func:8010(enP16p1s0f0)]NIC MODE configured
[  481.458818] bnx2x: [bnx2x_phy_probe:12595(enP16p1s0f0)]Begin phy probe
[  481.458832] bnx2x: [bnx2x_phy_probe:12608(enP16p1s0f0)]phy_config_swapped 0, phy_index 0, actual_phy_idx 0
[  481.458844] bnx2x: [bnx2x_populate_int_phy:12217(enP16p1s0f0)]:chip_id = 0x168e1000
[  481.458854] bnx2x: [bnx2x_populate_int_phy:12335(enP16p1s0f0)]Internal phy port=0, addr=0x1, mdio_ctl=0x8000
[  481.458869] bnx2x: [bnx2x_phy_def_cfg:12505(enP16p1s0f0)]Default config phy idx 0 cfg 0x0 speed_cap_mask 0x5c0000
[  481.458877] bnx2x: [bnx2x_phy_probe:12608(enP16p1s0f0)]phy_config_swapped 0, phy_index 1, actual_phy_idx 1
[  481.458891] bnx2x: [bnx2x_populate_ext_phy:12463(enP16p1s0f0)]phy_type 0xd00 port 0 found in index 1
[  481.458899] bnx2x: [bnx2x_populate_ext_phy:12465(enP16p1s0f0)]             addr=0x10, mdio_ctl=0x8000
[  481.458909] bnx2x: [bnx2x_phy_def_cfg:12505(enP16p1s0f0)]Default config phy idx 1 cfg 0x0 speed_cap_mask 0x5c0000
[  481.458917] bnx2x: [bnx2x_phy_probe:12608(enP16p1s0f0)]phy_config_swapped 0, phy_index 2, actual_phy_idx 2
[  481.458926] bnx2x: [bnx2x_phy_probe:12658(enP16p1s0f0)]End phy probe. #phys found 2
[  481.458943] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 0, txq 0
[  481.458950] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 20, txq 20
[  481.458957] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 40, txq 40
[  481.458973] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 2
[  481.458983] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[0]:  bnx2x_init_sb(00000000ee7290d5,000000003df6b04d)  cl_id 2  fw_sb 2  igu_sb 2
[  481.458995] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 1, txq 1
[  481.459002] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 21, txq 21
[  481.459009] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 41, txq 41
[  481.459022] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 3
[  481.459030] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[1]:  bnx2x_init_sb(00000000ee7290d5,00000000dabca996)  cl_id 3  fw_sb 3  igu_sb 3
[  481.459040] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 2, txq 2
[  481.459047] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 22, txq 22
[  481.459054] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 42, txq 42
[  481.459067] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 4
[  481.459075] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[2]:  bnx2x_init_sb(00000000ee7290d5,0000000019ec8b36)  cl_id 4  fw_sb 4  igu_sb 4
[  481.459085] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 3, txq 3
[  481.459092] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 23, txq 23
[  481.459098] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 43, txq 43
[  481.459111] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 5
[  481.459120] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[3]:  bnx2x_init_sb(00000000ee7290d5,000000007b88f1d8)  cl_id 5  fw_sb 5  igu_sb 5
[  481.459130] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 4, txq 4
[  481.459136] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 24, txq 24
[  481.459143] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 44, txq 44
[  481.459156] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 6
[  481.459164] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[4]:  bnx2x_init_sb(00000000ee7290d5,00000000b0b1373f)  cl_id 6  fw_sb 6  igu_sb 6
[  481.459174] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 5, txq 5
[  481.459180] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 25, txq 25
[  481.459187] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 45, txq 45
[  481.459200] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 7
[  481.459208] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[5]:  bnx2x_init_sb(00000000ee7290d5,00000000e4e707c3)  cl_id 7  fw_sb 7  igu_sb 7
[  481.459218] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 6, txq 6
[  481.459225] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 26, txq 26
[  481.459231] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 46, txq 46
[  481.459244] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 8
[  481.459252] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[6]:  bnx2x_init_sb(00000000ee7290d5,000000009a9c8fce)  cl_id 8  fw_sb 8  igu_sb 8
[  481.459262] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 7, txq 7
[  481.459269] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 27, txq 27
[  481.459276] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 47, txq 47
[  481.459288] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 9
[  481.459297] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[7]:  bnx2x_init_sb(00000000ee7290d5,0000000014c7da0e)  cl_id 9  fw_sb 9  igu_sb 9
[  481.459307] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 8, txq 8
[  481.459313] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 28, txq 28
[  481.459320] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 48, txq 48
[  481.459333] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 10
[  481.459341] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[8]:  bnx2x_init_sb(00000000ee7290d5,00000000d73bba50)  cl_id 10  fw_sb 10  igu_sb 10
[  481.459351] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 9, txq 9
[  481.459358] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 29, txq 29
[  481.459364] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 49, txq 49
[  481.459377] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 11
[  481.459386] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[9]:  bnx2x_init_sb(00000000ee7290d5,00000000b847ea06)  cl_id 11  fw_sb 11  igu_sb 11
[  481.459396] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 10, txq 10
[  481.459403] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 30, txq 30
[  481.459409] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 50, txq 50
[  481.459422] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 12
[  481.459430] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[10]:  bnx2x_init_sb(00000000ee7290d5,00000000196303a5)  cl_id 12  fw_sb 12  igu_sb 12
[  481.459440] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 11, txq 11
[  481.459447] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 31, txq 31
[  481.459453] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 51, txq 51
[  481.459466] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 13
[  481.459474] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[11]:  bnx2x_init_sb(00000000ee7290d5,0000000066bd5df6)  cl_id 13  fw_sb 13  igu_sb 13
[  481.459484] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 12, txq 12
[  481.459491] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 32, txq 32
[  481.459497] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 52, txq 52
[  481.459510] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 14
[  481.459518] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[12]:  bnx2x_init_sb(00000000ee7290d5,00000000cf0dcd91)  cl_id 14  fw_sb 14  igu_sb 14
[  481.459528] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 13, txq 13
[  481.459535] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 33, txq 33
[  481.459541] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 53, txq 53
[  481.459554] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 15
[  481.459562] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[13]:  bnx2x_init_sb(00000000ee7290d5,0000000036d63708)  cl_id 15  fw_sb 15  igu_sb 15
[  481.459572] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 14, txq 14
[  481.459579] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 34, txq 34
[  481.459585] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 54, txq 54
[  481.459598] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 16
[  481.459606] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[14]:  bnx2x_init_sb(00000000ee7290d5,0000000078b37957)  cl_id 16  fw_sb 16  igu_sb 16
[  481.459616] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 15, txq 15
[  481.459623] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 35, txq 35
[  481.459629] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 55, txq 55
[  481.459642] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 17
[  481.459650] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[15]:  bnx2x_init_sb(00000000ee7290d5,00000000f04248ff)  cl_id 17  fw_sb 17  igu_sb 17
[  481.459660] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 16, txq 16
[  481.459667] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 36, txq 36
[  481.459674] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 56, txq 56
[  481.459686] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 18
[  481.459695] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[16]:  bnx2x_init_sb(00000000ee7290d5,00000000a20333ee)  cl_id 18  fw_sb 18  igu_sb 18
[  481.459705] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 17, txq 17
[  481.459711] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 37, txq 37
[  481.459718] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 57, txq 57
[  481.459730] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 19
[  481.459739] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[17]:  bnx2x_init_sb(00000000ee7290d5,00000000d5c15823)  cl_id 19  fw_sb 19  igu_sb 19
[  481.459749] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 18, txq 18
[  481.459755] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 38, txq 38
[  481.459762] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 58, txq 58
[  481.459775] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 20
[  481.459783] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[18]:  bnx2x_init_sb(00000000ee7290d5,000000001b9fe542)  cl_id 20  fw_sb 20  igu_sb 20
[  481.459793] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 19, txq 19
[  481.459800] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 39, txq 39
[  481.459806] bnx2x: [bnx2x_init_txdata:1172(enP16p1s0f0)]created tx data cid 59, txq 59
[  481.459819] bnx2x: [bnx2x_init_sb:6013(enP16p1s0f0)]Init FW SB 21
[  481.459827] bnx2x: [bnx2x_init_eth_fp:6411(enP16p1s0f0)]queue[19]:  bnx2x_init_sb(00000000ee7290d5,000000007f29c48b)  cl_id 21  fw_sb 21  igu_sb 21
[  481.459837] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.459929] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.460025] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.460124] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.460218] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.460311] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.460411] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.460505] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.460598] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.460697] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.460792] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.460885] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.460984] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.461078] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.461171] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.461270] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.461363] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.461532] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.461650] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.461744] bnx2x: [bnx2x_init_rx_rings:1421(enP16p1s0f0)]mtu 1500  rx_buf_size 2048
[  481.461859] bnx2x: [bnx2x_get_mod_abs_int_cfg:4351(enP16p1s0f0)]No cfg pin 0 for module detect indication
[  481.464004] bnx2x 0010:01:00.0 enP16p1s0f0: using MSI-X  IRQs: sp 69  fp[0] 73 ... fp[19] 111
[  481.464352] bnx2x: [bnx2x_cmng_fns_init:2601(enP16p1s0f0)]rate shaping and fairness are disabled
[  481.464373] ------------[ cut here ]------------
[  481.464378] UBSAN: array-index-out-of-bounds in ../drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c:1529:11
[  481.464387] index 20 is out of range for type 'stats_query_entry [19]'
[  481.464395] CPU: 1 PID: 3870 Comm: NetworkManager Not tainted 6.9.0-dirty #17
[  481.464403] Hardware name: IBM,8408-E8E POWER8E (raw) 0x4b0201 0xf000004 of:IBM,FW860.B3 (SV860_245) hv:phyp pSeries
[  481.464412] Call Trace:
[  481.464416] [c000001fc4462d30] [c000000001441188] dump_stack_lvl+0x80/0xe8 (unreliable)
[  481.464432] [c000001fc4462d60] [c000000000c1a678] __ubsan_handle_out_of_bounds+0xc4/0x110
[  481.464447] [c000001fc4462e10] [c008000025dafcb4] bnx2x_stats_init+0x6f0/0x724 [bnx2x]
[  481.464547] [c000001fc4462eb0] [c008000025d4e72c] bnx2x_post_irq_nic_init+0x2bc/0x51c [bnx2x]
[  481.464641] [c000001fc4462f50] [c008000025d9a7b8] bnx2x_nic_load+0xd74/0x2de0 [bnx2x]
[  481.464736] [c000001fc44630e0] [c008000025d4cb20] bnx2x_open+0x194/0x310 [bnx2x]
[  481.464828] [c000001fc4463170] [c00000000116e2b8] __dev_open+0x16c/0x22c
[  481.464840] [c000001fc4463210] [c00000000116e9ac] __dev_change_flags+0x258/0x2f4
[  481.464852] [c000001fc44632c0] [c00000000116ea84] dev_change_flags+0x3c/0x9c
[  481.464863] [c000001fc4463300] [c000000001187cc4] do_setlink+0x35c/0x13b4
[  481.464873] [c000001fc44634a0] [c00000000118fb88] __rtnl_newlink+0x9b8/0xd88
[  481.464885] [c000001fc4463630] [c00000000118ffc8] rtnl_newlink+0x70/0xac
[  481.464895] [c000001fc4463670] [c000000001185e60] rtnetlink_rcv_msg+0x380/0x578
[  481.464906] [c000001fc4463720] [c000000001217be4] netlink_rcv_skb+0x80/0x190
[  481.464918] [c000001fc44637f0] [c00000000118321c] rtnetlink_rcv+0x28/0x3c
[  481.464928] [c000001fc4463810] [c000000001216ef8] netlink_unicast+0x2bc/0x3d4
[  481.464940] [c000001fc4463880] [c00000000121722c] netlink_sendmsg+0x21c/0x54c
[  481.464951] [c000001fc4463970] [c00000000112461c] ____sys_sendmsg+0x28c/0x3c0
[  481.464963] [c000001fc4463a00] [c00000000112763c] ___sys_sendmsg+0xcc/0x128
[  481.464972] [c000001fc4463b70] [c000000001127d98] __sys_sendmsg+0x94/0xf4
[  481.464980] [c000001fc4463c30] [c000000000030304] system_call_exception+0x174/0x320
[  481.464992] [c000001fc4463e50] [c00000000000d520] system_call_common+0x160/0x2c4
[  481.465003] --- interrupt: c00 at 0x7ffcfe5b6504
[  481.465011] NIP:  00007ffcfe5b6504 LR: 00007ffcfe5b64dc CTR: 0000000000000000
[  481.465017] REGS: c000001fc4463e80 TRAP: 0c00   Not tainted  (6.9.0-dirty)
[  481.465025] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 22084440  XER: 00000000
[  481.465049] IRQMASK: 0 
               GPR00: 0000000000000155 00007ffff91154a0 00007ffcfe6b6f00 000000000000000d 
               GPR04: 00007ffff9115510 0000000000000000 0000000000000020 00007ffcfcbfe800 
               GPR08: 00007ffcfcbf7148 0000000000000000 0000000000000000 0000000000000000 
               GPR12: 0000000000000000 00007ffcfcbfe800 00007ffcfe8f06b4 0000000000000000 
               GPR16: 00007ffff9115e90 00000001717e2748 000001002bce10e0 000001002bd96850 
               GPR20: 000001002bcc647c 00000001717416f8 0000000000000000 00007ffff911576c 
               GPR24: 00007ffff9115778 0000000000000000 0000000000000000 0000000000000000 
               GPR28: 0000000000000000 00007ffff9115510 0000000000000000 000000000000000d 
[  481.465135] NIP [00007ffcfe5b6504] 0x7ffcfe5b6504
[  481.465141] LR [00007ffcfe5b64dc] 0x7ffcfe5b64dc
[  481.465147] --- interrupt: c00
[  481.465151] ---[ end trace ]---
[  481.467183] bnx2x: [bnx2x_igu_int_enable:1666(enP16p1s0f0)]write 0xb to IGU  mode MSI-X
[  481.467254] bnx2x: [bnx2x_eq_int:5592(enP16p1s0f0)]got FUNC_START ramrod
