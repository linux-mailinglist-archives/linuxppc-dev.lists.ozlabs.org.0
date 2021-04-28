Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8D436D8F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 15:57:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVgDY6Mzyz30BN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 23:57:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iw+b6hOz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iw+b6hOz; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVgD417Wbz2xfl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 23:56:51 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SDqTc9002050; Wed, 28 Apr 2021 09:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=r3xxhP8JL90aZnv+QQigK/Ppofw1xW2ZNxt26BtxjxI=;
 b=iw+b6hOzIc2sdZW48UkilIoEVbfjAGAIZEqX7ImjJXayRo6UsNa6CrC2JnePmW9Ny1Sf
 sRf7WPEcHqbSz3rCY6OB8OZcg2808n3hsWENnCjuTbLmlM/VNdWFezTYrTJS38H+i9vG
 +YzH5E2EvN/XlwAU6U7rIGr8TT+xFcjxh5HIiq50lisF8uQZEUhUohBQKfJrkTxMMXxg
 vfK5+wbXYDUH65ixKDMFUh/u7l/45CzFiXMRQDzTwVENJtfiS1jHJTPIWHo+oHvR665z
 uQ5HsXMXi4ZwuLu5x4BwIMEZmkW1q6rAYESqMNq7MoLGyK5MtTGRy1yrYzPQcJGZFoA/ 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3878ym84fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 09:56:37 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13SDrFIS008968;
 Wed, 28 Apr 2021 09:56:37 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3878ym84f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 09:56:37 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SDr2WE010769;
 Wed, 28 Apr 2021 13:56:36 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 384ay95bjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 13:56:36 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SDuZK313959552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 13:56:35 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86D0DC605B;
 Wed, 28 Apr 2021 13:56:35 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18B8DC6055;
 Wed, 28 Apr 2021 13:56:35 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.38.222])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 13:56:34 +0000 (GMT)
Message-ID: <453c7a7495408ac96127b36d67a8714632b5c0f7.camel@linux.ibm.com>
Subject: Re: PPC476 hangs during tlb flush after calling /init in crash
 kernel with linux 5.4+
From: Eddie James <eajames@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Date: Wed, 28 Apr 2021 08:56:34 -0500
In-Reply-To: <711a9a60-264b-9b86-6772-6585622a5bd4@csgroup.eu>
References: <b973fa4768140021719e7cc3123ee873d8b2a3f1.camel@linux.ibm.com>
 <a24e9e0d-1d4f-506b-9303-4b995815d3c4@csgroup.eu>
 <2f7587b1986d597a63169567124438325cbedfd7.camel@linux.ibm.com>
 <711a9a60-264b-9b86-6772-6585622a5bd4@csgroup.eu>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B0FOOWl6fjE0qY49qEisRayt6aJUqJTi
X-Proofpoint-GUID: CGRqLC5BgmlAAefi_xcx4-yCWsZRg4Ha
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_06:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280091
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
Cc: miltonm@us.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2021-04-28 at 08:08 +0200, Christophe Leroy wrote:
> 
> Le 28/04/2021 à 00:42, Eddie James a écrit :
> > On Tue, 2021-04-27 at 19:26 +0200, Christophe Leroy wrote:
> > > Hi Eddies,
> > > 
> > > Le 27/04/2021 à 19:03, Eddie James a écrit :
> > > > Hi all,
> > > > 
> > > > I'm having a problem in simulation and hardware where my PPC476
> > > > processor stops executing instructions after callling /init. In
> > > > my
> > > > case
> > > > this is a bash script. The code descends to flush the TLB, and
> > > > somewhere in the loop in _tlbil_pid, the PC goes to
> > > > InstructionTLBError47x but does not go any further. This only
> > > > occurs in
> > > > the crash kernel environment, which is using the same kernel,
> > > > initramfs, and init script as the main kernel, which executed
> > > > fine.
> > > > I
> > > > do not see this problem with linux 4.19 or 3.10. I do see it
> > > > with
> > > > 5.4
> > > > and 5.10. I see a fair amount of refactoring in the PPC memory
> > > > management area between 4.19 and 5.4. Can anyone point me in a
> > > > direction to debug this further? My stack trace is below as I
> > > > can
> > > > run
> > > > gdb in simulation.
> > > 
> > > Can you bisect to pin point the culprit commit ?
> > 
> > Hi, thanks for your prompt reply.
> > 
> > Good idea! I have bisected to:
> > 
> > commit 9e849f231c3c72d4c3c1b07c9cd19ae789da0420 (b8-bad,
> > refs/bisect/bad)
> > Author: Christophe Leroy <christophe.leroy@c-s.fr>
> > Date:   Thu Feb 21 19:08:40 2019 +0000
> > 
> >      powerpc/mm/32s: use generic mmu_mapin_ram() for all blocks.
> >      
> >      Now that mmu_mapin_ram() is able to handle other blocks
> >      than the one starting at 0, the WII can use it for all
> >      its blocks.
> >      
> >      Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >      Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > 
> > I also confirmed that reverting this commit resolves the issue in
> > 5.4+.
> > 
> > Now, I don't understand why this is problematic or what is really
> > happening... Reverting is probably not the desired solution.
> > 
> 
> Can you provide the 'dmesg' or a dump of the logs printed by the
> kernel at boottime ?

Yes:

[    0.000000] Linux version 5.4.85-a19ab63.ppcnf-fsp2 (oe-user@oe-host
) (gcc ve
rsion 8.3.0 (GCC)) #1 Tue Mar 30 15:32:31 UTC 2021
[    0.000000] Found initrd at 0xcf6a7000:0xcfffb09f
[    0.000000] Using FSP-2 machine description
[    0.000000] Found legacy serial port 0 for /plb4/opb/serial@b0020000
[    0.000000]   mem=10b0020000, taddr=10b0020000, irq=0, clk=20833333,
speed=11
5200
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x4000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x20
[    0.000000] cpu_features      = 0x0000000040800120
[    0.000000]   possible        = 0x0000000040800120
[    0.000000]   always          = 0x0000000000000020
[    0.000000] cpu_user_features = 0x8c008000 0x00000000
[    0.000000] mmu_features      = 0x00140020
[    0.000000] physical_start    = 0xc000000
[    0.000000] -----------------------------------------------------
[    0.000000] Top of RAM: 0x10000000, Total RAM: 0x4000000
[    0.000000] Memory hole size: 192MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x000000000c000000-0x000000000fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x000000000c000000-0x000000000fffffff]
[    0.000000] Initmem setup node 0 [mem 0x000000000c000000-
0x000000000fffffff]
[    0.000000] On node 0 totalpages: 16384
[    0.000000]   Normal zone: 160 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 16384 pages, LIFO batch:3
[    0.000000] MMU: Allocated 278528 bytes of context maps for 65535
contexts
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
16224
[    0.000000] Kernel command line: console=ttyS0,115200 loglevel=9
rootwait roo
t=/dev/mmcblk0p2 elfcorehdr=209456K maxcpus=1
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768
bytes, lin
ear)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384
bytes, line
ar)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 42028K/65536K available (7136K kernel code, 620K
rwdata, 
1916K rodata, 2080K init, 233K bss, 23508K reserved, 0K cma-reserved)
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xfffdf000..0xfffff000  : fixmap
[    0.000000]   * 0xd1000000..0xfffdf000  : vmalloc & ioremap
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=1,
Nodes=1
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] UIC0 (32 IRQ sources) at DCR 0x2c0
[    0.000000] UIC1 (32 IRQ sources) at DCR 0x2c8
[    0.000000] UIC2 (32 IRQ sources) at DCR 0x350
[    0.000000] UIC3 (32 IRQ sources) at DCR 0x358
[    0.000000] UIC4 (32 IRQ sources) at DCR 0x360
[    0.000000] UIC5 (32 IRQ sources) at DCR 0x368
[    0.000000] UIC6 (32 IRQ sources) at DCR 0x370
[    0.000000] UIC7 (32 IRQ sources) at DCR 0x2d0
[    0.000000] UIC8 (32 IRQ sources) at DCR 0x2d8
[    0.000000] UIC17 (32 IRQ sources) at DCR 0x320
[    0.000000] UIC18 (32 IRQ sources) at DCR 0x328
[    0.000000] UIC19 (32 IRQ sources) at DCR 0x330
[    0.000000] UIC20 (32 IRQ sources) at DCR 0x338
[    0.000000] UIC21 (32 IRQ sources) at DCR 0x340
[    0.000000] UIC22 (32 IRQ sources) at DCR 0x348
[    0.000000] UIC9 (32 IRQ sources) at DCR 0x2e0
[    0.000000] UIC10 (32 IRQ sources) at DCR 0x2e8
[    0.000000] UIC11 (32 IRQ sources) at DCR 0x2f0
[    0.000000] UIC12 (32 IRQ sources) at DCR 0x2f8
[    0.000000] UIC13 (32 IRQ sources) at DCR 0x300
[    0.000000] UIC14 (32 IRQ sources) at DCR 0x308
[    0.000000] UIC15 (32 IRQ sources) at DCR 0x310
[    0.000000] UIC16 (32 IRQ sources) at DCR 0x318
[    0.000000] random: get_random_u32 called from
start_kernel+0x32c/0x500 with 
crng_init=0
[    0.000000] time_init: decrementer frequency = 166.666667 MHz
[    0.000000] time_init: processor frequency   = 1333.333333 MHz
[    0.000004] clocksource: timebase: mask: 0xffffffffffffffff
max_cycles: 0x267
03d839d, max_idle_ns: 440795207088 ns
[    0.000007] clocksource: timebase mult[6000000] shift[24] registered
[    0.000011] clockevent: decrementer mult[2aaaaaac] shift[32] cpu[0]
[    0.000071] pid_max: default: 32768 minimum: 301
[    0.000107] Mount-cache hash table entries: 1024 (order: 0, 4096
bytes, linea
r)
[    0.000111] Mountpoint-cache hash table entries: 1024 (order: 0,
4096 bytes, 
linear)
[    0.000580] devtmpfs: initialized
[    0.002029] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, ma
x_idle_ns: 7645041785100000 ns
[    0.002034] futex hash table entries: 256 (order: -1, 3072 bytes,
linear)
[    0.002146] NET: Registered protocol family 16
[    0.004958] SCSI subsystem initialized
[    0.004973] libata version 3.00 loaded.
[    0.005003] usbcore: registered new interface driver usbfs
[    0.005019] usbcore: registered new interface driver hub
[    0.005031] usbcore: registered new device driver usb
[    0.005043] pps_core: LinuxPPS API ver. 1 registered
[    0.005045] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giome
tti <giometti@linux.it>
[    0.005052] PTP clock support registered
[    0.005257] clocksource: Switched to clocksource timebase
[    0.311619] thermal_sys: Registered thermal governor 'step_wise'
[    0.311665] NET: Registered protocol family 2
[    0.311834] tcp_listen_portaddr_hash hash table entries: 512 (order:
0, 4096 
bytes, linear)
[    0.311844] TCP established hash table entries: 1024 (order: 0, 4096
bytes, l
inear)
[    0.311855] TCP bind hash table entries: 1024 (order: 0, 4096 bytes,
linear)
[    0.311864] TCP: Hash tables configured (established 1024 bind 1024)
[    0.311877] UDP hash table entries: 256 (order: 0, 4096 bytes,
linear)
[    0.311885] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes,
linear)
[    0.311918] NET: Registered protocol family 1
[    0.311994] RPC: Registered named UNIX socket transport module.
[    0.311996] RPC: Registered udp transport module.
[    0.311999] RPC: Registered tcp transport module.
[    0.312001] RPC: Registered tcp NFSv4.1 backchannel transport
module.
[    0.312043] Trying to unpack rootfs image as initramfs...
[    0.632637] Freeing initrd memory: 9552K
[    0.634361] shadow_disr_to_uic15: 0x00000020 to uic15_pr
[    0.635621] workingset: timestamp_bits=30 max_order=14
bucket_order=0
[    0.638710] NFS: Registering the id_resolver key type
[    0.638717] Key type id_resolver registered
[    0.638720] Key type id_legacy registered
[    0.638730] jffs2: version 2.2. (NAND) (SUMMARY)  Â© 2001-2006 Red
Hat, Inc.
[    0.638858] fuse: init (API version 7.31)
[    0.664372] io scheduler mq-deadline registered
[    0.664375] io scheduler kyber registered
[    0.664573] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.665728] printk: console [ttyS0] disabled
[    0.685664] serial8250.0: ttyS0 at MMIO 0x10b0020000 (irq = 47,
base_baud = 1
302083) is a 16550A
[    0.693859] printk: console [ttyS0] enabled
[    0.694150] printk: console [ttyS0] disabled
[    0.694212] 10b0020000.serial: ttyS0 at MMIO 0x10b0020000 (irq = 47,
base_bau
d = 1302083) is a 16550
[    0.702632] printk: console [ttyS0] enabled
[    0.704642] brd: module loaded
[    0.704730] slram: not enough parameters.
[    0.704792] PPP generic driver version 2.4.2
[    0.704875] PPP Deflate Compression module registered
[    0.704941] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI)
Driver
[    0.705052] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.705148] usbcore: registered new interface driver usb-storage
[    0.705248] usbcore: registered new interface driver
usbserial_generic
[    0.705341] usbserial: USB Serial support registered for generic
[    0.705428] usbcore: registered new interface driver pl2303
[    0.705508] usbserial: USB Serial support registered for pl2303
[    0.705592] booke_wdt: powerpc book-e watchdog driver loaded
[    0.705769] sdhci: Secure Digital Host Controller Interface driver
[    0.705849] sdhci: Copyright(c) Pierre Ossman
[    0.705906] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.706033] mmc0: Invalid maximum block size, assuming 512 bytes
[    0.706112] mmc0 bounce up to 128 segments into one, max segment
size 65536 b
ytes
[    0.731266] mmc0: SDHCI controller on 10020c0000.emmc
[10020c0000.emmc] using
 DMA
[    0.731422] oprofile: using timer interrupt.
[    0.731546] Initializing XFRM netlink socket
[    0.731789] NET: Registered protocol family 10
[    0.732013] Segment Routing with IPv6
[    0.732096] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.732331] NET: Registered protocol family 17
[    0.732414] sctp: Hash tables configured (bind 1024/1024)
[    0.732591] Key type dns_resolver registered
[    0.732698] drmem: No dynamic reconfiguration memory found
[    0.732888] hctosys: unable to open rtc device (rtc0)
[    0.734057] Freeing unused kernel memory: 2080K
[    0.734116] This architecture does not have kernel memory
protection.
[    0.734199] Run /init as init process

> 
> The difference with this commit is that if there are several
> memblocks, all get mapped. Maybe your 
> target doesn't like it.
> 
> You are talking about simulation, are you using QEMU ? If yes can you
> provide details so that I can 
> try and reproduce the issue ?

No, we use Windriver simics for this system. I'm not sure if QEMU has a
model for the PPC476... and I suspect it won't recreate with a more
generic 32 bit ppc machine, though I can try and find out.

Thanks,
Eddie

> 
> Thanks
> Christophe

