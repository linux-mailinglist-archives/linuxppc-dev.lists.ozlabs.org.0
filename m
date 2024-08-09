Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E6A94D85E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 23:16:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=WdMGwUxS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgcDG3lPyz300C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2024 07:16:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=WdMGwUxS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgcCS08kJz2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2024 07:16:03 +1000 (AEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4WgcC12WjSz9ssb;
	Fri,  9 Aug 2024 23:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1723238141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=YLJ24l/ddx46UV4mM0bxYlgHqJt2Z81D7JLbdeVXiig=;
	b=WdMGwUxS65iVngD74tVNyWvs0w0kOZ7vjWHMCFhkZUhlm53zrmC5hwmlcWktYOwUEP+5DN
	0zN1KP7l0lSd8QoBmkpHxWFSL9dOdtTkDqsjKddWGkO7WTODavdG//3xbaiaBujcLif7Zf
	jsMxfVd45VGM1S3sDYSCEjqkmiUnzM7TW/K/2QIrDCoM1yBtWTH8n8DarfmOPz1NFVD6+h
	XXyfKbF/dDRBT3bDnSIjS1eyWGXuzCod3jy1U9Ip6i87a+pYawdntZc7tPNhI9uj/tJUsX
	wcNNKM5qR/iuXXPkAMwUVHdBAce1SxVAuP+M7ILUQPm/PJbLAHzNAokpQhD3Xw==
Date: Fri, 9 Aug 2024 23:15:37 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: linux-mm@kvack.org
Subject: OVERFLOW_KUNIT_TEST fails with BUG: KASAN: stack-out-of-bounds in
 string_nocheck+0x168/0x1c8 (kernel 6.11-rc2, PowerMac G4 DP)
Message-ID: <20240809231537.7c9ee7ea@yea>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/_xpNTj4Ql8TXPxg/k=dTREm"
X-MBO-RS-META: tdrmoifisftr7ztfduku7msca9e4rxam
X-MBO-RS-ID: a684588197f5e4eaa8e
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--MP_/_xpNTj4Ql8TXPxg/k=dTREm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Greetings!

When KASAN is enabled the Overflow KUnit test fails:

[...]
    ok 16 shift_nonsense_test
    # overflow_allocation_test: 11 allocation overflow tests finished
==================================================================
BUG: KASAN: stack-out-of-bounds in string_nocheck+0x168/0x1c8
Read of size 1 at addr c976be40 by task kunit_try_catch/1843

CPU: 0 UID: 0 PID: 1843 Comm: kunit_try_catch Tainted: G                 N 6.11.0-rc2-PMacG4 #1
Tainted: [N]=TEST
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[c992fb80] [c16651c0] dump_stack_lvl+0x80/0xac (unreliable)
[c992fba0] [c04e0420] print_report+0xdc/0x504
[c992fc00] [c04e01d8] kasan_report+0xf8/0x108
[c992fc80] [c16ae4c8] string_nocheck+0x168/0x1c8
[c992fcf0] [c16b37a4] string+0xa8/0xbc
[c992fd60] [c16b8134] vsnprintf+0x868/0x1750
[c992fdf0] [c0b8490c] kvasprintf+0xa4/0x13c
[c992fe60] [c0b84c3c] kasprintf+0xb4/0xc8
[c992fed0] [c0f4c954] module_remove_driver+0x1f0/0x2fc
[c992ff00] [c0f21628] bus_remove_driver+0x1d0/0x240
[c992ff30] [bfd0cd40] kunit_put_resource+0x128/0x134 [kunit]
[c992ff50] [bfd0a120] kunit_cleanup+0x140/0x144 [kunit]
[c992ff90] [bfd10d64] kunit_generic_run_threadfn_adapter+0xf8/0x148 [kunit]
[c992ffc0] [c00f57e0] kthread+0x36c/0x37c
[c992fff0] [c0028304] start_kernel_thread+0x10/0x14

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:00000000 index:0x0 pfn:0x976b
flags: 0x0(zone=0)
raw: 00000000 00000000 eef2bb10 00000000 00000000 00000000 ffffffff 00000000
raw: 00000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 c976bd00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 c976bd80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>c976be00: 00 00 00 00 00 00 00 00 f1 f1 f1 f1 04 f2 04 f2
                                   ^
 c976be80: 00 04 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
 c976bf00: 00 00 f1 f1 f1 f1 00 f3 f3 f3 00 00 00 00 00 00
==================================================================
Disabling lock debugging due to kernel taint
    not ok 17 overflow_allocation_test
    # overflow_size_helpers_test: 43 overflow size helper tests finished
    ok 18 overflow_size_helpers_test
    # overflows_type_test: 378 overflows_type() tests finished
    ok 19 overflows_type_test
    # same_type_test: 0 __same_type() tests finished
    ok 20 same_type_test
    # castable_to_type_test: 75 castable_to_type() tests finished
    ok 21 castable_to_type_test
    ok 22 DEFINE_FLEX_test
# overflow: pass:21 fail:1 skip:0 total:22
# Totals: pass:21 fail:1 skip:0 total:22
not ok 1 overflow


This is reproducible on my machine and always happens when running the test via 'modprobe -v overflow_kunit'. Without KASAN enabled (but KFENCE) overflow_allocation_test passes.

Kernel .config and full dmesg attached.

Regards,
Erhard

--MP_/_xpNTj4Ql8TXPxg/k=dTREm
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=dmesg_611-rc2_g4.txt

[    0.000000] Total memory = 2048MB; using 4096kB for hash table
[    0.000000] Activating Kernel Userspace Access Protection
[    0.000000] Activating Kernel Userspace Execution Prevention
[    0.000000] Linux version 6.11.0-rc2-PMacG4 (root@T1000) (gcc (Gentoo 14.2.0 p4) 14.2.0, GNU ld (Gentoo 2.42 p3) 2.42.0) #1 SMP Fri Aug  9 14:46:18 CEST 2024
[    0.000000] KASAN init done
[    0.000000] ioremap() called early from pmac_feature_init+0x11b4/0x1210. Use early_ioremap() instead
[    0.000000] Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 0x24
[    0.000000] Mapped at 0xf53bf000
[    0.000000] ioremap() called early from probe_one_macio+0x1b0/0x6e8. Use early_ioremap() instead
[    0.000000] Found a Keylargo mac-io controller, rev: 3, mapped at 0x(ptrval)
[    0.000000] PowerMac motherboard: PowerMac G4 Windtunnel
[    0.000000] ioremap() called early from btext_map+0x5c/0x7c. Use early_ioremap() instead
[    0.000000] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[    0.000000] printk: legacy bootconsole [udbg0] enabled
[    0.000000] CPU maps initialized for 1 thread per core
[    0.000000]  (thread shift is 0)
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x80000000
[    0.000000] dcache_bsize      = 0x20
[    0.000000] icache_bsize      = 0x20
[    0.000000] cpu_features      = 0x000000002514600a
[    0.000000]   possible        = 0x00000000277de00a
[    0.000000]   always          = 0x0000000001000000
[    0.000000] cpu_user_features = 0x9c000001 0x00000000
[    0.000000] mmu_features      = 0x00010201
[    0.000000] Hash_size         = 0x400000
[    0.000000] Hash_mask         = 0xffff
[    0.000000] -----------------------------------------------------
[    0.000000] ioremap() called early from pmac_setup_arch+0x1e8/0x6c0. Use early_ioremap() instead
[    0.000000] ioremap() called early from find_via_pmu+0x4c8/0x5b8. Use early_ioremap() instead
[    0.000000] ioremap() called early from find_via_pmu+0x1b0/0x5b8. Use early_ioremap() instead
[    0.000000] via-pmu: Server Mode is disabled
[    0.000000] PMU driver v2 initialized for Core99, firmware: 0c
[    0.000000] ioremap() called early from pmac_nvram_init+0x48c/0xeb0. Use early_ioremap() instead
[    0.000000] nvram: Checking bank 0...
[    0.000000] nvram: gen0=3441, gen1=3442
[    0.000000] nvram: Active bank is: 1
[    0.000000] nvram: OF partition at 0x410
[    0.000000] nvram: XP partition at 0x1020
[    0.000000] nvram: NR partition at 0x1120
[    0.000000] Top of RAM: 0x80000000, Total RAM: 0x80000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
[    0.000000]   Normal   empty
[    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000] percpu: Embedded 14 pages/cpu s28600 r8192 d20552 u57344
[    0.000000] pcpu-alloc: s28600 r8192 d20552 u57344 alloc=14*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 
[    0.000000] Kernel command line: ro root=/dev/sda5 slub_debug=FZ page_poison=1 debug_pagealloc=on netconsole=6666@192.168.2.8/eth0,6666@192.168.2.3/A8:A1:59:16:4F:EA debug 
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 524288
[    0.000000] mem auto-init: stack:all(pattern), heap alloc:off, heap free:off
[    0.000000] stackdepot: allocating hash table via alloc_large_system_hash
[    0.000000] stackdepot hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xf6000000..0xfec00000  : kasan shadow mem
[    0.000000]   * 0xf5bbf000..0xf5fff000  : fixmap
[    0.000000]   * 0xf5400000..0xf5800000  : highmem PTEs
[    0.000000]   * 0xf529b000..0xf5400000  : early ioremap
[    0.000000]   * 0xf1000000..0xf5298000  : vmalloc & ioremap
[    0.000000]   * 0xb0000000..0xc0000000  : modules
[    0.000000] **********************************************************
[    0.000000] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.000000] **                                                      **
[    0.000000] ** This system shows unhashed kernel memory addresses   **
[    0.000000] ** via the console, logs, and other interfaces. This    **
[    0.000000] ** might reduce the security of your system.            **
[    0.000000] **                                                      **
[    0.000000] ** If you see this message and you are not debugging    **
[    0.000000] ** the kernel, report this immediately to your system   **
[    0.000000] ** administrator!                                       **
[    0.000000] **                                                      **
[    0.000000] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.000000] **********************************************************
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.000000] RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=1.
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] mpic: Resetting
[    0.000000] mpic: Setting up MPIC " MPIC 1   " version 1.2 at 80040000, max 2 CPUs
[    0.000000] mpic: ISU size: 64, shift: 6, mask: 3f
[    0.000000] mpic: Initializing for 64 sources
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] time_init: decrementer frequency = 41.658676 MHz
[    0.000000] time_init: processor frequency   = 1416.666661 MHz
[    0.000010] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x99b9699db, max_idle_ns: 440795204297 ns
[    0.000520] clocksource: timebase mult[18012db2] shift[24] registered
[    0.000836] clockevent: decrementer mult[aaa249b] shift[32] cpu[0]
[    0.002809] Console: colour dummy device 80x25
[    0.003097] printk: legacy console [tty0] enabled
[    0.003375] printk: legacy bootconsole [udbg0] disabled
[    0.004916] pid_max: default: 4096 minimum: 301
[    0.010243] LSM: initializing lsm=capability,yama
[    0.010339] Yama: becoming mindful.
[    0.012122] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.012291] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.025756] PowerMac SMP probe found 2 cpus
[    0.026466] KeyWest i2c @0xf8001003 irq 42 /uni-n@f8000000/i2c@f8001000
[    0.026578]  channel 0 bus <multibus>
[    0.026630]  channel 1 bus <multibus>
[    0.026931] KeyWest i2c @0x80018000 irq 26 /pci@f2000000/mac-io@17/i2c@18000
[    0.027027]  channel 0 bus <multibus>
[    0.027152] PMU i2c /pci@f2000000/mac-io@17/via-pmu@16000/pmu-i2c
[    0.027237]  channel 1 bus <multibus>
[    0.027285]  channel 2 bus <multibus>
[    0.027349] pmf: no parser for command 17 !
[    0.027489] Processor timebase sync using GPIO 0x73
[    0.027525] mpic: requesting IPIs...
[    0.028189] CPU0: L2CR is 80000000
[    0.028235] CPU0: L3CR is 9c030000
[    0.034951] MPC7450 family performance monitor hardware support registered
[    0.035694] rcu: Hierarchical SRCU implementation.
[    0.035757] rcu: 	Max phase no-delay instances is 1000.
[    0.037706] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
[    0.039837] smp: Bringing up secondary CPUs ...
[84919682.552480] CPU1: L2CR was 0
[84919682.552586] CPU1: L2CR set to 80000000
[84919682.552603] CPU1: L3CR was 0
[84919682.552756] CPU1: L3CR set to 9c030000
[    0.046269] smp: Brought up 1 node, 2 CPUs
[    0.048485] Memory: 1930408K/2097152K available (23376K kernel code, 2032K rwdata, 5296K rodata, 1624K init, 408K bss, 163736K reserved, 0K cma-reserved, 1212416K highmem)
[    0.052177] devtmpfs: initialized
[    0.054833] Duplicate name in PowerPC,G4@0, renamed to "l2-cache#1"
[    0.055295] Duplicate name in l2-cache#1, renamed to "l2-cache#1"
[    0.056802] Duplicate name in PowerPC,G4@1, renamed to "l2-cache#1"
[    0.057347] Duplicate name in l2-cache#1, renamed to "l2-cache#1"
[    0.075516] Duplicate name in gpio@50, renamed to "gpio5@6f#1"
[    0.075862] Duplicate name in gpio@50, renamed to "gpio6@70#1"
[    0.076474] Duplicate name in gpio@50, renamed to "gpio11@75#1"
[    0.076840] Duplicate name in gpio@50, renamed to "extint-gpio15@67#1"
[    0.104607] Found UniNorth PCI host bridge at 0x00000000f0000000. Firmware bus number: 0->0
[    0.104734] PCI host bridge /pci@f0000000  ranges:
[    0.104833]  MEM 0x00000000f1000000..0x00000000f1ffffff -> 0x00000000f1000000 
[    0.104907]   IO 0x00000000f0000000..0x00000000f07fffff -> 0x0000000000000000
[    0.121122]  MEM 0x0000000090000000..0x00000000afffffff -> 0x0000000090000000 
[    0.121485] Found UniNorth PCI host bridge at 0x00000000f2000000. Firmware bus number: 0->0
[    0.121549] PCI host bridge /pci@f2000000 (primary) ranges:
[    0.121640]  MEM 0x00000000f3000000..0x00000000f3ffffff -> 0x00000000f3000000 
[    0.121712]   IO 0x00000000f2000000..0x00000000f27fffff -> 0x0000000000000000
[    0.137553]  MEM 0x0000000080000000..0x000000008fffffff -> 0x0000000080000000 
[    0.137860] Found UniNorth PCI host bridge at 0x00000000f4000000. Firmware bus number: 0->0
[    0.137923] PCI host bridge /pci@f4000000  ranges:
[    0.138013]  MEM 0x00000000f5000000..0x00000000f5ffffff -> 0x00000000f5000000 
[    0.138074]   IO 0x00000000f4000000..0x00000000f47fffff -> 0x0000000000000000
[    0.154979] Found NEC PD720100A USB2 chip with disabled EHCI, fixing up...
[    0.156669] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.156919] futex hash table entries: 16 (order: -3, 512 bytes, linear)
[    0.164948] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.187415] PCI: Probing PCI hardware
[    0.188888] PCI host bridge to bus 0000:00
[    0.188979] pci_bus 0000:00: root bus resource [io  0xff780000-0xfff7ffff] (bus address [0x0000-0x7fffff])
[    0.189058] pci_bus 0000:00: root bus resource [mem 0xf1000000-0xf1ffffff]
[    0.189117] pci_bus 0000:00: root bus resource [mem 0x90000000-0xafffffff]
[    0.189185] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.189238] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.191102] pci 0000:00:0b.0: [106b:0034] type 00 class 0x060000 conventional PCI endpoint
[    0.193395] pci 0000:00:10.0: [1002:4150] type 00 class 0x030000 conventional PCI endpoint
[    0.193509] pci 0000:00:10.0: BAR 0 [mem 0xa0000000-0xafffffff pref]
[    0.193574] pci 0000:00:10.0: BAR 1 [io  0xff780400-0xff7804ff]
[    0.193631] pci 0000:00:10.0: BAR 2 [mem 0x90000000-0x9000ffff]
[    0.193710] pci 0000:00:10.0: ROM [mem 0x90020000-0x9003ffff pref]
[    0.193832] pci 0000:00:10.0: supports D1 D2
[    0.196179] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
[    0.198731] OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not find phandle 1751474532
[    0.198915] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio15@67: could not find phandle 1751474532
[    0.199099] OF: /pci@f2000000/mac-io@17/gpio@50/gpio6@70: could not find phandle 1634562093
[    0.199258] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio16@68: could not find phandle 1936745825
[    0.199441] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio14@66: could not find phandle 1818848869
[    0.199617] OF: /pci@f2000000/mac-io@17/gpio@50/gpio12@76: could not find phandle 1835103092
[    0.199766] OF: /pci@f2000000/mac-io@17/gpio@50/gpio11@75: could not find phandle 1635083369
[    0.199905] OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not find phandle 1751474532
[    0.200045] OF: /pci@f2000000/mac-io@17/gpio@50/gpio6@70: could not find phandle 1634562093
[    0.200184] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio4@5c: could not find phandle 1818848869
[    0.200359] OF: /pci@f2000000/mac-io@17/gpio@50/gpio11@75: could not find phandle 1635083369
[    0.200504] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio15@67: could not find phandle 1751474532
[    0.203509] pci_bus 0001:00: Fixed dependency cycle(s) with /pci@f2000000/mac-io@17/interrupt-controller@40000
[    0.203767] PCI host bridge to bus 0001:00
[    0.203823] pci_bus 0001:00: root bus resource [io  0x0000-0x7fffff]
[    0.203885] pci_bus 0001:00: root bus resource [mem 0xf3000000-0xf3ffffff]
[    0.203943] pci_bus 0001:00: root bus resource [mem 0x80000000-0x8fffffff]
[    0.204006] pci_bus 0001:00: root bus resource [bus 00-ff]
[    0.204058] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to ff
[    0.205346] pci 0001:00:0b.0: [106b:0035] type 00 class 0x060000 conventional PCI endpoint
[    0.206895] pci 0001:00:12.0: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.206999] pci 0001:00:12.0: BAR 0 [mem 0x8008c000-0x8008cfff]
[    0.207149] pci 0001:00:12.0: supports D1 D2
[    0.207193] pci 0001:00:12.0: PME# supported from D0 D1 D2 D3hot
[    0.208692] pci 0001:00:12.1: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.208794] pci 0001:00:12.1: BAR 0 [mem 0x8008b000-0x8008bfff]
[    0.208945] pci 0001:00:12.1: supports D1 D2
[    0.208988] pci 0001:00:12.1: PME# supported from D0 D1 D2 D3hot
[    0.210500] pci 0001:00:12.2: [1033:00e0] type 00 class 0x0c0320 conventional PCI endpoint
[    0.210600] pci 0001:00:12.2: BAR 0 [mem 0x80081000-0x800810ff]
[    0.210749] pci 0001:00:12.2: supports D1 D2
[    0.210793] pci 0001:00:12.2: PME# supported from D0 D1 D2 D3hot
[    0.212209] pci 0001:00:13.0: [1095:3112] type 00 class 0x018000 conventional PCI endpoint
[    0.212309] pci 0001:00:13.0: BAR 0 [io  0x0460-0x0467]
[    0.212367] pci 0001:00:13.0: BAR 1 [io  0x0450-0x0453]
[    0.212420] pci 0001:00:13.0: BAR 2 [io  0x0440-0x0447]
[    0.212472] pci 0001:00:13.0: BAR 3 [io  0x0430-0x0433]
[    0.212525] pci 0001:00:13.0: BAR 4 [io  0x0420-0x042f]
[    0.212577] pci 0001:00:13.0: BAR 5 [mem 0x80082000-0x800821ff]
[    0.212633] pci 0001:00:13.0: ROM [mem 0x80100000-0x8017ffff pref]
[    0.212742] pci 0001:00:13.0: supports D1 D2
[    0.213782] pci 0001:00:15.0: [9710:9865] type 00 class 0x070002 conventional PCI endpoint
[    0.213883] pci 0001:00:15.0: BAR 0 [io  0x0410-0x0417]
[    0.213941] pci 0001:00:15.0: BAR 1 [mem 0x8008a000-0x8008afff]
[    0.214009] pci 0001:00:15.0: BAR 4 [mem 0x80089000-0x80089fff]
[    0.214132] pci 0001:00:15.0: supports D1 D2
[    0.214175] pci 0001:00:15.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.215735] pci 0001:00:15.1: [9710:9865] type 00 class 0x070002 conventional PCI endpoint
[    0.215838] pci 0001:00:15.1: BAR 0 [io  0x0400-0x0407]
[    0.215898] pci 0001:00:15.1: BAR 1 [mem 0x80088000-0x80088fff]
[    0.215967] pci 0001:00:15.1: BAR 4 [mem 0x80087000-0x80087fff]
[    0.216091] pci 0001:00:15.1: supports D1 D2
[    0.216134] pci 0001:00:15.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.217118] pci 0001:00:15.2: [ffff:9865] type 00 class 0x070103 conventional PCI endpoint
[    0.217214] pci 0001:00:15.2: BAR 0 [io  0x0000-0x0007]
[    0.217271] pci 0001:00:15.2: BAR 1 [io  0x0000-0x0007]
[    0.217324] pci 0001:00:15.2: BAR 2 [mem 0x00000000-0x00000fff]
[    0.217384] pci 0001:00:15.2: BAR 4 [mem 0x00000000-0x00000fff]
[    0.217504] pci 0001:00:15.2: supports D1 D2
[    0.217546] pci 0001:00:15.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.219378] pci 0001:00:16.0: [14e4:4320] type 00 class 0x028000 conventional PCI endpoint
[    0.219481] pci 0001:00:16.0: BAR 0 [mem 0x8008e000-0x8008ffff]
[    0.219633] pci 0001:00:16.0: supports D1 D2
[    0.219676] pci 0001:00:16.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.220550] pci 0001:00:17.0: [106b:0022] type 00 class 0xff0000 conventional PCI endpoint
[    0.220645] pci 0001:00:17.0: BAR 0 [mem 0x80000000-0x8007ffff]
[    0.222355] pci 0001:00:18.0: [106b:0019] type 00 class 0x0c0310 conventional PCI endpoint
[    0.222460] pci 0001:00:18.0: BAR 0 [mem 0x80086000-0x80086fff]
[    0.223344] pci 0001:00:19.0: [106b:0019] type 00 class 0x0c0310 conventional PCI endpoint
[    0.223439] pci 0001:00:19.0: BAR 0 [mem 0x80085000-0x80085fff]
[    0.224966] pci 0001:00:1b.0: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.225070] pci 0001:00:1b.0: BAR 0 [mem 0x80084000-0x80084fff]
[    0.225221] pci 0001:00:1b.0: supports D1 D2
[    0.225264] pci 0001:00:1b.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.226902] pci 0001:00:1b.1: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.227005] pci 0001:00:1b.1: BAR 0 [mem 0x80083000-0x80083fff]
[    0.227154] pci 0001:00:1b.1: supports D1 D2
[    0.227197] pci 0001:00:1b.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.228616] pci 0001:00:1b.2: [1033:00e0] type 00 class 0x0c0320 conventional PCI endpoint
[    0.228717] pci 0001:00:1b.2: BAR 0 [mem 0x80080000-0x800800ff]
[    0.228867] pci 0001:00:1b.2: supports D1 D2
[    0.228910] pci 0001:00:1b.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.230109] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to 00
[    0.235266] PCI host bridge to bus 0002:00
[    0.235362] pci_bus 0002:00: root bus resource [io  0x880000-0x107ffff] (bus address [0x0000-0x7fffff])
[    0.235436] pci_bus 0002:00: root bus resource [mem 0xf5000000-0xf5ffffff]
[    0.235502] pci_bus 0002:00: root bus resource [bus 00-ff]
[    0.235553] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to ff
[    0.236789] pci 0002:00:0b.0: [106b:0036] type 00 class 0x060000 conventional PCI endpoint
[    0.237847] pci 0002:00:0d.0: [106b:0033] type 00 class 0xff0000 conventional PCI endpoint
[    0.237947] pci 0002:00:0d.0: BAR 0 [mem 0xf5004000-0xf5007fff]
[    0.239403] pci 0002:00:0e.0: [106b:0031] type 00 class 0x0c0010 conventional PCI endpoint
[    0.239503] pci 0002:00:0e.0: BAR 0 [mem 0xf5000000-0xf5000fff]
[    0.239647] pci 0002:00:0e.0: supports D1 D2
[    0.239690] pci 0002:00:0e.0: PME# supported from D0 D1 D2 D3hot
[    0.241028] pci 0002:00:0f.0: [106b:0032] type 00 class 0x020000 conventional PCI endpoint
[    0.241126] pci 0002:00:0f.0: BAR 0 [mem 0xf5200000-0xf53fffff]
[    0.241223] pci 0002:00:0f.0: ROM [mem 0xf5100000-0xf51fffff pref]
[    0.244098] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to 00
[    0.245448] PCI 0000:00 Cannot reserve Legacy IO [io  0xff780000-0xff780fff]
[    0.245539] PCI 0001:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]
[    0.245617] pci_bus 0000:00: resource 4 [io  0xff780000-0xfff7ffff]
[    0.245669] pci_bus 0000:00: resource 5 [mem 0xf1000000-0xf1ffffff]
[    0.245716] pci_bus 0000:00: resource 6 [mem 0x90000000-0xafffffff]
[    0.245822] pci 0001:00:15.2: BAR 2 [mem 0xf3000000-0xf3000fff]: assigned
[    0.245888] pci 0001:00:15.2: BAR 4 [mem 0xf3001000-0xf3001fff]: assigned
[    0.245948] pci 0001:00:15.2: BAR 0 [io  0x1000-0x1007]: assigned
[    0.246004] pci 0001:00:15.2: BAR 1 [io  0x1008-0x100f]: assigned
[    0.246078] pci_bus 0001:00: resource 4 [io  0x0000-0x7fffff]
[    0.246126] pci_bus 0001:00: resource 5 [mem 0xf3000000-0xf3ffffff]
[    0.246172] pci_bus 0001:00: resource 6 [mem 0x80000000-0x8fffffff]
[    0.246225] pci_bus 0002:00: resource 4 [io  0x880000-0x107ffff]
[    0.246271] pci_bus 0002:00: resource 5 [mem 0xf5000000-0xf5ffffff]
[    0.332361] raid6: altivecx8 gen()  1352 MB/s
[    0.389296] raid6: altivecx4 gen()  1452 MB/s
[    0.446223] raid6: altivecx2 gen()  1252 MB/s
[    0.503140] raid6: altivecx1 gen()   879 MB/s
[    0.560088] raid6: int32x8  gen()   169 MB/s
[    0.617106] raid6: int32x4  gen()   177 MB/s
[    0.674017] raid6: int32x2  gen()   198 MB/s
[    0.730874] raid6: int32x1  gen()   158 MB/s
[    0.730914] raid6: using algorithm altivecx4 gen() 1452 MB/s
[    0.730952] raid6: using intx1 recovery algorithm
[    0.739632] SCSI subsystem initialized
[    0.741752] libata version 3.00 loaded.
[    0.743762] usbcore: registered new interface driver usbfs
[    0.744031] usbcore: registered new interface driver hub
[    0.745067] usbcore: registered new device driver usb
[    0.756307] pci 0000:00:10.0: vgaarb: setting as boot VGA device
[    0.756405] pci 0000:00:10.0: vgaarb: bridge control possible
[    0.756449] pci 0000:00:10.0: vgaarb: VGA device added: decodes=io+mem,owns=mem,locks=none
[    0.756561] vgaarb: loaded
[    0.757266] clocksource: Switched to clocksource timebase
[    0.843513] NET: Registered PF_INET protocol family
[    0.846024] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.855031] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 10240 bytes, linear)
[    0.858588] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.860545] TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    0.867924] TCP bind hash table entries: 8192 (order: 6, 327680 bytes, linear)
[    0.869234] TCP: Hash tables configured (established 8192 bind 8192)
[    0.871089] UDP hash table entries: 512 (order: 2, 24576 bytes, linear)
[    0.872188] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes, linear)
[    0.873759] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.874725] pci 0001:00:12.0: enabling device (0000 -> 0002)
[    0.874992] pci 0001:00:12.1: enabling device (0000 -> 0002)
[    0.875114] pci 0001:00:12.2: enabling device (0004 -> 0006)
[    0.875313] Apple USB OHCI 0001:00:18.0 disabled by firmware
[    0.875356] pci 0001:00:18.0: Can't enable PCI device, BIOS handoff failed.
[    0.875416] Apple USB OHCI 0001:00:19.0 disabled by firmware
[    0.875456] pci 0001:00:19.0: Can't enable PCI device, BIOS handoff failed.
[    0.875525] pci 0001:00:1b.0: enabling device (0000 -> 0002)
[    0.875636] pci 0001:00:1b.1: enabling device (0000 -> 0002)
[    0.875804] pci 0001:00:1b.2: enabling device (0004 -> 0006)
[    0.875954] pci 0002:00:0f.0: CLS mismatch (32 != 1020), using 32 bytes
[    0.877548] Thermal assist unit not available
[    0.886591] Initialise system trusted keyrings
[    0.888286] workingset: timestamp_bits=14 max_order=19 bucket_order=5
[    0.911429] 9p: Installing v9fs 9p2000 file system support
[    0.914166] NET: Registered PF_ALG protocol family
[    0.914472] xor: measuring software checksum speed
[    0.958366]    8regs           :   224 MB/sec
[    1.004625]    8regs_prefetch  :   212 MB/sec
[    1.050195]    32regs          :   216 MB/sec
[    1.097553]    32regs_prefetch :   207 MB/sec
[    1.101504]    altivec         :  2532 MB/sec
[    1.101542] xor: using function: altivec (2532 MB/sec)
[    1.101612] Key type asymmetric registered
[    1.101651] Asymmetric key parser 'x509' registered
[    1.124167] bounce: pool size: 64 pages
[    1.125034] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    1.125735] io scheduler bfq registered
[    1.138147] atomic64_test: passed
[    1.140716] Using unsupported 800x600 (null) at a0008000, depth=8, pitch=1024
[    1.155951] Console: switching to colour frame buffer device 100x37
[    1.166683] fb0: Open Firmware frame buffer device on /pci@f0000000/ATY,AlteracParent@10/ATY,Alterac_A@0
[    1.176178] MacIO PCI driver attached to Keylargo chipset
[    1.192061] 0.00013020:ch-a: ttyS0 at MMIO 0x80013020 (irq = 22, base_baud = 230400) is a Z85c30 ESCC - Serial port
[    1.198579] 0.00013000:ch-b: ttyS1 at MMIO 0x80013000 (irq = 23, base_baud = 230400) is a Z85c30 ESCC - Serial port
[    1.211903] sata_sil 0001:00:13.0: version 2.4
[    1.212714] sata_sil 0001:00:13.0: enabling device (0004 -> 0007)
[    1.222820] scsi host0: sata_sil
[    1.227979] scsi host1: sata_sil
[    1.230045] ata1: SATA max UDMA/100 mmio m512@0x80082000 tf 0x80082080 irq 53 lpm-pol 0
[    1.235568] ata2: SATA max UDMA/100 mmio m512@0x80082000 tf 0x800820c0 irq 53 lpm-pol 0
[    1.242143] pata-pci-macio 0002:00:0d.0: enabling device (0004 -> 0006)
[    1.263966] pata-pci-macio 0002:00:0d.0: Activating pata-macio chipset UniNorth ATA-6, Apple bus ID 3
[    1.282572] scsi host2: pata_macio
[    1.290288] ata3: PATA max UDMA/100 irq 39 lpm-pol 0
[    1.571673] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[    1.578168] ata1.00: ATA-9: SanDisk SSD PLUS 240GB, UF4500RL, max UDMA/133
[    1.583804] ata1.00: 468877312 sectors, multi 1: LBA48 NCQ (depth 0/32)
[    1.591255] ata1.00: Features: Dev-Sleep
[    1.621624] ata1.00: configured for UDMA/100
[    1.629034] scsi 0:0:0:0: Direct-Access     ATA      SanDisk SSD PLUS 00RL PQ: 0 ANSI: 5
[    1.644698] sd 0:0:0:0: [sda] 468877312 512-byte logical blocks: (240 GB/224 GiB)
[    1.651059] sd 0:0:0:0: [sda] Write Protect is off
[    1.657094] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.663417] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.675998] sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    1.716136]  sda: [mac] sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8
[    1.732094] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.070646] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[    2.079480] ata2.00: ATA-9: WDC WD5000LPLX-60ZNTT1, 02.01A02, max UDMA/133
[    2.085787] ata2.00: 976773168 sectors, multi 0: LBA48 NCQ (depth 0/32)
[    2.094731] ata2.00: configured for UDMA/100
[    2.103509] scsi 1:0:0:0: Direct-Access     ATA      WDC WD5000LPLX-6 1A02 PQ: 0 ANSI: 5
[    2.117970] sd 1:0:0:0: [sdb] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    2.124184] sd 1:0:0:0: [sdb] 4096-byte physical blocks
[    2.130679] sd 1:0:0:0: [sdb] Write Protect is off
[    2.136647] sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    2.143023] sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.154968] sd 1:0:0:0: [sdb] Preferred minimum I/O size 4096 bytes
[    2.327384] pata-macio 0.0001f000:ata-4: Activating pata-macio chipset KeyLargo ATA-4, Apple bus ID 2
[    2.345716] scsi host3: pata_macio
[    2.353478] ata4: PATA max UDMA/66 irq 19 lpm-pol 0
[    2.520174] ata4.00: CFA: DeLOCK 54143 512MB, 100511E, max UDMA/66
[    2.526413] ata4.00: 1009008 sectors, multi 1: LBA 
[    2.795186]  sdb: [mac] sdb1 sdb2 sdb3 sdb4 sdb5 sdb6 sdb7 sdb8 sdb9
[    2.812352] sd 1:0:0:0: [sdb] Attached SCSI disk
[    2.820355] scsi 3:0:0:0: Direct-Access     ATA      DeLOCK 54143 512 11E  PQ: 0 ANSI: 5
[    2.835232] sd 3:0:0:0: [sdc] 1009008 512-byte logical blocks: (517 MB/493 MiB)
[    2.841736] sd 3:0:0:0: [sdc] Write Protect is off
[    2.847862] sd 3:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[    2.854304] sd 3:0:0:0: [sdc] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    2.866861] sd 3:0:0:0: [sdc] Preferred minimum I/O size 512 bytes
[    2.905866]  sdc: [mac] sdc1 sdc2 sdc3 sdc4 sdc5 sdc6
[    2.919062] sd 3:0:0:0: [sdc] Attached SCSI disk
[    3.394066] pata-macio 0.00020000:ata-3: Activating pata-macio chipset KeyLargo ATA-3, Apple bus ID 0
[    3.414487] scsi host4: pata_macio
[    3.422379] ata5: PATA max MWDMA2 irq 20 lpm-pol 0
[    3.430395] sungem.c:v1.0 David S. Miller <davem@redhat.com>
[    3.446546] gem 0002:00:0f.0 eth0: Sun GEM (PCI) 10/100/1000BaseT Ethernet 00:0a:95:9c:76:3a
[    3.456340] ehci-pci 0001:00:12.2: EHCI Host Controller
[    3.463217] ehci-pci 0001:00:12.2: new USB bus registered, assigned bus number 1
[    3.464134] rtc-generic rtc-generic: registered as rtc0
[    3.470311] ehci-pci 0001:00:12.2: irq 52, io mem 0x80081000
[    3.478088] PowerMac i2c bus pmu 2 registered
[    3.489778] PowerMac i2c bus pmu 1 registered
[    3.497302] ehci-pci 0001:00:12.2: USB 2.0 started, EHCI 1.00
[    3.498876] PowerMac i2c bus mac-io 0 registered
[    3.504561] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.11
[    3.509996] i2c i2c-2: No i2c address for /pci@f2000000/mac-io@17/i2c@18000/i2c-modem
[    3.515703] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.523216] PowerMac i2c bus uni-n 1 registered
[    3.528396] usb usb1: Product: EHCI Host Controller
[    3.528422] usb usb1: Manufacturer: Linux 6.11.0-rc2-PMacG4 ehci_hcd
[    3.534714] i2c i2c-3: i2c-powermac: modalias failure on /uni-n@f8000000/i2c@f8001000/cereal@1c0
[    3.540841] usb usb1: SerialNumber: 0001:00:12.2
[    3.548428] PowerMac i2c bus uni-n 0 registered
[    3.563192] hub 1-0:1.0: USB hub found
[    3.570492] hid: raw HID events driver (C) Jiri Kosina
[    3.572418] hub 1-0:1.0: 5 ports detected
[    3.580188] usbcore: registered new interface driver usbhid
[    3.590899] usbhid: USB HID core driver
[    3.597104] ehci-pci 0001:00:1b.2: EHCI Host Controller
[    3.605786] ehci-pci 0001:00:1b.2: new USB bus registered, assigned bus number 2
[    3.612386] ata5.00: ATAPI: _NEC DVD_RW ND-3520A, 1.04, max UDMA/33
[    3.615949] ehci-pci 0001:00:1b.2: irq 63, io mem 0x80080000
[    3.619978] NET: Registered PF_INET6 protocol family
[    3.637462] ehci-pci 0001:00:1b.2: USB 2.0 started, EHCI 1.00
[    3.641867] scsi 4:0:0:0: CD-ROM            _NEC     DVD_RW ND-3520A  1.04 PQ: 0 ANSI: 5
[    3.645766] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.11
[    3.656091] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.656267] Segment Routing with IPv6
[    3.662207] usb usb2: Product: EHCI Host Controller
[    3.662230] usb usb2: Manufacturer: Linux 6.11.0-rc2-PMacG4 ehci_hcd
[    3.662247] usb usb2: SerialNumber: 0001:00:1b.2
[    3.669271] In-situ OAM (IOAM) with IPv6
[    3.678625] hub 2-0:1.0: USB hub found
[    3.688632] 9pnet: Installing 9P2000 support
[    3.692716] hub 2-0:1.0: 5 ports detected
[    3.717702] sr 4:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer cd/rw xa/form2 cdda tray
[    3.723718] cdrom: Uniform CD-ROM driver Revision: 3.20
[    3.803181] registered taskstats version 1
[    3.812204] Loading compiled-in X.509 certificates
[    3.817969] sr 4:0:0:0: Attached scsi CD-ROM sr0
[    3.928947] zswap: loaded using pool lzo/zsmalloc
[    3.935906] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
[    3.948622] page_owner is disabled
[    4.037916] Btrfs loaded, zoned=no, fsverity=no
[    7.532433] input: PMU as /devices/virtual/input/input0
[    7.540547] netpoll: netconsole: local port 6666
[    7.546233] netpoll: netconsole: local IPv4 address 192.168.2.8
[    7.551673] netpoll: netconsole: interface 'eth0'
[    7.557027] netpoll: netconsole: remote port 6666
[    7.562331] netpoll: netconsole: remote IPv4 address 192.168.2.3
[    7.567643] netpoll: netconsole: remote ethernet address a8:a1:59:16:4f:ea
[    7.573020] netpoll: netconsole: device eth0 not up yet, forcing it
[    7.667723] sungem_phy: PHY ID: 2060e1, addr: 0
[    7.673384] gem 0002:00:0f.0 eth0: Found BCM5421 PHY
[   11.340991] gem 0002:00:0f.0 eth0: Link is up at 1000 Mbps, full-duplex
[   11.346511] gem 0002:00:0f.0 eth0: Pause is enabled (rxfifo: 10240 off: 7168 on: 5632)
[   11.357657] printk: legacy console [netcon0] enabled
[   11.386006] netconsole: network logging started
[   11.426443] EXT4-fs (sda5): mounted filesystem fa07e66f-b4f9-404f-85d8-487d3c097aec ro with ordered data mode. Quota mode: disabled.
[   11.437794] VFS: Mounted root (ext4 filesystem) readonly on device 8:5.
[   11.451308] devtmpfs: mounted
[   11.461927] Freeing unused kernel image (initmem) memory: 1624K
[   11.501602] Checked W+X mappings: passed, no W+X pages found
[   11.507288] rodata_test: all tests were successful
[   11.512748] Run /sbin/init as init process
[   11.518199]   with arguments:
[   11.523658]     /sbin/init
[   11.528956]   with environment:
[   11.534292]     HOME=/
[   11.539490]     TERM=linux
[   21.044420] ohci-pci 0001:00:12.0: OHCI PCI host controller
[   21.064863] ohci-pci 0001:00:12.0: new USB bus registered, assigned bus number 3
[   21.079739] ohci-pci 0001:00:12.0: irq 52, io mem 0x8008c000
[   21.208842] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 6.11
[   21.213631] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   21.218056] usb usb3: Product: OHCI PCI host controller
[   21.222407] usb usb3: Manufacturer: Linux 6.11.0-rc2-PMacG4 ohci_hcd
[   21.226761] usb usb3: SerialNumber: 0001:00:12.0
[   21.261202] hub 3-0:1.0: USB hub found
[   21.270049] hub 3-0:1.0: 3 ports detected
[   21.325322] ohci-pci 0001:00:12.1: OHCI PCI host controller
[   21.339659] ohci-pci 0001:00:12.1: new USB bus registered, assigned bus number 4
[   21.345256] ohci-pci 0001:00:12.1: irq 52, io mem 0x8008b000
[   21.512066] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 6.11
[   21.517109] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   21.522117] usb usb4: Product: OHCI PCI host controller
[   21.527160] usb usb4: Manufacturer: Linux 6.11.0-rc2-PMacG4 ohci_hcd
[   21.532062] usb usb4: SerialNumber: 0001:00:12.1
[   21.649123] hub 4-0:1.0: USB hub found
[   21.698222] hub 4-0:1.0: 2 ports detected
[   21.765915] Apple USB OHCI 0001:00:18.0 disabled by firmware
[   21.780977] Apple USB OHCI 0001:00:19.0 disabled by firmware
[   21.788651] ohci-pci 0001:00:1b.0: OHCI PCI host controller
[   21.794262] ohci-pci 0001:00:1b.0: new USB bus registered, assigned bus number 5
[   21.800076] ohci-pci 0001:00:1b.0: irq 63, io mem 0x80084000
[   21.953188] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 6.11
[   21.958667] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   21.964286] usb usb5: Product: OHCI PCI host controller
[   21.969602] usb usb5: Manufacturer: Linux 6.11.0-rc2-PMacG4 ohci_hcd
[   21.974945] usb usb5: SerialNumber: 0001:00:1b.0
[   22.084102] hub 5-0:1.0: USB hub found
[   22.137048] hub 5-0:1.0: 3 ports detected
[   22.216537] ohci-pci 0001:00:1b.1: OHCI PCI host controller
[   22.294175] ohci-pci 0001:00:1b.1: new USB bus registered, assigned bus number 6
[   22.318754] ohci-pci 0001:00:1b.1: irq 63, io mem 0x80083000
[   22.401075] [drm] radeon kernel modesetting enabled.
[   22.452724] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 6.11
[   22.458636] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   22.464179] usb usb6: Product: OHCI PCI host controller
[   22.469627] usb usb6: Manufacturer: Linux 6.11.0-rc2-PMacG4 ohci_hcd
[   22.475040] usb usb6: SerialNumber: 0001:00:1b.1
[   22.505628] Console: switching to colour dummy device 80x25
[   22.561114] radeon 0000:00:10.0: enabling device (0006 -> 0007)
[   22.595859] hub 6-0:1.0: USB hub found
[   22.606398] [drm] initializing kernel modesetting (RV350 0x1002:0x4150 0x1002:0x0002 0x00).
[   22.606633] [drm] Forcing AGP to PCI mode
[   22.611669] hub 6-0:1.0: 2 ports detected
[   22.628205] radeon 0000:00:10.0: Invalid PCI ROM header signature: expecting 0xaa55, got 0x0000
[   22.752329] [drm] Generation 2 PCI interface, using max accessible memory
[   22.752799] radeon 0000:00:10.0: VRAM: 256M 0x00000000A0000000 - 0x00000000AFFFFFFF (256M used)
[   22.752922] radeon 0000:00:10.0: GTT: 512M 0x0000000080000000 - 0x000000009FFFFFFF
[   22.753347] [drm] Detected VRAM RAM=256M, BAR=256M
[   22.753486] [drm] RAM width 128bits DDR
[   22.821797] [drm] radeon: 256M of VRAM memory ready
[   22.822126] [drm] radeon: 512M of GTT memory ready.
[   22.823013] [drm] GART: num cpu pages 131072, num gpu pages 131072
[   23.044482] [drm] radeon: 1 quad pipes, 1 Z pipes initialized
[   23.044810] [drm] PCI GART of 512M enabled (table at 0x0000000008B00000).
[   23.045237] radeon 0000:00:10.0: WB enabled
[   23.045353] radeon 0000:00:10.0: fence driver on ring 0 use gpu addr 0x0000000080000000
[   23.067895] [drm] radeon: irq initialized.
[   23.068250] [drm] Loading R300 Microcode
[   23.393193] [drm] radeon: ring at 0x0000000080001000
[   23.393563] [drm] ring test succeeded in 0 usecs
[   23.461857] [drm] ib test succeeded in 0 usecs
[   23.528770] [drm] Radeon Display Connectors
[   23.529045] [drm] Connector 0:
[   23.529124] [drm]   DVI-I-1
[   23.529193] [drm]   HPD2
[   23.529301] [drm]   DDC: 0x64 0x64 0x64 0x64 0x64 0x64 0x64 0x64
[   23.529421] [drm]   Encoders:
[   23.529520] [drm]     CRT1: INTERNAL_DAC1
[   23.529592] [drm]     DFP2: INTERNAL_DVO1
[   23.529696] [drm] Connector 1:
[   23.529760] [drm]   DVI-I-2
[   23.529885] [drm]   HPD1
[   23.529977] [drm]   DDC: 0x60 0x60 0x60 0x60 0x60 0x60 0x60 0x60
[   23.530057] [drm]   Encoders:
[   23.530117] [drm]     CRT2: INTERNAL_DAC2
[   23.530221] [drm]     DFP1: INTERNAL_TMDS1
[   23.543701] [drm] Initialized radeon 2.50.0 for 0000:00:10.0 on minor 0
[   23.623873] radeon 0000:00:10.0: [drm] Cannot find any crtc or sizes
[   23.660739] radeon 0000:00:10.0: [drm] Cannot find any crtc or sizes
[   23.686635] radeon 0000:00:10.0: [drm] Cannot find any crtc or sizes
[   24.255984] random: crng init done
[   25.143250] ADM1030 fan controller [@2c]
[   25.158019] firewire_ohci 0002:00:0e.0: enabling device (0000 -> 0002)
[   25.278150] firewire_ohci 0002:00:0e.0: added OHCI v1.10 device as card 0, 8 IR + 8 IT contexts, quirks 0x0
[   25.359306] gem 0002:00:0f.0 enP2p0s15: renamed from eth0 (while UP)
[   25.806809] firewire_core 0002:00:0e.0: created device fw0: GUID 000a95fffe9c763a, S800
[   26.574608] snd-aoa-fabric-layout: can use this codec
[   27.376149] EXT4-fs (sda5): re-mounted fa07e66f-b4f9-404f-85d8-487d3c097aec r/w. Quota mode: disabled.
[   27.504237] EXT4-fs (sda5): re-mounted fa07e66f-b4f9-404f-85d8-487d3c097aec r/w. Quota mode: disabled.
[   28.581317] Adding 8388604k swap on /dev/sdb6.  Priority:-2 extents:1 across:8388604k 
[   29.061583] EXT4-fs (sdc5): mounting ext2 file system using the ext4 subsystem
[   29.075856] EXT4-fs (sdc5): mounted filesystem e4e8af9e-0f0d-44f9-b983-71bf61d782de r/w without journal. Quota mode: disabled.
[   29.076244] ext2 filesystem being mounted at /boot supports timestamps until 2038-01-19 (0x7fffffff)
[   29.079573] BTRFS: device label tmp devid 1 transid 5197 /dev/sda6 (8:6) scanned by mount (880)
[   29.084432] BTRFS info (device sda6): first mount of filesystem 65162d91-887e-4e48-a356-fbf7093eefb5
[   29.084699] BTRFS info (device sda6): using xxhash64 (xxhash64-generic) checksum algorithm
[   29.084896] BTRFS info (device sda6): using free-space-tree
[  136.274148] KTAP version 1
[  136.274438] 1..1
[  136.275323]     KTAP version 1
[  136.275450]     # Subtest: overflow
[  136.275553]     # module: overflow_kunit
[  136.275604]     1..22
[  136.276595]     # u8_u8__u8_overflow_test: 18 u8_u8__u8 arithmetic tests finished
[  136.277546]     ok 1 u8_u8__u8_overflow_test
[  136.281318]     # s8_s8__s8_overflow_test: 19 s8_s8__s8 arithmetic tests finished
[  136.284396]     ok 2 s8_s8__s8_overflow_test
[  136.289984]     # u16_u16__u16_overflow_test: 17 u16_u16__u16 arithmetic tests finished
[  136.291288]     ok 3 u16_u16__u16_overflow_test
[  136.294701]     # s16_s16__s16_overflow_test: 17 s16_s16__s16 arithmetic tests finished
[  136.300397]     ok 4 s16_s16__s16_overflow_test
[  136.301973]     # u32_u32__u32_overflow_test: 17 u32_u32__u32 arithmetic tests finished
[  136.303183]     ok 5 u32_u32__u32_overflow_test
[  136.303865]     # s32_s32__s32_overflow_test: 17 s32_s32__s32 arithmetic tests finished
[  136.307074]     ok 6 s32_s32__s32_overflow_test
[  136.308155]     # u64_u64__u64_overflow_test: 17 u64_u64__u64 arithmetic tests finished
[  136.309097]     ok 7 u64_u64__u64_overflow_test
[  136.309717]     # s64_s64__s64_overflow_test: 21 s64_s64__s64 arithmetic tests finished
[  136.310574]     ok 8 s64_s64__s64_overflow_test
[  136.312786]     # u32_u32__int_overflow_test: 2 u32_u32__int arithmetic tests finished
[  136.313705]     ok 9 u32_u32__int_overflow_test
[  136.314767]     # u32_u32__u8_overflow_test: 3 u32_u32__u8 arithmetic tests finished
[  136.316477]     ok 10 u32_u32__u8_overflow_test
[  136.318442]     # u8_u8__int_overflow_test: 3 u8_u8__int arithmetic tests finished
[  136.319735]     ok 11 u8_u8__int_overflow_test
[  136.320329]     # int_int__u8_overflow_test: 3 int_int__u8 arithmetic tests finished
[  136.321338]     ok 12 int_int__u8_overflow_test
[  136.322042]     # shift_sane_test: 36 sane shift tests finished
[  136.324512]     ok 13 shift_sane_test
[  136.325397]     # shift_overflow_test: 25 overflow shift tests finished
[  136.326264]     ok 14 shift_overflow_test
[  136.326945]     # shift_truncate_test: 27 truncate shift tests finished
[  136.329960]     ok 15 shift_truncate_test
[  136.330566]     # shift_nonsense_test: 25 nonsense shift tests finished
[  136.331710]     ok 16 shift_nonsense_test
[  136.342161]     # overflow_allocation_test: 11 allocation overflow tests finished
[  136.345878] ==================================================================
[  136.346021] BUG: KASAN: stack-out-of-bounds in string_nocheck+0x168/0x1c8
[  136.346126] Read of size 1 at addr c976be40 by task kunit_try_catch/1843
[  136.346190] 
[  136.346252] CPU: 0 UID: 0 PID: 1843 Comm: kunit_try_catch Tainted: G                 N 6.11.0-rc2-PMacG4 #1
[  136.346424] Tainted: [N]=TEST
[  136.346477] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[  136.346537] Call Trace:
[  136.346588] [c992fb80] [c16651c0] dump_stack_lvl+0x80/0xac (unreliable)
[  136.346696] [c992fba0] [c04e0420] print_report+0xdc/0x504
[  136.346890] [c992fc00] [c04e01d8] kasan_report+0xf8/0x108
[  136.346965] [c992fc80] [c16ae4c8] string_nocheck+0x168/0x1c8
[  136.347042] [c992fcf0] [c16b37a4] string+0xa8/0xbc
[  136.347116] [c992fd60] [c16b8134] vsnprintf+0x868/0x1750
[  136.347192] [c992fdf0] [c0b8490c] kvasprintf+0xa4/0x13c
[  136.347267] [c992fe60] [c0b84c3c] kasprintf+0xb4/0xc8
[  136.347338] [c992fed0] [c0f4c954] module_remove_driver+0x1f0/0x2fc
[  136.347418] [c992ff00] [c0f21628] bus_remove_driver+0x1d0/0x240
[  136.347494] [c992ff30] [bfd0cd40] kunit_put_resource+0x128/0x134 [kunit]
[  136.347734] [c992ff50] [bfd0a120] kunit_cleanup+0x140/0x144 [kunit]
[  136.347859] [c992ff90] [bfd10d64] kunit_generic_run_threadfn_adapter+0xf8/0x148 [kunit]
[  136.347982] [c992ffc0] [c00f57e0] kthread+0x36c/0x37c
[  136.348172] [c992fff0] [c0028304] start_kernel_thread+0x10/0x14
[  136.348253] 
[  136.348307] The buggy address belongs to the physical page:
[  136.348364] page: refcount:0 mapcount:0 mapping:00000000 index:0x0 pfn:0x976b
[  136.348489] flags: 0x0(zone=0)
[  136.348567] raw: 00000000 00000000 eef2bb10 00000000 00000000 00000000 ffffffff 00000000
[  136.348628] raw: 00000000
[  136.348677] page dumped because: kasan: bad access detected
[  136.348930] 
[  136.348981] Memory state around the buggy address:
[  136.349038]  c976bd00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  136.349098]  c976bd80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  136.349154] >c976be00: 00 00 00 00 00 00 00 00 f1 f1 f1 f1 04 f2 04 f2
[  136.349205]                                    ^
[  136.349261]  c976be80: 00 04 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
[  136.349315]  c976bf00: 00 00 f1 f1 f1 f1 00 f3 f3 f3 00 00 00 00 00 00
[  136.349366] ==================================================================
[  136.349960] Disabling lock debugging due to kernel taint
[  136.354669]     not ok 17 overflow_allocation_test
[  136.355410]     # overflow_size_helpers_test: 43 overflow size helper tests finished
[  136.356326]     ok 18 overflow_size_helpers_test
[  136.356965]     # overflows_type_test: 378 overflows_type() tests finished
[  136.358061]     ok 19 overflows_type_test
[  136.358716]     # same_type_test: 0 __same_type() tests finished
[  136.362252]     ok 20 same_type_test
[  136.362876]     # castable_to_type_test: 75 castable_to_type() tests finished
[  136.364025]     ok 21 castable_to_type_test
[  136.365834]     ok 22 DEFINE_FLEX_test
[  136.366045] # overflow: pass:21 fail:1 skip:0 total:22
[  136.366175] # Totals: pass:21 fail:1 skip:0 total:22
[  136.366264] not ok 1 overflow
[ 8844.776326] BTRFS info (device sda6): last unmount of filesystem 65162d91-887e-4e48-a356-fbf7093eefb5
[ 8844.846671] EXT4-fs (sdc5): unmounting filesystem e4e8af9e-0f0d-44f9-b983-71bf61d782de.
[ 8850.910958] elogind-daemon[1514]: Received signal 15 [TERM]
[ 8852.038563] EXT4-fs (sda5): re-mounted fa07e66f-b4f9-404f-85d8-487d3c097aec ro. Quota mode: disabled.
[ 8853.713228] sd 3:0:0:0: [sdc] Stopping disk
[ 8853.713879] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
[ 8853.715152] sd 1:0:0:0: [sdb] Stopping disk
[ 8853.715723] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[ 8853.716413] sd 0:0:0:0: [sda] Stopping disk
[ 8853.725469] reboot: Power down

--MP_/_xpNTj4Ql8TXPxg/k=dTREm
Content-Type: application/octet-stream; name=config_611-rc2_g4
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=config_611-rc2_g4

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L3Bv
d2VycGMgNi4xMS4wLXJjMiBLZXJuZWwgQ29uZmlndXJhdGlvbgojCkNPTkZJR19DQ19WRVJTSU9O
X1RFWFQ9ImdjYyAoR2VudG9vIDE0LjIuMCBwNCkgMTQuMi4wIgpDT05GSUdfQ0NfSVNfR0NDPXkK
Q09ORklHX0dDQ19WRVJTSU9OPTE0MDIwMApDT05GSUdfQ0xBTkdfVkVSU0lPTj0wCkNPTkZJR19B
U19JU19HTlU9eQpDT05GSUdfQVNfVkVSU0lPTj0yNDIwMApDT05GSUdfTERfSVNfQkZEPXkKQ09O
RklHX0xEX1ZFUlNJT049MjQyMDAKQ09ORklHX0xMRF9WRVJTSU9OPTAKQ09ORklHX0NDX0hBU19B
U01fR09UT19PVVRQVVQ9eQpDT05GSUdfQ0NfSEFTX0FTTV9HT1RPX1RJRURfT1VUUFVUPXkKQ09O
RklHX1RPT0xTX1NVUFBPUlRfUkVMUj15CkNPTkZJR19DQ19IQVNfQVNNX0lOTElORT15CkNPTkZJ
R19DQ19IQVNfTk9fUFJPRklMRV9GTl9BVFRSPXkKQ09ORklHX1BBSE9MRV9WRVJTSU9OPTAKQ09O
RklHX0NPTlNUUlVDVE9SUz15CkNPTkZJR19JUlFfV09SSz15CkNPTkZJR19CVUlMRFRJTUVfVEFC
TEVfU09SVD15CkNPTkZJR19USFJFQURfSU5GT19JTl9UQVNLPXkKCiMKIyBHZW5lcmFsIHNldHVw
CiMKQ09ORklHX0lOSVRfRU5WX0FSR19MSU1JVD0zMgojIENPTkZJR19DT01QSUxFX1RFU1QgaXMg
bm90IHNldAojIENPTkZJR19XRVJST1IgaXMgbm90IHNldApDT05GSUdfTE9DQUxWRVJTSU9OPSIt
UE1hY0c0IgojIENPTkZJR19MT0NBTFZFUlNJT05fQVVUTyBpcyBub3Qgc2V0CkNPTkZJR19CVUlM
RF9TQUxUPSIiCkNPTkZJR19IQVZFX0tFUk5FTF9HWklQPXkKQ09ORklHX0hBVkVfS0VSTkVMX1ha
PXkKQ09ORklHX0tFUk5FTF9HWklQPXkKIyBDT05GSUdfS0VSTkVMX1haIGlzIG5vdCBzZXQKQ09O
RklHX0RFRkFVTFRfSU5JVD0iIgpDT05GSUdfREVGQVVMVF9IT1NUTkFNRT0iKG5vbmUpIgpDT05G
SUdfU1lTVklQQz15CkNPTkZJR19TWVNWSVBDX1NZU0NUTD15CkNPTkZJR19QT1NJWF9NUVVFVUU9
eQpDT05GSUdfUE9TSVhfTVFVRVVFX1NZU0NUTD15CkNPTkZJR19XQVRDSF9RVUVVRT15CkNPTkZJ
R19DUk9TU19NRU1PUllfQVRUQUNIPXkKIyBDT05GSUdfVVNFTElCIGlzIG5vdCBzZXQKIyBDT05G
SUdfQVVESVQgaXMgbm90IHNldApDT05GSUdfSEFWRV9BUkNIX0FVRElUU1lTQ0FMTD15CgojCiMg
SVJRIHN1YnN5c3RlbQojCkNPTkZJR19HRU5FUklDX0lSUV9TSE9XPXkKQ09ORklHX0dFTkVSSUNf
SVJRX1NIT1dfTEVWRUw9eQpDT05GSUdfR0VORVJJQ19JUlFfTUlHUkFUSU9OPXkKQ09ORklHX0lS
UV9ET01BSU49eQpDT05GSUdfSVJRX0RPTUFJTl9ISUVSQVJDSFk9eQpDT05GSUdfSVJRX0RPTUFJ
Tl9OT01BUD15CkNPTkZJR19HRU5FUklDX01TSV9JUlE9eQpDT05GSUdfSVJRX0ZPUkNFRF9USFJF
QURJTkc9eQpDT05GSUdfU1BBUlNFX0lSUT15CiMgQ09ORklHX0dFTkVSSUNfSVJRX0RFQlVHRlMg
aXMgbm90IHNldAojIGVuZCBvZiBJUlEgc3Vic3lzdGVtCgpDT05GSUdfR0VORVJJQ19USU1FX1ZT
WVNDQUxMPXkKQ09ORklHX0dFTkVSSUNfQ0xPQ0tFVkVOVFM9eQpDT05GSUdfQVJDSF9IQVNfVElD
S19CUk9BRENBU1Q9eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1Q9eQpDT05G
SUdfR0VORVJJQ19DTU9TX1VQREFURT15CkNPTkZJR19USU1FX0tVTklUX1RFU1Q9bQpDT05GSUdf
Q09OVEVYVF9UUkFDS0lORz15CkNPTkZJR19DT05URVhUX1RSQUNLSU5HX0lETEU9eQoKIwojIFRp
bWVycyBzdWJzeXN0ZW0KIwpDT05GSUdfVElDS19PTkVTSE9UPXkKQ09ORklHX05PX0haX0NPTU1P
Tj15CiMgQ09ORklHX0haX1BFUklPRElDIGlzIG5vdCBzZXQKQ09ORklHX05PX0haX0lETEU9eQoj
IENPTkZJR19OT19IWl9GVUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfTk9fSFogaXMgbm90IHNldApD
T05GSUdfSElHSF9SRVNfVElNRVJTPXkKIyBlbmQgb2YgVGltZXJzIHN1YnN5c3RlbQoKQ09ORklH
X0JQRj15CkNPTkZJR19IQVZFX0VCUEZfSklUPXkKQ09ORklHX0FSQ0hfV0FOVF9ERUZBVUxUX0JQ
Rl9KSVQ9eQoKIwojIEJQRiBzdWJzeXN0ZW0KIwpDT05GSUdfQlBGX1NZU0NBTEw9eQpDT05GSUdf
QlBGX0pJVD15CkNPTkZJR19CUEZfSklUX0FMV0FZU19PTj15CkNPTkZJR19CUEZfSklUX0RFRkFV
TFRfT049eQpDT05GSUdfQlBGX1VOUFJJVl9ERUZBVUxUX09GRj15CiMgQ09ORklHX0JQRl9QUkVM
T0FEIGlzIG5vdCBzZXQKIyBlbmQgb2YgQlBGIHN1YnN5c3RlbQoKQ09ORklHX1BSRUVNUFRfVk9M
VU5UQVJZX0JVSUxEPXkKIyBDT05GSUdfUFJFRU1QVF9OT05FIGlzIG5vdCBzZXQKQ09ORklHX1BS
RUVNUFRfVk9MVU5UQVJZPXkKIyBDT05GSUdfUFJFRU1QVCBpcyBub3Qgc2V0CgojCiMgQ1BVL1Rh
c2sgdGltZSBhbmQgc3RhdHMgYWNjb3VudGluZwojCkNPTkZJR19USUNLX0NQVV9BQ0NPVU5USU5H
PXkKIyBDT05GSUdfVklSVF9DUFVfQUNDT1VOVElOR19OQVRJVkUgaXMgbm90IHNldAojIENPTkZJ
R19WSVJUX0NQVV9BQ0NPVU5USU5HX0dFTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lSUV9USU1FX0FD
Q09VTlRJTkcgaXMgbm90IHNldApDT05GSUdfQlNEX1BST0NFU1NfQUNDVD15CkNPTkZJR19CU0Rf
UFJPQ0VTU19BQ0NUX1YzPXkKQ09ORklHX1RBU0tTVEFUUz15CkNPTkZJR19UQVNLX0RFTEFZX0FD
Q1Q9eQpDT05GSUdfVEFTS19YQUNDVD15CkNPTkZJR19UQVNLX0lPX0FDQ09VTlRJTkc9eQojIENP
TkZJR19QU0kgaXMgbm90IHNldAojIGVuZCBvZiBDUFUvVGFzayB0aW1lIGFuZCBzdGF0cyBhY2Nv
dW50aW5nCgpDT05GSUdfQ1BVX0lTT0xBVElPTj15CgojCiMgUkNVIFN1YnN5c3RlbQojCkNPTkZJ
R19UUkVFX1JDVT15CiMgQ09ORklHX1JDVV9FWFBFUlQgaXMgbm90IHNldApDT05GSUdfVFJFRV9T
UkNVPXkKQ09ORklHX05FRURfU1JDVV9OTUlfU0FGRT15CkNPTkZJR19UQVNLU19SQ1VfR0VORVJJ
Qz15CkNPTkZJR19ORUVEX1RBU0tTX1JDVT15CkNPTkZJR19UQVNLU19UUkFDRV9SQ1U9eQpDT05G
SUdfUkNVX1NUQUxMX0NPTU1PTj15CkNPTkZJR19SQ1VfTkVFRF9TRUdDQkxJU1Q9eQojIGVuZCBv
ZiBSQ1UgU3Vic3lzdGVtCgojIENPTkZJR19JS0NPTkZJRyBpcyBub3Qgc2V0CiMgQ09ORklHX0lL
SEVBREVSUyBpcyBub3Qgc2V0CkNPTkZJR19MT0dfQlVGX1NISUZUPTE2CkNPTkZJR19MT0dfQ1BV
X01BWF9CVUZfU0hJRlQ9MTMKIyBDT05GSUdfUFJJTlRLX0lOREVYIGlzIG5vdCBzZXQKCiMKIyBT
Y2hlZHVsZXIgZmVhdHVyZXMKIwojIGVuZCBvZiBTY2hlZHVsZXIgZmVhdHVyZXMKCkNPTkZJR19D
Q19JTVBMSUNJVF9GQUxMVEhST1VHSD0iLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD01IgpDT05GSUdf
R0NDMTBfTk9fQVJSQVlfQk9VTkRTPXkKQ09ORklHX0NDX05PX0FSUkFZX0JPVU5EUz15CkNPTkZJ
R19HQ0NfTk9fU1RSSU5HT1BfT1ZFUkZMT1c9eQpDT05GSUdfQ0NfTk9fU1RSSU5HT1BfT1ZFUkZM
T1c9eQpDT05GSUdfU0xBQl9PQkpfRVhUPXkKQ09ORklHX0NHUk9VUFM9eQpDT05GSUdfUEFHRV9D
T1VOVEVSPXkKIyBDT05GSUdfQ0dST1VQX0ZBVk9SX0RZTk1PRFMgaXMgbm90IHNldApDT05GSUdf
TUVNQ0c9eQojIENPTkZJR19NRU1DR19WMSBpcyBub3Qgc2V0CkNPTkZJR19CTEtfQ0dST1VQPXkK
Q09ORklHX0NHUk9VUF9XUklURUJBQ0s9eQpDT05GSUdfQ0dST1VQX1NDSEVEPXkKQ09ORklHX0ZB
SVJfR1JPVVBfU0NIRUQ9eQojIENPTkZJR19DRlNfQkFORFdJRFRIIGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRfR1JPVVBfU0NIRUQgaXMgbm90IHNldApDT05GSUdfU0NIRURfTU1fQ0lEPXkKQ09ORklH
X0NHUk9VUF9QSURTPXkKQ09ORklHX0NHUk9VUF9SRE1BPXkKQ09ORklHX0NHUk9VUF9GUkVFWkVS
PXkKQ09ORklHX0NQVVNFVFM9eQpDT05GSUdfUFJPQ19QSURfQ1BVU0VUPXkKQ09ORklHX0NHUk9V
UF9ERVZJQ0U9eQpDT05GSUdfQ0dST1VQX0NQVUFDQ1Q9eQpDT05GSUdfQ0dST1VQX1BFUkY9eQpD
T05GSUdfQ0dST1VQX0JQRj15CkNPTkZJR19DR1JPVVBfTUlTQz15CiMgQ09ORklHX0NHUk9VUF9E
RUJVRyBpcyBub3Qgc2V0CkNPTkZJR19TT0NLX0NHUk9VUF9EQVRBPXkKQ09ORklHX05BTUVTUEFD
RVM9eQpDT05GSUdfVVRTX05TPXkKQ09ORklHX1RJTUVfTlM9eQpDT05GSUdfSVBDX05TPXkKQ09O
RklHX1VTRVJfTlM9eQpDT05GSUdfUElEX05TPXkKQ09ORklHX05FVF9OUz15CiMgQ09ORklHX0NI
RUNLUE9JTlRfUkVTVE9SRSBpcyBub3Qgc2V0CkNPTkZJR19TQ0hFRF9BVVRPR1JPVVA9eQojIENP
TkZJR19SRUxBWSBpcyBub3Qgc2V0CkNPTkZJR19CTEtfREVWX0lOSVRSRD15CkNPTkZJR19JTklU
UkFNRlNfU09VUkNFPSIiCkNPTkZJR19SRF9HWklQPXkKIyBDT05GSUdfUkRfQlpJUDIgaXMgbm90
IHNldAojIENPTkZJR19SRF9MWk1BIGlzIG5vdCBzZXQKIyBDT05GSUdfUkRfWFogaXMgbm90IHNl
dAojIENPTkZJR19SRF9MWk8gaXMgbm90IHNldAojIENPTkZJR19SRF9MWjQgaXMgbm90IHNldAoj
IENPTkZJR19SRF9aU1REIGlzIG5vdCBzZXQKIyBDT05GSUdfQk9PVF9DT05GSUcgaXMgbm90IHNl
dAojIENPTkZJR19JTklUUkFNRlNfUFJFU0VSVkVfTVRJTUUgaXMgbm90IHNldAojIENPTkZJR19D
Q19PUFRJTUlaRV9GT1JfUEVSRk9STUFOQ0UgaXMgbm90IHNldApDT05GSUdfQ0NfT1BUSU1JWkVf
Rk9SX1NJWkU9eQpDT05GSUdfSEFWRV9MRF9ERUFEX0NPREVfREFUQV9FTElNSU5BVElPTj15CiMg
Q09ORklHX0xEX0RFQURfQ09ERV9EQVRBX0VMSU1JTkFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0xE
X09SUEhBTl9XQVJOPXkKQ09ORklHX0xEX09SUEhBTl9XQVJOX0xFVkVMPSJ3YXJuIgpDT05GSUdf
U1lTQ1RMPXkKQ09ORklHX1NZU0NUTF9FWENFUFRJT05fVFJBQ0U9eQpDT05GSUdfRVhQRVJUPXkK
Q09ORklHX01VTFRJVVNFUj15CiMgQ09ORklHX1NHRVRNQVNLX1NZU0NBTEwgaXMgbm90IHNldAoj
IENPTkZJR19TWVNGU19TWVNDQUxMIGlzIG5vdCBzZXQKQ09ORklHX0ZIQU5ETEU9eQpDT05GSUdf
UE9TSVhfVElNRVJTPXkKQ09ORklHX1BSSU5USz15CkNPTkZJR19CVUc9eQpDT05GSUdfRUxGX0NP
UkU9eQpDT05GSUdfQkFTRV9TTUFMTD15CkNPTkZJR19GVVRFWD15CkNPTkZJR19GVVRFWF9QST15
CkNPTkZJR19FUE9MTD15CkNPTkZJR19TSUdOQUxGRD15CkNPTkZJR19USU1FUkZEPXkKQ09ORklH
X0VWRU5URkQ9eQpDT05GSUdfU0hNRU09eQpDT05GSUdfQUlPPXkKQ09ORklHX0lPX1VSSU5HPXkK
Q09ORklHX0FEVklTRV9TWVNDQUxMUz15CkNPTkZJR19NRU1CQVJSSUVSPXkKQ09ORklHX0tDTVA9
eQpDT05GSUdfUlNFUT15CiMgQ09ORklHX0RFQlVHX1JTRVEgaXMgbm90IHNldApDT05GSUdfQ0FD
SEVTVEFUX1NZU0NBTEw9eQojIENPTkZJR19QQzEwNCBpcyBub3Qgc2V0CkNPTkZJR19LQUxMU1lN
Uz15CiMgQ09ORklHX0tBTExTWU1TX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX0tBTExTWU1T
X0FMTD15CkNPTkZJR19BUkNIX0hBU19NRU1CQVJSSUVSX0NBTExCQUNLUz15CkNPTkZJR19BUkNI
X0hBU19NRU1CQVJSSUVSX1NZTkNfQ09SRT15CkNPTkZJR19IQVZFX1BFUkZfRVZFTlRTPXkKCiMK
IyBLZXJuZWwgUGVyZm9ybWFuY2UgRXZlbnRzIEFuZCBDb3VudGVycwojCkNPTkZJR19QRVJGX0VW
RU5UUz15CiMgZW5kIG9mIEtlcm5lbCBQZXJmb3JtYW5jZSBFdmVudHMgQW5kIENvdW50ZXJzCgpD
T05GSUdfU1lTVEVNX0RBVEFfVkVSSUZJQ0FUSU9OPXkKIyBDT05GSUdfUFJPRklMSU5HIGlzIG5v
dCBzZXQKCiMKIyBLZXhlYyBhbmQgY3Jhc2ggZmVhdHVyZXMKIwojIENPTkZJR19LRVhFQyBpcyBu
b3Qgc2V0CiMgZW5kIG9mIEtleGVjIGFuZCBjcmFzaCBmZWF0dXJlcwojIGVuZCBvZiBHZW5lcmFs
IHNldHVwCgpDT05GSUdfUFBDMzI9eQojIENPTkZJR19QUEM2NCBpcyBub3Qgc2V0CgojCiMgUHJv
Y2Vzc29yIHN1cHBvcnQKIwpDT05GSUdfUFBDX0JPT0szU18zMj15CiMgQ09ORklHX1BQQ184NXh4
IGlzIG5vdCBzZXQKIyBDT05GSUdfUFBDXzh4eCBpcyBub3Qgc2V0CiMgQ09ORklHXzQ0eCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BQQ19CT09LM1NfNjAzIGlzIG5vdCBzZXQKQ09ORklHX1BQQ19CT09L
M1NfNjA0PXkKIyBDT05GSUdfUE9XRVJQQ19DUFUgaXMgbm90IHNldAojIENPTkZJR19FMzAwQzJf
Q1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfRTMwMEMzX0NQVSBpcyBub3Qgc2V0CkNPTkZJR19HNF9D
UFU9eQojIENPTkZJR19UT09MQ0hBSU5fREVGQVVMVF9DUFUgaXMgbm90IHNldApDT05GSUdfVEFS
R0VUX0NQVV9CT09MPXkKQ09ORklHX1RBUkdFVF9DUFU9Ikc0IgpDT05GSUdfUFBDX0JPT0szUz15
CkNPTkZJR19QUENfRlBVX1JFR1M9eQpDT05GSUdfUFBDX0ZQVT15CkNPTkZJR19BTFRJVkVDPXkK
Q09ORklHX1BQQ19LVUVQPXkKQ09ORklHX1BQQ19LVUFQPXkKIyBDT05GSUdfUFBDX0tVQVBfREVC
VUcgaXMgbm90IHNldApDT05GSUdfUFBDX0hBVkVfUE1VX1NVUFBPUlQ9eQojIENPTkZJR19QTVVf
U1lTRlMgaXMgbm90IHNldApDT05GSUdfUFBDX1BFUkZfQ1RSUz15CkNPTkZJR19TTVA9eQpDT05G
SUdfTlJfQ1BVUz0yCiMgZW5kIG9mIFByb2Nlc3NvciBzdXBwb3J0CgpDT05GSUdfVkRTTzMyPXkK
Q09ORklHX0NQVV9CSUdfRU5ESUFOPXkKQ09ORklHXzMyQklUPXkKQ09ORklHX01NVT15CkNPTkZJ
R19BUkNIX01NQVBfUk5EX0JJVFNfTUFYPTE3CkNPTkZJR19BUkNIX01NQVBfUk5EX0JJVFNfTUlO
PTExCkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTX01BWD0xNwpDT05GSUdfQVJDSF9N
TUFQX1JORF9DT01QQVRfQklUU19NSU49MTEKQ09ORklHX05SX0lSUVM9NTEyCkNPTkZJR19OTUlf
SVBJPXkKQ09ORklHX1NUQUNLVFJBQ0VfU1VQUE9SVD15CkNPTkZJR19MT0NLREVQX1NVUFBPUlQ9
eQpDT05GSUdfR0VORVJJQ19IV0VJR0hUPXkKQ09ORklHX1BQQz15CkNPTkZJR19FQVJMWV9QUklO
VEs9eQpDT05GSUdfUEFOSUNfVElNRU9VVD00MApDT05GSUdfU0NIRURfT01JVF9GUkFNRV9QT0lO
VEVSPXkKQ09ORklHX0FSQ0hfTUFZX0hBVkVfUENfRkRDPXkKQ09ORklHX0dFTkVSSUNfVEJTWU5D
PXkKQ09ORklHX0FVRElUX0FSQ0g9eQpDT05GSUdfR0VORVJJQ19CVUc9eQpDT05GSUdfR0VORVJJ
Q19CVUdfUkVMQVRJVkVfUE9JTlRFUlM9eQpDT05GSUdfU1lTX1NVUFBPUlRTX0FQTV9FTVVMQVRJ
T049eQpDT05GSUdfQVJDSF9ISUJFUk5BVElPTl9QT1NTSUJMRT15CkNPTkZJR19BUkNIX1NVU1BF
TkRfUE9TU0lCTEU9eQpDT05GSUdfQVJDSF9IQVNfQUREX1BBR0VTPXkKIyBDT05GSUdfUFBDX1BD
SV9PRl9CVVNfTUFQIGlzIG5vdCBzZXQKQ09ORklHX1BQQ19QQ0lfQlVTX05VTV9ET01BSU5fREVQ
RU5ERU5UPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfVVBST0JFUz15CkNPTkZJR19QR1RBQkxFX0xF
VkVMUz0yCkNPTkZJR19QUENfTVNJX0JJVE1BUD15CgojCiMgUGxhdGZvcm0gc3VwcG9ydAojCiMg
Q09ORklHX1NDT01fREVCVUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BQQ19DSFJQIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUFBDX01QQzUxMnggaXMgbm90IHNldAojIENPTkZJR19QUENfTVBDNTJ4eCBp
cyBub3Qgc2V0CkNPTkZJR19QUENfUE1BQz15CkNPTkZJR19QUENfUE1BQzMyX1BTVVJHRT15CiMg
Q09ORklHX1BQQ184Mnh4IGlzIG5vdCBzZXQKIyBDT05GSUdfUFBDXzgzeHggaXMgbm90IHNldAoj
IENPTkZJR19QUENfODZ4eCBpcyBub3Qgc2V0CkNPTkZJR19LVk1fR1VFU1Q9eQpDT05GSUdfRVBB
UFJfUEFSQVZJUlQ9eQpDT05GSUdfUFBDX0hBU0hfTU1VX05BVElWRT15CkNPTkZJR19QUENfT0Zf
Qk9PVF9UUkFNUE9MSU5FPXkKQ09ORklHX1BQQ19TTVBfTVVYRURfSVBJPXkKQ09ORklHX01QSUM9
eQpDT05GSUdfTVBJQ19NU0dSPXkKQ09ORklHX1BQQ19NUEMxMDY9eQoKIwojIENQVSBGcmVxdWVu
Y3kgc2NhbGluZwojCkNPTkZJR19DUFVfRlJFUT15CkNPTkZJR19DUFVfRlJFUV9HT1ZfQVRUUl9T
RVQ9eQpDT05GSUdfQ1BVX0ZSRVFfR09WX0NPTU1PTj15CiMgQ09ORklHX0NQVV9GUkVRX1NUQVQg
aXMgbm90IHNldAojIENPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9QRVJGT1JNQU5DRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX1BPV0VSU0FWRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX1VTRVJTUEFDRSBpcyBub3Qgc2V0CkNPTkZJ
R19DUFVfRlJFUV9ERUZBVUxUX0dPVl9PTkRFTUFORD15CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFV
TFRfR09WX0NPTlNFUlZBVElWRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRf
R09WX1NDSEVEVVRJTCBpcyBub3Qgc2V0CkNPTkZJR19DUFVfRlJFUV9HT1ZfUEVSRk9STUFOQ0U9
eQojIENPTkZJR19DUFVfRlJFUV9HT1ZfUE9XRVJTQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BV
X0ZSRVFfR09WX1VTRVJTUEFDRSBpcyBub3Qgc2V0CkNPTkZJR19DUFVfRlJFUV9HT1ZfT05ERU1B
TkQ9eQojIENPTkZJR19DUFVfRlJFUV9HT1ZfQ09OU0VSVkFUSVZFIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1BVX0ZSRVFfR09WX1NDSEVEVVRJTCBpcyBub3Qgc2V0CgojCiMgQ1BVIGZyZXF1ZW5jeSBz
Y2FsaW5nIGRyaXZlcnMKIwojIENPTkZJR19DUFVGUkVRX0RUX1BMQVRERVYgaXMgbm90IHNldApD
T05GSUdfQ1BVX0ZSRVFfUE1BQz15CiMgZW5kIG9mIENQVSBGcmVxdWVuY3kgc2NhbGluZwoKIwoj
IENQVUlkbGUgZHJpdmVyCiMKCiMKIyBDUFUgSWRsZQojCiMgQ09ORklHX0NQVV9JRExFIGlzIG5v
dCBzZXQKIyBlbmQgb2YgQ1BVIElkbGUKIyBlbmQgb2YgQ1BVSWRsZSBkcml2ZXIKCkNPTkZJR19U
QVU9eQojIENPTkZJR19UQVVfSU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfVEFVX0FWRVJBR0UgaXMg
bm90IHNldAojIENPTkZJR19HRU5fUlRDIGlzIG5vdCBzZXQKIyBlbmQgb2YgUGxhdGZvcm0gc3Vw
cG9ydAoKIwojIEtlcm5lbCBvcHRpb25zCiMKQ09ORklHX0hJR0hNRU09eQojIENPTkZJR19IWl8x
MDAgaXMgbm90IHNldAojIENPTkZJR19IWl8yNTAgaXMgbm90IHNldApDT05GSUdfSFpfMzAwPXkK
IyBDT05GSUdfSFpfMTAwMCBpcyBub3Qgc2V0CkNPTkZJR19IWj0zMDAKQ09ORklHX1NDSEVEX0hS
VElDSz15CkNPTkZJR19IT1RQTFVHX0NQVT15CiMgQ09ORklHX1BQQ19RVUVVRURfU1BJTkxPQ0tT
IGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfQ1BVX1BST0JFX1JFTEVBU0U9eQpDT05GSUdfQVJDSF9T
VVBQT1JUU19LRVhFQz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0tFWEVDX1BVUkdBVE9SWT15CkNP
TkZJR19BUkNIX1NVUFBPUlRTX0NSQVNIX0RVTVA9eQpDT05GSUdfSVJRX0FMTF9DUFVTPXkKQ09O
RklHX0FSQ0hfRkxBVE1FTV9FTkFCTEU9eQpDT05GSUdfSUxMRUdBTF9QT0lOVEVSX1ZBTFVFPTAK
Q09ORklHX1BQQ180S19QQUdFUz15CkNPTkZJR19USFJFQURfU0hJRlQ9MTMKQ09ORklHX0RBVEFf
U0hJRlQ9MjIKQ09ORklHX0FSQ0hfRk9SQ0VfTUFYX09SREVSPTEwCkNPTkZJR19DTURMSU5FPSIi
CkNPTkZJR19FWFRSQV9UQVJHRVRTPSIiCkNPTkZJR19BUkNIX1dBTlRTX0ZSRUVaRVJfQ09OVFJP
TD15CiMgQ09ORklHX1NVU1BFTkQgaXMgbm90IHNldAojIENPTkZJR19ISUJFUk5BVElPTiBpcyBu
b3Qgc2V0CkNPTkZJR19QTT15CiMgQ09ORklHX1BNX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0FQ
TV9FTVVMQVRJT049bQpDT05GSUdfV1FfUE9XRVJfRUZGSUNJRU5UX0RFRkFVTFQ9eQojIENPTkZJ
R19FTkVSR1lfTU9ERUwgaXMgbm90IHNldAojIGVuZCBvZiBLZXJuZWwgb3B0aW9ucwoKQ09ORklH
X0lTQV9ETUFfQVBJPXkKCiMKIyBCdXMgb3B0aW9ucwojCkNPTkZJR19HRU5FUklDX0lTQV9ETUE9
eQpDT05GSUdfUFBDX0lORElSRUNUX1BDST15CiMgQ09ORklHX0ZTTF9MQkMgaXMgbm90IHNldAoj
IGVuZCBvZiBCdXMgb3B0aW9ucwoKIwojIEFkdmFuY2VkIHNldHVwCiMKIyBDT05GSUdfQURWQU5D
RURfT1BUSU9OUyBpcyBub3Qgc2V0CgojCiMgRGVmYXVsdCBzZXR0aW5ncyBmb3IgYWR2YW5jZWQg
Y29uZmlndXJhdGlvbiBvcHRpb25zIGFyZSB1c2VkCiMKQ09ORklHX0xPV01FTV9TSVpFPTB4MzAw
MDAwMDAKQ09ORklHX1BBR0VfT0ZGU0VUPTB4YzAwMDAwMDAKQ09ORklHX0tFUk5FTF9TVEFSVD0w
eGMwMDAwMDAwCkNPTkZJR19QSFlTSUNBTF9TVEFSVD0weDAwMDAwMDAwCkNPTkZJR19UQVNLX1NJ
WkU9MHhiMDAwMDAwMAojIGVuZCBvZiBBZHZhbmNlZCBzZXR1cAoKIyBDT05GSUdfVklSVFVBTEla
QVRJT04gaXMgbm90IHNldApDT05GSUdfSEFWRV9MSVZFUEFUQ0g9eQpDT05GSUdfQ1BVX01JVElH
QVRJT05TPXkKCiMKIyBHZW5lcmFsIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucwojCkNP
TkZJR19IT1RQTFVHX1NNVD15CkNPTkZJR19TTVRfTlVNX1RIUkVBRFNfRFlOQU1JQz15CiMgQ09O
RklHX0tQUk9CRVMgaXMgbm90IHNldApDT05GSUdfSlVNUF9MQUJFTD15CiMgQ09ORklHX1NUQVRJ
Q19LRVlTX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RBVElDX0NBTExfU0VMRlRFU1Qg
aXMgbm90IHNldApDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUz15CkNPTkZJ
R19BUkNIX1VTRV9CVUlMVElOX0JTV0FQPXkKQ09ORklHX0hBVkVfSU9SRU1BUF9QUk9UPXkKQ09O
RklHX0hBVkVfS1BST0JFUz15CkNPTkZJR19IQVZFX0tSRVRQUk9CRVM9eQpDT05GSUdfSEFWRV9P
UFRQUk9CRVM9eQpDT05GSUdfSEFWRV9LUFJPQkVTX09OX0ZUUkFDRT15CkNPTkZJR19IQVZFX0ZV
TkNUSU9OX0VSUk9SX0lOSkVDVElPTj15CkNPTkZJR19IQVZFX05NST15CkNPTkZJR19UUkFDRV9J
UlFGTEFHU19TVVBQT1JUPXkKQ09ORklHX0hBVkVfQVJDSF9UUkFDRUhPT0s9eQpDT05GSUdfR0VO
RVJJQ19TTVBfSURMRV9USFJFQUQ9eQpDT05GSUdfR0VORVJJQ19JRExFX1BPTExfU0VUVVA9eQpD
T05GSUdfQVJDSF9IQVNfRk9SVElGWV9TT1VSQ0U9eQpDT05GSUdfQVJDSF9IQVNfU0VUX01FTU9S
WT15CkNPTkZJR19BUkNIXzMyQklUX09GRl9UPXkKQ09ORklHX0hBVkVfQVNNX01PRFZFUlNJT05T
PXkKQ09ORklHX0hBVkVfUkVHU19BTkRfU1RBQ0tfQUNDRVNTX0FQST15CkNPTkZJR19IQVZFX1JT
RVE9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9BUkdfQUNDRVNTX0FQST15CkNPTkZJR19IQVZFX0hX
X0JSRUFLUE9JTlQ9eQpDT05GSUdfSEFWRV9QRVJGX1JFR1M9eQpDT05GSUdfSEFWRV9QRVJGX1VT
RVJfU1RBQ0tfRFVNUD15CkNPTkZJR19IQVZFX0FSQ0hfSlVNUF9MQUJFTD15CkNPTkZJR19IQVZF
X0FSQ0hfSlVNUF9MQUJFTF9SRUxBVElWRT15CkNPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZSRUU9
eQpDT05GSUdfTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRT15CkNPTkZJR19NTVVfR0FUSEVSX1BB
R0VfU0laRT15CkNPTkZJR19NTVVfR0FUSEVSX01FUkdFX1ZNQVM9eQpDT05GSUdfQVJDSF9XQU5U
X0lSUVNfT0ZGX0FDVElWQVRFX01NPXkKQ09ORklHX01NVV9MQVpZX1RMQl9SRUZDT1VOVD15CkNP
TkZJR19BUkNIX0hBVkVfTk1JX1NBRkVfQ01QWENIRz15CkNPTkZJR19BUkNIX1dFQUtfUkVMRUFT
RV9BQ1FVSVJFPXkKQ09ORklHX0FSQ0hfV0FOVF9JUENfUEFSU0VfVkVSU0lPTj15CkNPTkZJR19I
QVZFX0FSQ0hfU0VDQ09NUD15CkNPTkZJR19IQVZFX0FSQ0hfU0VDQ09NUF9GSUxURVI9eQpDT05G
SUdfU0VDQ09NUD15CkNPTkZJR19TRUNDT01QX0ZJTFRFUj15CiMgQ09ORklHX1NFQ0NPTVBfQ0FD
SEVfREVCVUcgaXMgbm90IHNldApDT05GSUdfSEFWRV9TVEFDS1BST1RFQ1RPUj15CkNPTkZJR19T
VEFDS1BST1RFQ1RPUj15CiMgQ09ORklHX1NUQUNLUFJPVEVDVE9SX1NUUk9ORyBpcyBub3Qgc2V0
CkNPTkZJR19MVE9fTk9ORT15CkNPTkZJR19IQVZFX0FSQ0hfV0lUSElOX1NUQUNLX0ZSQU1FUz15
CkNPTkZJR19IQVZFX0NPTlRFWFRfVFJBQ0tJTkdfVVNFUj15CkNPTkZJR19IQVZFX1ZJUlRfQ1BV
X0FDQ09VTlRJTkc9eQpDT05GSUdfSEFWRV9WSVJUX0NQVV9BQ0NPVU5USU5HX0dFTj15CkNPTkZJ
R19IQVZFX0lSUV9USU1FX0FDQ09VTlRJTkc9eQpDT05GSUdfSEFWRV9NT0RfQVJDSF9TUEVDSUZJ
Qz15CkNPTkZJR19NT0RVTEVTX1VTRV9FTEZfUkVMQT15CkNPTkZJR19BUkNIX1dBTlRTX01PRFVM
RVNfREFUQV9JTl9WTUFMTE9DPXkKQ09ORklHX0hBVkVfU09GVElSUV9PTl9PV05fU1RBQ0s9eQpD
T05GSUdfU09GVElSUV9PTl9PV05fU1RBQ0s9eQpDT05GSUdfQVJDSF9IQVNfRUxGX1JBTkRPTUla
RT15CkNPTkZJR19IQVZFX0FSQ0hfTU1BUF9STkRfQklUUz15CkNPTkZJR19BUkNIX01NQVBfUk5E
X0JJVFM9MTEKQ09ORklHX0hBVkVfUEFHRV9TSVpFXzRLQj15CkNPTkZJR19QQUdFX1NJWkVfNEtC
PXkKQ09ORklHX1BBR0VfU0laRV9MRVNTX1RIQU5fNjRLQj15CkNPTkZJR19QQUdFX1NJWkVfTEVT
U19USEFOXzI1NktCPXkKQ09ORklHX1BBR0VfU0hJRlQ9MTIKQ09ORklHX0FSQ0hfV0FOVF9ERUZB
VUxUX1RPUERPV05fTU1BUF9MQVlPVVQ9eQpDT05GSUdfSEFWRV9PQkpUT09MPXkKQ09ORklHX0hB
VkVfUkVMSUFCTEVfU1RBQ0tUUkFDRT15CkNPTkZJR19IQVZFX0FSQ0hfTlZSQU1fT1BTPXkKQ09O
RklHX0NMT05FX0JBQ0tXQVJEUz15CkNPTkZJR19PTERfU0lHU1VTUEVORD15CkNPTkZJR19PTERf
U0lHQUNUSU9OPXkKQ09ORklHX0NPTVBBVF8zMkJJVF9USU1FPXkKQ09ORklHX0hBVkVfQVJDSF9W
TUFQX1NUQUNLPXkKIyBDT05GSUdfVk1BUF9TVEFDSyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FS
Q0hfUkFORE9NSVpFX0tTVEFDS19PRkZTRVQ9eQpDT05GSUdfUkFORE9NSVpFX0tTVEFDS19PRkZT
RVQ9eQpDT05GSUdfUkFORE9NSVpFX0tTVEFDS19PRkZTRVRfREVGQVVMVD15CkNPTkZJR19BUkNI
X09QVElPTkFMX0tFUk5FTF9SV1g9eQpDT05GSUdfQVJDSF9PUFRJT05BTF9LRVJORUxfUldYX0RF
RkFVTFQ9eQpDT05GSUdfQVJDSF9IQVNfU1RSSUNUX0tFUk5FTF9SV1g9eQpDT05GSUdfU1RSSUNU
X0tFUk5FTF9SV1g9eQpDT05GSUdfQVJDSF9IQVNfU1RSSUNUX01PRFVMRV9SV1g9eQojIENPTkZJ
R19TVFJJQ1RfTU9EVUxFX1JXWCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19QSFlTX1RPX0RN
QT15CiMgQ09ORklHX0xPQ0tfRVZFTlRfQ09VTlRTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfU1RB
VElDX0NBTEw9eQpDT05GSUdfQVJDSF9XQU5UX0xEX09SUEhBTl9XQVJOPXkKQ09ORklHX0FSQ0hf
U1VQUE9SVFNfREVCVUdfUEFHRUFMTE9DPXkKQ09ORklHX0FSQ0hfU1BMSVRfQVJHNjQ9eQoKIwoj
IEdDT1YtYmFzZWQga2VybmVsIHByb2ZpbGluZwojCiMgQ09ORklHX0dDT1ZfS0VSTkVMIGlzIG5v
dCBzZXQKQ09ORklHX0FSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEw9eQojIGVuZCBvZiBHQ09WLWJh
c2VkIGtlcm5lbCBwcm9maWxpbmcKCkNPTkZJR19IQVZFX0dDQ19QTFVHSU5TPXkKQ09ORklHX0dD
Q19QTFVHSU5TPXkKQ09ORklHX0dDQ19QTFVHSU5fTEFURU5UX0VOVFJPUFk9eQpDT05GSUdfRlVO
Q1RJT05fQUxJR05NRU5UXzRCPXkKQ09ORklHX0ZVTkNUSU9OX0FMSUdOTUVOVD00CkNPTkZJR19D
Q19IQVNfTUlOX0ZVTkNUSU9OX0FMSUdOTUVOVD15CkNPTkZJR19DQ19IQVNfU0FORV9GVU5DVElP
Tl9BTElHTk1FTlQ9eQojIGVuZCBvZiBHZW5lcmFsIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0
aW9ucwoKQ09ORklHX1JUX01VVEVYRVM9eQpDT05GSUdfTU9EVUxFUz15CiMgQ09ORklHX01PRFVM
RV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9GT1JDRV9MT0FEIGlzIG5vdCBzZXQK
Q09ORklHX01PRFVMRV9VTkxPQUQ9eQpDT05GSUdfTU9EVUxFX0ZPUkNFX1VOTE9BRD15CiMgQ09O
RklHX01PRFVMRV9VTkxPQURfVEFJTlRfVFJBQ0tJTkcgaXMgbm90IHNldAojIENPTkZJR19NT0RW
RVJTSU9OUyBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9TUkNWRVJTSU9OX0FMTCBpcyBub3Qg
c2V0CiMgQ09ORklHX01PRFVMRV9TSUcgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX0NPTVBSRVNT
X05PTkU9eQojIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfR1pJUCBpcyBub3Qgc2V0CiMgQ09ORklH
X01PRFVMRV9DT01QUkVTU19YWiBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19a
U1REIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX0FMTE9XX01JU1NJTkdfTkFNRVNQQUNFX0lN
UE9SVFMgaXMgbm90IHNldApDT05GSUdfTU9EUFJPQkVfUEFUSD0iL3NiaW4vbW9kcHJvYmUiCiMg
Q09ORklHX1RSSU1fVU5VU0VEX0tTWU1TIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRVNfVFJFRV9M
T09LVVA9eQpDT05GSUdfQkxPQ0s9eQpDT05GSUdfQkxPQ0tfTEVHQUNZX0FVVE9MT0FEPXkKQ09O
RklHX0JMS19DR1JPVVBfUldTVEFUPXkKQ09ORklHX0JMS19DR1JPVVBfUFVOVF9CSU89eQpDT05G
SUdfQkxLX0RFVl9CU0dfQ09NTU9OPXkKQ09ORklHX0JMS19JQ1E9eQojIENPTkZJR19CTEtfREVW
X0JTR0xJQiBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfSU5URUdSSVRZIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkxLX0RFVl9XUklURV9NT1VOVEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RF
Vl9aT05FRCBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfVEhST1RUTElORyBpcyBub3Qgc2V0
CkNPTkZJR19CTEtfV0JUPXkKQ09ORklHX0JMS19XQlRfTVE9eQojIENPTkZJR19CTEtfQ0dST1VQ
X0lPTEFURU5DWSBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19DR1JPVVBfSU9DT1NUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQkxLX0NHUk9VUF9JT1BSSU8gaXMgbm90IHNldApDT05GSUdfQkxLX0RFQlVH
X0ZTPXkKIyBDT05GSUdfQkxLX1NFRF9PUEFMIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0lOTElO
RV9FTkNSWVBUSU9OIGlzIG5vdCBzZXQKCiMKIyBQYXJ0aXRpb24gVHlwZXMKIwpDT05GSUdfUEFS
VElUSU9OX0FEVkFOQ0VEPXkKIyBDT05GSUdfQUNPUk5fUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBD
T05GSUdfQUlYX1BBUlRJVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX09TRl9QQVJUSVRJT04gaXMg
bm90IHNldApDT05GSUdfQU1JR0FfUEFSVElUSU9OPXkKIyBDT05GSUdfQVRBUklfUEFSVElUSU9O
IGlzIG5vdCBzZXQKQ09ORklHX01BQ19QQVJUSVRJT049eQpDT05GSUdfTVNET1NfUEFSVElUSU9O
PXkKQ09ORklHX0JTRF9ESVNLTEFCRUw9eQojIENPTkZJR19NSU5JWF9TVUJQQVJUSVRJT04gaXMg
bm90IHNldAojIENPTkZJR19TT0xBUklTX1g4Nl9QQVJUSVRJT04gaXMgbm90IHNldAojIENPTkZJ
R19VTklYV0FSRV9ESVNLTEFCRUwgaXMgbm90IHNldApDT05GSUdfTERNX1BBUlRJVElPTj15CiMg
Q09ORklHX0xETV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NHSV9QQVJUSVRJT04gaXMgbm90
IHNldAojIENPTkZJR19VTFRSSVhfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfU1VOX1BB
UlRJVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0tBUk1BX1BBUlRJVElPTiBpcyBub3Qgc2V0CkNP
TkZJR19FRklfUEFSVElUSU9OPXkKIyBDT05GSUdfU1lTVjY4X1BBUlRJVElPTiBpcyBub3Qgc2V0
CiMgQ09ORklHX0NNRExJTkVfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBlbmQgb2YgUGFydGl0aW9u
IFR5cGVzCgpDT05GSUdfQkxLX01RX1BDST15CkNPTkZJR19CTEtfTVFfVklSVElPPXkKQ09ORklH
X0JMS19QTT15CkNPTkZJR19CTE9DS19IT0xERVJfREVQUkVDQVRFRD15CkNPTkZJR19CTEtfTVFf
U1RBQ0tJTkc9eQoKIwojIElPIFNjaGVkdWxlcnMKIwojIENPTkZJR19NUV9JT1NDSEVEX0RFQURM
SU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfTVFfSU9TQ0hFRF9LWUJFUiBpcyBub3Qgc2V0CkNPTkZJ
R19JT1NDSEVEX0JGUT15CkNPTkZJR19CRlFfR1JPVVBfSU9TQ0hFRD15CiMgQ09ORklHX0JGUV9D
R1JPVVBfREVCVUcgaXMgbm90IHNldAojIGVuZCBvZiBJTyBTY2hlZHVsZXJzCgpDT05GSUdfUEFE
QVRBPXkKQ09ORklHX0FTTjE9eQpDT05GSUdfVU5JTkxJTkVfU1BJTl9VTkxPQ0s9eQpDT05GSUdf
QVJDSF9TVVBQT1JUU19BVE9NSUNfUk1XPXkKQ09ORklHX01VVEVYX1NQSU5fT05fT1dORVI9eQpD
T05GSUdfUldTRU1fU1BJTl9PTl9PV05FUj15CkNPTkZJR19MT0NLX1NQSU5fT05fT1dORVI9eQpD
T05GSUdfQVJDSF9IQVNfTk9OX09WRVJMQVBQSU5HX0FERFJFU1NfU1BBQ0U9eQpDT05GSUdfQVJD
SF9IQVNfU1lTQ0FMTF9XUkFQUEVSPXkKQ09ORklHX0ZSRUVaRVI9eQoKIwojIEV4ZWN1dGFibGUg
ZmlsZSBmb3JtYXRzCiMKQ09ORklHX0JJTkZNVF9FTEY9eQpDT05GSUdfRUxGQ09SRT15CkNPTkZJ
R19DT1JFX0RVTVBfREVGQVVMVF9FTEZfSEVBREVSUz15CkNPTkZJR19CSU5GTVRfU0NSSVBUPXkK
Q09ORklHX0JJTkZNVF9NSVNDPXkKQ09ORklHX0NPUkVEVU1QPXkKIyBlbmQgb2YgRXhlY3V0YWJs
ZSBmaWxlIGZvcm1hdHMKCiMKIyBNZW1vcnkgTWFuYWdlbWVudCBvcHRpb25zCiMKQ09ORklHX1pQ
T09MPXkKQ09ORklHX1NXQVA9eQpDT05GSUdfWlNXQVA9eQpDT05GSUdfWlNXQVBfREVGQVVMVF9P
Tj15CkNPTkZJR19aU1dBUF9TSFJJTktFUl9ERUZBVUxUX09OPXkKIyBDT05GSUdfWlNXQVBfQ09N
UFJFU1NPUl9ERUZBVUxUX0RFRkxBVEUgaXMgbm90IHNldApDT05GSUdfWlNXQVBfQ09NUFJFU1NP
Ul9ERUZBVUxUX0xaTz15CiMgQ09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVF84NDIgaXMg
bm90IHNldAojIENPTkZJR19aU1dBUF9DT01QUkVTU09SX0RFRkFVTFRfTFo0IGlzIG5vdCBzZXQK
IyBDT05GSUdfWlNXQVBfQ09NUFJFU1NPUl9ERUZBVUxUX0xaNEhDIGlzIG5vdCBzZXQKIyBDT05G
SUdfWlNXQVBfQ09NUFJFU1NPUl9ERUZBVUxUX1pTVEQgaXMgbm90IHNldApDT05GSUdfWlNXQVBf
Q09NUFJFU1NPUl9ERUZBVUxUPSJsem8iCiMgQ09ORklHX1pTV0FQX1pQT09MX0RFRkFVTFRfWkJV
RCBpcyBub3Qgc2V0CiMgQ09ORklHX1pTV0FQX1pQT09MX0RFRkFVTFRfWjNGT0xEIGlzIG5vdCBz
ZXQKQ09ORklHX1pTV0FQX1pQT09MX0RFRkFVTFRfWlNNQUxMT0M9eQpDT05GSUdfWlNXQVBfWlBP
T0xfREVGQVVMVD0ienNtYWxsb2MiCiMgQ09ORklHX1pCVUQgaXMgbm90IHNldAojIENPTkZJR19a
M0ZPTEQgaXMgbm90IHNldApDT05GSUdfSEFWRV9aU01BTExPQz15CkNPTkZJR19aU01BTExPQz15
CiMgQ09ORklHX1pTTUFMTE9DX1NUQVQgaXMgbm90IHNldApDT05GSUdfWlNNQUxMT0NfQ0hBSU5f
U0laRT04CgojCiMgU2xhYiBhbGxvY2F0b3Igb3B0aW9ucwojCkNPTkZJR19TTFVCPXkKIyBDT05G
SUdfU0xVQl9USU5ZIGlzIG5vdCBzZXQKQ09ORklHX1NMQUJfTUVSR0VfREVGQVVMVD15CkNPTkZJ
R19TTEFCX0ZSRUVMSVNUX1JBTkRPTT15CkNPTkZJR19TTEFCX0ZSRUVMSVNUX0hBUkRFTkVEPXkK
Q09ORklHX1NMQUJfQlVDS0VUUz15CiMgQ09ORklHX1NMVUJfU1RBVFMgaXMgbm90IHNldAojIENP
TkZJR19TTFVCX0NQVV9QQVJUSUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFORE9NX0tNQUxMT0Nf
Q0FDSEVTIGlzIG5vdCBzZXQKIyBlbmQgb2YgU2xhYiBhbGxvY2F0b3Igb3B0aW9ucwoKQ09ORklH
X1NIVUZGTEVfUEFHRV9BTExPQ0FUT1I9eQojIENPTkZJR19DT01QQVRfQlJLIGlzIG5vdCBzZXQK
Q09ORklHX0ZMQVRNRU09eQpDT05GSUdfSEFWRV9HVVBfRkFTVD15CkNPTkZJR19BUkNIX0tFRVBf
TUVNQkxPQ0s9eQpDT05GSUdfRVhDTFVTSVZFX1NZU1RFTV9SQU09eQpDT05GSUdfQVJDSF9FTkFC
TEVfTUVNT1JZX0hPVFBMVUc9eQpDT05GSUdfQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFJFTU9WRT15
CkNPTkZJR19TUExJVF9QVExPQ0tfQ1BVUz00CkNPTkZJR19DT01QQUNUSU9OPXkKQ09ORklHX0NP
TVBBQ1RfVU5FVklDVEFCTEVfREVGQVVMVD0xCkNPTkZJR19QQUdFX1JFUE9SVElORz15CkNPTkZJ
R19NSUdSQVRJT049eQpDT05GSUdfUENQX0JBVENIX1NDQUxFX01BWD01CkNPTkZJR19CT1VOQ0U9
eQpDT05GSUdfTU1VX05PVElGSUVSPXkKQ09ORklHX0tTTT15CkNPTkZJR19ERUZBVUxUX01NQVBf
TUlOX0FERFI9MTYzODQKIyBDT05GSUdfQ01BIGlzIG5vdCBzZXQKQ09ORklHX0dFTkVSSUNfRUFS
TFlfSU9SRU1BUD15CiMgQ09ORklHX0lETEVfUEFHRV9UUkFDS0lORyBpcyBub3Qgc2V0CkNPTkZJ
R19BUkNIX0hBU19DVVJSRU5UX1NUQUNLX1BPSU5URVI9eQpDT05GSUdfWk9ORV9ETUE9eQpDT05G
SUdfVk1fRVZFTlRfQ09VTlRFUlM9eQojIENPTkZJR19QRVJDUFVfU1RBVFMgaXMgbm90IHNldAoj
IENPTkZJR19HVVBfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQVBPT0xfVEVTVCBpcyBub3Qg
c2V0CkNPTkZJR19BUkNIX0hBU19QVEVfU1BFQ0lBTD15CkNPTkZJR19LTUFQX0xPQ0FMPXkKQ09O
RklHX01FTUZEX0NSRUFURT15CiMgQ09ORklHX0FOT05fVk1BX05BTUUgaXMgbm90IHNldApDT05G
SUdfVVNFUkZBVUxURkQ9eQpDT05GSUdfTFJVX0dFTj15CkNPTkZJR19MUlVfR0VOX0VOQUJMRUQ9
eQojIENPTkZJR19MUlVfR0VOX1NUQVRTIGlzIG5vdCBzZXQKQ09ORklHX0xPQ0tfTU1fQU5EX0ZJ
TkRfVk1BPXkKQ09ORklHX0VYRUNNRU09eQoKIwojIERhdGEgQWNjZXNzIE1vbml0b3JpbmcKIwoj
IENPTkZJR19EQU1PTiBpcyBub3Qgc2V0CiMgZW5kIG9mIERhdGEgQWNjZXNzIE1vbml0b3JpbmcK
IyBlbmQgb2YgTWVtb3J5IE1hbmFnZW1lbnQgb3B0aW9ucwoKQ09ORklHX05FVD15CkNPTkZJR19O
RVRfSU5HUkVTUz15CkNPTkZJR19ORVRfRUdSRVNTPXkKQ09ORklHX05FVF9YR1JFU1M9eQpDT05G
SUdfU0tCX0RFQ1JZUFRFRD15CkNPTkZJR19TS0JfRVhURU5TSU9OUz15CgojCiMgTmV0d29ya2lu
ZyBvcHRpb25zCiMKQ09ORklHX1BBQ0tFVD1tCkNPTkZJR19QQUNLRVRfRElBRz1tCkNPTkZJR19V
TklYPXkKQ09ORklHX0FGX1VOSVhfT09CPXkKQ09ORklHX1VOSVhfRElBRz1tCkNPTkZJR19UTFM9
bQpDT05GSUdfVExTX0RFVklDRT15CiMgQ09ORklHX1RMU19UT0UgaXMgbm90IHNldApDT05GSUdf
WEZSTT15CkNPTkZJR19YRlJNX0FMR089bQpDT05GSUdfWEZSTV9VU0VSPW0KIyBDT05GSUdfWEZS
TV9JTlRFUkZBQ0UgaXMgbm90IHNldAojIENPTkZJR19YRlJNX1NVQl9QT0xJQ1kgaXMgbm90IHNl
dAojIENPTkZJR19YRlJNX01JR1JBVEUgaXMgbm90IHNldAojIENPTkZJR19YRlJNX1NUQVRJU1RJ
Q1MgaXMgbm90IHNldApDT05GSUdfWEZSTV9BSD1tCkNPTkZJR19YRlJNX0VTUD1tCkNPTkZJR19Y
RlJNX0lQQ09NUD1tCkNPTkZJR19ORVRfS0VZPW0KIyBDT05GSUdfTkVUX0tFWV9NSUdSQVRFIGlz
IG5vdCBzZXQKIyBDT05GSUdfWERQX1NPQ0tFVFMgaXMgbm90IHNldApDT05GSUdfTkVUX0hBTkRT
SEFLRT15CiMgQ09ORklHX05FVF9IQU5EU0hBS0VfS1VOSVRfVEVTVCBpcyBub3Qgc2V0CkNPTkZJ
R19JTkVUPXkKIyBDT05GSUdfSVBfTVVMVElDQVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfQURW
QU5DRURfUk9VVEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfUE5QIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX0lQSVAgaXMgbm90IHNldAojIENPTkZJR19ORVRfSVBHUkVfREVNVVggaXMgbm90IHNl
dApDT05GSUdfTkVUX0lQX1RVTk5FTD1tCkNPTkZJR19TWU5fQ09PS0lFUz15CiMgQ09ORklHX05F
VF9JUFZUSSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVURQX1RVTk5FTD1tCiMgQ09ORklHX05FVF9G
T1UgaXMgbm90IHNldApDT05GSUdfSU5FVF9BSD1tCkNPTkZJR19JTkVUX0VTUD1tCiMgQ09ORklH
X0lORVRfRVNQX09GRkxPQUQgaXMgbm90IHNldAojIENPTkZJR19JTkVUX0VTUElOVENQIGlzIG5v
dCBzZXQKQ09ORklHX0lORVRfSVBDT01QPW0KQ09ORklHX0lORVRfVEFCTEVfUEVSVFVSQl9PUkRF
Uj0xNgpDT05GSUdfSU5FVF9YRlJNX1RVTk5FTD1tCkNPTkZJR19JTkVUX1RVTk5FTD1tCiMgQ09O
RklHX0lORVRfRElBRyBpcyBub3Qgc2V0CkNPTkZJR19UQ1BfQ09OR19BRFZBTkNFRD15CiMgQ09O
RklHX1RDUF9DT05HX0JJQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0NVQklDIGlzIG5v
dCBzZXQKQ09ORklHX1RDUF9DT05HX1dFU1RXT09EPXkKIyBDT05GSUdfVENQX0NPTkdfSFRDUCBp
cyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0hTVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQ
X0NPTkdfSFlCTEEgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19WRUdBUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1RDUF9DT05HX05WIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfU0NBTEFC
TEUgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19MUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RD
UF9DT05HX1ZFTk8gaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19ZRUFIIGlzIG5vdCBzZXQK
IyBDT05GSUdfVENQX0NPTkdfSUxMSU5PSVMgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19E
Q1RDUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0NERyBpcyBub3Qgc2V0CiMgQ09ORklH
X1RDUF9DT05HX0JCUiBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX1dFU1RXT09EPXkKIyBDT05G
SUdfREVGQVVMVF9SRU5PIGlzIG5vdCBzZXQKQ09ORklHX0RFRkFVTFRfVENQX0NPTkc9Indlc3R3
b29kIgojIENPTkZJR19UQ1BfTUQ1U0lHIGlzIG5vdCBzZXQKQ09ORklHX0lQVjY9eQojIENPTkZJ
R19JUFY2X1JPVVRFUl9QUkVGIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9PUFRJTUlTVElDX0RB
RCBpcyBub3Qgc2V0CkNPTkZJR19JTkVUNl9BSD1tCkNPTkZJR19JTkVUNl9FU1A9bQojIENPTkZJ
R19JTkVUNl9FU1BfT0ZGTE9BRCBpcyBub3Qgc2V0CiMgQ09ORklHX0lORVQ2X0VTUElOVENQIGlz
IG5vdCBzZXQKQ09ORklHX0lORVQ2X0lQQ09NUD1tCiMgQ09ORklHX0lQVjZfTUlQNiBpcyBub3Qg
c2V0CkNPTkZJR19JTkVUNl9YRlJNX1RVTk5FTD1tCkNPTkZJR19JTkVUNl9UVU5ORUw9bQojIENP
TkZJR19JUFY2X1ZUSSBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfU0lUIGlzIG5vdCBzZXQKIyBD
T05GSUdfSVBWNl9UVU5ORUwgaXMgbm90IHNldAojIENPTkZJR19JUFY2X01VTFRJUExFX1RBQkxF
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfTVJPVVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBW
Nl9TRUc2X0xXVFVOTkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9TRUc2X0hNQUMgaXMgbm90
IHNldAojIENPTkZJR19JUFY2X1JQTF9MV1RVTk5FTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZf
SU9BTTZfTFdUVU5ORUwgaXMgbm90IHNldAojIENPTkZJR19ORVRMQUJFTCBpcyBub3Qgc2V0CiMg
Q09ORklHX01QVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUV09SS19TRUNNQVJLIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUV09SS19QSFlfVElNRVNUQU1QSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVURklMVEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfRENDUCBpcyBub3Qgc2V0CkNPTkZJR19J
UF9TQ1RQPW0KIyBDT05GSUdfU0NUUF9EQkdfT0JKQ05UIGlzIG5vdCBzZXQKQ09ORklHX1NDVFBf
REVGQVVMVF9DT09LSUVfSE1BQ19NRDU9eQojIENPTkZJR19TQ1RQX0RFRkFVTFRfQ09PS0lFX0hN
QUNfU0hBMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDVFBfREVGQVVMVF9DT09LSUVfSE1BQ19OT05F
IGlzIG5vdCBzZXQKQ09ORklHX1NDVFBfQ09PS0lFX0hNQUNfTUQ1PXkKIyBDT05GSUdfU0NUUF9D
T09LSUVfSE1BQ19TSEExIGlzIG5vdCBzZXQKIyBDT05GSUdfUkRTIGlzIG5vdCBzZXQKIyBDT05G
SUdfVElQQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTSBpcyBub3Qgc2V0CiMgQ09ORklHX0wyVFAg
aXMgbm90IHNldApDT05GSUdfU1RQPW0KQ09ORklHX0JSSURHRT1tCkNPTkZJR19CUklER0VfSUdN
UF9TTk9PUElORz15CiMgQ09ORklHX0JSSURHRV9NUlAgaXMgbm90IHNldAojIENPTkZJR19CUklE
R0VfQ0ZNIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0RTQSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZM
QU5fODAyMVEgaXMgbm90IHNldApDT05GSUdfTExDPW0KIyBDT05GSUdfTExDMiBpcyBub3Qgc2V0
CiMgQ09ORklHX0FUQUxLIGlzIG5vdCBzZXQKIyBDT05GSUdfWDI1IGlzIG5vdCBzZXQKIyBDT05G
SUdfTEFQQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIT05FVCBpcyBub3Qgc2V0CiMgQ09ORklHXzZM
T1dQQU4gaXMgbm90IHNldAojIENPTkZJR19JRUVFODAyMTU0IGlzIG5vdCBzZXQKQ09ORklHX05F
VF9TQ0hFRD15CgojCiMgUXVldWVpbmcvU2NoZWR1bGluZwojCiMgQ09ORklHX05FVF9TQ0hfSFRC
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9IRlNDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1NDSF9QUklPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9NVUxUSVEgaXMgbm90IHNldAoj
IENPTkZJR19ORVRfU0NIX1JFRCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfU0ZCIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1NDSF9TRlEgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1RF
UUwgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1RCRiBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9TQ0hfQ0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9FVEYgaXMgbm90IHNldAojIENP
TkZJR19ORVRfU0NIX1RBUFJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfR1JFRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfTkVURU0gaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NI
X0RSUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfTVFQUklPIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX1NDSF9TS0JQUklPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9DSE9LRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfUUZRIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9D
T0RFTCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfU0NIX0ZRX0NPREVMPXkKIyBDT05GSUdfTkVUX1ND
SF9DQUtFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9GUSBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9TQ0hfSEhGIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9QSUUgaXMgbm90IHNldAoj
IENPTkZJR19ORVRfU0NIX1BMVUcgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0VUUyBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRfU0NIX0RFRkFVTFQ9eQpDT05GSUdfREVGQVVMVF9GUV9DT0RFTD15
CiMgQ09ORklHX0RFRkFVTFRfUEZJRk9fRkFTVCBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX05F
VF9TQ0g9ImZxX2NvZGVsIgoKIwojIENsYXNzaWZpY2F0aW9uCiMKIyBDT05GSUdfTkVUX0NMU19C
QVNJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfUk9VVEU0IGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX0NMU19GVyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfVTMyIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX0NMU19GTE9XIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NMU19DR1JPVVAg
aXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX0JQRiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9D
TFNfRkxPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NMU19NQVRDSEFMTCBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9FTUFUQ0ggaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX0FDVCBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRfU0NIX0ZJRk89eQojIENPTkZJR19EQ0IgaXMgbm90IHNldApDT05G
SUdfRE5TX1JFU09MVkVSPW0KIyBDT05GSUdfQkFUTUFOX0FEViBpcyBub3Qgc2V0CiMgQ09ORklH
X09QRU5WU1dJVENIIGlzIG5vdCBzZXQKQ09ORklHX1ZTT0NLRVRTPW0KQ09ORklHX1ZTT0NLRVRT
X0RJQUc9bQojIENPTkZJR19WU09DS0VUU19MT09QQkFDSyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
UlRJT19WU09DS0VUUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVExJTktfRElBRyBpcyBub3Qgc2V0
CiMgQ09ORklHX01QTFMgaXMgbm90IHNldAojIENPTkZJR19ORVRfTlNIIGlzIG5vdCBzZXQKIyBD
T05GSUdfSFNSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NXSVRDSERFViBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9MM19NQVNURVJfREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfUVJUUiBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9OQ1NJIGlzIG5vdCBzZXQKQ09ORklHX1BDUFVfREVWX1JFRkNOVD15
CkNPTkZJR19NQVhfU0tCX0ZSQUdTPTE3CkNPTkZJR19SUFM9eQpDT05GSUdfUkZTX0FDQ0VMPXkK
Q09ORklHX1NPQ0tfUlhfUVVFVUVfTUFQUElORz15CkNPTkZJR19YUFM9eQojIENPTkZJR19DR1JP
VVBfTkVUX1BSSU8gaXMgbm90IHNldApDT05GSUdfQ0dST1VQX05FVF9DTEFTU0lEPXkKQ09ORklH
X05FVF9SWF9CVVNZX1BPTEw9eQpDT05GSUdfQlFMPXkKQ09ORklHX0JQRl9TVFJFQU1fUEFSU0VS
PXkKQ09ORklHX05FVF9GTE9XX0xJTUlUPXkKCiMKIyBOZXR3b3JrIHRlc3RpbmcKIwojIENPTkZJ
R19ORVRfUEtUR0VOIGlzIG5vdCBzZXQKIyBlbmQgb2YgTmV0d29yayB0ZXN0aW5nCiMgZW5kIG9m
IE5ldHdvcmtpbmcgb3B0aW9ucwoKIyBDT05GSUdfSEFNUkFESU8gaXMgbm90IHNldAojIENPTkZJ
R19DQU4gaXMgbm90IHNldApDT05GSUdfQlQ9bQpDT05GSUdfQlRfQlJFRFI9eQpDT05GSUdfQlRf
UkZDT01NPW0KQ09ORklHX0JUX1JGQ09NTV9UVFk9eQpDT05GSUdfQlRfQk5FUD1tCkNPTkZJR19C
VF9CTkVQX01DX0ZJTFRFUj15CkNPTkZJR19CVF9CTkVQX1BST1RPX0ZJTFRFUj15CkNPTkZJR19C
VF9ISURQPW0KQ09ORklHX0JUX0xFPXkKQ09ORklHX0JUX0xFX0wyQ0FQX0VDUkVEPXkKIyBDT05G
SUdfQlRfTEVEUyBpcyBub3Qgc2V0CkNPTkZJR19CVF9NU0ZURVhUPXkKQ09ORklHX0JUX0FPU1BF
WFQ9eQpDT05GSUdfQlRfREVCVUdGUz15CiMgQ09ORklHX0JUX1NFTEZURVNUIGlzIG5vdCBzZXQK
Q09ORklHX0JUX0ZFQVRVUkVfREVCVUc9eQoKIwojIEJsdWV0b290aCBkZXZpY2UgZHJpdmVycwoj
CkNPTkZJR19CVF9JTlRFTD1tCkNPTkZJR19CVF9CQ009bQpDT05GSUdfQlRfUlRMPW0KQ09ORklH
X0JUX01USz1tCkNPTkZJR19CVF9IQ0lCVFVTQj1tCkNPTkZJR19CVF9IQ0lCVFVTQl9BVVRPU1VT
UEVORD15CkNPTkZJR19CVF9IQ0lCVFVTQl9QT0xMX1NZTkM9eQpDT05GSUdfQlRfSENJQlRVU0Jf
QkNNPXkKQ09ORklHX0JUX0hDSUJUVVNCX01USz15CkNPTkZJR19CVF9IQ0lCVFVTQl9SVEw9eQpD
T05GSUdfQlRfSENJVUFSVD1tCkNPTkZJR19CVF9IQ0lVQVJUX0g0PXkKQ09ORklHX0JUX0hDSVVB
UlRfQkNTUD15CkNPTkZJR19CVF9IQ0lVQVJUX0FUSDNLPXkKQ09ORklHX0JUX0hDSVVBUlRfQUc2
WFg9eQpDT05GSUdfQlRfSENJQkNNMjAzWD1tCiMgQ09ORklHX0JUX0hDSUJDTTQzNzcgaXMgbm90
IHNldAojIENPTkZJR19CVF9IQ0lCUEExMFggaXMgbm90IHNldApDT05GSUdfQlRfSENJQkZVU0I9
bQojIENPTkZJR19CVF9IQ0lEVEwxIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfSENJQlQzQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JUX0hDSUJMVUVDQVJEIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfSENJ
VkhDSSBpcyBub3Qgc2V0CkNPTkZJR19CVF9NUlZMPW0KQ09ORklHX0JUX0FUSDNLPW0KIyBDT05G
SUdfQlRfVklSVElPIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfSU5URUxfUENJRSBpcyBub3Qgc2V0
CiMgZW5kIG9mIEJsdWV0b290aCBkZXZpY2UgZHJpdmVycwoKIyBDT05GSUdfQUZfUlhSUEMgaXMg
bm90IHNldAojIENPTkZJR19BRl9LQ00gaXMgbm90IHNldApDT05GSUdfU1RSRUFNX1BBUlNFUj15
CiMgQ09ORklHX01DVFAgaXMgbm90IHNldApDT05GSUdfV0lSRUxFU1M9eQpDT05GSUdfQ0ZHODAy
MTE9bQojIENPTkZJR19OTDgwMjExX1RFU1RNT0RFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0ZHODAy
MTFfREVWRUxPUEVSX1dBUk5JTkdTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0ZHODAyMTFfQ0VSVElG
SUNBVElPTl9PTlVTIGlzIG5vdCBzZXQKQ09ORklHX0NGRzgwMjExX1JFUVVJUkVfU0lHTkVEX1JF
R0RCPXkKQ09ORklHX0NGRzgwMjExX1VTRV9LRVJORUxfUkVHREJfS0VZUz15CkNPTkZJR19DRkc4
MDIxMV9ERUZBVUxUX1BTPXkKIyBDT05GSUdfQ0ZHODAyMTFfREVCVUdGUyBpcyBub3Qgc2V0CkNP
TkZJR19DRkc4MDIxMV9DUkRBX1NVUFBPUlQ9eQojIENPTkZJR19DRkc4MDIxMV9XRVhUIGlzIG5v
dCBzZXQKQ09ORklHX0NGRzgwMjExX0tVTklUX1RFU1Q9bQpDT05GSUdfTUFDODAyMTE9bQpDT05G
SUdfTUFDODAyMTFfSEFTX1JDPXkKQ09ORklHX01BQzgwMjExX1JDX01JTlNUUkVMPXkKQ09ORklH
X01BQzgwMjExX1JDX0RFRkFVTFRfTUlOU1RSRUw9eQpDT05GSUdfTUFDODAyMTFfUkNfREVGQVVM
VD0ibWluc3RyZWxfaHQiCkNPTkZJR19NQUM4MDIxMV9LVU5JVF9URVNUPW0KIyBDT05GSUdfTUFD
ODAyMTFfTUVTSCBpcyBub3Qgc2V0CkNPTkZJR19NQUM4MDIxMV9MRURTPXkKIyBDT05GSUdfTUFD
ODAyMTFfTUVTU0FHRV9UUkFDSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFDODAyMTFfREVCVUdf
TUVOVSBpcyBub3Qgc2V0CkNPTkZJR19NQUM4MDIxMV9TVEFfSEFTSF9NQVhfU0laRT0wCkNPTkZJ
R19SRktJTEw9bQpDT05GSUdfUkZLSUxMX0xFRFM9eQojIENPTkZJR19SRktJTExfSU5QVVQgaXMg
bm90IHNldApDT05GSUdfTkVUXzlQPXkKQ09ORklHX05FVF85UF9GRD15CkNPTkZJR19ORVRfOVBf
VklSVElPPXkKIyBDT05GSUdfTkVUXzlQX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FJRiBp
cyBub3Qgc2V0CiMgQ09ORklHX0NFUEhfTElCIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZDIGlzIG5v
dCBzZXQKIyBDT05GSUdfUFNBTVBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9JRkUgaXMgbm90
IHNldAojIENPTkZJR19MV1RVTk5FTCBpcyBub3Qgc2V0CkNPTkZJR19EU1RfQ0FDSEU9eQpDT05G
SUdfR1JPX0NFTExTPXkKQ09ORklHX1NPQ0tfVkFMSURBVEVfWE1JVD15CkNPTkZJR19ORVRfU09D
S19NU0c9eQpDT05GSUdfUEFHRV9QT09MPXkKIyBDT05GSUdfUEFHRV9QT09MX1NUQVRTIGlzIG5v
dCBzZXQKQ09ORklHX0ZBSUxPVkVSPXkKQ09ORklHX0VUSFRPT0xfTkVUTElOSz15CkNPTkZJR19O
RVRERVZfQUREUl9MSVNUX1RFU1Q9bQpDT05GSUdfTkVUX1RFU1Q9bQoKIwojIERldmljZSBEcml2
ZXJzCiMKQ09ORklHX0hBVkVfUENJPXkKQ09ORklHX0ZPUkNFX1BDST15CkNPTkZJR19HRU5FUklD
X1BDSV9JT01BUD15CkNPTkZJR19QQ0k9eQpDT05GSUdfUENJX0RPTUFJTlM9eQpDT05GSUdfUENJ
X1NZU0NBTEw9eQojIENPTkZJR19QQ0lFUE9SVEJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVB
U1BNIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9QVE0gaXMgbm90IHNldApDT05GSUdfUENJX01T
ST15CkNPTkZJR19QQ0lfTVNJX0FSQ0hfRkFMTEJBQ0tTPXkKQ09ORklHX1BDSV9RVUlSS1M9eQoj
IENPTkZJR19QQ0lfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19QQ0lfU1RVQiBpcyBub3Qgc2V0
CiMgQ09ORklHX1BDSV9JT1YgaXMgbm90IHNldAojIENPTkZJR19QQ0lfUFJJIGlzIG5vdCBzZXQK
IyBDT05GSUdfUENJX1BBU0lEIGlzIG5vdCBzZXQKQ09ORklHX1BDSV9EWU5BTUlDX09GX05PREVT
PXkKIyBDT05GSUdfUENJRV9CVVNfVFVORV9PRkYgaXMgbm90IHNldApDT05GSUdfUENJRV9CVVNf
REVGQVVMVD15CiMgQ09ORklHX1BDSUVfQlVTX1NBRkUgaXMgbm90IHNldAojIENPTkZJR19QQ0lF
X0JVU19QRVJGT1JNQU5DRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfQlVTX1BFRVIyUEVFUiBp
cyBub3Qgc2V0CkNPTkZJR19WR0FfQVJCPXkKQ09ORklHX1ZHQV9BUkJfTUFYX0dQVVM9NAojIENP
TkZJR19IT1RQTFVHX1BDSSBpcyBub3Qgc2V0CgojCiMgUENJIGNvbnRyb2xsZXIgZHJpdmVycwoj
CiMgQ09ORklHX1BDSV9GVFBDSTEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9IT1NUX0dFTkVS
SUMgaXMgbm90IHNldAojIENPTkZJR19QQ0lFX1hJTElOWCBpcyBub3Qgc2V0CgojCiMgQ2FkZW5j
ZS1iYXNlZCBQQ0llIGNvbnRyb2xsZXJzCiMKIyBDT05GSUdfUENJRV9DQURFTkNFX1BMQVRfSE9T
VCBpcyBub3Qgc2V0CiMgZW5kIG9mIENhZGVuY2UtYmFzZWQgUENJZSBjb250cm9sbGVycwoKIwoj
IERlc2lnbldhcmUtYmFzZWQgUENJZSBjb250cm9sbGVycwojCiMgQ09ORklHX1BDSV9NRVNPTiBp
cyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfRFdfUExBVF9IT1NUIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
RGVzaWduV2FyZS1iYXNlZCBQQ0llIGNvbnRyb2xsZXJzCgojCiMgTW9iaXZlaWwtYmFzZWQgUENJ
ZSBjb250cm9sbGVycwojCiMgZW5kIG9mIE1vYml2ZWlsLWJhc2VkIFBDSWUgY29udHJvbGxlcnMK
CiMKIyBQTERBLWJhc2VkIFBDSWUgY29udHJvbGxlcnMKIwojIENPTkZJR19QQ0lFX01JQ1JPQ0hJ
UF9IT1NUIGlzIG5vdCBzZXQKIyBlbmQgb2YgUExEQS1iYXNlZCBQQ0llIGNvbnRyb2xsZXJzCiMg
ZW5kIG9mIFBDSSBjb250cm9sbGVyIGRyaXZlcnMKCiMKIyBQQ0kgRW5kcG9pbnQKIwojIENPTkZJ
R19QQ0lfRU5EUE9JTlQgaXMgbm90IHNldAojIGVuZCBvZiBQQ0kgRW5kcG9pbnQKCiMKIyBQQ0kg
c3dpdGNoIGNvbnRyb2xsZXIgZHJpdmVycwojCiMgQ09ORklHX1BDSV9TV19TV0lUQ0hURUMgaXMg
bm90IHNldAojIGVuZCBvZiBQQ0kgc3dpdGNoIGNvbnRyb2xsZXIgZHJpdmVycwoKIyBDT05GSUdf
Q1hMX0JVUyBpcyBub3Qgc2V0CkNPTkZJR19QQ0NBUkQ9bQpDT05GSUdfUENNQ0lBPW0KIyBDT05G
SUdfUENNQ0lBX0xPQURfQ0lTIGlzIG5vdCBzZXQKQ09ORklHX0NBUkRCVVM9eQoKIwojIFBDLWNh
cmQgYnJpZGdlcwojCkNPTkZJR19ZRU5UQT1tCiMgQ09ORklHX1lFTlRBX08yIGlzIG5vdCBzZXQK
IyBDT05GSUdfWUVOVEFfUklDT0ggaXMgbm90IHNldAojIENPTkZJR19ZRU5UQV9USSBpcyBub3Qg
c2V0CiMgQ09ORklHX1lFTlRBX1RPU0hJQkEgaXMgbm90IHNldAojIENPTkZJR19QRDY3MjkgaXMg
bm90IHNldAojIENPTkZJR19JODIwOTIgaXMgbm90IHNldApDT05GSUdfUENDQVJEX05PTlNUQVRJ
Qz15CiMgQ09ORklHX1JBUElESU8gaXMgbm90IHNldAoKIwojIEdlbmVyaWMgRHJpdmVyIE9wdGlv
bnMKIwojIENPTkZJR19VRVZFTlRfSEVMUEVSIGlzIG5vdCBzZXQKQ09ORklHX0RFVlRNUEZTPXkK
Q09ORklHX0RFVlRNUEZTX01PVU5UPXkKQ09ORklHX0RFVlRNUEZTX1NBRkU9eQpDT05GSUdfU1RB
TkRBTE9ORT15CkNPTkZJR19QUkVWRU5UX0ZJUk1XQVJFX0JVSUxEPXkKCiMKIyBGaXJtd2FyZSBs
b2FkZXIKIwpDT05GSUdfRldfTE9BREVSPXkKQ09ORklHX0VYVFJBX0ZJUk1XQVJFPSIiCiMgQ09O
RklHX0ZXX0xPQURFUl9VU0VSX0hFTFBFUiBpcyBub3Qgc2V0CkNPTkZJR19GV19MT0FERVJfQ09N
UFJFU1M9eQojIENPTkZJR19GV19MT0FERVJfQ09NUFJFU1NfWFogaXMgbm90IHNldApDT05GSUdf
RldfTE9BREVSX0NPTVBSRVNTX1pTVEQ9eQojIENPTkZJR19GV19VUExPQUQgaXMgbm90IHNldAoj
IGVuZCBvZiBGaXJtd2FyZSBsb2FkZXIKCkNPTkZJR19BTExPV19ERVZfQ09SRURVTVA9eQojIENP
TkZJR19ERUJVR19EUklWRVIgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19ERVZSRVMgaXMgbm90
IHNldAojIENPTkZJR19ERUJVR19URVNUX0RSSVZFUl9SRU1PVkUgaXMgbm90IHNldAojIENPTkZJ
R19URVNUX0FTWU5DX0RSSVZFUl9QUk9CRSBpcyBub3Qgc2V0CkNPTkZJR19ETV9LVU5JVF9URVNU
PW0KQ09ORklHX0RSSVZFUl9QRV9LVU5JVF9URVNUPW0KQ09ORklHX0dFTkVSSUNfQ1BVX0FVVE9Q
Uk9CRT15CkNPTkZJR19SRUdNQVA9eQpDT05GSUdfUkVHTUFQX0tVTklUPW0KIyBDT05GSUdfUkVH
TUFQX0JVSUxEIGlzIG5vdCBzZXQKQ09ORklHX1JFR01BUF9SQU09bQpDT05GSUdfRE1BX1NIQVJF
RF9CVUZGRVI9eQpDT05GSUdfRE1BX0ZFTkNFX1RSQUNFPXkKIyBDT05GSUdfRldfREVWTElOS19T
WU5DX1NUQVRFX1RJTUVPVVQgaXMgbm90IHNldAojIGVuZCBvZiBHZW5lcmljIERyaXZlciBPcHRp
b25zCgojCiMgQnVzIGRldmljZXMKIwojIENPTkZJR19NSElfQlVTIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUhJX0JVU19FUCBpcyBub3Qgc2V0CiMgZW5kIG9mIEJ1cyBkZXZpY2VzCgojCiMgQ2FjaGUg
RHJpdmVycwojCiMgZW5kIG9mIENhY2hlIERyaXZlcnMKCkNPTkZJR19DT05ORUNUT1I9eQpDT05G
SUdfUFJPQ19FVkVOVFM9eQoKIwojIEZpcm13YXJlIERyaXZlcnMKIwoKIwojIEFSTSBTeXN0ZW0g
Q29udHJvbCBhbmQgTWFuYWdlbWVudCBJbnRlcmZhY2UgUHJvdG9jb2wKIwojIGVuZCBvZiBBUk0g
U3lzdGVtIENvbnRyb2wgYW5kIE1hbmFnZW1lbnQgSW50ZXJmYWNlIFByb3RvY29sCgpDT05GSUdf
RklSTVdBUkVfTUVNTUFQPXkKQ09ORklHX0ZXX0NGR19TWVNGUz1tCiMgQ09ORklHX0ZXX0NGR19T
WVNGU19DTURMSU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfR09PR0xFX0ZJUk1XQVJFIGlzIG5vdCBz
ZXQKCiMKIyBRdWFsY29tbSBmaXJtd2FyZSBkcml2ZXJzCiMKIyBlbmQgb2YgUXVhbGNvbW0gZmly
bXdhcmUgZHJpdmVycwoKIwojIFRlZ3JhIGZpcm13YXJlIGRyaXZlcgojCiMgZW5kIG9mIFRlZ3Jh
IGZpcm13YXJlIGRyaXZlcgojIGVuZCBvZiBGaXJtd2FyZSBEcml2ZXJzCgojIENPTkZJR19HTlNT
IGlzIG5vdCBzZXQKIyBDT05GSUdfTVREIGlzIG5vdCBzZXQKQ09ORklHX0RUQz15CkNPTkZJR19P
Rj15CiMgQ09ORklHX09GX1VOSVRURVNUIGlzIG5vdCBzZXQKQ09ORklHX09GX0tVTklUX1RFU1Q9
bQpDT05GSUdfT0ZfRkxBVFRSRUU9eQpDT05GSUdfT0ZfRUFSTFlfRkxBVFRSRUU9eQpDT05GSUdf
T0ZfS09CSj15CkNPTkZJR19PRl9EWU5BTUlDPXkKQ09ORklHX09GX0FERFJFU1M9eQpDT05GSUdf
T0ZfSVJRPXkKQ09ORklHX09GX1JFU0VSVkVEX01FTT15CiMgQ09ORklHX09GX09WRVJMQVkgaXMg
bm90IHNldApDT05GSUdfQVJDSF9NSUdIVF9IQVZFX1BDX1BBUlBPUlQ9eQojIENPTkZJR19QQVJQ
T1JUIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVY9eQojIENPTkZJR19CTEtfREVWX05VTExfQkxL
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9GRCBpcyBub3Qgc2V0CiMgQ09ORklHX01BQ19G
TE9QUFkgaXMgbm90IHNldApDT05GSUdfQ0RST009eQojIENPTkZJR19CTEtfREVWX1BDSUVTU0Rf
TVRJUDMyWFggaXMgbm90IHNldAojIENPTkZJR19aUkFNIGlzIG5vdCBzZXQKQ09ORklHX0JMS19E
RVZfTE9PUD1tCkNPTkZJR19CTEtfREVWX0xPT1BfTUlOX0NPVU5UPTgKIyBDT05GSUdfQkxLX0RF
Vl9EUkJEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9OQkQgaXMgbm90IHNldAojIENPTkZJ
R19CTEtfREVWX1JBTSBpcyBub3Qgc2V0CiMgQ09ORklHX0NEUk9NX1BLVENEVkQgaXMgbm90IHNl
dAojIENPTkZJR19BVEFfT1ZFUl9FVEggaXMgbm90IHNldApDT05GSUdfVklSVElPX0JMSz15CiMg
Q09ORklHX0JMS19ERVZfUkJEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9VQkxLIGlzIG5v
dCBzZXQKCiMKIyBOVk1FIFN1cHBvcnQKIwojIENPTkZJR19CTEtfREVWX05WTUUgaXMgbm90IHNl
dAojIENPTkZJR19OVk1FX0ZDIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRV9UQ1AgaXMgbm90IHNl
dAojIENPTkZJR19OVk1FX1RBUkdFVCBpcyBub3Qgc2V0CiMgZW5kIG9mIE5WTUUgU3VwcG9ydAoK
IwojIE1pc2MgZGV2aWNlcwojCiMgQ09ORklHX0FENTI1WF9EUE9UIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFVNTVlfSVJRIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhBTlRPTSBpcyBub3Qgc2V0CiMgQ09O
RklHX1RJRk1fQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX0lDUzkzMlM0MDEgaXMgbm90IHNldAoj
IENPTkZJR19FTkNMT1NVUkVfU0VSVklDRVMgaXMgbm90IHNldAojIENPTkZJR19IUF9JTE8gaXMg
bm90IHNldAojIENPTkZJR19BUERTOTgwMkFMUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lTTDI5MDAz
IGlzIG5vdCBzZXQKIyBDT05GSUdfSVNMMjkwMjAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X1RTTDI1NTAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0JIMTc3MCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfQVBEUzk5MFggaXMgbm90IHNldAojIENPTkZJR19ITUM2MzUyIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFMxNjgyIGlzIG5vdCBzZXQKIyBDT05GSUdfU1JBTSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RXX1hEQVRBX1BDSUUgaXMgbm90IHNldAojIENPTkZJR19QQ0lfRU5EUE9JTlRf
VEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTElOWF9TREZFQyBpcyBub3Qgc2V0CiMgQ09ORklH
X09QRU5fRElDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZDUFVfU1RBTExfREVURUNUT1IgaXMgbm90
IHNldAojIENPTkZJR19OU00gaXMgbm90IHNldAojIENPTkZJR19DMlBPUlQgaXMgbm90IHNldAoK
IwojIEVFUFJPTSBzdXBwb3J0CiMKIyBDT05GSUdfRUVQUk9NX0FUMjQgaXMgbm90IHNldAojIENP
TkZJR19FRVBST01fTUFYNjg3NSBpcyBub3Qgc2V0CiMgQ09ORklHX0VFUFJPTV85M0NYNiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0VFUFJPTV9JRFRfODlIUEVTWCBpcyBub3Qgc2V0CiMgQ09ORklHX0VF
UFJPTV9FRTEwMDQgaXMgbm90IHNldAojIGVuZCBvZiBFRVBST00gc3VwcG9ydAoKIyBDT05GSUdf
Q0I3MTBfQ09SRSBpcyBub3Qgc2V0CgojCiMgVGV4YXMgSW5zdHJ1bWVudHMgc2hhcmVkIHRyYW5z
cG9ydCBsaW5lIGRpc2NpcGxpbmUKIwojIGVuZCBvZiBUZXhhcyBJbnN0cnVtZW50cyBzaGFyZWQg
dHJhbnNwb3J0IGxpbmUgZGlzY2lwbGluZQoKIyBDT05GSUdfU0VOU09SU19MSVMzX0kyQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FMVEVSQV9TVEFQTCBpcyBub3Qgc2V0CiMgQ09ORklHX0VDSE8gaXMg
bm90IHNldAojIENPTkZJR19CQ01fVksgaXMgbm90IHNldAojIENPTkZJR19NSVNDX0FMQ09SX1BD
SSBpcyBub3Qgc2V0CiMgQ09ORklHX01JU0NfUlRTWF9QQ0kgaXMgbm90IHNldAojIENPTkZJR19N
SVNDX1JUU1hfVVNCIGlzIG5vdCBzZXQKQ09ORklHX1BWUEFOSUM9eQpDT05GSUdfUFZQQU5JQ19N
TUlPPW0KQ09ORklHX1BWUEFOSUNfUENJPW0KIyBDT05GSUdfS0VCQV9DUDUwMCBpcyBub3Qgc2V0
CiMgZW5kIG9mIE1pc2MgZGV2aWNlcwoKIwojIFNDU0kgZGV2aWNlIHN1cHBvcnQKIwpDT05GSUdf
U0NTSV9NT0Q9eQojIENPTkZJR19SQUlEX0FUVFJTIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfQ09N
TU9OPXkKQ09ORklHX1NDU0k9eQpDT05GSUdfU0NTSV9ETUE9eQojIENPTkZJR19TQ1NJX1BST0Nf
RlMgaXMgbm90IHNldApDT05GSUdfU0NTSV9MSUJfS1VOSVRfVEVTVD1tCgojCiMgU0NTSSBzdXBw
b3J0IHR5cGUgKGRpc2ssIHRhcGUsIENELVJPTSkKIwpDT05GSUdfQkxLX0RFVl9TRD15CiMgQ09O
RklHX0NIUl9ERVZfU1QgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9TUj15CkNPTkZJR19DSFJf
REVWX1NHPW0KQ09ORklHX0JMS19ERVZfQlNHPXkKIyBDT05GSUdfQ0hSX0RFVl9TQ0ggaXMgbm90
IHNldApDT05GSUdfU0NTSV9DT05TVEFOVFM9eQojIENPTkZJR19TQ1NJX0xPR0dJTkcgaXMgbm90
IHNldApDT05GSUdfU0NTSV9TQ0FOX0FTWU5DPXkKQ09ORklHX1NDU0lfUFJPVE9fVEVTVD1tCgoj
CiMgU0NTSSBUcmFuc3BvcnRzCiMKIyBDT05GSUdfU0NTSV9TUElfQVRUUlMgaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX0ZDX0FUVFJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9JU0NTSV9BVFRS
UyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfU0FTX0FUVFJTIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0NTSV9TQVNfTElCU0FTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9TUlBfQVRUUlMgaXMgbm90
IHNldAojIGVuZCBvZiBTQ1NJIFRyYW5zcG9ydHMKCkNPTkZJR19TQ1NJX0xPV0xFVkVMPXkKIyBD
T05GSUdfSVNDU0lfVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfSVNDU0lfQk9PVF9TWVNGUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDU0lfQ1hHQjNfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X0NYR0I0X0lTQ1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9CTlgyX0lTQ1NJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQkUySVNDU0kgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVWXzNXX1hYWFhf
UkFJRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSFBTQSBpcyBub3Qgc2V0CiMgQ09ORklHX1ND
U0lfM1dfOVhYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfM1dfU0FTIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NTSV9BQ0FSRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQUFDUkFJRCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDU0lfQUlDN1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQUlDNzlY
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQUlDOTRYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1ND
U0lfTVZTQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01WVU1JIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0NTSV9BRFZBTlNZUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQVJDTVNSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV9FU0FTMlIgaXMgbm90IHNldAojIENPTkZJR19NRUdBUkFJRF9ORVdH
RU4gaXMgbm90IHNldAojIENPTkZJR19NRUdBUkFJRF9MRUdBQ1kgaXMgbm90IHNldAojIENPTkZJ
R19NRUdBUkFJRF9TQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01QVDNTQVMgaXMgbm90IHNl
dAojIENPTkZJR19TQ1NJX01QVDJTQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01QSTNNUiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfU01BUlRQUUkgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X0hQVElPUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQlVTTE9HSUMgaXMgbm90IHNldAojIENP
TkZJR19TQ1NJX01ZUkIgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NOSUMgaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX0RNWDMxOTFEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9GRE9NQUlOX1BD
SSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSVBTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9J
TklUSU8gaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0lOSUExMDAgaXMgbm90IHNldAojIENPTkZJ
R19TQ1NJX1NURVggaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NZTTUzQzhYWF8yIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV9JUFIgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1FMT0dJQ18xMjgw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9RTEFfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX0RDMzk1eCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQU01M0M5NzQgaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX05TUDMyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9XRDcxOVggaXMgbm90
IHNldAojIENPTkZJR19TQ1NJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NRVNIIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NQUM1M0M5NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lf
UE1DUkFJRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfUE04MDAxIGlzIG5vdCBzZXQKQ09ORklH
X1NDU0lfVklSVElPPXkKIyBDT05GSUdfU0NTSV9MT1dMRVZFTF9QQ01DSUEgaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX0RIIGlzIG5vdCBzZXQKIyBlbmQgb2YgU0NTSSBkZXZpY2Ugc3VwcG9ydAoK
Q09ORklHX0FUQT15CkNPTkZJR19TQVRBX0hPU1Q9eQpDT05GSUdfQVRBX1ZFUkJPU0VfRVJST1I9
eQojIENPTkZJR19BVEFfRk9SQ0UgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1BNUCBpcyBub3Qg
c2V0CgojCiMgQ29udHJvbGxlcnMgd2l0aCBub24tU0ZGIG5hdGl2ZSBpbnRlcmZhY2UKIwojIENP
TkZJR19TQVRBX0FIQ0kgaXMgbm90IHNldAojIENPTkZJR19TQVRBX0FIQ0lfUExBVEZPUk0gaXMg
bm90IHNldAojIENPTkZJR19BSENJX0RXQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FIQ0lfQ0VWQSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfSU5JQzE2MlggaXMgbm90IHNldAojIENPTkZJR19TQVRB
X0FDQVJEX0FIQ0kgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1NJTDI0IGlzIG5vdCBzZXQKQ09O
RklHX0FUQV9TRkY9eQoKIwojIFNGRiBjb250cm9sbGVycyB3aXRoIGN1c3RvbSBETUEgaW50ZXJm
YWNlCiMKIyBDT05GSUdfUERDX0FETUEgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1FTVE9SIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0FUQV9TWDQgaXMgbm90IHNldApDT05GSUdfQVRBX0JNRE1BPXkK
CiMKIyBTQVRBIFNGRiBjb250cm9sbGVycyB3aXRoIEJNRE1BCiMKIyBDT05GSUdfQVRBX1BJSVgg
aXMgbm90IHNldAojIENPTkZJR19TQVRBX01WIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9OViBp
cyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfUFJPTUlTRSBpcyBub3Qgc2V0CkNPTkZJR19TQVRBX1NJ
TD15CiMgQ09ORklHX1NBVEFfU0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9TVlcgaXMgbm90
IHNldAojIENPTkZJR19TQVRBX1VMSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfVklBIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0FUQV9WSVRFU1NFIGlzIG5vdCBzZXQKCiMKIyBQQVRBIFNGRiBjb250
cm9sbGVycyB3aXRoIEJNRE1BCiMKIyBDT05GSUdfUEFUQV9BTEkgaXMgbm90IHNldAojIENPTkZJ
R19QQVRBX0FNRCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQVJUT1AgaXMgbm90IHNldAojIENP
TkZJR19QQVRBX0FUSUlYUCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQVRQODY3WCBpcyBub3Qg
c2V0CiMgQ09ORklHX1BBVEFfQ01ENjRYIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9DWVBSRVNT
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9FRkFSIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9I
UFQzNjYgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0hQVDM3WCBpcyBub3Qgc2V0CiMgQ09ORklH
X1BBVEFfSFBUM1gyTiBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfSFBUM1gzIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEFUQV9JVDgyMTMgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0lUODIxWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BBVEFfSk1JQ1JPTiBpcyBub3Qgc2V0CkNPTkZJR19QQVRBX01BQ0lP
PXkKIyBDT05GSUdfUEFUQV9NQVJWRUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9ORVRDRUxM
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9OSU5KQTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFU
QV9OUzg3NDE1IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9PTERQSUlYIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEFUQV9PUFRJRE1BIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9QREMyMDI3WCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BBVEFfUERDX09MRCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfUkFE
SVNZUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfUkRDIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFU
QV9TQ0ggaXMgbm90IHNldAojIENPTkZJR19QQVRBX1NFUlZFUldPUktTIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEFUQV9TSUw2ODAgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1NJUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1BBVEFfVE9TSElCQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfVFJJRkxFWCBp
cyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfVklBIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9XSU5C
T05EIGlzIG5vdCBzZXQKCiMKIyBQSU8tb25seSBTRkYgY29udHJvbGxlcnMKIwojIENPTkZJR19Q
QVRBX0NNRDY0MF9QQ0kgaXMgbm90IHNldAojIENPTkZJR19QQVRBX01QSUlYIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEFUQV9OUzg3NDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9PUFRJIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEFUQV9QQ01DSUEgaXMgbm90IHNldAojIENPTkZJR19QQVRBX09GX1BM
QVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9SWjEwMDAgaXMgbm90IHNldAoKIwojIEdl
bmVyaWMgZmFsbGJhY2sgLyBsZWdhY3kgZHJpdmVycwojCiMgQ09ORklHX0FUQV9HRU5FUklDIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEFUQV9MRUdBQ1kgaXMgbm90IHNldApDT05GSUdfTUQ9eQpDT05G
SUdfQkxLX0RFVl9NRD1tCiMgQ09ORklHX01EX0JJVE1BUF9GSUxFIGlzIG5vdCBzZXQKIyBDT05G
SUdfTURfUkFJRDAgaXMgbm90IHNldAojIENPTkZJR19NRF9SQUlEMSBpcyBub3Qgc2V0CiMgQ09O
RklHX01EX1JBSUQxMCBpcyBub3Qgc2V0CkNPTkZJR19NRF9SQUlENDU2PW0KIyBDT05GSUdfQkNB
Q0hFIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZfRE1fQlVJTFRJTj15CkNPTkZJR19CTEtfREVW
X0RNPW0KQ09ORklHX0RNX0RFQlVHPXkKQ09ORklHX0RNX0JVRklPPW0KQ09ORklHX0RNX0RFQlVH
X0JMT0NLX01BTkFHRVJfTE9DS0lORz15CiMgQ09ORklHX0RNX0RFQlVHX0JMT0NLX1NUQUNLX1RS
QUNJTkcgaXMgbm90IHNldApDT05GSUdfRE1fQklPX1BSSVNPTj1tCkNPTkZJR19ETV9QRVJTSVNU
RU5UX0RBVEE9bQojIENPTkZJR19ETV9VTlNUUklQRUQgaXMgbm90IHNldApDT05GSUdfRE1fQ1JZ
UFQ9bQojIENPTkZJR19ETV9TTkFQU0hPVCBpcyBub3Qgc2V0CkNPTkZJR19ETV9USElOX1BST1ZJ
U0lPTklORz1tCiMgQ09ORklHX0RNX0NBQ0hFIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fV1JJVEVD
QUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0VSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0NM
T05FIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fTUlSUk9SIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1f
UkFJRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX1pFUk8gaXMgbm90IHNldAojIENPTkZJR19ETV9N
VUxUSVBBVEggaXMgbm90IHNldAojIENPTkZJR19ETV9ERUxBWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0RNX0RVU1QgaXMgbm90IHNldApDT05GSUdfRE1fVUVWRU5UPXkKIyBDT05GSUdfRE1fRkxBS0VZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fVkVSSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fU1dJ
VENIIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fTE9HX1dSSVRFUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0RNX0lOVEVHUklUWSBpcyBub3Qgc2V0CiMgQ09ORklHX1RBUkdFVF9DT1JFIGlzIG5vdCBzZXQK
IyBDT05GSUdfRlVTSU9OIGlzIG5vdCBzZXQKCiMKIyBJRUVFIDEzOTQgKEZpcmVXaXJlKSBzdXBw
b3J0CiMKQ09ORklHX0ZJUkVXSVJFPW0KQ09ORklHX0ZJUkVXSVJFX0tVTklUX1VBUElfVEVTVD1t
CkNPTkZJR19GSVJFV0lSRV9LVU5JVF9ERVZJQ0VfQVRUUklCVVRFX1RFU1Q9bQpDT05GSUdfRklS
RVdJUkVfS1VOSVRfUEFDS0VUX1NFUkRFU19URVNUPW0KQ09ORklHX0ZJUkVXSVJFX0tVTklUX1NF
TEZfSURfU0VRVUVOQ0VfSEVMUEVSX1RFU1Q9bQpDT05GSUdfRklSRVdJUkVfT0hDST1tCkNPTkZJ
R19GSVJFV0lSRV9LVU5JVF9PSENJX1NFUkRFU19URVNUPW0KQ09ORklHX0ZJUkVXSVJFX1NCUDI9
bQpDT05GSUdfRklSRVdJUkVfTkVUPW0KIyBDT05GSUdfRklSRVdJUkVfTk9TWSBpcyBub3Qgc2V0
CiMgZW5kIG9mIElFRUUgMTM5NCAoRmlyZVdpcmUpIHN1cHBvcnQKCkNPTkZJR19NQUNJTlRPU0hf
RFJJVkVSUz15CkNPTkZJR19BREI9eQojIENPTkZJR19BREJfQ1VEQSBpcyBub3Qgc2V0CkNPTkZJ
R19BREJfUE1VPXkKQ09ORklHX0FEQl9QTVVfRVZFTlQ9eQpDT05GSUdfQURCX1BNVV9MRUQ9eQoj
IENPTkZJR19BREJfUE1VX0xFRF9ESVNLIGlzIG5vdCBzZXQKQ09ORklHX1BNQUNfQVBNX0VNVT1t
CkNPTkZJR19QTUFDX01FRElBQkFZPXkKIyBDT05GSUdfUE1BQ19CQUNLTElHSFQgaXMgbm90IHNl
dApDT05GSUdfSU5QVVRfQURCSElEPXkKQ09ORklHX01BQ19FTVVNT1VTRUJUTj1tCkNPTkZJR19U
SEVSTV9XSU5EVFVOTkVMPW0KQ09ORklHX1RIRVJNX0FEVDc0Nlg9bQpDT05GSUdfV0lOREZBUk09
bQojIENPTkZJR19QTUFDX1JBQ0tNRVRFUiBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0FNUz1t
CkNPTkZJR19TRU5TT1JTX0FNU19QTVU9eQpDT05GSUdfU0VOU09SU19BTVNfSTJDPXkKQ09ORklH
X05FVERFVklDRVM9eQpDT05GSUdfTkVUX0NPUkU9eQojIENPTkZJR19CT05ESU5HIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFVNTVkgaXMgbm90IHNldApDT05GSUdfV0lSRUdVQVJEPW0KIyBDT05GSUdf
V0lSRUdVQVJEX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRVFVQUxJWkVSIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX0ZDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1RFQU0gaXMgbm90IHNldAoj
IENPTkZJR19NQUNWTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWTEFOIGlzIG5vdCBzZXQKIyBD
T05GSUdfVlhMQU4gaXMgbm90IHNldAojIENPTkZJR19HRU5FVkUgaXMgbm90IHNldAojIENPTkZJ
R19CQVJFVURQIGlzIG5vdCBzZXQKIyBDT05GSUdfR1RQIGlzIG5vdCBzZXQKIyBDT05GSUdfUEZD
UCBpcyBub3Qgc2V0CiMgQ09ORklHX01BQ1NFQyBpcyBub3Qgc2V0CkNPTkZJR19ORVRDT05TT0xF
PXkKIyBDT05GSUdfTkVUQ09OU09MRV9FWFRFTkRFRF9MT0cgaXMgbm90IHNldApDT05GSUdfTkVU
UE9MTD15CkNPTkZJR19ORVRfUE9MTF9DT05UUk9MTEVSPXkKQ09ORklHX1RVTj1tCiMgQ09ORklH
X1RVTl9WTkVUX0NST1NTX0xFIGlzIG5vdCBzZXQKIyBDT05GSUdfVkVUSCBpcyBub3Qgc2V0CkNP
TkZJR19WSVJUSU9fTkVUPXkKIyBDT05GSUdfTkxNT04gaXMgbm90IHNldAojIENPTkZJR19ORVRL
SVQgaXMgbm90IHNldApDT05GSUdfU1VOR0VNX1BIWT15CiMgQ09ORklHX0FSQ05FVCBpcyBub3Qg
c2V0CkNPTkZJR19FVEhFUk5FVD15CiMgQ09ORklHX05FVF9WRU5ET1JfM0NPTSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9WRU5ET1JfQURBUFRFQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5E
T1JfQUdFUkUgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0FMQUNSSVRFQ0ggaXMgbm90
IHNldAojIENPTkZJR19ORVRfVkVORE9SX0FMVEVPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0FMVEVS
QV9UU0UgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0FNQVpPTiBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9WRU5ET1JfQU1EIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BUFBM
RSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQVFVQU5USUEgaXMgbm90IHNldAojIENP
TkZJR19ORVRfVkVORE9SX0FSQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQVNJWCBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQVRIRVJPUyBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9WRU5ET1JfQlJPQURDT00gaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0NBREVO
Q0UgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0NBVklVTSBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVF9WRU5ET1JfQ0hFTFNJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQ0lT
Q08gaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0NPUlRJTkEgaXMgbm90IHNldAojIENP
TkZJR19ORVRfVkVORE9SX0RBVklDT00gaXMgbm90IHNldAojIENPTkZJR19ETkVUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9ERUMgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9S
X0RMSU5LIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9FTVVMRVggaXMgbm90IHNldAoj
IENPTkZJR19ORVRfVkVORE9SX0VOR0xFREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9FWkNISVAgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0ZVSklUU1UgaXMgbm90IHNl
dAojIENPTkZJR19ORVRfVkVORE9SX0ZVTkdJQkxFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9HT09HTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0hVQVdFSSBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9WRU5ET1JfSU5URUwgaXMgbm90IHNldAojIENPTkZJR19KTUUgaXMg
bm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0xJVEVYIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9NQVJWRUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9NRUxMQU5PWCBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTUVUQSBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfTUlDUkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9NSUNST0NISVAg
aXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01JQ1JPU0VNSSBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVF9WRU5ET1JfTUlDUk9TT0ZUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9N
WVJJIGlzIG5vdCBzZXQKIyBDT05GSUdfRkVBTE5YIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9OSSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTkFUU0VNSSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9WRU5ET1JfTkVURVJJT04gaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVO
RE9SX05FVFJPTk9NRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTlZJRElBIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9PS0kgaXMgbm90IHNldAojIENPTkZJR19FVEhPQyBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfUEFDS0VUX0VOR0lORVMgaXMgbm90IHNldAoj
IENPTkZJR19ORVRfVkVORE9SX1BFTlNBTkRPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9RTE9HSUMgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0JST0NBREUgaXMgbm90IHNl
dAojIENPTkZJR19ORVRfVkVORE9SX1FVQUxDT01NIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9SREMgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1JFQUxURUsgaXMgbm90IHNl
dAojIENPTkZJR19ORVRfVkVORE9SX1JFTkVTQVMgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVO
RE9SX1JPQ0tFUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU0FNU1VORyBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU0VFUSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5E
T1JfU0lMQU4gaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1NJUyBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9WRU5ET1JfU09MQVJGTEFSRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5E
T1JfU01TQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU09DSU9ORVhUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TVE1JQ1JPIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5E
T1JfU1VOPXkKIyBDT05GSUdfSEFQUFlNRUFMIGlzIG5vdCBzZXQKQ09ORklHX1NVTkdFTT15CiMg
Q09ORklHX0NBU1NJTkkgaXMgbm90IHNldAojIENPTkZJR19OSVUgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfVkVORE9SX1NZTk9QU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9URUhV
VEkgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1RJIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX1ZFTkRPUl9WRVJURVhDT00gaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1ZJQSBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfV0FOR1hVTiBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9WRU5ET1JfV0laTkVUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9YSUxJTlgg
aXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1hJUkNPTSBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZEREkgaXMgbm90IHNldAojIENPTkZJR19ISVBQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWUxJ
QiBpcyBub3Qgc2V0CiMgQ09ORklHX01ESU9fREVWSUNFIGlzIG5vdCBzZXQKCiMKIyBQQ1MgZGV2
aWNlIGRyaXZlcnMKIwojIENPTkZJR19QQ1NfWFBDUyBpcyBub3Qgc2V0CiMgZW5kIG9mIFBDUyBk
ZXZpY2UgZHJpdmVycwoKIyBDT05GSUdfUFBQIGlzIG5vdCBzZXQKIyBDT05GSUdfU0xJUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9ORVRfRFJJVkVSUyBpcyBub3Qgc2V0CkNPTkZJR19XTEFOPXkK
IyBDT05GSUdfV0xBTl9WRU5ET1JfQURNVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5E
T1JfQVRIIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfQVRNRUwgaXMgbm90IHNldAoj
IENPTkZJR19XTEFOX1ZFTkRPUl9CUk9BRENPTSBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVO
RE9SX0lOVEVMIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfSU5URVJTSUwgaXMgbm90
IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9NQVJWRUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xB
Tl9WRU5ET1JfTUVESUFURUsgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9NSUNST0NI
SVAgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9QVVJFTElGSSBpcyBub3Qgc2V0CiMg
Q09ORklHX1dMQU5fVkVORE9SX1JBTElOSyBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9S
RUFMVEVLPXkKIyBDT05GSUdfUlRMODE4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDgxODcgaXMg
bm90IHNldAojIENPTkZJR19SVExfQ0FSRFMgaXMgbm90IHNldApDT05GSUdfUlRMOFhYWFU9bQoj
IENPTkZJR19SVEw4WFhYVV9VTlRFU1RFRCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUVzg4IGlzIG5v
dCBzZXQKIyBDT05GSUdfUlRXODkgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9SU0kg
aXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9TSUxBQlMgaXMgbm90IHNldAojIENPTkZJ
R19XTEFOX1ZFTkRPUl9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX1RJIGlzIG5v
dCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfWllEQVMgaXMgbm90IHNldAojIENPTkZJR19XTEFO
X1ZFTkRPUl9RVUFOVEVOTkEgaXMgbm90IHNldAojIENPTkZJR19NQUM4MDIxMV9IV1NJTSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZJUlRfV0lGSSBpcyBub3Qgc2V0CiMgQ09ORklHX1dBTiBpcyBub3Qg
c2V0CgojCiMgV2lyZWxlc3MgV0FOCiMKIyBDT05GSUdfV1dBTiBpcyBub3Qgc2V0CiMgZW5kIG9m
IFdpcmVsZXNzIFdBTgoKIyBDT05GSUdfVk1YTkVUMyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVERF
VlNJTSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfRkFJTE9WRVI9eQojIENPTkZJR19JU0ROIGlzIG5v
dCBzZXQKCiMKIyBJbnB1dCBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19JTlBVVD15CkNPTkZJR19J
TlBVVF9MRURTPXkKQ09ORklHX0lOUFVUX0ZGX01FTUxFU1M9bQojIENPTkZJR19JTlBVVF9TUEFS
U0VLTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfTUFUUklYS01BUCBpcyBub3Qgc2V0Cgoj
CiMgVXNlcmxhbmQgaW50ZXJmYWNlcwojCiMgQ09ORklHX0lOUFVUX01PVVNFREVWIGlzIG5vdCBz
ZXQKQ09ORklHX0lOUFVUX0pPWURFVj1tCkNPTkZJR19JTlBVVF9FVkRFVj15CiMgQ09ORklHX0lO
UFVUX0VWQlVHIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX0tVTklUX1RFU1Q9bQojIENPTkZJR19J
TlBVVF9BUE1QT1dFUiBpcyBub3Qgc2V0CgojCiMgSW5wdXQgRGV2aWNlIERyaXZlcnMKIwojIENP
TkZJR19JTlBVVF9LRVlCT0FSRCBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9NT1VTRT15CiMgQ09O
RklHX01PVVNFX1BTMiBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1NFUklBTCBpcyBub3Qgc2V0
CkNPTkZJR19NT1VTRV9BUFBMRVRPVUNIPW0KIyBDT05GSUdfTU9VU0VfQkNNNTk3NCBpcyBub3Qg
c2V0CiMgQ09ORklHX01PVVNFX0NZQVBBIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfRUxBTl9J
MkMgaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9WU1hYWEFBIGlzIG5vdCBzZXQKIyBDT05GSUdf
TU9VU0VfU1lOQVBUSUNTX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1NZTkFQVElDU19V
U0IgaXMgbm90IHNldApDT05GSUdfSU5QVVRfSk9ZU1RJQ0s9eQojIENPTkZJR19KT1lTVElDS19B
TkFMT0cgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19BM0QgaXMgbm90IHNldAojIENPTkZJ
R19KT1lTVElDS19BREkgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19DT0JSQSBpcyBub3Qg
c2V0CiMgQ09ORklHX0pPWVNUSUNLX0dGMksgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19H
UklQIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfR1JJUF9NUCBpcyBub3Qgc2V0CiMgQ09O
RklHX0pPWVNUSUNLX0dVSUxMRU1PVCBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0lOVEVS
QUNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfU0lERVdJTkRFUiBpcyBub3Qgc2V0CiMg
Q09ORklHX0pPWVNUSUNLX1RNREMgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19JRk9SQ0Ug
aXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19XQVJSSU9SIGlzIG5vdCBzZXQKIyBDT05GSUdf
Sk9ZU1RJQ0tfTUFHRUxMQU4gaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19TUEFDRU9SQiBp
cyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX1NQQUNFQkFMTCBpcyBub3Qgc2V0CiMgQ09ORklH
X0pPWVNUSUNLX1NUSU5HRVIgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19UV0lESk9ZIGlz
IG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfWkhFTkhVQSBpcyBub3Qgc2V0CiMgQ09ORklHX0pP
WVNUSUNLX0FTNTAxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0pPWURVTVAgaXMgbm90
IHNldApDT05GSUdfSk9ZU1RJQ0tfWFBBRD1tCiMgQ09ORklHX0pPWVNUSUNLX1hQQURfRkYgaXMg
bm90IHNldApDT05GSUdfSk9ZU1RJQ0tfWFBBRF9MRURTPXkKIyBDT05GSUdfSk9ZU1RJQ0tfUFhS
QyBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX1FXSUlDIGlzIG5vdCBzZXQKIyBDT05GSUdf
Sk9ZU1RJQ0tfRlNJQTZCIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfU0VOU0VIQVQgaXMg
bm90IHNldAojIENPTkZJR19KT1lTVElDS19TRUVTQVcgaXMgbm90IHNldAojIENPTkZJR19JTlBV
VF9UQUJMRVQgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9UT1VDSFNDUkVFTiBpcyBub3Qgc2V0
CkNPTkZJR19JTlBVVF9NSVNDPXkKIyBDT05GSUdfSU5QVVRfQUQ3MTRYIGlzIG5vdCBzZXQKIyBD
T05GSUdfSU5QVVRfQVRNRUxfQ0FQVE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9CTUEx
NTAgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9FM1gwX0JVVFRPTiBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOUFVUX01NQTg0NTAgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9BVElfUkVNT1RFMiBp
cyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0tFWVNQQU5fUkVNT1RFIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5QVVRfS1hUSjkgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9QT1dFUk1BVEUgaXMgbm90
IHNldAojIENPTkZJR19JTlBVVF9ZRUFMSU5LIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfQ00x
MDkgaXMgbm90IHNldApDT05GSUdfSU5QVVRfVUlOUFVUPW0KIyBDT05GSUdfSU5QVVRfUENGODU3
NCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0RBNzI4MF9IQVBUSUNTIGlzIG5vdCBzZXQKIyBD
T05GSUdfSU5QVVRfQURYTDM0WCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0lNU19QQ1UgaXMg
bm90IHNldAojIENPTkZJR19JTlBVVF9JUVMyNjlBIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRf
SVFTNjI2QSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0lRUzcyMjIgaXMgbm90IHNldAojIENP
TkZJR19JTlBVVF9DTUEzMDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRFJWMjY2NV9IQVBU
SUNTIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRFJWMjY2N19IQVBUSUNTIGlzIG5vdCBzZXQK
IyBDT05GSUdfUk1JNF9DT1JFIGlzIG5vdCBzZXQKCiMKIyBIYXJkd2FyZSBJL08gcG9ydHMKIwoj
IENPTkZJR19TRVJJTyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX01JR0hUX0hBVkVfUENfU0VSSU89
eQojIENPTkZJR19HQU1FUE9SVCBpcyBub3Qgc2V0CiMgZW5kIG9mIEhhcmR3YXJlIEkvTyBwb3J0
cwojIGVuZCBvZiBJbnB1dCBkZXZpY2Ugc3VwcG9ydAoKIwojIENoYXJhY3RlciBkZXZpY2VzCiMK
Q09ORklHX1RUWT15CkNPTkZJR19WVD15CkNPTkZJR19DT05TT0xFX1RSQU5TTEFUSU9OUz15CkNP
TkZJR19WVF9DT05TT0xFPXkKQ09ORklHX1ZUX0hXX0NPTlNPTEVfQklORElORz15CkNPTkZJR19V
TklYOThfUFRZUz15CiMgQ09ORklHX0xFR0FDWV9QVFlTIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVH
QUNZX1RJT0NTVEkgaXMgbm90IHNldApDT05GSUdfTERJU0NfQVVUT0xPQUQ9eQoKIwojIFNlcmlh
bCBkcml2ZXJzCiMKIyBDT05GSUdfU0VSSUFMXzgyNTAgaXMgbm90IHNldAoKIwojIE5vbi04MjUw
IHNlcmlhbCBwb3J0IHN1cHBvcnQKIwojIENPTkZJR19TRVJJQUxfVUFSVExJVEUgaXMgbm90IHNl
dApDT05GSUdfU0VSSUFMX0NPUkU9eQpDT05GSUdfU0VSSUFMX0NPUkVfQ09OU09MRT15CkNPTkZJ
R19TRVJJQUxfUE1BQ1pJTE9HPXkKQ09ORklHX1NFUklBTF9QTUFDWklMT0dfVFRZUz15CkNPTkZJ
R19TRVJJQUxfUE1BQ1pJTE9HX0NPTlNPTEU9eQojIENPTkZJR19TRVJJQUxfSlNNIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VSSUFMX1NJRklWRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TQ0NO
WFAgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfU0MxNklTN1hYIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VSSUFMX0FMVEVSQV9KVEFHVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BTFRF
UkFfVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9YSUxJTlhfUFNfVUFSVCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFUklBTF9BUkMgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfUlAyIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0ZTTF9MUFVBUlQgaXMgbm90IHNldAojIENPTkZJR19T
RVJJQUxfRlNMX0xJTkZMRVhVQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0NPTkVYQU5U
X0RJR0lDT0xPUiBpcyBub3Qgc2V0CiMgZW5kIG9mIFNlcmlhbCBkcml2ZXJzCgojIENPTkZJR19T
RVJJQUxfTk9OU1RBTkRBUkQgaXMgbm90IHNldAojIENPTkZJR19QUENfRVBBUFJfSFZfQllURUNI
QU4gaXMgbm90IHNldAojIENPTkZJR19JUFdJUkVMRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfTl9H
U00gaXMgbm90IHNldAojIENPTkZJR19OT1pPTUkgaXMgbm90IHNldAojIENPTkZJR19OVUxMX1RU
WSBpcyBub3Qgc2V0CkNPTkZJR19IVkNfRFJJVkVSPXkKIyBDT05GSUdfSFZDX1VEQkcgaXMgbm90
IHNldAojIENPTkZJR19TRVJJQUxfREVWX0JVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RUWV9QUklO
VEsgaXMgbm90IHNldApDT05GSUdfVklSVElPX0NPTlNPTEU9eQojIENPTkZJR19JUE1JX0hBTkRM
RVIgaXMgbm90IHNldApDT05GSUdfSFdfUkFORE9NPW0KIyBDT05GSUdfSFdfUkFORE9NX1RJTUVS
SU9NRU0gaXMgbm90IHNldAojIENPTkZJR19IV19SQU5ET01fQkE0MzEgaXMgbm90IHNldApDT05G
SUdfSFdfUkFORE9NX1ZJUlRJTz1tCiMgQ09ORklHX0hXX1JBTkRPTV9DQ1RSTkcgaXMgbm90IHNl
dAojIENPTkZJR19IV19SQU5ET01fWElQSEVSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0FQUExJQ09N
IGlzIG5vdCBzZXQKQ09ORklHX0RFVk1FTT15CkNPTkZJR19OVlJBTT1tCkNPTkZJR19ERVZQT1JU
PXkKIyBDT05GSUdfVENHX1RQTSBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTExZQlVTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfWElMTFlVU0IgaXMgbm90IHNldAojIGVuZCBvZiBDaGFyYWN0ZXIgZGV2aWNl
cwoKIwojIEkyQyBzdXBwb3J0CiMKQ09ORklHX0kyQz15CkNPTkZJR19JMkNfQk9BUkRJTkZPPXkK
IyBDT05GSUdfSTJDX0NPTVBBVCBpcyBub3Qgc2V0CkNPTkZJR19JMkNfQ0hBUkRFVj1tCiMgQ09O
RklHX0kyQ19NVVggaXMgbm90IHNldApDT05GSUdfSTJDX0hFTFBFUl9BVVRPPXkKQ09ORklHX0ky
Q19BTEdPQklUPW0KCiMKIyBJMkMgSGFyZHdhcmUgQnVzIHN1cHBvcnQKIwoKIwojIFBDIFNNQnVz
IGhvc3QgY29udHJvbGxlciBkcml2ZXJzCiMKIyBDT05GSUdfSTJDX0FMSTE1MzUgaXMgbm90IHNl
dAojIENPTkZJR19JMkNfQUxJMTU2MyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTEkxNVgzIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX0FNRDc1NiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTUQ4
MTExIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0k4MDEgaXMgbm90IHNldAojIENPTkZJR19JMkNf
SVNDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19QSUlYNCBpcyBub3Qgc2V0CiMgQ09ORklHX0ky
Q19ORk9SQ0UyIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX05WSURJQV9HUFUgaXMgbm90IHNldAoj
IENPTkZJR19JMkNfU0lTNTU5NSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TSVM2MzAgaXMgbm90
IHNldAojIENPTkZJR19JMkNfU0lTOTZYIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1ZJQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0kyQ19WSUFQUk8gaXMgbm90IHNldAoKIwojIE1hYyBTTUJ1cyBob3N0
IGNvbnRyb2xsZXIgZHJpdmVycwojCkNPTkZJR19JMkNfUE9XRVJNQUM9eQoKIwojIEkyQyBzeXN0
ZW0gYnVzIGRyaXZlcnMgKG1vc3RseSBlbWJlZGRlZCAvIHN5c3RlbS1vbi1jaGlwKQojCiMgQ09O
RklHX0kyQ19ERVNJR05XQVJFX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFU0lH
TldBUkVfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01QQyBpcyBub3Qgc2V0CiMgQ09ORklH
X0kyQ19PQ09SRVMgaXMgbm90IHNldAojIENPTkZJR19JMkNfUENBX1BMQVRGT1JNIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSTJDX1NJTVRFQyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19YSUxJTlggaXMg
bm90IHNldAoKIwojIEV4dGVybmFsIEkyQy9TTUJ1cyBhZGFwdGVyIGRyaXZlcnMKIwojIENPTkZJ
R19JMkNfRElPTEFOX1UyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19DUDI2MTUgaXMgbm90IHNl
dAojIENPTkZJR19JMkNfUENJMVhYWFggaXMgbm90IHNldAojIENPTkZJR19JMkNfUk9CT1RGVVpa
X09TSUYgaXMgbm90IHNldAojIENPTkZJR19JMkNfVEFPU19FVk0gaXMgbm90IHNldAojIENPTkZJ
R19JMkNfVElOWV9VU0IgaXMgbm90IHNldAoKIwojIE90aGVyIEkyQy9TTUJ1cyBidXMgZHJpdmVy
cwojCiMgQ09ORklHX0kyQ19WSVJUSU8gaXMgbm90IHNldAojIGVuZCBvZiBJMkMgSGFyZHdhcmUg
QnVzIHN1cHBvcnQKCiMgQ09ORklHX0kyQ19TVFVCIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NM
QVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFQlVHX0NPUkUgaXMgbm90IHNldAojIENPTkZJ
R19JMkNfREVCVUdfQUxHTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ERUJVR19CVVMgaXMgbm90
IHNldAojIGVuZCBvZiBJMkMgc3VwcG9ydAoKIyBDT05GSUdfSTNDIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BNSSBpcyBub3Qgc2V0CiMgQ09ORklHX0hTSSBp
cyBub3Qgc2V0CiMgQ09ORklHX1BQUyBpcyBub3Qgc2V0CgojCiMgUFRQIGNsb2NrIHN1cHBvcnQK
IwojIENPTkZJR19QVFBfMTU4OF9DTE9DSyBpcyBub3Qgc2V0CkNPTkZJR19QVFBfMTU4OF9DTE9D
S19PUFRJT05BTD15CgojCiMgRW5hYmxlIFBIWUxJQiBhbmQgTkVUV09SS19QSFlfVElNRVNUQU1Q
SU5HIHRvIHNlZSB0aGUgYWRkaXRpb25hbCBjbG9ja3MuCiMKIyBlbmQgb2YgUFRQIGNsb2NrIHN1
cHBvcnQKCiMgQ09ORklHX1BJTkNUUkwgaXMgbm90IHNldAojIENPTkZJR19HUElPTElCIGlzIG5v
dCBzZXQKIyBDT05GSUdfVzEgaXMgbm90IHNldAojIENPTkZJR19QT1dFUl9SRVNFVCBpcyBub3Qg
c2V0CiMgQ09ORklHX1BPV0VSX1NFUVVFTkNJTkcgaXMgbm90IHNldApDT05GSUdfUE9XRVJfU1VQ
UExZPXkKIyBDT05GSUdfUE9XRVJfU1VQUExZX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0FQTV9Q
T1dFUj1tCiMgQ09ORklHX0lQNVhYWF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfUE9X
RVIgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0FEUDUwNjEgaXMgbm90IHNldAojIENPTkZJ
R19CQVRURVJZX0NXMjAxNSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfRFMyNzgwIGlzIG5v
dCBzZXQKIyBDT05GSUdfQkFUVEVSWV9EUzI3ODEgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZ
X0RTMjc4MiBpcyBub3Qgc2V0CkNPTkZJR19CQVRURVJZX1BNVT1tCiMgQ09ORklHX0JBVFRFUllf
U0FNU1VOR19TREkgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX1NCUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0NIQVJHRVJfU0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9CUTI3WFhYIGlz
IG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9NQVgxNzA0MiBpcyBub3Qgc2V0CiMgQ09ORklHX0JB
VFRFUllfTUFYMTcyMFggaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX01BWDg5MDMgaXMgbm90
IHNldAojIENPTkZJR19DSEFSR0VSX0xQODcyNyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJf
TFRDNDE2MkwgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0RFVEVDVE9SX01BWDE0NjU2IGlz
IG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9NQVg3Nzk3NiBpcyBub3Qgc2V0CiMgQ09ORklHX0NI
QVJHRVJfQlEyNDE1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfR0FVR0VfTFRDMjk0MSBp
cyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfR09MREZJU0ggaXMgbm90IHNldAojIENPTkZJR19C
QVRURVJZX1JUNTAzMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQkQ5OTk1NCBpcyBub3Qg
c2V0CiMgQ09ORklHX0JBVFRFUllfVUczMTA1IGlzIG5vdCBzZXQKIyBDT05GSUdfRlVFTF9HQVVH
RV9NTTgwMTMgaXMgbm90IHNldApDT05GSUdfSFdNT049bQpDT05GSUdfSFdNT05fREVCVUdfQ0hJ
UD15CgojCiMgTmF0aXZlIGRyaXZlcnMKIwojIENPTkZJR19TRU5TT1JTX0FENzQxNCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfQUQ3NDE4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19B
RE0xMDI1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRE0xMDI2IGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19BRE0xMDI5IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRE0xMDMx
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRE0xMTc3IGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19BRE05MjQwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRFQ3NDEwIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19BRFQ3NDExIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19BRFQ3NDYyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRFQ3NDcwIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19BRFQ3NDc1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BSFQx
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVFVQUNPTVBVVEVSX0Q1TkVYVCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfQVMzNzAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FT
Qzc2MjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FTVVNfUk9HX1JZVUpJTiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfQVhJX0ZBTl9DT05UUk9MIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19BVFhQMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQ0hJUENBUDIgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0NPUlNBSVJfQ1BSTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfQ09SU0FJUl9QU1UgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19EUklWRVRFTVA9bQoj
IENPTkZJR19TRU5TT1JTX0RTNjIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19EUzE2MjEg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0k1S19BTUIgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0Y3NTM3NVMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0dJR0FCWVRFX1dBVEVS
Rk9SQ0UgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0dMNTE4U00gaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0dMNTIwU00gaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0c3NjBBIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19HNzYyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19ISUg2MTMwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19IUzMwMDEgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0pDNDIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1BPV0VSWiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUE9XUjEyMjAgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0xJTkVBR0UgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzI5NDUgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzI5NDdfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19MVEMyOTkwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEMyOTkxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19MVEM0MTUxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19M
VEM0MjE1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0MjIyIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19MVEM0MjQ1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0MjYw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0MjYxIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19MVEM0MjgyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgxMjcgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX01BWDE2MDY1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19NQVgxNjE5IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgxNjY4IGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19NQVgxOTcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDMx
NzMwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgzMTc2MCBpcyBub3Qgc2V0CiMgQ09O
RklHX01BWDMxODI3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVg2NjIwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19NQVg2NjIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19N
QVg2NjM5IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVg2NjUwIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19NQVg2Njk3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgzMTc5
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUMzNFZSNTAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19NQ1AzMDIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UQzY1NCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVFBTMjM4NjEgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX01SNzUyMDMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNNjMgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0xNNzMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNNzUgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNNzcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0xNNzggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNODAgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX0xNODMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNODUgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0xNODcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTAg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTIgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0xNOTMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTUyMzQgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0xNOTUyNDEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTUy
NDUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05DVDY3NzVfSTJDIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19OQ1Q3ODAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OUENNN1hY
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OWlhUX0tSQUtFTjIgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX05aWFRfS1JBS0VOMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTlpY
VF9TTUFSVDIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX09DQ19QOF9JMkMgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX1BDRjg1OTEgaXMgbm90IHNldAojIENPTkZJR19QTUJVUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUFQ1MTYxTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfU0JUU0kgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NCUk1JIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19TSFQyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0hUM3ggaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1NIVDR4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19TSFRDMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0lTNTU5NSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfRU1DMTQwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRU1DMjEw
MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRU1DMjMwNSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfRU1DNlcyMDEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NNU0M0N00xOTIg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NUVFM3NTEgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0FEQzEyOEQ4MTggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FEUzc4MjggaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX0FNQzY4MjEgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0lOQTIwOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSU5BMlhYIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19JTkEyMzggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0lOQTMy
MjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NQRDUxMTggaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX1RDNzQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RITUM1MCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QMTAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19U
TVAxMDMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDEwOCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfVE1QNDAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UTVA0MjEgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDQ2NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfVE1QNTEzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19WSUE2ODZBIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19WVDgyMzEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4Mzc3
M0cgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4Mzc4MUQgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX1c4Mzc5MUQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4Mzc5MkQgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4Mzc5MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfVzgzNzk1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODNMNzg1VFMgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX1c4M0w3ODZORyBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUwg
aXMgbm90IHNldAojIENPTkZJR19XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19TU0JfUE9TU0lC
TEU9eQpDT05GSUdfU1NCPW0KQ09ORklHX1NTQl9TUFJPTT15CkNPTkZJR19TU0JfUENJSE9TVF9Q
T1NTSUJMRT15CkNPTkZJR19TU0JfUENJSE9TVD15CkNPTkZJR19TU0JfUENNQ0lBSE9TVF9QT1NT
SUJMRT15CkNPTkZJR19TU0JfUENNQ0lBSE9TVD15CkNPTkZJR19TU0JfRFJJVkVSX1BDSUNPUkVf
UE9TU0lCTEU9eQpDT05GSUdfU1NCX0RSSVZFUl9QQ0lDT1JFPXkKQ09ORklHX0JDTUFfUE9TU0lC
TEU9eQojIENPTkZJR19CQ01BIGlzIG5vdCBzZXQKCiMKIyBNdWx0aWZ1bmN0aW9uIGRldmljZSBk
cml2ZXJzCiMKIyBDT05GSUdfTUZEX0FDVDg5NDVBIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FT
MzcxMSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9TTVBSTyBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9BUzM3MjIgaXMgbm90IHNldAojIENPTkZJR19QTUlDX0FEUDU1MjAgaXMgbm90IHNldAojIENP
TkZJR19NRkRfQVRNRUxfRkxFWENPTSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BVE1FTF9ITENE
QyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9CQ001OTBYWCBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9CRDk1NzFNV1YgaXMgbm90IHNldAojIENPTkZJR19NRkRfQVhQMjBYX0kyQyBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9DUzQyTDQzX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQURFUkEg
aXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNTk3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BNSUNf
REE5MDNYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA1Ml9JMkMgaXMgbm90IHNldAojIENP
TkZJR19NRkRfREE5MDU1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA2MiBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9EQTkwNjMgaXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MTUwIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX0RMTjIgaXMgbm90IHNldAojIENPTkZJR19NRkRfR0FURVdPUktT
X0dTQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQzEzWFhYX0kyQyBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9NUDI2MjkgaXMgbm90IHNldAojIENPTkZJR19NRkRfSEk2NDIxX1BNSUMgaXMgbm90
IHNldAojIENPTkZJR19MUENfSUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTFBDX1NDSCBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9JUVM2MlggaXMgbm90IHNldAojIENPTkZJR19NRkRfSkFOWl9DTU9E
SU8gaXMgbm90IHNldAojIENPTkZJR19NRkRfS0VNUExEIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
Xzg4UE04MDAgaXMgbm90IHNldAojIENPTkZJR19NRkRfODhQTTgwNSBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF84OFBNODYwWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF84OFBNODg2X1BNSUMgaXMg
bm90IHNldAojIENPTkZJR19NRkRfTUFYMTQ1NzcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFY
Nzc1NDEgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc2MjAgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfTUFYNzc2NTAgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc2ODYgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfTUFYNzc2OTMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc3MTQg
aXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc4NDMgaXMgbm90IHNldAojIENPTkZJR19NRkRf
TUFYODkwNyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4OTI1IGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX01BWDg5OTcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODk5OCBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9NVDYzNjAgaXMgbm90IHNldAojIENPTkZJR19NRkRfTVQ2MzcwIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX01UNjM5NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NRU5GMjFC
TUMgaXMgbm90IHNldAojIENPTkZJR19NRkRfVklQRVJCT0FSRCBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9OVFhFQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SRVRVIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX1BDRjUwNjMzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NZNzYzNkEgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfUkRDMzIxWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SVDQ4MzEgaXMg
bm90IHNldAojIENPTkZJR19NRkRfUlQ1MDMzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JUNTEy
MCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SQzVUNTgzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X1JLOFhYX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9STjVUNjE4IGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX1NFQ19DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NJNDc2WF9DT1JFIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX1NNNTAxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NLWTgx
NDUyIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NUTVBFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X1NZU0NPTiBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MUDM5NDMgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfTFA4Nzg4IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xNVSBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9QQUxNQVMgaXMgbm90IHNldAojIENPTkZJR19UUFM2MTA1WCBpcyBub3Qgc2V0
CiMgQ09ORklHX1RQUzY1MDdYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1MDg2IGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1MDkwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1
MjE3IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xQODczWCBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9USV9MUDg3NTY1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1MjE4IGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX1RQUzY1MjE5IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1ODZY
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1OTEyX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9UUFM2NTk0X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RXTDQwMzBfQ09SRSBpcyBub3Qg
c2V0CiMgQ09ORklHX1RXTDYwNDBfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTDEyNzNf
Q09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MTTM1MzMgaXMgbm90IHNldAojIENPTkZJR19N
RkRfVEMzNTg5WCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UUU1YODYgaXMgbm90IHNldAojIENP
TkZJR19NRkRfVlg4NTUgaXMgbm90IHNldAojIENPTkZJR19NRkRfTE9DSE5BR0FSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX0FSSVpPTkFfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1dNODQw
MCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTgzMVhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1dNODM1MF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004OTk0IGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX1JPSE1fQkQ3MThYWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9ST0hNX0JE
NzE4MjggaXMgbm90IHNldAojIENPTkZJR19NRkRfUk9ITV9CRDk1N1hNVUYgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfUk9ITV9CRDk2ODAxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NUUE1JQzEg
aXMgbm90IHNldAojIENPTkZJR19NRkRfU1RNRlggaXMgbm90IHNldAojIENPTkZJR19NRkRfQVRD
MjYwWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfUUNPTV9QTTgwMDggaXMgbm90IHNldAoj
IENPTkZJR19NRkRfQ1M0MEw1MF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfUlNNVV9JMkMg
aXMgbm90IHNldAojIGVuZCBvZiBNdWx0aWZ1bmN0aW9uIGRldmljZSBkcml2ZXJzCgojIENPTkZJ
R19SRUdVTEFUT1IgaXMgbm90IHNldAojIENPTkZJR19SQ19DT1JFIGlzIG5vdCBzZXQKCiMKIyBD
RUMgc3VwcG9ydAojCiMgQ09ORklHX01FRElBX0NFQ19TVVBQT1JUIGlzIG5vdCBzZXQKIyBlbmQg
b2YgQ0VDIHN1cHBvcnQKCiMgQ09ORklHX01FRElBX1NVUFBPUlQgaXMgbm90IHNldAoKIwojIEdy
YXBoaWNzIHN1cHBvcnQKIwpDT05GSUdfQVBFUlRVUkVfSEVMUEVSUz15CkNPTkZJR19WSURFTz15
CiMgQ09ORklHX0FVWERJU1BMQVkgaXMgbm90IHNldAojIENPTkZJR19BR1AgaXMgbm90IHNldApD
T05GSUdfRFJNPXkKQ09ORklHX0RSTV9ERUJVR19NTT15CkNPTkZJR19EUk1fS1VOSVRfVEVTVF9I
RUxQRVJTPW0KQ09ORklHX0RSTV9LVU5JVF9URVNUPW0KQ09ORklHX0RSTV9LTVNfSEVMUEVSPXkK
IyBDT05GSUdfRFJNX0RFQlVHX0RQX01TVF9UT1BPTE9HWV9SRUZTIGlzIG5vdCBzZXQKQ09ORklH
X0RSTV9ERUJVR19NT0RFU0VUX0xPQ0s9eQpDT05GSUdfRFJNX0ZCREVWX0VNVUxBVElPTj15CkNP
TkZJR19EUk1fRkJERVZfT1ZFUkFMTE9DPTEwMAojIENPTkZJR19EUk1fRkJERVZfTEVBS19QSFlT
X1NNRU0gaXMgbm90IHNldAojIENPTkZJR19EUk1fTE9BRF9FRElEX0ZJUk1XQVJFIGlzIG5vdCBz
ZXQKQ09ORklHX0RSTV9ESVNQTEFZX0hFTFBFUj1tCiMgQ09ORklHX0RSTV9ESVNQTEFZX0RQX0FV
WF9DRUMgaXMgbm90IHNldAojIENPTkZJR19EUk1fRElTUExBWV9EUF9BVVhfQ0hBUkRFViBpcyBu
b3Qgc2V0CkNPTkZJR19EUk1fRElTUExBWV9EUF9IRUxQRVI9eQpDT05GSUdfRFJNX0RJU1BMQVlf
SERNSV9IRUxQRVI9eQpDT05GSUdfRFJNX0RJU1BMQVlfSERNSV9TVEFURV9IRUxQRVI9eQpDT05G
SUdfRFJNX1RUTT1tCkNPTkZJR19EUk1fRVhFQz1tCkNPTkZJR19EUk1fQlVERFk9bQpDT05GSUdf
RFJNX1ZSQU1fSEVMUEVSPW0KQ09ORklHX0RSTV9UVE1fSEVMUEVSPW0KQ09ORklHX0RSTV9HRU1f
U0hNRU1fSEVMUEVSPW0KQ09ORklHX0RSTV9TVUJBTExPQ19IRUxQRVI9bQoKIwojIEkyQyBlbmNv
ZGVyIG9yIGhlbHBlciBjaGlwcwojCiMgQ09ORklHX0RSTV9JMkNfQ0g3MDA2IGlzIG5vdCBzZXQK
IyBDT05GSUdfRFJNX0kyQ19TSUwxNjQgaXMgbm90IHNldAojIENPTkZJR19EUk1fSTJDX05YUF9U
REE5OThYIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0kyQ19OWFBfVERBOTk1MCBpcyBub3Qgc2V0
CiMgZW5kIG9mIEkyQyBlbmNvZGVyIG9yIGhlbHBlciBjaGlwcwoKIwojIEFSTSBkZXZpY2VzCiMK
IyBlbmQgb2YgQVJNIGRldmljZXMKCkNPTkZJR19EUk1fUkFERU9OPW0KQ09ORklHX0RSTV9SQURF
T05fVVNFUlBUUj15CiMgQ09ORklHX0RSTV9BTURHUFUgaXMgbm90IHNldAojIENPTkZJR19EUk1f
Tk9VVkVBVSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9YRSBpcyBub3Qgc2V0CkNPTkZJR19EUk1f
VkdFTT1tCiMgQ09ORklHX0RSTV9WS01TIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1VETCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RSTV9BU1QgaXMgbm90IHNldAojIENPTkZJR19EUk1fTUdBRzIwMCBp
cyBub3Qgc2V0CiMgQ09ORklHX0RSTV9RWEwgaXMgbm90IHNldApDT05GSUdfRFJNX1ZJUlRJT19H
UFU9bQpDT05GSUdfRFJNX1ZJUlRJT19HUFVfS01TPXkKQ09ORklHX0RSTV9QQU5FTD15CgojCiMg
RGlzcGxheSBQYW5lbHMKIwojIENPTkZJR19EUk1fUEFORUxfTFZEUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9QQU5FTF9PTElNRVhfTENEX09MSU5VWElOTyBpcyBub3Qgc2V0CiMgQ09ORklHX0RS
TV9QQU5FTF9TQU1TVU5HX1M2RTg4QTBfQU1TNDUyRUYwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RS
TV9QQU5FTF9TQU1TVU5HX0FUTkEzM1hDMjAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxf
U0FNU1VOR19TNkQ3QUEwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1NBTVNVTkdfUzZF
NjNNMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5HX1M2RThBQTAgaXMgbm90
IHNldAojIENPTkZJR19EUk1fUEFORUxfU0VJS09fNDNXVkYxRyBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9QQU5FTF9FRFAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0lNUExFIGlzIG5v
dCBzZXQKIyBlbmQgb2YgRGlzcGxheSBQYW5lbHMKCkNPTkZJR19EUk1fQlJJREdFPXkKQ09ORklH
X0RSTV9QQU5FTF9CUklER0U9eQoKIwojIERpc3BsYXkgSW50ZXJmYWNlIEJyaWRnZXMKIwojIENP
TkZJR19EUk1fQ0hJUE9ORV9JQ042MjExIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0NIUk9OVEVM
X0NINzAzMyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9ESVNQTEFZX0NPTk5FQ1RPUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9JVEVfSVQ2NTA1IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0xPTlRJ
VU1fTFQ4OTEyQiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9MT05USVVNX0xUOTIxMSBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9MT05USVVNX0xUOTYxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9M
T05USVVNX0xUOTYxMVVYQyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9JVEVfSVQ2NjEyMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RSTV9MVkRTX0NPREVDIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX01F
R0FDSElQU19TVERQWFhYWF9HRV9CODUwVjNfRlcgaXMgbm90IHNldAojIENPTkZJR19EUk1fTlhQ
X1BUTjM0NjAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFSQURFX1BTODYyMiBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9QQVJBREVfUFM4NjQwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1NJTF9T
SUk4NjIwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1NJSTkwMlggaXMgbm90IHNldAojIENPTkZJ
R19EUk1fU0lJOTIzNCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TSU1QTEVfQlJJREdFIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFJNX1RISU5FX1RIQzYzTFZEMTAyNCBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9UT1NISUJBX1RDMzU4NzYyIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RPU0hJQkFfVEMz
NTg3NjQgaXMgbm90IHNldAojIENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc2NyBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9UT1NISUJBX1RDMzU4NzY4IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RP
U0hJQkFfVEMzNTg3NzUgaXMgbm90IHNldAojIENPTkZJR19EUk1fVElfRExQQzM0MzMgaXMgbm90
IHNldAojIENPTkZJR19EUk1fVElfVEZQNDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RJX1NO
NjVEU0k4MyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9USV9TTjY1RFNJODYgaXMgbm90IHNldAoj
IENPTkZJR19EUk1fVElfVFBEMTJTMDE1IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0FOQUxPR0lY
X0FOWDYzNDUgaXMgbm90IHNldAojIENPTkZJR19EUk1fQU5BTE9HSVhfQU5YNzhYWCBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9BTkFMT0dJWF9BTlg3NjI1IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJN
X0kyQ19BRFY3NTExIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0NETlNfRFNJIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFJNX0NETlNfTUhEUDg1NDYgaXMgbm90IHNldAojIGVuZCBvZiBEaXNwbGF5IElu
dGVyZmFjZSBCcmlkZ2VzCgojIENPTkZJR19EUk1fRVROQVZJViBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9MT0dJQ1ZDIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0FSQ1BHVSBpcyBub3Qgc2V0CkNP
TkZJR19EUk1fQk9DSFM9bQojIENPTkZJR19EUk1fQ0lSUlVTX1FFTVUgaXMgbm90IHNldAojIENP
TkZJR19EUk1fR00xMlUzMjAgaXMgbm90IHNldAojIENPTkZJR19EUk1fT0ZEUk0gaXMgbm90IHNl
dAojIENPTkZJR19EUk1fU0lNUExFRFJNIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0dVRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RSTV9TU0QxMzBYIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9FWFBPUlRf
Rk9SX1RFU1RTPXkKQ09ORklHX0RSTV9MSUJfUkFORE9NPXkKQ09ORklHX0RSTV9XRVJST1I9eQpD
T05GSUdfRFJNX1BBTkVMX09SSUVOVEFUSU9OX1FVSVJLUz15CgojCiMgRnJhbWUgYnVmZmVyIERl
dmljZXMKIwpDT05GSUdfRkI9eQpDT05GSUdfRkJfTUFDTU9ERVM9eQojIENPTkZJR19GQl9DSVJS
VVMgaXMgbm90IHNldAojIENPTkZJR19GQl9QTTIgaXMgbm90IHNldAojIENPTkZJR19GQl9DWUJF
UjIwMDAgaXMgbm90IHNldApDT05GSUdfRkJfT0Y9eQojIENPTkZJR19GQl9DT05UUk9MIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkJfUExBVElOVU0gaXMgbm90IHNldAojIENPTkZJR19GQl9WQUxLWVJJ
RSBpcyBub3Qgc2V0CkNPTkZJR19GQl9DVDY1NTUwPXkKIyBDT05GSUdfRkJfQVNJTElBTlQgaXMg
bm90IHNldAojIENPTkZJR19GQl9JTVNUVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1VWRVNBIGlz
IG5vdCBzZXQKIyBDT05GSUdfRkJfT1BFTkNPUkVTIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUzFE
MTNYWFggaXMgbm90IHNldAojIENPTkZJR19GQl9OVklESUEgaXMgbm90IHNldAojIENPTkZJR19G
Ql9SSVZBIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfSTc0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZC
X01BVFJPWCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1JBREVPTiBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZCX0FUWTEyOCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FUWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZCX1MzIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU0FWQUdFIGlzIG5vdCBzZXQKIyBDT05GSUdf
RkJfU0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfTkVPTUFHSUMgaXMgbm90IHNldAojIENPTkZJ
R19GQl9LWVJPIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfM0RGWCBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZCX1ZUODYyMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1RSSURFTlQgaXMgbm90IHNldAojIENP
TkZJR19GQl9BUksgaXMgbm90IHNldAojIENPTkZJR19GQl9QTTMgaXMgbm90IHNldAojIENPTkZJ
R19GQl9DQVJNSU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU01TQ1VGWCBpcyBub3Qgc2V0CiMg
Q09ORklHX0ZCX0lCTV9HWFQ0NTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVklSVFVBTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZCX01FVFJPTk9NRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX01CODYy
WFggaXMgbm90IHNldAojIENPTkZJR19GQl9TSU1QTEUgaXMgbm90IHNldAojIENPTkZJR19GQl9T
TTcxMiBpcyBub3Qgc2V0CkNPTkZJR19GQl9DT1JFPXkKQ09ORklHX0ZCX05PVElGWT15CiMgQ09O
RklHX0ZJUk1XQVJFX0VESUQgaXMgbm90IHNldAojIENPTkZJR19GQl9ERVZJQ0UgaXMgbm90IHNl
dApDT05GSUdfRkJfQ0ZCX0ZJTExSRUNUPXkKQ09ORklHX0ZCX0NGQl9DT1BZQVJFQT15CkNPTkZJ
R19GQl9DRkJfSU1BR0VCTElUPXkKQ09ORklHX0ZCX1NZU19GSUxMUkVDVD15CkNPTkZJR19GQl9T
WVNfQ09QWUFSRUE9eQpDT05GSUdfRkJfU1lTX0lNQUdFQkxJVD15CiMgQ09ORklHX0ZCX0ZPUkVJ
R05fRU5ESUFOIGlzIG5vdCBzZXQKQ09ORklHX0ZCX1NZU01FTV9GT1BTPXkKQ09ORklHX0ZCX0RF
RkVSUkVEX0lPPXkKQ09ORklHX0ZCX0lPTUVNX0ZPUFM9eQpDT05GSUdfRkJfSU9NRU1fSEVMUEVS
Uz15CkNPTkZJR19GQl9TWVNNRU1fSEVMUEVSUz15CkNPTkZJR19GQl9TWVNNRU1fSEVMUEVSU19E
RUZFUlJFRD15CiMgQ09ORklHX0ZCX01PREVfSEVMUEVSUyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZC
X1RJTEVCTElUVElORyBpcyBub3Qgc2V0CiMgZW5kIG9mIEZyYW1lIGJ1ZmZlciBEZXZpY2VzCgoj
CiMgQmFja2xpZ2h0ICYgTENEIGRldmljZSBzdXBwb3J0CiMKQ09ORklHX0xDRF9DTEFTU19ERVZJ
Q0U9bQpDT05GSUdfTENEX1BMQVRGT1JNPW0KQ09ORklHX0JBQ0tMSUdIVF9DTEFTU19ERVZJQ0U9
bQojIENPTkZJR19CQUNLTElHSFRfS1REMjgwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdI
VF9LVFo4ODY2IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX1FDT01fV0xFRCBpcyBub3Qg
c2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9BRFA4ODYwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJ
R0hUX0FEUDg4NzAgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfTE0zNTA5IGlzIG5vdCBz
ZXQKIyBDT05GSUdfQkFDS0xJR0hUX0xNMzYzOSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdI
VF9MVjUyMDdMUCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9CRDYxMDcgaXMgbm90IHNl
dAojIENPTkZJR19CQUNLTElHSFRfQVJDWENOTiBpcyBub3Qgc2V0CkNPTkZJR19CQUNLTElHSFRf
TEVEPW0KIyBlbmQgb2YgQmFja2xpZ2h0ICYgTENEIGRldmljZSBzdXBwb3J0CgpDT05GSUdfSERN
ST15CgojCiMgQ29uc29sZSBkaXNwbGF5IGRyaXZlciBzdXBwb3J0CiMKQ09ORklHX0RVTU1ZX0NP
TlNPTEU9eQpDT05GSUdfRFVNTVlfQ09OU09MRV9DT0xVTU5TPTgwCkNPTkZJR19EVU1NWV9DT05T
T0xFX1JPV1M9MjUKQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEU9eQojIENPTkZJR19GUkFNRUJV
RkZFUl9DT05TT0xFX0xFR0FDWV9BQ0NFTEVSQVRJT04gaXMgbm90IHNldApDT05GSUdfRlJBTUVC
VUZGRVJfQ09OU09MRV9ERVRFQ1RfUFJJTUFSWT15CiMgQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNP
TEVfUk9UQVRJT04gaXMgbm90IHNldAojIENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX0RFRkVS
UkVEX1RBS0VPVkVSIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ29uc29sZSBkaXNwbGF5IGRyaXZlciBz
dXBwb3J0CgojIENPTkZJR19MT0dPIGlzIG5vdCBzZXQKIyBlbmQgb2YgR3JhcGhpY3Mgc3VwcG9y
dAoKIyBDT05GSUdfRFJNX0FDQ0VMIGlzIG5vdCBzZXQKQ09ORklHX1NPVU5EPW0KQ09ORklHX1NO
RD1tCkNPTkZJR19TTkRfVElNRVI9bQpDT05GSUdfU05EX1BDTT1tCkNPTkZJR19TTkRfSFdERVA9
bQpDT05GSUdfU05EX1NFUV9ERVZJQ0U9bQpDT05GSUdfU05EX1JBV01JREk9bQpDT05GSUdfU05E
X0NPUkVfVEVTVD1tCkNPTkZJR19TTkRfSkFDSz15CkNPTkZJR19TTkRfSkFDS19JTlBVVF9ERVY9
eQojIENPTkZJR19TTkRfT1NTRU1VTCBpcyBub3Qgc2V0CkNPTkZJR19TTkRfUENNX1RJTUVSPXkK
Q09ORklHX1NORF9IUlRJTUVSPW0KQ09ORklHX1NORF9EWU5BTUlDX01JTk9SUz15CkNPTkZJR19T
TkRfTUFYX0NBUkRTPTYKIyBDT05GSUdfU05EX1NVUFBPUlRfT0xEX0FQSSBpcyBub3Qgc2V0CkNP
TkZJR19TTkRfUFJPQ19GUz15CkNPTkZJR19TTkRfVkVSQk9TRV9QUk9DRlM9eQojIENPTkZJR19T
TkRfVkVSQk9TRV9QUklOVEsgaXMgbm90IHNldAojIENPTkZJR19TTkRfQ1RMX0ZBU1RfTE9PS1VQ
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1NORF9DVExf
SU5QVVRfVkFMSURBVElPTj15CkNPTkZJR19TTkRfVk1BU1RFUj15CkNPTkZJR19TTkRfU0VRVUVO
Q0VSPW0KIyBDT05GSUdfU05EX1NFUV9EVU1NWSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU0VRX0hS
VElNRVJfREVGQVVMVD15CkNPTkZJR19TTkRfU0VRX01JRElfRVZFTlQ9bQpDT05GSUdfU05EX1NF
UV9NSURJPW0KQ09ORklHX1NORF9TRVFfVklSTUlEST1tCiMgQ09ORklHX1NORF9TRVFfVU1QIGlz
IG5vdCBzZXQKQ09ORklHX1NORF9EUklWRVJTPXkKIyBDT05GSUdfU05EX0RVTU1ZIGlzIG5vdCBz
ZXQKQ09ORklHX1NORF9BTE9PUD1tCiMgQ09ORklHX1NORF9QQ01URVNUIGlzIG5vdCBzZXQKQ09O
RklHX1NORF9WSVJNSURJPW0KIyBDT05GSUdfU05EX01UUEFWIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NFUklBTF9VMTY1NTAgaXMgbm90IHNldAojIENPTkZJR19TTkRfTVBVNDAxIGlzIG5vdCBz
ZXQKQ09ORklHX1NORF9QQ0k9eQojIENPTkZJR19TTkRfQUQxODg5IGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0FMUzMwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BTFM0MDAwIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX0FMSTU0NTEgaXMgbm90IHNldAojIENPTkZJR19TTkRfQVRJSVhQIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0FUSUlYUF9NT0RFTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9B
VTg4MTAgaXMgbm90IHNldAojIENPTkZJR19TTkRfQVU4ODIwIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX0FVODgzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVzIgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfQVpUMzMyOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9CVDg3WCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9DQTAxMDYgaXMgbm90IHNldAojIENPTkZJR19TTkRfQ01JUENJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX09YWUdFTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9DUzQyODEgaXMg
bm90IHNldAojIENPTkZJR19TTkRfQ1M0NlhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0NUWEZJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RBUkxBMjAgaXMgbm90IHNldAojIENPTkZJR19TTkRf
R0lOQTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0xBWUxBMjAgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfREFSTEEyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9HSU5BMjQgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfTEFZTEEyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9NT05BIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX01JQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FQ0hPM0cgaXMgbm90
IHNldAojIENPTkZJR19TTkRfSU5ESUdPIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lORElHT0lP
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lORElHT0RKIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X0lORElHT0lPWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR09ESlggaXMgbm90IHNldAoj
IENPTkZJR19TTkRfRU1VMTBLMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FTVUxMEsxWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9FTlMxMzcwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0VOUzEz
NzEgaXMgbm90IHNldAojIENPTkZJR19TTkRfRVMxOTM4IGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X0VTMTk2OCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9GTTgwMSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9IRFNQIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEU1BNIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0lDRTE3MTIgaXMgbm90IHNldAojIENPTkZJR19TTkRfSUNFMTcyNCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9JTlRFTDhYMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTlRFTDhYME0g
aXMgbm90IHNldAojIENPTkZJR19TTkRfS09SRzEyMTIgaXMgbm90IHNldAojIENPTkZJR19TTkRf
TE9MQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9MWDY0NjRFUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9NQUVTVFJPMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9NSVhBUlQgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfTk0yNTYgaXMgbm90IHNldAojIENPTkZJR19TTkRfUENYSFIgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfUklQVElERSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9STUUzMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9STUU5NiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9STUU5NjUy
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NFNlggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09O
SUNWSUJFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9UUklERU5UIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1ZJQTgyWFggaXMgbm90IHNldAojIENPTkZJR19TTkRfVklBODJYWF9NT0RFTSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9WSVJUVU9TTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9WWDIy
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9ZTUZQQ0kgaXMgbm90IHNldAoKIwojIEhELUF1ZGlv
CiMKQ09ORklHX1NORF9IREE9bQpDT05GSUdfU05EX0hEQV9JTlRFTD1tCkNPTkZJR19TTkRfSERB
X0hXREVQPXkKQ09ORklHX1NORF9IREFfUkVDT05GSUc9eQojIENPTkZJR19TTkRfSERBX0lOUFVU
X0JFRVAgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX1BBVENIX0xPQURFUiBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9IREFfQ0lSUlVTX1NDT0RFQ19LVU5JVF9URVNUIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX0hEQV9DT0RFQ19SRUFMVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9D
T0RFQ19BTkFMT0cgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX1NJR01BVEVMIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19WSUEgaXMgbm90IHNldApDT05GSUdfU05E
X0hEQV9DT0RFQ19IRE1JPW0KIyBDT05GSUdfU05EX0hEQV9DT0RFQ19DSVJSVVMgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfSERBX0NPREVDX0NTODQwOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9I
REFfQ09ERUNfQ09ORVhBTlQgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX1NFTkFS
WVRFQ0ggaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX0NBMDExMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9IREFfQ09ERUNfQ0EwMTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hE
QV9DT0RFQ19DTUVESUEgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX1NJMzA1NCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfR0VORVJJQyBpcyBub3Qgc2V0CkNPTkZJR19TTkRf
SERBX1BPV0VSX1NBVkVfREVGQVVMVD0wCiMgQ09ORklHX1NORF9IREFfSU5URUxfSERNSV9TSUxF
TlRfU1RSRUFNIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DVExfREVWX0lEIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgSEQtQXVkaW8KCkNPTkZJR19TTkRfSERBX0NPUkU9bQpDT05GSUdfU05EX0hE
QV9DT01QT05FTlQ9eQpDT05GSUdfU05EX0hEQV9QUkVBTExPQ19TSVpFPTIwNDgKQ09ORklHX1NO
RF9JTlRFTF9EU1BfQ09ORklHPW0KIyBDT05GSUdfU05EX1BQQyBpcyBub3Qgc2V0CkNPTkZJR19T
TkRfQU9BPW0KQ09ORklHX1NORF9BT0FfRkFCUklDX0xBWU9VVD1tCkNPTkZJR19TTkRfQU9BX09O
WVg9bQpDT05GSUdfU05EX0FPQV9UQVM9bQpDT05GSUdfU05EX0FPQV9UT09OSUU9bQpDT05GSUdf
U05EX0FPQV9TT1VOREJVUz1tCkNPTkZJR19TTkRfQU9BX1NPVU5EQlVTX0kyUz1tCiMgQ09ORklH
X1NORF9VU0IgaXMgbm90IHNldApDT05GSUdfU05EX0ZJUkVXSVJFPXkKQ09ORklHX1NORF9GSVJF
V0lSRV9MSUI9bQojIENPTkZJR19TTkRfRElDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9PWEZX
IGlzIG5vdCBzZXQKQ09ORklHX1NORF9JU0lHSFQ9bQojIENPTkZJR19TTkRfRklSRVdPUktTIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0JFQk9CIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0ZJUkVX
SVJFX0RJR0kwMFggaXMgbm90IHNldAojIENPTkZJR19TTkRfRklSRVdJUkVfVEFTQ0FNIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0ZJUkVXSVJFX01PVFUgaXMgbm90IHNldAojIENPTkZJR19TTkRf
RklSRUZBQ0UgaXMgbm90IHNldAojIENPTkZJR19TTkRfUENNQ0lBIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9WSVJUSU8gaXMgbm90IHNldApDT05G
SUdfSElEX1NVUFBPUlQ9eQpDT05GSUdfSElEPXkKQ09ORklHX0hJRF9CQVRURVJZX1NUUkVOR1RI
PXkKQ09ORklHX0hJRFJBVz15CkNPTkZJR19VSElEPW0KQ09ORklHX0hJRF9HRU5FUklDPXkKCiMK
IyBTcGVjaWFsIEhJRCBkcml2ZXJzCiMKIyBDT05GSUdfSElEX0E0VEVDSCBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9BQ0NVVE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19ISURfQUNSVVggaXMgbm90
IHNldApDT05GSUdfSElEX0FQUExFPXkKIyBDT05GSUdfSElEX0FQUExFSVIgaXMgbm90IHNldAoj
IENPTkZJR19ISURfQVNVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BVVJFQUwgaXMgbm90IHNl
dAojIENPTkZJR19ISURfQkVMS0lOIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0JFVE9QX0ZGIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX0JJR0JFTl9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9D
SEVSUlkgaXMgbm90IHNldAojIENPTkZJR19ISURfQ0hJQ09OWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9DT1JTQUlSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NPVUdBUiBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9NQUNBTExZIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1BST0RJS0VZUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9DTUVESUEgaXMgbm90IHNldAojIENPTkZJR19ISURfQ1JFQVRJ
VkVfU0IwNTQwIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NZUFJFU1MgaXMgbm90IHNldAojIENP
TkZJR19ISURfRFJBR09OUklTRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FTVNfRkYgaXMgbm90
IHNldAojIENPTkZJR19ISURfRUxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FTEVDT00gaXMg
bm90IHNldAojIENPTkZJR19ISURfRUxPIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0VWSVNJT04g
aXMgbm90IHNldAojIENPTkZJR19ISURfRVpLRVkgaXMgbm90IHNldAojIENPTkZJR19ISURfRlQy
NjAgaXMgbm90IHNldAojIENPTkZJR19ISURfR0VNQklSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9HRlJNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dMT1JJT1VTIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX0hPTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9HT09HTEVfU1RBRElBX0ZGIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX1ZJVkFMREkgaXMgbm90IHNldAojIENPTkZJR19ISURfR1Q2
ODNSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0tFWVRPVUNIIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX0tZRSBpcyBub3Qgc2V0CkNPTkZJR19ISURfVUNMT0dJQz1tCiMgQ09ORklHX0hJRF9XQUxU
T1AgaXMgbm90IHNldAojIENPTkZJR19ISURfVklFV1NPTklDIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX1ZSQzIgaXMgbm90IHNldAojIENPTkZJR19ISURfWElBT01JIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX0dZUkFUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0lDQURFIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX0lURSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9KQUJSQSBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9UV0lOSEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0tFTlNJTkdUT04g
aXMgbm90IHNldAojIENPTkZJR19ISURfTENQT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9M
RUQgaXMgbm90IHNldAojIENPTkZJR19ISURfTEVOT1ZPIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X0xFVFNLRVRDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9MT0dJVEVDSCBpcyBub3Qgc2V0CkNP
TkZJR19ISURfTUFHSUNNT1VTRT15CiMgQ09ORklHX0hJRF9NQUxUUk9OIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX01BWUZMQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01FR0FXT1JMRF9GRiBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9SRURSQUdPTiBpcyBub3Qgc2V0CkNPTkZJR19ISURfTUlD
Uk9TT0ZUPW0KIyBDT05GSUdfSElEX01PTlRFUkVZIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01V
TFRJVE9VQ0ggaXMgbm90IHNldApDT05GSUdfSElEX05JTlRFTkRPPW0KIyBDT05GSUdfTklOVEVO
RE9fRkYgaXMgbm90IHNldAojIENPTkZJR19ISURfTlRJIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X05UUklHIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX05WSURJQV9TSElFTEQgaXMgbm90IHNldAoj
IENPTkZJR19ISURfT1JURUsgaXMgbm90IHNldAojIENPTkZJR19ISURfUEFOVEhFUkxPUkQgaXMg
bm90IHNldAojIENPTkZJR19ISURfUEVOTU9VTlQgaXMgbm90IHNldAojIENPTkZJR19ISURfUEVU
QUxZTlggaXMgbm90IHNldAojIENPTkZJR19ISURfUElDT0xDRCBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9QTEFOVFJPTklDUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QWFJDIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX1JBWkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1BSSU1BWCBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9SRVRST0RFIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9ST0NDQVQ9bQoj
IENPTkZJR19ISURfU0FJVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NBTVNVTkcgaXMgbm90
IHNldAojIENPTkZJR19ISURfU0VNSVRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TSUdNQU1J
Q1JPIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TT05ZPW0KIyBDT05GSUdfU09OWV9GRiBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9TUEVFRExJTksgaXMgbm90IHNldAojIENPTkZJR19ISURfU1RFQU0g
aXMgbm90IHNldAojIENPTkZJR19ISURfU1RFRUxTRVJJRVMgaXMgbm90IHNldAojIENPTkZJR19I
SURfU1VOUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9STUkgaXMgbm90IHNldAojIENPTkZJ
R19ISURfR1JFRU5BU0lBIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NNQVJUSk9ZUExVUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9USVZPIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RPUFNFRUQg
aXMgbm90IHNldAojIENPTkZJR19ISURfVE9QUkUgaXMgbm90IHNldAojIENPTkZJR19ISURfVEhJ
TkdNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RIUlVTVE1BU1RFUiBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9VRFJBV19QUzMgaXMgbm90IHNldAojIENPTkZJR19ISURfVTJGWkVSTyBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9XQUNPTSBpcyBub3Qgc2V0CkNPTkZJR19ISURfV0lJTU9URT1tCiMg
Q09ORklHX0hJRF9XSU5XSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1hJTk1PIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1pFUk9QTFVTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1pZREFDUk9O
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NFTlNPUl9IVUIgaXMgbm90IHNldAojIENPTkZJR19I
SURfQUxQUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NQ1AyMjIxIGlzIG5vdCBzZXQKQ09ORklH
X0hJRF9LVU5JVF9URVNUPW0KIyBlbmQgb2YgU3BlY2lhbCBISUQgZHJpdmVycwoKIwojIEhJRC1C
UEYgc3VwcG9ydAojCiMgZW5kIG9mIEhJRC1CUEYgc3VwcG9ydAoKIwojIFVTQiBISUQgc3VwcG9y
dAojCkNPTkZJR19VU0JfSElEPXkKIyBDT05GSUdfSElEX1BJRCBpcyBub3Qgc2V0CkNPTkZJR19V
U0JfSElEREVWPXkKIyBlbmQgb2YgVVNCIEhJRCBzdXBwb3J0CgojIENPTkZJR19JMkNfSElEIGlz
IG5vdCBzZXQKQ09ORklHX1VTQl9PSENJX0JJR19FTkRJQU5fREVTQz15CkNPTkZJR19VU0JfT0hD
SV9CSUdfRU5ESUFOX01NSU89eQpDT05GSUdfVVNCX09IQ0lfTElUVExFX0VORElBTj15CkNPTkZJ
R19VU0JfU1VQUE9SVD15CkNPTkZJR19VU0JfQ09NTU9OPXkKIyBDT05GSUdfVVNCX0xFRF9UUklH
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1VMUElfQlVTIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9B
UkNIX0hBU19IQ0Q9eQpDT05GSUdfVVNCPXkKQ09ORklHX1VTQl9QQ0k9eQojIENPTkZJR19VU0Jf
UENJX0FNRCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQU5OT1VOQ0VfTkVXX0RFVklDRVM9eQoKIwoj
IE1pc2NlbGxhbmVvdXMgVVNCIG9wdGlvbnMKIwpDT05GSUdfVVNCX0RFRkFVTFRfUEVSU0lTVD15
CiMgQ09ORklHX1VTQl9GRVdfSU5JVF9SRVRSSUVTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0RZ
TkFNSUNfTUlOT1JTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09URyBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9PVEdfUFJPRFVDVExJU1QgaXMgbm90IHNldAojIENPTkZJR19VU0JfT1RHX0RJU0FC
TEVfRVhURVJOQUxfSFVCIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xFRFNfVFJJR0dFUl9VU0JQ
T1JUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9BVVRPU1VTUEVORF9ERUxBWT0yCkNPTkZJR19VU0Jf
REVGQVVMVF9BVVRIT1JJWkFUSU9OX01PREU9MQpDT05GSUdfVVNCX01PTj1tCgojCiMgVVNCIEhv
c3QgQ29udHJvbGxlciBEcml2ZXJzCiMKIyBDT05GSUdfVVNCX0M2N1gwMF9IQ0QgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfWEhDSV9IQ0QgaXMgbm90IHNldApDT05GSUdfVVNCX0VIQ0lfSENEPXkK
Q09ORklHX1VTQl9FSENJX1JPT1RfSFVCX1RUPXkKQ09ORklHX1VTQl9FSENJX1RUX05FV1NDSEVE
PXkKQ09ORklHX1VTQl9FSENJX1BDST15CiMgQ09ORklHX1hQU19VU0JfSENEX1hJTElOWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9FSENJX0ZTTCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfRUhDSV9I
Q0RfUFBDX09GPXkKIyBDT05GSUdfVVNCX0VIQ0lfSENEX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX09YVTIxMEhQX0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JU1AxMTZYX0hD
RCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfT0hDSV9IQ0Q9eQpDT05GSUdfVVNCX09IQ0lfSENEX1BQ
Q19PRl9CRT15CiMgQ09ORklHX1VTQl9PSENJX0hDRF9QUENfT0ZfTEUgaXMgbm90IHNldApDT05G
SUdfVVNCX09IQ0lfSENEX1BQQ19PRj15CkNPTkZJR19VU0JfT0hDSV9IQ0RfUENJPW0KIyBDT05G
SUdfVVNCX09IQ0lfSENEX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1VIQ0lfSENE
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NMODExX0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9SOEE2NjU5N19IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfSENEX1NTQiBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9IQ0RfVEVTVF9NT0RFIGlzIG5vdCBzZXQKCiMKIyBVU0IgRGV2aWNlIENs
YXNzIGRyaXZlcnMKIwojIENPTkZJR19VU0JfQUNNIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1BS
SU5URVIgaXMgbm90IHNldAojIENPTkZJR19VU0JfV0RNIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X1RNQyBpcyBub3Qgc2V0CgojCiMgTk9URTogVVNCX1NUT1JBR0UgZGVwZW5kcyBvbiBTQ1NJIGJ1
dCBCTEtfREVWX1NEIG1heQojCgojCiMgYWxzbyBiZSBuZWVkZWQ7IHNlZSBVU0JfU1RPUkFHRSBI
ZWxwIGZvciBtb3JlIGluZm8KIwpDT05GSUdfVVNCX1NUT1JBR0U9bQojIENPTkZJR19VU0JfU1RP
UkFHRV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX1JFQUxURUsgaXMgbm90
IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9EQVRBRkFCIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X1NUT1JBR0VfRlJFRUNPTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX0lTRDIwMCBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX1VTQkFUIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1NUT1JBR0VfU0REUjA5IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfU0REUjU1
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfSlVNUFNIT1QgaXMgbm90IHNldAojIENP
TkZJR19VU0JfU1RPUkFHRV9BTEFVREEgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9P
TkVUT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX0tBUk1BIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NUT1JBR0VfQ1lQUkVTU19BVEFDQiBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9TVE9SQUdFX0VORV9VQjYyNTAgaXMgbm90IHNldApDT05GSUdfVVNCX1VBUz1tCgojCiMgVVNC
IEltYWdpbmcgZGV2aWNlcwojCiMgQ09ORklHX1VTQl9NREM4MDAgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfTUlDUk9URUsgaXMgbm90IHNldAojIENPTkZJR19VU0JJUF9DT1JFIGlzIG5vdCBzZXQK
CiMKIyBVU0IgZHVhbC1tb2RlIGNvbnRyb2xsZXIgZHJpdmVycwojCiMgQ09ORklHX1VTQl9DRE5T
X1NVUFBPUlQgaXMgbm90IHNldAojIENPTkZJR19VU0JfTVVTQl9IRFJDIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX0RXQzMgaXMgbm90IHNldAojIENPTkZJR19VU0JfRFdDMiBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9DSElQSURFQSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JU1AxNzYwIGlzIG5v
dCBzZXQKCiMKIyBVU0IgcG9ydCBkcml2ZXJzCiMKQ09ORklHX1VTQl9TRVJJQUw9bQojIENPTkZJ
R19VU0JfU0VSSUFMX0dFTkVSSUMgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1NJTVBM
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfQUlSQ0FCTEUgaXMgbm90IHNldAojIENP
TkZJR19VU0JfU0VSSUFMX0FSSzMxMTYgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0JF
TEtJTiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfQ0gzNDEgaXMgbm90IHNldAojIENP
TkZJR19VU0JfU0VSSUFMX1dISVRFSEVBVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxf
RElHSV9BQ0NFTEVQT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9DUDIxMFggaXMg
bm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0NZUFJFU1NfTTggaXMgbm90IHNldAojIENPTkZJ
R19VU0JfU0VSSUFMX0VNUEVHIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9TRVJJQUxfRlRESV9TSU89
bQojIENPTkZJR19VU0JfU0VSSUFMX1ZJU09SIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklB
TF9JUEFRIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9JUiBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9TRVJJQUxfRURHRVBPUlQgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0VE
R0VQT1JUX1RJIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9GODEyMzIgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfU0VSSUFMX0Y4MTUzWCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJ
QUxfR0FSTUlOIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9JUFcgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfU0VSSUFMX0lVVSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfS0VZ
U1BBTl9QREEgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0tFWVNQQU4gaXMgbm90IHNl
dAojIENPTkZJR19VU0JfU0VSSUFMX0tMU0kgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFM
X0tPQklMX1NDVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfTUNUX1UyMzIgaXMgbm90
IHNldAojIENPTkZJR19VU0JfU0VSSUFMX01FVFJPIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NF
UklBTF9NT1M3NzIwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9NT1M3ODQwIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9NWFVQT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X1NFUklBTF9OQVZNQU4gaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1BMMjMwMyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfT1RJNjg1OCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9TRVJJQUxfUUNBVVggaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1FVQUxDT01NIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9TUENQOFg1IGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1NFUklBTF9TQUZFIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9TSUVSUkFXSVJF
TEVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfU1lNQk9MIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NFUklBTF9USSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfQ1lCRVJK
QUNLIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9PUFRJT04gaXMgbm90IHNldAojIENP
TkZJR19VU0JfU0VSSUFMX09NTklORVQgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX09Q
VElDT04gaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1hTRU5TX01UIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NFUklBTF9XSVNIQk9ORSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJ
QUxfU1NVMTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9RVDIgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfU0VSSUFMX1VQRDc4RjA3MzAgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VS
SUFMX1hSIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9ERUJVRyBpcyBub3Qgc2V0Cgoj
CiMgVVNCIE1pc2NlbGxhbmVvdXMgZHJpdmVycwojCiMgQ09ORklHX1VTQl9FTUk2MiBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9FTUkyNiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9BRFVUVVggaXMg
bm90IHNldAojIENPTkZJR19VU0JfU0VWU0VHIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xFR09U
T1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
Q1lQUkVTU19DWTdDNjMgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ1lUSEVSTSBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9JRE1PVVNFIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9BUFBMRURJU1BMQVk9
bQojIENPTkZJR19BUFBMRV9NRklfRkFTVENIQVJHRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9T
SVNVU0JWR0EgaXMgbm90IHNldAojIENPTkZJR19VU0JfTEQgaXMgbm90IHNldAojIENPTkZJR19V
U0JfVFJBTkNFVklCUkFUT1IgaXMgbm90IHNldAojIENPTkZJR19VU0JfSU9XQVJSSU9SIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19VU0JfRUhTRVRfVEVT
VF9GSVhUVVJFIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9JU0lHSFRGVz1tCiMgQ09ORklHX1VTQl9Z
VVJFWCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9FWlVTQl9GWDIgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfSFVCX1VTQjI1MVhCIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0hTSUNfVVNCMzUwMyBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9IU0lDX1VTQjQ2MDQgaXMgbm90IHNldAojIENPTkZJR19V
U0JfTElOS19MQVlFUl9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0NIQU9TS0VZIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX09OQk9BUkRfREVWIGlzIG5vdCBzZXQKCiMKIyBVU0IgUGh5c2lj
YWwgTGF5ZXIgZHJpdmVycwojCiMgQ09ORklHX05PUF9VU0JfWENFSVYgaXMgbm90IHNldAojIENP
TkZJR19VU0JfSVNQMTMwMSBpcyBub3Qgc2V0CiMgZW5kIG9mIFVTQiBQaHlzaWNhbCBMYXllciBk
cml2ZXJzCgojIENPTkZJR19VU0JfR0FER0VUIGlzIG5vdCBzZXQKIyBDT05GSUdfVFlQRUMgaXMg
bm90IHNldAojIENPTkZJR19VU0JfUk9MRV9TV0lUQ0ggaXMgbm90IHNldAojIENPTkZJR19NTUMg
aXMgbm90IHNldAojIENPTkZJR19TQ1NJX1VGU0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX01FTVNU
SUNLIGlzIG5vdCBzZXQKQ09ORklHX05FV19MRURTPXkKQ09ORklHX0xFRFNfQ0xBU1M9eQojIENP
TkZJR19MRURTX0NMQVNTX0ZMQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19DTEFTU19NVUxU
SUNPTE9SIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfQlJJR0hUTkVTU19IV19DSEFOR0VEPXkKCiMK
IyBMRUQgZHJpdmVycwojCiMgQ09ORklHX0xFRFNfQU4zMDI1OUEgaXMgbm90IHNldAojIENPTkZJ
R19MRURTX0FXMjAwWFggaXMgbm90IHNldAojIENPTkZJR19MRURTX0FXMjAxMyBpcyBub3Qgc2V0
CiMgQ09ORklHX0xFRFNfQkNNNjMyOCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQkNNNjM1OCBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTE0zNTMwIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19M
TTM1MzIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xNMzY0MiBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFRFNfTE0zNjkyWCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTUzMiBpcyBub3Qgc2V0
CiMgQ09ORklHX0xFRFNfTFAzOTQ0IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MUDg4NjAgaXMg
bm90IHNldAojIENPTkZJR19MRURTX1BDQTk1NVggaXMgbm90IHNldAojIENPTkZJR19MRURTX1BD
QTk2M1ggaXMgbm90IHNldAojIENPTkZJR19MRURTX1BDQTk5NVggaXMgbm90IHNldAojIENPTkZJ
R19MRURTX0JEMjYwNk1WViBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQkQyODAyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTEVEU19UQ0E2NTA3IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UTEM1OTFY
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTE0zNTV4IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVE
U19JUzMxRkwzMTlYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19JUzMxRkwzMlhYIGlzIG5vdCBz
ZXQKCiMKIyBMRUQgZHJpdmVyIGZvciBibGluaygxKSBVU0IgUkdCIExFRCBpcyB1bmRlciBTcGVj
aWFsIEhJRCBkcml2ZXJzIChISURfVEhJTkdNKQojCiMgQ09ORklHX0xFRFNfQkxJTktNIGlzIG5v
dCBzZXQKIyBDT05GSUdfTEVEU19NTFhSRUcgaXMgbm90IHNldAojIENPTkZJR19MRURTX1VTRVIg
aXMgbm90IHNldAojIENPTkZJR19MRURTX0xNMzY5NyBpcyBub3Qgc2V0CgojCiMgRmxhc2ggYW5k
IFRvcmNoIExFRCBkcml2ZXJzCiMKCiMKIyBSR0IgTEVEIGRyaXZlcnMKIwoKIwojIExFRCBUcmln
Z2VycwojCkNPTkZJR19MRURTX1RSSUdHRVJTPXkKIyBDT05GSUdfTEVEU19UUklHR0VSX1RJTUVS
IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX09ORVNIT1QgaXMgbm90IHNldApDT05G
SUdfTEVEU19UUklHR0VSX0RJU0s9eQojIENPTkZJR19MRURTX1RSSUdHRVJfSEVBUlRCRUFUIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0JBQ0tMSUdIVCBpcyBub3Qgc2V0CiMgQ09O
RklHX0xFRFNfVFJJR0dFUl9DUFUgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfQUNU
SVZJVFkgaXMgbm90IHNldApDT05GSUdfTEVEU19UUklHR0VSX0RFRkFVTFRfT049eQoKIwojIGlw
dGFibGVzIHRyaWdnZXIgaXMgdW5kZXIgTmV0ZmlsdGVyIGNvbmZpZyAoTEVEIHRhcmdldCkKIwoj
IENPTkZJR19MRURTX1RSSUdHRVJfVFJBTlNJRU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19U
UklHR0VSX0NBTUVSQSBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdHRVJfUEFOSUM9eQojIENP
TkZJR19MRURTX1RSSUdHRVJfTkVUREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VS
X1BBVFRFUk4gaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfVFRZIGlzIG5vdCBzZXQK
IyBDT05GSUdfTEVEU19UUklHR0VSX0lOUFVUX0VWRU5UUyBpcyBub3Qgc2V0CgojCiMgU2ltcGxl
IExFRCBkcml2ZXJzCiMKIyBDT05GSUdfQUNDRVNTSUJJTElUWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lORklOSUJBTkQgaXMgbm90IHNldApDT05GSUdfRURBQ19BVE9NSUNfU0NSVUI9eQpDT05GSUdf
RURBQ19TVVBQT1JUPXkKQ09ORklHX1JUQ19MSUI9eQpDT05GSUdfUlRDX0NMQVNTPXkKIyBDT05G
SUdfUlRDX0hDVE9TWVMgaXMgbm90IHNldApDT05GSUdfUlRDX1NZU1RPSEM9eQpDT05GSUdfUlRD
X1NZU1RPSENfREVWSUNFPSJydGMwIgojIENPTkZJR19SVENfREVCVUcgaXMgbm90IHNldApDT05G
SUdfUlRDX0xJQl9LVU5JVF9URVNUPW0KQ09ORklHX1JUQ19OVk1FTT15CgojCiMgUlRDIGludGVy
ZmFjZXMKIwpDT05GSUdfUlRDX0lOVEZfU1lTRlM9eQpDT05GSUdfUlRDX0lOVEZfUFJPQz15CkNP
TkZJR19SVENfSU5URl9ERVY9eQojIENPTkZJR19SVENfSU5URl9ERVZfVUlFX0VNVUwgaXMgbm90
IHNldAojIENPTkZJR19SVENfRFJWX1RFU1QgaXMgbm90IHNldAoKIwojIEkyQyBSVEMgZHJpdmVy
cwojCiMgQ09ORklHX1JUQ19EUlZfQUJCNVpFUzMgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X0FCRU9aOSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQUJYODBYIGlzIG5vdCBzZXQKIyBD
T05GSUdfUlRDX0RSVl9EUzEzMDcgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTM3NCBp
cyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxNjcyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRD
X0RSVl9IWU04NTYzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NQVg2OTAwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9OQ1QzMDE4WSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZf
UlM1QzM3MiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfSVNMMTIwOCBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfSVNMMTIwMjIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0lTTDEy
MDI2IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9YMTIwNSBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfUENGODUyMyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUENGODUwNjMgaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX1BDRjg1MzYzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRD
X0RSVl9QQ0Y4NTYzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9QQ0Y4NTgzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9NNDFUODAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0JR
MzJLIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9TMzUzOTBBIGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRDX0RSVl9GTTMxMzAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JYODAxMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlg4MTExIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RS
Vl9SWDg1ODEgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JYODAyNSBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfRU0zMDI3IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SVjMwMjgg
aXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JWMzAzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JU
Q19EUlZfUlY4ODAzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9TRDMwNzggaXMgbm90IHNl
dAoKIwojIFNQSSBSVEMgZHJpdmVycwojCkNPTkZJR19SVENfSTJDX0FORF9TUEk9eQoKIwojIFNQ
SSBhbmQgSTJDIFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RSVl9EUzMyMzIgaXMgbm90IHNl
dAojIENPTkZJR19SVENfRFJWX1BDRjIxMjcgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JW
MzAyOUMyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SWDYxMTAgaXMgbm90IHNldAoKIwoj
IFBsYXRmb3JtIFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RSVl9DTU9TIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9EUzEyODYgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTUx
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxNTUzIGlzIG5vdCBzZXQKIyBDT05GSUdf
UlRDX0RSVl9EUzE2ODVfRkFNSUxZIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzE3NDIg
aXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMjQwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1JU
Q19EUlZfU1RLMTdUQTggaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX000OFQ4NiBpcyBub3Qg
c2V0CiMgQ09ORklHX1JUQ19EUlZfTTQ4VDM1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9N
NDhUNTkgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX01TTTYyNDIgaXMgbm90IHNldAojIENP
TkZJR19SVENfRFJWX1JQNUMwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfWllOUU1QIGlz
IG5vdCBzZXQKCiMKIyBvbi1DUFUgUlRDIGRyaXZlcnMKIwpDT05GSUdfUlRDX0RSVl9HRU5FUklD
PXkKIyBDT05GSUdfUlRDX0RSVl9DQURFTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9G
VFJUQzAxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUjczMDEgaXMgbm90IHNldAoKIwoj
IEhJRCBTZW5zb3IgUlRDIGRyaXZlcnMKIwojIENPTkZJR19SVENfRFJWX0dPTERGSVNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfRE1BREVWSUNFUyBpcyBub3Qgc2V0CgojCiMgRE1BQlVGIG9wdGlvbnMK
IwpDT05GSUdfU1lOQ19GSUxFPXkKIyBDT05GSUdfU1dfU1lOQyBpcyBub3Qgc2V0CkNPTkZJR19V
RE1BQlVGPXkKIyBDT05GSUdfRE1BQlVGX01PVkVfTk9USUZZIGlzIG5vdCBzZXQKQ09ORklHX0RN
QUJVRl9ERUJVRz15CkNPTkZJR19ETUFCVUZfU0VMRlRFU1RTPW0KQ09ORklHX0RNQUJVRl9IRUFQ
Uz15CiMgQ09ORklHX0RNQUJVRl9TWVNGU19TVEFUUyBpcyBub3Qgc2V0CkNPTkZJR19ETUFCVUZf
SEVBUFNfU1lTVEVNPXkKIyBlbmQgb2YgRE1BQlVGIG9wdGlvbnMKCiMgQ09ORklHX1VJTyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZGSU8gaXMgbm90IHNldApDT05GSUdfVklSVF9EUklWRVJTPXkKIyBD
T05GSUdfVk1HRU5JRCBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fQU5DSE9SPXkKQ09ORklHX1ZJ
UlRJTz15CkNPTkZJR19WSVJUSU9fUENJX0xJQj15CkNPTkZJR19WSVJUSU9fUENJX0xJQl9MRUdB
Q1k9eQpDT05GSUdfVklSVElPX01FTlU9eQpDT05GSUdfVklSVElPX1BDST15CkNPTkZJR19WSVJU
SU9fUENJX0xFR0FDWT15CiMgQ09ORklHX1ZJUlRJT19CQUxMT09OIGlzIG5vdCBzZXQKIyBDT05G
SUdfVklSVElPX0lOUFVUIGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVElPX01NSU8gaXMgbm90IHNl
dApDT05GSUdfVklSVElPX0RNQV9TSEFSRURfQlVGRkVSPW0KIyBDT05GSUdfVklSVElPX0RFQlVH
IGlzIG5vdCBzZXQKIyBDT05GSUdfVkRQQSBpcyBub3Qgc2V0CkNPTkZJR19WSE9TVF9JT1RMQj1t
CkNPTkZJR19WSE9TVF9UQVNLPXkKQ09ORklHX1ZIT1NUPW0KQ09ORklHX1ZIT1NUX01FTlU9eQpD
T05GSUdfVkhPU1RfTkVUPW0KIyBDT05GSUdfVkhPU1RfVlNPQ0sgaXMgbm90IHNldAojIENPTkZJ
R19WSE9TVF9DUk9TU19FTkRJQU5fTEVHQUNZIGlzIG5vdCBzZXQKCiMKIyBNaWNyb3NvZnQgSHlw
ZXItViBndWVzdCBzdXBwb3J0CiMKIyBlbmQgb2YgTWljcm9zb2Z0IEh5cGVyLVYgZ3Vlc3Qgc3Vw
cG9ydAoKIyBDT05GSUdfR1JFWUJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTUVESSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NUQUdJTkcgaXMgbm90IHNldAojIENPTkZJR19HT0xERklTSCBpcyBub3Qg
c2V0CiMgQ09ORklHX0NaTklDX1BMQVRGT1JNUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9D
TEsgaXMgbm90IHNldAojIENPTkZJR19IV1NQSU5MT0NLIGlzIG5vdCBzZXQKCiMKIyBDbG9jayBT
b3VyY2UgZHJpdmVycwojCiMgZW5kIG9mIENsb2NrIFNvdXJjZSBkcml2ZXJzCgojIENPTkZJR19N
QUlMQk9YIGlzIG5vdCBzZXQKQ09ORklHX0lPTU1VX1NVUFBPUlQ9eQoKIwojIEdlbmVyaWMgSU9N
TVUgUGFnZXRhYmxlIFN1cHBvcnQKIwojIGVuZCBvZiBHZW5lcmljIElPTU1VIFBhZ2V0YWJsZSBT
dXBwb3J0CgojIENPTkZJR19JT01NVV9ERUJVR0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfSU9NTVVG
RCBpcyBub3Qgc2V0CgojCiMgUmVtb3RlcHJvYyBkcml2ZXJzCiMKIyBDT05GSUdfUkVNT1RFUFJP
QyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJlbW90ZXByb2MgZHJpdmVycwoKIwojIFJwbXNnIGRyaXZl
cnMKIwojIENPTkZJR19SUE1TR19WSVJUSU8gaXMgbm90IHNldAojIGVuZCBvZiBScG1zZyBkcml2
ZXJzCgojIENPTkZJR19TT1VORFdJUkUgaXMgbm90IHNldAoKIwojIFNPQyAoU3lzdGVtIE9uIENo
aXApIHNwZWNpZmljIERyaXZlcnMKIwoKIwojIEFtbG9naWMgU29DIGRyaXZlcnMKIwojIGVuZCBv
ZiBBbWxvZ2ljIFNvQyBkcml2ZXJzCgojCiMgQnJvYWRjb20gU29DIGRyaXZlcnMKIwojIGVuZCBv
ZiBCcm9hZGNvbSBTb0MgZHJpdmVycwoKIwojIE5YUC9GcmVlc2NhbGUgUW9ySVEgU29DIGRyaXZl
cnMKIwojIENPTkZJR19RVUlDQ19FTkdJTkUgaXMgbm90IHNldAojIGVuZCBvZiBOWFAvRnJlZXNj
YWxlIFFvcklRIFNvQyBkcml2ZXJzCgojCiMgZnVqaXRzdSBTb0MgZHJpdmVycwojCiMgZW5kIG9m
IGZ1aml0c3UgU29DIGRyaXZlcnMKCiMKIyBpLk1YIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgaS5N
WCBTb0MgZHJpdmVycwoKIwojIEVuYWJsZSBMaXRlWCBTb0MgQnVpbGRlciBzcGVjaWZpYyBkcml2
ZXJzCiMKIyBDT05GSUdfTElURVhfU09DX0NPTlRST0xMRVIgaXMgbm90IHNldAojIGVuZCBvZiBF
bmFibGUgTGl0ZVggU29DIEJ1aWxkZXIgc3BlY2lmaWMgZHJpdmVycwoKIyBDT05GSUdfV1BDTTQ1
MF9TT0MgaXMgbm90IHNldAoKIwojIFF1YWxjb21tIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgUXVh
bGNvbW0gU29DIGRyaXZlcnMKCiMgQ09ORklHX1NPQ19USSBpcyBub3Qgc2V0CgojCiMgWGlsaW54
IFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgWGlsaW54IFNvQyBkcml2ZXJzCiMgZW5kIG9mIFNPQyAo
U3lzdGVtIE9uIENoaXApIHNwZWNpZmljIERyaXZlcnMKCiMKIyBQTSBEb21haW5zCiMKCiMKIyBB
bWxvZ2ljIFBNIERvbWFpbnMKIwojIGVuZCBvZiBBbWxvZ2ljIFBNIERvbWFpbnMKCiMKIyBCcm9h
ZGNvbSBQTSBEb21haW5zCiMKIyBlbmQgb2YgQnJvYWRjb20gUE0gRG9tYWlucwoKIwojIGkuTVgg
UE0gRG9tYWlucwojCiMgZW5kIG9mIGkuTVggUE0gRG9tYWlucwoKIwojIFF1YWxjb21tIFBNIERv
bWFpbnMKIwojIGVuZCBvZiBRdWFsY29tbSBQTSBEb21haW5zCiMgZW5kIG9mIFBNIERvbWFpbnMK
CiMgQ09ORklHX1BNX0RFVkZSRVEgaXMgbm90IHNldAojIENPTkZJR19FWFRDT04gaXMgbm90IHNl
dAojIENPTkZJR19NRU1PUlkgaXMgbm90IHNldAojIENPTkZJR19JSU8gaXMgbm90IHNldAojIENP
TkZJR19OVEIgaXMgbm90IHNldAojIENPTkZJR19QV00gaXMgbm90IHNldAoKIwojIElSUSBjaGlw
IHN1cHBvcnQKIwpDT05GSUdfSVJRQ0hJUD15CiMgQ09ORklHX0FMX0ZJQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0xBTjk2NlhfT0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX0lOVEMgaXMgbm90
IHNldAojIGVuZCBvZiBJUlEgY2hpcCBzdXBwb3J0CgojIENPTkZJR19JUEFDS19CVVMgaXMgbm90
IHNldAojIENPTkZJR19SRVNFVF9DT05UUk9MTEVSIGlzIG5vdCBzZXQKCiMKIyBQSFkgU3Vic3lz
dGVtCiMKIyBDT05GSUdfR0VORVJJQ19QSFkgaXMgbm90IHNldAojIENPTkZJR19QSFlfQ0FOX1RS
QU5TQ0VJVkVSIGlzIG5vdCBzZXQKCiMKIyBQSFkgZHJpdmVycyBmb3IgQnJvYWRjb20gcGxhdGZv
cm1zCiMKIyBDT05GSUdfQkNNX0tPTkFfVVNCMl9QSFkgaXMgbm90IHNldAojIGVuZCBvZiBQSFkg
ZHJpdmVycyBmb3IgQnJvYWRjb20gcGxhdGZvcm1zCgojIENPTkZJR19QSFlfQ0FERU5DRV9EUEhZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0NBREVOQ0VfRFBIWV9SWCBpcyBub3Qgc2V0CiMgQ09O
RklHX1BIWV9DQURFTkNFX1NBTFZPIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1BYQV8yOE5NX0hT
SUMgaXMgbm90IHNldAojIENPTkZJR19QSFlfUFhBXzI4Tk1fVVNCMiBpcyBub3Qgc2V0CiMgZW5k
IG9mIFBIWSBTdWJzeXN0ZW0KCiMgQ09ORklHX1BPV0VSQ0FQIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUNCIGlzIG5vdCBzZXQKCiMKIyBQZXJmb3JtYW5jZSBtb25pdG9yIHN1cHBvcnQKIwojIENPTkZJ
R19EV0NfUENJRV9QTVUgaXMgbm90IHNldAojIGVuZCBvZiBQZXJmb3JtYW5jZSBtb25pdG9yIHN1
cHBvcnQKCiMgQ09ORklHX1JBUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQjQgaXMgbm90IHNldAoK
IwojIEFuZHJvaWQKIwojIENPTkZJR19BTkRST0lEX0JJTkRFUl9JUEMgaXMgbm90IHNldAojIGVu
ZCBvZiBBbmRyb2lkCgojIENPTkZJR19EQVggaXMgbm90IHNldApDT05GSUdfTlZNRU09eQpDT05G
SUdfTlZNRU1fU1lTRlM9eQpDT05GSUdfTlZNRU1fTEFZT1VUUz15CgojCiMgTGF5b3V0IFR5cGVz
CiMKIyBDT05GSUdfTlZNRU1fTEFZT1VUX1NMMjhfVlBEIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZN
RU1fTEFZT1VUX09OSUVfVExWIGlzIG5vdCBzZXQKIyBlbmQgb2YgTGF5b3V0IFR5cGVzCgojIENP
TkZJR19OVk1FTV9STUVNIGlzIG5vdCBzZXQKCiMKIyBIVyB0cmFjaW5nIHN1cHBvcnQKIwojIENP
TkZJR19TVE0gaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9USCBpcyBub3Qgc2V0CiMgZW5kIG9m
IEhXIHRyYWNpbmcgc3VwcG9ydAoKIyBDT05GSUdfRlBHQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZT
SSBpcyBub3Qgc2V0CiMgQ09ORklHX1NJT1ggaXMgbm90IHNldAojIENPTkZJR19TTElNQlVTIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5URVJDT05ORUNUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09VTlRF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX01PU1QgaXMgbm90IHNldAojIENPTkZJR19QRUNJIGlzIG5v
dCBzZXQKIyBDT05GSUdfSFRFIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGV2aWNlIERyaXZlcnMKCiMK
IyBGaWxlIHN5c3RlbXMKIwpDT05GSUdfVkFMSURBVEVfRlNfUEFSU0VSPXkKQ09ORklHX0ZTX0lP
TUFQPXkKQ09ORklHX0ZTX1NUQUNLPXkKQ09ORklHX0JVRkZFUl9IRUFEPXkKQ09ORklHX0xFR0FD
WV9ESVJFQ1RfSU89eQojIENPTkZJR19FWFQyX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUM19G
UyBpcyBub3Qgc2V0CkNPTkZJR19FWFQ0X0ZTPXkKQ09ORklHX0VYVDRfVVNFX0ZPUl9FWFQyPXkK
Q09ORklHX0VYVDRfRlNfUE9TSVhfQUNMPXkKIyBDT05GSUdfRVhUNF9GU19TRUNVUklUWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0VYVDRfREVCVUcgaXMgbm90IHNldApDT05GSUdfRVhUNF9LVU5JVF9U
RVNUUz1tCkNPTkZJR19KQkQyPXkKIyBDT05GSUdfSkJEMl9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJ
R19GU19NQkNBQ0hFPXkKIyBDT05GSUdfUkVJU0VSRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19K
RlNfRlMgaXMgbm90IHNldApDT05GSUdfWEZTX0ZTPW0KIyBDT05GSUdfWEZTX1NVUFBPUlRfVjQg
aXMgbm90IHNldAojIENPTkZJR19YRlNfU1VQUE9SVF9BU0NJSV9DSSBpcyBub3Qgc2V0CiMgQ09O
RklHX1hGU19RVU9UQSBpcyBub3Qgc2V0CkNPTkZJR19YRlNfUE9TSVhfQUNMPXkKIyBDT05GSUdf
WEZTX1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfWEZTX09OTElORV9TQ1JVQiBpcyBub3Qgc2V0CiMg
Q09ORklHX1hGU19XQVJOIGlzIG5vdCBzZXQKIyBDT05GSUdfWEZTX0RFQlVHIGlzIG5vdCBzZXQK
IyBDT05GSUdfR0ZTMl9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX09DRlMyX0ZTIGlzIG5vdCBzZXQK
Q09ORklHX0JUUkZTX0ZTPXkKQ09ORklHX0JUUkZTX0ZTX1BPU0lYX0FDTD15CiMgQ09ORklHX0JU
UkZTX0ZTX1JVTl9TQU5JVFlfVEVTVFMgaXMgbm90IHNldAojIENPTkZJR19CVFJGU19ERUJVRyBp
cyBub3Qgc2V0CiMgQ09ORklHX0JUUkZTX0FTU0VSVCBpcyBub3Qgc2V0CiMgQ09ORklHX0JUUkZT
X0ZTX1JFRl9WRVJJRlkgaXMgbm90IHNldAojIENPTkZJR19OSUxGUzJfRlMgaXMgbm90IHNldAoj
IENPTkZJR19GMkZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0JDQUNIRUZTX0ZTPW0KIyBDT05GSUdf
QkNBQ0hFRlNfUVVPVEEgaXMgbm90IHNldAojIENPTkZJR19CQ0FDSEVGU19FUkFTVVJFX0NPRElO
RyBpcyBub3Qgc2V0CkNPTkZJR19CQ0FDSEVGU19QT1NJWF9BQ0w9eQojIENPTkZJR19CQ0FDSEVG
U19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19CQ0FDSEVGU19URVNUUz15CkNPTkZJR19CQ0FDSEVG
U19MT0NLX1RJTUVfU1RBVFM9eQojIENPTkZJR19CQ0FDSEVGU19OT19MQVRFTkNZX0FDQ1QgaXMg
bm90IHNldApDT05GSUdfQkNBQ0hFRlNfU0lYX09QVElNSVNUSUNfU1BJTj15CkNPTkZJR19NRUFO
X0FORF9WQVJJQU5DRV9VTklUX1RFU1Q9bQpDT05GSUdfRlNfUE9TSVhfQUNMPXkKQ09ORklHX0VY
UE9SVEZTPXkKIyBDT05GSUdfRVhQT1JURlNfQkxPQ0tfT1BTIGlzIG5vdCBzZXQKQ09ORklHX0ZJ
TEVfTE9DS0lORz15CiMgQ09ORklHX0ZTX0VOQ1JZUFRJT04gaXMgbm90IHNldAojIENPTkZJR19G
U19WRVJJVFkgaXMgbm90IHNldApDT05GSUdfRlNOT1RJRlk9eQpDT05GSUdfRE5PVElGWT15CkNP
TkZJR19JTk9USUZZX1VTRVI9eQpDT05GSUdfRkFOT1RJRlk9eQojIENPTkZJR19GQU5PVElGWV9B
Q0NFU1NfUEVSTUlTU0lPTlMgaXMgbm90IHNldAojIENPTkZJR19RVU9UQSBpcyBub3Qgc2V0CkNP
TkZJR19BVVRPRlNfRlM9eQpDT05GSUdfRlVTRV9GUz1tCiMgQ09ORklHX0NVU0UgaXMgbm90IHNl
dApDT05GSUdfVklSVElPX0ZTPW0KQ09ORklHX0ZVU0VfUEFTU1RIUk9VR0g9eQojIENPTkZJR19P
VkVSTEFZX0ZTIGlzIG5vdCBzZXQKCiMKIyBDYWNoZXMKIwpDT05GSUdfTkVURlNfU1VQUE9SVD15
CiMgQ09ORklHX05FVEZTX1NUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfRlNDQUNIRSBpcyBub3Qg
c2V0CiMgZW5kIG9mIENhY2hlcwoKIwojIENELVJPTS9EVkQgRmlsZXN5c3RlbXMKIwpDT05GSUdf
SVNPOTY2MF9GUz15CkNPTkZJR19KT0xJRVQ9eQpDT05GSUdfWklTT0ZTPXkKQ09ORklHX1VERl9G
Uz1tCiMgZW5kIG9mIENELVJPTS9EVkQgRmlsZXN5c3RlbXMKCiMKIyBET1MvRkFUL0VYRkFUL05U
IEZpbGVzeXN0ZW1zCiMKQ09ORklHX0ZBVF9GUz1tCkNPTkZJR19NU0RPU19GUz1tCkNPTkZJR19W
RkFUX0ZTPW0KQ09ORklHX0ZBVF9ERUZBVUxUX0NPREVQQUdFPTQzNwpDT05GSUdfRkFUX0RFRkFV
TFRfSU9DSEFSU0VUPSJpc284ODU5LTE1IgpDT05GSUdfRkFUX0RFRkFVTFRfVVRGOD15CkNPTkZJ
R19GQVRfS1VOSVRfVEVTVD1tCkNPTkZJR19FWEZBVF9GUz1tCkNPTkZJR19FWEZBVF9ERUZBVUxU
X0lPQ0hBUlNFVD0idXRmOCIKQ09ORklHX05URlMzX0ZTPW0KQ09ORklHX05URlMzX0xaWF9YUFJF
U1M9eQojIENPTkZJR19OVEZTM19GU19QT1NJWF9BQ0wgaXMgbm90IHNldAojIENPTkZJR19OVEZT
X0ZTIGlzIG5vdCBzZXQKIyBlbmQgb2YgRE9TL0ZBVC9FWEZBVC9OVCBGaWxlc3lzdGVtcwoKIwoj
IFBzZXVkbyBmaWxlc3lzdGVtcwojCkNPTkZJR19QUk9DX0ZTPXkKIyBDT05GSUdfUFJPQ19LQ09S
RSBpcyBub3Qgc2V0CkNPTkZJR19QUk9DX1NZU0NUTD15CkNPTkZJR19QUk9DX1BBR0VfTU9OSVRP
Uj15CiMgQ09ORklHX1BST0NfQ0hJTERSRU4gaXMgbm90IHNldApDT05GSUdfS0VSTkZTPXkKQ09O
RklHX1NZU0ZTPXkKQ09ORklHX1RNUEZTPXkKQ09ORklHX1RNUEZTX1BPU0lYX0FDTD15CkNPTkZJ
R19UTVBGU19YQVRUUj15CiMgQ09ORklHX1RNUEZTX1FVT1RBIGlzIG5vdCBzZXQKQ09ORklHX0NP
TkZJR0ZTX0ZTPW0KIyBlbmQgb2YgUHNldWRvIGZpbGVzeXN0ZW1zCgpDT05GSUdfTUlTQ19GSUxF
U1lTVEVNUz15CiMgQ09ORklHX09SQU5HRUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQURGU19G
UyBpcyBub3Qgc2V0CkNPTkZJR19BRkZTX0ZTPW0KIyBDT05GSUdfRUNSWVBUX0ZTIGlzIG5vdCBz
ZXQKQ09ORklHX0hGU19GUz1tCkNPTkZJR19IRlNQTFVTX0ZTPW0KQ09ORklHX0JFRlNfRlM9bQpD
T05GSUdfQkVGU19ERUJVRz15CiMgQ09ORklHX0JGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VG
U19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQU1GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NRVUFT
SEZTIGlzIG5vdCBzZXQKIyBDT05GSUdfVlhGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX01JTklY
X0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfT01GU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hQRlNf
RlMgaXMgbm90IHNldAojIENPTkZJR19RTlg0RlNfRlMgaXMgbm90IHNldAojIENPTkZJR19RTlg2
RlNfRlMgaXMgbm90IHNldAojIENPTkZJR19ST01GU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BT
VE9SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU1ZfRlMgaXMgbm90IHNldAojIENPTkZJR19VRlNf
RlMgaXMgbm90IHNldAojIENPTkZJR19FUk9GU19GUyBpcyBub3Qgc2V0CkNPTkZJR19ORVRXT1JL
X0ZJTEVTWVNURU1TPXkKQ09ORklHX05GU19GUz1tCiMgQ09ORklHX05GU19WMiBpcyBub3Qgc2V0
CiMgQ09ORklHX05GU19WMyBpcyBub3Qgc2V0CkNPTkZJR19ORlNfVjQ9bQojIENPTkZJR19ORlNf
U1dBUCBpcyBub3Qgc2V0CkNPTkZJR19ORlNfVjRfMT15CkNPTkZJR19ORlNfVjRfMj15CkNPTkZJ
R19QTkZTX0ZJTEVfTEFZT1VUPW0KQ09ORklHX1BORlNfQkxPQ0s9bQpDT05GSUdfUE5GU19GTEVY
RklMRV9MQVlPVVQ9bQpDT05GSUdfTkZTX1Y0XzFfSU1QTEVNRU5UQVRJT05fSURfRE9NQUlOPSJr
ZXJuZWwub3JnIgojIENPTkZJR19ORlNfVjRfMV9NSUdSQVRJT04gaXMgbm90IHNldApDT05GSUdf
TkZTX1Y0X1NFQ1VSSVRZX0xBQkVMPXkKIyBDT05GSUdfTkZTX0ZTQ0FDSEUgaXMgbm90IHNldAoj
IENPTkZJR19ORlNfVVNFX0xFR0FDWV9ETlMgaXMgbm90IHNldApDT05GSUdfTkZTX1VTRV9LRVJO
RUxfRE5TPXkKQ09ORklHX05GU19ERUJVRz15CkNPTkZJR19ORlNfRElTQUJMRV9VRFBfU1VQUE9S
VD15CiMgQ09ORklHX05GU19WNF8yX1JFQURfUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX05GU0Qg
aXMgbm90IHNldApDT05GSUdfR1JBQ0VfUEVSSU9EPW0KQ09ORklHX0xPQ0tEPW0KQ09ORklHX05G
U19DT01NT049eQpDT05GSUdfTkZTX1Y0XzJfU1NDX0hFTFBFUj15CkNPTkZJR19TVU5SUEM9bQpD
T05GSUdfU1VOUlBDX0JBQ0tDSEFOTkVMPXkKIyBDT05GSUdfUlBDU0VDX0dTU19LUkI1IGlzIG5v
dCBzZXQKQ09ORklHX1NVTlJQQ19ERUJVRz15CiMgQ09ORklHX0NFUEhfRlMgaXMgbm90IHNldApD
T05GSUdfQ0lGUz1tCkNPTkZJR19DSUZTX1NUQVRTMj15CkNPTkZJR19DSUZTX0FMTE9XX0lOU0VD
VVJFX0xFR0FDWT15CiMgQ09ORklHX0NJRlNfVVBDQUxMIGlzIG5vdCBzZXQKQ09ORklHX0NJRlNf
WEFUVFI9eQpDT05GSUdfQ0lGU19QT1NJWD15CkNPTkZJR19DSUZTX0RFQlVHPXkKIyBDT05GSUdf
Q0lGU19ERUJVRzIgaXMgbm90IHNldAojIENPTkZJR19DSUZTX0RFQlVHX0RVTVBfS0VZUyBpcyBu
b3Qgc2V0CkNPTkZJR19DSUZTX0RGU19VUENBTEw9eQpDT05GSUdfQ0lGU19TV05fVVBDQUxMPXkK
IyBDT05GSUdfU01CX1NFUlZFUiBpcyBub3Qgc2V0CkNPTkZJR19TTUJGUz1tCiMgQ09ORklHX0NP
REFfRlMgaXMgbm90IHNldAojIENPTkZJR19BRlNfRlMgaXMgbm90IHNldApDT05GSUdfOVBfRlM9
eQpDT05GSUdfOVBfRlNfUE9TSVhfQUNMPXkKIyBDT05GSUdfOVBfRlNfU0VDVVJJVFkgaXMgbm90
IHNldApDT05GSUdfTkxTPXkKQ09ORklHX05MU19ERUZBVUxUPSJ1dGY4IgpDT05GSUdfTkxTX0NP
REVQQUdFXzQzNz1tCiMgQ09ORklHX05MU19DT0RFUEFHRV83MzcgaXMgbm90IHNldAojIENPTkZJ
R19OTFNfQ09ERVBBR0VfNzc1IGlzIG5vdCBzZXQKQ09ORklHX05MU19DT0RFUEFHRV84NTA9bQoj
IENPTkZJR19OTFNfQ09ERVBBR0VfODUyIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdF
Xzg1NSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NTcgaXMgbm90IHNldAojIENP
TkZJR19OTFNfQ09ERVBBR0VfODYwIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2
MSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjIgaXMgbm90IHNldAojIENPTkZJ
R19OTFNfQ09ERVBBR0VfODYzIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2NCBp
cyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjUgaXMgbm90IHNldAojIENPTkZJR19O
TFNfQ09ERVBBR0VfODY2IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2OSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV85MzYgaXMgbm90IHNldAojIENPTkZJR19OTFNf
Q09ERVBBR0VfOTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzkzMiBpcyBub3Qg
c2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV85NDkgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09E
RVBBR0VfODc0IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfOCBpcyBub3Qgc2V0CkNP
TkZJR19OTFNfQ09ERVBBR0VfMTI1MD1tCiMgQ09ORklHX05MU19DT0RFUEFHRV8xMjUxIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkxTX0FTQ0lJIGlzIG5vdCBzZXQKQ09ORklHX05MU19JU084ODU5XzE9
bQojIENPTkZJR19OTFNfSVNPODg1OV8yIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlf
MyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzQgaXMgbm90IHNldAojIENPTkZJR19O
TFNfSVNPODg1OV81IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfNiBpcyBub3Qgc2V0
CiMgQ09ORklHX05MU19JU084ODU5XzcgaXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV85
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfMTMgaXMgbm90IHNldAojIENPTkZJR19O
TFNfSVNPODg1OV8xNCBpcyBub3Qgc2V0CkNPTkZJR19OTFNfSVNPODg1OV8xNT1tCiMgQ09ORklH
X05MU19LT0k4X1IgaXMgbm90IHNldAojIENPTkZJR19OTFNfS09JOF9VIGlzIG5vdCBzZXQKQ09O
RklHX05MU19NQUNfUk9NQU49bQojIENPTkZJR19OTFNfTUFDX0NFTFRJQyBpcyBub3Qgc2V0CiMg
Q09ORklHX05MU19NQUNfQ0VOVEVVUk8gaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0NST0FU
SUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DWVJJTExJQyBpcyBub3Qgc2V0CiMgQ09O
RklHX05MU19NQUNfR0FFTElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19HUkVFSyBpcyBu
b3Qgc2V0CiMgQ09ORklHX05MU19NQUNfSUNFTEFORCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19N
QUNfSU5VSVQgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX1JPTUFOSUFOIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkxTX01BQ19UVVJLSVNIIGlzIG5vdCBzZXQKQ09ORklHX05MU19VVEY4PXkKQ09O
RklHX05MU19VQ1MyX1VUSUxTPW0KIyBDT05GSUdfRExNIGlzIG5vdCBzZXQKQ09ORklHX1VOSUNP
REU9bQojIENPTkZJR19VTklDT0RFX05PUk1BTElaQVRJT05fU0VMRlRFU1QgaXMgbm90IHNldApD
T05GSUdfSU9fV1E9eQojIGVuZCBvZiBGaWxlIHN5c3RlbXMKCiMKIyBTZWN1cml0eSBvcHRpb25z
CiMKQ09ORklHX0tFWVM9eQpDT05GSUdfS0VZU19SRVFVRVNUX0NBQ0hFPXkKIyBDT05GSUdfUEVS
U0lTVEVOVF9LRVlSSU5HUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RSVVNURURfS0VZUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0VOQ1JZUFRFRF9LRVlTIGlzIG5vdCBzZXQKQ09ORklHX0tFWV9ESF9PUEVS
QVRJT05TPXkKQ09ORklHX0tFWV9OT1RJRklDQVRJT05TPXkKIyBDT05GSUdfU0VDVVJJVFlfRE1F
U0dfUkVTVFJJQ1QgaXMgbm90IHNldApDT05GSUdfU0VDVVJJVFk9eQojIENPTkZJR19TRUNVUklU
WUZTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTkVUV09SSyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFQ1VSSVRZX1BBVEggaXMgbm90IHNldApDT05GSUdfSEFSREVORURfVVNFUkNPUFk9eQpD
T05GSUdfRk9SVElGWV9TT1VSQ0U9eQojIENPTkZJR19TVEFUSUNfVVNFUk1PREVIRUxQRVIgaXMg
bm90IHNldAojIENPTkZJR19TRUNVUklUWV9TTUFDSyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VS
SVRZX1RPTU9ZTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX0FQUEFSTU9SIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VDVVJJVFlfTE9BRFBJTiBpcyBub3Qgc2V0CkNPTkZJR19TRUNVUklUWV9Z
QU1BPXkKIyBDT05GSUdfU0VDVVJJVFlfU0FGRVNFVElEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VD
VVJJVFlfTE9DS0RPV05fTFNNIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTEFORExPQ0sg
aXMgbm90IHNldAojIENPTkZJR19JTlRFR1JJVFkgaXMgbm90IHNldApDT05GSUdfREVGQVVMVF9T
RUNVUklUWV9EQUM9eQpDT05GSUdfTFNNPSJsYW5kbG9jayxsb2NrZG93bix5YW1hLGxvYWRwaW4s
c2FmZXNldGlkLGludGVncml0eSxicGYiCgojCiMgS2VybmVsIGhhcmRlbmluZyBvcHRpb25zCiMK
CiMKIyBNZW1vcnkgaW5pdGlhbGl6YXRpb24KIwpDT05GSUdfQ0NfSEFTX0FVVE9fVkFSX0lOSVRf
UEFUVEVSTj15CkNPTkZJR19DQ19IQVNfQVVUT19WQVJfSU5JVF9aRVJPX0JBUkU9eQpDT05GSUdf
Q0NfSEFTX0FVVE9fVkFSX0lOSVRfWkVSTz15CiMgQ09ORklHX0lOSVRfU1RBQ0tfTk9ORSBpcyBu
b3Qgc2V0CkNPTkZJR19JTklUX1NUQUNLX0FMTF9QQVRURVJOPXkKIyBDT05GSUdfSU5JVF9TVEFD
S19BTExfWkVSTyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOSVRfT05fQUxMT0NfREVGQVVMVF9PTiBp
cyBub3Qgc2V0CiMgQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OIGlzIG5vdCBzZXQKQ09O
RklHX0NDX0hBU19aRVJPX0NBTExfVVNFRF9SRUdTPXkKIyBDT05GSUdfWkVST19DQUxMX1VTRURf
UkVHUyBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9yeSBpbml0aWFsaXphdGlvbgoKIwojIEhhcmRl
bmluZyBvZiBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCiMKQ09ORklHX0xJU1RfSEFSREVORUQ9eQpD
T05GSUdfQlVHX09OX0RBVEFfQ09SUlVQVElPTj15CiMgZW5kIG9mIEhhcmRlbmluZyBvZiBrZXJu
ZWwgZGF0YSBzdHJ1Y3R1cmVzCgpDT05GSUdfUkFORFNUUlVDVF9OT05FPXkKIyBDT05GSUdfUkFO
RFNUUlVDVF9GVUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFORFNUUlVDVF9QRVJGT1JNQU5DRSBp
cyBub3Qgc2V0CiMgZW5kIG9mIEtlcm5lbCBoYXJkZW5pbmcgb3B0aW9ucwojIGVuZCBvZiBTZWN1
cml0eSBvcHRpb25zCgpDT05GSUdfWE9SX0JMT0NLUz15CkNPTkZJR19BU1lOQ19DT1JFPW0KQ09O
RklHX0FTWU5DX01FTUNQWT1tCkNPTkZJR19BU1lOQ19YT1I9bQpDT05GSUdfQVNZTkNfUFE9bQpD
T05GSUdfQVNZTkNfUkFJRDZfUkVDT1Y9bQpDT05GSUdfQ1JZUFRPPXkKCiMKIyBDcnlwdG8gY29y
ZSBvciBoZWxwZXIKIwpDT05GSUdfQ1JZUFRPX0FMR0FQST15CkNPTkZJR19DUllQVE9fQUxHQVBJ
Mj15CkNPTkZJR19DUllQVE9fQUVBRD1tCkNPTkZJR19DUllQVE9fQUVBRDI9eQpDT05GSUdfQ1JZ
UFRPX1NJRz15CkNPTkZJR19DUllQVE9fU0lHMj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVI9bQpD
T05GSUdfQ1JZUFRPX1NLQ0lQSEVSMj15CkNPTkZJR19DUllQVE9fSEFTSD15CkNPTkZJR19DUllQ
VE9fSEFTSDI9eQpDT05GSUdfQ1JZUFRPX1JORz1tCkNPTkZJR19DUllQVE9fUk5HMj15CkNPTkZJ
R19DUllQVE9fUk5HX0RFRkFVTFQ9bQpDT05GSUdfQ1JZUFRPX0FLQ0lQSEVSMj15CkNPTkZJR19D
UllQVE9fQUtDSVBIRVI9eQpDT05GSUdfQ1JZUFRPX0tQUDI9eQpDT05GSUdfQ1JZUFRPX0tQUD15
CkNPTkZJR19DUllQVE9fQUNPTVAyPXkKQ09ORklHX0NSWVBUT19NQU5BR0VSPXkKQ09ORklHX0NS
WVBUT19NQU5BR0VSMj15CkNPTkZJR19DUllQVE9fVVNFUj1tCiMgQ09ORklHX0NSWVBUT19NQU5B
R0VSX0RJU0FCTEVfVEVTVFMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTUFOQUdFUl9FWFRS
QV9URVNUUyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fTlVMTD1tCkNPTkZJR19DUllQVE9fTlVM
TDI9bQpDT05GSUdfQ1JZUFRPX1BDUllQVD1tCkNPTkZJR19DUllQVE9fQ1JZUFREPW0KQ09ORklH
X0NSWVBUT19BVVRIRU5DPW0KIyBDT05GSUdfQ1JZUFRPX1RFU1QgaXMgbm90IHNldApDT05GSUdf
Q1JZUFRPX0VOR0lORT1tCiMgZW5kIG9mIENyeXB0byBjb3JlIG9yIGhlbHBlcgoKIwojIFB1Ymxp
Yy1rZXkgY3J5cHRvZ3JhcGh5CiMKQ09ORklHX0NSWVBUT19SU0E9eQpDT05GSUdfQ1JZUFRPX0RI
PXkKIyBDT05GSUdfQ1JZUFRPX0RIX1JGQzc5MTlfR1JPVVBTIGlzIG5vdCBzZXQKQ09ORklHX0NS
WVBUT19FQ0M9bQpDT05GSUdfQ1JZUFRPX0VDREg9bQojIENPTkZJR19DUllQVE9fRUNEU0EgaXMg
bm90IHNldAojIENPTkZJR19DUllQVE9fRUNSRFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRP
X0NVUlZFMjU1MTkgaXMgbm90IHNldAojIGVuZCBvZiBQdWJsaWMta2V5IGNyeXB0b2dyYXBoeQoK
IwojIEJsb2NrIGNpcGhlcnMKIwpDT05GSUdfQ1JZUFRPX0FFUz1tCiMgQ09ORklHX0NSWVBUT19B
RVNfVEkgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQVJJQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19CTE9XRklTSCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DQU1FTExJQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DQVNUNSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19D
QVNUNiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fREVTPW0KIyBDT05GSUdfQ1JZUFRPX0ZDUllQ
VCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TRVJQRU5UIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JZUFRPX1NNNF9HRU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1RXT0ZJU0ggaXMg
bm90IHNldAojIGVuZCBvZiBCbG9jayBjaXBoZXJzCgojCiMgTGVuZ3RoLXByZXNlcnZpbmcgY2lw
aGVycyBhbmQgbW9kZXMKIwpDT05GSUdfQ1JZUFRPX0FESUFOVFVNPW0KQ09ORklHX0NSWVBUT19D
SEFDSEEyMD1tCkNPTkZJR19DUllQVE9fQ0JDPW0KQ09ORklHX0NSWVBUT19DVFI9bQojIENPTkZJ
R19DUllQVE9fQ1RTIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19FQ0I9bQojIENPTkZJR19DUllQ
VE9fSENUUjIgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fS0VZV1JBUCBpcyBub3Qgc2V0CiMg
Q09ORklHX0NSWVBUT19MUlcgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fUENCQyBpcyBub3Qg
c2V0CkNPTkZJR19DUllQVE9fWFRTPW0KQ09ORklHX0NSWVBUT19OSFBPTFkxMzA1PW0KIyBlbmQg
b2YgTGVuZ3RoLXByZXNlcnZpbmcgY2lwaGVycyBhbmQgbW9kZXMKCiMKIyBBRUFEIChhdXRoZW50
aWNhdGVkIGVuY3J5cHRpb24gd2l0aCBhc3NvY2lhdGVkIGRhdGEpIGNpcGhlcnMKIwojIENPTkZJ
R19DUllQVE9fQUVHSVMxMjggaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ0hBQ0hBMjBQT0xZ
MTMwNSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQ0NNPW0KQ09ORklHX0NSWVBUT19HQ009bQpD
T05GSUdfQ1JZUFRPX0dFTklWPW0KQ09ORklHX0NSWVBUT19TRVFJVj1tCkNPTkZJR19DUllQVE9f
RUNIQUlOSVY9bQpDT05GSUdfQ1JZUFRPX0VTU0lWPW0KIyBlbmQgb2YgQUVBRCAoYXV0aGVudGlj
YXRlZCBlbmNyeXB0aW9uIHdpdGggYXNzb2NpYXRlZCBkYXRhKSBjaXBoZXJzCgojCiMgSGFzaGVz
LCBkaWdlc3RzLCBhbmQgTUFDcwojCkNPTkZJR19DUllQVE9fQkxBS0UyQj15CkNPTkZJR19DUllQ
VE9fQ01BQz1tCkNPTkZJR19DUllQVE9fR0hBU0g9bQpDT05GSUdfQ1JZUFRPX0hNQUM9eQojIENP
TkZJR19DUllQVE9fTUQ0IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19NRDU9bQojIENPTkZJR19D
UllQVE9fTUlDSEFFTF9NSUMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1BPTFkxMzA1PW0KIyBD
T05GSUdfQ1JZUFRPX1JNRDE2MCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fU0hBMT1tCkNPTkZJ
R19DUllQVE9fU0hBMjU2PXkKQ09ORklHX0NSWVBUT19TSEE1MTI9bQpDT05GSUdfQ1JZUFRPX1NI
QTM9bQojIENPTkZJR19DUllQVE9fU00zX0dFTkVSSUMgaXMgbm90IHNldAojIENPTkZJR19DUllQ
VE9fU1RSRUVCT0cgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fVk1BQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0NSWVBUT19XUDUxMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19YQ0JDIGlzIG5v
dCBzZXQKQ09ORklHX0NSWVBUT19YWEhBU0g9eQojIGVuZCBvZiBIYXNoZXMsIGRpZ2VzdHMsIGFu
ZCBNQUNzCgojCiMgQ1JDcyAoY3ljbGljIHJlZHVuZGFuY3kgY2hlY2tzKQojCkNPTkZJR19DUllQ
VE9fQ1JDMzJDPXkKIyBDT05GSUdfQ1JZUFRPX0NSQzMyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX0NSQ1QxMERJRiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DUkM2NF9ST0NLU09GVCBp
cyBub3Qgc2V0CiMgZW5kIG9mIENSQ3MgKGN5Y2xpYyByZWR1bmRhbmN5IGNoZWNrcykKCiMKIyBD
b21wcmVzc2lvbgojCkNPTkZJR19DUllQVE9fREVGTEFURT1tCkNPTkZJR19DUllQVE9fTFpPPXkK
IyBDT05GSUdfQ1JZUFRPXzg0MiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19MWjQgaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fTFo0SEMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1pTVEQ9
bQojIGVuZCBvZiBDb21wcmVzc2lvbgoKIwojIFJhbmRvbSBudW1iZXIgZ2VuZXJhdGlvbgojCiMg
Q09ORklHX0NSWVBUT19BTlNJX0NQUk5HIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19EUkJHX01F
TlU9bQpDT05GSUdfQ1JZUFRPX0RSQkdfSE1BQz15CiMgQ09ORklHX0NSWVBUT19EUkJHX0hBU0gg
aXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RSQkdfQ1RSPXkKQ09ORklHX0NSWVBUT19EUkJHPW0K
Q09ORklHX0NSWVBUT19KSVRURVJFTlRST1BZPW0KQ09ORklHX0NSWVBUT19KSVRURVJFTlRST1BZ
X01FTU9SWV9CTE9DS1M9NjQKQ09ORklHX0NSWVBUT19KSVRURVJFTlRST1BZX01FTU9SWV9CTE9D
S1NJWkU9MzIKQ09ORklHX0NSWVBUT19KSVRURVJFTlRST1BZX09TUj0xCkNPTkZJR19DUllQVE9f
S0RGODAwMTA4X0NUUj15CiMgZW5kIG9mIFJhbmRvbSBudW1iZXIgZ2VuZXJhdGlvbgoKIwojIFVz
ZXJzcGFjZSBpbnRlcmZhY2UKIwpDT05GSUdfQ1JZUFRPX1VTRVJfQVBJPXkKQ09ORklHX0NSWVBU
T19VU0VSX0FQSV9IQVNIPXkKQ09ORklHX0NSWVBUT19VU0VSX0FQSV9TS0NJUEhFUj1tCkNPTkZJ
R19DUllQVE9fVVNFUl9BUElfUk5HPW0KIyBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX1JOR19DQVZQ
IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19VU0VSX0FQSV9BRUFEPW0KIyBDT05GSUdfQ1JZUFRP
X1VTRVJfQVBJX0VOQUJMRV9PQlNPTEVURSBpcyBub3Qgc2V0CiMgZW5kIG9mIFVzZXJzcGFjZSBp
bnRlcmZhY2UKCkNPTkZJR19DUllQVE9fSEFTSF9JTkZPPXkKCiMKIyBBY2NlbGVyYXRlZCBDcnlw
dG9ncmFwaGljIEFsZ29yaXRobXMgZm9yIENQVSAocG93ZXJwYykKIwpDT05GSUdfQ1JZUFRPX01E
NV9QUEM9bQpDT05GSUdfQ1JZUFRPX1NIQTFfUFBDPW0KIyBlbmQgb2YgQWNjZWxlcmF0ZWQgQ3J5
cHRvZ3JhcGhpYyBBbGdvcml0aG1zIGZvciBDUFUgKHBvd2VycGMpCgpDT05GSUdfQ1JZUFRPX0hX
PXkKIyBDT05GSUdfQ1JZUFRPX0RFVl9ISUZOXzc5NVggaXMgbm90IHNldAojIENPTkZJR19DUllQ
VE9fREVWX0FUTUVMX0VDQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfQVRNRUxfU0hB
MjA0QSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fREVWX1ZJUlRJTz1tCiMgQ09ORklHX0NSWVBU
T19ERVZfU0FGRVhDRUwgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX0NDUkVFIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9BTUxPR0lDX0dYTCBpcyBub3Qgc2V0CkNPTkZJR19B
U1lNTUVUUklDX0tFWV9UWVBFPXkKQ09ORklHX0FTWU1NRVRSSUNfUFVCTElDX0tFWV9TVUJUWVBF
PXkKQ09ORklHX1g1MDlfQ0VSVElGSUNBVEVfUEFSU0VSPXkKQ09ORklHX1BLQ1M4X1BSSVZBVEVf
S0VZX1BBUlNFUj1tCkNPTkZJR19QS0NTN19NRVNTQUdFX1BBUlNFUj15CiMgQ09ORklHX1BLQ1M3
X1RFU1RfS0VZIGlzIG5vdCBzZXQKIyBDT05GSUdfU0lHTkVEX1BFX0ZJTEVfVkVSSUZJQ0FUSU9O
IGlzIG5vdCBzZXQKIyBDT05GSUdfRklQU19TSUdOQVRVUkVfU0VMRlRFU1QgaXMgbm90IHNldAoK
IwojIENlcnRpZmljYXRlcyBmb3Igc2lnbmF0dXJlIGNoZWNraW5nCiMKQ09ORklHX1NZU1RFTV9U
UlVTVEVEX0tFWVJJTkc9eQpDT05GSUdfU1lTVEVNX1RSVVNURURfS0VZUz0iIgojIENPTkZJR19T
WVNURU1fRVhUUkFfQ0VSVElGSUNBVEUgaXMgbm90IHNldAojIENPTkZJR19TRUNPTkRBUllfVFJV
U1RFRF9LRVlSSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lTVEVNX0JMQUNLTElTVF9LRVlSSU5H
IGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2VydGlmaWNhdGVzIGZvciBzaWduYXR1cmUgY2hlY2tpbmcK
CkNPTkZJR19CSU5BUllfUFJJTlRGPXkKCiMKIyBMaWJyYXJ5IHJvdXRpbmVzCiMKQ09ORklHX1JB
SUQ2X1BRPXkKQ09ORklHX1JBSUQ2X1BRX0JFTkNITUFSSz15CkNPTkZJR19MSU5FQVJfUkFOR0VT
PW0KIyBDT05GSUdfUEFDS0lORyBpcyBub3Qgc2V0CkNPTkZJR19CSVRSRVZFUlNFPXkKQ09ORklH
X0dFTkVSSUNfU1RSTkNQWV9GUk9NX1VTRVI9eQpDT05GSUdfR0VORVJJQ19TVFJOTEVOX1VTRVI9
eQpDT05GSUdfR0VORVJJQ19ORVRfVVRJTFM9eQojIENPTkZJR19DT1JESUMgaXMgbm90IHNldApD
T05GSUdfUFJJTUVfTlVNQkVSUz1tCgojCiMgQ3J5cHRvIGxpYnJhcnkgcm91dGluZXMKIwpDT05G
SUdfQ1JZUFRPX0xJQl9VVElMUz15CkNPTkZJR19DUllQVE9fTElCX0FFUz1tCkNPTkZJR19DUllQ
VE9fTElCX0FSQzQ9bQpDT05GSUdfQ1JZUFRPX0xJQl9HRjEyOE1VTD1tCkNPTkZJR19DUllQVE9f
TElCX0JMQUtFMlNfR0VORVJJQz15CkNPTkZJR19DUllQVE9fTElCX0NIQUNIQV9HRU5FUklDPW0K
Q09ORklHX0NSWVBUT19MSUJfQ0hBQ0hBPW0KQ09ORklHX0NSWVBUT19MSUJfQ1VSVkUyNTUxOV9H
RU5FUklDPW0KQ09ORklHX0NSWVBUT19MSUJfQ1VSVkUyNTUxOT1tCkNPTkZJR19DUllQVE9fTElC
X0RFUz1tCkNPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1X1JTSVpFPTEKQ09ORklHX0NSWVBUT19M
SUJfUE9MWTEzMDVfR0VORVJJQz1tCkNPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1PW0KQ09ORklH
X0NSWVBUT19MSUJfQ0hBQ0hBMjBQT0xZMTMwNT1tCkNPTkZJR19DUllQVE9fTElCX1NIQTE9eQpD
T05GSUdfQ1JZUFRPX0xJQl9TSEEyNTY9eQojIGVuZCBvZiBDcnlwdG8gbGlicmFyeSByb3V0aW5l
cwoKIyBDT05GSUdfQ1JDX0NDSVRUIGlzIG5vdCBzZXQKQ09ORklHX0NSQzE2PXkKIyBDT05GSUdf
Q1JDX1QxMERJRiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzY0X1JPQ0tTT0ZUIGlzIG5vdCBzZXQK
Q09ORklHX0NSQ19JVFVfVD1tCkNPTkZJR19DUkMzMj15CiMgQ09ORklHX0NSQzMyX1NFTEZURVNU
IGlzIG5vdCBzZXQKQ09ORklHX0NSQzMyX1NMSUNFQlk4PXkKIyBDT05GSUdfQ1JDMzJfU0xJQ0VC
WTQgaXMgbm90IHNldAojIENPTkZJR19DUkMzMl9TQVJXQVRFIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JDMzJfQklUIGlzIG5vdCBzZXQKQ09ORklHX0NSQzY0PW0KIyBDT05GSUdfQ1JDNCBpcyBub3Qg
c2V0CiMgQ09ORklHX0NSQzcgaXMgbm90IHNldApDT05GSUdfTElCQ1JDMzJDPXkKIyBDT05GSUdf
Q1JDOCBpcyBub3Qgc2V0CkNPTkZJR19YWEhBU0g9eQojIENPTkZJR19SQU5ET00zMl9TRUxGVEVT
VCBpcyBub3Qgc2V0CkNPTkZJR19aTElCX0lORkxBVEU9eQpDT05GSUdfWkxJQl9ERUZMQVRFPXkK
Q09ORklHX0xaT19DT01QUkVTUz15CkNPTkZJR19MWk9fREVDT01QUkVTUz15CkNPTkZJR19MWjRf
Q09NUFJFU1M9bQpDT05GSUdfTFo0SENfQ09NUFJFU1M9bQpDT05GSUdfTFo0X0RFQ09NUFJFU1M9
bQpDT05GSUdfWlNURF9DT01NT049eQpDT05GSUdfWlNURF9DT01QUkVTUz15CkNPTkZJR19aU1RE
X0RFQ09NUFJFU1M9eQojIENPTkZJR19YWl9ERUMgaXMgbm90IHNldApDT05GSUdfREVDT01QUkVT
U19HWklQPXkKQ09ORklHX0dFTkVSSUNfQUxMT0NBVE9SPXkKQ09ORklHX1JFRURfU09MT01PTj1t
CkNPTkZJR19SRUVEX1NPTE9NT05fRU5DMTY9eQpDT05GSUdfUkVFRF9TT0xPTU9OX0RFQzE2PXkK
Q09ORklHX0lOVEVSVkFMX1RSRUU9eQpDT05GSUdfQVNTT0NJQVRJVkVfQVJSQVk9eQpDT05GSUdf
Q0xPU1VSRVM9eQpDT05GSUdfSEFTX0lPTUVNPXkKQ09ORklHX0hBU19JT1BPUlQ9eQpDT05GSUdf
SEFTX0lPUE9SVF9NQVA9eQpDT05GSUdfSEFTX0RNQT15CkNPTkZJR19ORUVEX1NHX0RNQV9MRU5H
VEg9eQpDT05GSUdfRE1BX0RFQ0xBUkVfQ09IRVJFTlQ9eQpDT05GSUdfQVJDSF9ETUFfREVGQVVM
VF9DT0hFUkVOVD15CiMgQ09ORklHX0RNQV9BUElfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19E
TUFfTUFQX0JFTkNITUFSSyBpcyBub3Qgc2V0CkNPTkZJR19TR0xfQUxMT0M9eQpDT05GSUdfQ1BV
X1JNQVA9eQpDT05GSUdfRFFMPXkKQ09ORklHX0dMT0I9eQojIENPTkZJR19HTE9CX1NFTEZURVNU
IGlzIG5vdCBzZXQKQ09ORklHX05MQVRUUj15CkNPTkZJR19HRU5FUklDX0FUT01JQzY0PXkKQ09O
RklHX0NMWl9UQUI9eQojIENPTkZJR19JUlFfUE9MTCBpcyBub3Qgc2V0CkNPTkZJR19NUElMSUI9
eQpDT05GSUdfRElNTElCPXkKQ09ORklHX0xJQkZEVD15CkNPTkZJR19PSURfUkVHSVNUUlk9eQpD
T05GSUdfSEFWRV9HRU5FUklDX1ZEU089eQpDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVk9eQpD
T05GSUdfR0VORVJJQ19WRFNPX1RJTUVfTlM9eQpDT05GSUdfRk9OVF9TVVBQT1JUPXkKIyBDT05G
SUdfRk9OVFMgaXMgbm90IHNldApDT05GSUdfRk9OVF84eDg9eQpDT05GSUdfRk9OVF84eDE2PXkK
Q09ORklHX0ZPTlRfU1VOOHgxNj15CkNPTkZJR19TR19QT09MPXkKQ09ORklHX0FSQ0hfSEFTX1BN
RU1fQVBJPXkKQ09ORklHX0FSQ0hfSEFTX1VBQ0NFU1NfRkxVU0hDQUNIRT15CkNPTkZJR19BUkNI
X1NUQUNLV0FMSz15CkNPTkZJR19TVEFDS0RFUE9UPXkKQ09ORklHX1NUQUNLREVQT1RfQUxXQVlT
X0lOSVQ9eQpDT05GSUdfU1RBQ0tERVBPVF9NQVhfRlJBTUVTPTY0CkNPTkZJR19SRUZfVFJBQ0tF
Uj15CkNPTkZJR19TQklUTUFQPXkKIyBDT05GSUdfTFdRX1RFU1QgaXMgbm90IHNldAojIGVuZCBv
ZiBMaWJyYXJ5IHJvdXRpbmVzCgpDT05GSUdfR0VORVJJQ19JT1JFTUFQPXkKCiMKIyBLZXJuZWwg
aGFja2luZwojCgojCiMgcHJpbnRrIGFuZCBkbWVzZyBvcHRpb25zCiMKQ09ORklHX1BSSU5US19U
SU1FPXkKIyBDT05GSUdfUFJJTlRLX0NBTExFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQUNLVFJB
Q0VfQlVJTERfSUQgaXMgbm90IHNldApDT05GSUdfQ09OU09MRV9MT0dMRVZFTF9ERUZBVUxUPTcK
Q09ORklHX0NPTlNPTEVfTE9HTEVWRUxfUVVJRVQ9NApDT05GSUdfTUVTU0FHRV9MT0dMRVZFTF9E
RUZBVUxUPTQKIyBDT05GSUdfRFlOQU1JQ19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RZTkFN
SUNfREVCVUdfQ09SRSBpcyBub3Qgc2V0CkNPTkZJR19TWU1CT0xJQ19FUlJOQU1FPXkKQ09ORklH
X0RFQlVHX0JVR1ZFUkJPU0U9eQojIGVuZCBvZiBwcmludGsgYW5kIGRtZXNnIG9wdGlvbnMKCkNP
TkZJR19ERUJVR19LRVJORUw9eQojIENPTkZJR19ERUJVR19NSVNDIGlzIG5vdCBzZXQKCiMKIyBD
b21waWxlLXRpbWUgY2hlY2tzIGFuZCBjb21waWxlciBvcHRpb25zCiMKQ09ORklHX0FTX0hBU19O
T05fQ09OU1RfVUxFQjEyOD15CkNPTkZJR19ERUJVR19JTkZPX05PTkU9eQojIENPTkZJR19ERUJV
R19JTkZPX0RXQVJGX1RPT0xDSEFJTl9ERUZBVUxUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdf
SU5GT19EV0FSRjQgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19JTkZPX0RXQVJGNSBpcyBub3Qg
c2V0CkNPTkZJR19GUkFNRV9XQVJOPTEwMjQKQ09ORklHX1NUUklQX0FTTV9TWU1TPXkKIyBDT05G
SUdfUkVBREFCTEVfQVNNIGlzIG5vdCBzZXQKIyBDT05GSUdfSEVBREVSU19JTlNUQUxMIGlzIG5v
dCBzZXQKIyBDT05GSUdfREVCVUdfU0VDVElPTl9NSVNNQVRDSCBpcyBub3Qgc2V0CkNPTkZJR19T
RUNUSU9OX01JU01BVENIX1dBUk5fT05MWT15CiMgQ09ORklHX0RFQlVHX0ZPUkNFX0ZVTkNUSU9O
X0FMSUdOXzY0QiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZNTElOVVhfTUFQIGlzIG5vdCBzZXQKIyBD
T05GSUdfREVCVUdfRk9SQ0VfV0VBS19QRVJfQ1BVIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ29tcGls
ZS10aW1lIGNoZWNrcyBhbmQgY29tcGlsZXIgb3B0aW9ucwoKIwojIEdlbmVyaWMgS2VybmVsIERl
YnVnZ2luZyBJbnN0cnVtZW50cwojCiMgQ09ORklHX01BR0lDX1NZU1JRIGlzIG5vdCBzZXQKQ09O
RklHX0RFQlVHX0ZTPXkKQ09ORklHX0RFQlVHX0ZTX0FMTE9XX0FMTD15CiMgQ09ORklHX0RFQlVH
X0ZTX0RJU0FMTE9XX01PVU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfRlNfQUxMT1dfTk9O
RSBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfS0dEQj15CiMgQ09ORklHX0tHREIgaXMgbm90
IHNldApDT05GSUdfQVJDSF9IQVNfVUJTQU49eQojIENPTkZJR19VQlNBTiBpcyBub3Qgc2V0CkNP
TkZJR19IQVZFX0FSQ0hfS0NTQU49eQpDT05GSUdfSEFWRV9LQ1NBTl9DT01QSUxFUj15CiMgZW5k
IG9mIEdlbmVyaWMgS2VybmVsIERlYnVnZ2luZyBJbnN0cnVtZW50cwoKIwojIE5ldHdvcmtpbmcg
RGVidWdnaW5nCiMKQ09ORklHX05FVF9ERVZfUkVGQ05UX1RSQUNLRVI9eQpDT05GSUdfTkVUX05T
X1JFRkNOVF9UUkFDS0VSPXkKQ09ORklHX0RFQlVHX05FVD15CiMgZW5kIG9mIE5ldHdvcmtpbmcg
RGVidWdnaW5nCgojCiMgTWVtb3J5IERlYnVnZ2luZwojCkNPTkZJR19QQUdFX0VYVEVOU0lPTj15
CkNPTkZJR19ERUJVR19QQUdFQUxMT0M9eQojIENPTkZJR19ERUJVR19QQUdFQUxMT0NfRU5BQkxF
X0RFRkFVTFQgaXMgbm90IHNldApDT05GSUdfU0xVQl9ERUJVRz15CkNPTkZJR19TTFVCX0RFQlVH
X09OPXkKQ09ORklHX1BBR0VfT1dORVI9eQpDT05GSUdfUEFHRV9QT0lTT05JTkc9eQpDT05GSUdf
REVCVUdfUk9EQVRBX1RFU1Q9eQpDT05GSUdfQVJDSF9IQVNfREVCVUdfV1g9eQpDT05GSUdfREVC
VUdfV1g9eQpDT05GSUdfR0VORVJJQ19QVERVTVA9eQpDT05GSUdfUFREVU1QX0NPUkU9eQojIENP
TkZJR19QVERVTVBfREVCVUdGUyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0RFQlVHX0tNRU1MRUFL
PXkKIyBDT05GSUdfREVCVUdfS01FTUxFQUsgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19PQkpF
Q1RTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0hSSU5LRVJfREVCVUcgaXMgbm90IHNldAojIENPTkZJ
R19ERUJVR19TVEFDS19VU0FHRSBpcyBub3Qgc2V0CkNPTkZJR19TQ0hFRF9TVEFDS19FTkRfQ0hF
Q0s9eQpDT05GSUdfQVJDSF9IQVNfREVCVUdfVk1fUEdUQUJMRT15CiMgQ09ORklHX0RFQlVHX1ZN
IGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1ZNX1BHVEFCTEU9eQpDT05GSUdfQVJDSF9IQVNfREVC
VUdfVklSVFVBTD15CiMgQ09ORklHX0RFQlVHX1ZJUlRVQUwgaXMgbm90IHNldApDT05GSUdfREVC
VUdfTUVNT1JZX0lOSVQ9eQojIENPTkZJR19ERUJVR19QRVJfQ1BVX01BUFMgaXMgbm90IHNldApD
T05GSUdfREVCVUdfS01BUF9MT0NBTD15CkNPTkZJR19ERUJVR19ISUdITUVNPXkKQ09ORklHX0hB
VkVfREVCVUdfU1RBQ0tPVkVSRkxPVz15CkNPTkZJR19ERUJVR19TVEFDS09WRVJGTE9XPXkKIyBD
T05GSUdfTUVNX0FMTE9DX1BST0ZJTElORyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfS0FT
QU49eQpDT05GSUdfSEFWRV9BUkNIX0tBU0FOX1ZNQUxMT0M9eQpDT05GSUdfQ0NfSEFTX0tBU0FO
X0dFTkVSSUM9eQpDT05GSUdfQ0NfSEFTX1dPUktJTkdfTk9TQU5JVElaRV9BRERSRVNTPXkKQ09O
RklHX0tBU0FOPXkKQ09ORklHX0NDX0hBU19LQVNBTl9NRU1JTlRSSU5TSUNfUFJFRklYPXkKQ09O
RklHX0tBU0FOX0dFTkVSSUM9eQojIENPTkZJR19LQVNBTl9PVVRMSU5FIGlzIG5vdCBzZXQKQ09O
RklHX0tBU0FOX0lOTElORT15CkNPTkZJR19LQVNBTl9TVEFDSz15CkNPTkZJR19LQVNBTl9WTUFM
TE9DPXkKIyBDT05GSUdfS0FTQU5fTU9EVUxFX1RFU1QgaXMgbm90IHNldApDT05GSUdfS0FTQU5f
RVhUUkFfSU5GTz15CkNPTkZJR19IQVZFX0FSQ0hfS0ZFTkNFPXkKIyBDT05GSUdfS0ZFTkNFIGlz
IG5vdCBzZXQKIyBlbmQgb2YgTWVtb3J5IERlYnVnZ2luZwoKQ09ORklHX0RFQlVHX1NISVJRPXkK
CiMKIyBEZWJ1ZyBPb3BzLCBMb2NrdXBzIGFuZCBIYW5ncwojCiMgQ09ORklHX1BBTklDX09OX09P
UFMgaXMgbm90IHNldApDT05GSUdfUEFOSUNfT05fT09QU19WQUxVRT0wCkNPTkZJR19MT0NLVVBf
REVURUNUT1I9eQpDT05GSUdfU09GVExPQ0tVUF9ERVRFQ1RPUj15CiMgQ09ORklHX0JPT1RQQVJB
TV9TT0ZUTE9DS1VQX1BBTklDIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfSEFSRExPQ0tVUF9ERVRF
Q1RPUl9CVUREWT15CkNPTkZJR19IQVJETE9DS1VQX0RFVEVDVE9SPXkKIyBDT05GSUdfSEFSRExP
Q0tVUF9ERVRFQ1RPUl9QRVJGIGlzIG5vdCBzZXQKQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1Jf
QlVERFk9eQojIENPTkZJR19IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0ggaXMgbm90IHNldApDT05G
SUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9DT1VOVFNfSFJUSU1FUj15CkNPTkZJR19CT09UUEFSQU1f
SEFSRExPQ0tVUF9QQU5JQz15CkNPTkZJR19ERVRFQ1RfSFVOR19UQVNLPXkKQ09ORklHX0RFRkFV
TFRfSFVOR19UQVNLX1RJTUVPVVQ9NjAKIyBDT05GSUdfQk9PVFBBUkFNX0hVTkdfVEFTS19QQU5J
QyBpcyBub3Qgc2V0CkNPTkZJR19XUV9XQVRDSERPRz15CiMgQ09ORklHX1dRX0NQVV9JTlRFTlNJ
VkVfUkVQT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9MT0NLVVAgaXMgbm90IHNldAojIGVu
ZCBvZiBEZWJ1ZyBPb3BzLCBMb2NrdXBzIGFuZCBIYW5ncwoKIwojIFNjaGVkdWxlciBEZWJ1Z2dp
bmcKIwojIENPTkZJR19TQ0hFRF9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19TQ0hFRF9JTkZPPXkK
IyBDT05GSUdfU0NIRURTVEFUUyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNjaGVkdWxlciBEZWJ1Z2dp
bmcKCkNPTkZJR19ERUJVR19USU1FS0VFUElORz15CgojCiMgTG9jayBEZWJ1Z2dpbmcgKHNwaW5s
b2NrcywgbXV0ZXhlcywgZXRjLi4uKQojCkNPTkZJR19MT0NLX0RFQlVHR0lOR19TVVBQT1JUPXkK
IyBDT05GSUdfUFJPVkVfTE9DS0lORyBpcyBub3Qgc2V0CiMgQ09ORklHX0xPQ0tfU1RBVCBpcyBu
b3Qgc2V0CkNPTkZJR19ERUJVR19SVF9NVVRFWEVTPXkKQ09ORklHX0RFQlVHX1NQSU5MT0NLPXkK
Q09ORklHX0RFQlVHX01VVEVYRVM9eQojIENPTkZJR19ERUJVR19XV19NVVRFWF9TTE9XUEFUSCBp
cyBub3Qgc2V0CkNPTkZJR19ERUJVR19SV1NFTVM9eQojIENPTkZJR19ERUJVR19MT0NLX0FMTE9D
IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfQVRPTUlDX1NMRUVQIGlzIG5vdCBzZXQKIyBDT05G
SUdfREVCVUdfTE9DS0lOR19BUElfU0VMRlRFU1RTIGlzIG5vdCBzZXQKIyBDT05GSUdfTE9DS19U
T1JUVVJFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19XV19NVVRFWF9TRUxGVEVTVCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDRl9UT1JUVVJFX1RFU1QgaXMgbm90IHNldAojIGVuZCBvZiBMb2NrIERl
YnVnZ2luZyAoc3BpbmxvY2tzLCBtdXRleGVzLCBldGMuLi4pCgpDT05GSUdfREVCVUdfSVJRRkxB
R1M9eQpDT05GSUdfU1RBQ0tUUkFDRT15CiMgQ09ORklHX1dBUk5fQUxMX1VOU0VFREVEX1JBTkRP
TSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0tPQkpFQ1QgaXMgbm90IHNldAoKIwojIERlYnVn
IGtlcm5lbCBkYXRhIHN0cnVjdHVyZXMKIwpDT05GSUdfREVCVUdfTElTVD15CiMgQ09ORklHX0RF
QlVHX1BMSVNUIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1NHPXkKQ09ORklHX0RFQlVHX05PVElG
SUVSUz15CiMgQ09ORklHX0RFQlVHX0NMT1NVUkVTIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX01B
UExFX1RSRUU9eQojIGVuZCBvZiBEZWJ1ZyBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCgojCiMgUkNV
IERlYnVnZ2luZwojCiMgQ09ORklHX1JDVV9TQ0FMRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdf
UkNVX1RPUlRVUkVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JDVV9SRUZfU0NBTEVfVEVTVCBp
cyBub3Qgc2V0CkNPTkZJR19SQ1VfQ1BVX1NUQUxMX1RJTUVPVVQ9NjAKQ09ORklHX1JDVV9FWFBf
Q1BVX1NUQUxMX1RJTUVPVVQ9MApDT05GSUdfUkNVX0NQVV9TVEFMTF9DUFVUSU1FPXkKIyBDT05G
SUdfUkNVX1RSQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNVX0VRU19ERUJVRyBpcyBub3Qgc2V0
CiMgZW5kIG9mIFJDVSBEZWJ1Z2dpbmcKCiMgQ09ORklHX0RFQlVHX1dRX0ZPUkNFX1JSX0NQVSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NQVV9IT1RQTFVHX1NUQVRFX0NPTlRST0wgaXMgbm90IHNldAoj
IENPTkZJR19MQVRFTkNZVE9QIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfRlVOQ1RJT05fVFJBQ0VS
PXkKQ09ORklHX0hBVkVfRlVOQ1RJT05fR1JBUEhfVFJBQ0VSPXkKQ09ORklHX0hBVkVfRFlOQU1J
Q19GVFJBQ0U9eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1M9eQpDT05GSUdf
SEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1M9eQpDT05GSUdfSEFWRV9GVFJBQ0VfTUNPVU5U
X1JFQ09SRD15CkNPTkZJR19IQVZFX1NZU0NBTExfVFJBQ0VQT0lOVFM9eQpDT05GSUdfSEFWRV9P
QkpUT09MX01DT1VOVD15CkNPTkZJR19IQVZFX0NfUkVDT1JETUNPVU5UPXkKQ09ORklHX1RSQUNJ
TkdfU1VQUE9SVD15CiMgQ09ORklHX0ZUUkFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NBTVBMRVMg
aXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfREVWTUVNX0lTX0FMTE9XRUQ9eQpDT05GSUdfU1RS
SUNUX0RFVk1FTT15CkNPTkZJR19JT19TVFJJQ1RfREVWTUVNPXkKCiMKIyBwb3dlcnBjIERlYnVn
Z2luZwojCiMgQ09ORklHX1BQQ19ESVNBQkxFX1dFUlJPUiBpcyBub3Qgc2V0CkNPTkZJR19QUENf
V0VSUk9SPXkKQ09ORklHX1BSSU5UX1NUQUNLX0RFUFRIPTY0CiMgQ09ORklHX1BQQ19FTVVMQVRF
RF9TVEFUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPREVfUEFUQ0hJTkdfU0VMRlRFU1QgaXMgbm90
IHNldAojIENPTkZJR19KVU1QX0xBQkVMX0ZFQVRVUkVfQ0hFQ0tTIGlzIG5vdCBzZXQKIyBDT05G
SUdfRlRSX0ZJWFVQX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfTVNJX0JJVE1BUF9TRUxG
VEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1hNT04gaXMgbm90IHNldAojIENPTkZJR19CRElfU1dJ
VENIIGlzIG5vdCBzZXQKQ09ORklHX0JPT1RYX1RFWFQ9eQojIENPTkZJR19QUENfRUFSTFlfREVC
VUcgaXMgbm90IHNldApDT05GSUdfS0FTQU5fU0hBRE9XX09GRlNFVD0weGUwMDAwMDAwCiMgZW5k
IG9mIHBvd2VycGMgRGVidWdnaW5nCgojCiMgS2VybmVsIFRlc3RpbmcgYW5kIENvdmVyYWdlCiMK
Q09ORklHX0tVTklUPW0KQ09ORklHX0tVTklUX0RFQlVHRlM9eQojIENPTkZJR19LVU5JVF9GQVVM
VF9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0tVTklUX1RFU1Q9bQojIENPTkZJR19LVU5JVF9FWEFN
UExFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19LVU5JVF9BTExfVEVTVFMgaXMgbm90IHNldApD
T05GSUdfS1VOSVRfREVGQVVMVF9FTkFCTEVEPXkKIyBDT05GSUdfTk9USUZJRVJfRVJST1JfSU5K
RUNUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRkFVTFRfSU5KRUNUSU9OIGlzIG5vdCBzZXQKQ09O
RklHX0FSQ0hfSEFTX0tDT1Y9eQpDT05GSUdfQ0NfSEFTX1NBTkNPVl9UUkFDRV9QQz15CiMgQ09O
RklHX0tDT1YgaXMgbm90IHNldApDT05GSUdfUlVOVElNRV9URVNUSU5HX01FTlU9eQojIENPTkZJ
R19URVNUX0RIUlkgaXMgbm90IHNldAojIENPTkZJR19MS0RUTSBpcyBub3Qgc2V0CkNPTkZJR19D
UFVNQVNLX0tVTklUX1RFU1Q9bQpDT05GSUdfVEVTVF9MSVNUX1NPUlQ9bQpDT05GSUdfVEVTVF9N
SU5fSEVBUD1tCkNPTkZJR19URVNUX1NPUlQ9bQpDT05GSUdfVEVTVF9ESVY2ND1tCkNPTkZJR19U
RVNUX0lPVl9JVEVSPW0KQ09ORklHX0JBQ0tUUkFDRV9TRUxGX1RFU1Q9bQojIENPTkZJR19URVNU
X1JFRl9UUkFDS0VSIGlzIG5vdCBzZXQKQ09ORklHX1JCVFJFRV9URVNUPW0KQ09ORklHX1JFRURf
U09MT01PTl9URVNUPW0KQ09ORklHX0lOVEVSVkFMX1RSRUVfVEVTVD1tCkNPTkZJR19QRVJDUFVf
VEVTVD1tCkNPTkZJR19BVE9NSUM2NF9TRUxGVEVTVD15CkNPTkZJR19BU1lOQ19SQUlENl9URVNU
PW0KIyBDT05GSUdfVEVTVF9IRVhEVU1QIGlzIG5vdCBzZXQKQ09ORklHX1NUUklOR19LVU5JVF9U
RVNUPW0KQ09ORklHX1NUUklOR19IRUxQRVJTX0tVTklUX1RFU1Q9bQpDT05GSUdfVEVTVF9LU1RS
VE9YPXkKIyBDT05GSUdfVEVTVF9QUklOVEYgaXMgbm90IHNldAojIENPTkZJR19URVNUX1NDQU5G
IGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9CSVRNQVAgaXMgbm90IHNldApDT05GSUdfVEVTVF9V
VUlEPW0KQ09ORklHX1RFU1RfWEFSUkFZPW0KQ09ORklHX1RFU1RfTUFQTEVfVFJFRT1tCiMgQ09O
RklHX1RFU1RfUkhBU0hUQUJMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfSURBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVEVTVF9MS00gaXMgbm90IHNldApDT05GSUdfVEVTVF9CSVRPUFM9bQpDT05G
SUdfVEVTVF9WTUFMTE9DPW0KQ09ORklHX1RFU1RfQlBGPW0KIyBDT05GSUdfVEVTVF9CTEFDS0hP
TEVfREVWIGlzIG5vdCBzZXQKQ09ORklHX0ZJTkRfQklUX0JFTkNITUFSSz1tCiMgQ09ORklHX1RF
U1RfRklSTVdBUkUgaXMgbm90IHNldApDT05GSUdfVEVTVF9TWVNDVEw9bQpDT05GSUdfQklURklF
TERfS1VOSVQ9bQpDT05GSUdfQ0hFQ0tTVU1fS1VOSVQ9bQpDT05GSUdfSEFTSF9LVU5JVF9URVNU
PW0KQ09ORklHX1JFU09VUkNFX0tVTklUX1RFU1Q9bQpDT05GSUdfU1lTQ1RMX0tVTklUX1RFU1Q9
bQpDT05GSUdfTElTVF9LVU5JVF9URVNUPW0KQ09ORklHX0hBU0hUQUJMRV9LVU5JVF9URVNUPW0K
Q09ORklHX0xJTkVBUl9SQU5HRVNfVEVTVD1tCkNPTkZJR19DTURMSU5FX0tVTklUX1RFU1Q9bQpD
T05GSUdfQklUU19URVNUPW0KQ09ORklHX1NMVUJfS1VOSVRfVEVTVD1tCkNPTkZJR19NRU1DUFlf
S1VOSVRfVEVTVD1tCkNPTkZJR19JU19TSUdORURfVFlQRV9LVU5JVF9URVNUPW0KQ09ORklHX09W
RVJGTE9XX0tVTklUX1RFU1Q9bQpDT05GSUdfU1RBQ0tJTklUX0tVTklUX1RFU1Q9bQpDT05GSUdf
Rk9SVElGWV9LVU5JVF9URVNUPW0KQ09ORklHX1NJUEhBU0hfS1VOSVRfVEVTVD1tCkNPTkZJR19V
U0VSQ09QWV9LVU5JVF9URVNUPW0KIyBDT05GSUdfVEVTVF9VREVMQVkgaXMgbm90IHNldAojIENP
TkZJR19URVNUX1NUQVRJQ19LRVlTIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9LTU9EIGlzIG5v
dCBzZXQKQ09ORklHX1RFU1RfTUVNQ0FUX1A9bQpDT05GSUdfVEVTVF9NRU1JTklUPW0KQ09ORklH
X1RFU1RfRlJFRV9QQUdFUz1tCkNPTkZJR19URVNUX09CSlBPT0w9bQpDT05GSUdfQVJDSF9VU0Vf
TUVNVEVTVD15CiMgQ09ORklHX01FTVRFU1QgaXMgbm90IHNldAojIGVuZCBvZiBLZXJuZWwgVGVz
dGluZyBhbmQgQ292ZXJhZ2UKCiMKIyBSdXN0IGhhY2tpbmcKIwojIGVuZCBvZiBSdXN0IGhhY2tp
bmcKIyBlbmQgb2YgS2VybmVsIGhhY2tpbmcK

--MP_/_xpNTj4Ql8TXPxg/k=dTREm--
