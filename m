Return-Path: <linuxppc-dev+bounces-7684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA25A8B514
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 11:19:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcwSp2D7gz3bpW;
	Wed, 16 Apr 2025 19:19:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=37.157.195.192
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744795146;
	cv=none; b=D2OxHqx/YCKl6O9Xjp1uT4jQtHqh+ogdiNMioUYjB2877zCvyBvtcVuke/3rRt3xHihHc9ZhFuMX9SCXq1BumpXE8WAo4tnTxju7GBdFkFS/sAd7uOlpI1o+u0VNXXW7fJPNpjbef47oDDWvw5WiJ1oxzIsJsei92lCMRzwMxaHLbrjFHEuVr5HDLFH1Jx3ra203C/cTPQFl2XGBh2fBOzRslpgtEqGuDPK8334Ww6minjiFBuUUI5VIRO1BVp36fF+lEHKkexelPLhaMHKUVgXCENtpaIkdG0fqJqObGW38D1IXvPutQhi0fYN8Pty2XmOIo1L+HANwErP7YRhyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744795146; c=relaxed/relaxed;
	bh=DxBbXstWkSpEIeJisoV6YMyQ0tILFwOLqWudQEBTddU=;
	h=Date:From:To:Subject:Message-Id:Mime-Version:Content-Type; b=ffBSvGHGCfUDtefdXmgDqK3ggOPSEnvvE64NjIZnixuQz4FGUBLY87ILeJtS0uYWbOz6jUTWriGCLJ2pUMJY3SnQzWA0bhHpwPK8QF0H2PYr2B3R5bBXPSZl+UAZCIZ4Axc0GN4GSe3Xi0vvxFlf/dGFKnF4IY6RHvQJwBDS+XFzX5ezBfalv7GTr825yLShw6E8ySyBeNnnzOtHFMv64hLc8a2R9GnIuXyEMWiD1eKx/A04N6V40N9k0zA67vl1i6IrqeCXVvzsWCQF+yP9vBg3ogCBL92HWJQFDcqFFGQtWqs9BegUyLZPTlrLvGy+tsYGFG0KTPtkC8sQJnk2Sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz; spf=pass (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org) smtp.mailfrom=danny.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 1986 seconds by postgrey-1.37 at boromir; Wed, 16 Apr 2025 19:19:03 AEST
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcwSl4YGFz2xqD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 19:19:03 +1000 (AEST)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id 6A2DD6B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 10:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 redcrew.org 6A2DD6B
Received: from talos.danny.cz (talos [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id 394A515E001
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 10:45:52 +0200 (CEST)
Date: Wed, 16 Apr 2025 10:45:52 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: linuxppc-dev@lists.ozlabs.org
Subject: early soft lockup in 6.15-rc2 on PowerNV
Message-Id: <20250416104552.1b2c63939d42a9bc20f2ef8d@danny.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

after updating to Fedora built 6.15-rc2 kernel from 6.14 I am getting a
soft lockup early in the boot and NVME related timeout/crash later
(could it be related?). I am first checking if this is a known issue
as I have not started bisecting yet.

[    0.000000] dt-cpu-ftrs: setup for ISA 3000
[    0.000000] dt-cpu-ftrs: final cpu/mmu features = 0x0001f86b8f5fb187 0x3c007041
[    0.000000] radix-mmu: Page sizes from device-tree:
[    0.000000] radix-mmu: Page size shift = 12 AP=0x0
[    0.000000] radix-mmu: Page size shift = 16 AP=0x5
[    0.000000] radix-mmu: Page size shift = 21 AP=0x1
[    0.000000] radix-mmu: Page size shift = 30 AP=0x2
[    0.000000] Activating Kernel Userspace Access Prevention
[    0.000000] Activating Kernel Userspace Execution Prevention
[    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000003a00000 with 2.00 MiB pages (exec)
[    0.000000] radix-mmu: Mapped 0x0000000003a00000-0x0000000040000000 with 2.00 MiB pages
[    0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000000800000000 with 1.00 GiB pages
[    0.000000] radix-mmu: Mapped 0x0000200000000000-0x00002007c0000000 with 1.00 GiB pages
[    0.000000] radix-mmu: Mapped 0x00002007c0000000-0x00002007fac00000 with 2.00 MiB pages
[    0.000000] radix-mmu: Mapped 0x00002007fac00000-0x00002007fad00000 with 64.0 KiB pages
[    0.000000] radix-mmu: Mapped 0x00002007fcd00000-0x00002007fce00000 with 64.0 KiB pages
[    0.000000] radix-mmu: Mapped 0x00002007fce00000-0x0000200800000000 with 2.00 MiB pages
[    0.000000] radix-mmu: Mapped 0x00002007fad00000-0x00002007fcd00000 with 64.0 KiB pages
[    0.000000] radix-mmu: Initializing Radix MMU
[    0.000000] Linux version 6.15.0-0.rc2.22.fc43.ppc64le (mockbuild@a0290efb436b46e8b89e5361c3c4e240) (gcc (GCC) 15.0.1 20250410 (Red Hat 15.0.1-0), GNU ld version 2.44-3.fc43) #1 SMP Mon A
pr 14 13:53:55 UTC 2025
[    0.000000] OF: reserved mem: 0x00002007fcd30000..0x00002007fce2ffff (1024 KiB) map non-reusable HCODE@2007fcd30000
[    0.000000] OF: reserved mem: 0x00002007fd0e0000..0x00002007fd1dffff (1024 KiB) map non-reusable OCC@2007fd0e0000
[    0.000000] OF: reserved mem: 0x00002007fcd00000..0x00002007fcd2ffff (192 KiB) map non-reusable RINGOVD@2007fcd00000
[    0.000000] OF: reserved mem: 0x00002007fce30000..0x00002007fd0dffff (2752 KiB) map non-reusable WOFDATA@2007fce30000
[    0.000000] OF: reserved mem: 0x0000000035e00000..0x0000000038341fff (38152 KiB) map non-reusable ibm,firmware-allocs-memory@35e00000
[    0.000000] OF: reserved mem: 0x0000200000000000..0x0000200002a43fff (43280 KiB) map non-reusable ibm,firmware-allocs-memory@200000000000
[    0.000000] OF: reserved mem: 0x0000000030000000..0x00000000303fffff (4096 KiB) map non-reusable ibm,firmware-code@30000000
[    0.000000] OF: reserved mem: 0x0000000031000000..0x0000000031bfffff (12288 KiB) map non-reusable ibm,firmware-data@31000000
[    0.000000] OF: reserved mem: 0x0000000030400000..0x0000000030ffffff (12288 KiB) map non-reusable ibm,firmware-heap@30400000
[    0.000000] OF: reserved mem: 0x0000000031c00000..0x0000000035dfffff (67584 KiB) map non-reusable ibm,firmware-stacks@31c00000
[    0.000000] OF: reserved mem: 0x00002007fd230000..0x00002007fd66ffff (4352 KiB) map non-reusable ibm,hbrt-code-image@2007fd230000
[    0.000000] OF: reserved mem: 0x00002007fd670000..0x00002007fd7fffff (1600 KiB) map non-reusable ibm,hbrt-data@2007fd670000
[    0.000000] OF: reserved mem: 0x00002007fd800000..0x00002007fdbfffff (4096 KiB) map non-reusable ibm,homer-image@2007fd800000
[    0.000000] OF: reserved mem: 0x00002007fdc00000..0x00002007fdffffff (4096 KiB) map non-reusable ibm,homer-image@2007fdc00000
[    0.000000] OF: reserved mem: 0x00002007ff800000..0x00002007ffffffff (8192 KiB) map non-reusable ibm,occ-common-area@2007ff800000
[    0.000000] OF: reserved mem: 0x00002007fd200000..0x00002007fd20ffff (64 KiB) map non-reusable ibm,sbe-comm@2007fd200000
[    0.000000] OF: reserved mem: 0x00002007fd220000..0x00002007fd22ffff (64 KiB) map non-reusable ibm,sbe-comm@2007fd220000
[    0.000000] OF: reserved mem: 0x00002007fd1f0000..0x00002007fd1fffff (64 KiB) map non-reusable ibm,sbe-ffdc@2007fd1f0000
[    0.000000] OF: reserved mem: 0x00002007fd210000..0x00002007fd21ffff (64 KiB) map non-reusable ibm,sbe-ffdc@2007fd210000
[    0.000000] OF: reserved mem: 0x00002007fd1e0000..0x00002007fd1effff (64 KiB) map non-reusable ibm,secure-crypt-algo-code@2007fd1e0000
[    0.000000] Found initrd at 0xc000000006380000:0xc00000000a057310
[    0.000000] OPAL: Found memory mapped LPC bus on chip 0
[    0.000000] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
[    0.000000] CPU maps initialized for 4 threads per core
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x1000000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x80
[    0.000000] cpu_features      = 0x0001f86b8f5fb187
[    0.000000]   possible        = 0x003ffbfbcf5fb187
[    0.000000]   always          = 0x0000000380008181
[    0.000000] cpu_user_features = 0xdc0065c2 0xaef00000
[    0.000000] mmu_features      = 0x3c007641
[    0.000000] firmware_features = 0x0000000110000000
[    0.000000] vmalloc start     = 0xc008000000000000
[    0.000000] IO start          = 0xc00a000000000000
[    0.000000] vmemmap start     = 0xc00c000000000000
[    0.000000] -----------------------------------------------------
[    0.000000] NODE_DATA(0) allocated [mem 0x7ffd2dc00-0x7ffd3597f]
[    0.000000] NODE_DATA(8) allocated [mem 0x2007ff420b00-0x2007ff42887f]
[    0.000000] kvm_cma_reserve: reserving 3276 MiB for global area
[    0.000000] cma: Reserved 3276 MiB at 0x0000000000000000
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] count-cache-flush: flush disabled.
[    0.000000] link-stack-flush: software flush enabled.
[    0.000000] stf-barrier: eieio barrier available
[    0.000000] OPAL nvram setup, 589824 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x00002007ffffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x00000007ffffffff]
[    0.000000]   node   8: [mem 0x0000200000000000-0x00002007ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000007ffffffff]
[    0.000000] Initmem setup node 8 [mem 0x0000200000000000-0x00002007ffffffff]
[    0.000000] percpu: Embedded 4 pages/cpu s124056 r0 d138088 u262144
[    0.000000] Kernel command line: root=/dev/mapper/Linux-Root ro rd.lvm.lv=Linux/Root rd.md.uuid=60936c65:08d9f6bc:b191c895:332a4d53 rd.md.uuid=06128381:0df3ab4b:02ebd84d:84921066 rd.md.uu
id=3c52d341:6485ed32:9da81f4c:706b231f console=tty1 console=hvc0
[    0.000000] random: crng init done
[    0.000000] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.000000] printk: log_buf_len total cpu_extra contributions: 258048 bytes
[    0.000000] printk: log_buf_len min size: 262144 bytes
[    0.000000] printk: log buffer data + meta data: 524288 + 1835008 = 2359296 bytes
[    0.000000] printk: early log buf free: 254416(97%)
[    0.000000] Fallback order for Node 0: 0 8 
[    0.000000] Fallback order for Node 8: 8 0 
[    0.000000] Built 2 zonelists, mobility grouping on.  Total pages: 1048576
[    0.000000] Policy zone: Normal
[    0.000000] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=64, Nodes=9
[    0.000000] ftrace: allocating 54036 entries in 20 pages
[    0.000000] ftrace: allocated 20 pages with 2 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=64.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=64
[    0.000000] RCU Tasks Rude: Setting shift to 6 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=64.
[    0.000000] RCU Tasks Trace: Setting shift to 6 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=64.
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] xive: Interrupt handling initialized with native backend
[    0.000000] xive: Using priority 7 for all interrupts
[    0.000000] xive: Using 64kB queues
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000002] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.000006] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000010] clocksource: timebase mult[1f40000] shift[24] registered
[    0.001157] kfence: initialized - using 33554432 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
[    0.001583] Console: colour dummy device 80x25
[    0.001591] printk: legacy console [tty1] enabled
[    0.002206] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.002222] pid_max: default: 65536 minimum: 512
[    0.002787] LSM: initializing lsm=lockdown,capability,yama,selinux,bpf,landlock,ipe,ima,evm
[    0.003040] Yama: becoming mindful.
[    0.003053] SELinux:  Initializing.
[    0.004545] LSM support for eBPF active
[    0.004613] landlock: Up and running.
[    0.009052] Dentry cache hash table entries: 8388608 (order: 10, 67108864 bytes, vmalloc hugepage)
[    0.011240] Inode-cache hash table entries: 4194304 (order: 9, 33554432 bytes, vmalloc hugepage)
[    0.011462] Mount-cache hash table entries: 131072 (order: 4, 1048576 bytes, vmalloc)
[    0.011546] Mountpoint-cache hash table entries: 131072 (order: 4, 1048576 bytes, vmalloc)
[    0.030196] POWER9 performance monitor hardware support registered
[    0.030381] rcu: Hierarchical SRCU implementation.
[    0.030387] rcu: 	Max phase no-delay instances is 1000.
[    0.030496] Timer migration: 3 hierarchy levels; 8 children per group; 2 crossnode level
[    0.031884] smp: Bringing up secondary CPUs ...
[    2.861944] smp: Brought up 2 nodes, 64 CPUs
[    2.861964] numa: Node 0 CPUs: 0-31
[    2.861977] numa: Node 8 CPUs: 32-63
[    2.866399] Memory: 63016960K/67108864K available (25152K kernel code, 4416K rwdata, 24000K rodata, 9792K init, 1796K bss, 476160K reserved, 3356672K cma-reserved)
[    2.874121] devtmpfs: initialized
[   24.037685] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
[   24.037690] CPU#0 Utilization every 4s during lockup:
[   24.037692] 	#1: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
[   24.037697] 	#2: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
[   24.037701] 	#3: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
[   24.037704] 	#4: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
[   24.037707] 	#5: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
[   24.037711] Modules linked in:
[   24.037716] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-0.rc2.22.fc43.ppc64le #1 VOLUNTARY 
[   24.037722] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
[   24.037725] NIP:  c00000000308a72c LR: c00000000308a7d0 CTR: c0000000018012c0
[   24.037729] REGS: c000200006637a50 TRAP: 0900   Not tainted  (6.15.0-0.rc2.22.fc43.ppc64le)
[   24.037733] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 48000828  XER: 00000000
[   24.037750] CFAR: 0000000000000000 IRQMASK: 0 
[   24.037750] GPR00: c00000000308a7d0 c000200006637cf0 c0000000025baa00 0000000000000040 
[   24.037750] GPR04: c0002007ff390b00 0000000000010000 0000000000000000 c0002007ff3a0b00 
[   24.037750] GPR08: 00000000002007ff 000000000012d092 0000000000000000 0000000000000000 
[   24.037750] GPR12: 0000000000000000 c000000003fb0000 c000000000011320 0000000000000000 
[   24.037750] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[   24.037750] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[   24.037750] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[   24.037750] GPR28: 0000000000000000 c000000003f10be0 c0000000019efaf8 0000000000037940 
[   24.037806] NIP [c00000000308a72c] memory_dev_init+0xb4/0x194
[   24.037815] LR [c00000000308a7d0] memory_dev_init+0x158/0x194
[   24.037820] Call Trace:
[   24.037822] [c000200006637cf0] [c00000000308a7d0] memory_dev_init+0x158/0x194 (unreliable)
[   24.037830] [c000200006637d70] [c000000003089bd0] driver_init+0x74/0xa0
[   24.037836] [c000200006637d90] [c00000000300f628] kernel_init_freeable+0x204/0x288
[   24.037843] [c000200006637df0] [c000000000011344] kernel_init+0x2c/0x1b8
[   24.037849] [c000200006637e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
[   24.037855] --- interrupt: 0 at 0x0
[   24.037858] Code: 7c651b78 40820010 3fa20195 3bbd61e0 48000080 3c62ff89 389e00c8 3863e510 4bf7a625 60000000 39290001 7c284840 <41800088> 792aaac2 7c2a2840 4080ffec 
[   48.045039] watchdog: BUG: soft lockup - CPU#0 stuck for 44s! [swapper/0:1]
[   48.045043] CPU#0 Utilization every 4s during lockup:
[   48.045045] 	#1: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
[   48.045049] 	#2: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
[   48.045053] 	#3: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
[   48.045056] 	#4: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
[   48.045059] 	#5: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
[   48.045063] Modules linked in:
[   48.045067] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G             L     ------  ---  6.15.0-0.rc2.22.fc43.ppc64le #1 VOLUNTARY 
[   48.045073] Tainted: [L]=SOFTLOCKUP
[   48.045075] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
[   48.045077] NIP:  c00000000308a72c LR: c00000000308a7d0 CTR: c0000000018012c0
[   48.045081] REGS: c000200006637a50 TRAP: 0900   Tainted: G             L     ------  ---   (6.15.0-0.rc2.22.fc43.ppc64le)
[   48.045085] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 48000828  XER: 00000000
[   48.045100] CFAR: 0000000000000000 IRQMASK: 0 
[   48.045100] GPR00: c00000000308a7d0 c000200006637cf0 c0000000025baa00 0000000000000040 
[   48.045100] GPR04: c0002007ff390b00 0000000000010000 0000000000000000 c0002007ff3a0b00 
[   48.045100] GPR08: 00000000002007ff 00000000000a65fd 0000000000000000 0000000000000000 
[   48.045100] GPR12: 0000000000000000 c000000003fb0000 c000000000011320 0000000000000000 
[   48.045100] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[   48.045100] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[   48.045100] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[   48.045100] GPR28: 0000000000000000 c000000003f10be0 c0000000019efaf8 000000000007f880 
[   48.045155] NIP [c00000000308a72c] memory_dev_init+0xb4/0x194
[   48.045161] LR [c00000000308a7d0] memory_dev_init+0x158/0x194
[   48.045166] Call Trace:
[   48.045167] [c000200006637cf0] [c00000000308a7d0] memory_dev_init+0x158/0x194 (unreliable)
[   48.045175] [c000200006637d70] [c000000003089bd0] driver_init+0x74/0xa0
[   48.045181] [c000200006637d90] [c00000000300f628] kernel_init_freeable+0x204/0x288
[   48.045187] [c000200006637df0] [c000000000011344] kernel_init+0x2c/0x1b8
[   48.045193] [c000200006637e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
[   48.045199] --- interrupt: 0 at 0x0
[   48.045202] Code: 7c651b78 40820010 3fa20195 3bbd61e0 48000080 3c62ff89 389e00c8 3863e510 4bf7a625 60000000 39290001 7c284840 <41800088> 792aaac2 7c2a2840 4080ffec 
[   62.919422] rcu: INFO: rcu_sched self-detected stall on CPU
[   62.919431] rcu: 	0-....: (5999 ticks this GP) idle=7764/1/0x4000000000000002 softirq=103/103 fqs=2993
[   62.919450] rcu: 	(t=6000 jiffies g=-935 q=2 ncpus=64)
[   62.919459] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G             L     ------  ---  6.15.0-0.rc2.22.fc43.ppc64le #1 VOLUNTARY 
[   62.919465] Tainted: [L]=SOFTLOCKUP
[   62.919467] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
[   62.919470] NIP:  c00000000308a744 LR: c00000000308a7d0 CTR: c0000000018012c0
[   62.919473] REGS: c000200006637a50 TRAP: 0900   Tainted: G             L     ------  ---   (6.15.0-0.rc2.22.fc43.ppc64le)
[   62.919477] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 88000828  XER: 00000000
[   62.919492] CFAR: 0000000000000000 IRQMASK: 0 
[   62.919492] GPR00: c00000000308a7d0 c000200006637cf0 c0000000025baa00 0000000000000040 
[   62.919492] GPR04: c0002007ff390b00 0000000000010000 0000000000000000 c0002007ff3a0b00 
[   62.919492] GPR08: 00000000002007ff 000000000012fdce 00000000000012f8 0000000000000000 
[   62.919492] GPR12: 0000000000000000 c000000003fb0000 c000000000011320 0000000000000000 
[   62.919492] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[   62.919492] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[   62.919492] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[   62.919492] GPR28: 0000000000000000 c000000003f10be0 c0000000019efaf8 00000000000b3d80 
[   62.919546] NIP [c00000000308a744] memory_dev_init+0xcc/0x194
[   62.919552] LR [c00000000308a7d0] memory_dev_init+0x158/0x194
[   62.919557] Call Trace:
[   62.919558] [c000200006637cf0] [c00000000308a7d0] memory_dev_init+0x158/0x194 (unreliable)
[   62.919565] [c000200006637d70] [c000000003089bd0] driver_init+0x74/0xa0
[   62.919572] [c000200006637d90] [c00000000300f628] kernel_init_freeable+0x204/0x288
[   62.919578] [c000200006637df0] [c000000000011344] kernel_init+0x2c/0x1b8
[   62.919584] [c000200006637e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
[   62.919589] --- interrupt: 0 at 0x0

and for the NVME issue

...
[  114.881200] [drm] vm size is 256 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
[  114.884117] amdgpu 0000:01:00.0: BAR 2 [mem 0x6000010000000-0x60000101fffff 64bit pref]: releasing
[  114.884153] amdgpu 0000:01:00.0: BAR 0 [mem 0x6000000000000-0x600000fffffff 64bit pref]: releasing
[  114.884197] pci 0000:00:00.0: bridge window [mem 0x6000000000000-0x6003fbff0ffff 64bit pref]: releasing
[  114.884232] pci 0000:00:00.0: bridge window [mem 0x6000000000000-0x600017fffffff 64bit pref]: assigned
[  114.884258] amdgpu 0000:01:00.0: BAR 0 [mem 0x6000000000000-0x60000ffffffff 64bit pref]: assigned
[  114.884301] amdgpu 0000:01:00.0: BAR 2 [mem 0x6000100000000-0x60001001fffff 64bit pref]: assigned
[  114.884334] pci 0000:00:00.0: PCI bridge to [bus 01]
[  114.884354] pci 0000:00:00.0:   bridge window [mem 0x600c000000000-0x600c07fefffff]
[  114.884377] pci 0000:00:00.0:   bridge window [mem 0x6000000000000-0x6003fbff0ffff 64bit pref]
[  114.884428] amdgpu 0000:01:00.0: amdgpu: VRAM: 4096M 0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
[  114.884461] amdgpu 0000:01:00.0: amdgpu: GART: 256M 0x000000FF00000000 - 0x000000FF0FFFFFFF
[  114.884486] [drm] Detected VRAM RAM=4096M, BAR=4096M
[  114.884501] [drm] RAM width 128bits GDDR5
[  114.884516] amdgpu 0000:01:00.0: dma_iommu_get_required_mask: returning bypass mask 0xfffffffffffffff
[  114.884819] [drm] amdgpu: 4096M of VRAM memory ready
[  114.884837] [drm] amdgpu: 32570M of GTT memory ready.
[  114.884923] [drm] GART: num cpu pages 4096, num gpu pages 65536
[  114.885601] [drm] PCIE GART of 256M enabled (table at 0x000000F4FFF80000).
[  114.890493] [drm] Chained IB support enabled!
[drm] vm size is 256 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
amdgpu 0000:01:00.0: BAR 2 [mem 0x6000010000000-0x60000101fffff 64bit pref]: releasing
amdgpu 0000:01:00.0: BAR 0 [mem 0x6000000000000-0x600000fffffff 64bit pref]: releasing
pci 0000:00:00.0: bridge window [mem 0x6000000000000-0x6003fbff0ffff 64bit pref]: releasing
pci 0000:00:00.0: bridge window [mem 0x6000000000000-0x600017fffffff 64bit pref]: assigned
amdgpu 0000:01:00.0: BAR 0 [mem 0x6000000000000-0x60000ffffffff 64bit pref]: assigned
amdgpu 0000:01:00.0: BAR 2 [mem 0x6000100000000-0x60001001fffff 64bit pref]: assigned
pci 0000:00:00.0: PCI bridge to [bus 01]
pci 0000:00:00.0:   bridge window [mem 0x600c000000000-0x600c07fefffff]
pci 0000:00:00.0:   bridge window [mem 0x6000000000000-0x6003fbff0ffff 64bit pref]
amdgpu 0000:01:00.0: amdgpu: VRAM: 4096M 0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
amdgpu 0000:01:00.0: amdgpu: GART: 256M 0x000000FF00000000 - 0x000000FF0FFFFFFF
[drm] Detected VRAM RAM=4096M, BAR=4096M
[drm] RAM width 128bits GDDR5
amdgpu 0000:01:00.0: dma_iommu_get_required_mask: returning bypass mask 0xfffffffffffffff
[drm] amdgpu: 4096M of VRAM memory ready
[drm] amdgpu: 32570M of GTT memory ready.
[drm] GART: num cpu pages 4096, num gpu pages 65536
[drm] PCIE GART of 256M enabled (table at 0x000000F4FFF80000).
[drm] Chained IB support enabled!
[  114.911510] amdgpu: hwmgr_sw_init smu backed is polaris10_smu
amdgpu: hwmgr_sw_init smu backed is polaris10_smu
[  114.957192] [drm] Found UVD firmware Version: 1.130 Family ID: 16
[drm] Found UVD firmware Version: 1.130 Family ID: 16
[  114.974490] [drm] Found VCE firmware Version: 53.26 Binary ID: 3
[drm] Found VCE firmware Version: 53.26 Binary ID: 3
[  115.001810] [drm] Display Core v3.2.325 initialized on DCE 11.2
[drm] Display Core v3.2.325 initialized on DCE 11.2
[  115.143971] [drm] UVD and UVD ENC initialized successfully.
[drm] UVD and UVD ENC initialized successfully.
[  115.271914] [drm] VCE initialized successfully.
[  115.275652] kfd kfd: amdgpu: skipped device 1002:67e3, PCI rejects atomics 730<0
[  115.275695] amdgpu 0000:01:00.0: amdgpu: SE 2, SH per SE 1, CU per SH 8, active_cu_number 16
[  115.280222] amdgpu 0000:01:00.0: amdgpu: Using BACO for runtime pm
[drm] VCE initialized successfully.
kfd kfd: amdgpu: skipped device 1002:67e3, PCI rejects atomics 730<0
amdgpu 0000:01:00.0: amdgpu: SE 2, SH per SE 1, CU per SH 8, active_cu_number 16
amdgpu 0000:01:00.0: amdgpu: Using BACO for runtime pm
[  115.281521] amdgpu 0000:01:00.0: [drm] Registered 5 planes with drm panic
[  115.281550] [drm] Initialized amdgpu 3.63.0 for 0000:01:00.0 on minor 0
amdgpu 0000:01:00.0: [drm] Registered 5 planes with drm panic
[drm] Initialized amdgpu 3.63.0 for 0000:01:00.0 on minor 0
Console: switching to colour frame buffer device 240x75[  115.334341] Console: switching to colour frame buffer device 240x75
[  115.351211] amdgpu 0000:01:00.0: [drm] fb0: amdgpudrmfb frame buffer device

amdgpu 0000:01:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[  OK  ] Stopped systemd-vconsole-setup.service - Virtual Console Setup.
         Stopping systemd-vconsole-setup.service - Virtual Console Setup...
         Starting systemd-vconsole-setup.service - Virtual Console Setup...
[  OK  ] Finished systemd-vconsole-setup.service - Virtual Console Setup.
[  125.951686] pci 0030:02:07.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.951754] pci 0031:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.951800] pci 0032:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.951844] pci 0033:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.951888] pci 0000:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.951944] pci 0001:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.952016] pci 0002:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.952099] pci 0003:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.952170] pci 0004:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.952230] pci 0005:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.952325] pci 0005:01:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.952409] pci 0030:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.952482] pci 0030:01:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.952565] pci 0030:02:04.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.952648] pci 0030:02:05.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  125.952705] pci 0030:02:06.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0030:02:07.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0031:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0032:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0033:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0000:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0001:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0002:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0003:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0004:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0005:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0005:01:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0030:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0030:01:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0030:02:04.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0030:02:05.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
pci 0030:02:06.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  345.065439618,3] PHB#0030[8:0]: brdgCtl        = 00000002
[  345.065504727,3] PHB#0030[8:0]:             deviceStatus = 00060020
[  345.065555303,3] PHB#0030[8:0]:               slotStatus = 00402000
[  345.065598361,3] PHB#0030[8:0]:               linkStatus = a0830008
[  345.065646434,3] PHB#0030[8:0]:             devCmdStatus = 00100107
[  345.065688036,3] PHB#0030[8:0]:             devSecStatus = 00000800
[  345.065725760,3] PHB#0030[8:0]:          rootErrorStatus = 00000000
[  345.065761005,3] PHB#0030[8:0]:          corrErrorStatus = 00000000
[  345.065799111,3] PHB#0030[8:0]:        uncorrErrorStatus = 00000000
[  345.065842333,3] PHB#0030[8:0]:                   devctl = 00000020
[  345.065884810,3] PHB#0030[8:0]:                  devStat = 00000006
[  345.065929734,3] PHB#0030[8:0]:                  tlpHdr1 = 00000000
[  345.065976000,3] PHB#0030[8:0]:                  tlpHdr2 = 00000000
[  345.066022862,3] PHB#0030[8:0]:                  tlpHdr3 = 00000000
[  345.066063591,3] PHB#0030[8:0]:                  tlpHdr4 = 00000000
[  345.066118027,3] PHB#0030[8:0]:                 sourceId = 00000000
[  345.066166060,3] PHB#0030[8:0]:                     nFir = 0000000000000000
[  345.066216807,3] PHB#0030[8:0]:                 nFirMask = 0030001c00000000
[  345.066262342,3] PHB#0030[8:0]:                  nFirWOF = 0000000000000000
[  345.066307131,3] PHB#0030[8:0]:                 phbPlssr = 0000001c00000000
[  345.066347956,3] PHB#0030[8:0]:                   phbCsr = 0000001c00000000
[  345.066400929,3] PHB#0030[8:0]:                   lemFir = 0000000100000080
[  345.066464941,3] PHB#0030[8:0]:             lemErrorMask = 0000000000000000
[  345.066508121,3] PHB#0030[8:0]:                   lemWOF = 0000000000000080
[  345.066552807,3] PHB#0030[8:0]:           phbErrorStatus = 0000028000000000
[  345.066598507,3] PHB#0030[8:0]:      phbFirstErrorStatus = 0000020000000000
[  345.066645892,3] PHB#0030[8:0]:             phbErrorLog0 = 2148000098000240
[  345.066694406,3] PHB#0030[8:0]:             phbErrorLog1 = a008400000000000
[  345.066738324,3] PHB#0030[8:0]:        phbTxeErrorStatus = 0000000000000000
[  345.066789036,3] PHB#0030[8:0]:   phbTxeFirstErrorStatus = 0000000000000000
[  345.066839733,3] PHB#0030[8:0]:          phbTxeErrorLog0 = 0000000000000000
[  345.066890491,3] PHB#0030[8:0]:          phbTxeErrorLog1 = 0000000000000000
[  345.066934140,3] PHB#0030[8:0]:     phbRxeArbErrorStatus = 0000000000000000
[  345.066976699,3] PHB#0030[8:0]: phbRxeArbFrstErrorStatus = 0000000000000000
[  345.067020438,3] PHB#0030[8:0]:       phbRxeArbErrorLog0 = 0000000000000000
[  345.067067083,3] PHB#0030[8:0]:       phbRxeArbErrorLog1 = 0000000000000000
[  345.067117696,3] PHB#0030[8:0]:     phbRxeMrgErrorStatus = 0000000000000000
[  345.067164954,3] PHB#0030[8:0]: phbRxeMrgFrstErrorStatus = 0000000000000000
[  345.067212157,3] PHB#0030[8:0]:       phbRxeMrgErrorLog0 = 0000000000000000
[  345.067255830,3] PHB#0030[8:0]:       phbRxeMrgErrorLog1 = 0000000000000000
[  345.067296445,3] PHB#0030[8:0]:     phbRxeTceErrorStatus = 2000000000000000
[  345.067337662,3] PHB#0030[8:0]: phbRxeTceFrstErrorStatus = 2000000000000000
[  345.067388492,3] PHB#0030[8:0]:       phbRxeTceErrorLog0 = c0000000000001fa
[  345.067439384,3] PHB#0030[8:0]:       phbRxeTceErrorLog1 = 0000000000000000
[  345.067485879,3] PHB#0030[8:0]:        phbPblErrorStatus = 0000000000020000
[  345.067528771,3] PHB#0030[8:0]:   phbPblFirstErrorStatus = 0000000000020000
[  345.067571445,3] PHB#0030[8:0]:          phbPblErrorLog0 = 0000000000000000
[  345.067612425,3] PHB#0030[8:0]:          phbPblErrorLog1 = 0000000000000000
[  345.067663057,3] PHB#0030[8:0]:      phbPcieDlpErrorLog1 = 0000000000000000
[  345.067713544,3] PHB#0030[8:0]:      phbPcieDlpErrorLog2 = 0000000000000000
[  345.067756077,3] PHB#0030[8:0]:    phbPcieDlpErrorStatus = 0000000000000000
[  345.067804777,3] PHB#0030[8:0]:       phbRegbErrorStatus = 0000004000000000
[  345.067846597,3] PHB#0030[8:0]:  phbRegbFirstErrorStatus = 0000004000000000
[  345.067887318,3] PHB#0030[8:0]:         phbRegbErrorLog0 = 8800000c00000000
[  345.067932570,3] PHB#0030[8:0]:         phbRegbErrorLog1 = 0000000007011000
[  345.067980596,3] PHB#0030[8:0]:                PEST[506] = 8300b03800000000 8000000000000000
[  345.068048045,3] PHB#0030[8:0]:                PEST[507] = 8300b03800000000 8000000000000000
[  345.068099305,3] PHB#0030[8:0]:                PEST[511] = 3740002a01000000 0000000000000000
[  140.099956] EEH: Recovering PHB#30-PE#1fa
[  140.100001] EEH: PE location: N/A, PHB location: N/A
[  140.100032] EEH: Frozen PHB#30-PE#1fa detected
[  140.100071] EEH: Call Trace:
[  140.100096] EEH: [00000000ffe66fe6] __eeh_send_failure_event+0xa4/0x180
[  140.100147] EEH: [00000000cde11bd8] eeh_dev_check_failure+0x3d8/0x740
[  140.100183] EEH: [0000000063d788bb] nvme_timeout+0x288/0x750 [nvme]
[  140.100223] EEH: [0000000043ae3de7] blk_mq_handle_expired+0x98/0xf0
[  140.100259] EEH: [0000000018e27476] bt_iter+0xec/0x120
[  140.100293] EEH: [00000000ffb65dd3] blk_mq_queue_tag_busy_iter+0x414/0xa60
[  140.100331] EEH: [0000000024de88c5] blk_mq_timeout_work+0x1c8/0x230
[  140.100848] EEH: [000000003e6b6b37] process_one_work+0x1f0/0x520
[  140.101347] EEH: [00000000f4e3d3a4] worker_thread+0x33c/0x510
EEH: Recovering PHB#30-PE#1fa[  140.102032] EEH: [00000000ee3ba07d] kthread+0x150/0x160
[  345.069730133,3] PHB#0030[8:0]: brdgCtl        = 00000002
[  345.069770540,3] PHB#0030[8:0]:             deviceStatus = 00060020
[  345.069818070,3] PHB#0030[8:0]:               slotStatus = 00402000
[  345.069857447,3] PHB#0030[8:0]:               linkStatus = a0830008
[  345.069900881,3] PHB#0030[8:0]:             devCmdStatus = 00100107
[  140[  345.069940313,3] PHB#0030[8:0]:             devSecStatus = 00000800
.102037][  345.069989240,3] PHB#0030[8:0]:          rootErrorStatus = 00000000
 EEH: [0[  345.070039547,3] PHB#0030[8:0]:          corrErrorStatus = 00000000
00000009f50efe6] start_k[  345.070080475,3] PHB#0030[8:0]:        uncorrErrorStatus = 00000000
ernel_th[  345.070161917,3] PHB#0030[8:0]:                   devctl = 00000020
read+0x14/0x18
[  345.070208284,3] PHB#0030[8:0]:                  devStat = 00000006
[  345.070273572,3] PHB#0030[8:0]:                  tlpHdr1 = 00000000
[  345.070317083,3] PHB#0030[8:0]:                  tlpHdr2 = 00000000
[  345.070356757,3] PHB#0030[8:0]:                  tlpHdr3 = 00000000
[  345.070393297,3] PHB#0030[8:0]:                  tlpHdr4 = 00000000
[  345.070427096,3] PHB#0030[8:0]:                 sourceId = 00000000
[  345.070463542,3] PHB#0030[8:0]:                     nFir = 0000000000000000
[  345.070515927,3] PHB#0030[8:0]:                 nFirMask = 0030001c00000000
[  345.070562368,3] PHB#0030[8:0]:                  nFirWOF = 0000000000000000
[  140.1[  345.070608115,3] PHB#0030[8:0]:                 phbPlssr = 0000001c00000000
02041] EEH: This[  345.070654917,3] PHB#0030[8:0]:                   phbCsr = 0000001c00000000
 PCI device has [  345.070702546,3] PHB#0030[8:0]:                   lemFir = 0000000100000080
failed 1 times i[  345.070753051,3] PHB#0030[8:0]:             lemErrorMask = 0000000000000000
[  345.070805729,3] PHB#0030[8:0]:                   lemWOF = 0000000000000080
[  345.070852396,3] PHB#0030[8:0]:           phbErrorStatus = 0000028000000000
[  345.070898231,3] PHB#0030[8:0]:      phbFirstErrorStatus = 0000020000000000
[  345.070939973,3] PHB#0030[8:0]:             phbErrorLog0 = 2148000098000240
[  345.070978718,3] PHB#0030[8:0]:             phbErrorLog1 = a008400000000000
[  345.071017848,3] PHB#0030[8:0]:        phbTxeErrorStatus = 0000000000000000
[  345.071060984,3] PHB#0030[8:0]:   phbTxeFirstErrorStatus = 0000000000000000
[  345.071111129,3] PHB#0030[8:0]:          phbTxeErrorLog0 = 0000000000000000
[  345.071159107,3] PHB#0030[8:0]:          phbTxeErrorLog1 = 0000000000000000
[  345.071206324,3] PHB#0030[8:0]:     phbRxeArbErrorStatus = 0000000000000000
[  345.071261659,3] PHB#0030[8:0]: phbRxeArbFrstErrorStatus = 0000000000000000
n the last hour [  345.071306657,3] PHB#0030[8:0]:       phbRxeArbErrorLog0 = 0000000000000000
[  345.071357111,3] PHB#0030[8:0]:       phbRxeArbErrorLog1 = 0000000000000000
[  345.071405231,3] PHB#0030[8:0]:     phbRxeMrgErrorStatus = 0000000000000000
[  345.071452755,3] PHB#0030[8:0]: phbRxeMrgFrstErrorStatus = 0000000000000000
[  345.071499236,3] PHB#0030[8:0]:       phbRxeMrgErrorLog0 = 0000000000000000
[  345.071543098,3] PHB#0030[8:0]:       phbRxeMrgErrorLog1 = 0000000000000000
[  345.071582643,3] PHB#0030[8:0]:     phbRxeTceErrorStatus = 2000000000000000
[  345.071623042,3] PHB#0030[8:0]: phbRxeTceFrstErrorStatus = 2000000000000000
[  345.071697314,3] PHB#0030[8:0]:       phbRxeTceErrorLog0 = c0000000000001fa
[  345.071745637,3] PHB#0030[8:0]:       phbRxeTceErrorLog1 = 0000000000000000
[  345.071791896,3] PHB#0030[8:0]:        phbPblErrorStatus = 0000000000020000
[  345.071835205,3] PHB#0030[8:0]:   phbPblFirstErrorStatus = 0000000000020000
[  345.071878565,3] PHB#0030[8:0]:          phbPblErrorLog0 = 0000000000000000
[  345.071923843,3] PHB#0030[8:0]:          phbPblErrorLog1 = 0000000000000000
[  345.071972070,3] PHB#0030[8:0]:      phbPcieDlpErrorLog1 = 0000000000000000
[  345.072031244,3] PHB#0030[8:0]:      phbPcieDlpErrorLog2 = 0000000000000000
[  345.072077340,3] PHB#0030[8:0]:    phbPcieDlpErrorStatus = 0000000000000000
[  345.072133718,3] PHB#0030[8:0]:       phbRegbErrorStatus = 0000004000000000
[  345.072184534,3] PHB#0030[8:0]:  phbRegbFirstErrorStatus = 0000004000000000
[  345.072228261,3] PHB#0030[8:0]:         phbRegbErrorLog0 = 8800000c00000000
[  345.072277480,3] PHB#0030[8:0]:         phbRegbErrorLog1 = 0000000007011000
[  345.072324956,3] PHB#0030[8:0]:                PEST[506] = 8300b03800000000 8000000000000000
[  345.072384578,3] PHB#0030[8:0]:                PEST[507] = 8300b03800000000 8000000000000000
[  345.072447509,3] PHB#0030[8:0]:                PEST[511] = 3740002a01000000 0000000000000000
and will be permanently disabled after 5 failures.
[  140.102044] EEH: Notify device drivers to shutdown
[  140.102046] EEH: Beginning: 'error_detected(IO frozen)'
[  140.102050] PCI 0030:0e:00.0#01fa: EEH: Invoking nvme->error_detected(IO frozen)
[  140.102055] nvme nvme1: frozen state error detected, reset controller

EEH: PE location: N/A, PHB location: N/A
EEH: Frozen PHB#30-PE#1fa detected
EEH: Call Trace:
EEH: [00000000ffe66fe6] __eeh_send_failure_event+0xa4/0x180
EEH: [00000000cde11bd8] eeh_dev_check_failure+0x3d8/0x740
EEH: [0000000063d788bb] nvme_timeout+0x288/0x750 [nvme]
EEH: [0000000043ae3de7] blk_mq_handle_expired+0x98/0xf0
EEH: [0000000018e27476] bt_iter+0xec/0x120
EEH: [00000000ffb65dd3] blk_mq_queue_tag_busy_iter+0x414/0xa60
EEH: [0000000024de88c5] blk_mq_timeout_work+0x1c8/0x230
EEH: [000000003e6b6b37] process_one_work+0x1f0/0x520
EEH: [00000000f4e3d3a4] worker_thread+0x33c/0x510
EEH: [00000000ee3ba07d] kthread+0x150/0x160
EEH: [000000009f50efe6] start_kernel_thread+0x14/0x18
EEH: This PCI device has failed 1 times in the last hour and will be permanently disabled after 5 failures.
EEH: Notify device drivers to shutdown
EEH: Beginning: 'error_detected(IO frozen)'
PCI 0030:0e:00.0#01fa: EEH: Invoking nvme->error_detected(IO frozen)
nvme nvme1: frozen state error detected, reset controller
[  140.242588] nvme1n1: I/O Cmd(0x2) @ LBA 1875384832, 128 blocks, I/O Error (sct 0x3 / sc 0x71) 
[  140.243142] I/O error, dev nvme1n1, sector 1875384832 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
nvme1n1: I/O Cmd(0x2) @ LBA 1875384832, 128 blocks, I/O Error (sct 0x3 / sc 0x71) 
I/O error, dev nvme1n1, sector 1875384832 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
[  140.271706] nvme nvme1: Failed to get ANA log: -4
nvme nvme1: Failed to get ANA log: -4
[  140.291182] PCI 0030:0e:00.0#01fa: EEH: nvme driver reports: 'need reset'
[  140.291190] EEH: Finished:'error_detected(IO frozen)' with aggregate recovery state:'need reset'
[  140.292301] EEH: Collect temporary log
[  140.292840] EEH: of node=0030:0e:00.0
[  140.293359] EEH: PCI device/vendor: a808144d
[  140.293884] EEH: PCI cmd/status register: 00100142
[  140.294394] EEH: PCI-E capabilities and status follow:
[  140.294912] EEH: PCI-E 00: 0002b010 10648fc1 00002830 00437043 
[  140.295437] EEH: PCI-E 10: 10430000 00000000 00000000 00000000 
[  140.295950] EEH: PCI-E 20: 00000000 
[  140.296471] EEH: PCI-E AER capability register set follows:
[  140.297001] EEH: PCI-E AER 00: 14820001 00000000 00400000 00462030 
[  140.297533] EEH: PCI-E AER 10: 00000000 0000e000 000003e0 00000000 
[  140.298071] EEH: PCI-E AER 20: 00000000 00000000 00000000 00000000 
[  140.298591] EEH: PCI-E AER 30: 00000000 00000000 
[  140.299113] PHB4 PHB#48 Diag-data (Version: 1)
[  140.299636] brdgCtl:    00000002
[  140.300158] RootSts:    00060020 00402000 a0830008 00100107 00000800
[  140.300700] PhbSts:     0000001c00000000 0000001c00000000
[  140.301319] Lem:        0000000100000080 0000000000000000 0000000000000080
PCI 0030:0e:00.0#01fa: EEH: nvme driver reports: 'need reset'[  140.302109] PhbErr:     0000028000000000 0000020000000000 2148000098000240 a008400000000000
[  140.302114] RxeTceErr:  2000000000000000 2000000000000000 c0000000000001fa 0000000000000000
[  140.302118] PblErr:     0000000000020000 0000000000020000 0000000000000000 0000000000000000
[  140.302121] RegbErr:    0000004000000000 0000004000000000 8800000c00000000 0000000007011000
[  140.302129] PE[1fa] A/B: 8300b03800000000 8000000000000000
[  140.302133] PE[..1fb] A/B: as above
[  140.302135] EEH: Reset without hotplug activity


	Thanks,

		Dan

