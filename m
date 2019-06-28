Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E4F58EEB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 02:15:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zcjf4HZHzDqjy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 10:15:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=telegraphics.com.au
 (client-ip=98.124.60.144; helo=kvm5.telegraphics.com.au;
 envelope-from=fthain@telegraphics.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 45Zch11zn9zDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 10:14:08 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 2FDC528CD9;
 Thu, 27 Jun 2019 20:13:59 -0400 (EDT)
Date: Fri, 28 Jun 2019 10:13:57 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: linuxppc-dev@lists.ozlabs.org, linux-ide@vger.kernel.org
Subject: pata-macio on PowerBook G3: stuck interrupt with MATSHITA CR-174
 CD-ROM
Message-ID: <alpine.LNX.2.21.1906271717080.68@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stan <userm57@yahoo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

I've received a bug report concerning the pata-macio driver, when running 
on a PowerBook G3 (Wallstreet).

With CONFIG_PATA_MACIO=n && CONFIG_BLK_DEV_IDE_PMAC=y, everything works.

With CONFIG_PATA_MACIO=y && CONFIG_BLK_DEV_IDE_PMAC=n, the CD-ROM fails.

When the CD-ROM mediabay module is swapped for a DVD-ROM mediabay module, 
everything works (either pata-macio or ide-pmac driver works fine).

I'm not familiar with ATA device drivers or the "Heathrow" chipset and its 
ATA interfaces so any hints as to how to debug this would be appreciated.

Here's the log from the CONFIG_PATA_MACIO=y kernel with CD-ROM fitted:

[    0.016446] printk: console [ttyS0] enabled
[    0.064507] printk: bootconsole [udbg0] disabled
[    0.119973] pid_max: default: 32768 minimum: 301
[    0.175852] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.254862] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.343822] rcu: Hierarchical SRCU implementation.
[    0.400629] smp: Bringing up secondary CPUs ...
[    0.453605] smp: Brought up 1 node, 1 CPU
[    0.501683] Using standard scheduler topology
[    0.555151] devtmpfs: initialized
[    0.594335] Duplicate name in PowerPC,750, renamed to "l2-cache#1"
[    0.671377] Duplicate name in pci, renamed to "mac-io#1"
[    0.734879] Duplicate name in pci, renamed to "pccard#1"
[    0.798672] random: get_random_u32 called from bucket_table_alloc+0x90/0x1a4 with crng_init=0
[    0.900756] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    1.018102] futex hash table entries: 512 (order: 2, 16384 bytes)
[    1.091844] NET: Registered protocol family 16
[    1.149658] PMU i2c /pci/mac-io/via-pmu
[    1.194834]  channel 1 bus <multibus>
[    1.237542]  channel 2 bus <multibus>
[    1.283706] PCI: Probing PCI hardware
[    1.326481] PCI host bridge to bus 0000:00
[    1.374850] pci_bus 0000:00: root bus resource [io  0x0000-0x7fffff]
[    1.451111] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfdffffff] (bus address [0x00000000-0x00ffffff])
[    1.573579] pci_bus 0000:00: root bus resource [mem 0x80000000-0xfcffffff]
[    1.656035] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.721896] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    1.801465] pci 0000:00:00.0: [1057:0002] type 00 class 0x060000
[    1.875076] pci 0000:00:0d.0: [106b:0017] type 00 class 0xff0000
[    1.945684] pci 0000:00:0d.0: reg 0x10: [mem 0xf4000000-0xf407ffff]
[    2.021957] pci 0000:00:10.0: [106b:0017] type 00 class 0xff0000
[    2.093150] pci 0000:00:10.0: reg 0x10: [mem 0xf3000000-0xf307ffff]
[    2.169344] pci 0000:00:11.0: [1002:4c50] type 00 class 0x038000
[    2.240603] pci 0000:00:11.0: reg 0x10: [mem 0x82000000-0x82ffffff]
[    2.315852] pci 0000:00:11.0: reg 0x14: [io  0x0400-0x04ff]
[    2.382757] pci 0000:00:11.0: reg 0x18: [mem 0x82fff000-0x82ffffff]
[    2.458076] pci 0000:00:11.0: reg 0x30: [mem 0xfd000000-0xfd01ffff pref]
[    2.538627] pci 0000:00:11.0: supports D1 D2
[    2.590881] pci 0000:00:13.0: [104c:ac15] type 02 class 0x060700
[    2.662054] pci 0000:00:13.0: reg 0x10: [mem 0x81803000-0x81803fff]
[    2.738090] pci 0000:00:13.1: [104c:ac15] type 02 class 0x060700
[    2.809506] pci 0000:00:13.1: reg 0x10: [mem 0x81802000-0x81802fff]
[    2.886775] pci_bus 0000:01: extended config space not accessible
[    2.958551] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 04
[    3.037665] pci_bus 0000:05: extended config space not accessible
[    3.111056] pci_bus 0000:05: busn_res: [bus 05-ff] end is updated to 08
[    3.190143] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 08
[    3.269804] PCI: Cannot allocate resource region 2 of device 0000:00:11.0, will remap
[    3.363779] PCI 0000:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]
[    3.440211] pci 0000:00:13.0: BAR 9: assigned [mem 0x84000000-0x87ffffff pref]
[    3.526840] pci 0000:00:13.0: BAR 10: assigned [mem 0x88000000-0x8bffffff]
[    3.609575] pci 0000:00:13.1: BAR 9: assigned [mem 0x8c000000-0x8fffffff pref]
[    3.696208] pci 0000:00:13.1: BAR 10: assigned [mem 0x90000000-0x93ffffff]
[    3.778818] pci 0000:00:11.0: BAR 6: assigned [mem 0xfd000000-0xfd01ffff pref]
[    3.865615] pci 0000:00:11.0: BAR 2: assigned [mem 0xfd020000-0xfd020fff]
[    3.947184] pci 0000:00:13.0: BAR 7: assigned [io  0x1000-0x10ff]
[    4.020382] pci 0000:00:13.0: BAR 8: assigned [io  0x1100-0x11ff]
[    4.093579] pci 0000:00:13.1: BAR 7: assigned [io  0x1200-0x12ff]
[    4.166780] pci 0000:00:13.1: BAR 8: assigned [io  0x1300-0x13ff]
[    4.239996] pci 0000:00:13.0: CardBus bridge to [bus 01-04]
[    4.306908] pci 0000:00:13.0:   bridge window [io  0x1000-0x10ff]
[    4.380112] pci 0000:00:13.0:   bridge window [io  0x1100-0x11ff]
[    4.453316] pci 0000:00:13.0:   bridge window [mem 0x84000000-0x87ffffff pref]
[    4.540112] pci 0000:00:13.0:   bridge window [mem 0x88000000-0x8bffffff]
[    4.621825] pci 0000:00:13.1: CardBus bridge to [bus 05-08]
[    4.688605] pci 0000:00:13.1:   bridge window [io  0x1200-0x12ff]
[    4.761808] pci 0000:00:13.1:   bridge window [io  0x1300-0x13ff]
[    4.835013] pci 0000:00:13.1:   bridge window [mem 0x8c000000-0x8fffffff pref]
[    4.921808] pci 0000:00:13.1:   bridge window [mem 0x90000000-0x93ffffff]
[    5.003378] pci_bus 0000:00: resource 4 [io  0x0000-0x7fffff]
[    5.072394] pci_bus 0000:00: resource 5 [mem 0xfd000000-0xfdffffff]
[    5.147683] pci_bus 0000:00: resource 6 [mem 0x80000000-0xfcffffff]
[    5.222977] pci_bus 0000:01: resource 0 [io  0x1000-0x10ff]
[    5.289904] pci_bus 0000:01: resource 1 [io  0x1100-0x11ff]
[    5.356832] pci_bus 0000:01: resource 2 [mem 0x84000000-0x87ffffff pref]
[    5.437356] pci_bus 0000:01: resource 3 [mem 0x88000000-0x8bffffff]
[    5.512651] pci_bus 0000:05: resource 0 [io  0x1200-0x12ff]
[    5.579721] pci_bus 0000:05: resource 1 [io  0x1300-0x13ff]
[    5.646508] pci_bus 0000:05: resource 2 [mem 0x8c000000-0x8fffffff pref]
[    5.727027] pci_bus 0000:05: resource 3 [mem 0x90000000-0x93ffffff]
[    5.872416] vgaarb: loaded
[    5.905009] SCSI subsystem initialized
[    5.949546] libata version 3.00 loaded.
[    5.995113] usbcore: registered new interface driver usbfs
[    6.060468] usbcore: registered new interface driver hub
[    6.123972] usbcore: registered new device driver usb
[    6.189339] clocksource: Switched to clocksource timebase
[    6.297751] NET: Registered protocol family 2
[    6.350946] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes)
[    6.441481] TCP established hash table entries: 4096 (order: 2, 16384 bytes)
[    6.526053] TCP bind hash table entries: 4096 (order: 3, 32768 bytes)
[    6.603397] TCP: Hash tables configured (established 4096 bind 4096)
[    6.679605] UDP hash table entries: 256 (order: 1, 8192 bytes)
[    6.749530] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
[    6.825109] NET: Registered protocol family 1
[    6.878013] RPC: Registered named UNIX socket transport module.
[    6.948055] RPC: Registered udp transport module.
[    7.004495] RPC: Registered tcp transport module.
[    7.060966] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    7.138531] PCI: CLS 32 bytes, default 32
[    7.187936] Thermal assist unit 
[    7.187943] using timers, 
[    7.225198] shrink_timer: 200 jiffies
[    7.305453] Initialise system trusted keyrings
[    7.358204] workingset: timestamp_bits=30 max_order=17 bucket_order=0
[    7.435216] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[   19.503576] Key type asymmetric registered
[   19.550921] Asymmetric key parser 'x509' registered
[   19.609752] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[   19.698127] io scheduler noop registered
[   19.745121] io scheduler deadline registered (default)
[   19.806812] io scheduler mq-deadline registered (default)
[   19.871649] io scheduler kyber registered
[   19.920630] pci 0000:00:11.0: enabling device (0086 -> 0087)
[   19.987955] Using unsupported 1024x768 (null) at 82800800, depth=15, pitch=2048
[   20.138881] Console: switching to colour frame buffer device 128x48
[   20.272868] fb0: Open Firmware frame buffer device on /pci/ATY,RageLTPro
[   20.353884] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
[   20.441579] Generic non-volatile memory driver v1.1
[   20.509574] brd: module loaded
[   20.569033] loop: module loaded
[   20.605484] MacIO PCI driver attached to Gatwick chipset
[   20.668887] MacIO PCI driver attached to Heathrow chipset
[   20.740980] swim3 0.00015000:floppy: [fd0] SWIM3 floppy controller in media bay
[   20.830812] 0.00013020:ch-a: ttyS0 at MMIO 0xf3013020 (irq = 16, base_baud = 230400) is a Z85c30 ESCC - Serial port
[   20.956536] 0.00013000:ch-b: ttyS1 at MMIO 0xf3013000 (irq = 17, base_baud = 230400) is a Z85c30 ESCC - Infrared port
[   21.084616] macio: fixed media-bay irq on gatwick
[   21.140299] macio: fixed left floppy irqs
[   21.188187] swim3 1.00015000:floppy: [fd1] Couldn't request interrupt
[   21.265200] swim3: probe of 1.00015000:floppy failed with error -16
[   21.340262] macio: fixed left ide irqs
[   21.385328] macio: fixed SCC irqs on gatwick
[   21.436648] 1.00013020:ch-a: ttyS2 at MMIO 0xf4013020 (irq = 79, base_baud = 230400) is a Z85c30 ESCC - Internal modem
[   21.566575] mediabay0: Registered Heathrow media-bay
[   21.838834] mediabay1: Registered Heathrow media-bay
[   21.896380] mediabay0: Bay contains an ATA device
[   22.109857] PMU Backlight initialized (pmubl)
[   22.162624] mesh: configured for synchronous 5 MB/s
[   22.438399] mesh: performing initial bus reset...
[   24.343361] random: fast init done
[   24.456353] adb device [2]: 2 0xC3
[   24.500269] adb device [3]: 3 0x1
[   24.541280] adb device [7]: 7 0x1F
[   24.594110] ADB keyboard at 2 has handler 0xC3
[   24.645403] Detected ADB keyboard, type ANSI.
[   24.698338] input: ADB keyboard as /devices/virtual/input/input0
[   24.770609] input: ADB Powerbook buttons as /devices/virtual/input/input1
[   24.916367] ADB mouse (trackpad) at 3 has handler 0x4
[   24.975478] input: ADB mouse as /devices/virtual/input/input2
[   26.538410] scsi host0: MESH
[   29.898319] pata-macio 0.00020000:ata0: Activating pata-macio chipset Heathrow ATA, Apple bus ID 0
[   30.006876] scsi host1: pata_macio
[   30.046460] ata1: PATA max MWDMA2 irq 30
[   30.288858] ata1.00: ATA-7: SAMSUNG HM100JC, YN100-08, max UDMA/100
[   30.362073] ata1.00: 195371568 sectors, multi 8: LBA48 
[   30.428801] scsi 1:0:0:0: Direct-Access     ATA      SAMSUNG HM100JC  0-08 PQ: 0 ANSI: 5
[   30.526375] sd 1:0:0:0: [sda] 195371568 512-byte logical blocks: (100 GB/93.2 GiB)
[   30.616461] sd 1:0:0:0: Attached scsi generic sg0 type 0
[   30.681190] sd 1:0:0:0: [sda] Write Protect is off
[   30.736732] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[   30.797599] sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[   31.178323] pata-macio 0.00021000:ata1: Activating pata-macio chipset Heathrow ATA, Apple bus ID 1
[   31.399429] random: crng init done
[   31.542666] scsi host2: pata_macio
[   32.291454] irq 36: nobody cared (try booting with the "irqpoll" option)
[   32.291484] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.20.0-pmac-00001-g2e01b2069c9c #1
[   32.291493] Call Trace:
[   32.291561] [dfff3f20] [c051a01c] dump_stack+0x88/0xb4 (unreliable)
[   32.291611] [dfff3f30] [c0078504] __report_bad_irq+0x34/0xe8
[   32.291631] [dfff3f50] [c0078880] note_interrupt+0x1fc/0x2c0
[   32.291652] [dfff3f80] [c00758cc] handle_irq_event_percpu+0x50/0x68
[   32.291670] [dfff3fa0] [c0075928] handle_irq_event+0x44/0x78
[   32.291693] [dfff3fc0] [c0079830] handle_level_irq+0xd0/0x154
[   32.291713] [dfff3fd0] [c0074ac8] generic_handle_irq+0x28/0x40
[   32.291745] [dfff3fe0] [c0006f70] __do_irq+0x2c/0x74
[   32.291785] [dfff3ff0] [c000f5d8] call_do_irq+0x24/0x3c
[   32.291803] [df43b7d0] [c0007044] do_IRQ+0x8c/0xe4
[   32.291822] [df43b7f0] [c000be70] timer_interrupt+0x2a4/0x2e8
[   32.291853] [df43b830] [c00124a8] ret_from_except+0x0/0x1c
[   32.291919] --- interrupt: 901 at __do_softirq+0xbc/0x27c
[   32.291919]     LR = irq_exit+0xd4/0xfc
[   32.291931] [df43b8f0] [2163ea80] 0x2163ea80 (unreliable)
[   32.291952] [df43b960] [c00349b8] irq_exit+0xd4/0xfc
[   32.291969] [df43b970] [c000bde4] timer_interrupt+0x218/0x2e8
[   32.291989] [df43b9b0] [c00124a8] ret_from_except+0x0/0x1c
[   32.292013] --- interrupt: 901 at console_unlock+0x98/0x4dc
[   32.292013]     LR = console_unlock+0x428/0x4dc
[   32.292026] [df43ba70] [c0071e7c] console_unlock+0x274/0x4dc (unreliable)
[   32.292046] [df43bad0] [c0073950] vprintk_emit+0x128/0x1e8
[   32.292084] [df43bb10] [c0323dd4] dev_vprintk_emit+0xd4/0x1ac
[   32.292102] [df43bbc0] [c0323ef4] dev_printk_emit+0x48/0x58
[   32.292121] [df43bbf0] [c0324a04] dev_printk+0x54/0x64
[   32.292144] [df43bc30] [c0358764] scsi_add_host_with_dma+0x54/0x318
[   32.292171] [df43bc50] [c038d0e4] ata_scsi_add_hosts+0x98/0x13c
[   32.292216] [df43bc90] [c0386a98] ata_host_register+0x14c/0x2ec
[   32.292236] [df43bcd0] [c0386d44] ata_host_activate+0x10c/0x144
[   32.292281] [df43bcf0] [c03990e8] pata_macio_common_init+0x2f4/0x4e4
[   32.292301] [df43bd50] [c03993b4] pata_macio_attach+0xdc/0x16c
[   32.292330] [df43bd70] [c034d8f0] macio_device_probe+0x58/0x98
[   32.292351] [df43bd90] [c0328c8c] really_probe+0x1e8/0x2e0
[   32.292368] [df43bdc0] [c0328fd8] driver_probe_device+0x68/0x238
[   32.292385] [df43bde0] [c03292c4] __driver_attach+0x11c/0x120
[   32.292410] [df43be00] [c0326f24] bus_for_each_dev+0x70/0xa0
[   32.292433] [df43be30] [c0328494] driver_attach+0x24/0x34
[   32.292453] [df43be40] [c03280b0] bus_add_driver+0x100/0x214
[   32.292472] [df43be60] [c0329d30] driver_register+0x88/0x14c
[   32.292492] [df43be70] [c034d7bc] macio_register_driver+0x24/0x34
[   32.292516] [df43be80] [c06b2960] pata_macio_init+0x5c/0x84
[   32.292536] [df43bea0] [c0004ab0] do_one_initcall+0x44/0x188
[   32.292563] [df43bf00] [c068f300] kernel_init_freeable+0x130/0x1e0
[   32.292581] [df43bf30] [c0004ccc] kernel_init+0x18/0x108
[   32.292604] [df43bf40] [c00121e4] ret_from_kernel_thread+0x14/0x1c
[   32.292612] handlers:
[   32.292645] [<f9be8b69>] ata_bmdma_interrupt
[   32.292654] Disabling IRQ #36
[   35.660004]  sda: [mac] sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8 sda9 sda10 sda11 sda12 sda13 sda14 sda15
[   35.772832] ata2: PATA max MWDMA2 irq 36
[   35.831382] sd 1:0:0:0: [sda] Attached SCSI disk
[   35.884892] pata-macio 1.00021000:ata4: Activating pata-macio chipset Heathrow ATA, Apple bus ID 4
[   35.994210] genirq: Flags mismatch irq 36. 00000000 (pata-macio[1.00021000:ata4]) vs. 00000000 (pata-macio[0.00021000:ata1])
[   36.127937] ata2.00: ATAPI: MATSHITA CR-174, A011, max MWDMA2
[   36.196720] pata-macio: probe of 1.00021000:ata4 failed with error -16
[   36.829435] eth0: BMAC at 00:05:02:07:5a:a6
[   36.829444] 
[   36.901341] aoe: cannot create debugfs directory
[   36.956514] aoe: AoE v85 initialised.
[   36.998695] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   37.077387] ehci-pci: EHCI PCI platform driver
[   37.130898] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[   37.205376] ohci-pci: OHCI PCI platform driver
[   37.258919] usbcore: registered new interface driver uas
[   37.322501] usbcore: registered new interface driver usb-storage
[   37.397618] mousedev: PS/2 mouse device common for all mice
[   37.466368] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[   37.551836] i2c /dev entries driver
[   37.593743] PowerMac i2c bus pmu 2 registered
[   37.645820] PowerMac i2c bus pmu 1 registered
[   37.703111] usbcore: registered new interface driver usbhid
[   37.768093] usbhid: USB HID core driver
[   37.817288] NET: Registered protocol family 17
[   37.869296] drmem: No dynamic reconfiguration memory found
[   37.936690] Loading compiled-in X.509 certificates
[   41.898356] ata2.00: qc timeout (cmd 0xa0)
[   41.945423] ata2.00: TEST_UNIT_READY failed (err_mask=0x5)
[   47.258317] ata2.00: qc timeout (cmd 0xa0)
[   47.305462] ata2.00: TEST_UNIT_READY failed (err_mask=0x5)
[   47.371256] ata2.00: limiting speed to MWDMA2:PIO3
[   52.698307] ata2.00: qc timeout (cmd 0xa0)
[   52.745460] ata2.00: TEST_UNIT_READY failed (err_mask=0x5)
[   52.811220] ata2.00: disabled
[   53.440411] EXT4-fs (sda11): mounting ext3 file system using the ext4 subsystem
[   53.562314] EXT4-fs (sda11): mounted filesystem with ordered data mode. Opts: (null)
[   53.653604] VFS: Mounted root (ext3 filesystem) readonly on device 8:11.
[   53.736762] Freeing unused kernel memory: 272K
[   53.788126] This architecture does not have kernel memory protection.
[   53.865357] Run /bin/sh as init process
/bin/sh: 0: can't access tty; job control turned off
# mount -t proc none /proc
# cat /proc/interrupts
           CPU0       
 16:        158  PMAC-PIC  15 Level     ttyS0
 18:       1691  PMAC-PIC  18 Level     VIA-PMU
 19:         15  PMAC-PIC  12 Level     MESH
 27:          0  PMAC-PIC  27 Level     cascade
 30:        144  PMAC-PIC  13 Level     pata-macio[0.00020000:ata0]
 32:          0  PMAC-PIC  32 Level     BMAC-txdma
 33:          1  PMAC-PIC  33 Level     BMAC-rxdma
 34:          0  PMAC-PIC  19 Level     SWIM3
 36:     100000  PMAC-PIC  14 Level     pata-macio[0.00021000:ata1]
 42:          0  PMAC-PIC  42 Level     BMAC-misc
LOC:       4408   Local timer interrupts for timer event device
BCT:          0   Broadcast timer interrupts for timer event device
LOC:      99943   Local timer interrupts for others
SPU:          0   Spurious interrupts
PMI:          0   Performance monitoring interrupts
MCE:          0   Machine check exceptions
NMI:          0   System Reset interrupts
# 

Here's the same kernel build with DVD-ROM fitted:

[    0.016447] printk: console [ttyS0] enabled
[    0.064513] printk: bootconsole [udbg0] disabled
[    0.119974] pid_max: default: 32768 minimum: 301
[    0.175854] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.254864] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.343829] rcu: Hierarchical SRCU implementation.
[    0.400636] smp: Bringing up secondary CPUs ...
[    0.453612] smp: Brought up 1 node, 1 CPU
[    0.501690] Using standard scheduler topology
[    0.555165] devtmpfs: initialized
[    0.594342] Duplicate name in PowerPC,750, renamed to "l2-cache#1"
[    0.671384] Duplicate name in pci, renamed to "mac-io#1"
[    0.734886] Duplicate name in pci, renamed to "pccard#1"
[    0.798679] random: get_random_u32 called from bucket_table_alloc+0x90/0x1a4 with crng_init=0
[    0.900758] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    1.018110] futex hash table entries: 512 (order: 2, 16384 bytes)
[    1.091846] NET: Registered protocol family 16
[    1.149663] PMU i2c /pci/mac-io/via-pmu
[    1.194832]  channel 1 bus <multibus>
[    1.237546]  channel 2 bus <multibus>
[    1.283712] PCI: Probing PCI hardware
[    1.326491] PCI host bridge to bus 0000:00
[    1.374860] pci_bus 0000:00: root bus resource [io  0x0000-0x7fffff]
[    1.451121] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfdffffff] (bus address [0x00000000-0x00ffffff])
[    1.573433] pci_bus 0000:00: root bus resource [mem 0x80000000-0xfcffffff]
[    1.656045] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.721906] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    1.801476] pci 0000:00:00.0: [1057:0002] type 00 class 0x060000
[    1.875080] pci 0000:00:0d.0: [106b:0017] type 00 class 0xff0000
[    1.945694] pci 0000:00:0d.0: reg 0x10: [mem 0xf4000000-0xf407ffff]
[    2.021965] pci 0000:00:10.0: [106b:0017] type 00 class 0xff0000
[    2.093317] pci 0000:00:10.0: reg 0x10: [mem 0xf3000000-0xf307ffff]
[    2.169364] pci 0000:00:11.0: [1002:4c50] type 00 class 0x038000
[    2.240612] pci 0000:00:11.0: reg 0x10: [mem 0x82000000-0x82ffffff]
[    2.315861] pci 0000:00:11.0: reg 0x14: [io  0x0400-0x04ff]
[    2.382773] pci 0000:00:11.0: reg 0x18: [mem 0x82fff000-0x82ffffff]
[    2.458092] pci 0000:00:11.0: reg 0x30: [mem 0xfd000000-0xfd01ffff pref]
[    2.538638] pci 0000:00:11.0: supports D1 D2
[    2.590731] pci 0000:00:13.0: [104c:ac15] type 02 class 0x060700
[    2.662067] pci 0000:00:13.0: reg 0x10: [mem 0x81803000-0x81803fff]
[    2.738101] pci 0000:00:13.1: [104c:ac15] type 02 class 0x060700
[    2.809517] pci 0000:00:13.1: reg 0x10: [mem 0x81802000-0x81802fff]
[    2.886781] pci_bus 0000:01: extended config space not accessible
[    2.958562] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 04
[    3.037843] pci_bus 0000:05: extended config space not accessible
[    3.111076] pci_bus 0000:05: busn_res: [bus 05-ff] end is updated to 08
[    3.190152] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 08
[    3.269815] PCI: Cannot allocate resource region 2 of device 0000:00:11.0, will remap
[    3.363790] PCI 0000:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]
[    3.440216] pci 0000:00:13.0: BAR 9: assigned [mem 0x84000000-0x87ffffff pref]
[    3.526852] pci 0000:00:13.0: BAR 10: assigned [mem 0x88000000-0x8bffffff]
[    3.609426] pci 0000:00:13.1: BAR 9: assigned [mem 0x8c000000-0x8fffffff pref]
[    3.696214] pci 0000:00:13.1: BAR 10: assigned [mem 0x90000000-0x93ffffff]
[    3.778824] pci 0000:00:11.0: BAR 6: assigned [mem 0xfd000000-0xfd01ffff pref]
[    3.865621] pci 0000:00:11.0: BAR 2: assigned [mem 0xfd020000-0xfd020fff]
[    3.947191] pci 0000:00:13.0: BAR 7: assigned [io  0x1000-0x10ff]
[    4.020389] pci 0000:00:13.0: BAR 8: assigned [io  0x1100-0x11ff]
[    4.093715] pci 0000:00:13.1: BAR 7: assigned [io  0x1200-0x12ff]
[    4.166835] pci 0000:00:13.1: BAR 8: assigned [io  0x1300-0x13ff]
[    4.240008] pci 0000:00:13.0: CardBus bridge to [bus 01-04]
[    4.306915] pci 0000:00:13.0:   bridge window [io  0x1000-0x10ff]
[    4.380124] pci 0000:00:13.0:   bridge window [io  0x1100-0x11ff]
[    4.453324] pci 0000:00:13.0:   bridge window [mem 0x84000000-0x87ffffff pref]
[    4.540120] pci 0000:00:13.0:   bridge window [mem 0x88000000-0x8bffffff]
[    4.621691] pci 0000:00:13.1: CardBus bridge to [bus 05-08]
[    4.688612] pci 0000:00:13.1:   bridge window [io  0x1200-0x12ff]
[    4.761815] pci 0000:00:13.1:   bridge window [io  0x1300-0x13ff]
[    4.835019] pci 0000:00:13.1:   bridge window [mem 0x8c000000-0x8fffffff pref]
[    4.921814] pci 0000:00:13.1:   bridge window [mem 0x90000000-0x93ffffff]
[    5.003389] pci_bus 0000:00: resource 4 [io  0x0000-0x7fffff]
[    5.072433] pci_bus 0000:00: resource 5 [mem 0xfd000000-0xfdffffff]
[    5.147742] pci_bus 0000:00: resource 6 [mem 0x80000000-0xfcffffff]
[    5.223073] pci_bus 0000:01: resource 0 [io  0x1000-0x10ff]
[    5.289917] pci_bus 0000:01: resource 1 [io  0x1100-0x11ff]
[    5.356846] pci_bus 0000:01: resource 2 [mem 0x84000000-0x87ffffff pref]
[    5.437365] pci_bus 0000:01: resource 3 [mem 0x88000000-0x8bffffff]
[    5.512659] pci_bus 0000:05: resource 0 [io  0x1200-0x12ff]
[    5.579586] pci_bus 0000:05: resource 1 [io  0x1300-0x13ff]
[    5.646514] pci_bus 0000:05: resource 2 [mem 0x8c000000-0x8fffffff pref]
[    5.727038] pci_bus 0000:05: resource 3 [mem 0x90000000-0x93ffffff]
[    5.872120] vgaarb: loaded
[    5.904625] SCSI subsystem initialized
[    5.949238] libata version 3.00 loaded.
[    5.994759] usbcore: registered new interface driver usbfs
[    6.060358] usbcore: registered new interface driver hub
[    6.123632] usbcore: registered new device driver usb
[    6.188887] clocksource: Switched to clocksource timebase
[    6.296678] NET: Registered protocol family 2
[    6.350210] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes)
[    6.440553] TCP established hash table entries: 4096 (order: 2, 16384 bytes)
[    6.525256] TCP bind hash table entries: 4096 (order: 3, 32768 bytes)
[    6.602621] TCP: Hash tables configured (established 4096 bind 4096)
[    6.678909] UDP hash table entries: 256 (order: 1, 8192 bytes)
[    6.748808] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
[    6.824441] NET: Registered protocol family 1
[    6.877302] RPC: Registered named UNIX socket transport module.
[    6.947321] RPC: Registered udp transport module.
[    7.003760] RPC: Registered tcp transport module.
[    7.060303] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    7.137908] PCI: CLS 32 bytes, default 32
[    7.187200] Thermal assist unit 
[    7.187207] using timers, 
[    7.224462] shrink_timer: 200 jiffies
[    7.304729] Initialise system trusted keyrings
[    7.357457] workingset: timestamp_bits=30 max_order=17 bucket_order=0
[    7.434540] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[   19.502582] Key type asymmetric registered
[   19.549744] Asymmetric key parser 'x509' registered
[   19.608748] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[   19.697133] io scheduler noop registered
[   19.744128] io scheduler deadline registered (default)
[   19.805819] io scheduler mq-deadline registered (default)
[   19.870657] io scheduler kyber registered
[   19.919636] pci 0000:00:11.0: enabling device (0086 -> 0087)
[   19.986966] Using unsupported 1024x768 (null) at 82800800, depth=15, pitch=2048
[   20.138112] Console: switching to colour frame buffer device 128x48
[   20.272118] fb0: Open Firmware frame buffer device on /pci/ATY,RageLTPro
[   20.353061] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
[   20.440771] Generic non-volatile memory driver v1.1
[   20.508590] brd: module loaded
[   20.567330] loop: module loaded
[   20.603794] MacIO PCI driver attached to Gatwick chipset
[   20.667286] MacIO PCI driver attached to Heathrow chipset
[   20.739360] swim3 0.00015000:floppy: [fd0] SWIM3 floppy controller in media bay
[   20.829332] 0.00013020:ch-a: ttyS0 at MMIO 0xf3013020 (irq = 16, base_baud = 230400) is a Z85c30 ESCC - Serial port
[   20.954804] 0.00013000:ch-b: ttyS1 at MMIO 0xf3013000 (irq = 17, base_baud = 230400) is a Z85c30 ESCC - Infrared port
[   21.083058] macio: fixed media-bay irq on gatwick
[   21.138903] macio: fixed left floppy irqs
[   21.186505] swim3 1.00015000:floppy: [fd1] Couldn't request interrupt
[   21.263513] swim3: probe of 1.00015000:floppy failed with error -16
[   21.338784] macio: fixed left ide irqs
[   21.383768] macio: fixed SCC irqs on gatwick
[   21.435035] 1.00013020:ch-a: ttyS2 at MMIO 0xf4013020 (irq = 79, base_baud = 230400) is a Z85c30 ESCC - Internal modem
[   21.564741] mediabay0: Registered Heathrow media-bay
[   21.838379] mediabay1: Registered Heathrow media-bay
[   21.895924] mediabay0: Bay contains an ATA device
[   22.109476] PMU Backlight initialized (pmubl)
[   22.162145] mesh: configured for synchronous 5 MB/s
[   22.437939] mesh: performing initial bus reset...
[   24.343027] random: fast init done
[   24.456666] adb device [2]: 2 0xC3
[   24.500569] adb device [3]: 3 0x1
[   24.541463] adb device [7]: 7 0x1F
[   24.594345] ADB keyboard at 2 has handler 0xC3
[   24.645640] Detected ADB keyboard, type ANSI.
[   24.698540] input: ADB keyboard as /devices/virtual/input/input0
[   24.770862] input: ADB Powerbook buttons as /devices/virtual/input/input1
[   24.916625] ADB mouse (trackpad) at 3 has handler 0x4
[   24.975731] input: ADB mouse as /devices/virtual/input/input2
[   26.537947] scsi host0: MESH
[   29.897854] pata-macio 0.00020000:ata0: Activating pata-macio chipset Heathrow ATA, Apple bus ID 0
[   30.006366] scsi host1: pata_macio
[   30.046658] ata1: PATA max MWDMA2 irq 30
[   30.288389] ata1.00: ATA-7: SAMSUNG HM100JC, YN100-08, max UDMA/100
[   30.361602] ata1.00: 195371568 sectors, multi 8: LBA48 
[   30.428381] scsi 1:0:0:0: Direct-Access     ATA      SAMSUNG HM100JC  0-08 PQ: 0 ANSI: 5
[   30.525903] sd 1:0:0:0: [sda] 195371568 512-byte logical blocks: (100 GB/93.2 GiB)
[   30.615759] sd 1:0:0:0: Attached scsi generic sg0 type 0
[   30.680652] sd 1:0:0:0: [sda] Write Protect is off
[   30.736160] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[   30.797029] sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[   31.177863] pata-macio 0.00021000:ata1: Activating pata-macio chipset Heathrow ATA, Apple bus ID 1
[   31.286351] scsi host2: pata_macio
[   31.325979] ata2: PATA max MWDMA2 irq 36
[   31.397880] pata-macio 1.00021000:ata4: Activating pata-macio chipset Heathrow ATA, Apple bus ID 4
[   31.503611] genirq: Flags mismatch irq 36. 00000000 (pata-macio[1.00021000:ata4]) vs. 00000000 (pata-macio[0.00021000:ata1])
[   31.638844] pata-macio: probe of 1.00021000:ata4 failed with error -16
[   31.717410] ata2.00: ATAPI: MATSHITADVD-ROM SR-8182, AC1b, max MWDMA2
[   32.347546] eth0: BMAC at 00:05:02:07:5a:a6
[   32.347554] 
[   32.418641] scsi 2:0:0:0: CD-ROM            MATSHITA DVD-ROM SR-8182  AC1b PQ: 0 ANSI: 5
[   32.517598] aoe: cannot create debugfs directory
[   32.572596] aoe: AoE v85 initialised.
[   32.614952] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   32.693848] ehci-pci: EHCI PCI platform driver
[   32.748873] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[   32.821763] ohci-pci: OHCI PCI platform driver
[   32.875962] usbcore: registered new interface driver uas
[   32.938307] sr 2:0:0:0: [sr0] scsi3-mmc drive: 12x/12x cd/rw xa/form2 cdda tray
[   33.025980] cdrom: Uniform CD-ROM driver Revision: 3.20
[   33.090467]  sda: [mac] sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8 sda9 sda10 sda11 sda12 sda13 sda14 sda15
[   33.202913] usbcore: registered new interface driver usb-storage
[   33.278754] mousedev: PS/2 mouse device common for all mice
[   33.346294] sr 2:0:0:0: Attached scsi CD-ROM sr0
[   33.411980] sd 1:0:0:0: [sda] Attached SCSI disk
[   33.469421] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[   33.554914] sr 2:0:0:0: Attached scsi generic sg1 type 5
[   33.618673] i2c /dev entries driver
[   33.660307] PowerMac i2c bus pmu 2 registered
[   33.712587] PowerMac i2c bus pmu 1 registered
[   33.769516] usbcore: registered new interface driver usbhid
[   33.834423] usbhid: USB HID core driver
[   33.883600] NET: Registered protocol family 17
[   33.935581] drmem: No dynamic reconfiguration memory found
[   34.002902] Loading compiled-in X.509 certificates
[   34.139360] EXT4-fs (sda11): mounting ext3 file system using the ext4 subsystem
[   34.261224] EXT4-fs (sda11): mounted filesystem with ordered data mode. Opts: (null)
[   34.352405] VFS: Mounted root (ext3 filesystem) readonly on device 8:11.
[   34.436039] Freeing unused kernel memory: 272K
[   34.487304] This architecture does not have kernel memory protection.
[   34.564637] Run /bin/sh as init process
/bin/sh: 0: can't access tty; job control turned off
# mount -t proc none /proc
# cat /proc/interrupts
           CPU0       
 16:        155  PMAC-PIC  15 Level     ttyS0
 18:       1096  PMAC-PIC  18 Level     VIA-PMU
 19:         15  PMAC-PIC  12 Level     MESH
 27:          0  PMAC-PIC  27 Level     cascade
 30:        144  PMAC-PIC  13 Level     pata-macio[0.00020000:ata0]
 32:          0  PMAC-PIC  32 Level     BMAC-txdma
 33:          1  PMAC-PIC  33 Level     BMAC-rxdma
 34:          0  PMAC-PIC  19 Level     SWIM3
 36:         14  PMAC-PIC  14 Level     pata-macio[0.00021000:ata1]
 42:          0  PMAC-PIC  42 Level     BMAC-misc
LOC:       2518   Local timer interrupts for timer event device
BCT:          0   Broadcast timer interrupts for timer event device
LOC:         40   Local timer interrupts for others
SPU:          0   Spurious interrupts
PMI:          0   Performance monitoring interrupts
MCE:          0   Machine check exceptions
NMI:          0   System Reset interrupts
# 

These logs are from v4.20 but the problem is the same in v5.2-rc2.

-- 
