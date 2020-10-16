Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66100290CA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 22:16:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCcq06ZRszDqvH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 07:15:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCcn52STBzDqtY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 07:14:16 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F96FAD66;
 Fri, 16 Oct 2020 20:14:13 +0000 (UTC)
Date: Fri, 16 Oct 2020 22:14:10 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: KVM on POWER8 host lock up since 10d91611f426 ("powerpc/64s:
 Reimplement book3s idle code in C")
Message-ID: <20201016201410.GH29778@kitsune.suse.cz>
References: <20200830201145.GA29521@kitsune.suse.cz>
 <1598835313.5688ngko4f.astroid@bobo.none>
 <20200831091523.GC29521@kitsune.suse.cz>
 <87y2lv1430.fsf@mpe.ellerman.id.au>
 <1599484062.vgmycu6q5i.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1599484062.vgmycu6q5i.astroid@bobo.none>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: ro@suse.de, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 07, 2020 at 11:13:47PM +1000, Nicholas Piggin wrote:
> Excerpts from Michael Ellerman's message of August 31, 2020 8:50 pm:
> > Michal Suchánek <msuchanek@suse.de> writes:
> >> On Mon, Aug 31, 2020 at 11:14:18AM +1000, Nicholas Piggin wrote:
> >>> Excerpts from Michal Suchánek's message of August 31, 2020 6:11 am:
> >>> > Hello,
> >>> > 
> >>> > on POWER8 KVM hosts lock up since commit 10d91611f426 ("powerpc/64s:
> >>> > Reimplement book3s idle code in C").
> >>> > 
> >>> > The symptom is host locking up completely after some hours of KVM
> >>> > workload with messages like
> >>> > 
> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cpu 47
> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cpu 71
> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cpu 47
> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cpu 71
> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cpu 47
> >>> > 
> >>> > printed before the host locks up.
> >>> > 
> >>> > The machines run sandboxed builds which is a mixed workload resulting in
> >>> > IO/single core/mutiple core load over time and there are periods of no
> >>> > activity and no VMS runnig as well. The VMs are shortlived so VM
> >>> > setup/terdown is somewhat excercised as well.
> >>> > 
> >>> > POWER9 with the new guest entry fast path does not seem to be affected.
> >>> > 
> >>> > Reverted the patch and the followup idle fixes on top of 5.2.14 and
> >>> > re-applied commit a3f3072db6ca ("powerpc/powernv/idle: Restore IAMR
> >>> > after idle") which gives same idle code as 5.1.16 and the kernel seems
> >>> > stable.
> >>> > 
> >>> > Config is attached.
> >>> > 
> >>> > I cannot easily revert this commit, especially if I want to use the same
> >>> > kernel on POWER8 and POWER9 - many of the POWER9 fixes are applicable
> >>> > only to the new idle code.
> >>> > 
> >>> > Any idea what can be the problem?
> >>> 
> >>> So hwthread_state is never getting back to to HWTHREAD_IN_IDLE on
> >>> those threads. I wonder what they are doing. POWER8 doesn't have a good
> >>> NMI IPI and I don't know if it supports pdbg dumping registers from the
> >>> BMC unfortunately.
> >>
> >> It may be possible to set up fadump with a later kernel version that
> >> supports it on powernv and dump the whole kernel.
> > 
> > Your firmware won't support it AFAIK.
> > 
> > You could try kdump, but if we have CPUs stuck in KVM then there's a
> > good chance it won't work :/
> 
> I haven't had any luck yet reproducing this still. Testing with sub 
> cores of various different combinations, etc. I'll keep trying though.

Hello,

I tried running some KVM guests to simulate the workload and what I get
is guests failing to start with a rcu stall. Tried both 5.3 and 5.9
kernel and qemu 4.2.1 and 5.1.0

To start some guests I run

for i in $(seq 0 9) ; do /opt/qemu/bin/qemu-system-ppc64 -m 2048 -accel kvm -smp 8 -kernel /boot/vmlinux -initrd /boot/initrd -nodefaults -nographic -serial mon:telnet::444$i,server,wait & done

To simulate some workload I run

xz -zc9T0 < /dev/zero > /dev/null &
while true; do
    killall -STOP xz; sleep 1; killall -CONT xz; sleep 1;
done &

on the host and add a job that executes this to the ramdisk. However, most
guests never get to the point where the job is executed.

Any idea what might be the problem?

In the past I was able to boot guests quite realiably.

This is boot log of one of the VMs

Trying ::1...
Connected to localhost.
Escape character is '^]'.


SLOF **********************************************************************
QEMU Starting
 Build Date = Jul 17 2020 11:15:24
 FW Version = git-e18ddad8516ff2cf
 Press "s" to enter Open Firmware.

Populating /vdevice methods
Populating /vdevice/vty@71000000
Populating /vdevice/nvram@71000001
Populating /pci@800000020000000
No NVRAM common partition, re-initializing...
Scanning USB 
Using default console: /vdevice/vty@71000000
Detected RAM kernel at 400000 (27c8620 bytes) 
     
  Welcome to Open Firmware

  Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
  This program and the accompanying materials are made available
  under the terms of the BSD License available at
  http://www.opensource.org/licenses/bsd-license.php

Booting from memory...
OF stdout device is: /vdevice/vty@71000000
Preparing to boot Linux version 5.9.0-1.g11733e1-default (geeko@buildhost) (gcc (SUSE Linux) 10.2.1 20200825 [revision c0746a1beb1ba073c7981eb09f55b3d993b32e5c], GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.34.0.20200325-1) #1 SMP Sun Oct 11 22:20:46 UTC 2020 (11733e1)
Detected machine type: 0000000000000101
command line:  
Max number of cores passed to firmware: 2048 (NR_CPUS = 2048)
Calling ibm,client-architecture-support... done
memory layout at init:
  memory_limit : 0000000000000000 (16 MB aligned)
  alloc_bottom : 0000000003810000
  alloc_top    : 0000000030000000
  alloc_top_hi : 0000000080000000
  rmo_top      : 0000000030000000
  ram_top      : 0000000080000000
instantiating rtas at 0x000000002fff0000... done
prom_hold_cpus: skipped
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x0000000003820000 -> 0x0000000003820a2c
Device tree struct  0x0000000003830000 -> 0x0000000003840000
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x0000000000400000 ...
[    0.000000] hash-mmu: Page sizes from device-tree:
[    0.000000] hash-mmu: base_shift=12: shift=12, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=0
[    0.000000] hash-mmu: base_shift=16: shift=16, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=1
[    0.000000] Using 1TB segments
[    0.000000] hash-mmu: Initializing hash mmu with SLB
[    0.000000] Linux version 5.9.0-1.g11733e1-default (geeko@buildhost) (gcc (SUSE Linux) 10.2.1 20200825 [revision c0746a1beb1ba073c7981eb09f55b3d993b32e5c], GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.34.0.20200325-1) #1 SMP Sun Oct 11 22:20:46 UTC 2020 (11733e1)
[    0.000000] Found initrd at 0xc000000002be0000:0xc000000003804784
[    0.000000] Using pSeries machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Partition configured for 8 cpus.
[    0.000000] CPU maps initialized for 1 thread per core
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x80000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x80
[    0.000000] cpu_features      = 0x000002eb8f4d91a7
[    0.000000]   possible        = 0x000ffbfbcf5fb1a7
[    0.000000]   always          = 0x00000003800081a1
[    0.000000] cpu_user_features = 0xdc0065c2 0xae000000
[    0.000000] mmu_features      = 0x78006001
[    0.000000] firmware_features = 0x00000085455a445f
[    0.000000] vmalloc start     = 0xc008000000000000
[    0.000000] IO start          = 0xc00a000000000000
[    0.000000] vmemmap start     = 0xc00c000000000000
[    0.000000] hash-mmu: ppc64_pft_size    = 0x18
[    0.000000] hash-mmu: htab_hash_mask    = 0x1ffff
[    0.000000] -----------------------------------------------------
[    0.000000] numa:   NODE_DATA [mem 0x7ffa8900-0x7ffaffff]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: ori type flush available
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] count-cache-flush: hardware flush enabled.
[    0.000000] link-stack-flush: software flush enabled.
[    0.000000] stf-barrier: hwsync barrier available
[    0.000000] PCI host bridge /pci@800000020000000  ranges:
[    0.000000]   IO 0x0000200000000000..0x000020000000ffff -> 0x0000000000000000
[    0.000000]  MEM 0x0000200080000000..0x00002000ffffffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0000210000000000..0x000021ffffffffff -> 0x0000210000000000 
[    0.000000] PCI: OF: PROBE_ONLY disabled
[    0.000000] PPC64 nvram contains 65536 bytes
[    0.000000] PV qspinlock hash table entries: 4096 (order: 0, 65536 bytes, linear)
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000] percpu: Embedded 11 pages/cpu s629400 r0 d91496 u1048576
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 32736
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: 
[    0.000000] Dentry cache hash table entries: 262144 (order: 5, 2097152 bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 0K/2097152K available (15104K kernel code, 1984K rwdata, 7040K rodata, 5824K init, 10721K bss, 131968K reserved, 0K cma-reserved)
[    0.000000] random: get_random_u64 called from kmem_cache_open+0x3c/0x330 with crng_init=0
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] ftrace: allocating 37469 entries in 14 pages
[    0.000000] ftrace: allocated 14 pages with 3 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=8.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000001] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.001107] clocksource: timebase mult[1f40000] shift[24] registered
[    0.001819] Console: colour dummy device 80x25
[    0.002296] printk: console [hvc0] enabled
[    0.002296] printk: console [hvc0] enabled
[    0.002762] printk: bootconsole [udbg0] disabled
[    0.002762] printk: bootconsole [udbg0] disabled
[    0.003323] pid_max: default: 32768 minimum: 301
[    0.003435] LSM: Security Framework initializing
[    0.003529] AppArmor: AppArmor initialized
[    0.003597] Mount-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
[    0.003660] Mountpoint-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
[    0.004286] EEH: pSeries platform initialized
[    0.004329] POWER8 performance monitor hardware support registered
[    0.004380] power8-pmu: PMAO restore workaround active.
[    0.004434] rcu: Hierarchical SRCU implementation.
[    0.004660] smp: Bringing up secondary CPUs ...
[    0.007882] smp: Brought up 1 node, 8 CPUs
[    0.007927] numa: Node 0 CPUs: 0-7
[    0.007958] Using standard scheduler topology
[    0.009002] node 0 deferred pages initialised in 0ms
[    0.009491] devtmpfs: initialized
[    0.018942] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.019031] futex hash table entries: 2048 (order: 2, 262144 bytes, linear)
[    0.019229] pinctrl core: initialized pinctrl subsystem
[    0.019602] NET: Registered protocol family 16
[    0.019805] audit: initializing netlink subsys (disabled)
[    0.020018] audit: type=2000 audit(1602878417.010:1): state=initialized audit_enabled=0 res=1
[    0.020091] thermal_sys: Registered thermal governor 'fair_share'
[    0.020092] thermal_sys: Registered thermal governor 'bang_bang'
[    0.020180] thermal_sys: Registered thermal governor 'step_wise'
[    0.020228] thermal_sys: Registered thermal governor 'user_space'
[    0.020292] cpuidle: using governor ladder
[    0.020372] cpuidle: using governor menu
[    0.020521] pstore: Registered nvram as persistent store backend
Linux ppc64le
#1 SMP Sun Oct 1[    0.024636] PCI: Probing PCI hardware
[    0.024713] PCI host bridge to bus 0000:00
[    0.024746] pci_bus 0000:00: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
[    0.024814] pci_bus 0000:00: root bus resource [mem 0x200080000000-0x2000ffffffff] (bus address [0x80000000-0xffffffff])
[    0.024891] pci_bus 0000:00: root bus resource [mem 0x210000000000-0x21ffffffffff]
[    0.024950] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.026710] IOMMU table initialized, virtual merging enabled
[    0.026769] pci_bus 0000:00: resource 4 [io  0x10000-0x1ffff]
[    0.026820] pci_bus 0000:00: resource 5 [mem 0x200080000000-0x2000ffffffff]
[    0.026869] pci_bus 0000:00: resource 6 [mem 0x210000000000-0x21ffffffffff]
[    0.026918] EEH: No capable adapters found: recovery disabled.
[    0.031232] iommu: Default domain type: Translated 
[    0.031358] vgaarb: loaded
[    0.031439] pps_core: LinuxPPS API ver. 1 registered
[    0.031479] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.031548] PTP clock support registered
[    0.031585] EDAC MC: Ver: 3.0.0
[    0.031861] NetLabel: Initializing
[    0.031893] NetLabel:  domain hash size = 128
[    0.031932] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.031992] NetLabel:  unlabeled traffic allowed by default
[    0.045283] clocksource: Switched to clocksource timebase
[    0.061403] VFS: Disk quotas dquot_6.6.0
[    0.061497] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
[    0.061581] hugetlbfs: disabling because there are no supported hugepage sizes
[    0.061727] AppArmor: AppArmor Filesystem Enabled
[    0.063692] random: fast init done
[    0.065139] NET: Registered protocol family 2
[    0.065324] tcp_listen_portaddr_hash hash table entries: 4096 (order: 0, 65536 bytes, linear)
[    0.065401] TCP established hash table entries: 16384 (order: 1, 131072 bytes, linear)
[    0.065482] TCP bind hash table entries: 16384 (order: 2, 262144 bytes, linear)
[    0.065564] TCP: Hash tables configured (established 16384 bind 16384)
[    0.065658] MPTCP token hash table entries: 4096 (order: 0, 98304 bytes, linear)
[    0.065729] UDP hash table entries: 2048 (order: 0, 65536 bytes, linear)
[    0.065785] UDP-Lite hash table entries: 2048 (order: 0, 65536 bytes, linear)
[    0.065893] NET: Registered protocol family 1
[    0.065937] NET: Registered protocol family 44
[    0.065979] PCI: CLS 0 bytes, default 128
[    0.066053] Trying to unpack rootfs image as initramfs...
[    0.095306] rcu: INFO: rcu_sched self-detected stall on CPU
[    0.095492] rcu: 	4-...!: (1 GPs behind) idle=0d6/0/0x1 softirq=6/7 fqs=0 
[    0.095647] 	(t=13508 jiffies g=-1187 q=215)
[    0.095769] rcu: rcu_sched kthread starved for 13508 jiffies! g-1187 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
[    0.096015] rcu: 	Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
[    0.096233] rcu: RCU grace-period kthread stack dump:
[    0.096360] task:rcu_sched       state:I stack:    0 pid:   10 ppid:     2 flags:0x00000808
[    0.096551] Call Trace:
[    0.096621] [c000000007aab820] [c000000007aab890] 0xc000000007aab890 (unreliable)
[    0.096812] [c000000007aaba00] [c00000000001c25c] __switch_to+0x11c/0x200
[    0.096971] [c000000007aaba60] [c000000000ea50ac] __schedule+0x23c/0x800
[    0.097136] [c000000007aabb30] [c000000000ea56e4] schedule+0x74/0x140
[    0.097294] [c000000007aabb60] [c000000000eab6b0] schedule_timeout+0xa0/0x1c0
[    0.097483] [c000000007aabc30] [c00000000021f00c] rcu_gp_fqs_loop+0x48c/0x610
[    0.097674] [c000000007aabcf0] [c000000000222f40] rcu_gp_kthread+0x200/0x290
[    0.097859] [c000000007aabdb0] [c000000000190e60] kthread+0x190/0x1a0
[    0.098018] [c000000007aabe20] [c00000000000d3d0] ret_from_kernel_thread+0x5c/0x6c
[    0.098211] Sending NMI from CPU 4 to CPUs 0:
[    6.719253] CPU 0 didn't respond to backtrace IPI, inspecting paca.
[    6.722181] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 1 (swapper/0)
[    6.722297] Back trace of paca->saved_r1 (0xc000000007a8f140) (possibly stale):
[    6.722412] Call Trace:
[    6.722489] [c000000007a8f140] [0000000000000075] 0x75 (unreliable)
[    6.722581] [c000000007a8f1a0] [c000000007a8f280] 0xc000000007a8f280
[    6.722680] [c000000007a8f250] [c000000000254e30] tick_do_update_jiffies64.part.0+0x100/0x1f0
[    6.722785] [c000000007a8f290] [c00000000025505c] tick_sched_timer+0x13c/0x140
[    6.722855] [c000000007a8f2d0] [c00000000023ac50] __run_hrtimer+0xb0/0x360
[    6.722916] [c000000007a8f320] [c00000000023afd4] __hrtimer_run_queues+0xd4/0x1a0
[    6.722986] [c000000007a8f380] [c00000000023c144] hrtimer_interrupt+0x124/0x300
[    6.723064] [c000000007a8f430] [c0000000000272b4] timer_interrupt+0x104/0x2d0
[    6.723141] [c000000007a8f490] [c000000000009aa0] decrementer_common_virt+0x190/0x1a0
[    6.723227] --- interrupt: 900 at lzma_main+0x1d4/0x2a0
[    6.723227]     LR = lzma_main+0xcc/0x2a0
[    6.723317] [c000000007a8f790] [c0000000008dec00] lzma_main+0x1f0/0x2a0 (unreliable)
[    6.723393] [c000000007a8f7d0] [c0000000008dee90] lzma2_lzma+0x1e0/0x390
[    6.723448] [c000000007a8f820] [c0000000008df150] xz_dec_lzma2_run+0x110/0x6e0
[    6.723523] [c000000007a8f8c0] [c0000000008dce58] dec_block+0x218/0x2b0
[    6.723578] [c000000007a8f920] [c0000000008dd390] dec_main+0x1a0/0x590
[    6.723645] [c000000007a8f9b0] [c0000000008dd7d4] xz_dec_run+0x54/0x180
[    6.723714] [c000000007a8f9f0] [c00000000160333c] unxz+0x1e8/0x408
[    6.723786] [c000000007a8faa0] [c0000000015b6f58] unpack_to_rootfs+0x1e4/0x378
[    6.723851] [c000000007a8fb50] [c0000000015b7264] populate_rootfs+0x98/0x184
[    6.723926] [c000000007a8fbd0] [c000000000011ee0] do_one_initcall+0x60/0x2b0
[    6.723992] [c000000007a8fca0] [c0000000015b4f34] do_initcalls+0x140/0x18c
[    6.724062] [c000000007a8fd50] [c0000000015b520c] kernel_init_freeable+0x1f0/0x25c
[    6.724129] [c000000007a8fdb0] [c000000000012534] kernel_init+0x2c/0x168
[    6.724183] [c000000007a8fe20] [c00000000000d3d0] ret_from_kernel_thread+0x5c/0x6c
[    6.724315] Sending NMI from CPU 4 to CPUs 1:
[    6.724569] CPU 1 didn't respond to backtrace IPI, inspecting paca.
[    6.724582] NMI backtrace for cpu 1
[    6.724640] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swapper/1)
[    6.724801] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.9.0-1.g11733e1-default #1 openSUSE Tumbleweed (unreleased)
[    6.724838] Back trace of paca->saved_r1 (0xc000000007aff720) (possibly stale):
[    6.724841] Call Trace:
[    6.724957] NIP:  c0000000000fb260 LR: c0000000000fdf58 CTR: c00000000012e014
[    6.725027] Sending NMI from CPU 4 to CPUs 2:
[    6.725049] REGS: c000000007ad7b00 TRAP: 0500   Not tainted  (5.9.0-1.g11733e1-default)
[    6.725052] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48000224  XER: 00000000
[    6.725188] CPU 2 didn't respond to backtrace IPI, inspecting paca.
[    6.725194] NMI backtrace for cpu 2
[    6.725200] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 5.9.0-1.g11733e1-default #1 openSUSE Tumbleweed (unreleased)
[    6.725201] NIP:  c0000000000fb260 LR: c0000000000fdf58 CTR: c00000000012e014
[    6.725203] REGS: c000000007af7b00 TRAP: 0500   Not tainted  (5.9.0-1.g11733e1-default)
[    6.725203] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48000024  XER: 00000000
[    6.725208] CFAR: c0000000001e8fbc IRQMASK: 0 
[    6.725208] GPR00: 0000000028000024 c000000007af7d90 c000000001cd4a00 0000000000000000 
[    6.725208] GPR04: c00000007f612c30 0000000000000000 00000000001570d0 000000000014de44 
[    6.725208] GPR08: 000000007df60000 c00000003fffd000 0000000000000001 00000000ffffffff 
[    6.725208] GPR12: c0000000000fdec0 c00000003fffd600 0000000000000000 0000000000000000 
[    6.725208] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[    6.725208] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000001 
[    6.725208] GPR24: 0000000000000002 0000000000000000 0000000000000000 c000000001d17640 
[    6.725208] GPR28: 0000000000000001 c000000007a49e00 c0000000016a7190 c0000000016a7188 
[    6.725233] NIP [c0000000000fb260] plpar_hcall_norets+0x1c/0x28
[    6.725235] LR [c0000000000fdf58] pseries_lpar_idle+0x98/0x190
[    6.725236] Call Trace:
[    6.725238] [c000000007af7d90] [c000000007a49e00] 0xc000000007a49e00 (unreliable)
[    6.725241] [c000000007af7e00] [c00000000001da40] arch_cpu_idle+0x50/0x180
[    6.725266] [c000000007af7e30] [c000000000eacd84] default_idle_call+0x84/0x208
[    6.725268] CFAR: c0000000001e9170 
[    6.725272] IRQMASK: 0 
[    6.725272] GPR00: 0000000028000224 c000000007ad7d90 c000000001cd4a00 0000000000000000 
[    6.725272] GPR04: c00000007f512c30 0000000000000000 0000000000101b60 00000000000fa76c 
[    6.725272] GPR08: 000000007de60000 c00000003fffe800 0000000000000001 00000000ffffffff 
[    6.725272] GPR12: c0000000000fdec0 c00000003fffee00 0000000000000000 0000000000000000 
[    6.725272] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[    6.725272] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000001 
[    6.725272] GPR24: 0000000000000001 0000000000000000 0000000000000000 c000000001d17640 
[    6.725272] GPR28: 0000000000000001 c000000007a42780 c0000000016a7190 c0000000016a7188 
[    6.725289] NIP [c0000000000fb260] plpar_hcall_norets+0x1c/0x28
[    6.725291] LR [c0000000000fdf58] pseries_lpar_idle+0x98/0x190
[    6.725292] Call Trace:
[    6.725295] [c000000007ad7d90] [c000000007a42780] 0xc000000007a42780 (unreliable)
[    6.725298] [c000000007ad7e00] [c00000000001da40] arch_cpu_idle+0x50/0x180
[    6.725302] [c000000007ad7e30] [c000000000eacd84] default_idle_call+0x84/0x208
[    6.725305] [c000000007ad7e70] [c0000000001afd6c] cpuidle_idle_call+0x20c/0x2d0
[    6.725306] [c000000007ad7ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
[    6.725308] [c000000007ad7f10] [c0000000001b024c] cpu_startup_entry+0x3c/0x40
[    6.725310] [c000000007ad7f40] [c00000000005f038] start_secondary+0x248/0x250
[    6.725312] [c000000007ad7f90] [c00000000000c454] start_secondary_prolog+0x10/0x14
[    6.725312] Instruction dump:
[    6.725337] 7c0803a6 3884fff8 78630100 78840020 4bfffeb0 3c4c01be 384297bc 7c421378 
[    6.725340] 7c000026 90010008 60000000 44000022 <80010008> 7c0ff120 4e800020 7c0802a6 
[    6.725357] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swapper/2)
[    6.725517] [c000000007af7e70] [c0000000001afd6c] cpuidle_idle_call+0x20c/0x2d0
[    6.725556] Back trace of paca->saved_r1 (0x0000000000000000) (possibly stale):
[    6.725558] Call Trace:
[    6.725658] [c000000007af7ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
[    6.725740] Sending NMI from CPU 4 to CPUs 3:
[    6.725806] [c000000007af7f10] [c0000000001b024c] cpu_startup_entry+0x3c/0x40
[    6.728644] [c000000007af7f40] [c00000000005f038] start_secondary+0x248/0x250
[    6.728707] [c000000007af7f90] [c00000000000c454] start_secondary_prolog+0x10/0x14
[    6.728769] Instruction dump:
[    6.728805] 7c0803a6 3884fff8 78630100 78840020 4bfffeb0 3c4c01be 384297bc 7c421378 
[    6.728869] 7c000026 90010008 60000000 44000022 <80010008> 7c0ff120 4e800020 7c0802a6 
[   12.209770] CPU 3 didn't respond to backtrace IPI, inspecting paca.
[   12.210353] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swapper/3)
[   12.210436] Back trace of paca->saved_r1 (0xc000000007a83760) (possibly stale):
[   12.210546] Call Trace:
[   12.210578] [c000000007a83760] [c000000007a837b0] 0xc000000007a837b0 (unreliable)
[   12.210655] [c000000007a83800] [c0000000001e9574] __pv_queued_spin_lock_slowpath+0x2f4/0x420
[   12.210739] [c000000007a83850] [c000000000ead414] _raw_spin_lock_irqsave+0xa4/0xc0
[   12.210814] [c000000007a83880] [c000000000220cc8] rcu_report_qs_rdp.constprop.0+0x38/0x170
[   12.210892] [c000000007a838c0] [c000000000221334] rcu_core+0xa4/0x2a0
[   12.210946] [c000000007a83910] [c000000000eadb40] __do_softirq+0x160/0x3f8
[   12.211001] [c000000007a83a00] [c000000000162cf8] irq_exit+0xd8/0x140
[   12.211066] [c000000007a83a30] [c0000000000272d8] timer_interrupt+0x128/0x2d0
[   12.211143] [c000000007a83a90] [c000000000009aa0] decrementer_common_virt+0x190/0x1a0
[   12.211222] --- interrupt: 900 at plpar_hcall_norets+0x1c/0x28
[   12.211222]     LR = pseries_lpar_idle+0x98/0x190
[   12.211307] [c000000007a83d90] [c000000007a4ed00] 0xc000000007a4ed00 (unreliable)
[   12.211385] [c000000007a83e00] [c00000000001da40] arch_cpu_idle+0x50/0x180
[   12.211441] [c000000007a83e30] [c000000000eacd84] default_idle_call+0x84/0x208
[   12.211518] [c000000007a83e70] [c0000000001afd6c] cpuidle_idle_call+0x20c/0x2d0
[   12.211584] [c000000007a83ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
[   12.211650] [c000000007a83f10] [c0000000001b024c] cpu_startup_entry+0x3c/0x40
[   12.211717] [c000000007a83f40] [c00000000005f038] start_secondary+0x248/0x250
[   12.211792] [c000000007a83f90] [c00000000000c454] start_secondary_prolog+0x10/0x14
[   12.211879] NMI backtrace for cpu 4
[   12.211932] CPU: 4 PID: 0 Comm: swapper/4 Not tainted 5.9.0-1.g11733e1-default #1 openSUSE Tumbleweed (unreleased)
[   12.212022] Call Trace:
[   12.212055] [c000000007abb4f0] [c0000000008f5de0] dump_stack+0xc4/0x114 (unreliable)
[   12.212121] [c000000007abb540] [c00000000090316c] nmi_cpu_backtrace+0xac/0x100
[   12.212187] [c000000007abb5b0] [c00000000090336c] nmi_trigger_cpumask_backtrace+0x1ac/0x1f0
[   12.212271] [c000000007abb650] [c000000000072e38] arch_trigger_cpumask_backtrace+0x28/0x40
[   12.212338] [c000000007abb670] [c00000000022479c] rcu_dump_cpu_stacks+0x10c/0x168
[   12.212416] [c000000007abb6c0] [c00000000021b4d0] print_cpu_stall+0x1d0/0x2a0
[   12.212492] [c000000007abb770] [c00000000021d998] check_cpu_stall+0x148/0x340
[   12.212557] [c000000007abb7a0] [c00000000021dbe0] rcu_pending+0x50/0x150
[   12.212623] [c000000007abb7f0] [c0000000002233f4] rcu_sched_clock_irq+0x84/0x240
[   12.212699] [c000000007abb830] [c000000000239b28] update_process_times+0x48/0xd0
[   12.212765] [c000000007abb860] [c0000000002546bc] tick_sched_handle+0x3c/0xd0
[   12.212842] [c000000007abb890] [c000000000254fb0] tick_sched_timer+0x90/0x140
[   12.212919] [c000000007abb8d0] [c00000000023ac50] __run_hrtimer+0xb0/0x360
[   12.212973] [c000000007abb920] [c00000000023afd4] __hrtimer_run_queues+0xd4/0x1a0
[   12.213050] [c000000007abb980] [c00000000023c144] hrtimer_interrupt+0x124/0x300
[   12.213128] [c000000007abba30] [c0000000000272b4] timer_interrupt+0x104/0x2d0
[   12.213203] [c000000007abba90] [c000000000009aa0] decrementer_common_virt+0x190/0x1a0
[   12.213269] --- interrupt: 900 at plpar_hcall_norets+0x1c/0x28
[   12.213269]     LR = pseries_lpar_idle+0x98/0x190
[   12.213361] [c000000007abbd90] [c000000007a44f00] 0xc000000007a44f00 (unreliable)
[   12.213437] [c000000007abbe00] [c00000000001da40] arch_cpu_idle+0x50/0x180
[   12.213502] [c000000007abbe30] [c000000000eacd84] default_idle_call+0x84/0x208
[   12.213567] [c000000007abbe70] [c0000000001afd6c] cpuidle_idle_call+0x20c/0x2d0
[   12.213645] [c000000007abbec0] [c0000000001aff20] do_idle+0xf0/0x1d0
[   12.213707] [c000000007abbf10] [c0000000001b0248] cpu_startup_entry+0x38/0x40
[   12.213775] [c000000007abbf40] [c00000000005f038] start_secondary+0x248/0x250
[   12.213840] [c000000007abbf90] [c00000000000c454] start_secondary_prolog+0x10/0x14
[   12.213917] Sending NMI from CPU 4 to CPUs 5:
[   17.888326] CPU 5 didn't respond to backtrace IPI, inspecting paca.
[   17.888947] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swapper/5)
[   17.889011] Back trace of paca->saved_r1 (0xc000000007ac7720) (possibly stale):
[   17.889108] Call Trace:
[   17.889141] [c000000007ac7720] [c0000000001c1684] load_balance+0x1c4/0xaa0 (unreliable)
[   17.889215] [c000000007ac7800] [c0000000001e9434] __pv_queued_spin_lock_slowpath+0x1b4/0x420
[   17.889303] [c000000007ac7850] [c000000000ead414] _raw_spin_lock_irqsave+0xa4/0xc0
[   17.889383] [c000000007ac7880] [c000000000220cc8] rcu_report_qs_rdp.constprop.0+0x38/0x170
[   17.889463] [c000000007ac78c0] [c000000000221334] rcu_core+0xa4/0x2a0
[   17.889519] [c000000007ac7910] [c000000000eadb40] __do_softirq+0x160/0x3f8
[   17.889582] [c000000007ac7a00] [c000000000162cf8] irq_exit+0xd8/0x140
[   17.889641] [c000000007ac7a30] [c0000000000272d8] timer_interrupt+0x128/0x2d0
[   17.889712] [c000000007ac7a90] [c000000000009aa0] decrementer_common_virt+0x190/0x1a0
[   17.889795] --- interrupt: 900 at plpar_hcall_norets+0x1c/0x28
[   17.889795]     LR = pseries_lpar_idle+0x98/0x190
[   17.889899] [c000000007ac7d90] [c000000007a5da00] 0xc000000007a5da00 (unreliable)
[   17.889979] [c000000007ac7e00] [c00000000001da40] arch_cpu_idle+0x50/0x180
[   17.890044] [c000000007ac7e30] [c000000000eacd84] default_idle_call+0x84/0x208
[   17.890123] [c000000007ac7e70] [c0000000001afd6c] cpuidle_idle_call+0x20c/0x2d0
[   17.890201] [c000000007ac7ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
[   17.890258] [c000000007ac7f10] [c0000000001b0248] cpu_startup_entry+0x38/0x40
[   17.890337] [c000000007ac7f40] [c00000000005f038] start_secondary+0x248/0x250
[   17.890402] [c000000007ac7f90] [c00000000000c454] start_secondary_prolog+0x10/0x14
[   17.890492] Sending NMI from CPU 4 to CPUs 6:
[   17.890573] NMI backtrace for cpu 6
[   17.890574] CPU 6 didn't respond to backtrace IPI, inspecting paca.
[   17.890576] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swapper/6)
[   17.890666] CPU: 6 PID: 0 Comm: swapper/6 Not tainted 5.9.0-1.g11733e1-default #1 openSUSE Tumbleweed (unreleased)
[   17.890719] Back trace of paca->saved_r1 (0x0000000000000000) (possibly stale):
[   17.890720] Call Trace:
[   17.890791] NIP:  c0000000000fb260 LR: c0000000000fdf58 CTR: c00000000012e014
[   17.890885] Sending NMI from CPU 4 to CPUs 7:
[   17.890955] REGS: c000000007ae7b00 TRAP: 0500   Not tainted  (5.9.0-1.g11733e1-default)
[   17.890956] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48000024  XER: 00000000
[   17.891234] CFAR: c0000000000276bc IRQMASK: 0 
[   17.891234] GPR00: 0000000028000024 c000000007ae7d90 c000000001cd4a00 0000000000000000 
[   17.891234] GPR04: c000000007ae7e00 0000000000000000 c000000001d03a00 000000000018ed08 
[   17.891234] GPR08: 000000007e360000 c00000003fff7400 0000000000000001 0000000000000006 
[   17.891234] GPR12: c0000000000fdec0 c00000003fff7800 0000000000000000 0000000000000000 
[   17.891234] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[   17.891234] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000001 
[   17.891234] GPR24: 0000000000000006 0000000000000000 0000000000000000 c000000001d17640 
[   17.891234] GPR28: 0000000000000001 c000000007a40000 c0000000016a7190 c0000000016a7188 
[   17.891807] NIP [c0000000000fb260] plpar_hcall_norets+0x1c/0x28
[   17.891863] LR [c0000000000fdf58] pseries_lpar_idle+0x98/0x190
[   17.891930] Call Trace:
[   17.891954] [c000000007ae7d90] [c000000007a40000] 0xc000000007a40000 (unreliable)
[   17.892034] [c000000007ae7e00] [c00000000001da40] arch_cpu_idle+0x50/0x180
[   17.892091] [c000000007ae7e30] [c000000000eacd84] default_idle_call+0x84/0x208
[   17.892172] [c000000007ae7e70] [c0000000001afd6c] cpuidle_idle_call+0x20c/0x2d0
[   17.892240] [c000000007ae7ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
[   17.892307] [c000000007ae7f10] [c0000000001b0248] cpu_startup_entry+0x38/0x40
[   17.892374] [c000000007ae7f40] [c00000000005f038] start_secondary+0x248/0x250
[   17.892452] [c000000007ae7f90] [c00000000000c454] start_secondary_prolog+0x10/0x14
[   17.892529] Instruction dump:
[   17.892566] 7c0803a6 3884fff8 78630100 78840020 4bfffeb0 3c4c01be 384297bc 7c421378 
[   17.892647] 7c000026 90010008 60000000 44000022 <80010008> 7c0ff120 4e800020 7c0802a6 
[   24.118936] CPU 7 didn't respond to backtrace IPI, inspecting paca.
[   24.120313] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swapper/7)
[   24.120568] Back trace of paca->saved_r1 (0xc000000007aa3760) (possibly stale):
[   24.120834] Call Trace:
[   24.120927] [c000000007aa3800] [c0000000001e9574] __pv_queued_spin_lock_slowpath+0x2f4/0x420
[   24.121220] [c000000007aa3850] [c000000000ead414] _raw_spin_lock_irqsave+0xa4/0xc0
[   24.121473] [c000000007aa3880] [c000000000220cc8] rcu_report_qs_rdp.constprop.0+0x38/0x170
[   24.121724] [c000000007aa38c0] [c000000000221334] rcu_core+0xa4/0x2a0
[   24.121933] [c000000007aa3910] [c000000000eadb40] __do_softirq+0x160/0x3f8
[   24.122144] [c000000007aa3a00] [c000000000162cf8] irq_exit+0xd8/0x140
[   24.122354] [c000000007aa3a30] [c0000000000272d8] timer_interrupt+0x128/0x2d0
[   24.122606] [c000000007aa3a90] [c000000000009aa0] decrementer_common_virt+0x190/0x1a0
[   24.122858] --- interrupt: 900 at plpar_hcall_norets+0x1c/0x28
[   24.122858]     LR = pseries_lpar_idle+0x98/0x190
[   24.123191] [c000000007aa3d90] [c000000007a71600] 0xc000000007a71600 (unreliable)
[   24.123443] [c000000007aa3e00] [c00000000001da40] arch_cpu_idle+0x50/0x180
[   24.123654] [c000000007aa3e30] [c000000000eacd84] default_idle_call+0x84/0x208
[   24.123908] [c000000007aa3e70] [c0000000001afd6c] cpuidle_idle_call+0x20c/0x2d0
[   24.124159] [c000000007aa3ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
[   24.124367] [c000000007aa3f10] [c0000000001b0248] cpu_startup_entry+0x38/0x40
[   24.124619] [c000000007aa3f40] [c00000000005f038] start_secondary+0x248/0x250
[   24.124869] [c000000007aa3f90] [c00000000000c454] start_secondary_prolog+0x10/0x14


qemu and overall the problem is the same - the boot stops early.
