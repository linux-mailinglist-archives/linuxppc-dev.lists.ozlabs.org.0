Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2389D3DC6AE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 17:35:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GcSy10hzVz3bnL
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 01:35:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GcSxX6TDwz300x
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 01:34:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GcSxN5MbjzB9xF;
 Sat, 31 Jul 2021 17:34:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lz5QMw1alx1r; Sat, 31 Jul 2021 17:34:32 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GcSxN3sVmzB9wR;
 Sat, 31 Jul 2021 17:34:32 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 5C04610B; Sat, 31 Jul 2021 17:39:54 +0200 (CEST)
Received: from 37-173-18-216.coucou-networks.fr
 (37-173-18-216.coucou-networks.fr [37.173.18.216]) by messagerie.c-s.fr
 (Horde Framework) with HTTP; Sat, 31 Jul 2021 17:39:54 +0200
Date: Sat, 31 Jul 2021 17:39:54 +0200
Message-ID: <20210731173954.Horde.fV2Xkw7-sxjG0DUcZ_JO_g3@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH v3 31/41] powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
 <ca5795d04a220586b7037dbbbe6951dfa9e768eb.1615552867.git.christophe.leroy@csgroup.eu>
 <666e3ab4-372-27c2-4621-7cc3933756dd@linux-m68k.org>
In-Reply-To: <666e3ab4-372-27c2-4621-7cc3933756dd@linux-m68k.org>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: Stan Johnson <userm57@yahoo.com>, linux-kernel@vger.kernel.org,
 Nick Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Finn Thain <fthain@linux-m68k.org> a =C3=A9crit=C2=A0:

> Hi Christophe,
>
> On Fri, 12 Mar 2021, Christophe Leroy wrote:
>
>> In order to get more control in exception prolog, dismantle all non
>> standard exception macros, finishing with EXC_XFER_STD and EXC_XFER_LITE
>> and EXC_XFER_TEMPLATE.
>>
>> Also remove transfer_to_handler_full and ret_from_except and
>> ret_from_except_full as they are not used anymore.
>>
>> Last parameter of EXCEPTION() is now ignored, will be removed in a later
>> patch to avoid too much churn.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>  arch/powerpc/kernel/entry_32.S       | 42 +-----------------------
>>  arch/powerpc/kernel/head_32.h        | 21 ++++--------
>>  arch/powerpc/kernel/head_40x.S       | 33 ++++++++++++-------
>>  arch/powerpc/kernel/head_8xx.S       | 12 +++++--
>>  arch/powerpc/kernel/head_book3s_32.S | 27 ++++++++++-----
>>  arch/powerpc/kernel/head_booke.h     | 49 +++++++++++++++-------------
>>  arch/powerpc/kernel/head_fsl_booke.S | 14 +++++---
>>  7 files changed, 92 insertions(+), 106 deletions(-)
>>
>
> Stan Johnson contacted me about a regression in mainline that he observed
> on his G3 Powerbooks. Using 'git bisect' we determined that this patch wa=
s
> the cause of the regression, i.e. commit 4c0104a83fc3 ("powerpc/32:
> Dismantle EXC_XFER_STD/LITE/TEMPLATE").
>
> When testing 4c0104a83fc and all subsequent builds, various user processe=
s
> were liable to segfault. Here is the console log that Stan provided:

Hi, i will be able to look at that more in details next week, however=20=20
I=20have a few preliminary qurstions.

Can you reliabily reproduce the problem with the said commit, and can=20=20
you=20reliabily run without problem with the parent commit ? I'm asking=20=
=20
because=20at first look that commit doesn't bring any functionnal change.

Coukd you provide your .config ?

Could you try without CONFIG_VMAP_STACK

Thanks
Christophe

>
> [    0.000000] printk: debug: ignoring loglevel setting.
> [    0.000000] Total memory =3D 512MB; using 1024kB for hash table
> [    0.000000] Activating Kernel Userspace Execution Prevention
> [    0.000000] Activating Kernel Userspace Access Protection
> [    0.000000] Linux version 5.12.0-rc3-pmac-00067-g4c0104a83fc=20=20
>=20(johnson@ThinkPad) (powerpc-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0,=20=20
>=20GNU ld (GNU Binutils for Debian) 2.31.1) #22 SMP Fri Jul 30 12:15:00=20=
=20
>=20MDT 2021
> [    0.000000] ioremap() called early from=20=20
>=20probe_one_macio+0x130/0x268. Use early_ioremap() instead
> [    0.000000] Found a Gatwick mac-io controller, rev: 0, mapped at=20=20
>=200x(ptrval)
> [    0.000000] ioremap() called early from=20=20
>=20probe_one_macio+0x130/0x268. Use early_ioremap() instead
> [    0.000000] Found a Heathrow mac-io controller, rev: 0, mapped at=20=
=20
>=200x(ptrval)
> [    0.000000] PowerMac motherboard: PowerBook Wallstreet
> [    0.000000] ioremap() called early from find_via_pmu+0x244/0x56c.=20=
=20
>=20Use early_ioremap() instead
> [    0.000000] PMU driver v2 initialized for PowerBook G3 Series,=20=20
>=20firmware: 0a
> [    0.000000] Using PowerMac machine description
> [    0.000000] printk: bootconsole [udbg0] enabled
> [    0.000000] CPU maps initialized for 1 thread per core
> [    0.000000]  (thread shift is 0)
> [    0.000000] -----------------------------------------------------
> [    0.000000] phys_mem_size     =3D 0x20000000
> [    0.000000] dcache_bsize      =3D 0x20
> [    0.000000] icache_bsize      =3D 0x20
> [    0.000000] cpu_features      =3D 0x000000000501a008
> [    0.000000]   possible        =3D 0x00000000277de14a
> [    0.000000]   always          =3D 0x0000000001000000
> [    0.000000] cpu_user_features =3D 0x8c000001 0x00000000
> [    0.000000] mmu_features      =3D 0x00000001
> [    0.000000] Hash_size         =3D 0x100000
> [    0.000000] Hash_mask         =3D 0x3fff
> [    0.000000] -----------------------------------------------------
> [    0.000000] ioremap() called early from=20=20
>=20pmac_setup_arch+0x10c/0x294. Use early_ioremap() instead
> [    0.000000] nvram: OF partition at 0x1800
> [    0.000000] nvram: XP partition at 0x1300
> [    0.000000] nvram: NR partition at 0x1400
> [    0.000000] Top of RAM: 0x20000000, Total RAM: 0x20000000
> [    0.000000] Memory hole size: 0MB
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000000000-0x000000001fffffff]
> [    0.000000]   Normal   empty
> [    0.000000]   HighMem  empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x000000001fffffff]
> [    0.000000] Initmem setup node 0 [mem=20=20
>=200x0000000000000000-0x000000001fffffff]
> [    0.000000] On node 0 totalpages: 131072
> [    0.000000]   DMA zone: 1024 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 131072 pages, LIFO batch:31
> [    0.000000] percpu: Embedded 13 pages/cpu s21644 r8192 d23412 u53248
> [    0.000000] pcpu-alloc: s21644 r8192 d23412 u53248 alloc=3D13*4096
> [    0.000000] pcpu-alloc: [0] 0 [0] 1
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 130=
048
> [    0.000000] Kernel command line: root=3D/dev/sda12 console=3DttyS0=20=
=20
>=20console=3Dtty printk.time earlyprintk ignore_loglevel video=3Dofonly
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6,=20=20
>=20262144 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5,=20=20
>=20131072 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 498908K/524288K available (6756K kernel code,=20=
=20
>=20352K rwdata, 1276K rodata, 1232K init, 176K bss, 25380K reserved, 0K=20=
=20
>=20cma-reserved, 0K highmem)
> [    0.000000] Kernel virtual memory layout:
> [    0.000000]   * 0xffbbf000..0xfffff000  : fixmap
> [    0.000000]   * 0xff400000..0xff800000  : highmem PTEs
> [    0.000000]   * 0xff2fd000..0xff400000  : early ioremap
> [    0.000000]   * 0xe1000000..0xff2fd000  : vmalloc & ioremap
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment=20=20
>=20delay is 10 jiffies.
> [    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
> [    0.000000] irq: Found primary Apple PIC /pci/mac-io for 64 irqs
> [    0.000000] irq: Found slave Apple PIC /pci/mac-io for 64 irqs cascade=
: 27
> [    0.000000] irq: System has 128 possible interrupts
> [    0.000000] GMT Delta read from XPRAM: -360 minutes, DST: on
> [    0.000000] random: get_random_u32 called from=20=20
>=20start_kernel+0x36c/0x4d8 with crng_init=3D0
> [    0.000000] time_init: decrementer frequency =3D 16.671650 MHz
> [    0.000000] time_init: processor frequency   =3D 264.000000 MHz
> [    0.000038] clocksource: timebase: mask: 0xffffffffffffffff=20=20
>=20max_cycles: 0x3d85178a6, max_idle_ns: 440795202430 ns
> [    0.000097] clocksource: timebase mult[3bfb68a3] shift[24] registered
> [    0.000201] clockevent: decrementer mult[44497e0] shift[32] cpu[0]
> [    0.001368] Console: colour dummy device 80x25
> [    0.001436] printk: console [tty0] enabled
> [    0.001487] printk: bootconsole [udbg0] disabled
> [    0.001882] pmac_zilog: serial modem detected
> [    1.345729] printk: console [ttyS0] enabled
> [    1.358329] pid_max: default: 32768 minimum: 301
> [    1.372599] Mount-cache hash table entries: 1024 (order: 0, 4096=20=20
>=20bytes, linear)
> [    1.394156] Mountpoint-cache hash table entries: 1024 (order: 0,=20=20
>=204096 bytes, linear)
> [    1.422118] rcu: Hierarchical SRCU implementation.
> [    1.437119] smp: Bringing up secondary CPUs ...
> [    1.450268] smp: Brought up 1 node, 1 CPU
> [    1.463448] devtmpfs: initialized
> [    1.473485] Duplicate name in PowerPC,750, renamed to "l2-cache#1"
> [    1.494492] Duplicate name in pci, renamed to "mac-io#1"
> [    1.511648] Duplicate name in pci, renamed to "pccard#1"
> [    1.530211] Found Grackle (MPC106) PCI host bridge at=20=20
>=200x0000000080000000. Firmware bus number: 0->0
> [    1.556990] PCI host bridge /pci (primary) ranges:
> [    1.571383]   IO 0x00000000fe000000..0x00000000fe7fffff ->=20=20
>=200x0000000000000000
> [    1.593309]  MEM 0x00000000fd000000..0x00000000fdffffff ->=20=20
>=200x0000000000000000
> [    1.614579]  MEM 0x0000000080000000..0x00000000fcffffff ->=20=20
>=200x0000000080000000
> [    1.637120] clocksource: jiffies: mask: 0xffffffff max_cycles:=20=20
>=200xffffffff, max_idle_ns: 19112604462750000 ns
> [    1.667441] futex hash table entries: 512 (order: 2, 16384 bytes, line=
ar)
> [    1.688431] NET: Registered protocol family 16
> [    1.707910] PMU i2c /pci/mac-io/via-pmu
> [    1.722983]  channel 1 bus <multibus>
> [    1.733605]  channel 2 bus <multibus>
> [    1.746841] PCI: Probing PCI hardware
> [    1.761155] PCI host bridge to bus 0000:00
> [    1.773432] pci_bus 0000:00: root bus resource [io  0x0000-0x7fffff]
> [    1.792247] pci_bus 0000:00: root bus resource [mem=20=20
>=200xfd000000-0xfdffffff] (bus address [0x00000000-0x00ffffff])
> [    1.822825] pci_bus 0000:00: root bus resource [mem 0x80000000-0xfcfff=
fff]
> [    1.843419] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    1.859881] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to f=
f
> [    1.879871] pci 0000:00:00.0: [1057:0002] type 00 class 0x060000
> [    1.899189] pci 0000:00:0d.0: [106b:0017] type 00 class 0xff0000
> [    1.916838] pci 0000:00:0d.0: reg 0x10: [mem 0xf4000000-0xf407ffff]
> [    1.936859] pci 0000:00:10.0: [106b:0017] type 00 class 0xff0000
> [    1.954533] pci 0000:00:10.0: reg 0x10: [mem 0xf3000000-0xf307ffff]
> [    1.974637] pci 0000:00:11.0: [1002:4c50] type 00 class 0x038000
> [    1.992312] pci 0000:00:11.0: reg 0x10: [mem 0x82000000-0x82ffffff]
> [    2.011110] pci 0000:00:11.0: reg 0x14: [io  0x0400-0x04ff]
> [    2.027818] pci 0000:00:11.0: reg 0x18: [mem 0x82fff000-0x82ffffff]
> [    2.046665] pci 0000:00:11.0: reg 0x30: [mem 0xfd000000-0xfd01ffff pre=
f]
> [    2.066830] pci 0000:00:11.0: supports D1 D2
> [    2.080778] pci 0000:00:13.0: [104c:ac15] type 02 class 0x060700
> [    2.098478] pci 0000:00:13.0: reg 0x10: [mem 0x81803000-0x81803fff]
> [    2.118276] pci 0000:00:13.1: [104c:ac15] type 02 class 0x060700
> [    2.135978] pci 0000:00:13.1: reg 0x10: [mem 0x81802000-0x81802fff]
> [    2.156532] pci_bus 0000:01: extended config space not accessible
> [    2.175227] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 0=
4
> [    2.195189] pci_bus 0000:05: extended config space not accessible
> [    2.213538] pci_bus 0000:05: busn_res: [bus 05-ff] end is updated to 0=
8
> [    2.233067] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 0=
8
> [    2.253708] PCI: Cannot allocate resource region 2 of device=20=20
>=200000:00:11.0, will remap
> [    2.277131] PCI 0000:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]
> [    2.296121] pci 0000:00:13.0: BAR 9: assigned [mem=20=20
>=200x84000000-0x87ffffff pref]
> [    2.317651] pci 0000:00:13.0: BAR 10: assigned [mem 0x88000000-0x8bfff=
fff]
> [    2.338269] pci 0000:00:13.1: BAR 9: assigned [mem=20=20
>=200x8c000000-0x8fffffff pref]
> [    2.359955] pci 0000:00:13.1: BAR 10: assigned [mem 0x90000000-0x93fff=
fff]
> [    2.380606] pci 0000:00:11.0: BAR 6: assigned [mem=20=20
>=200xfd000000-0xfd01ffff pref]
> [    2.402311] pci 0000:00:11.0: BAR 2: assigned [mem 0xfd020000-0xfd020f=
ff]
> [    2.422704] pci 0000:00:13.0: BAR 7: assigned [io  0x1000-0x10ff]
> [    2.441000] pci 0000:00:13.0: BAR 8: assigned [io  0x1100-0x11ff]
> [    2.459300] pci 0000:00:13.1: BAR 7: assigned [io  0x1200-0x12ff]
> [    2.477600] pci 0000:00:13.1: BAR 8: assigned [io  0x1300-0x13ff]
> [    2.495919] pci 0000:00:13.0: CardBus bridge to [bus 01-04]
> [    2.512627] pci 0000:00:13.0:   bridge window [io  0x1000-0x10ff]
> [    2.530925] pci 0000:00:13.0:   bridge window [io  0x1100-0x11ff]
> [    2.549229] pci 0000:00:13.0:   bridge window [mem=20=20
>=200x84000000-0x87ffffff pref]
> [    2.570928] pci 0000:00:13.0:   bridge window [mem 0x88000000-0x8bffff=
ff]
> [    2.591320] pci 0000:00:13.1: CardBus bridge to [bus 05-08]
> [    2.608046] pci 0000:00:13.1:   bridge window [io  0x1200-0x12ff]
> [    2.626349] pci 0000:00:13.1:   bridge window [io  0x1300-0x13ff]
> [    2.644651] pci 0000:00:13.1:   bridge window [mem=20=20
>=200x8c000000-0x8fffffff pref]
> [    2.666350] pci 0000:00:13.1:   bridge window [mem 0x90000000-0x93ffff=
ff]
> [    2.686748] pci_bus 0000:00: resource 4 [io  0x0000-0x7fffff]
> [    2.703993] pci_bus 0000:00: resource 5 [mem 0xfd000000-0xfdffffff]
> [    2.722816] pci_bus 0000:00: resource 6 [mem 0x80000000-0xfcffffff]
> [    2.741641] pci_bus 0000:01: resource 0 [io  0x1000-0x10ff]
> [    2.758373] pci_bus 0000:01: resource 1 [io  0x1100-0x11ff]
> [    2.775105] pci_bus 0000:01: resource 2 [mem 0x84000000-0x87ffffff pre=
f]
> [    2.795235] pci_bus 0000:01: resource 3 [mem 0x88000000-0x8bffffff]
> [    2.814059] pci_bus 0000:05: resource 0 [io  0x1200-0x12ff]
> [    2.830791] pci_bus 0000:05: resource 1 [io  0x1300-0x13ff]
> [    2.847523] pci_bus 0000:05: resource 2 [mem 0x8c000000-0x8fffffff pre=
f]
> [    2.867653] pci_bus 0000:05: resource 3 [mem 0x90000000-0x93ffffff]
> [    3.004865] vgaarb: loaded
> [    3.015684] SCSI subsystem initialized
> [    3.028576] libata version 3.00 loaded.
> [    3.041525] usbcore: registered new interface driver usbfs
> [    3.058590] usbcore: registered new interface driver hub
> [    3.074722] usbcore: registered new device driver usb
> [    3.097574] clocksource: Switched to clocksource timebase
> [    3.176945] NET: Registered protocol family 2
> [    3.196269] tcp_listen_portaddr_hash hash table entries: 512=20=20
>=20(order: 0, 6144 bytes, linear)
> [    3.221544] TCP established hash table entries: 4096 (order: 2,=20=20
>=2016384 bytes, linear)
> [    3.244755] TCP bind hash table entries: 4096 (order: 3, 32768=20=20
>=20bytes, linear)
> [    3.266467] TCP: Hash tables configured (established 4096 bind 4096)
> [    3.285534] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
> [    3.305032] UDP-Lite hash table entries: 256 (order: 1, 8192=20=20
>=20bytes, linear)
> [    3.326164] NET: Registered protocol family 1
> [    3.339985] RPC: Registered named UNIX socket transport module.
> [    3.357356] RPC: Registered udp transport module.
> [    3.371459] RPC: Registered tcp transport module.
> [    3.385564] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    3.405111] PCI: CLS 32 bytes, default 32
> [    3.418590] Thermal assist unit using workqueue, shrink_timer: 2000 ms
> [    3.444637] workingset: timestamp_bits=3D30 max_order=3D17 bucket_orde=
r=3D0
> [    3.465435] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    3.484342] Block layer SCSI generic (bsg) driver version 0.4=20=20
>=20loaded (major 253)
> [    3.506233] io scheduler mq-deadline registered
> [    3.521141] pci 0000:00:11.0: enabling device (0086 -> 0087)
> [    3.537885] Using unsupported 1024x768 (null) at 82801000,=20=20
>=20depth=3D32, pitch=3D4096
> [    3.682913] Console: switching to colour frame buffer device 128x48
> [    3.823127] fb0: Open Firmware frame buffer device on /pci/ATY,RageLTP=
ro
> [    3.845192] pmac_zilog: 0.6 (Benjamin Herrenschmidt=20=20
>=20<benh@kernel.crashing.org>)
> [    3.869499] Non-volatile memory driver v1.3
> [    3.893598] brd: module loaded
> [    3.931206] loop: module loaded
> [    3.942363] MacIO PCI driver attached to Gatwick chipset
> [    3.959805] MacIO PCI driver attached to Heathrow chipset
> [    3.986647] swim3 0.00015000:floppy: [fd0] SWIM3 floppy=20=20
>=20controller in media bay
> [    4.015851] 0.00013020:ch-a: ttyS0 at MMIO 0xf3013020 (irq =3D 16,=20=
=20
>=20base_baud =3D 230400) is a Z85c30 ESCC - Serial port
> [    4.052300] 0.00013000:ch-b: ttyS1 at MMIO 0xf3013000 (irq =3D 17,=20=
=20
>=20base_baud =3D 230400) is a Z85c30 ESCC - Infrared port
> [    4.090256] macio: fixed media-bay irq on gatwick
> [    4.107695] macio: fixed left floppy irqs
> [    4.121515] swim3 1.00015000:floppy: [fd1] Couldn't request interrupt
> [    4.142797] swim3: probe of 1.00015000:floppy failed with error -16
> [    4.163133] macio: fixed left ide irqs
> [    4.175485] macio: fixed SCC irqs on gatwick
> [    4.189655] 1.00013020:ch-a: ttyS2 at MMIO 0xf4013020 (irq =3D 79,=20=
=20
>=20base_baud =3D 230400) is a Z85c30 ESCC - Internal modem
> [    4.226442] mediabay0: Registered Heathrow media-bay
> [    4.455126] mediabay1: Registered Heathrow media-bay
> [    4.686271] PMU Backlight initialized (pmubl)
> [    4.703522] mesh: configured for synchronous 5 MB/s
> [    4.719262] mediabay1: Bay contains a floppy drive
> [    4.954580] mesh: performing initial bus reset...
> [    6.861383] random: fast init done
> [    6.976730] adb device [2]: 2 0xC3
> [    7.044008] adb device [3]: 3 0x1
> [    7.107927] adb device [7]: 7 0x1F
> [    7.181591] ADB keyboard at 2 has handler 0xC3
> [    7.244084] Detected ADB keyboard, type ANSI.
> [    7.306604] input: ADB keyboard as /devices/virtual/input/input0
> [    7.374680] input: ADB Powerbook buttons as /devices/virtual/input/inp=
ut1
> [    7.509364] ADB mouse (trackpad) at 3 has handler 0x4
> [    7.573745] input: ADB mouse as /devices/virtual/input/input2
> [    9.034624] scsi host0: MESH
> [   12.394536] pata-macio 0.00020000:ata0: Activating pata-macio=20=20
>=20chipset Heathrow ATA, Apple bus ID 0
> [   12.477627] scsi host1: pata_macio
> [   12.540331] ata1: PATA max MWDMA2 irq 30
> [   12.795027] ata1.00: ATA-7: SAMSUNG HM100JC, YN100-08, max UDMA/100
> [   12.865009] ata1.00: 195371568 sectors, multi 8: LBA48
> [   12.935050] scsi 1:0:0:0: Direct-Access     ATA      SAMSUNG=20=20
>=20HM100JC  0-08 PQ: 0 ANSI: 5
> [   13.013610] sd 1:0:0:0: [sda] 195371568 512-byte logical blocks:=20=20
>=20(100 GB/93.2 GiB)
> [   13.088556] sd 1:0:0:0: Attached scsi generic sg0 type 0
> [   13.158582] sd 1:0:0:0: [sda] Write Protect is off
> [   13.223470] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [   13.289075] sd 1:0:0:0: [sda] Write cache: disabled, read cache:=20=20
>=20enabled, doesn't support DPO or FUA
> [   13.674503] pata-macio 0.00021000:ata1: Activating pata-macio=20=20
>=20chipset Heathrow ATA, Apple bus ID 1
> [   13.757042] scsi host2: pata_macio
> [   13.819249] ata2: PATA max MWDMA2 irq 36
> [   13.904489] pata-macio 1.00021000:ata4: Activating pata-macio=20=20
>=20chipset Heathrow ATA, Apple bus ID 4
> [   13.983164] genirq: Flags mismatch irq 36. 00000000=20=20
>=20(pata-macio[1.00021000:ata4]) vs. 00000000=20=20
>=20(pata-macio[0.00021000:ata1])
> [   14.070207] pata-macio: probe of 1.00021000:ata4 failed with error -16
> [   14.479032] eth0: BMAC at 00:05:02:07:5a:a6
> [   14.479077]
> [   14.615187] aoe: AoE v85 initialised.
> [   14.679798] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [   14.753685] ehci-pci: EHCI PCI platform driver
> [   14.820303] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [   14.893038] ohci-pci: OHCI PCI platform driver
> [   14.959871] usbcore: registered new interface driver uas
> [   15.029671] usbcore: registered new interface driver usb-storage
> [   15.104150] mousedev: PS/2 mouse device common for all mice
> [   15.178852] rtc-generic rtc-generic: registered as rtc0
> [   15.248707] i2c /dev entries driver
> [   15.313358] PowerMac i2c bus pmu 2 registered
> [   15.379651] PowerMac i2c bus pmu 1 registered
> [   15.450539] usbcore: registered new interface driver usbhid
> [   15.517786] usbhid: USB HID core driver
> [   15.581161]  sda: [mac] sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8=20=20
>=20sda9 sda10 sda11 sda12 sda13 sda14 sda15
> [   15.682021] sd 1:0:0:0: [sda] Attached SCSI disk
> [   15.748688] NET: Registered protocol family 17
> [   15.815278] drmem: No dynamic reconfiguration memory found
> [   15.905030] EXT4-fs (sda12): mounting ext3 file system using the=20=20
>=20ext4 subsystem
> [   16.093352] EXT4-fs (sda12): mounted filesystem with ordered data=20=
=20
>=20mode. Opts: (null). Quota mode: disabled.
> [   16.177770] VFS: Mounted root (ext3 filesystem) readonly on device 8:1=
2.
> [   16.267681] Freeing unused kernel memory: 1232K
> [   16.337890] Kernel memory protection not selected by kernel config.
> [   16.413504] Run /sbin/init as init process
> [   16.481986]   with arguments:
> [   16.546360]     /sbin/init
> [   16.609020]     earlyprintk
> [   16.671224]   with environment:
> [   16.733922]     HOME=3D/
> [   16.792877]     TERM=3Dlinux
> [   17.149488] BUG: Unable to handle kernel data access on read at 0x5071=
b5f4
> [   17.222336] Faulting instruction address: 0xc0004194
> [   17.289513] Oops: Kernel access of bad area, sig: 11 [#1]
> [   17.357646] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
> [   17.426007] Modules linked in:
> [   17.485807] CPU: 0 PID: 1 Comm: init Not tainted=20=20
>=205.12.0-rc3-pmac-00067-g4c0104a83fc #22
> [   17.561902] NIP:  c0004194 LR: c0004194 CTR: 00000000
> [   17.629263] REGS: e1025e70 TRAP: 0300   Not tainted=20=20=20
>=20(5.12.0-rc3-pmac-00067-g4c0104a83fc)
> [   17.707694] MSR:  00001032 <ME,IR,DR,RI>  CR: 40025f30  XER: 00000000
> [   17.780835] DAR: 5071b5f4 DSISR: 40000000
> [   17.780835] GPR00: 00000000 e1025f30 c14432e0 e1025f40 00000000=20=20
>=2000000000 00000000 00000000
> [   17.780835] GPR08: 00000000 0000d032 00000300 5071b53c c0000000=20=20
>=2000000000 00000000 00000000
> [   17.780835] GPR16: 00000000 00000000 00000000 00000000 00000000=20=20
>=2000000000 00000000 00000000
> [   17.780835] GPR24: 00000000 00000000 00000000 00000000 00000000=20=20
>=2000000000 00000000 00000000
> [   18.155821] NIP [c0004194] DataAccess_virt+0x8c/0xac
> [   18.218757] LR [c0004194] DataAccess_virt+0x8c/0xac
> [   18.281072] Call Trace:
> [   18.335751] [e1025f30] [c0004240]=20=20
>=20InstructionAccess_virt+0x8c/0x90 (unreliable)
> [   18.407057] --- interrupt: 300 at 0xb780d500
> [   18.468711] NIP:  b780d500 LR: b7828554 CTR: 00000000
> [   18.532657] REGS: e1025f40 TRAP: 0300   Not tainted=20=20=20
>=20(5.12.0-rc3-pmac-00067-g4c0104a83fc)
> [   18.607221] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 00000000=20=20=20
>=20XER: 00000000
> [   18.678419] DAR: bfcbfd50 DSISR: 42000000
> [   18.678419] GPR00: 00000000 bfcc0010 00000000 bfcc0020 00000000=20=20
>=2000000000 00000000 00000000
> [   18.678419] GPR08: 00000000 00000000 00000000 00000000 00000000=20=20
>=2000000000 00000000 00000000
> [   18.678419] GPR16: 00000000 00000000 00000000 00000000 00000000=20=20
>=2000000000 00000000 00000000
> [   18.678419] GPR24: 00000000 00000000 00000000 00000000 00000000=20=20
>=2000000000 00000000 00000000
> [   19.044798] NIP [b780d500] 0xb780d500
> [   19.104645] LR [b7828554] 0xb7828554
> [   19.164652] --- interrupt: 300
> [   19.222524] Instruction dump:
> [   19.279658] 3d407265 394a6773 914b0008 39400300 914b00b0 906b001c=20=
=20
>=20908b0020 90ab0024
> [   19.352049] 90cb0028 90eb002c 910b0030 4800fe71 <80ab00b8>=20=20
>=2074a00040 4082000c 48014f65
> [   19.424682] ---[ end trace 88a2dc920b595dd1 ]---
> [   19.487214]
> [   20.499171] Kernel panic - not syncing: Attempted to kill init!=20=20
>=20exitcode=3D0x0000000b
> [   20.571365] Rebooting in 180 seconds..
>
>
> When testing a recent mainline build, 5.14.0-rc2-pmac-00323-gd8079fac1681=
,
> PID 1 did not crash. Other processes crash instead and the kernel produce=
s
> messages like these:
>
> [   91.150956] xfce4-session[1792]: segfault (11) at 404cd4fc nip=20=20
>=20a6aed794 lr a6aed930 code 1 in libc-2.31.so[a6aa9000+1ce000]
> [   91.151194] xfce4-session[1792]: code: 2c170000 41820050 83f70004=20=
=20
>=203bb70008 57ff2036 3bfffff8 7ff7fa14 7c1df840
> [   91.151233] xfce4-session[1792]: code: 41810028 60000000 60000000=20=
=20
>=2041920150 <813f000c> 7c09d800 41820144 3bfffff0
> [  115.700631] xfwm4[1978]: segfault (11) at 766d3243 nip a6c4af84=20=20
>=20lr a6e07724 code 1 in libc-2.31.so[a6c0b000+1ce000]
> [  115.700948] xfwm4[1978]: code: 60420000 8121000c 5069063e=20=20
>=209121000c 60420000 c8010008 fdfe058e 38210010
> [  115.700995] xfwm4[1978]: code: 4e800020 7c250b78 80c28ff4=20=20
>=207cc52a78 <90a30000> 7c0802a6 91c3000c d9c30058
>
>
> We found that reducing memory with the kernel parameter 'mem=3D464M' woul=
d
> prevent the crash.
>
> Below are Stan's notes from the 'git bisect' run. They include an
> additional failure mode that might be of interest. We've also observed
> "Kernel attempted to write user page (c6207c) - exploit attempt?" and
> "kernel BUG at arch/powerpc/kernel/interrupt.c:49!".
>
>
> On Thu, 29 Jul 2021, Stanley J. Johnson wrote:
>
>> Here are the git bisect results (I saved the kernels and dmesg outputs
>> in case they're needed later, though it's easy enough to re-create the
>> results).
>>
>> We'll have up to two boots (only one if the first boot fails) for each
>> kernel on WS-1 with the default memory setting of 512M.
>>
>> 1) 5.12.0-pmac-08447-g85f3f17b5db (good)
>> -> works: no dmesg errs, X works
>> -> works: no dmesg errs, X works
>>
>> 2) 5.12.0-pmac-12750-g23243c1ace9 (bad)
>> (Crash and burn. I was tempted to mark this one "skip", since the errors
>> are different, though we've seen them in earlier tests. So there could
>> be multiple regressions. But let's keep chasing this one. I can re-run
>> the bisect later and skip some failures if necessary.)
>> -> fails: "Unable to contact settings server" after wdm login; dmesg err=
ors:
>> ...
>> [  127.169294] BUG: Unable to handle kernel instruction fetch (NULL=20=
=20
>>=20pointer?)
>> [  127.169397] Faulting instruction address: 0x00000000
>> [  127.169635] Oops: Kernel access of bad area, sig: 11 [#2]
>> [  127.169661] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  127.169696] Modules linked in:
>> [  127.169736] CPU: 0 PID: 1877 Comm: gdbus Tainted: G      D=20=20
>>=205.12.0-pmac-12750-g23243c1ace9 #9
>> [  127.169776] NIP:  00000000 LR: 00000000 CTR: 00000000
>> ...
>>
>> 3) 5.12.0-rc7-pmac-02335-gaeacb52a8de (good)
>> -> works: no dmesg errs, X works
>> -> works: no dmesg errs, X works
>>
>> 4) 5.12.0-pmac-11585-g95275402f66 (bad)
>> -> fails: dmesg errs, wdm login fails with "Unable to contact settings
>> server..."
>> ...
>> [   58.290883] BUG: Unable to handle kernel instruction fetch
>> [   58.291009] Faulting instruction address: 0x7cc903a4
>> [   58.291240] Oops: Kernel access of bad area, sig: 11 [#1]
>> [   58.291268] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [   58.291305] Modules linked in:
>> [   58.291349] CPU: 0 PID: 1750 Comm: Xorg Not tainted=20=20
>>=205.12.0-pmac-11585-g95275402f66 #11
>> [   58.291391] NIP:  7cc903a4 LR: 7cc903a6 CTR: c0127eb8
>> [   58.291417] REGS: e2da1e70 TRAP: 0400   Not tainted=20=20
>>=20(5.12.0-pmac-11585-g95275402f66)
>> [   58.291450] MSR:  40001030 <ME,IR,DR>  CR: 28008228  XER: 20000000
>> ...
>>
>> 5) 5.12.0-pmac-11068-g9d31d233895 (good)
>> -> works: no dmesg errs, X works
>> -> works: no dmesg errs, X works
>>
>> 6) 5.12.0-rc3-pmac-00258-ga9d2f9bb225 (bad)
>> -> fails: wdm dies at login, screen hangs, dmesg errs that I haven't
>> seen before:
>> ...
>> [   59.988732] InputThread[1751]: bad frame in sys_rt_sigreturn:=20=20
>>=2051a79ab6 nip 001023c8 lr 001023c0
>> [   62.079043] InputThread[1760]: bad frame in sys_rt_sigreturn:=20=20
>>=20a98be235 nip 001023c8 lr 001023c0
>> [   64.348063] InputThread[1776]: bad frame in sys_rt_sigreturn:=20=20
>>=20a46b945e nip 001023c8 lr 001023c0
>> [   66.413980] InputThread[1785]: bad frame in sys_rt_sigreturn:=20=20
>>=20a98be235 nip 001023c8 lr 001023c0
>> [   68.486768] InputThread[1794]: bad frame in sys_rt_sigreturn:=20=20
>>=20677e693b nip 001023c8 lr 001023c0
>>
>> 7) 5.12.0-rc3-pmac-00129-g036fc2cb1dc (bad)
>> -> fails: dmesg errs, wdm hangs (wdm did not crash, screen seems hung)
>> ...
>> [  101.136941] BUG: Unable to handle kernel instruction fetch
>> [  101.137059] Faulting instruction address: 0xfea31f74
>> [  101.137296] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  101.137323] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  101.137358] Modules linked in:
>> [  101.137401] CPU: 0 PID: 1882 Comm: xfce4-session Not tainted=20=20
>>=205.12.0-rc3-pmac-00129-g036fc2cb1dc #14
>> [  101.137443] NIP:  fea31f74 LR: fea31f74 CTR: c00cfef4
>> [  101.137470] REGS: e2e21e70 TRAP: 0400   Not tainted=20=20
>>=20(5.12.0-rc3-pmac-00129-g036fc2cb1dc)
>> [  101.137502] MSR:  40001030 <ME,IR,DR>  CR: 220084e8  XER: 00000000
>> ...
>>
>> 8) 5.12.0-rc3-pmac-00064-g719e7e212c7 (good)
>> -> works: no dmesg errs, X works
>> -> works: no dmesg errs, X works
>>
>> 9) 5.12.0-rc3-pmac-00096-ga2308836880 (bad)
>> -> fails: dmesg errs, wdm hangs while validating login
>> ...
>> [  104.559951] BUG: Unable to handle kernel instruction fetch
>> [  104.560086] Faulting instruction address: 0xfe988ba4
>> [  104.560307] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  104.560337] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  104.560371] Modules linked in:
>> [  104.560415] CPU: 0 PID: 1834 Comm: xfce4-session Not tainted=20=20
>>=205.12.0-rc3-pmac-00096-ga2308836880 #16
>> [  104.560457] NIP:  fe988ba4 LR: fe988ba4 CTR: c00cfee8
>> [  104.560484] REGS: e2d9de70 TRAP: 0400   Not tainted=20=20
>>=20(5.12.0-rc3-pmac-00096-ga2308836880)
>> [  104.560517] MSR:  40001030 <ME,IR,DR>  CR: 220484e8  XER: 00000000
>> ...
>> [  114.371853] BUG: Unable to handle kernel instruction fetch
>> [  114.371998] Faulting instruction address: 0x3e62a270
>> [  114.372270] Oops: Kernel access of bad area, sig: 11 [#2]
>> [  114.372298] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  114.372334] Modules linked in:
>> [  114.372382] CPU: 0 PID: 1858 Comm: xfwm4 Tainted: G      D=20=20
>>=205.12.0-rc3-pmac-00096-ga2308836880 #16
>> [  114.372425] NIP:  3e62a270 LR: 3e62a271 CTR: c065eebc
>> [  114.372452] REGS: e2dede70 TRAP: 0400   Tainted: G      D=20=20
>>=20(5.12.0-rc3-pmac-00096-ga2308836880)
>> [  114.372486] MSR:  40001030 <ME,IR,DR>  CR: 22002284  XER: 00000000
>> ...
>>
>> 10) 5.12.0-rc3-pmac-00080-g7a7d744ffe8 (bad)
>> -> fails: dmesg errs, "Unable to contact settings server..."
>> ...
>> [  170.622408] BUG: Unable to handle kernel instruction fetch
>> [  170.622546] Faulting instruction address: 0xfe9255d4
>> [  170.622777] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  170.622806] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  170.622841] Modules linked in:
>> [  170.622885] CPU: 0 PID: 1863 Comm: xfce4-session Not tainted=20=20
>>=205.12.0-rc3-pmac-00080-g7a7d744ffe8 #17
>> [  170.622927] NIP:  fe9255d4 LR: fe9255d4 CTR: c00cfee8
>> [  170.622954] REGS: e2da1e70 TRAP: 0400   Not tainted=20=20
>>=20(5.12.0-rc3-pmac-00080-g7a7d744ffe8)
>> [  170.622987] MSR:  40001030 <ME,IR,DR>  CR: 220484e8  XER: 00000000
>> ...
>> [  172.611235] BUG: Unable to handle kernel instruction fetch (NULL=20=
=20
>>=20pointer?)
>> [  172.611364] Faulting instruction address: 0x00000000
>> [  172.611662] Oops: Kernel access of bad area, sig: 11 [#2]
>> [  172.611690] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  172.611725] Modules linked in:
>> [  172.611773] CPU: 0 PID: 1871 Comm: gmain Tainted: G      D=20=20
>>=205.12.0-rc3-pmac-00080-g7a7d744ffe8 #17
>> [  172.611814] NIP:  00000000 LR: 00000000 CTR: 00000000
>> [  172.611840] REGS: e2db9e70 TRAP: 0400   Tainted: G      D=20=20
>>=20(5.12.0-rc3-pmac-00080-g7a7d744ffe8)
>> [  172.611874] MSR:  40001030 <ME,IR,DR>  CR: 28008468  XER: 00000000
>> ...
>>
>> 11) 5.12.0-rc3-pmac-00072-ga2b3e09ae41 (bad)
>> -> fails: kernel panic, I'd have to capture the output via a serial cons=
ole
>>
>> 12) 5.12.0-rc3-pmac-00068-gacc142b6230 (bad)
>> -> fails: kernel panic
>>
>> 13) 5.12.0-rc3-pmac-00066-g8f6ff5bd9b7 (good)
>> -> works: no dmesg errs, X works
>> -> works: no dmesg errs, X works
>>
>> 14) 5.12.0-rc3-pmac-00067-g4c0104a83fc (bad)
>> -> fails: kernel panic
>>
>> The git bisect thinks this is the bad commit, but I'm not sure it means
>> anything at all:
>>
>> -----
>>
>> 4c0104a83fc3990a76a01a2f4e504251fa9814c4 is the first bad commit


