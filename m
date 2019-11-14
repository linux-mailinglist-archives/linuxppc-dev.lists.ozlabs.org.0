Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2913FC003
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 07:03:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D9rz507bzF0m0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 17:03:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D9p100sPzF6k4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 17:00:56 +1100 (AEDT)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7DEDF682C079CAB3D7B0;
 Thu, 14 Nov 2019 14:00:45 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 14 Nov 2019
 14:00:40 +0800
Subject: Re: Pull request: scottwood/linux.git next
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20191022232155.GA26174@home.buserror.net>
 <87pnhw165y.fsf@mpe.ellerman.id.au>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <5be81f7c-d88b-a9e6-9a16-fed1f324e4a7@huawei.com>
Date: Thu, 14 Nov 2019 14:00:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <87pnhw165y.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.96.203]
X-CFilter-Loop: Reflected
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
Cc: Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2019/11/13 17:23, Michael Ellerman wrote:
> It needs to use PTRRELOC() for the kernstart_virt_addr accesses.
> 
> I've made that change and squashed it into the series. I've pushed that
> as a branch to here:
>    https://github.com/linuxppc/linux/commits/topic/kaslr-book3e32
> 
> 
> That boots for me on qemu mac99.
> 
> Jason can you please test it on your setup with KASLR enabled to make
> sure it still works.
> 

Thanks Michael,

I have confirmed it works with KASLR enabled on my machine.

[    0.000000] Memory CAM mapping: 256/256/256 Mb, residual: 3328Mb
[    0.000000] Linux version 5.4.0-rc2-00012-gc2d1a13520ee 
(yanaijie@138) (gcc version 7.3.0 (Compiler CPU V200R003C00SPC010B006)) 
#1 SMP Thu Nov 14 14:16:28 CST 2019
[    0.000000] Using QEMU e500 machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] CPU maps initialized for 1 thread per core
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x100000000
[    0.000000] dcache_bsize      = 0x40
[    0.000000] icache_bsize      = 0x40
[    0.000000] cpu_features      = 0x00000000000001b4
[    0.000000]   possible        = 0x00000000010103bc
[    0.000000]   always          = 0x0000000000000020
[    0.000000] cpu_user_features = 0x8c008000 0x08000000
[    0.000000] mmu_features      = 0x000a0010
[    0.000000] physical_start    = 0x93a4000
[    0.000000] -----------------------------------------------------
[    0.000000] barrier-nospec: using isync; sync as speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000002fffffff]
[    0.000000]   HighMem  [mem 0x0000000030000000-0x00000000ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x00000000ffffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000000000000-0x00000000ffffffff]
[    0.000000] MMU: Allocated 1088 bytes of context maps for 255 contexts
[    0.000000] percpu: Embedded 19 pages/cpu s47884 r8192 d21748 u77824
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 
1046656
[    0.000000] Kernel command line: console=ttyS0 IP=192.168.25.187 
root=/dev/vda rw
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 
bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 4066576K/4194304K available (11852K kernel code, 
780K rwdata, 2844K rodata, 3128K init, 265K bss, 127728K reserved, 0K 
cma-reserved, 3407872K highmem)
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xfff5f000..0xfffff000  : fixmap
[    0.000000]   * 0xffc00000..0xffe00000  : highmem PTEs
[    0.000000]   * 0xffbfe000..0xffc00000  : early ioremap
[    0.000000]   * 0xf1000000..0xffbfe000  : vmalloc & ioremap
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay 
is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] mpic: Setting up MPIC " OpenPIC  " version 1.2 at 
fe0040000, max 1 CPUs
[    0.000000] mpic: ISU size: 256, shift: 8, mask: ff
[    0.000000] mpic: Initializing for 256 sources
[    0.000000] random: get_random_u32 called from 
start_kernel+0x32c/0x4f4 with crng_init=0
[    0.000581] clocksource: timebase: mask: 0xffffffffffffffff 
max_cycles: 0x5c4093a7d1, max_idle_ns: 440795210635 ns
[    0.001136] clocksource: timebase mult[2800000] shift[24] registered
[    0.012660] Console: colour dummy device 80x25
[    0.013981] pid_max: default: 32768 minimum: 301
[    0.015472] Mount-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.015838] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.018991] *** VALIDATE tmpfs ***
[    0.031847] *** VALIDATE proc ***
[    0.034801] *** VALIDATE cgroup1 ***
[    0.034974] *** VALIDATE cgroup2 ***
[    0.053184] e500 family performance monitor hardware support registered
[    0.054372] rcu: Hierarchical SRCU implementation.
[    0.057294] smp: Bringing up secondary CPUs ...
[    0.057549] smp: Brought up 1 node, 1 CPU
[    0.057855] Using standard scheduler topology
[    0.068552] devtmpfs: initialized
[    0.077040] clocksource: jiffies: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.077544] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
[    0.086677] NET: Registered protocol family 16
[    0.089312] audit: initializing netlink subsys (disabled)

[    0.115531] Found FSL PCI host bridge at 0x0000000fe0008000. Firmware 
bus number: 0->255
[    0.115920] PCI host bridge /pci@fe0008000 (primary) ranges:
[    0.116586]  MEM 0x0000000c00000000..0x0000000c1fffffff -> 
0x00000000e0000000
[    0.116993]   IO 0x0000000fe1000000..0x0000000fe100ffff -> 
0x0000000000000000
[    0.118622] /pci@fe0008000: PCICSRBAR @ 0xdff00000
[    0.118852] setup_pci_atmu: end of DRAM 100000000
[    0.119635] /pci@fe0008000: DMA window size is 0xc0000000
[    0.131070] audit: type=2000 audit(0.092:1): state=initialized 
audit_enabled=0 res=1
[    0.140518] software IO TLB: mapped [mem 0x2971b000-0x2d71b000] (64MB)
[    0.140921] PCI: Probing PCI hardware
[    0.142830] fsl-pci fe0008000.pci: PCI host bridge to bus 8000:00
[    0.143463] pci_bus 8000:00: root bus resource [io  0x0000-0xffff]
[    0.143790] pci_bus 8000:00: root bus resource [mem 
0xc00000000-0xc1fffffff] (bus address [0xe0000000-0xffffffff])
[    0.144371] pci_bus 8000:00: root bus resource [bus 00-ff]
[    0.145016] pci_bus 8000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.145976] pci 8000:00:00.0: [1957:0030] type 00 class 0x0b2000
[    0.147585] pci 8000:00:00.0: reg 0x10: [mem 0xdff00000-0xdfffffff]
[    0.152425] pci 8000:00:01.0: [1af4:1000] type 00 class 0x020000
[    0.152913] pci 8000:00:01.0: reg 0x10: [io  0x0000-0x001f]
[    0.153252] pci 8000:00:01.0: reg 0x14: [mem 0x00000000-0x00000fff]
[    0.153650] pci 8000:00:01.0: reg 0x20: [mem 0x00000000-0x00003fff 
64bit pref]
[    0.153948] pci 8000:00:01.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
[    0.154627] pci 8000:00:02.0: [1af4:1001] type 00 class 0x010000
[    0.154931] pci 8000:00:02.0: reg 0x10: [io  0x0000-0x007f]
[    0.155170] pci 8000:00:02.0: reg 0x14: [mem 0x00000000-0x00000fff]
[    0.155440] pci 8000:00:02.0: reg 0x20: [mem 0x00000000-0x00003fff 
64bit pref]
[    0.156038] pci 8000:00:03.0: [1af4:1009] type 00 class 0x000200
[    0.156331] pci 8000:00:03.0: reg 0x10: [io  0x0000-0x003f]
[    0.156570] pci 8000:00:03.0: reg 0x14: [mem 0x00000000-0x00000fff]
[    0.156840] pci 8000:00:03.0: reg 0x20: [mem 0x00000000-0x00003fff 
64bit pref]
[    0.159396] pci_bus 8000:00: busn_res: [bus 00-ff] end is updated to 00
[    0.162849] pci 8000:00:01.0: BAR 6: assigned [mem 
0xc00000000-0xc0003ffff pref]
[    0.163989] pci 8000:00:01.0: BAR 4: assigned [mem 
0xc00040000-0xc00043fff 64bit pref]
[    0.164583] pci 8000:00:02.0: BAR 4: assigned [mem 
0xc00044000-0xc00047fff 64bit pref]
[    0.164934] pci 8000:00:03.0: BAR 4: assigned [mem 
0xc00048000-0xc0004bfff 64bit pref]
[    0.165268] pci 8000:00:01.0: BAR 1: assigned [mem 
0xc0004c000-0xc0004cfff]
[    0.165654] pci 8000:00:02.0: BAR 1: assigned [mem 
0xc0004d000-0xc0004dfff]
[    0.165956] pci 8000:00:03.0: BAR 1: assigned [mem 
0xc0004e000-0xc0004efff]
[    0.166301] pci 8000:00:02.0: BAR 0: assigned [io  0x1000-0x107f]
[    0.166587] pci 8000:00:03.0: BAR 0: assigned [io  0x1080-0x10bf]
[    0.166849] pci 8000:00:01.0: BAR 0: assigned [io  0x10c0-0x10df]
[    0.167395] pci_bus 8000:00: resource 4 [io  0x0000-0xffff]
[    0.167643] pci_bus 8000:00: resource 5 [mem 0xc00000000-0xc1fffffff]
[    0.238672] HugeTLB registered 4.00 MiB page size, pre-allocated 0 pages
[    0.238981] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
[    0.239232] HugeTLB registered 64.0 MiB page size, pre-allocated 0 pages
[    0.239505] HugeTLB registered 256 MiB page size, pre-allocated 0 pages
[    0.239757] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.266909] vgaarb: loaded
[    0.268488] SCSI subsystem initialized
[    0.272248] usbcore: registered new interface driver usbfs
[    0.272785] usbcore: registered new interface driver hub
[    0.273192] usbcore: registered new device driver usb
[    0.273917] pps_core: LinuxPPS API ver. 1 registered
[    0.274132] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 
Rodolfo Giometti <giometti@linux.it>
[    0.274571] PTP clock support registered
[    0.278401] EDAC MC: Ver: 3.0.0
[    0.291537] clocksource: Switched to clocksource timebase
[    0.947371] VFS: Disk quotas dquot_6.6.0
[    0.947750] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 
bytes)
[    0.950139] *** VALIDATE ramfs ***
[    0.950358] *** VALIDATE hugetlbfs ***
[    0.990556] NET: Registered protocol family 2
[    0.996848] tcp_listen_portaddr_hash hash table entries: 512 (order: 
0, 6144 bytes, linear)
[    0.997344] TCP established hash table entries: 8192 (order: 3, 32768 
bytes, linear)
[    0.997865] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, 
linear)
[    0.998367] TCP: Hash tables configured (established 8192 bind 8192)
[    0.999935] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    1.000411] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, 
linear)
[    1.002684] NET: Registered protocol family 1
[    1.006928] RPC: Registered named UNIX socket transport module.
[    1.007220] RPC: Registered udp transport module.
[    1.007418] RPC: Registered tcp transport module.
[    1.007608] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.008045] PCI: CLS 0 bytes, default 64
[    1.018906] workingset: timestamp_bits=30 max_order=20 bucket_order=0
[    1.023954] NFS: Registering the id_resolver key type
[    1.025160] Key type id_resolver registered
[    1.025528] Key type id_legacy registered
[    1.025840] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[    1.027580] ntfs: driver 2.1.32 [Flags: R/O].
[    1.028017] jffs2: version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red 
Hat, Inc.
[    1.029343] *** VALIDATE jffs2 ***
[    1.029923] fuse: init (API version 7.31)
[    1.030145] *** VALIDATE fuse ***
[    1.030308] *** VALIDATE fuse ***
[    1.031647] SGI XFS with ACLs, security attributes, realtime, debug 
enabled
[    1.034534] 9p: Installing v9fs 9p2000 file system support
[    1.086523] bounce: pool size: 64 pages
[    1.086909] io scheduler mq-deadline registered
[    1.087198] io scheduler kyber registered
[    1.090181] virtio-pci 8000:00:01.0: enabling device (0000 -> 0003)
[    1.094216] virtio-pci 8000:00:02.0: enabling device (0000 -> 0003)
[    1.096218] virtio-pci 8000:00:03.0: enabling device (0000 -> 0003)
[    1.102286] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.110556] printk: console [ttyS0] disabled
[    1.134829] serial8250.0: ttyS0 at MMIO 0xfe0004500 (irq = 42, 
base_baud = 115200) is a 16550A
[    1.136397] printk: console [ttyS0] enabled
[    1.136397] printk: console [ttyS0] enabled
[    1.137037] printk: bootconsole [udbg0] disabled
[    1.137037] printk: bootconsole [udbg0] disabled
[    1.139341] ePAPR hypervisor byte channel driver
[    1.162871] loop: module loaded
[    1.171471] virtio_blk virtio1: [vda] 6291456 512-byte logical blocks 
(3.22 GB/3.00 GiB)
[    1.208027] st: Version 20160209, fixed bufsize 32768, s/g segs 256
[    1.213030] libphy: Fixed MDIO Bus: probed
[    1.219498] e1000: Intel(R) PRO/1000 Network Driver - version 
7.3.21-k8-NAPI
[    1.219771] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    1.220139] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    1.220378] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.231399] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.231864] ehci-pci: EHCI PCI platform driver
[    1.232288] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.232765] ohci-pci: OHCI PCI platform driver
[    1.233346] ehci-fsl: Freescale EHCI Host controller driver
[    1.233889] usbcore: registered new interface driver usb-storage
[    1.234643] i2c /dev entries driver
[    1.235923] mpc-i2c fe0003000.i2c: timeout 1000000 us
[    1.246731] rtc-ds1307 0-0068: registered as rtc0
[    1.248770] device-mapper: uevent: version 1.0.3
[    1.251552] device-mapper: ioctl: 4.41.0-ioctl (2019-09-16) 
initialised: dm-devel@redhat.com
[    1.253535] Freescale(R) MPC85xx EDAC driver, (C) 2006 Montavista 
Software
[    1.255483] EDAC PCI0: Giving out device to module MPC85xx_edac 
controller mpc85xx_pci_err: DEV mpc85xx-pci-edac.0.auto (INTERRUPT)
[    1.256144] MPC85xx_edac acquired irq 24 for PCI Err
[    1.256466] MPC85xx_edac PCI err registered
[    1.257176] sdhci: Secure Digital Host Controller Interface driver
[    1.257537] sdhci: Copyright(c) Pierre Ossman
[    1.258524] usbcore: registered new interface driver usbhid
[    1.258766] usbhid: USB HID core driver
[    1.258949] Freescale hypervisor management driver
[    1.259160] fsl-hv: no hypervisor found
[    1.260074] ipip: IPv4 and MPLS over IPv4 tunneling driver
[    1.263269] Initializing XFRM netlink socket
[    1.263970] NET: Registered protocol family 10
[    1.274568] Segment Routing with IPv6
[    1.275693] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.278112] NET: Registered protocol family 17
[    1.278623] NET: Registered protocol family 15
[    1.279811] 9pnet: Installing 9P2000 support
[    1.281362] Key type dns_resolver registered
[    1.281791] drmem: No dynamic reconfiguration memory found
[    1.304162] Key type encrypted registered
[    1.307598] rtc-ds1307 0-0068: setting system clock to 
2019-11-14T06:18:22 UTC (1573712302)
[    1.319557] md: Waiting for all devices to be available before autodetect
[    1.319857] md: If you don't use raid, use raid=noautodetect
[    1.323318] md: Autodetecting RAID arrays.
[    1.323513] md: autorun ...
[    1.323649] md: ... autorun DONE.
[    1.447439] EXT4-fs (vda): recovery complete
[    1.449701] EXT4-fs (vda): mounted filesystem with ordered data mode. 
Opts: (null)
[    1.450272] VFS: Mounted root (ext4 filesystem) on device 253:0.
[    1.455491] devtmpfs: mounted
[    1.577786] Freeing unused kernel memory: 3128K
[    1.578011] This architecture does not have kernel memory protection.
[    1.578340] Run /sbin/init as init process
[    1.923836] random: fast init done
[    1.970814] random: systemd: uninitialized urandom read (16 bytes read)
[    1.992564] systemd[1]: systemd 215 running in system mode. (+PAM 
+AUDIT +SELINUX +IMA +SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ -SECCOMP 
-APPARMOR)
[    1.996140] systemd[1]: Detected architecture 'ppc'.

