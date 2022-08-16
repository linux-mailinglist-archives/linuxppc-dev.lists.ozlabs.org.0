Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627E45948F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 02:10:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6BPH10cyz3c7C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 10:10:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BzPf/Tmv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BzPf/Tmv;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6BNc6Rghz2xGy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 10:09:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1BFB1B81252
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 00:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1458C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 00:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660608588;
	bh=CaWjnLss1Fz3rJvFObwFezJWdn/5OWjKYmc0PRQ7DI4=;
	h=From:To:Subject:Date:From;
	b=BzPf/Tmvy4VOPZbrm9bcKPo+yQ6ZkJ1foIH8tq4CNKA+atcAjbUY4wNmmIcV7qgGC
	 //uvnerl6YSD9wbpL4wE0jiK2FqBKvpdLut93QikxdxAMcv7VDrUjczAbF+qNj+0ME
	 iRp0RUodL5x/29DtKRjx9Qmik7f8+KtDfM9eqB7CjKWv1p8jaGXESm+FCWGYXoWvlJ
	 dACtJtazarlMQbbXTPiSveemVfmEta5tpxxcXnRUnLCEzkCTV9lbTLN7SAp40iYwxo
	 FltNYGYtx6eLi38pZpnXcLyAzkXrxGsqKwjQGvRETSawkBElJznvzDsKq6Pbguxp+w
	 ebqNI+MasunIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9D11FC433E4; Tue, 16 Aug 2022 00:09:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216368] New: do_IRQ: stack overflow at boot on a PowerMac G5
 11,2
Date: Tue, 16 Aug 2022 00:09:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216368-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216368

            Bug ID: 216368
           Summary: do_IRQ: stack overflow at boot on a PowerMac G5 11,2
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 6.0-rc1
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 301578
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301578&action=3Dedit
dmesg (kernel 6.0-rc1, PowerMac G5 11,2)

Happens sometimes at boot on my G5 on v6.0-rc1:

[...]
do_IRQ: stack overflow: 3072
CPU: 0 PID: 294 Comm: Xvnc Tainted: G                T  6.0.0-rc1-PMacG5 #1
Call Trace:
[c00000000fff7e80] [c0000000006d0200] .dump_stack_lvl+0x7c/0xc4 (unreliable)
[c00000000fff7f10] [c0000000000107f4] .__do_irq+0x114/0x120
[c00000000fff7f90] [c0000000000111a8] .__do_IRQ+0x78/0xd0
[c000000019da4c00] [0000000003684000] 0x3684000
[c000000019da4c90] [c0000000000112c4] .do_IRQ+0xc4/0x1d0
[c000000019da4d10] [c000000000008018]
hardware_interrupt_common_virt+0x208/0x210
--- interrupt: 500 at .ppc_iommu_map_sg+0x220/0x520
NIP:  c000000000034200 LR: c0000000000341e0 CTR: 0000000000000000
REGS: c000000019da4d80 TRAP: 0500   Tainted: G                T=20=20
(6.0.0-rc1-PMacG5)
MSR:  900000000200b032 <SF,HV,VEC,EE,FP,ME,IR,DR,RI>  CR: 24224242  XER:
20000000
IRQMASK: 0=20
GPR00: c0000000000341e0 c000000019da5020 c0000000013df100 0000000000000000=
=20
GPR04: 0000000000000000 0000000000000001 0000000000000001 0000000000000000=
=20
GPR08: 0000000000000000 0000000000000000 c0000000193c6200 c000000000cb1168=
=20
GPR12: 0000000044224242 c0000000014ae000 c000000020249000 0000000000000001=
=20
GPR16: 0000000000000001 c000000020249000 ffffffffffffffff 0000000000000100=
=20
GPR20: 0000000000000002 c00000000190c0d0 0000000000000001 0000000003684000=
=20
GPR24: 0000000000001000 c000000020249000 000000000000000c 0000000000000001=
=20
GPR28: 0000000000001000 c000000001435500 0000000003684000 c000000020249020=
=20
NIP [c000000000034200] .ppc_iommu_map_sg+0x220/0x520
LR [c0000000000341e0] .ppc_iommu_map_sg+0x200/0x520
--- interrupt: 500
[c000000019da5140] [c00000000003316c] .dma_iommu_map_sg+0x4c/0x60
[c000000019da51b0] [c000000000123f68] .__dma_map_sg_attrs+0x108/0x1a0
[c000000019da5240] [c00000000012405c] .dma_map_sgtable+0x2c/0x60
[c000000019da52c0] [c0000000007ffeb4] .nvme_prep_rq.part.0+0xe4/0xc70
[c000000019da53c0] [c000000000800acc] .nvme_queue_rq+0x8c/0x2d0
[c000000019da5470] [c0000000005dc600] .blk_mq_dispatch_rq_list+0x250/0xb30
[c000000019da55b0] [c0000000005e5070] .blk_mq_do_dispatch_sched+0x430/0x4d0
[c000000019da56d0] [c0000000005e5520]
.__blk_mq_sched_dispatch_requests+0x150/0x1d0
[c000000019da5780] [c0000000005e5630] .blk_mq_sched_dispatch_requests+0x40/=
0x90
[c000000019da5800] [c0000000005d94a8] .__blk_mq_run_hw_queue+0xc8/0x100
[c000000019da5880] [c0000000005e5a98] .blk_mq_sched_insert_requests+0xb8/0x=
290
[c000000019da5930] [c0000000005dd594] .blk_mq_flush_plug_list+0x1d4/0x3b0
[c000000019da5a10] [c0000000005dd858] .blk_add_rq_to_plug+0xe8/0x160
[c000000019da5a90] [c0000000005dde00] .blk_mq_submit_bio+0x270/0x650
[c000000019da5b90] [c0000000005ca0c4] .__submit_bio+0x174/0x2d0
[c000000019da5c30] [c0000000005ca940] .submit_bio_noacct_nocheck+0x2b0/0x330
[c000000019da5cf0] [c0000000004d66b4] .btrfs_submit_bio+0x274/0x5c0
[c000000019da5e00] [c000000000481f44] .btrfs_submit_metadata_bio+0x54/0x110
[c000000019da5e80] [c0000000004bd828] .submit_one_bio+0xb8/0x130
[c000000019da5f00] [c0000000004c84b0] .read_extent_buffer_pages+0x310/0x750
[c000000019da6020] [c000000000481b48] .btrfs_read_extent_buffer+0xd8/0x1b0
[c000000019da60f0] [c00000000048208c] .read_tree_block+0x5c/0x130
[c000000019da6190] [c0000000004609a8] .read_block_for_search+0x2c8/0x410
[c000000019da62b0] [c000000000466a30] .btrfs_search_slot+0x380/0xcf0
[c000000019da6400] [c00000000047adf4] .btrfs_lookup_csum+0x64/0x1d0
[c000000019da64d0] [c00000000047b754] .btrfs_lookup_bio_sums+0x274/0x6e0
[c000000019da6630] [c000000000505d18] .btrfs_submit_compressed_read+0x3b8/0=
x520
[c000000019da6720] [c0000000004954b4] .btrfs_submit_data_read_bio+0xc4/0xe0
[c000000019da67b0] [c0000000004bd7fc] .submit_one_bio+0x8c/0x130
[c000000019da6830] [c0000000004c4478] .submit_extent_page+0x548/0x590
[c000000019da6980] [c0000000004c4f80] .btrfs_do_readpage+0x330/0x970
[c000000019da6ad0] [c0000000004c67f4] .extent_readahead+0x2b4/0x430
[c000000019da6c70] [c000000000490440] .btrfs_readahead+0x10/0x30
[c000000019da6ce0] [c0000000002219bc] .read_pages+0x8c/0x360
[c000000019da6db0] [c000000000221e0c] .page_cache_ra_unbounded+0x17c/0x230
[c000000019da6e90] [c000000000214cb0] .filemap_fault+0x630/0xa90
[c000000019da6fa0] [c000000000258078] .__do_fault+0x58/0x110
[c000000019da7020] [c00000000025f030] .__handle_mm_fault+0xe40/0x14e0
[c000000019da7180] [c00000000025f7e0] .handle_mm_fault+0x110/0x330
[c000000019da7230] [c00000000003dd20] .___do_page_fault+0x1c0/0x950
[c000000019da72e0] [c00000000003e590] .hash__do_page_fault+0x20/0xb0
[c000000019da7360] [c000000000044a38] .do_hash_fault+0x248/0x300
[c000000019da73e0] [c000000000007894] data_access_common_virt+0x194/0x1f0
--- interrupt: 300 at .__arch_clear_user+0x20/0x150
NIP:  c0000000000517d0 LR: c0000000003893bc CTR: 0000000000000000
REGS: c000000019da7450 TRAP: 0300   Tainted: G                T=20=20
(6.0.0-rc1-PMacG5)
MSR:  900000000200b032 <SF,HV,VEC,EE,FP,ME,IR,DR,RI>  CR: 4402444b  XER:
20000000
DAR: 000000011236a5b5 DSISR: 42000000 IRQMASK: 0=20
GPR00: 0000000000000000 c000000019da76f0 c0000000013df100 000000011236a5b5=
=20
GPR04: 0000000000000a4b c000000000cd7178 0000000000000003 0000000000000000=
=20
GPR08: 000000011236a5b5 0000000000000000 00003ffffffff000 00000000000000e8=
=20
GPR12: 0000000024024440 c0000000014ae000 c000000019a7bfc0 0000000000000008=
=20
GPR16: 00000000fffff000 000000011236a5b5 00000000003c7470 c000000019a7fa00=
=20
GPR20: 000000011233e498 c000000019f42940 0000000000000000 c000000019a7be00=
=20
GPR24: 000000000038a5b5 0000000111fe0000 c000000019a7c400 0000000112326867=
=20
GPR28: 0000000111fe0000 000000000035ac30 0000000111fe0040 c0000000013e89f0=
=20
NIP [c0000000000517d0] .__arch_clear_user+0x20/0x150
LR [c0000000003893bc] .padzero+0x6c/0x140
--- interrupt: 300
[c000000019da76f0] [c000000000388244] .set_brk+0x64/0x90 (unreliable)
[c000000019da7770] [c000000000389edc] .load_elf_binary+0x8dc/0x1c00
[c000000019da78c0] [c000000000308ee8] .bprm_execve+0x298/0x6f0
[c000000019da79a0] [c000000000309520] .do_execveat_common.isra.0+0x1e0/0x310
[c000000019da7a70] [c00000000030a7ac] .__se_sys_execve+0x3c/0x50
[c000000019da7ae0] [c000000000022660] .system_call_exception+0x160/0x290
[c000000019da7e10] [c00000000000b33c] system_call_common+0xec/0x250
--- interrupt: c00 at 0x3fff904d8ccc
NIP:  00003fff904d8ccc LR: 00003fff904d9668 CTR: 0000000000000000
REGS: c000000019da7e80 TRAP: 0c00   Tainted: G                T=20=20
(6.0.0-rc1-PMacG5)
MSR:  900000000200f032 <SF,HV,VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002220  XER:
00000000
IRQMASK: 0=20
GPR00: 000000000000000b 00003fffff2f01f0 00003fff90617200 00003fffff2f1cb8=
=20
GPR04: 000000013bac0b00 00003fffff2f0cd8 fefefefefefefeff 7f7f7f7f7f7f7f7f=
=20
GPR08: 00003fffff2f1cb8 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00003fff90806860 00000001301c8c50 000000010dd637b0=
=20
GPR16: 0000000129bcedc8 000000013edfaac0 0000000000000000 00003ffff0a28d60=
=20
GPR20: 000000000000002f 0000000000000000 00003fffb2027c70 00003fff90861000=
=20
GPR24: 000000013babfee8 000000013bac0b00 000000013bac0b00 00003fffff2f0cd8=
=20
GPR28: 0000000000000001 000000013babfae0 00003fffff2f1cb8 0000000000000000=
=20
NIP [00003fff904d8ccc] 0x3fff904d8ccc
LR [00003fff904d9668] 0x3fff904d9668


The machine stays usable though.

Some data about the machine:
 # inxi -bZ
System:
  Host: T800 Kernel: 6.0.0-rc1-PMacG5 arch: ppc64 bits: 64 Console: pty pts=
/0
    Distro: Gentoo Base System release 2.8
Machine:
  Type: PPC System: PowerMac11 2 details: N/A
    mobo: PowerMac11,2 MacRISC4 Power Macintosh  serial: R6V
CPU:
  Info: dual core PPC970MP altivec supported [MCP] speed (MHz): avg: 1150
    min/max: 1150/2300
Graphics:
  Device-1: NVIDIA NV43 [GeForce 6600 LE] driver: nouveau v: kernel
  Device-2: AMD RV516 [Radeon X1300/X1550 Series] driver: N/A
  Display: x11 server: X.Org v: 21.1.1 driver: X: loaded: nouveau
    unloaded: fbdev,modesetting gpu: nouveau resolution: 1400x900~60Hz
  OpenGL: renderer: llvmpipe (LLVM 14.0.6 128 bits) v: 4.5 Mesa 22.0.5
Network:
  Device-1: Broadcom NetXtreme BCM5780 Gigabit Ethernet driver: tg3
  Device-2: Broadcom NetXtreme BCM5780 Gigabit Ethernet driver: tg3
  Device-3: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet
    driver: r8169

 # lspci=20
0000:00:0b.0 PCI bridge: Apple Inc. CPC945 PCIe Bridge
0000:0a:00.0 VGA compatible controller: NVIDIA Corporation NV43 [GeForce 66=
00
LE] (rev a2)
0001:00:00.0 Host bridge: Apple Inc. U4 HT Bridge
0001:00:01.0 PCI bridge: Broadcom BCM5780 [HT2000] PCI-X bridge (rev a3)
0001:00:02.0 PCI bridge: Broadcom BCM5780 [HT2000] PCI-X bridge (rev a3)
0001:00:03.0 PCI bridge: Broadcom BCM5780 [HT2000] PCI-Express Bridge (rev =
a3)
0001:00:04.0 PCI bridge: Broadcom BCM5780 [HT2000] PCI-Express Bridge (rev =
a3)
0001:00:05.0 PCI bridge: Broadcom BCM5780 [HT2000] PCI-Express Bridge (rev =
a3)
0001:00:06.0 PCI bridge: Broadcom BCM5780 [HT2000] PCI-Express Bridge (rev =
a3)
0001:00:07.0 PCI bridge: Apple Inc. Shasta PCI Bridge
0001:00:08.0 PCI bridge: Apple Inc. Shasta PCI Bridge
0001:00:09.0 PCI bridge: Apple Inc. Shasta PCI Bridge
0001:01:07.0 Unassigned class [ff00]: Apple Inc. Shasta Mac I/O
0001:01:0b.0 USB controller: NEC Corporation OHCI USB Controller (rev 43)
0001:01:0b.1 USB controller: NEC Corporation OHCI USB Controller (rev 43)
0001:01:0b.2 USB controller: NEC Corporation uPD72010x USB 2.0 Controller (=
rev
04)
0001:03:0c.0 IDE interface: Broadcom K2 SATA
0001:03:0d.0 Unassigned class [ff00]: Apple Inc. Shasta IDE
0001:03:0e.0 FireWire (IEEE 1394): Apple Inc. Shasta Firewire
0001:05:04.0 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme
BCM5780 Gigabit Ethernet (rev 03)
0001:05:04.1 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme
BCM5780 Gigabit Ethernet (rev 03)
0001:06:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/A=
TI]
RV516 [Radeon X1300/X1550 Series]
0001:06:00.1 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] RV5=
16
[Radeon X1300/X1550 Series] (Secondary)
0001:08:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 06)
0001:09:00.0 Non-Volatile memory controller: Sandisk Corp WD Black SN750 / =
PC
SN730 NVMe SSD

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
