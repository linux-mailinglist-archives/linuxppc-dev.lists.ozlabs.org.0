Return-Path: <linuxppc-dev+bounces-14680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A823CACC26
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 10:54:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPy495BW5z2yLg;
	Mon, 08 Dec 2025 20:54:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765187641;
	cv=none; b=PfNlYMGicpScQtrJ9y61sqUQlPOTN4frps4x/R8uFlAdS1sMEX6Qnqr2HpgKRalSDH+Vu7e+nKO4te8RAlEOU2G9FuOixnY8JVV6GOKM6Ze3tR/s5QO/8JJSpfqC7TOPtHDNxk2+c3sORlrhg3thb8ImQbvkIYHed3Nxb65LmqSrdmioAM4/gDGHqZlF168R3bFwFGK8kH2xY7BXWQ8XrC1OMzhf1eMiNp2/uP48XQ8LByoK8SB25OONmawzB/YlncSho1iTSnTt2V+Txl3HnNBog+y+qXaOHfBNvEQDI00ntWPz6KBJ8ROWILVDdfjBkKV3AiEvioGGPiF+rAjmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765187641; c=relaxed/relaxed;
	bh=lwt48NEkSl2Nfi3ha5JWpH+DXK/2QqLrDIgN6RWTDHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QUFfoq4yxey2x2zUfumsvW4GlsIZgpJPjWj2OcHt3yrAD1H1IKQcvfb1q0q9CvDAl6TSnC91FDkWsoxZaTH6x/GPIwQprFllFrBr/11KUGgc6mqysRoKR4kJRkF3slXoYpNQYTWw2UOZrX9PYJptxBMR0Sd8MlOq/OG2HBhb1/08bk/aEkAjDVv5ien0z7t/bbNWgBiPz8/IaQu5w7s7qXy3ZsVPAtBgzWo+6ZaTQj1YVyJgqh4yB8GfgJytow7FtzUC1c77z9UbzJ+IsGpWC/H/luUbqJ31VfqMnDB33zQGStcdZt7gqBH8QOs2I1JUUAs/p20ziNbynxGNxbz7ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mdb/binT; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mdb/binT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPy476knpz2yK7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 20:53:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C4B3435EE;
	Mon,  8 Dec 2025 09:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6AFC4CEF1;
	Mon,  8 Dec 2025 09:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765187636;
	bh=rD0DIpEb/qtLy1Y35h5k2Krjke27CfjFecoo8Rpjn3E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Mdb/binTrfLOFdi+JHioPPnRhoKNprVWdodF7b8nHiwThvD+OZPYmhcFIJK5KXHu+
	 FH6KV2xYdc0Rh3g+4lOwrkzQbyfjOOVLk3xsOquavWWS46Z+ouCm4OdD+YsxUimmfx
	 cW2eBcd/e+SG6u4iHy64H4j4jt6Tqx5QjUvuhEV12gf780piH+6ZZdYJ6NR0eghNAf
	 vc/zUH4Do0p2EbTUd6J26W97a6a118T7R9ysLPA6rFR9ZRM9+kKEyMB3yXaAbIAvf4
	 12+lBrdVEmZvU3+pdcHaGM9X7DDJNQjxpMZGJwjalvHSjuxcAh1DXqlBhLPPudc8rj
	 uT5jNVl2BgFnw==
Message-ID: <52ef7162-5578-4e73-9c46-2bae0be8df61@kernel.org>
Date: Mon, 8 Dec 2025 10:53:51 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson"
 <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
References: <4d0bd05d-6158-1323-3509-744d3fbe8fc7@xenosoft.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <4d0bd05d-6158-1323-3509-744d3fbe8fc7@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

Le 07/12/2025 à 17:17, Christian Zigotzky a écrit :
> Hello,
> 
> The latest Git kernel doesn't boot anymore on our e5500 machines (QEMU, 
> X5000, Mirari etc) after the PowerPC updates 6.19-1. [1]
> 
> Error messages (QEMU e5500 VM):
> 
> Bad kernel stack pointer 4d694c01a88270 at c0000000000003bc
> Oops: Bad kernel stack pointer, sig: 6 [#1]
> BE PAGE_SIZE=4K  SMP NR_CPUS=4 QEMU e500
> Modules linked in:
> CPU: 2 UID: 0 PID: 2788 Comm: udevd Not tainted 6.19.0-a4-powerpc64-smp- 
> g416f99c3b16f-dirty #1 VOLUNTARY
> Hardware name: QEMU ppce500 e5500 0x80240012 QEMU e500
> NIP:  c0000000000003bc LR: 0000000000230760 CTR: 0000000000230754
> REGS: c00000003ff9bd20 TRAP: 0300   Not tainted (6.19.0-a4-powerpc64- 
> smp-g416f99c3b16f-dirty)
> MSR:  0000000090029000 <CE,EE,ME>  CR: 48842888  XER: 20000000
> DEAR: 004d694c01a882f0 ESR: 0000000000000000 IRQMASK: 1
> GPR00: 01a56ad000000000 004d694c01a88270 ffd86ca00046c958 ffd86c89ffffffff
> GPR04: 0000000000000000 00000000ffffffff 0000000000000000 0000000000000007
> GPR08: 000000000037a60c 0000000000000000 0000000000000000 0000000000230754
> GPR12: 0000000004000000 c00000003fff7900 0000000000000004 0000000001a88270
> GPR16: 00000000020397f0 0000000000bc287c 00000000004d009c 0000000000000000
> GPR20: 0000000000000000 0000000000000000 00000000ffd86d5c 0000000001a4a130
> GPR24: 00000000004d0040 00000000ffd86bdc 0000000000000000 00000000ffd86ab4
> GPR28: 00000000004d009c 0000000001a807e0 0000000000379fc0 0000000001a84b50
> NIP [c0000000000003bc] interrupt_return_srr_user+0x80/0xf4
> LR [0000000000230760] 0x230760
> Call Trace:
> Code: 38000000 e8e100a8 e90100b0 e92100b8 e94100c0 e96100c8 e98100d0 
> e9a100d8 7c6ff120 7c8803a6 7ca903a6 7cc103a6 <e8410080> e8610088 
> e8810090 e8a10098
> ---[ end trace 0000000000000000 ]---
> 
> note: udevd[2788] exited with irqs disabled
> 
> ---
> 
> Please check the PowerPC updates 6.19-1. [1]
> 
> You can check it yourself with QEMU. ;-)
> 

I tried today's Linux tree (commit 
c2f2b01b74be8b40a2173372bcd770723f87e7b2 (HEAD, linus/master, 
linus/HEAD)) with corenet64_smp_defconfig and I have no problem booting 
on QEMU, see below. Can you provide more details on your problem, the 
full messages before the Oops, and your .config ?

Thanks
Christophe

chleroy@PO20335:~/linux-powerpc$ qemu-system-ppc64 -smp 4 -nographic -M 
ppce500 -cpu e5500 -m 1G -kernel 
/home/chleroy/linux-powerpc/arch/powerpc/boot/uImage  -initrd 
./qemu/rootfs.cpio.gz -append "noreboot no_hash_pointers" -s $* -netdev 
user,id=mynet,tftp=/var/lib/tftpboot -device e1000,netdev=mynet

random: crng init done
Hash pointers mode set to never.
Activating Kernel Userspace Access Protection
Activating Kernel Userspace Execution Prevention
MMU: Supported page sizes
          4 KB as direct
       4096 KB as direct
      16384 KB as direct
      65536 KB as direct
     262144 KB as direct
    1048576 KB as direct
MMU: Book3E HW tablewalk not supported
Linux version 6.18.0-12356-gc2f2b01b74be 
(chleroy@PO20335.IDSI0.si.c-s.fr) (powerpc64-linux-gcc (GCC) 8.5.0, GNU 
ld (GNU Binutils) 2.36.1) #1786 SMP Mon Dec  8 08:15:29 CET 2025
OF: reserved mem: Reserved memory: No reserved-memory node in the DT
Found initrd at 0xc000000004000000:0xc0000000041d1a3b
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
printk: legacy bootconsole [udbg0] enabled
CPU maps initialized for 1 thread per core
-----------------------------------------------------
phys_mem_size     = 0x40000000
dcache_bsize      = 0x40
icache_bsize      = 0x40
cpu_features      = 0x0000000300800194
   possible        = 0x0000000300900394
   always          = 0x0000000300800394
cpu_user_features = 0xcc008000 0x08000000
mmu_features      = 0x000a0010
firmware_features = 0x0000000000000000
-----------------------------------------------------
qemu_e500_setup_arch()
barrier-nospec: using isync; sync as speculation barrier
Zone ranges:
   DMA      [mem 0x0000000000000000-0x000000003fffffff]
   Normal   empty
Movable zone start for each node
Early memory node ranges
   node   0: [mem 0x0000000000000000-0x000000003fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000003fffffff]
MMU: Allocated 2112 bytes of context maps for 255 contexts
percpu: Embedded 27 pages/cpu s71896 r0 d38696 u262144
Kernel command line: noreboot no_hash_pointers
Unknown kernel command line parameters "noreboot", will be passed to 
user space.
printk: log_buf_len individual max cpu contribution: 4096 bytes
printk: log_buf_len total cpu_extra contributions: 12288 bytes
printk: log_buf_len min size: 16384 bytes
printk: log buffer data + meta data: 32768 + 114688 = 147456 bytes
printk: early log buf free: 13552(82%)
Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 262144
mem auto-init: stack:off, heap alloc:off, heap free:off
**********************************************************
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**                                                      **
** This system shows unhashed kernel memory addresses   **
** via the console, logs, and other interfaces. This    **
** might reduce the security of your system.            **
**                                                      **
** If you see this message and you are not debugging    **
** the kernel, report this immediately to your system   **
** administrator!                                       **
**                                                      **
** Use hash_pointers=always to force this mode off      **
**                                                      **
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**********************************************************
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
rcu: Hierarchical RCU implementation.
rcu: 	RCU event tracing is enabled.
rcu: 	RCU restricting CPUs from NR_CPUS=24 to nr_cpu_ids=4.
	Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
RCU Tasks Trace: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 
rcu_task_cpu_ids=4.
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 4 CPUs
mpic: ISU size: 256, shift: 8, mask: ff
mpic: Initializing for 256 sources
rcu: srcu_init: Setting srcu_struct sizes based on contention.
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 
0x5c4093a7d1, max_idle_ns: 440795210635 ns
clocksource: timebase mult[2800000] shift[24] registered
Console: colour dummy device 80x25
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
e500 family performance monitor hardware support registered
rcu: Hierarchical SRCU implementation.
rcu: 	Max phase no-delay instances is 1000.
Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
smp: Bringing up secondary CPUs ...
Activating Kernel Userspace Access Protection
Activating Kernel Userspace Access Protection
Activating Kernel Userspace Access Protection
smp: Brought up 1 node, 4 CPUs
Memory: 1001660K/1048576K available (15032K kernel code, 1540K rwdata, 
4296K rodata, 700K init, 256K bss, 41596K reserved, 0K cma-reserved)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, 
max_idle_ns: 7645041785100000 ns
posixtimers hash table entries: 2048 (order: 3, 32768 bytes, linear)
futex hash table entries: 1024 (65536 bytes on 1 NUMA nodes, total 64 
KiB, linear).
Machine: QEMU ppce500
SoC family: QorIQ
SoC ID: svr:0x00000000, Revision: 0.0
NET: Registered PF_NETLINK/PF_ROUTE protocol family
audit: initializing netlink subsys (disabled)
audit: type=2000 audit(0.632:1): state=initialized audit_enabled=0 res=1
Found FSL PCI host bridge at 0x0000000fe0008000. Firmware bus number: 0->255
PCI host bridge /pci@fe0008000 (primary) ranges:
  MEM 0x0000000c00000000..0x0000000c1fffffff -> 0x00000000e0000000
   IO 0x0000000fe1000000..0x0000000fe100ffff -> 0x0000000000000000
/pci@fe0008000: PCICSRBAR @ 0xdff00000
setup_pci_atmu: end of DRAM 40000000
fsl-pamu: fsl_pamu_init: could not find a PAMU node
HugeTLB: registered 4.00 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 4.00 MiB page
HugeTLB: registered 16.0 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page
HugeTLB: registered 64.0 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 64.0 MiB page
HugeTLB: registered 256 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 256 MiB page
HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
Freescale Elo series DMA driver
iommu: Default domain type: Translated
iommu: DMA domain TLB invalidation policy: strict mode
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti 
<giometti@linux.it>
PTP clock support registered
Advanced Linux Sound Architecture Driver Initialized.
PCI: Probing PCI hardware
fsl-pci fe0008000.pci: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io 
0xc000180000010000-0xc00018000001ffff] (bus address [0x0000-0xffff])
pci_bus 0000:00: root bus resource [mem 0xc00000000-0xc1fffffff] (bus 
address [0xe0000000-0xffffffff])
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
pci 0000:00:00.0: [1957:0030] type 00 class 0x0b2000 conventional PCI 
endpoint
pci 0000:00:00.0: BAR 0 [mem 0xdff00000-0xdfffffff]
pci 0000:00:01.0: [8086:100e] type 00 class 0x020000 conventional PCI 
endpoint
pci 0000:00:01.0: BAR 0 [mem 0x00000000-0x0001ffff]
pci 0000:00:01.0: BAR 1 [io  0xc000180000010000-0xc00018000001003f]
pci 0000:00:01.0: ROM [mem 0x00000000-0x0003ffff pref]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
pci 0000:00:01.0: ROM [mem 0xc00000000-0xc0003ffff pref]: assigned
pci 0000:00:01.0: BAR 0 [mem 0xc00040000-0xc0005ffff]: assigned
pci 0000:00:01.0: BAR 1 [io  0xc000180000010000-0xc00018000001003f]: 
assigned
pci_bus 0000:00: resource 4 [io  0xc000180000010000-0xc00018000001ffff]
pci_bus 0000:00: resource 5 [mem 0xc00000000-0xc1fffffff]
vgaarb: loaded
clocksource: Switched to clocksource timebase
NET: Registered PF_INET protocol family
IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes, 
linear)
Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
TCP bind hash table entries: 8192 (order: 6, 262144 bytes, linear)
TCP: Hash tables configured (established 8192 bind 8192)
UDP hash table entries: 512 (order: 3, 32768 bytes, linear)
UDP-Lite hash table entries: 512 (order: 3, 32768 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp-with-tls transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 0 bytes, default 64
workingset: timestamp_bits=62 max_order=18 bucket_order=0
Trying to unpack rootfs image as initramfs...
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
jffs2: version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
io scheduler mq-deadline registered
io scheduler kyber registered
io scheduler bfq registered
Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
printk: legacy console [ttyS0] disabled
serial8250.0: ttyS0 at MMIO 0xfe0004500 (irq = 42, base_baud = 25000000) 
is a 16550A
printk: legacy console [ttyS0] enabled
printk: legacy console [ttyS0] enabled
printk: legacy bootconsole [udbg0] disabled
printk: legacy bootconsole [udbg0] disabled
ePAPR hypervisor byte channel driver
brd: module loaded
Freeing initrd memory: 1860K
loop: module loaded
st: Version 20160209, fixed bufsize 32768, s/g segs 256
e1000: Intel(R) PRO/1000 Network Driver
e1000: Copyright (c) 1999-2006 Intel Corporation.
e1000 0000:00:01.0: enabling device (0000 -> 0003)
e1000 0000:00:01.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
e1000 0000:00:01.0 eth0: Intel(R) PRO/1000 Network Connection
e1000e: Intel(R) PRO/1000 Network Driver
e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
igb: Intel(R) Gigabit Ethernet Network Driver
igb: Copyright (c) 2007-2014 Intel Corporation.
usbcore: registered new interface driver usb-storage
i2c_dev: i2c /dev entries driver
mpc-i2c fe0003000.i2c: timeout 1000000 us
rtc-ds1307 0-0068: registered as rtc0
rtc-ds1307 0-0068: setting system clock to 2025-12-08T09:49:59 UTC 
(1765187399)
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
sdhci-pltfm: SDHCI platform and OF driver helper
Freescale hypervisor management driver
fsl-hv: no hypervisor found
ipip: IPv4 and MPLS over IPv4 tunneling driver
mmc0 bounce up to 128 segments into one, max segment size 65536 bytes
Initializing XFRM netlink socket
NET: Registered PF_INET6 protocol family
mmc0: SDHCI controller on fe002e000.sdhc [fe002e000.sdhc] using DMA
Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered PF_PACKET protocol family
PFKEY is deprecated and scheduled to be removed in 2027, please contact 
the netdev mailing list
NET: Registered PF_KEY protocol family
Key type dns_resolver registered
clk: Disabling unused clocks
ALSA device list:
   No soundcards found.
Freeing unused kernel image (initmem) memory: 700K
This architecture does not have kernel memory protection.
Run /init as init process
mount: mounting devtmpfs on /dev failed: Device or resource busy
Starting logging: OK
Initializing random number generator... done.
Starting network: OK
Found console ttyS0

Boot successful.
/ # ls -l
total 8
drwxr-xr-x    2 root     root          1500 Jul 12  2018 bin
drwxr-xr-x    5 root     root          2880 Dec  8 09:50 dev
drwxr-xr-x    5 root     root           440 Dec  8 09:50 etc
-rwxr-xr-x    1 root     root           178 Jul 12  2018 init
drwxr-xr-x    2 root     root           660 Jul 12  2018 lib
lrwxrwxrwx    1 root     root             3 Jul 12  2018 lib32 -> lib
lrwxrwxrwx    1 root     root            11 Jul 12  2018 linuxrc -> 
bin/busybox
drwxr-xr-x    2 root     root            40 Feb 20  2018 media
drwxr-xr-x    2 root     root            40 Feb 20  2018 mnt
drwxr-xr-x    2 root     root            40 Feb 20  2018 opt
dr-xr-xr-x  150 root     root             0 Dec  8 09:50 proc
drwx------    2 root     root            40 Feb 24  2018 root
drwxr-xr-x    3 root     root           140 Dec  8 09:50 run
-rwxr-xr-x    1 root     root           238 Jul 12  2018 run.sh
drwxr-xr-x    2 root     root          1100 Jul 12  2018 sbin
dr-xr-xr-x   11 root     root             0 Dec  8 09:50 sys
drwxrwxrwt    2 root     root            60 Dec  8 09:50 tmp
drwxr-xr-x    6 root     root           140 Jul 12  2018 usr
drwxr-xr-x    4 root     root           200 Jul 12  2018 var
/ #



