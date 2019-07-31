Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CE37BDC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 11:52:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45z7yJ5SSyzDqPb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 19:52:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45z7PS2LhCzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 19:27:39 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 73B10285B8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 09:27:37 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 68184288DD; Wed, 31 Jul 2019 09:27:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204375] kernel 5.2.4 w. KASAN enabled fails to boot on a
 PowerMac G4 3,6 at very early stage
Date: Wed, 31 Jul 2019 09:27:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@c-s.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204375-206035-DSshhu1e2g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204375-206035@https.bugzilla.kernel.org/>
References: <bug-204375-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D204375

--- Comment #6 from Christophe Leroy (christophe.leroy@c-s.fr) ---
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> OpenBIOS 1.1 [Oct 19 2017 07:00]
>> Configuration device id QEMU version 1 machine id 1
>> CPUs: 1
>> Memory: 2048M
>> UUID: 00000000-0000-0000-0000-000000000000
>> CPU type PowerPC,G4
milliseconds isn't unique.
Welcome to OpenBIOS v1.1 built on Oct 19 2017 07:00
>> [ppc] Kernel already loaded (0x01000000 + 0x01a1a7c0) (initrd 0x00000000=
 +
>> 0x00000000)
>> [ppc] Kernel command line: console=3DttyS0
OF stdout device is: /pci@f2000000/mac-io@c/escc@13000/ch-a@13020
Preparing to boot Linux version 5.3.0-rc2+ (root@pc17473vm.idsi0.si.c-s.fr)
(gcc version 5.4.0 (GCC)) #1881 SMP Wed Jul 31 05:36:00 UTC 2019
Detected machine type: 00000400
command line:=20
memory layout at init:
  memory_limit : 00000000 (16 MB aligned)
  alloc_bottom : 02a1f000
  alloc_top    : 30000000
  alloc_top_hi : 80000000
  rmo_top      : 30000000
  ram_top      : 80000000
found display   : /pci@f2000000/QEMU,VGA@e, opening... done
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x02a20000 -> 0x02a1f0a4
Device tree struct  0x02a21000 -> 0x7fde7ec0
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x01000000 ...
Hello World !
Total memory =3D 2048MB; using 4096kB for hash table
Activating Kernel Userspace Execution Prevention
Activating Kernel Userspace Access Protection
Linux version 5.3.0-rc2+ (root@pc17473vm.idsi0.si.c-s.fr) (gcc version 5.4.0
(GCC)) #1881 SMP Wed Jul 31 05:36:00 UTC 2019
KASAN init done
Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 0x762=
fb70
Mapped at 0xf77c0000
Found a Keylargo mac-io controller, rev: 0, mapped at 0x(ptrval)
PowerMac motherboard: PowerMac G4 AGP Graphics
boot stdout isn't a display !
Using PowerMac machine description
printk: bootconsole [udbg0] enabled
CPU maps initialized for 1 thread per core
-----------------------------------------------------
phys_mem_size     =3D 0x80000000
dcache_bsize      =3D 0x20
icache_bsize      =3D 0x20
cpu_features      =3D 0x000000000501a00a
  possible        =3D 0x000000002f7ff14b
  always          =3D 0x0000000001000000
cpu_user_features =3D 0x9c000001 0x00000000
mmu_features      =3D 0x00000001
Hash_size         =3D 0x400000
Hash_mask         =3D 0xffff
-----------------------------------------------------
Found UniNorth PCI host bridge at 0x00000000f2000000. Firmware bus number: =
0->0
PCI host bridge /pci@f2000000 (primary) ranges:
  IO 0x00000000f2000000..0x00000000f27fffff -> 0x0000000000000000
 MEM 0x0000000080000000..0x000000008fffffff -> 0x0000000080000000=20
WARNING ! Your machine is CUDA-based but your kernel
          wasn't compiled with CONFIG_ADB_CUDA option !
nvram: Checking bank 0...
Invalid signature
Invalid checksum
nvram: gen0=3D0, gen1=3D0
nvram: Active bank is: 0
nvram: OF partition at 0xffffffff
nvram: XP partition at 0xffffffff
nvram: NR partition at 0xffffffff
Zone ranges:
  DMA      [mem 0x0000000000000000-0x000000002fffffff]
  Normal   empty
  HighMem  [mem 0x0000000030000000-0x000000007fffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x000000007fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
percpu: Embedded 29 pages/cpu s88872 r8192 d21720 u118784
Built 1 zonelists, mobility grouping on.  Total pages: 522560
Kernel command line: console=3DttyS0
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 1948456K/2097152K available (8936K kernel code, 1764K rwdata, 3892K
rodata, 1128K init, 11001K bss, 148696K reserved, 0K cma-reserved, 1310720K
highmem)
Kernel virtual memory layout:
  * 0xf8000000..0x00000000  : kasan shadow mem
  * 0xf7fbf000..0xf7fff000  : fixmap
  * 0xf7800000..0xf7c00000  : highmem PTEs
  * 0xf6f38000..0xf7800000  : early ioremap
  * 0xf1000000..0xf6f38000  : vmalloc & ioremap
random: get_random_u32 called from __kmem_cache_create+0x2c/0x46c with
crng_init=3D0
SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
Running RCU self tests
rcu: Hierarchical RCU implementation.
rcu:    RCU lockdep checking is enabled.
rcu:    RCU restricting CPUs from NR_CPUS=3D2 to nr_cpu_ids=3D1.
rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D1
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
mpic: Setting up MPIC " MPIC 1   " version 1.2 at 80040000, max 1 CPUs
mpic: ISU size: 64, shift: 6, mask: 3f
mpic: Initializing for 64 sources
GMT Delta read from XPRAM: 0 minutes, DST: on
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x171024e7e0,
max_idle_ns: 440795205315 ns
clocksource: timebase mult[a000000] shift[24] registered
Console: colour dummy device 80x25
Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
... MAX_LOCKDEP_SUBCLASSES:  8
... MAX_LOCK_DEPTH:          48
... MAX_LOCKDEP_KEYS:        8192
... CLASSHASH_SIZE:          4096
... MAX_LOCKDEP_ENTRIES:     32768
... MAX_LOCKDEP_CHAINS:      65536
... CHAINHASH_SIZE:          32768
 memory used by lock dependency info: 4413 kB
 per task-struct memory footprint: 1536 bytes
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
*** VALIDATE proc ***
*** VALIDATE cgroup1 ***
*** VALIDATE cgroup2 ***
smp_core99_probe
PowerMac SMP probe found 1 cpus
rcu: Hierarchical SRCU implementation.
smp: Bringing up secondary CPUs ...
smp: Brought up 1 node, 1 CPU
Using standard scheduler topology
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:
6370867519511994 ns
futex hash table entries: 256 (order: 2, 16384 bytes, linear)
xor: measuring software checksum speed
   8regs     :    45.600 MB/sec
   8regs_prefetch:    55.200 MB/sec
   32regs    :    67.200 MB/sec
   32regs_prefetch:    69.600 MB/sec
   altivec   :   146.400 MB/sec
xor: using function: altivec (146.400 MB/sec)
prandom: seed boundary self test passed
prandom: 100 self tests passed
NET: Registered protocol family 16

PCI: Probing PCI hardware
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0x7fffff]
pci_bus 0000:00: root bus resource [mem 0x80000000-0x8fffffff]
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
pci 0000:00:0b.0: [106b:0020] type 00 class 0x060000
pci 0000:00:0c.0: [106b:0022] type 00 class 0xff0000
pci 0000:00:0c.0: reg 0x10: [mem 0x80000000-0x8007ffff]
pci 0000:00:0d.0: [106b:003f] type 00 class 0x0c0310
pci 0000:00:0d.0: reg 0x10: [mem 0x80080000-0x800800ff]
pci 0000:00:0e.0: [1234:1111] type 00 class 0x030000
pci 0000:00:0e.0: reg 0x10: [mem 0x81000000-0x81ffffff pref]
pci 0000:00:0e.0: reg 0x18: [mem 0x82000000-0x82000fff]
pci 0000:00:0e.0: reg 0x30: [mem 0x82010000-0x8201ffff pref]
pci 0000:00:0f.0: [10ec:8029] type 00 class 0x020000
pci 0000:00:0f.0: reg 0x10: [io  0x1000-0x10ff]
pci 0000:00:0f.0: reg 0x30: [mem 0x82040000-0x8207ffff pref]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
pci_bus 0000:00: resource 4 [io  0x0000-0x7fffff]
pci_bus 0000:00: resource 5 [mem 0x80000000-0x8fffffff]
alg: extra crypto tests enabled.  This is intended for developer use only.
raid6: altivecx8 gen()   148 MB/s
raid6: altivecx4 gen()   159 MB/s
raid6: altivecx2 gen()   150 MB/s
raid6: altivecx1 gen()   124 MB/s
raid6: int32x8  gen()    41 MB/s
raid6: int32x8  xor()    20 MB/s
raid6: int32x4  gen()    42 MB/s
raid6: int32x4  xor()    32 MB/s
raid6: int32x2  gen()    48 MB/s
raid6: int32x2  xor()    39 MB/s
raid6: int32x1  gen()    39 MB/s
raid6: int32x1  xor()    35 MB/s
raid6: using algorithm altivecx4 gen() 159 MB/s
raid6: using intx1 recovery algorithm
pci 0000:00:0e.0: vgaarb: setting as boot VGA device
pci 0000:00:0e.0: vgaarb: VGA device added:
decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
pci 0000:00:0e.0: vgaarb: bridge control possible
vgaarb: loaded
SCSI subsystem initialized
clocksource: Switched to clocksource timebase
NET: Registered protocol family 2
tcp_listen_portaddr_hash hash table entries: 512 (order: 2, 20480 bytes,
linear)
TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
TCP bind hash table entries: 8192 (order: 6, 294912 bytes, linear)
TCP: Hash tables configured (established 8192 bind 8192)
UDP hash table entries: 512 (order: 3, 40960 bytes, linear)
UDP-Lite hash table entries: 512 (order: 3, 40960 bytes, linear)
NET: Registered protocol family 1
PCI: CLS 0 bytes, default 32
Thermal assist unit=20
using timers,=20
shrink_timer: 600 jiffies
Initialise system trusted keyrings
workingset: timestamp_bits=3D14 max_order=3D19 bucket_order=3D5
WARNING: CPU: 0 PID: 1 at kernel/smp.c:433 smp_call_function_many+0xb0/0x3a4
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.3.0-rc2+ #1881
NIP:  c00fb9cc LR: c00fb9b8 CTR: 00000000
REGS: ee8d9618 TRAP: 0700   Not tainted  (5.3.0-rc2+)
MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 44004204  XER: 00000000

GPR00: c00fb968 ee8d96d0 ee8d69e0 ee8d69e0 00000003 00000000 c00fb9b8 fdd1a=
d3c=20
GPR08: 00000100 00000100 001f0100 ee8d69e0 24004204 00000000 c0da0c60 ee8d9=
814=20
GPR16: ee8d9810 c0017f24 00000122 eedd8ea0 c0f50000 00000000 eedd8efc 00000=
000=20
GPR24: 00000000 c0017f7c 00000000 c0f485f8 c0f65720 00000000 ee8d69e0 c0f48=
5f8=20
NIP [c00fb9cc] smp_call_function_many+0xb0/0x3a4
LR [c00fb9b8] smp_call_function_many+0x9c/0x3a4
Call Trace:
[ee8d96d0] [c00fb968] smp_call_function_many+0x4c/0x3a4 (unreliable)
[ee8d9720] [c00fbce8] smp_call_function+0x28/0x38
[ee8d9730] [c00fbd14] on_each_cpu+0x1c/0x5c
[ee8d9750] [c00daf0c] call_timer_fn+0x194/0x354
[ee8d97e0] [c00dbe60] __run_timers.part.32+0x2ac/0x2ec
[ee8d98c0] [c00dc094] run_timer_softirq+0x78/0xe0
[ee8d98f0] [c08b96f0] __do_softirq+0x290/0x58c
[ee8d9960] [c004c778] irq_exit+0x124/0x19c
[ee8d9980] [c00119e8] timer_interrupt+0x3f0/0x4a0
[ee8d99d0] [c0019600] ret_from_except+0x0/0x14
--- interrupt: 901 at __slab_alloc.constprop.57+0x60/0x6c
    LR =3D __slab_alloc.constprop.57+0x5c/0x6c
[ee8d9ab8] [c0229d3c] kmem_cache_alloc+0x80/0x268
[ee8d9af8] [c02eb5ec] __kernfs_new_node.isra.7+0xb8/0x278
[ee8d9be8] [c02ed478] kernfs_new_node+0x4c/0x74
[ee8d9c18] [c02eda64] kernfs_create_dir_ns+0x40/0xa8
[ee8d9c38] [c02f1424] sysfs_create_dir_ns+0x120/0x184
[ee8d9d08] [c089ca74] kobject_add_internal+0x154/0x350
[ee8d9d38] [c089d00c] kobject_init_and_add+0xe8/0x100
[ee8d9dc8] [c022b060] sysfs_slab_add+0x118/0x2a4
[ee8d9df8] [c0caeb98] slab_sysfs_init+0xb0/0x12c
[ee8d9e18] [c0005860] do_one_initcall+0x134/0x33c
[ee8d9ec8] [c0c8c418] kernel_init_freeable+0x2b4/0x35c
[ee8d9f18] [c0005d38] kernel_init+0x18/0xf8
[ee8d9f38] [c0019348] ret_from_kernel_thread+0x14/0x1c
Instruction dump:
481326c1 893e8544 2f890000 419e0300 7c5e1378 7c431378 48132879 813e0000=20
3d40001f 614a0100 7d285039 41a20008 <0fe00000> 7fe5fb78 7f64db78 3860ffff=20
irq event stamp: 142739
hardirqs last  enabled at (142738): [<c08b8df4>]
_raw_spin_unlock_irqrestore+0x48/0x60
hardirqs last disabled at (142739): [<c0019128>] reenable_mmu+0x1c/0xa8
softirqs last  enabled at (142708): [<c08b9914>] __do_softirq+0x4b4/0x58c
softirqs last disabled at (142733): [<c004c778>] irq_exit+0x124/0x19c
---[ end trace 0aade92aa60bd952 ]---
NET: Registered protocol family 38
Key type asymmetric registered
Asymmetric key parser 'x509' registered
Asymmetric key parser 'pkcs8' registered
bounce: pool size: 64 pages
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler kyber registered
io scheduler bfq registered
Using unsupported 800x600 (null) at 81000000, depth=3D32, pitch=3D3200
Console: switching to colour frame buffer device 100x37
fb0: Open Firmware frame buffer device on /pci@f2000000/QEMU,VGA@e
Non-volatile memory driver v1.3
MacIO PCI driver attached to Keylargo chipset
Warning: no ADB interface detected
pata-macio 0.00020000:ata-3: Activating pata-macio chipset KeyLargo ATA-3,
Apple bus ID 0
scsi host0: pata_macio
ata1: PATA max MWDMA2 irq 16
pata-macio 0.00021000:ata-3: Activating pata-macio chipset KeyLargo ATA-3,
Apple bus ID 1
scsi host1: pata_macio
ata2: PATA max MWDMA2 irq 18
rtc-generic rtc-generic: registered as rtc0
i2c /dev entries driver
ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5
NET: Registered protocol family 10
Segment Routing with IPv6
NET: Registered protocol family 17
drmem: No dynamic reconfiguration memory found
registered taskstats version 1
Loading compiled-in X.509 certificates
Btrfs loaded, crc32c=3Dcrc32c-generic
BTRFS: selftest: sectorsize: 4096  nodesize: 4096
BTRFS: selftest: running btrfs free space cache tests
BTRFS: selftest: running extent only tests
BTRFS: selftest: running bitmap only tests
BTRFS: selftest: running bitmap and extent tests
BTRFS: selftest: running space stealing from bitmap to extent tests
BTRFS: selftest: running extent buffer operation tests
BTRFS: selftest: running btrfs_split_item tests
BTRFS: selftest: running extent I/O tests
BTRFS: selftest: running find delalloc tests
BTRFS: selftest: running find_first_clear_extent_bit test
BTRFS: selftest: running extent buffer bitmap tests
BTRFS: selftest: running inode tests
BTRFS: selftest: running btrfs_get_extent tests
BTRFS: selftest: running hole first btrfs_get_extent test
BTRFS critical (device (efault)): regular/prealloc extent found for non-reg=
ular
inode 256
BTRFS: selftest: fs/btrfs/tests/inode-tests.c:904 expected a real extent, g=
ot 0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
WARNING: possible recursive locking detected
5.3.0-rc2+ #1881 Tainted: G        W=20=20=20=20=20=20=20=20
--------------------------------------------
swapper/0/1 is trying to acquire lock:
(ptrval) (&(&n->list_lock)->rlock){....}, at:
___slab_alloc.constprop.58+0xf0/0x38c

but task is already holding lock:
(ptrval) (&(&n->list_lock)->rlock){....}, at: __kmem_cache_shutdown+0x70/0x=
20c

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&(&n->list_lock)->rlock);
  lock(&(&n->list_lock)->rlock);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

3 locks held by swapper/0/1:
 #0: (ptrval) (cpu_hotplug_lock.rw_sem){++++}, at:
kmem_cache_destroy+0x54/0x1f4
 #1: (ptrval) (slab_mutex){+.+.}, at: kmem_cache_destroy+0x60/0x1f4
 #2: (ptrval) (&(&n->list_lock)->rlock){....}, at:
__kmem_cache_shutdown+0x70/0x20c

stack backtrace:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.3.0-rc2+ #1881
Call Trace:
[ee8d9938] [c0895918] dump_stack+0xb4/0xf8 (unreliable)
[ee8d9968] [c00aea18] __lock_acquire+0x1174/0x18dc
[ee8d9bd8] [c00ad1e0] lock_acquire+0x14c/0x1c0
[ee8d9c18] [c08b8a14] _raw_spin_lock+0x34/0x4c
[ee8d9c38] [c0229560] ___slab_alloc.constprop.58+0xf0/0x38c
[ee8d9cc8] [c022983c] __slab_alloc.constprop.57+0x40/0x6c
[ee8d9ce8] [c0229920] __kmalloc+0xb8/0x1f0
[ee8d9d28] [c022ba20] __kmem_cache_shutdown+0xe4/0x20c
[ee8d9d78] [c01e4e08] shutdown_cache+0x20/0x13c
[ee8d9d98] [c01e5320] kmem_cache_destroy+0x1d8/0x1f4
[ee8d9dd8] [c040bbb4] extent_io_exit+0x24/0x44
[ee8d9df8] [c0cbb93c] init_btrfs_fs+0x118/0x134
[ee8d9e18] [c0005860] do_one_initcall+0x134/0x33c
[ee8d9ec8] [c0c8c418] kernel_init_freeable+0x2b4/0x35c
[ee8d9f18] [c0005d38] kernel_init+0x18/0xf8
[ee8d9f38] [c0019348] ret_from_kernel_thread+0x14/0x1c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
BUG btrfs_extent_state (Tainted: G        W        ): Objects remaining in
btrfs_extent_state on __kmem_cache_shutdown()
---------------------------------------------------------------------------=
--

INFO: Slab 0x(ptrval) objects=3D14 used=3D1 fp=3D0x(ptrval) flags=3D0x0200
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B   W         5.3.0-rc2+ #1881
Call Trace:
[ee8d9c58] [c0895918] dump_stack+0xb4/0xf8 (unreliable)
[ee8d9c88] [c0227be0] slab_err+0x98/0xa0
[ee8d9d28] [c022ba3c] __kmem_cache_shutdown+0x100/0x20c
[ee8d9d78] [c01e4e08] shutdown_cache+0x20/0x13c
[ee8d9d98] [c01e5320] kmem_cache_destroy+0x1d8/0x1f4
[ee8d9dd8] [c040bbb4] extent_io_exit+0x24/0x44
[ee8d9df8] [c0cbb93c] init_btrfs_fs+0x118/0x134
[ee8d9e18] [c0005860] do_one_initcall+0x134/0x33c
[ee8d9ec8] [c0c8c418] kernel_init_freeable+0x2b4/0x35c
[ee8d9f18] [c0005d38] kernel_init+0x18/0xf8
[ee8d9f38] [c0019348] ret_from_kernel_thread+0x14/0x1c
INFO: Object 0x(ptrval) @offset=3D848
INFO: Allocated in alloc_extent_state+0x2c/0x1a4 age=3D1114 cpu=3D0 pid=3D1
        __slab_alloc.constprop.57+0x40/0x6c
        kmem_cache_alloc+0x80/0x268
        alloc_extent_state+0x2c/0x1a4
        __set_extent_bit+0x1b8/0x770
        set_extent_bit+0x30/0x40
        btrfs_test_extent_io+0x998/0xc54
        btrfs_run_sanity_tests+0xcc/0x144
        init_btrfs_fs+0xd4/0x134
        do_one_initcall+0x134/0x33c
        kernel_init_freeable+0x2b4/0x35c
        kernel_init+0x18/0xf8
        ret_from_kernel_thread+0x14/0x1c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
BUG btrfs_extent_state (Tainted: G    B   W        ): Objects remaining in
btrfs_extent_state on __kmem_cache_shutdown()
---------------------------------------------------------------------------=
--

INFO: Slab 0x(ptrval) objects=3D14 used=3D2 fp=3D0x(ptrval) flags=3D0x0200
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B   W         5.3.0-rc2+ #1881
Call Trace:
[ee8d9c58] [c0895918] dump_stack+0xb4/0xf8 (unreliable)
[ee8d9c88] [c0227be0] slab_err+0x98/0xa0
[ee8d9d28] [c022ba3c] __kmem_cache_shutdown+0x100/0x20c
[ee8d9d78] [c01e4e08] shutdown_cache+0x20/0x13c
[ee8d9d98] [c01e5320] kmem_cache_destroy+0x1d8/0x1f4
[ee8d9dd8] [c040bbb4] extent_io_exit+0x24/0x44
[ee8d9df8] [c0cbb93c] init_btrfs_fs+0x118/0x134
[ee8d9e18] [c0005860] do_one_initcall+0x134/0x33c
[ee8d9ec8] [c0c8c418] kernel_init_freeable+0x2b4/0x35c
[ee8d9f18] [c0005d38] kernel_init+0x18/0xf8
[ee8d9f38] [c0019348] ret_from_kernel_thread+0x14/0x1c
INFO: Object 0x(ptrval) @offset=3D2248
INFO: Allocated in alloc_extent_state+0x2c/0x1a4 age=3D1114 cpu=3D0 pid=3D1
        __slab_alloc.constprop.57+0x40/0x6c
        kmem_cache_alloc+0x80/0x268
        alloc_extent_state+0x2c/0x1a4
        __set_extent_bit+0x1b8/0x770
        set_extent_bit+0x30/0x40
        btrfs_test_extent_io+0x88c/0xc54
        btrfs_run_sanity_tests+0xcc/0x144
        init_btrfs_fs+0xd4/0x134
        do_one_initcall+0x134/0x33c
        kernel_init_freeable+0x2b4/0x35c
        kernel_init+0x18/0xf8
        ret_from_kernel_thread+0x14/0x1c
INFO: Object 0x(ptrval) @offset=3D2808
INFO: Allocated in alloc_extent_state+0x2c/0x1a4 age=3D1114 cpu=3D0 pid=3D1
        __slab_alloc.constprop.57+0x40/0x6c
        kmem_cache_alloc+0x80/0x268
        alloc_extent_state+0x2c/0x1a4
        __set_extent_bit+0x1b8/0x770
        set_extent_bit+0x30/0x40
        btrfs_test_extent_io+0x7f8/0xc54
        btrfs_run_sanity_tests+0xcc/0x144
        init_btrfs_fs+0xd4/0x134
        do_one_initcall+0x134/0x33c
        kernel_init_freeable+0x2b4/0x35c
        kernel_init+0x18/0xf8
        ret_from_kernel_thread+0x14/0x1c
kmem_cache_destroy btrfs_extent_state: Slab cache still has objects
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B   W         5.3.0-rc2+ #1881
Call Trace:
[ee8d9d98] [c01e5314] kmem_cache_destroy+0x1cc/0x1f4
[ee8d9dd8] [c040bbb4] extent_io_exit+0x24/0x44
[ee8d9df8] [c0cbb93c] init_btrfs_fs+0x118/0x134
[ee8d9e18] [c0005860] do_one_initcall+0x134/0x33c
[ee8d9ec8] [c0c8c418] kernel_init_freeable+0x2b4/0x35c
[ee8d9f18] [c0005d38] kernel_init+0x18/0xf8
[ee8d9f38] [c0019348] ret_from_kernel_thread+0x14/0x1c
Duplicate name in testcase-data, renamed to "duplicate-name#1"
### dt-test ### start of unittest - you will see error messages
OF: /testcase-data/phandle-tests/consumer-a: could not get
#phandle-cells-missing for /testcase-data/phandle-tests/provider1
OF: /testcase-data/phandle-tests/consumer-a: could not get
#phandle-cells-missing for /testcase-data/phandle-tests/provider1
OF: /testcase-data/phandle-tests/consumer-a: could not find phandle
OF: /testcase-data/phandle-tests/consumer-a: could not find phandle
OF: /testcase-data/phandle-tests/consumer-a: #phandle-cells =3D 3 found 0
OF: /testcase-data/phandle-tests/consumer-a: #phandle-cells =3D 3 found 0
OF: /testcase-data/phandle-tests/consumer-b: could not get
#phandle-missing-cells for /testcase-data/phandle-tests/provider1
OF: /testcase-data/phandle-tests/consumer-b: could not find phandle
OF: /testcase-data/phandle-tests/consumer-b: #phandle-cells =3D 2 found 0
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data/overlay-node/test-bus/test-unittest0/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data/overlay-node/test-bus/test-unittest1/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data/overlay-node/test-bus/test-unittest2/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data/overlay-node/test-bus/test-unittest3/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data/overlay-node/test-bus/test-unittest5/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data/overlay-node/test-bus/test-unittest6/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data/overlay-node/test-bus/test-unittest7/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data/overlay-node/test-bus/test-unittest8/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data/overlay-node/test-bus/test-unittest8/property-foo
OF: overlay: node_overlaps_later_cs: #6 overlaps with #7
@/testcase-data/overlay-node/test-bus/test-unittest8
OF: overlay: overlay #6 is not topmost
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest12/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest13/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data-2/substation@100/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data-2/fairway-1/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data-2/fairway-1/ride@100/track@30/incline-up
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data-2/fairway-1/ride@100/track@40/incline-up
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data-2/lights@40000/status
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data-2/lights@40000/color
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data-2/lights@40000/rate
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/__symbols__/hvac_2
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/__symbols__/ride_200
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/__symbols__/ride_200_left
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/__symbols__/ride_200_right
OF: overlay: ERROR: multiple fragments add and/or delete node
/testcase-data-2/substation@100/motor-1/controller
OF: overlay: ERROR: multiple fragments add, update, and/or delete property
/testcase-data-2/substation@100/motor-1/controller/name
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data-2/substation@100/motor-1/rpm_avail
OF: overlay: WARNING: memory leak will occur if overlay removed, property:
/testcase-data-2/substation@100/motor-1/rpm_avail
OF: overlay: ERROR: multiple fragments add, update, and/or delete property
/testcase-data-2/substation@100/motor-1/rpm_avail
### dt-test ### end of unittest - 223 passed, 0 failed
Warning: unable to open an initial console.
VFS: Cannot open root device "(null)" or unknown-block(8,1): error -6
Please append a correct "root=3D" boot option; here are the available parti=
tions:
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(8=
,1)
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B   W         5.3.0-rc2+ #1881
Call Trace:
[ee8d9d58] [c0895918] dump_stack+0xb4/0xf8 (unreliable)
[ee8d9d88] [c0043a08] panic+0x1c0/0x3f0
[ee8d9e48] [c0c8ca3c] mount_block_root+0x348/0x388
[ee8d9ef8] [c0c8cc44] prepare_namespace+0x13c/0x178
[ee8d9f18] [c0005d38] kernel_init+0x18/0xf8
[ee8d9f38] [c0019348] ret_from_kernel_thread+0x14/0x1c
Rebooting in 120 seconds..

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
