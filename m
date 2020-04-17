Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF2E1AE28D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 18:54:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493hz12Rq9zDrq8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 02:54:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 493hx262rrzDq8X
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 02:53:10 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E4D1AAB5C;
 Fri, 17 Apr 2020 16:53:06 +0000 (UTC)
Date: Fri, 17 Apr 2020 18:53:04 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Subject: ppc64 early slub caches have zero random value
Message-ID: <20200417165304.GF25468@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ni93GHxFvA+th69W"
Content-Disposition: inline
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
Cc: vbabka@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ni93GHxFvA+th69W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

instrumenting the kernel with the following patch

---
 mm/slub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/slub.c b/mm/slub.c
index d6787bbe0248..d40995d5f8ff 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3633,6 +3633,7 @@ static int kmem_cache_open(struct kmem_cache *s, slab_flags_t flags)
 	s->flags = kmem_cache_flags(s->size, flags, s->name, s->ctor);
 #ifdef CONFIG_SLAB_FREELIST_HARDENED
 	s->random = get_random_long();
+	pr_notice("Creating cache %s with s->random=%ld\n", s->name, s->random);
 #endif
 
 	if (!calculate_sizes(s, -1))

I get:

[    0.000000] Creating cache kmem_cache_node with s->random=0
[    0.000000] Creating cache kmem_cache with s->random=0
[    0.000000] Creating cache kmalloc-8 with s->random=0
[    0.000000] Creating cache kmalloc-16 with s->random=0
[    0.000000] Creating cache kmalloc-32 with s->random=0
[    0.000000] Creating cache kmalloc-64 with s->random=0
[    0.000000] Creating cache kmalloc-96 with s->random=0
[    0.000000] Creating cache kmalloc-128 with s->random=0
[    0.000000] Creating cache kmalloc-192 with s->random=-682532147323126958

The earliest caches created invariably end up with s->random of zero.
This is a problem for crash which does not recognize these as randomized
and fails to read them. While this can be addressed in crash is it
intended to create caches with zero random value in the kernel?

This is broken at least in the 5.4~5.7 range but it is not clear if this
ever worked. All examples of earlier kernels I have at hand use slab mm.

Thanks

Michal

--ni93GHxFvA+th69W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg.txt"

[    0.000000] Reserving 242MB of memory at 128MB for crashkernel (System RAM: 16384MB)
[    0.000000] hash-mmu: Page sizes from device-tree:
[    0.000000] hash-mmu: base_shift=12: shift=12, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=0
[    0.000000] hash-mmu: base_shift=12: shift=16, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=7
[    0.000000] hash-mmu: base_shift=12: shift=24, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=56
[    0.000000] hash-mmu: base_shift=16: shift=16, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=1
[    0.000000] hash-mmu: base_shift=16: shift=24, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=8
[    0.000000] hash-mmu: base_shift=24: shift=24, sllp=0x0100, avpnm=0x00000001, tlbiel=0, penc=0
[    0.000000] hash-mmu: base_shift=34: shift=34, sllp=0x0120, avpnm=0x000007ff, tlbiel=0, penc=3
[    0.000000] Page orders: linear mapping = 24, virtual = 16, io = 16, vmemmap = 24
[    0.000000] Using 1TB segments
[    0.000000] hash-mmu: Initializing hash mmu with SLB
[    0.000000] Linux version 5.7.0-rc1-1.g8f6a41f-default (geeko@buildhost) (gcc version 9.3.1 20200406 [revision 6db837a5288ee3ca5ec504fbd5a765817e556ac2] (SUSE Linux), GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.34.0.20200325-1) #1 SMP Fri Apr 17 10:39:25 UTC 2020 (8f6a41f)
[    0.000000] Found initrd at 0xc00000000da00000:0xc00000000e67d104
[    0.000000] Using pSeries machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Partition configured for 8 cpus.
[    0.000000] CPU maps initialized for 8 threads per core
[    0.000000]  (thread shift is 3)
[    0.000000] Allocated 4672 bytes for 8 pacas
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x400000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x80
[    0.000000] cpu_features      = 0x0001c07f8f5f91a7
[    0.000000]   possible        = 0x0003fbffcf5fb1a7
[    0.000000]   always          = 0x00000003800081a1
[    0.000000] cpu_user_features = 0xdc0065c2 0xefe00000
[    0.000000] mmu_features      = 0x7c006001
[    0.000000] firmware_features = 0x0000009fc45bfc57
[    0.000000] vmalloc start     = 0xc008000000000000
[    0.000000] IO start          = 0xc00a000000000000
[    0.000000] vmemmap start     = 0xc00c000000000000
[    0.000000] hash-mmu: ppc64_pft_size    = 0x1e
[    0.000000] hash-mmu: htab_hash_mask    = 0x7fffff
[    0.000000] -----------------------------------------------------
[    0.000000] numa:   NODE_DATA [mem 0x3fffa4900-0x3fffabfff]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] rfi-flush: patched 8 locations (mttrig type flush)
[    0.000000] link-stack-flush: software flush enabled.
[    0.000000] count-cache-flush: software flush disabled.
[    0.000000] stf-barrier: eieio barrier available
[    0.000000] stf-barrier: patched 59 entry locations (eieio barrier)
[    0.000000] stf-barrier: patched 8 exit locations (eieio barrier)
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:0 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:2 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:10 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:2 psize:2 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:2 psize:10 block size:8
[    0.000000] PPC64 nvram contains 15360 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] barrier-nospec: patched 454 locations
[    0.000000] Top of RAM: 0x400000000, Total RAM: 0x400000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x00000003ffffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x00000003ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000003ffffffff]
[    0.000000] On node 0 totalpages: 262144
[    0.000000]   Normal zone: 256 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 262144 pages, LIFO batch:3
[    0.000000] percpu: Embedded 11 pages/cpu s628504 r0 d92392 u1048576
[    0.000000] pcpu-alloc: s628504 r0 d92392 u1048576 alloc=1*1048576
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 261888
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinux-5.7.0-rc1-1.g8f6a41f-default root=UUID=04f3f652-7c85-470b-9d5f-490601f371f8 mitigations=auto quiet crashkernel=242M
[    0.000000] Dentry cache hash table entries: 2097152 (order: 8, 16777216 bytes, linear)
[    0.000000] Inode-cache hash table entries: 1048576 (order: 7, 8388608 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 0K/16777216K available (13888K kernel code, 1920K rwdata, 3904K rodata, 5312K init, 10708K bss, 432768K reserved, 0K cma-reserved)
[    0.000000] random: get_random_u64 called from kmem_cache_open+0x3c/0x5b0 with crng_init=0
[    0.000000] Creating cache kmem_cache_node with s->random=0
[    0.000000] Creating cache kmem_cache with s->random=0
[    0.000000] Creating cache kmalloc-8 with s->random=0
[    0.000000] Creating cache kmalloc-16 with s->random=0
[    0.000000] Creating cache kmalloc-32 with s->random=0
[    0.000000] Creating cache kmalloc-64 with s->random=0
[    0.000000] Creating cache kmalloc-96 with s->random=0
[    0.000000] Creating cache kmalloc-128 with s->random=0
[    0.000000] Creating cache kmalloc-192 with s->random=-682532147323126958
[    0.000000] Creating cache kmalloc-256 with s->random=-4450275237895082114
[    0.000000] Creating cache kmalloc-512 with s->random=-8216120605855811647
[    0.000000] Creating cache kmalloc-1k with s->random=3023409418682916639
[    0.000000] Creating cache kmalloc-2k with s->random=8688116594606049337
[    0.000000] Creating cache kmalloc-4k with s->random=5719268948356966269
[    0.000000] Creating cache kmalloc-8k with s->random=9017350774999750106
[    0.000000] Creating cache kmalloc-16k with s->random=-1633581168066990679
[    0.000000] Creating cache kmalloc-32k with s->random=8946200670423934564
[    0.000000] Creating cache kmalloc-64k with s->random=-8292258876534674238
[    0.000000] Creating cache kmalloc-128k with s->random=-5768239887069467005
[    0.000000] Creating cache kmalloc-rcl-8 with s->random=8677949242001423961
[    0.000000] Creating cache kmalloc-rcl-16 with s->random=3656454206913485322
[    0.000000] Creating cache kmalloc-rcl-32 with s->random=-5614236440376697393
[    0.000000] Creating cache kmalloc-rcl-64 with s->random=5328381572221470592
[    0.000000] Creating cache kmalloc-rcl-96 with s->random=3528453107027421252
[    0.000000] Creating cache kmalloc-rcl-128 with s->random=-4699639225824269184
[    0.000000] Creating cache kmalloc-rcl-192 with s->random=4178730914206571436
[    0.000000] Creating cache kmalloc-rcl-256 with s->random=894787591526563799
[    0.000000] Creating cache kmalloc-rcl-512 with s->random=8232003026267128475
[    0.000000] Creating cache kmalloc-rcl-1k with s->random=-7060211654717518603
[    0.000000] Creating cache kmalloc-rcl-2k with s->random=-3708114826314195672
[    0.000000] Creating cache kmalloc-rcl-4k with s->random=4334448109711490089
[    0.000000] Creating cache kmalloc-rcl-8k with s->random=-2247541083435111937
[    0.000000] Creating cache kmalloc-rcl-16k with s->random=-6178967980711810381
[    0.000000] Creating cache kmalloc-rcl-32k with s->random=-6037336661434189005
[    0.000000] Creating cache kmalloc-rcl-64k with s->random=-1197707244931275080
[    0.000000] Creating cache kmalloc-rcl-128k with s->random=-4163401045582729317
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=8, Nodes=32
[    0.000000] Creating cache pgtable-2^8 with s->random=-684905930742216405
[    0.000000] Creating cache pgtable-2^11 with s->random=7320663979580831049
[    0.000000] Creating cache vmap_area with s->random=-8928143040791635697
[    0.000000] ftrace: allocating 34382 entries in 13 pages
[    0.000000] ftrace: allocated 13 pages with 3 groups
[    0.000000] Creating cache task_group with s->random=-5889827648372608334
[    0.000000] Creating cache radix_tree_node with s->random=-721795434623682161
[    0.000000] Creating cache pool_workqueue with s->random=-4153082930134480658
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=8.
[    0.000000] 	Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.000000] Creating cache ftrace_event_field with s->random=5250787246489126028
[    0.000000] Creating cache trace_event_file with s->random=-2161988903706430258
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] pic: no ISA interrupt controller
[    0.000000] time_init: decrementer frequency = 512.000000 MHz
[    0.000000] time_init: processor frequency   = 3000.000000 MHz
[    0.000001] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.000002] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000003] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000006] clockevent: decrementer mult[83126f] shift[24] cpu[0]
[    0.000025] Console: colour dummy device 80x25
[    0.000026] printk: console [hvc0] enabled
[    0.000027] printk: bootconsole [udbg0] disabled
[    0.000031] Creating cache numa_policy with s->random=5612833991873399386
[    0.000047] pid_max: default: 32768 minimum: 301
[    0.000048] Creating cache pid with s->random=-5503274712566129451
[    0.000054] Creating cache anon_vma with s->random=7079621943543737173
[    0.000062] Creating cache anon_vma_chain with s->random=-6237881829697307973
[    0.000072] Creating cache thread_stack with s->random=6561190068110528880
[    0.000075] Creating cache cred_jar with s->random=-8230967800152696622
[    0.000078] Creating cache task_struct with s->random=4237100988043794749
[    0.000080] Creating cache sighand_cache with s->random=-487299785646731406
[    0.000083] Creating cache signal_cache with s->random=3380769007002782595
[    0.000085] Creating cache files_cache with s->random=-4168176904529936760
[    0.000088] Creating cache mm_struct with s->random=-5157797978094801626
[    0.000090] Creating cache vm_area_struct with s->random=-7791184229235199482
[    0.000096] Creating cache uts_namespace with s->random=8565621474741428298
[    0.000100] Creating cache buffer_head with s->random=-2861795827355465914
[    0.000107] LSM: Security Framework initializing
[    0.000110] Creating cache lsm_file_cache with s->random=-3179234836875123712
[    0.000134] Creating cache iint_cache with s->random=-8627455077137959121
[    0.000148] AppArmor: AppArmor initialized
[    0.000164] Creating cache names_cache with s->random=2461433891549163766
[    0.000166] Creating cache dentry with s->random=-5613483515855041195
[    0.000171] Creating cache inode_cache with s->random=-8912316728190466457
[    0.000175] Creating cache mnt_cache with s->random=-6183208492439391938
[    0.000193] Mount-cache hash table entries: 32768 (order: 2, 262144 bytes, linear)
[    0.000208] Mountpoint-cache hash table entries: 32768 (order: 2, 262144 bytes, linear)
[    0.000210] Creating cache kernfs_node_cache with s->random=-8598681540386838526
[    0.000225] Creating cache shmem_inode_cache with s->random=4187166345353464242
[    0.000262] Creating cache bdev_cache with s->random=-1295759978871393931
[    0.000279] Creating cache sigqueue with s->random=4074100588541674678
[    0.000288] Creating cache seq_file with s->random=-2861789879584080630
[    0.000294] Creating cache proc_inode_cache with s->random=-7846883835974479537
[    0.000297] Creating cache pde_opener with s->random=8279201431757447199
[    0.000312] Creating cache proc_dir_entry with s->random=-4337324708692406533
[    0.000464] Creating cache taskstats with s->random=79039101933852101
[    0.000469] Creating cache task_delay_info with s->random=-2857405736711448706
[    0.000605] Creating cache dtl with s->random=4867154487373824605
[    0.000607] EEH: pSeries platform initialized
[    0.000608] POWER9 performance monitor hardware support registered
[    0.000623] rcu: Hierarchical SRCU implementation.
[    0.000958] smp: Bringing up secondary CPUs ...
[    0.002417] smp: Brought up 1 node, 8 CPUs
[    0.002420] numa: Node 0 CPUs: 0-7
[    0.002421] Using small cores at SMT level
[    0.002421] Using shared cache scheduler topology
[    0.005927] node 0 initialised, 254934 pages in 0ms
[    0.006076] devtmpfs: initialized
[    0.007230] Creating cache net_namespace with s->random=4540190854457066711
[    0.007388] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.007391] futex hash table entries: 2048 (order: 2, 262144 bytes, linear)
[    0.007462] Creating cache fsnotify_mark_connector with s->random=3432667026619779554
[    0.007487] Creating cache file_lock_ctx with s->random=-646037793626371329
[    0.007499] Creating cache file_lock_cache with s->random=-6222512518793643571
[    0.007559] pinctrl core: initialized pinctrl subsystem
[    0.007631] thermal_sys: Registered thermal governor 'fair_share'
[    0.007632] thermal_sys: Registered thermal governor 'bang_bang'
[    0.007632] thermal_sys: Registered thermal governor 'step_wise'
[    0.007633] thermal_sys: Registered thermal governor 'user_space'
[    0.007646] Creating cache skbuff_head_cache with s->random=6245744942933025713
[    0.007652] Creating cache skbuff_fclone_cache with s->random=-5828661176825061789
[    0.007655] Creating cache sock_inode_cache with s->random=-8388828483106896299
[    0.007804] NET: Registered protocol family 16
[    0.007911] audit: initializing netlink subsys (disabled)
[    0.007952] audit: type=2000 audit(1587140812.000:1): state=initialized audit_enabled=0 res=1
[    0.008039] cpuidle: using governor ladder
[    0.008075] cpuidle: using governor menu
[    0.008104] RTAS daemon started
[    0.008178] pstore: Registered nvram as persistent store backend
[    0.009959] PCI: Probing PCI hardware
[    0.009960] EEH: No capable adapters found: recovery disabled.
[    0.009961] PCI: Probing PCI hardware done
[    0.010049] pseries-rng: Registering arch random hook.
[    0.010821] Creating cache user_namespace with s->random=-2811479172475174557
[    0.011283] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
[    0.011285] HugeTLB registered 16.0 GiB page size, pre-allocated 0 pages
[    0.011338] Creating cache khugepaged_mm_slot with s->random=8366493196367662663
[    0.013651] Creating cache biovec-64 with s->random=9115389382925880438
[    0.013663] Creating cache biovec-128 with s->random=-5128729811433091493
[    0.013674] Creating cache blkdev_ioc with s->random=-8902403292653914588
[    0.013719] Creating cache request_queue with s->random=-6330489230445526961
[    0.013844] iommu: Default domain type: Translated 
[    0.013871] vgaarb: loaded
[    0.013878] Creating cache dax_cache with s->random=3227607475278707131
[    0.013922] pps_core: LinuxPPS API ver. 1 registered
[    0.013923] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.013925] PTP clock support registered
[    0.013929] EDAC MC: Ver: 3.0.0
[    0.014084] NetLabel: Initializing
[    0.014084] NetLabel:  domain hash size = 128
[    0.014085] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.014094] NetLabel:  unlabeled traffic allowed by default
[    0.014151] clocksource: Switched to clocksource timebase
[    0.026760] Creating cache eventpoll_pwq with s->random=-6722169836566558232
[    0.026843] VFS: Disk quotas dquot_6.6.0
[    0.026848] Creating cache dquot with s->random=610394149037654102
[    0.026862] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
[    0.026886] Creating cache hugetlbfs_inode_cache with s->random=-6105191376080207770
[    0.026979] AppArmor: AppArmor Filesystem Enabled
[    0.028157] Creating cache TCP with s->random=4175097125193116577
[    0.028161] Creating cache request_sock_TCP with s->random=-3178653132972566892
[    0.028165] Creating cache tw_sock_TCP with s->random=-6199862738621282866
[    0.028170] Creating cache RAW with s->random=-8865319605991726135
[    0.028174] Creating cache PING with s->random=1881746686089790523
[    0.028177] NET: Registered protocol family 2
[    0.028285] tcp_listen_portaddr_hash hash table entries: 8192 (order: 1, 131072 bytes, linear)
[    0.028297] TCP established hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.028462] TCP bind hash table entries: 65536 (order: 4, 1048576 bytes, linear)
[    0.028552] TCP: Hash tables configured (established 131072 bind 65536)
[    0.028575] Creating cache request_sock_subflow with s->random=-4837009552022895495
[    0.028614] Creating cache MPTCP with s->random=-1875573528812351694
[    0.028620] UDP hash table entries: 8192 (order: 2, 262144 bytes, linear)
[    0.028642] UDP-Lite hash table entries: 8192 (order: 2, 262144 bytes, linear)
[    0.028687] Creating cache ip4-frags with s->random=-2331914110882952759
[    0.028695] NET: Registered protocol family 1
[    0.028699] NET: Registered protocol family 44
[    0.028700] PCI: CLS 0 bytes, default 128
[    0.028725] Trying to unpack rootfs image as initramfs...
[    1.198082] IOMMU table initialized, virtual merging enabled
[    1.206475] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs
[    1.206624] Creating cache pid_namespace with s->random=5534029552047648056
[    1.207196] Initialise system trusted keyrings
[    1.207204] Key type blacklist registered
[    1.207256] workingset: timestamp_bits=38 max_order=18 bucket_order=0
[    1.208335] zbud: loaded
[    1.208360] Creating cache dio with s->random=1709207810790414071
[    1.208375] Creating cache dnotify_struct with s->random=-3908491473340927328
[    1.208414] Creating cache userfaultfd_ctx_cache with s->random=-206340315026578208
[    1.208439] Creating cache kioctx with s->random=-8095026578118519768
[    1.208454] Creating cache mbcache with s->random=-5820920612882362996
[    1.208481] Creating cache ext4_extent_status with s->random=-8023381098093397840
[    1.208506] Creating cache ext4_pending_reservation with s->random=1028717145534536250
[    1.208547] Creating cache ext4_io_end with s->random=9011478059017515428
[    1.208569] Creating cache ext4_system_zone with s->random=312757428614402512
[    1.208601] Creating cache ext4_allocation_context with s->random=5200211615108214380
[    1.208619] Creating cache ext4_inode_cache with s->random=4494406753909155098
[    1.208634] Creating cache jbd2_revoke_table_s with s->random=1076856969404692162
[    1.208678] Creating cache jbd2_journal_head with s->random=-3796901197331335742
[    1.208730] Creating cache mqueue_inode_cache with s->random=-6553612240385315425
[    1.208774] integrity: Platform Keyring initialized
[    1.216443] Key type asymmetric registered
[    1.216444] Asymmetric key parser 'x509' registered
[    1.216450] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 247)
[    1.216500] io scheduler mq-deadline registered
[    1.216501] io scheduler kyber registered
[    1.216507] Creating cache bfq_io_cq with s->random=2021700185545580388
[    1.216524] io scheduler bfq registered
[    1.216636] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    1.216636] rpaphp: RPA HOT Plug PCI Controller Driver version: 0.1
[    1.216863] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.217010] pseries_rng: Registering IBM pSeries RNG driver
[    1.217183] mousedev: PS/2 mouse device common for all mice
[    1.217271] pseries_idle_driver registered
[    1.217322] ledtrig-cpu: registered to indicate activity on CPUs
[    1.217344] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: device disabled
[    1.221372] hid: raw HID events driver (C) Jiri Kosina
[    1.221395] drop_monitor: Initializing network drop monitor service
[    1.221448] Creating cache TCPv6 with s->random=-622875134133198379
[    1.221461] Creating cache request_sock_TCPv6 with s->random=-8784401180570607918
[    1.221476] Creating cache tw_sock_TCPv6 with s->random=-4935988401943116950
[    1.221492] Creating cache UDPv6 with s->random=3680388319114781681
[    1.221508] Creating cache RAWv6 with s->random=-1649747059326962408
[    1.221521] Creating cache PINGv6 with s->random=4005304637426188970
[    1.221534] NET: Registered protocol family 10
[    1.221675] Creating cache ip6-frags with s->random=2412212811150569564
[    1.221697] Creating cache MPTCPv6 with s->random=-4388019009269183953
[    1.226272] Segment Routing with IPv6
[    1.226273] RPL Segment Routing with IPv6
[    1.226289] NET: Registered protocol family 15
[    1.227044] registered taskstats version 1
[    1.227047] Loading compiled-in X.509 certificates
[    1.228094] Loaded X.509 cert 'Unsupported: 20a8b0cf2d570fb2c20316bf6f6d9681f4981f2c'
[    1.228110] zswap: loaded using pool lzo/zbud
[    1.228170] page_owner is disabled
[    1.228200] Key type ._fscrypt registered
[    1.228201] Key type .fscrypt registered
[    1.228201] Key type fscrypt-provisioning registered
[    1.228203] Creating cache fsverity_info with s->random=7862277131872623291
[    1.228231] pstore: Using crash dump compression: lzo
[    1.231862] Key type big_key registered
[    1.233316] Key type encrypted registered
[    1.233319] AppArmor: AppArmor sha1 policy hashing enabled
[    1.233324] ima: No TPM chip found, activating TPM-bypass!
[    1.233326] ima: Allocated hash algorithm: sha256
[    1.233334] ima: No architecture policies found
[    1.233344] evm: Initialising EVM extended attributes:
[    1.233344] evm: security.selinux
[    1.233345] evm: security.apparmor
[    1.233345] evm: security.ima
[    1.233346] evm: security.capability
[    1.233346] evm: HMAC attrs: 0x1
[    1.234799] Freeing unused kernel memory: 5312K
[    1.294172] Run /init as init process
[    1.294173]   with arguments:
[    1.294173]     /init
[    1.294174]   with environment:
[    1.294175]     HOME=/
[    1.294175]     TERM=linux
[    1.294176]     BOOT_IMAGE=/boot/vmlinux-5.7.0-rc1-1.g8f6a41f-default
[    1.294176]     crashkernel=242M
[    1.364704] systemd[1]: systemd 234 running in system mode. (+PAM -AUDIT +SELINUX -IMA +APPARMOR -SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT -GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 -IDN default-hierarchy=hybrid)
[    1.364805] systemd[1]: Detected architecture ppc64-le.
[    1.364808] systemd[1]: Running in initial RAM disk.
[    1.364822] systemd[1]: No hostname configured.
[    1.364827] systemd[1]: Set hostname to <localhost>.
[    1.403506] random: systemd: uninitialized urandom read (16 bytes read)
[    1.403538] systemd[1]: Listening on udev Control Socket.
[    1.403574] random: systemd: uninitialized urandom read (16 bytes read)
[    1.403608] systemd[1]: Listening on Journal Socket.
[    1.403620] random: systemd: uninitialized urandom read (16 bytes read)
[    1.403635] systemd[1]: Listening on udev Kernel Socket.
[    1.403647] systemd[1]: Reached target Swap.
[    1.403676] systemd[1]: Listening on Journal Socket (/dev/log).
[    1.434571] SCSI subsystem initialized
[    1.436041] alua: device handler registered
[    1.437019] emc: device handler registered
[    1.438002] rdac: device handler registered
[    1.448668] Creating cache dm_uevent with s->random=4627249753959491065
[    1.448688] device-mapper: uevent: version 1.0.3
[    1.448700] Creating cache kcopyd_job with s->random=6156527231955797713
[    1.448748] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
[    1.670611] synth uevent: /devices/vio: failed to send uevent
[    1.670615] vio vio: uevent: failed to send synthetic uevent
[    1.670683] synth uevent: /devices/vio/4000: failed to send uevent
[    1.670685] vio 4000: uevent: failed to send synthetic uevent
[    1.670702] synth uevent: /devices/vio/4001: failed to send uevent
[    1.670707] vio 4001: uevent: failed to send synthetic uevent
[    1.670723] synth uevent: /devices/vio/4002: failed to send uevent
[    1.670724] vio 4002: uevent: failed to send synthetic uevent
[    1.670739] synth uevent: /devices/vio/4004: failed to send uevent
[    1.670740] vio 4004: uevent: failed to send synthetic uevent
[    1.702827] ibmvfc: IBM Virtual Fibre Channel Driver version: 1.0.11 (April 12, 2013)
[    1.703278] scsi host0: IBM POWER Virtual FC Adapter
[    1.703285] Creating cache scsi_sense_cache with s->random=6335587192992232961
[    1.703730] ibmvfc 30000003: Partner initialization complete
[    1.711799] ibmvfc 30000003: Host partition: VIOS, device: vfchost8 U78D3.001.WZS02HG-P1-C8-T1 U9008.22L.787FE9A-V1-C16 max sectors 8192
[    1.713954] random: crng init done
[    1.713955] random: 7 urandom warning(s) missed due to ratelimiting
[    1.754794] memmap_init_zone_device initialised 65280 pages in 0ms
[    1.754996] pmem0: detected capacity change from 0 to 4278190080
[    1.777156] scsi 0:0:0:0: Direct-Access     NETAPP   LUN C-Mode       9600 PQ: 0 ANSI: 5
[    1.778164] scsi 0:0:1:0: Direct-Access     NETAPP   LUN C-Mode       9600 PQ: 0 ANSI: 5
[    1.779041] scsi 0:0:2:0: Direct-Access     NETAPP   LUN C-Mode       9600 PQ: 0 ANSI: 5
[    1.780095] scsi 0:0:3:0: Direct-Access     NETAPP   LUN C-Mode       9600 PQ: 0 ANSI: 5
[    1.780856] scsi 0:0:4:0: Direct-Access     NETAPP   LUN C-Mode       9600 PQ: 0 ANSI: 5
[    1.781895] scsi 0:0:5:0: Direct-Access     NETAPP   LUN C-Mode       9600 PQ: 0 ANSI: 5
[    1.782795] scsi 0:0:6:0: Direct-Access     NETAPP   LUN C-Mode       9600 PQ: 0 ANSI: 5
[    1.783665] scsi 0:0:7:0: Direct-Access     NETAPP   LUN C-Mode       9600 PQ: 0 ANSI: 5
[    1.784268] scsi 0:0:0:0: alua: supports implicit TPGS
[    1.784273] scsi 0:0:0:0: alua: device t10.NETAPP   LUN 80-AK+MDSGOT        port group 3e8 rel port 3
[    1.784363] scsi 0:0:0:0: Attached scsi generic sg0 type 0
[    1.784422] scsi 0:0:1:0: alua: supports implicit TPGS
[    1.784426] scsi 0:0:1:0: alua: device t10.NETAPP   LUN 80-AK+MDSGOT        port group 3e9 rel port 7
[    1.784502] scsi 0:0:1:0: Attached scsi generic sg1 type 0
[    1.784560] scsi 0:0:2:0: alua: supports implicit TPGS
[    1.784564] scsi 0:0:2:0: alua: device t10.NETAPP   LUN 80-AK+MDSGOT        port group 3e8 rel port 1
[    1.784645] scsi 0:0:2:0: Attached scsi generic sg2 type 0
[    1.784701] scsi 0:0:3:0: alua: supports implicit TPGS
[    1.784705] scsi 0:0:3:0: alua: device t10.NETAPP   LUN 80-AK+MDSGOT        port group 3e8 rel port 2
[    1.784780] scsi 0:0:3:0: Attached scsi generic sg3 type 0
[    1.784837] scsi 0:0:4:0: alua: supports implicit TPGS
[    1.784844] scsi 0:0:4:0: alua: device t10.NETAPP   LUN 80-AK+MDSGOT        port group 3e8 rel port 4
[    1.784916] scsi 0:0:4:0: Attached scsi generic sg4 type 0
[    1.784978] scsi 0:0:5:0: alua: supports implicit TPGS
[    1.784981] scsi 0:0:5:0: alua: device t10.NETAPP   LUN 80-AK+MDSGOT        port group 3e9 rel port 5
[    1.785055] scsi 0:0:5:0: Attached scsi generic sg5 type 0
[    1.785110] scsi 0:0:6:0: alua: supports implicit TPGS
[    1.785113] scsi 0:0:6:0: alua: device t10.NETAPP   LUN 80-AK+MDSGOT        port group 3e9 rel port 6
[    1.785188] scsi 0:0:6:0: Attached scsi generic sg6 type 0
[    1.785245] scsi 0:0:7:0: alua: supports implicit TPGS
[    1.785248] scsi 0:0:7:0: alua: device t10.NETAPP   LUN 80-AK+MDSGOT        port group 3e9 rel port 8
[    1.785320] scsi 0:0:7:0: Attached scsi generic sg7 type 0
[    1.800008] sd 0:0:1:0: Power-on or device reset occurred
[    1.800018] sd 0:0:3:0: Power-on or device reset occurred
[    1.800021] sd 0:0:0:0: Power-on or device reset occurred
[    1.800085] sd 0:0:4:0: Power-on or device reset occurred
[    1.800093] sd 0:0:2:0: Power-on or device reset occurred
[    1.800174] sd 0:0:5:0: Power-on or device reset occurred
[    1.800246] sd 0:0:6:0: Power-on or device reset occurred
[    1.800290] sd 0:0:7:0: Power-on or device reset occurred
[    1.834684] sd 0:0:6:0: [sdg] 134221824 512-byte logical blocks: (68.7 GB/64.0 GiB)
[    1.834686] sd 0:0:6:0: [sdg] 4096-byte physical blocks
[    1.834780] sd 0:0:6:0: [sdg] Write Protect is off
[    1.834782] sd 0:0:6:0: [sdg] Mode Sense: c7 00 00 08
[    1.834960] sd 0:0:6:0: [sdg] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    1.835278] sd 0:0:6:0: [sdg] Optimal transfer size 65536 bytes
[    1.844320] sd 0:0:0:0: alua: transition timeout set to 120 seconds
[    1.844324] sd 0:0:0:0: alua: port group 3e8 state A non-preferred supports TolUsNA
[    1.844342] sd 0:0:1:0: alua: transition timeout set to 120 seconds
[    1.844345] sd 0:0:1:0: alua: port group 3e9 state N non-preferred supports TolUsNA
[    1.844648] sd 0:0:5:0: [sdf] 134221824 512-byte logical blocks: (68.7 GB/64.0 GiB)
[    1.844651] sd 0:0:5:0: [sdf] 4096-byte physical blocks
[    1.844713] sd 0:0:2:0: [sdd] 134221824 512-byte logical blocks: (68.7 GB/64.0 GiB)
[    1.844715] sd 0:0:2:0: [sdd] 4096-byte physical blocks
[    1.844743] sd 0:0:4:0: [sde] 134221824 512-byte logical blocks: (68.7 GB/64.0 GiB)
[    1.844746] sd 0:0:4:0: [sde] 4096-byte physical blocks
[    1.844748] sd 0:0:3:0: [sdc] 134221824 512-byte logical blocks: (68.7 GB/64.0 GiB)
[    1.844750] sd 0:0:3:0: [sdc] 4096-byte physical blocks
[    1.844764] sd 0:0:1:0: [sdb] 134221824 512-byte logical blocks: (68.7 GB/64.0 GiB)
[    1.844765] sd 0:0:0:0: [sda] 134221824 512-byte logical blocks: (68.7 GB/64.0 GiB)
[    1.844767] sd 0:0:5:0: [sdf] Write Protect is off
[    1.844767] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    1.844768] sd 0:0:1:0: [sdb] 4096-byte physical blocks
[    1.844771] sd 0:0:5:0: [sdf] Mode Sense: c7 00 00 08
[    1.844838] sd 0:0:2:0: [sdd] Write Protect is off
[    1.844839] sd 0:0:3:0: [sdc] Write Protect is off
[    1.844841] sd 0:0:2:0: [sdd] Mode Sense: c7 00 00 08
[    1.844842] sd 0:0:3:0: [sdc] Mode Sense: c7 00 00 08
[    1.844850] sd 0:0:4:0: [sde] Write Protect is off
[    1.844852] sd 0:0:4:0: [sde] Mode Sense: c7 00 00 08
[    1.844872] sd 0:0:0:0: [sda] Write Protect is off
[    1.844875] sd 0:0:0:0: [sda] Mode Sense: c7 00 00 08
[    1.844876] sd 0:0:1:0: [sdb] Write Protect is off
[    1.844879] sd 0:0:1:0: [sdb] Mode Sense: c7 00 00 08
[    1.844987] sd 0:0:5:0: [sdf] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    1.845067] sd 0:0:3:0: [sdc] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    1.845070] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    1.845073] sd 0:0:4:0: [sde] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    1.845074] sd 0:0:2:0: [sdd] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    1.845099] sd 0:0:1:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    1.845338] sd 0:0:5:0: [sdf] Optimal transfer size 65536 bytes
[    1.845478] sd 0:0:3:0: [sdc] Optimal transfer size 65536 bytes
[    1.845490] sd 0:0:0:0: [sda] Optimal transfer size 65536 bytes
[    1.845491] sd 0:0:1:0: [sdb] Optimal transfer size 65536 bytes
[    1.845504] sd 0:0:4:0: [sde] Optimal transfer size 65536 bytes
[    1.845506] sd 0:0:2:0: [sdd] Optimal transfer size 65536 bytes
[    1.854658] sd 0:0:7:0: [sdh] 134221824 512-byte logical blocks: (68.7 GB/64.0 GiB)
[    1.854659] sd 0:0:7:0: [sdh] 4096-byte physical blocks
[    1.854759] sd 0:0:7:0: [sdh] Write Protect is off
[    1.854760] sd 0:0:7:0: [sdh] Mode Sense: c7 00 00 08
[    1.854936] sd 0:0:7:0: [sdh] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    1.855305] sd 0:0:7:0: [sdh] Optimal transfer size 65536 bytes
[    1.906885]  sda: sda1 sda2 sda3 sda4
[    1.906956]  sde: sde1 sde2 sde3 sde4
[    1.907073]  sdg: sdg1 sdg2 sdg3 sdg4
[    1.907085]  sdc: sdc1 sdc2 sdc3 sdc4
[    1.907086]  sdd: sdd1 sdd2 sdd3 sdd4
[    1.908601] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.908604] sd 0:0:4:0: [sde] Attached SCSI disk
[    1.908709] sd 0:0:2:0: [sdd] Attached SCSI disk
[    1.908710] sd 0:0:3:0: [sdc] Attached SCSI disk
[    1.908711] sd 0:0:6:0: [sdg] Attached SCSI disk
[    1.916847]  sdf: sdf1 sdf2 sdf3 sdf4
[    1.918249] sd 0:0:5:0: [sdf] Attached SCSI disk
[    1.936474]  sdh: sdh1 sdh2 sdh3 sdh4
[    1.936612]  sdb: sdb1 sdb2 sdb3 sdb4
[    1.938057] sd 0:0:7:0: [sdh] Attached SCSI disk
[    1.938249] sd 0:0:1:0: [sdb] Attached SCSI disk
[    2.197222] device-mapper: multipath service-time: version 0.3.0 loaded
[    2.424312] sd 0:0:0:0: alua: port group 3e8 state A non-preferred supports TolUsNA
[    2.424446] sd 0:0:0:0: alua: port group 3e8 state A non-preferred supports TolUsNA
[    2.634176] raid6: vpermxor8 gen() 23128 MB/s
[    2.804172] raid6: vpermxor4 gen() 20765 MB/s
[    2.974179] raid6: vpermxor2 gen() 16338 MB/s
[    3.144167] raid6: vpermxor1 gen() 12944 MB/s
[    3.314172] raid6: altivecx8 gen() 15452 MB/s
[    3.484171] raid6: altivecx4 gen() 14025 MB/s
[    3.654171] raid6: altivecx2 gen() 11608 MB/s
[    3.824184] raid6: altivecx1 gen()  9065 MB/s
[    3.994158] raid6: int64x8  gen()  8557 MB/s
[    4.164163] raid6: int64x8  xor()  5009 MB/s
[    4.334180] raid6: int64x4  gen()  9187 MB/s
[    4.504181] raid6: int64x4  xor()  4623 MB/s
[    4.674188] raid6: int64x2  gen()  6909 MB/s
[    4.844189] raid6: int64x2  xor()  3458 MB/s
[    5.014212] raid6: int64x1  gen()  5390 MB/s
[    5.184186] raid6: int64x1  xor()  2784 MB/s
[    5.184187] raid6: using algorithm vpermxor8 gen() 23128 MB/s
[    5.184187] raid6: using intx1 recovery algorithm
[    5.185314] xor: measuring software checksum speed
[    5.284164]    8regs     : 21017.600 MB/sec
[    5.384165]    8regs_prefetch: 17305.600 MB/sec
[    5.484164]    32regs    : 21286.400 MB/sec
[    5.584166]    32regs_prefetch: 18764.800 MB/sec
[    5.684158]    altivec   : 24409.600 MB/sec
[    5.684163] xor: using function: altivec (24409.600 MB/sec)
[    5.777820] Creating cache btrfs_inode with s->random=-1609665293556120064
[    5.777853] Creating cache btrfs_free_space_bitmap with s->random=3001399430860938491
[    5.777874] Creating cache btrfs_extent_buffer with s->random=4192633440693600797
[    5.777899] Creating cache btrfs_extent_map with s->random=5886950759387136798
[    5.777921] Creating cache btrfs_ordered_extent with s->random=-2939934085591402724
[    5.777943] Creating cache btrfs_delayed_node with s->random=2241570505357134211
[    5.778013] Btrfs loaded, crc32c=crc32c-vpmsum, assert=on
[    5.778596] BTRFS: device fsid 04f3f652-7c85-470b-9d5f-490601f371f8 devid 1 transid 131557 /dev/dm-2 scanned by systemd-udevd (589)
[    5.822484] BTRFS info (device dm-2): disk space caching is enabled
[    5.822487] BTRFS info (device dm-2): has skinny extents
[    6.267142] systemd-journald[247]: Received SIGTERM from PID 1 (systemd).
[    6.282890] printk: systemd: 13 output lines suppressed due to ratelimiting
[    6.475702] BTRFS info (device dm-2): disk space caching is enabled
[    6.553965] synth uevent: /devices/vio: failed to send uevent
[    6.553971] vio vio: uevent: failed to send synthetic uevent
[    6.555612] synth uevent: /devices/vio/4000: failed to send uevent
[    6.555614] vio 4000: uevent: failed to send synthetic uevent
[    6.555630] synth uevent: /devices/vio/4001: failed to send uevent
[    6.555631] vio 4001: uevent: failed to send synthetic uevent
[    6.555643] synth uevent: /devices/vio/4002: failed to send uevent
[    6.555644] vio 4002: uevent: failed to send synthetic uevent
[    6.555656] synth uevent: /devices/vio/4004: failed to send uevent
[    6.555657] vio 4004: uevent: failed to send synthetic uevent
[    6.593983] rtc-generic rtc-generic: registered as rtc0
[    6.594022] rtc-generic rtc-generic: setting system clock to 2020-04-17T16:26:59 UTC (1587140819)
[    6.625273] ibmveth: IBM Power Virtual Ethernet Driver 1.06
[    6.938178] BTRFS info (device dm-2): device fsid 04f3f652-7c85-470b-9d5f-490601f371f8 devid 1 moved old:/dev/mapper/3600a098038302d414b2b4d4453474f54-part2 new:/dev/dm-2
[    6.950870] BTRFS info (device dm-2): device fsid 04f3f652-7c85-470b-9d5f-490601f371f8 devid 1 moved old:/dev/dm-2 new:/dev/mapper/3600a098038302d414b2b4d4453474f54-part2
[    7.020686] BTRFS info (device dm-2): device fsid 04f3f652-7c85-470b-9d5f-490601f371f8 devid 1 moved old:/dev/mapper/3600a098038302d414b2b4d4453474f54-part2 new:/dev/dm-2
[    7.027658] BTRFS info (device dm-2): device fsid 04f3f652-7c85-470b-9d5f-490601f371f8 devid 1 moved old:/dev/dm-2 new:/dev/mapper/3600a098038302d414b2b4d4453474f54-part2
[    7.104176] Adding 16680832k swap on /dev/mapper/3600a098038302d414b2b4d4453474f54-part4.  Priority:-2 extents:1 across:16680832k FS
[    7.364362] sd 0:0:0:0: alua: port group 3e8 state A non-preferred supports TolUsNA
[    7.364505] sd 0:0:0:0: alua: port group 3e8 state A non-preferred supports TolUsNA
[    7.414281] systemd-journald[733]: Received request to flush runtime journal from PID 1
[    7.467788] SGI XFS with ACLs, security attributes, quota, no debug enabled
[    7.467809] Creating cache xfs_btree_cur with s->random=7735761358856689598
[    7.467853] Creating cache xfs_da_state with s->random=6112989617512747574
[    7.467881] Creating cache xf_trans with s->random=-2191918553625968478
[    7.467907] Creating cache xfs_buf_item with s->random=4451113513631940441
[    7.467949] Creating cache xfs_efd_item with s->random=-5406565213761125236
[    7.467987] Creating cache xfs_inode with s->random=-6062744386038367155
[    7.468021] Creating cache xfs_ili with s->random=318294186478923999
[    7.468053] Creating cache xfs_rud_item with s->random=-6355273768194334261
[    7.468081] Creating cache xfs_rui_item with s->random=-109130328408769294
[    7.468282] Creating cache xfs_buf with s->random=-8150857544660057377
[    7.468335] Creating cache xfs_dquot with s->random=6922850099784393491
[    7.468361] Creating cache xfs_dqtrx with s->random=-1052715615784540346
[    7.477654] audit: type=1400 audit(1587140820.380:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="ping" pid=1052 comm="apparmor_parser"
[    7.478212] XFS (dm-3): Mounting V5 Filesystem
[    7.488542] XFS (dm-3): Ending clean mount
[    7.489894] xfs filesystem being mounted at /home supports timestamps until 2038 (0x7fffffff)
[    7.522308] audit: type=1400 audit(1587140820.420:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=1090 comm="apparmor_parser"
[    7.541687] audit: type=1400 audit(1587140820.440:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=1099 comm="apparmor_parser"
[    7.541690] audit: type=1400 audit(1587140820.440:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=1099 comm="apparmor_parser"
[    7.578400] audit: type=1400 audit(1587140820.480:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="klogd" pid=1107 comm="apparmor_parser"
[    7.591944] audit: type=1400 audit(1587140820.490:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="syslogd" pid=1116 comm="apparmor_parser"
[    7.605365] audit: type=1400 audit(1587140820.510:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="syslog-ng" pid=1123 comm="apparmor_parser"
[    8.958572] process 'snapshot/usr/sbin/grub2-probe' started with executable stack
[    9.922842] Creating cache nf_conntrack with s->random=6164012457751464574
[   13.834327] NET: Registered protocol family 17
[   19.538906] Loading iSCSI transport class v2.0-870.
[   19.558008] FS-Cache: Loaded
[   19.606469] Creating cache rpc_inode_cache with s->random=-7708137671480393007
[   19.606559] RPC: Registered named UNIX socket transport module.
[   19.606560] RPC: Registered udp transport module.
[   19.606561] RPC: Registered tcp transport module.
[   19.606562] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   19.663898] FS-Cache: Netfs 'nfs' registered for caching
[   19.663988] Creating cache nfs_inode_cache with s->random=-8286266219950638121
[   19.664058] Creating cache nfs_direct_cache with s->random=-6334114063524883566
[   19.682333] Key type dns_resolver registered
[   19.875704] NFS: Registering the id_resolver key type
[   19.875715] Key type id_resolver registered
[   19.875717] Key type id_legacy registered

--ni93GHxFvA+th69W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-5.7.0-rc1-1.g8f6a41f-default"

#
# Automatically generated file; DO NOT EDIT.
# Linux/powerpc 5.7.0-rc1 Kernel Configuration
#

#
# Compiler: gcc (SUSE Linux) 9.3.1 20200406 [revision 6db837a5288ee3ca5ec504fbd5a765817e556ac2]
#
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=90301
CONFIG_LD_VERSION=234000000
# CONFIG_CC_IS_CLANG is not set
CONFIG_CLANG_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_HAS_ASM_GOTO=y
# CONFIG_TOOLS_SUPPORT_RELR is not set
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_WARN_MAYBE_UNINITIALIZED=y
# CONFIG_CC_DISABLE_WARN_MAYBE_UNINITIALIZED is not set
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION="-1.g8f6a41f-default"
# CONFIG_LOCALVERSION_AUTO is not set
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_XZ=y
# CONFIG_KERNEL_GZIP is not set
CONFIG_KERNEL_XZ=y
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_ARCH_HAS_TICK_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ_FULL is not set
CONFIG_CONTEXT_TRACKING=y
# CONFIG_CONTEXT_TRACKING_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
# CONFIG_TICK_CPU_ACCOUNTING is not set
# CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is not set
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_SCHED_THERMAL_PRESSURE=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=19
CONFIG_LOG_CPU_MAX_BUF_SHIFT=15
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_CC_HAS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
# CONFIG_MEMCG_SWAP_ENABLED is not set
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_BOOT_CONFIG=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=y
# CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is not set
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
# CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_BPF_LSM=y
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_USERFAULTFD=y
CONFIG_ARCH_HAS_MEMBARRIER_CALLBACKS=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
CONFIG_SLUB_MEMCG_SYSFS_ON=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_PPC64=y

#
# Processor support
#
CONFIG_PPC_BOOK3S_64=y
# CONFIG_PPC_BOOK3E_64 is not set
CONFIG_GENERIC_CPU=y
# CONFIG_POWER7_CPU is not set
# CONFIG_POWER8_CPU is not set
# CONFIG_POWER9_CPU is not set
# CONFIG_TARGET_CPU_BOOL is not set
CONFIG_PPC_BOOK3S=y
CONFIG_PPC_FPU=y
CONFIG_ALTIVEC=y
CONFIG_VSX=y
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_PPC_RADIX_MMU=y
CONFIG_PPC_RADIX_MMU_DEFAULT=y
CONFIG_PPC_HAVE_KUEP=y
CONFIG_PPC_KUEP=y
CONFIG_PPC_HAVE_KUAP=y
CONFIG_PPC_KUAP=y
# CONFIG_PPC_KUAP_DEBUG is not set
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_PPC_MM_SLICES=y
CONFIG_PPC_HAVE_PMU_SUPPORT=y
CONFIG_PMU_SYSFS=y
CONFIG_PPC_PERF_CTRS=y
CONFIG_FORCE_SMP=y
CONFIG_SMP=y
CONFIG_NR_CPUS=2048
CONFIG_PPC_DOORBELL=y
# end of Processor support

# CONFIG_CPU_BIG_ENDIAN is not set
CONFIG_CPU_LITTLE_ENDIAN=y
CONFIG_PPC64_BOOT_WRAPPER=y
CONFIG_64BIT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MAX=29
CONFIG_ARCH_MMAP_RND_BITS_MIN=14
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=13
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=7
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NR_IRQS=512
CONFIG_NMI_IPI=y
CONFIG_PPC_WATCHDOG=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_PPC=y
CONFIG_PPC_BARRIER_NOSPEC=y
CONFIG_EARLY_PRINTK=y
CONFIG_PANIC_TIMEOUT=90
CONFIG_COMPAT=y
CONFIG_SYSVIPC_COMPAT=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_PPC_UDBG_16550=y
CONFIG_AUDIT_ARCH=y
CONFIG_GENERIC_BUG=y
CONFIG_EPAPR_BOOT=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_SUSPEND_NONZERO_CPU=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_PPC_DAWR=y
CONFIG_PGTABLE_LEVELS=4
CONFIG_PPC_MSI_BITMAP=y
CONFIG_PPC_XICS=y
CONFIG_PPC_ICP_NATIVE=y
CONFIG_PPC_ICP_HV=y
CONFIG_PPC_ICS_RTAS=y
CONFIG_PPC_XIVE=y
CONFIG_PPC_XIVE_NATIVE=y
CONFIG_PPC_XIVE_SPAPR=y

#
# Platform support
#
CONFIG_PPC_POWERNV=y
CONFIG_OPAL_PRD=m
CONFIG_PPC_MEMTRACE=y
CONFIG_PPC_VAS=y
CONFIG_SCOM_DEBUGFS=y
CONFIG_PPC_PSERIES=y
CONFIG_PPC_SPLPAR=y
CONFIG_DTL=y
CONFIG_PSERIES_ENERGY=m
CONFIG_SCANLOG=m
CONFIG_IO_EVENT_IRQ=y
CONFIG_LPARCFG=y
CONFIG_PPC_SMLPAR=y
CONFIG_CMM=m
CONFIG_HV_PERF_CTRS=y
CONFIG_IBMVIO=y
CONFIG_PAPR_SCM=m
CONFIG_PPC_SVM=y
CONFIG_KVM_GUEST=y
CONFIG_EPAPR_PARAVIRT=y
CONFIG_PPC_NATIVE=y
CONFIG_PPC_OF_BOOT_TRAMPOLINE=y
CONFIG_PPC_DT_CPU_FTRS=y
CONFIG_UDBG_RTAS_CONSOLE=y
CONFIG_PPC_SMP_MUXED_IPI=y
CONFIG_MPIC=y
CONFIG_MPIC_MSGR=y
CONFIG_PPC_I8259=y
CONFIG_PPC_RTAS=y
CONFIG_RTAS_ERROR_LOGGING=y
CONFIG_PPC_RTAS_DAEMON=y
CONFIG_RTAS_PROC=y
CONFIG_RTAS_FLASH=y
CONFIG_EEH=y
CONFIG_PPC_P7_NAP=y
CONFIG_PPC_BOOK3S_IDLE=y
CONFIG_PPC_INDIRECT_PIO=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_POWERNV_CPUFREQ=y
# end of CPU Frequency scaling

#
# CPUIdle driver
#

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
CONFIG_CPU_IDLE_GOV_TEO=y
CONFIG_CPU_IDLE_GOV_HALTPOLL=y

#
# POWERPC CPU Idle Drivers
#
CONFIG_PSERIES_CPUIDLE=y
CONFIG_POWERNV_CPUIDLE=y
# end of POWERPC CPU Idle Drivers

# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
# end of CPU Idle
# end of CPUIdle driver

CONFIG_QE_GPIO=y
# CONFIG_GEN_RTC is not set
# end of Platform support

#
# Kernel options
#
CONFIG_HZ_100=y
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=100
CONFIG_SCHED_HRTICK=y
CONFIG_HUGETLB_PAGE_SIZE_VARIABLE=y
CONFIG_PPC_TRANSACTIONAL_MEM=y
# CONFIG_LD_HEAD_STUB_CATCH is not set
CONFIG_MPROFILE_KERNEL=y
CONFIG_HOTPLUG_CPU=y
CONFIG_ARCH_CPU_PROBE_RELEASE=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_PPC64_SUPPORTS_MEMORY_FAILURE=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
CONFIG_RELOCATABLE=y
# CONFIG_RELOCATABLE_TEST is not set
CONFIG_CRASH_DUMP=y
CONFIG_FA_DUMP=y
# CONFIG_OPAL_CORE is not set
CONFIG_IRQ_ALL_CPUS=y
CONFIG_NUMA=y
CONFIG_NODES_SHIFT=8
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_MEMORYLESS_NODES=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_SYS_SUPPORTS_HUGETLBFS=y
CONFIG_ILLEGAL_POINTER_VALUE=0x5deadbeef0000000
CONFIG_ARCH_MEMORY_PROBE=y
CONFIG_NODES_SPAN_OTHER_NODES=y
# CONFIG_PPC_4K_PAGES is not set
CONFIG_PPC_64K_PAGES=y
CONFIG_PPC_PAGE_SHIFT=16
CONFIG_THREAD_SHIFT=14
CONFIG_ETEXT_SHIFT=16
CONFIG_DATA_SHIFT=24
CONFIG_FORCE_MAX_ZONEORDER=9
CONFIG_PPC_SUBPAGE_PROT=y
CONFIG_PPC_COPRO_BASE=y
CONFIG_SCHED_SMT=y
CONFIG_PPC_DENORMALISATION=y
# CONFIG_CMDLINE_BOOL is not set
CONFIG_CMDLINE=""
CONFIG_EXTRA_TARGETS=""
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
# CONFIG_HIBERNATION is not set
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_SLEEP_SMP_NONZERO_CPU=y
CONFIG_PM_AUTOSLEEP=y
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
CONFIG_PM_WAKELOCKS_GC=y
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_GENERIC_DOMAINS=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
CONFIG_PM_GENERIC_DOMAINS_OF=y
CONFIG_ENERGY_MODEL=y
CONFIG_SECCOMP=y
CONFIG_PPC_MEM_KEYS=y
# end of Kernel options

CONFIG_ISA_DMA_API=y

#
# Bus options
#
CONFIG_GENERIC_ISA_DMA=y
CONFIG_FSL_LBC=y
CONFIG_FSL_GTM=y
# end of Bus options

CONFIG_NONSTATIC_KERNEL=y
CONFIG_PAGE_OFFSET=0xc000000000000000
CONFIG_KERNEL_START=0xc000000000000000
CONFIG_PHYSICAL_START=0x00000000
CONFIG_ARCH_RANDOM=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=y
CONFIG_KVM_BOOK3S_HANDLER=y
CONFIG_KVM_BOOK3S_64_HANDLER=y
CONFIG_KVM_BOOK3S_PR_POSSIBLE=y
CONFIG_KVM_BOOK3S_HV_POSSIBLE=y
CONFIG_KVM_BOOK3S_64=m
CONFIG_KVM_BOOK3S_64_HV=m
CONFIG_KVM_BOOK3S_64_PR=m
# CONFIG_KVM_BOOK3S_HV_EXIT_TIMING is not set
CONFIG_KVM_XICS=y
CONFIG_KVM_XIVE=y
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_KEXEC_ELF=y
CONFIG_HAVE_IMA_KEXEC=y
CONFIG_OPROFILE=m
CONFIG_HAVE_OPROFILE=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_NMI_WATCHDOG=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_PAGE_SIZE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_WEAK_RELEASE_ACQUIRE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP_FILTER=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_TIF_NOHZ=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_ARCH_MMAP_RND_BITS=14
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=7
CONFIG_HAVE_COPY_THREAD_TLS=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
# CONFIG_HAVE_ARCH_HASH is not set
CONFIG_HAVE_ARCH_NVRAM_OPS=y
# CONFIG_ISA_BUS_API is not set
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
# CONFIG_CPU_NO_EFFICIENT_FFS is not set
# CONFIG_HAVE_ARCH_VMAP_STACK is not set
CONFIG_ARCH_OPTIONAL_KERNEL_RWX=y
# CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
# CONFIG_ARCH_HAS_STRICT_MODULE_RWX is not set
CONFIG_ARCH_HAS_PHYS_TO_DMA=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y
CONFIG_MODULE_REL_CRCS=y
CONFIG_MODULE_SRCVERSION_ALL=y
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
# CONFIG_MODULE_SIG_ALL is not set
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
# CONFIG_MODULE_COMPRESS is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_UNUSED_SYMBOLS=y
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_RQ_ALLOC_TIME=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_CGROUP_IOLATENCY=y
CONFIG_BLK_CGROUP_IOCOST=y
CONFIG_BLK_WBT_MQ=y
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
CONFIG_BLK_SED_OPAL=y

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
# CONFIG_AMIGA_PARTITION is not set
CONFIG_ATARI_PARTITION=y
CONFIG_MAC_PARTITION=y
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y
# CONFIG_MINIX_SUBPARTITION is not set
CONFIG_SOLARIS_X86_PARTITION=y
CONFIG_UNIXWARE_DISKLABEL=y
CONFIG_LDM_PARTITION=y
# CONFIG_LDM_DEBUG is not set
CONFIG_SGI_PARTITION=y
CONFIG_ULTRIX_PARTITION=y
CONFIG_SUN_PARTITION=y
CONFIG_KARMA_PARTITION=y
CONFIG_EFI_PARTITION=y
CONFIG_SYSV68_PARTITION=y
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_HAS_MMIOWB=y
CONFIG_MMIOWB=y
# CONFIG_ARCH_HAS_SYSCALL_WRAPPER is not set
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_HAVE_AOUT is not set
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_ARCH_KEEP_MEMBLOCK=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_SPARSE=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=65536
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_TRANSPARENT_HUGEPAGE=y
# CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
# CONFIG_ARCH_WANTS_THP_SWAP is not set
CONFIG_CLEANCACHE=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=7
# CONFIG_MEM_SOFT_DIRTY is not set
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
# CONFIG_ZSWAP_DEFAULT_ON is not set
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
CONFIG_Z3FOLD=m
CONFIG_ZSMALLOC=y
# CONFIG_PGTABLE_MAPPING is not set
# CONFIG_ZSMALLOC_STAT is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DEVICE=y
CONFIG_DEV_PAGEMAP_OPS=y
CONFIG_HMM_MIRROR=y
# CONFIG_DEVICE_PRIVATE is not set
CONFIG_FRAME_VECTOR=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
CONFIG_READ_ONLY_THP_FOR_FS=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_ARCH_HAS_HUGEPD=y
# end of Memory Management options

CONFIG_NET=y
CONFIG_COMPAT_NETLINK_MESSAGES=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_NET_REDIRECT=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=m
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=m
CONFIG_XFRM_INTERFACE=m
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
# CONFIG_XFRM_STATISTICS is not set
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=y
CONFIG_NET_KEY_MIGRATE=y
CONFIG_SMC=m
CONFIG_SMC_DIAG=m
CONFIG_XDP_SOCKETS=y
CONFIG_XDP_SOCKETS_DIAG=m
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
# CONFIG_IP_FIB_TRIE_STATS is not set
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
# CONFIG_IP_PNP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
CONFIG_NET_FOU=m
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
CONFIG_INET_ESPINTCP=y
CONFIG_INET_IPCOMP=m
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
CONFIG_INET_DIAG_DESTROY=y
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
CONFIG_TCP_CONG_CDG=m
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
CONFIG_IPV6_ILA=m
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_FOU=m
CONFIG_IPV6_FOU_TUNNEL=m
CONFIG_IPV6_MULTIPLE_TABLES=y
CONFIG_IPV6_SUBTREES=y
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
CONFIG_IPV6_SEG6_LWTUNNEL=y
CONFIG_IPV6_SEG6_HMAC=y
CONFIG_IPV6_SEG6_BPF=y
CONFIG_IPV6_RPL_LWTUNNEL=y
CONFIG_NETLABEL=y
CONFIG_MPTCP=y
CONFIG_MPTCP_IPV6=y
# CONFIG_MPTCP_HMAC_TEST is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
CONFIG_NETFILTER_NETLINK_ACCT=m
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_COMMON=m
CONFIG_NF_LOG_NETDEV=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_FLOW_OFFLOAD=m
CONFIG_NFT_COUNTER=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
CONFIG_NFT_TUNNEL=m
CONFIG_NFT_OBJREF=m
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
CONFIG_NFT_XFRM=m
CONFIG_NFT_SOCKET=m
CONFIG_NFT_OSF=m
CONFIG_NFT_TPROXY=m
CONFIG_NFT_SYNPROXY=m
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
CONFIG_NF_FLOW_TABLE_INET=m
CONFIG_NF_FLOW_TABLE=m
CONFIG_NETFILTER_XTABLES=m

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
CONFIG_NETFILTER_XT_TARGET_LED=m
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
CONFIG_NETFILTER_XT_MATCH_IPCOMP=m
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
CONFIG_NETFILTER_XT_MATCH_L2TP=m
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
CONFIG_NETFILTER_XT_MATCH_NFACCT=m
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
CONFIG_NETFILTER_XT_MATCH_TIME=m
CONFIG_NETFILTER_XT_MATCH_U32=m
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
CONFIG_IP_VS_MH=m
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_FLOW_TABLE_IPV4=m
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_CLUSTERIP=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_FLOW_TABLE_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
CONFIG_IP6_NF_MATCH_SRH=m
CONFIG_IP6_NF_TARGET_HL=m
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
CONFIG_NFT_BRIDGE_META=m
CONFIG_NFT_BRIDGE_REJECT=m
CONFIG_NF_LOG_BRIDGE=m
CONFIG_NF_CONNTRACK_BRIDGE=m
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
CONFIG_BPFILTER=y
# CONFIG_BPFILTER_UMH is not set
CONFIG_IP_DCCP=m
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
# CONFIG_SCTP_COOKIE_HMAC_SHA1 is not set
CONFIG_INET_SCTP_DIAG=m
CONFIG_RDS=m
CONFIG_RDS_RDMA=m
CONFIG_RDS_TCP=m
# CONFIG_RDS_DEBUG is not set
CONFIG_TIPC=m
# CONFIG_TIPC_MEDIA_IB is not set
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
# CONFIG_ATM is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=m
CONFIG_L2TP_ETH=m
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
CONFIG_HAVE_NET_DSA=y
CONFIG_NET_DSA=m
CONFIG_NET_DSA_TAG_8021Q=m
CONFIG_NET_DSA_TAG_AR9331=m
CONFIG_NET_DSA_TAG_BRCM_COMMON=m
CONFIG_NET_DSA_TAG_BRCM=m
CONFIG_NET_DSA_TAG_BRCM_PREPEND=m
CONFIG_NET_DSA_TAG_GSWIP=m
CONFIG_NET_DSA_TAG_DSA=m
CONFIG_NET_DSA_TAG_EDSA=m
CONFIG_NET_DSA_TAG_MTK=m
CONFIG_NET_DSA_TAG_KSZ=m
CONFIG_NET_DSA_TAG_OCELOT=m
CONFIG_NET_DSA_TAG_QCA=m
CONFIG_NET_DSA_TAG_LAN9303=m
CONFIG_NET_DSA_TAG_SJA1105=m
CONFIG_NET_DSA_TAG_TRAILER=m
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=m
CONFIG_LLC2=m
CONFIG_ATALK=m
CONFIG_DEV_APPLETALK=m
CONFIG_IPDDP=m
CONFIG_IPDDP_ENCAP=y
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
CONFIG_PHONET=m
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
CONFIG_6LOWPAN_NHC=m
CONFIG_6LOWPAN_NHC_DEST=m
CONFIG_6LOWPAN_NHC_FRAGMENT=m
CONFIG_6LOWPAN_NHC_HOP=m
CONFIG_6LOWPAN_NHC_IPV6=m
CONFIG_6LOWPAN_NHC_MOBILITY=m
CONFIG_6LOWPAN_NHC_ROUTING=m
CONFIG_6LOWPAN_NHC_UDP=m
CONFIG_6LOWPAN_GHC_EXT_HDR_HOP=m
CONFIG_6LOWPAN_GHC_UDP=m
CONFIG_6LOWPAN_GHC_ICMPV6=m
CONFIG_6LOWPAN_GHC_EXT_HDR_DEST=m
CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG=m
CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
CONFIG_IEEE802154=m
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
CONFIG_IEEE802154_6LOWPAN=m
CONFIG_MAC802154=m
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
CONFIG_NET_SCH_CBS=m
CONFIG_NET_SCH_ETF=m
CONFIG_NET_SCH_TAPRIO=m
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
CONFIG_NET_SCH_SKBPRIO=m
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=m
CONFIG_NET_SCH_CAKE=m
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
CONFIG_NET_SCH_FQ_PIE=m
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
CONFIG_NET_SCH_ETS=m
# CONFIG_NET_SCH_DEFAULT is not set

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=m
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=m
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
CONFIG_NET_EMATCH_IPSET=m
CONFIG_NET_EMATCH_IPT=m
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
CONFIG_NET_ACT_IPT=m
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
CONFIG_NET_ACT_MPLS=m
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
CONFIG_NET_ACT_CONNMARK=m
CONFIG_NET_ACT_CTINFO=m
CONFIG_NET_ACT_SKBMOD=m
CONFIG_NET_ACT_IFE=m
CONFIG_NET_ACT_TUNNEL_KEY=m
CONFIG_NET_ACT_CT=m
CONFIG_NET_IFE_SKBMARK=m
CONFIG_NET_IFE_SKBPRIO=m
CONFIG_NET_IFE_SKBTCINDEX=m
CONFIG_NET_TC_SKB_EXT=y
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
CONFIG_BATMAN_ADV=m
CONFIG_BATMAN_ADV_BATMAN_V=y
CONFIG_BATMAN_ADV_BLA=y
CONFIG_BATMAN_ADV_DAT=y
CONFIG_BATMAN_ADV_NC=y
CONFIG_BATMAN_ADV_MCAST=y
CONFIG_BATMAN_ADV_DEBUGFS=y
CONFIG_BATMAN_ADV_DEBUG=y
CONFIG_BATMAN_ADV_SYSFS=y
# CONFIG_BATMAN_ADV_TRACING is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_OPENVSWITCH_VXLAN=m
CONFIG_OPENVSWITCH_GENEVE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=m
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=m
CONFIG_HSR=m
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
CONFIG_NET_NCSI=y
CONFIG_NCSI_OEM_CMD_GET_MAC=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
CONFIG_BT=m
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=m
CONFIG_BT_RFCOMM_TTY=y
CONFIG_BT_BNEP=m
CONFIG_BT_BNEP_MC_FILTER=y
CONFIG_BT_BNEP_PROTO_FILTER=y
CONFIG_BT_CMTP=m
CONFIG_BT_HIDP=m
CONFIG_BT_HS=y
CONFIG_BT_LE=y
CONFIG_BT_6LOWPAN=m
CONFIG_BT_LEDS=y
# CONFIG_BT_SELFTEST is not set
# CONFIG_BT_DEBUGFS is not set

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=m
CONFIG_BT_BCM=m
CONFIG_BT_RTL=m
CONFIG_BT_HCIBTUSB=m
CONFIG_BT_HCIBTUSB_AUTOSUSPEND=y
CONFIG_BT_HCIBTUSB_BCM=y
CONFIG_BT_HCIBTUSB_MTK=y
CONFIG_BT_HCIBTUSB_RTL=y
# CONFIG_BT_HCIUART is not set
CONFIG_BT_HCIBCM203X=m
# CONFIG_BT_HCIBPA10X is not set
CONFIG_BT_HCIBFUSB=m
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
CONFIG_BT_ATH3K=m
CONFIG_BT_MTKUART=m
CONFIG_BT_HCIRSI=m
# end of Bluetooth device drivers

CONFIG_AF_RXRPC=m
CONFIG_AF_RXRPC_IPV6=y
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
# CONFIG_AF_RXRPC_DEBUG is not set
CONFIG_RXKAD=y
CONFIG_AF_KCM=m
CONFIG_STREAM_PARSER=y
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_WIRELESS_EXT=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_WEXT_SPY=y
CONFIG_WEXT_PRIV=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_CFG80211_WEXT_EXPORT=y
CONFIG_LIB80211=m
CONFIG_LIB80211_CRYPT_WEP=m
CONFIG_LIB80211_CRYPT_CCMP=m
CONFIG_LIB80211_CRYPT_TKIP=m
# CONFIG_LIB80211_DEBUG is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
CONFIG_MAC80211_MESH=y
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_WIMAX=m
CONFIG_WIMAX_DEBUG_LEVEL=8
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
CONFIG_RFKILL_GPIO=m
CONFIG_NET_9P=m
CONFIG_NET_9P_VIRTIO=m
CONFIG_NET_9P_RDMA=m
# CONFIG_NET_9P_DEBUG is not set
CONFIG_CAIF=m
# CONFIG_CAIF_DEBUG is not set
CONFIG_CAIF_NETDEV=m
CONFIG_CAIF_USB=m
CONFIG_CEPH_LIB=m
CONFIG_CEPH_LIB_PRETTYDEBUG=y
# CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
CONFIG_NET_IFE=m
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y
CONFIG_HAVE_EBPF_JIT=y

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
CONFIG_FORCE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCI_SYSCALL=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
# CONFIG_PCIE_ECRC is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
CONFIG_PCIE_PTM=y
# CONFIG_PCIE_BW is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_ECAM=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
CONFIG_PCI_P2PDMA=y
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_CPCI=y
CONFIG_HOTPLUG_PCI_SHPC=y
CONFIG_HOTPLUG_PCI_POWERNV=m
CONFIG_HOTPLUG_PCI_RPA=y
CONFIG_HOTPLUG_PCI_RPA_DLPAR=y

#
# PCI controller drivers
#
# CONFIG_PCI_FTPCI100 is not set
CONFIG_PCI_HOST_COMMON=y
CONFIG_PCI_HOST_GENERIC=y
CONFIG_PCIE_XILINX=y
# CONFIG_PCI_HYPERV_INTERFACE is not set

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCIE_DW_PLAT_EP is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# CONFIG_PCIE_CADENCE_PLAT_HOST is not set
# CONFIG_PCIE_CADENCE_PLAT_EP is not set
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
# CONFIG_PCI_ENDPOINT_CONFIGFS is not set
CONFIG_PCI_EPF_TEST=m
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=m
# end of PCI switch controller drivers

# CONFIG_PCCARD is not set
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_TSI721=m
CONFIG_RAPIDIO_DISC_TIMEOUT=30
CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=y
CONFIG_RAPIDIO_DMA_ENGINE=y
CONFIG_RAPIDIO_DEBUG=y
CONFIG_RAPIDIO_ENUM_BASIC=m
CONFIG_RAPIDIO_CHMAN=m
CONFIG_RAPIDIO_MPORT_CDEV=m

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_TSI57X=m
CONFIG_RAPIDIO_CPS_XX=m
CONFIG_RAPIDIO_TSI568=m
CONFIG_RAPIDIO_CPS_GEN2=m
CONFIG_RAPIDIO_RXS_GEN3=m
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
CONFIG_FW_LOADER_COMPRESS=y
CONFIG_FW_CACHE=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_HMEM_REPORTING is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
# CONFIG_SYS_HYPERVISOR is not set
# CONFIG_GENERIC_CPU_DEVICES is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_REGMAP_W1=m
CONFIG_REGMAP_MMIO=m
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MOXTET is not set
# CONFIG_SIMPLE_PM_BUS is not set
CONFIG_MHI_BUS=m
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y
CONFIG_GNSS=m
CONFIG_GNSS_SERIAL=m
CONFIG_GNSS_MTK_SERIAL=m
CONFIG_GNSS_SIRF_SERIAL=m
CONFIG_GNSS_UBX_SERIAL=m
CONFIG_MTD=m
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_OF_PARTS=m
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=m
CONFIG_MTD_BLOCK=m
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set
# CONFIG_SM_FTL is not set
# CONFIG_MTD_OOPS is not set
CONFIG_MTD_SWAP=m
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=m
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
CONFIG_MTD_OTP=y
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=m
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=m
# CONFIG_MTD_PHYSMAP_COMPAT is not set
CONFIG_MTD_PHYSMAP_OF=y
CONFIG_MTD_PHYSMAP_GPIO_ADDR=y
CONFIG_MTD_PCI=m
# CONFIG_MTD_INTEL_VR_NOR is not set
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_DATAFLASH is not set
# CONFIG_MTD_MCHP23K256 is not set
# CONFIG_MTD_SST25L is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set
CONFIG_MTD_POWERNV_FLASH=m

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

CONFIG_MTD_NAND_CORE=m
# CONFIG_MTD_ONENAND is not set
CONFIG_MTD_NAND_ECC_SW_HAMMING=m
# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
CONFIG_MTD_RAW_NAND=m
CONFIG_MTD_NAND_ECC_SW_BCH=y

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=m
CONFIG_MTD_NAND_DENALI_PCI=m
# CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
CONFIG_MTD_NAND_CAFE=m
CONFIG_MTD_NAND_MXIC=m
CONFIG_MTD_NAND_GPIO=m
CONFIG_MTD_NAND_PLATFORM=m
# CONFIG_MTD_NAND_CADENCE is not set

#
# Misc
#
CONFIG_MTD_SM_COMMON=m
CONFIG_MTD_NAND_NANDSIM=m
CONFIG_MTD_NAND_RICOH=m
CONFIG_MTD_NAND_DISKONCHIP=m
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set
CONFIG_MTD_SPI_NAND=m

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=m
CONFIG_MTD_QINFO_PROBE=m
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_SPI_NOR=m
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y
# CONFIG_MTD_UBI is not set
CONFIG_MTD_HYPERBUS=m
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_NET=y
CONFIG_OF_MDIO=m
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_OF_DMA_DEFAULT_COHERENT=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
CONFIG_PARPORT_PC_FIFO=y
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_GSC is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
CONFIG_BLK_DEV_FD=m
CONFIG_CDROM=m
# CONFIG_PARIDE is not set
CONFIG_BLK_DEV_PCIESSD_MTIP32XX=m
CONFIG_ZRAM=m
CONFIG_ZRAM_WRITEBACK=y
# CONFIG_ZRAM_MEMORY_TRACKING is not set
# CONFIG_BLK_DEV_UMEM is not set
# CONFIG_BLK_DEV_COW_COMMON is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
CONFIG_BLK_DEV_CRYPTOLOOP=m
CONFIG_BLK_DEV_DRBD=m
# CONFIG_DRBD_FAULT_INJECTION is not set
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_SKD=m
# CONFIG_BLK_DEV_SX8 is not set
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=123456
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
CONFIG_CDROM_PKTCDVD_WCACHE=y
CONFIG_ATA_OVER_ETH=m
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m
CONFIG_BLK_DEV_RSXX=m

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
CONFIG_NVME_HWMON=y
CONFIG_NVME_FABRICS=m
CONFIG_NVME_RDMA=m
CONFIG_NVME_FC=m
CONFIG_NVME_TCP=m
CONFIG_NVME_TARGET=m
CONFIG_NVME_TARGET_LOOP=m
CONFIG_NVME_TARGET_RDMA=m
CONFIG_NVME_TARGET_FC=m
CONFIG_NVME_TARGET_FCLOOP=m
CONFIG_NVME_TARGET_TCP=m
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=m
CONFIG_AD525X_DPOT_I2C=m
# CONFIG_AD525X_DPOT_SPI is not set
CONFIG_DUMMY_IRQ=m
CONFIG_IBMVMC=m
CONFIG_PHANTOM=m
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
CONFIG_ICS932S401=m
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_HP_ILO=m
# CONFIG_APDS9802ALS is not set
# CONFIG_ISL29003 is not set
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
CONFIG_HMC6352=m
CONFIG_DS1682=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
CONFIG_PCI_ENDPOINT_TEST=m
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
CONFIG_PVPANIC=m
CONFIG_C2PORT=m

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
CONFIG_EEPROM_IDT_89HPESX=m
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=m
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_SPI is not set
CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m

#
# Intel MIC & related support
#
CONFIG_VOP_BUS=m
CONFIG_VOP=m
# end of Intel MIC & related support

CONFIG_GENWQE=m
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
CONFIG_ECHO=m
CONFIG_CXL_BASE=y
CONFIG_CXL_AFU_DRIVER_OPS=y
CONFIG_CXL_LIB=y
CONFIG_CXL=m
CONFIG_OCXL_BASE=y
CONFIG_OCXL=m
CONFIG_MISC_ALCOR_PCI=m
CONFIG_MISC_RTSX_PCI=m
CONFIG_MISC_RTSX_USB=m
CONFIG_HABANA_AI=m
CONFIG_UACCE=m
# end of Misc devices

CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=m
CONFIG_RAID_ATTRS=m
CONFIG_SCSI=m
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
CONFIG_ISCSI_TCP=m
CONFIG_ISCSI_BOOT_SYSFS=m
CONFIG_SCSI_CXGB3_ISCSI=m
CONFIG_SCSI_CXGB4_ISCSI=m
CONFIG_SCSI_BNX2_ISCSI=m
CONFIG_SCSI_BNX2X_FCOE=m
CONFIG_BE2ISCSI=m
CONFIG_CXLFLASH=m
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
CONFIG_SCSI_3W_SAS=m
# CONFIG_SCSI_ACARD is not set
CONFIG_SCSI_AACRAID=m
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
CONFIG_SCSI_AIC94XX=m
CONFIG_AIC94XX_DEBUG=y
CONFIG_SCSI_MVSAS=m
# CONFIG_SCSI_MVSAS_DEBUG is not set
CONFIG_SCSI_MVSAS_TASKLET=y
CONFIG_SCSI_MVUMI=m
# CONFIG_SCSI_ADVANSYS is not set
CONFIG_SCSI_ARCMSR=m
CONFIG_SCSI_ESAS2R=m
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
CONFIG_MEGARAID_SAS=m
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
CONFIG_SCSI_MPT2SAS=m
CONFIG_SCSI_SMARTPQI=m
CONFIG_SCSI_UFSHCD=m
CONFIG_SCSI_UFSHCD_PCI=m
# CONFIG_SCSI_UFS_DWC_TC_PCI is not set
CONFIG_SCSI_UFSHCD_PLATFORM=m
CONFIG_SCSI_UFS_CDNS_PLATFORM=m
# CONFIG_SCSI_UFS_DWC_TC_PLATFORM is not set
CONFIG_SCSI_UFS_BSG=y
# CONFIG_SCSI_HPTIOP is not set
CONFIG_SCSI_MYRB=m
CONFIG_SCSI_MYRS=m
CONFIG_LIBFC=m
CONFIG_LIBFCOE=m
CONFIG_FCOE=m
CONFIG_SCSI_SNIC=m
# CONFIG_SCSI_SNIC_DEBUG_FS is not set
# CONFIG_SCSI_DMX3191D is not set
CONFIG_SCSI_FDOMAIN=m
CONFIG_SCSI_FDOMAIN_PCI=m
# CONFIG_SCSI_GDTH is not set
# CONFIG_SCSI_IPS is not set
CONFIG_SCSI_IBMVSCSI=m
CONFIG_SCSI_IBMVSCSIS=m
CONFIG_SCSI_IBMVFC=m
CONFIG_SCSI_IBMVFC_TRACE=y
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
CONFIG_SCSI_STEX=m
CONFIG_SCSI_SYM53C8XX_2=m
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=0
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
CONFIG_SCSI_SYM53C8XX_MMIO=y
CONFIG_SCSI_IPR=m
CONFIG_SCSI_IPR_TRACE=y
CONFIG_SCSI_IPR_DUMP=y
# CONFIG_SCSI_QLOGIC_1280 is not set
CONFIG_SCSI_QLA_FC=m
CONFIG_TCM_QLA2XXX=m
# CONFIG_TCM_QLA2XXX_DEBUG is not set
CONFIG_SCSI_QLA_ISCSI=m
CONFIG_QEDI=m
CONFIG_QEDF=m
CONFIG_SCSI_LPFC=m
# CONFIG_SCSI_LPFC_DEBUG_FS is not set
# CONFIG_SCSI_DC395x is not set
CONFIG_SCSI_AM53C974=m
CONFIG_SCSI_WD719X=m
CONFIG_SCSI_DEBUG=m
CONFIG_SCSI_PMCRAID=m
CONFIG_SCSI_PM8001=m
CONFIG_SCSI_BFA_FC=m
CONFIG_SCSI_VIRTIO=m
CONFIG_SCSI_CHELSIO_FCOE=m
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=m
CONFIG_SCSI_DH_HP_SW=m
CONFIG_SCSI_DH_EMC=m
CONFIG_SCSI_DH_ALUA=m
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_AHCI_CEVA is not set
# CONFIG_AHCI_QORIQ is not set
CONFIG_SATA_INIC162X=m
CONFIG_SATA_ACARD_AHCI=m
CONFIG_SATA_SIL24=m
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_PDC_ADMA=m
CONFIG_SATA_QSTOR=m
CONFIG_SATA_SX4=m
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
# CONFIG_ATA_PIIX is not set
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
CONFIG_SATA_SVW=m
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
CONFIG_PATA_AMD=m
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
CONFIG_PATA_ATP867X=m
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
CONFIG_PATA_IT821X=m
# CONFIG_PATA_JMICRON is not set
CONFIG_PATA_MARVELL=m
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
CONFIG_PATA_OLDPIIX=m
# CONFIG_PATA_OPTIDMA is not set
CONFIG_PATA_PDC2027X=m
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
CONFIG_PATA_RDC=m
CONFIG_PATA_SCH=m
# CONFIG_PATA_SERVERWORKS is not set
CONFIG_PATA_SIL680=m
# CONFIG_PATA_SIS is not set
CONFIG_PATA_TOSHIBA=m
CONFIG_PATA_TRIFLEX=m
# CONFIG_PATA_VIA is not set
CONFIG_PATA_WINBOND=m

#
# PIO-only SFF controllers
#
CONFIG_PATA_CMD640_PCI=m
CONFIG_PATA_MPIIX=m
CONFIG_PATA_NS87410=m
CONFIG_PATA_OPTI=m
# CONFIG_PATA_PLATFORM is not set
CONFIG_PATA_RZ1000=m

#
# Generic fallback / legacy drivers
#
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=m
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_MD_MULTIPATH=m
CONFIG_MD_FAULTY=m
CONFIG_MD_CLUSTER=m
CONFIG_BCACHE=m
# CONFIG_BCACHE_DEBUG is not set
# CONFIG_BCACHE_CLOSURES_DEBUG is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
CONFIG_DM_UNSTRIPED=m
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
CONFIG_DM_ERA=m
CONFIG_DM_CLONE=m
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
CONFIG_DM_DELAY=m
CONFIG_DM_DUST=m
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
CONFIG_DM_VERITY_FEC=y
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
CONFIG_DM_ZONED=m
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_TCM_FC=m
CONFIG_ISCSI_TARGET=m
CONFIG_ISCSI_TARGET_CXGB4=m
CONFIG_SBP_TARGET=m
CONFIG_FUSION=y
# CONFIG_FUSION_SPI is not set
# CONFIG_FUSION_FC is not set
CONFIG_FUSION_SAS=m
CONFIG_FUSION_MAX_SGE=128
CONFIG_FUSION_CTL=m
# CONFIG_FUSION_LOGGING is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
CONFIG_FIREWIRE_NOSY=m
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_WINDFARM=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
CONFIG_BONDING=m
CONFIG_DUMMY=m
CONFIG_WIREGUARD=m
# CONFIG_WIREGUARD_DEBUG is not set
CONFIG_EQUALIZER=m
CONFIG_NET_FC=y
CONFIG_IFB=m
CONFIG_NET_TEAM=m
CONFIG_NET_TEAM_MODE_BROADCAST=m
CONFIG_NET_TEAM_MODE_ROUNDROBIN=m
CONFIG_NET_TEAM_MODE_RANDOM=m
CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=m
CONFIG_NET_TEAM_MODE_LOADBALANCE=m
CONFIG_MACVLAN=m
CONFIG_MACVTAP=m
CONFIG_IPVLAN_L3S=y
CONFIG_IPVLAN=m
CONFIG_IPVTAP=m
CONFIG_VXLAN=m
CONFIG_GENEVE=m
CONFIG_BAREUDP=m
CONFIG_GTP=m
CONFIG_MACSEC=m
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_RIONET=m
CONFIG_RIONET_TX_SIZE=128
CONFIG_RIONET_RX_SIZE=128
CONFIG_TUN=m
CONFIG_TAP=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
CONFIG_NLMON=m
CONFIG_NET_VRF=m
CONFIG_VSOCKMON=m
CONFIG_SUNGEM_PHY=m
# CONFIG_ARCNET is not set
CONFIG_CAIF_DRIVERS=y
CONFIG_CAIF_TTY=m
CONFIG_CAIF_SPI_SLAVE=m
# CONFIG_CAIF_SPI_SYNC is not set
CONFIG_CAIF_HSI=m
CONFIG_CAIF_VIRTIO=m

#
# Distributed Switch Architecture drivers
#
CONFIG_B53=m
# CONFIG_B53_SPI_DRIVER is not set
# CONFIG_B53_MDIO_DRIVER is not set
# CONFIG_B53_MMAP_DRIVER is not set
# CONFIG_B53_SRAB_DRIVER is not set
# CONFIG_B53_SERDES is not set
CONFIG_NET_DSA_BCM_SF2=m
CONFIG_NET_DSA_LOOP=m
CONFIG_NET_DSA_LANTIQ_GSWIP=m
CONFIG_NET_DSA_MT7530=m
CONFIG_NET_DSA_MV88E6060=m
CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON=m
CONFIG_NET_DSA_MICROCHIP_KSZ9477=m
CONFIG_NET_DSA_MICROCHIP_KSZ9477_I2C=m
CONFIG_NET_DSA_MICROCHIP_KSZ9477_SPI=m
CONFIG_NET_DSA_MICROCHIP_KSZ8795=m
CONFIG_NET_DSA_MICROCHIP_KSZ8795_SPI=m
CONFIG_NET_DSA_MV88E6XXX=m
CONFIG_NET_DSA_MV88E6XXX_GLOBAL2=y
CONFIG_NET_DSA_MV88E6XXX_PTP=y
CONFIG_NET_DSA_MSCC_FELIX=m
CONFIG_NET_DSA_AR9331=m
CONFIG_NET_DSA_SJA1105=m
CONFIG_NET_DSA_SJA1105_PTP=y
CONFIG_NET_DSA_SJA1105_TAS=y
CONFIG_NET_DSA_QCA8K=m
CONFIG_NET_DSA_REALTEK_SMI=m
CONFIG_NET_DSA_SMSC_LAN9303=m
CONFIG_NET_DSA_SMSC_LAN9303_I2C=m
CONFIG_NET_DSA_SMSC_LAN9303_MDIO=m
CONFIG_NET_DSA_VITESSE_VSC73XX=m
CONFIG_NET_DSA_VITESSE_VSC73XX_SPI=m
CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM=m
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_MDIO=m
CONFIG_NET_VENDOR_3COM=y
CONFIG_VORTEX=m
CONFIG_TYPHOON=m
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
CONFIG_ET131X=m
CONFIG_NET_VENDOR_ALACRITECH=y
CONFIG_SLICOSS=m
CONFIG_NET_VENDOR_ALTEON=y
CONFIG_ACENIC=m
CONFIG_ACENIC_OMIT_TIGON_I=y
CONFIG_ALTERA_TSE=m
CONFIG_NET_VENDOR_AMAZON=y
CONFIG_ENA_ETHERNET=m
CONFIG_NET_VENDOR_AMD=y
CONFIG_AMD8111_ETH=m
CONFIG_PCNET32=m
# CONFIG_AMD_XGBE_HAVE_ECC is not set
CONFIG_NET_VENDOR_AQUANTIA=y
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
CONFIG_ATL2=m
CONFIG_ATL1=m
CONFIG_ATL1E=m
CONFIG_ATL1C=y
CONFIG_ALX=m
CONFIG_NET_VENDOR_AURORA=y
CONFIG_AURORA_NB8800=m
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
CONFIG_BCMGENET=m
CONFIG_BNX2=m
CONFIG_CNIC=m
CONFIG_TIGON3=m
CONFIG_TIGON3_HWMON=y
CONFIG_BNX2X=m
CONFIG_BNX2X_SRIOV=y
CONFIG_SYSTEMPORT=m
CONFIG_BNXT=m
CONFIG_BNXT_SRIOV=y
CONFIG_BNXT_FLOWER_OFFLOAD=y
CONFIG_BNXT_DCB=y
CONFIG_BNXT_HWMON=y
CONFIG_NET_VENDOR_BROCADE=y
CONFIG_BNA=m
CONFIG_NET_VENDOR_CADENCE=y
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=m
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
CONFIG_CHELSIO_T1=m
CONFIG_CHELSIO_T1_1G=y
CONFIG_CHELSIO_T3=m
CONFIG_CHELSIO_T4=m
CONFIG_CHELSIO_T4_DCB=y
CONFIG_CHELSIO_T4_FCOE=y
CONFIG_CHELSIO_T4VF=m
CONFIG_CHELSIO_LIB=m
CONFIG_NET_VENDOR_CISCO=y
CONFIG_ENIC=m
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_GEMINI_ETHERNET=m
CONFIG_DNET=m
CONFIG_NET_VENDOR_DEC=y
CONFIG_NET_TULIP=y
# CONFIG_DE2104X is not set
CONFIG_TULIP=m
CONFIG_TULIP_MWI=y
CONFIG_TULIP_MMIO=y
CONFIG_TULIP_NAPI=y
CONFIG_TULIP_NAPI_HW_MITIGATION=y
CONFIG_DE4X5=m
CONFIG_WINBOND_840=m
CONFIG_DM9102=m
CONFIG_ULI526X=m
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
CONFIG_BE2NET=m
CONFIG_BE2NET_HWMON=y
CONFIG_BE2NET_BE2=y
CONFIG_BE2NET_BE3=y
CONFIG_BE2NET_LANCER=y
CONFIG_BE2NET_SKYHAWK=y
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_EZCHIP_NPS_MANAGEMENT_ENET=m
CONFIG_NET_VENDOR_FREESCALE=y
CONFIG_FSL_PQ_MDIO=m
CONFIG_FSL_XGMAC_MDIO=m
CONFIG_GIANFAR=m
CONFIG_FSL_ENETC=m
CONFIG_FSL_ENETC_VF=m
CONFIG_FSL_ENETC_MDIO=m
CONFIG_FSL_ENETC_PTP_CLOCK=m
CONFIG_FSL_ENETC_QOS=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_GVE=m
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_IBM=y
CONFIG_IBMVETH=m
# CONFIG_IBM_EMAC_ZMII is not set
# CONFIG_IBM_EMAC_RGMII is not set
# CONFIG_IBM_EMAC_TAH is not set
# CONFIG_IBM_EMAC_EMAC4 is not set
# CONFIG_IBM_EMAC_NO_FLOW_CTRL is not set
# CONFIG_IBM_EMAC_MAL_CLR_ICINTSTAT is not set
# CONFIG_IBM_EMAC_MAL_COMMON_ERR is not set
CONFIG_IBMVNIC=m
CONFIG_NET_VENDOR_INTEL=y
CONFIG_E100=m
CONFIG_E1000=m
CONFIG_E1000E=m
CONFIG_IGB=m
CONFIG_IGB_HWMON=y
CONFIG_IGBVF=m
CONFIG_IXGB=m
CONFIG_IXGBE=m
CONFIG_IXGBE_HWMON=y
CONFIG_IXGBE_DCB=y
CONFIG_IXGBE_IPSEC=y
CONFIG_IXGBEVF=m
CONFIG_IXGBEVF_IPSEC=y
CONFIG_I40E=m
CONFIG_I40E_DCB=y
CONFIG_IAVF=m
CONFIG_I40EVF=m
CONFIG_ICE=m
CONFIG_FM10K=m
CONFIG_IGC=m
# CONFIG_JME is not set
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
CONFIG_SKY2=m
# CONFIG_SKY2_DEBUG is not set
CONFIG_NET_VENDOR_MELLANOX=y
CONFIG_MLX4_EN=m
CONFIG_MLX4_EN_DCB=y
CONFIG_MLX4_CORE=m
CONFIG_MLX4_DEBUG=y
CONFIG_MLX4_CORE_GEN2=y
CONFIG_MLX5_CORE=m
CONFIG_MLX5_ACCEL=y
CONFIG_MLX5_FPGA=y
CONFIG_MLX5_CORE_EN=y
CONFIG_MLX5_EN_ARFS=y
CONFIG_MLX5_EN_RXNFC=y
CONFIG_MLX5_MPFS=y
CONFIG_MLX5_ESWITCH=y
CONFIG_MLX5_TC_CT=y
CONFIG_MLX5_CORE_EN_DCB=y
CONFIG_MLX5_CORE_IPOIB=y
CONFIG_MLX5_FPGA_IPSEC=y
CONFIG_MLX5_EN_IPSEC=y
CONFIG_MLX5_FPGA_TLS=y
CONFIG_MLX5_TLS=y
CONFIG_MLX5_EN_TLS=y
CONFIG_MLX5_SW_STEERING=y
CONFIG_MLXSW_CORE=m
CONFIG_MLXSW_CORE_HWMON=y
CONFIG_MLXSW_CORE_THERMAL=y
CONFIG_MLXSW_PCI=m
CONFIG_MLXSW_I2C=m
CONFIG_MLXSW_SWITCHIB=m
CONFIG_MLXSW_SWITCHX2=m
CONFIG_MLXSW_SPECTRUM=m
CONFIG_MLXSW_SPECTRUM_DCB=y
CONFIG_MLXSW_MINIMAL=m
CONFIG_MLXFW=m
CONFIG_NET_VENDOR_MICREL=y
CONFIG_KS8842=m
# CONFIG_KS8851 is not set
CONFIG_KS8851_MLL=m
CONFIG_KSZ884X_PCI=m
# CONFIG_NET_VENDOR_MICROCHIP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_MSCC_OCELOT_SWITCH=m
CONFIG_MSCC_OCELOT_SWITCH_OCELOT=m
CONFIG_NET_VENDOR_MYRI=y
CONFIG_MYRI10GE=m
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
CONFIG_S2IO=m
CONFIG_VXGE=m
# CONFIG_VXGE_DEBUG_TRACE_ALL is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NFP=m
CONFIG_NFP_APP_FLOWER=y
CONFIG_NFP_APP_ABM_NIC=y
# CONFIG_NFP_DEBUG is not set
CONFIG_NET_VENDOR_NI=y
CONFIG_NI_XGE_MANAGEMENT_ENET=m
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
CONFIG_ETHOC=m
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
CONFIG_IONIC=m
CONFIG_NET_VENDOR_QLOGIC=y
CONFIG_QLA3XXX=m
CONFIG_QLCNIC=m
CONFIG_QLCNIC_SRIOV=y
CONFIG_QLCNIC_DCB=y
CONFIG_QLCNIC_HWMON=y
CONFIG_NETXEN_NIC=m
CONFIG_QED=m
CONFIG_QED_LL2=y
CONFIG_QED_SRIOV=y
CONFIG_QEDE=m
CONFIG_QED_RDMA=y
CONFIG_QED_ISCSI=y
CONFIG_QED_FCOE=y
CONFIG_QED_OOO=y
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCA7000_SPI is not set
# CONFIG_QCA7000_UART is not set
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
CONFIG_R6040=m
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
CONFIG_R8169=m
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_ROCKER=m
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SOLARFLARE=y
CONFIG_SFC=m
CONFIG_SFC_MTD=y
CONFIG_SFC_MCDI_MON=y
CONFIG_SFC_SRIOV=y
CONFIG_SFC_MCDI_LOGGING=y
CONFIG_SFC_FALCON=m
CONFIG_SFC_FALCON_MTD=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
CONFIG_SIS190=m
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
CONFIG_SMSC911X=m
# CONFIG_SMSC911X_ARCH_HOOKS is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
CONFIG_STMMAC_ETH=m
# CONFIG_STMMAC_SELFTESTS is not set
# CONFIG_STMMAC_PLATFORM is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
CONFIG_SUNGEM=m
CONFIG_CASSINI=m
CONFIG_NIU=m
CONFIG_NET_VENDOR_SYNOPSYS=y
CONFIG_DWC_XLGMAC=m
CONFIG_DWC_XLGMAC_PCI=m
CONFIG_NET_VENDOR_TEHUTI=y
CONFIG_TEHUTI=m
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
CONFIG_TLAN=m
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
CONFIG_WIZNET_W5100=m
CONFIG_WIZNET_W5300=m
# CONFIG_WIZNET_BUS_DIRECT is not set
# CONFIG_WIZNET_BUS_INDIRECT is not set
CONFIG_WIZNET_BUS_ANY=y
CONFIG_WIZNET_W5100_SPI=m
CONFIG_NET_VENDOR_XILINX=y
CONFIG_XILINX_AXI_EMAC=m
CONFIG_XILINX_LL_TEMAC=m
# CONFIG_FDDI is not set
CONFIG_HIPPI=y
CONFIG_ROADRUNNER=m
# CONFIG_ROADRUNNER_LARGE_RINGS is not set
CONFIG_MDIO_DEVICE=m
CONFIG_MDIO_BUS=m
CONFIG_MDIO_BCM_UNIMAC=m
CONFIG_MDIO_BITBANG=m
CONFIG_MDIO_BUS_MUX=m
CONFIG_MDIO_BUS_MUX_GPIO=m
CONFIG_MDIO_BUS_MUX_MMIOREG=m
CONFIG_MDIO_BUS_MUX_MULTIPLEXER=m
CONFIG_MDIO_GPIO=m
# CONFIG_MDIO_HISI_FEMAC is not set
CONFIG_MDIO_I2C=m
CONFIG_MDIO_MSCC_MIIM=m
CONFIG_MDIO_MVUSB=m
# CONFIG_MDIO_OCTEON is not set
# CONFIG_MDIO_THUNDER is not set
CONFIG_MDIO_XPCS=m
CONFIG_PHYLINK=m
CONFIG_PHYLIB=m
CONFIG_SWPHY=y
CONFIG_LED_TRIGGER_PHY=y

#
# MII PHY device drivers
#
CONFIG_SFP=m
CONFIG_ADIN_PHY=m
CONFIG_AMD_PHY=m
CONFIG_AQUANTIA_PHY=m
CONFIG_AX88796B_PHY=m
CONFIG_BCM7XXX_PHY=m
CONFIG_BCM87XX_PHY=m
CONFIG_BCM_NET_PHYLIB=m
CONFIG_BROADCOM_PHY=m
CONFIG_BCM84881_PHY=m
CONFIG_CICADA_PHY=m
# CONFIG_CORTINA_PHY is not set
CONFIG_DAVICOM_PHY=m
CONFIG_DP83822_PHY=m
CONFIG_DP83TC811_PHY=m
CONFIG_DP83848_PHY=m
CONFIG_DP83867_PHY=m
CONFIG_DP83869_PHY=m
CONFIG_FIXED_PHY=m
CONFIG_ICPLUS_PHY=m
CONFIG_INTEL_XWAY_PHY=m
CONFIG_LSI_ET1011C_PHY=m
CONFIG_LXT_PHY=m
CONFIG_MARVELL_PHY=m
CONFIG_MARVELL_10G_PHY=m
CONFIG_MICREL_PHY=m
CONFIG_MICROCHIP_PHY=m
CONFIG_MICROCHIP_T1_PHY=m
CONFIG_MICROSEMI_PHY=m
CONFIG_NATIONAL_PHY=m
CONFIG_NXP_TJA11XX_PHY=m
CONFIG_AT803X_PHY=m
CONFIG_QSEMI_PHY=m
CONFIG_REALTEK_PHY=m
CONFIG_RENESAS_PHY=m
CONFIG_ROCKCHIP_PHY=m
CONFIG_SMSC_PHY=m
CONFIG_STE10XP=m
CONFIG_TERANETICS_PHY=m
CONFIG_VITESSE_PHY=m
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PLIP is not set
CONFIG_PPP=m
CONFIG_PPP_BSDCOMP=m
CONFIG_PPP_DEFLATE=m
CONFIG_PPP_FILTER=y
CONFIG_PPP_MPPE=m
CONFIG_PPP_MULTILINK=y
CONFIG_PPPOE=m
CONFIG_PPTP=m
CONFIG_PPPOL2TP=m
CONFIG_PPP_ASYNC=m
CONFIG_PPP_SYNC_TTY=m
CONFIG_SLIP=m
CONFIG_SLHC=m
CONFIG_SLIP_COMPRESSED=y
CONFIG_SLIP_SMART=y
# CONFIG_SLIP_MODE_SLIP6 is not set

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_USB_NET_DRIVERS=m
CONFIG_USB_CATC=m
CONFIG_USB_KAWETH=m
CONFIG_USB_PEGASUS=m
CONFIG_USB_RTL8150=m
CONFIG_USB_RTL8152=m
CONFIG_USB_LAN78XX=m
CONFIG_USB_USBNET=m
CONFIG_USB_NET_AX8817X=m
CONFIG_USB_NET_AX88179_178A=m
CONFIG_USB_NET_CDCETHER=m
CONFIG_USB_NET_CDC_EEM=m
CONFIG_USB_NET_CDC_NCM=m
CONFIG_USB_NET_HUAWEI_CDC_NCM=m
CONFIG_USB_NET_CDC_MBIM=m
CONFIG_USB_NET_DM9601=m
CONFIG_USB_NET_SR9700=m
CONFIG_USB_NET_SR9800=m
CONFIG_USB_NET_SMSC75XX=m
CONFIG_USB_NET_SMSC95XX=m
CONFIG_USB_NET_GL620A=m
CONFIG_USB_NET_NET1080=m
CONFIG_USB_NET_PLUSB=m
CONFIG_USB_NET_MCS7830=m
CONFIG_USB_NET_RNDIS_HOST=m
CONFIG_USB_NET_CDC_SUBSET_ENABLE=m
CONFIG_USB_NET_CDC_SUBSET=m
CONFIG_USB_ALI_M5632=y
CONFIG_USB_AN2720=y
CONFIG_USB_BELKIN=y
CONFIG_USB_ARMLINUX=y
CONFIG_USB_EPSON2888=y
CONFIG_USB_KC2190=y
CONFIG_USB_NET_ZAURUS=m
CONFIG_USB_NET_CX82310_ETH=m
CONFIG_USB_NET_KALMIA=m
CONFIG_USB_NET_QMI_WWAN=m
CONFIG_USB_HSO=m
CONFIG_USB_NET_INT51X1=m
CONFIG_USB_CDC_PHONET=m
CONFIG_USB_IPHETH=m
CONFIG_USB_SIERRA_NET=m
CONFIG_USB_VL600=m
CONFIG_USB_NET_CH9200=m
CONFIG_USB_NET_AQC111=m
CONFIG_WLAN=y
# CONFIG_WIRELESS_WDS is not set
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_ADM8211=m
CONFIG_ATH_COMMON=m
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
CONFIG_ATH5K=m
# CONFIG_ATH5K_DEBUG is not set
# CONFIG_ATH5K_TRACER is not set
CONFIG_ATH5K_PCI=y
CONFIG_ATH9K_HW=m
CONFIG_ATH9K_COMMON=m
CONFIG_ATH9K_BTCOEX_SUPPORT=y
CONFIG_ATH9K=m
CONFIG_ATH9K_PCI=y
# CONFIG_ATH9K_AHB is not set
# CONFIG_ATH9K_DEBUGFS is not set
# CONFIG_ATH9K_DYNACK is not set
CONFIG_ATH9K_WOW=y
CONFIG_ATH9K_RFKILL=y
CONFIG_ATH9K_CHANNEL_CONTEXT=y
CONFIG_ATH9K_PCOEM=y
CONFIG_ATH9K_PCI_NO_EEPROM=m
CONFIG_ATH9K_HTC=m
# CONFIG_ATH9K_HTC_DEBUGFS is not set
CONFIG_ATH9K_HWRNG=y
CONFIG_CARL9170=m
CONFIG_CARL9170_LEDS=y
# CONFIG_CARL9170_DEBUGFS is not set
CONFIG_CARL9170_WPC=y
CONFIG_CARL9170_HWRNG=y
CONFIG_ATH6KL=m
CONFIG_ATH6KL_USB=m
# CONFIG_ATH6KL_DEBUG is not set
# CONFIG_ATH6KL_TRACING is not set
CONFIG_AR5523=m
CONFIG_WIL6210=m
CONFIG_WIL6210_ISR_COR=y
CONFIG_WIL6210_TRACING=y
# CONFIG_WIL6210_DEBUGFS is not set
CONFIG_ATH10K=m
CONFIG_ATH10K_CE=y
CONFIG_ATH10K_PCI=m
# CONFIG_ATH10K_AHB is not set
CONFIG_ATH10K_USB=m
# CONFIG_ATH10K_DEBUG is not set
# CONFIG_ATH10K_DEBUGFS is not set
# CONFIG_ATH10K_TRACING is not set
CONFIG_WCN36XX=m
# CONFIG_WCN36XX_DEBUGFS is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
CONFIG_AT76C50X_USB=m
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_B43=m
CONFIG_B43_BCMA=y
CONFIG_B43_SSB=y
CONFIG_B43_BUSES_BCMA_AND_SSB=y
# CONFIG_B43_BUSES_BCMA is not set
# CONFIG_B43_BUSES_SSB is not set
CONFIG_B43_PCI_AUTOSELECT=y
CONFIG_B43_PCICORE_AUTOSELECT=y
CONFIG_B43_BCMA_PIO=y
CONFIG_B43_PIO=y
CONFIG_B43_PHY_G=y
CONFIG_B43_PHY_N=y
CONFIG_B43_PHY_LP=y
CONFIG_B43_PHY_HT=y
CONFIG_B43_LEDS=y
CONFIG_B43_HWRNG=y
# CONFIG_B43_DEBUG is not set
CONFIG_B43LEGACY=m
CONFIG_B43LEGACY_PCI_AUTOSELECT=y
CONFIG_B43LEGACY_PCICORE_AUTOSELECT=y
CONFIG_B43LEGACY_LEDS=y
CONFIG_B43LEGACY_HWRNG=y
# CONFIG_B43LEGACY_DEBUG is not set
CONFIG_B43LEGACY_DMA=y
CONFIG_B43LEGACY_PIO=y
CONFIG_B43LEGACY_DMA_AND_PIO_MODE=y
# CONFIG_B43LEGACY_DMA_MODE is not set
# CONFIG_B43LEGACY_PIO_MODE is not set
CONFIG_BRCMUTIL=m
CONFIG_BRCMSMAC=m
CONFIG_BRCMFMAC=m
CONFIG_BRCMFMAC_PROTO_BCDC=y
CONFIG_BRCMFMAC_PROTO_MSGBUF=y
CONFIG_BRCMFMAC_USB=y
CONFIG_BRCMFMAC_PCIE=y
# CONFIG_BRCM_TRACING is not set
# CONFIG_BRCMDBG is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_IPW2100=m
CONFIG_IPW2100_MONITOR=y
CONFIG_IPW2100_DEBUG=y
CONFIG_IPW2200=m
CONFIG_IPW2200_MONITOR=y
CONFIG_IPW2200_RADIOTAP=y
CONFIG_IPW2200_PROMISCUOUS=y
CONFIG_IPW2200_QOS=y
CONFIG_IPW2200_DEBUG=y
CONFIG_LIBIPW=m
CONFIG_LIBIPW_DEBUG=y
CONFIG_IWLEGACY=m
CONFIG_IWL4965=m
CONFIG_IWL3945=m

#
# iwl3945 / iwl4965 Debugging Options
#
# CONFIG_IWLEGACY_DEBUG is not set
# CONFIG_IWLEGACY_DEBUGFS is not set
# end of iwl3945 / iwl4965 Debugging Options

CONFIG_IWLWIFI=m
CONFIG_IWLWIFI_LEDS=y
CONFIG_IWLDVM=m
CONFIG_IWLMVM=m
CONFIG_IWLWIFI_OPMODE_MODULAR=y
# CONFIG_IWLWIFI_BCAST_FILTERING is not set

#
# Debugging Options
#
CONFIG_IWLWIFI_DEBUG=y
CONFIG_IWLWIFI_DEBUGFS=y
# CONFIG_IWLWIFI_DEVICE_TRACING is not set
# end of Debugging Options

CONFIG_WLAN_VENDOR_INTERSIL=y
CONFIG_HOSTAP=m
CONFIG_HOSTAP_FIRMWARE=y
CONFIG_HOSTAP_FIRMWARE_NVRAM=y
CONFIG_HOSTAP_PLX=m
CONFIG_HOSTAP_PCI=m
CONFIG_HERMES=m
CONFIG_HERMES_PRISM=y
CONFIG_HERMES_CACHE_FW_ON_INIT=y
CONFIG_PLX_HERMES=m
CONFIG_TMD_HERMES=m
CONFIG_NORTEL_HERMES=m
CONFIG_PCI_HERMES=m
CONFIG_ORINOCO_USB=m
CONFIG_P54_COMMON=m
CONFIG_P54_USB=m
CONFIG_P54_PCI=m
# CONFIG_P54_SPI is not set
CONFIG_P54_LEDS=y
# CONFIG_PRISM54 is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_LIBERTAS=m
CONFIG_LIBERTAS_USB=m
# CONFIG_LIBERTAS_SPI is not set
# CONFIG_LIBERTAS_DEBUG is not set
CONFIG_LIBERTAS_MESH=y
CONFIG_LIBERTAS_THINFIRM=m
# CONFIG_LIBERTAS_THINFIRM_DEBUG is not set
CONFIG_LIBERTAS_THINFIRM_USB=m
CONFIG_MWIFIEX=m
CONFIG_MWIFIEX_PCIE=m
CONFIG_MWIFIEX_USB=m
CONFIG_MWL8K=m
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_MT7601U=m
CONFIG_MT76_CORE=m
CONFIG_MT76_LEDS=y
CONFIG_MT76_USB=m
CONFIG_MT76x02_LIB=m
CONFIG_MT76x02_USB=m
CONFIG_MT76x0_COMMON=m
CONFIG_MT76x0U=m
CONFIG_MT76x0E=m
CONFIG_MT76x2_COMMON=m
CONFIG_MT76x2E=m
CONFIG_MT76x2U=m
CONFIG_MT7603E=m
CONFIG_MT7615E=m
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_RT2X00=m
CONFIG_RT2400PCI=m
CONFIG_RT2500PCI=m
CONFIG_RT61PCI=m
CONFIG_RT2800PCI=m
CONFIG_RT2800PCI_RT33XX=y
CONFIG_RT2800PCI_RT35XX=y
CONFIG_RT2800PCI_RT53XX=y
CONFIG_RT2800PCI_RT3290=y
CONFIG_RT2500USB=m
CONFIG_RT73USB=m
CONFIG_RT2800USB=m
CONFIG_RT2800USB_RT33XX=y
CONFIG_RT2800USB_RT35XX=y
CONFIG_RT2800USB_RT3573=y
CONFIG_RT2800USB_RT53XX=y
CONFIG_RT2800USB_RT55XX=y
CONFIG_RT2800USB_UNKNOWN=y
CONFIG_RT2800_LIB=m
CONFIG_RT2800_LIB_MMIO=m
CONFIG_RT2X00_LIB_MMIO=m
CONFIG_RT2X00_LIB_PCI=m
CONFIG_RT2X00_LIB_USB=m
CONFIG_RT2X00_LIB=m
CONFIG_RT2X00_LIB_FIRMWARE=y
CONFIG_RT2X00_LIB_CRYPTO=y
CONFIG_RT2X00_LIB_LEDS=y
# CONFIG_RT2X00_LIB_DEBUGFS is not set
# CONFIG_RT2X00_DEBUG is not set
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_RTL8180=m
CONFIG_RTL8187=m
CONFIG_RTL8187_LEDS=y
CONFIG_RTL_CARDS=m
CONFIG_RTL8192CE=m
CONFIG_RTL8192SE=m
CONFIG_RTL8192DE=m
CONFIG_RTL8723AE=m
CONFIG_RTL8723BE=m
CONFIG_RTL8188EE=m
CONFIG_RTL8192EE=m
CONFIG_RTL8821AE=m
CONFIG_RTL8192CU=m
CONFIG_RTLWIFI=m
CONFIG_RTLWIFI_PCI=m
CONFIG_RTLWIFI_USB=m
CONFIG_RTLWIFI_DEBUG=y
CONFIG_RTL8192C_COMMON=m
CONFIG_RTL8723_COMMON=m
CONFIG_RTLBTCOEXIST=m
CONFIG_RTL8XXXU=m
CONFIG_RTL8XXXU_UNTESTED=y
CONFIG_RTW88=m
CONFIG_RTW88_CORE=m
CONFIG_RTW88_PCI=m
CONFIG_RTW88_8822BE=y
CONFIG_RTW88_8822CE=y
# CONFIG_RTW88_DEBUG is not set
# CONFIG_RTW88_DEBUGFS is not set
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_RSI_91X=m
# CONFIG_RSI_DEBUGFS is not set
CONFIG_RSI_USB=m
CONFIG_RSI_COEX=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_CW1200=m
# CONFIG_CW1200_WLAN_SPI is not set
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WL1251=m
# CONFIG_WL1251_SPI is not set
CONFIG_WL12XX=m
CONFIG_WL18XX=m
CONFIG_WLCORE=m
# CONFIG_WLCORE_SPI is not set
CONFIG_WLAN_VENDOR_ZYDAS=y
# CONFIG_USB_ZD1201 is not set
CONFIG_ZD1211RW=m
# CONFIG_ZD1211RW_DEBUG is not set
CONFIG_WLAN_VENDOR_QUANTENNA=y
CONFIG_QTNFMAC=m
CONFIG_QTNFMAC_PCIE=m
CONFIG_MAC80211_HWSIM=m
CONFIG_USB_NET_RNDIS_WLAN=m
CONFIG_VIRT_WIFI=m

#
# WiMAX Wireless Broadband devices
#
CONFIG_WIMAX_I2400M=m
CONFIG_WIMAX_I2400M_USB=m
CONFIG_WIMAX_I2400M_DEBUG_LEVEL=8
# end of WiMAX Wireless Broadband devices

# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=m
CONFIG_IEEE802154_FAKELB=m
# CONFIG_IEEE802154_AT86RF230 is not set
# CONFIG_IEEE802154_MRF24J40 is not set
# CONFIG_IEEE802154_CC2520 is not set
# CONFIG_IEEE802154_ATUSB is not set
CONFIG_IEEE802154_ADF7242=m
CONFIG_IEEE802154_MCR20A=m
CONFIG_IEEE802154_HWSIM=m
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=y
CONFIG_CAPI_TRACE=y
CONFIG_ISDN_CAPI_MIDDLEWARE=y
CONFIG_MISDN=m
CONFIG_MISDN_DSP=m
CONFIG_MISDN_L1OIP=m

#
# mISDN hardware drivers
#
CONFIG_MISDN_HFCPCI=m
CONFIG_MISDN_HFCMULTI=m
CONFIG_MISDN_HFCUSB=m
CONFIG_MISDN_AVMFRITZ=m
CONFIG_MISDN_SPEEDFAX=m
CONFIG_MISDN_INFINEON=m
CONFIG_MISDN_W6692=m
CONFIG_MISDN_NETJET=m
CONFIG_MISDN_HDLC=m
CONFIG_MISDN_IPAC=m
CONFIG_MISDN_ISAR=m
CONFIG_NVM=y
CONFIG_NVM_PBLK=m
# CONFIG_NVM_PBLK_DEBUG is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_POLLDEV=m
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=m

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=m

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADP5588=m
CONFIG_KEYBOARD_ADP5589=m
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_QT1050=m
CONFIG_KEYBOARD_QT1070=m
CONFIG_KEYBOARD_QT2160=m
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
CONFIG_KEYBOARD_GPIO=m
CONFIG_KEYBOARD_GPIO_POLLED=m
CONFIG_KEYBOARD_TCA6416=m
CONFIG_KEYBOARD_TCA8418=m
CONFIG_KEYBOARD_MATRIX=m
CONFIG_KEYBOARD_LM8323=m
CONFIG_KEYBOARD_LM8333=m
CONFIG_KEYBOARD_MAX7359=m
CONFIG_KEYBOARD_MCS=m
CONFIG_KEYBOARD_MPR121=m
# CONFIG_KEYBOARD_NEWTON is not set
CONFIG_KEYBOARD_OPENCORES=m
# CONFIG_KEYBOARD_STOWAWAY is not set
CONFIG_KEYBOARD_SUNKBD=m
CONFIG_KEYBOARD_IQS62X=m
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
CONFIG_KEYBOARD_XTKBD=m
CONFIG_KEYBOARD_CAP11XX=m
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
CONFIG_MOUSE_PS2_TOUCHKIT=y
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
CONFIG_MOUSE_APPLETOUCH=m
CONFIG_MOUSE_BCM5974=m
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
# CONFIG_MOUSE_VSXXXAA is not set
CONFIG_MOUSE_GPIO=m
CONFIG_MOUSE_SYNAPTICS_I2C=m
CONFIG_MOUSE_SYNAPTICS_USB=m
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
# CONFIG_JOYSTICK_ADI is not set
# CONFIG_JOYSTICK_COBRA is not set
# CONFIG_JOYSTICK_GF2K is not set
# CONFIG_JOYSTICK_GRIP is not set
# CONFIG_JOYSTICK_GRIP_MP is not set
# CONFIG_JOYSTICK_GUILLEMOT is not set
# CONFIG_JOYSTICK_INTERACT is not set
# CONFIG_JOYSTICK_SIDEWINDER is not set
# CONFIG_JOYSTICK_TMDC is not set
CONFIG_JOYSTICK_IFORCE=m
CONFIG_JOYSTICK_IFORCE_USB=m
CONFIG_JOYSTICK_IFORCE_232=m
CONFIG_JOYSTICK_WARRIOR=m
CONFIG_JOYSTICK_MAGELLAN=m
CONFIG_JOYSTICK_SPACEORB=m
CONFIG_JOYSTICK_SPACEBALL=m
CONFIG_JOYSTICK_STINGER=m
CONFIG_JOYSTICK_TWIDJOY=m
CONFIG_JOYSTICK_ZHENHUA=m
# CONFIG_JOYSTICK_DB9 is not set
# CONFIG_JOYSTICK_GAMECON is not set
# CONFIG_JOYSTICK_TURBOGRAFX is not set
CONFIG_JOYSTICK_AS5011=m
CONFIG_JOYSTICK_JOYDUMP=m
CONFIG_JOYSTICK_XPAD=m
CONFIG_JOYSTICK_XPAD_FF=y
CONFIG_JOYSTICK_XPAD_LEDS=y
CONFIG_JOYSTICK_WALKERA0701=m
CONFIG_JOYSTICK_PSXPAD_SPI=m
CONFIG_JOYSTICK_PSXPAD_SPI_FF=y
CONFIG_JOYSTICK_PXRC=m
CONFIG_JOYSTICK_FSIA6B=m
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=m
CONFIG_TABLET_USB_AIPTEK=m
CONFIG_TABLET_USB_GTCO=m
CONFIG_TABLET_USB_HANWANG=m
CONFIG_TABLET_USB_KBTAB=m
CONFIG_TABLET_USB_PEGASUS=m
CONFIG_TABLET_SERIAL_WACOM4=m
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_PROPERTIES=y
# CONFIG_TOUCHSCREEN_ADS7846 is not set
# CONFIG_TOUCHSCREEN_AD7877 is not set
CONFIG_TOUCHSCREEN_AD7879=m
CONFIG_TOUCHSCREEN_AD7879_I2C=m
# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
CONFIG_TOUCHSCREEN_AR1021_I2C=m
CONFIG_TOUCHSCREEN_ATMEL_MXT=m
# CONFIG_TOUCHSCREEN_ATMEL_MXT_T37 is not set
CONFIG_TOUCHSCREEN_AUO_PIXCIR=m
CONFIG_TOUCHSCREEN_BU21013=m
CONFIG_TOUCHSCREEN_BU21029=m
CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=m
CONFIG_TOUCHSCREEN_CY8CTMG110=m
CONFIG_TOUCHSCREEN_CYTTSP_CORE=m
CONFIG_TOUCHSCREEN_CYTTSP_I2C=m
# CONFIG_TOUCHSCREEN_CYTTSP_SPI is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=m
CONFIG_TOUCHSCREEN_CYTTSP4_I2C=m
# CONFIG_TOUCHSCREEN_CYTTSP4_SPI is not set
CONFIG_TOUCHSCREEN_DYNAPRO=m
CONFIG_TOUCHSCREEN_HAMPSHIRE=m
CONFIG_TOUCHSCREEN_EETI=m
CONFIG_TOUCHSCREEN_EGALAX=m
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=m
CONFIG_TOUCHSCREEN_EXC3000=m
CONFIG_TOUCHSCREEN_FUJITSU=m
CONFIG_TOUCHSCREEN_GOODIX=m
CONFIG_TOUCHSCREEN_HIDEEP=m
CONFIG_TOUCHSCREEN_ILI210X=m
CONFIG_TOUCHSCREEN_S6SY761=m
# CONFIG_TOUCHSCREEN_GUNZE is not set
CONFIG_TOUCHSCREEN_EKTF2127=m
CONFIG_TOUCHSCREEN_ELAN=m
# CONFIG_TOUCHSCREEN_ELO is not set
CONFIG_TOUCHSCREEN_WACOM_W8001=m
CONFIG_TOUCHSCREEN_WACOM_I2C=m
CONFIG_TOUCHSCREEN_MAX11801=m
CONFIG_TOUCHSCREEN_MCS5000=m
CONFIG_TOUCHSCREEN_MMS114=m
CONFIG_TOUCHSCREEN_MELFAS_MIP4=m
# CONFIG_TOUCHSCREEN_MTOUCH is not set
CONFIG_TOUCHSCREEN_IMX6UL_TSC=m
CONFIG_TOUCHSCREEN_INEXIO=m
# CONFIG_TOUCHSCREEN_MK712 is not set
CONFIG_TOUCHSCREEN_PENMOUNT=m
CONFIG_TOUCHSCREEN_EDT_FT5X06=m
CONFIG_TOUCHSCREEN_TOUCHRIGHT=m
CONFIG_TOUCHSCREEN_TOUCHWIN=m
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=m
CONFIG_TOUCHSCREEN_PIXCIR=m
CONFIG_TOUCHSCREEN_WDT87XX_I2C=m
CONFIG_TOUCHSCREEN_WM97XX=m
CONFIG_TOUCHSCREEN_WM9705=y
CONFIG_TOUCHSCREEN_WM9712=y
CONFIG_TOUCHSCREEN_WM9713=y
CONFIG_TOUCHSCREEN_USB_COMPOSITE=m
CONFIG_TOUCHSCREEN_USB_EGALAX=y
CONFIG_TOUCHSCREEN_USB_PANJIT=y
CONFIG_TOUCHSCREEN_USB_3M=y
CONFIG_TOUCHSCREEN_USB_ITM=y
CONFIG_TOUCHSCREEN_USB_ETURBO=y
CONFIG_TOUCHSCREEN_USB_GUNZE=y
CONFIG_TOUCHSCREEN_USB_DMC_TSC10=y
CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=y
CONFIG_TOUCHSCREEN_USB_GOTOP=y
CONFIG_TOUCHSCREEN_USB_JASTEC=y
CONFIG_TOUCHSCREEN_USB_ELO=y
CONFIG_TOUCHSCREEN_USB_E2I=y
CONFIG_TOUCHSCREEN_USB_ZYTRONIC=y
CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
CONFIG_TOUCHSCREEN_USB_NEXIO=y
CONFIG_TOUCHSCREEN_USB_EASYTOUCH=y
CONFIG_TOUCHSCREEN_TOUCHIT213=m
CONFIG_TOUCHSCREEN_TSC_SERIO=m
CONFIG_TOUCHSCREEN_TSC200X_CORE=m
CONFIG_TOUCHSCREEN_TSC2004=m
# CONFIG_TOUCHSCREEN_TSC2005 is not set
CONFIG_TOUCHSCREEN_TSC2007=m
CONFIG_TOUCHSCREEN_RM_TS=m
CONFIG_TOUCHSCREEN_SILEAD=m
CONFIG_TOUCHSCREEN_SIS_I2C=m
CONFIG_TOUCHSCREEN_ST1232=m
# CONFIG_TOUCHSCREEN_STMFTS is not set
CONFIG_TOUCHSCREEN_SUR40=m
CONFIG_TOUCHSCREEN_SURFACE3_SPI=m
CONFIG_TOUCHSCREEN_SX8654=m
CONFIG_TOUCHSCREEN_TPS6507X=m
CONFIG_TOUCHSCREEN_ZET6223=m
CONFIG_TOUCHSCREEN_ZFORCE=m
CONFIG_TOUCHSCREEN_ROHM_BU21023=m
CONFIG_TOUCHSCREEN_IQS5XX=m
CONFIG_INPUT_MISC=y
CONFIG_INPUT_AD714X=m
CONFIG_INPUT_AD714X_I2C=m
# CONFIG_INPUT_AD714X_SPI is not set
CONFIG_INPUT_ATMEL_CAPTOUCH=m
CONFIG_INPUT_BMA150=m
# CONFIG_INPUT_E3X0_BUTTON is not set
# CONFIG_INPUT_MSM_VIBRATOR is not set
CONFIG_INPUT_PCSPKR=m
CONFIG_INPUT_MAX77650_ONKEY=m
CONFIG_INPUT_MMA8450=m
CONFIG_INPUT_GP2A=m
CONFIG_INPUT_GPIO_BEEPER=m
CONFIG_INPUT_GPIO_DECODER=m
# CONFIG_INPUT_GPIO_VIBRA is not set
CONFIG_INPUT_ATI_REMOTE2=m
CONFIG_INPUT_KEYSPAN_REMOTE=m
CONFIG_INPUT_KXTJ9=m
CONFIG_INPUT_POWERMATE=m
CONFIG_INPUT_YEALINK=m
CONFIG_INPUT_CM109=m
CONFIG_INPUT_REGULATOR_HAPTIC=m
CONFIG_INPUT_UINPUT=m
CONFIG_INPUT_PCF8574=m
CONFIG_INPUT_PWM_BEEPER=m
CONFIG_INPUT_PWM_VIBRA=m
CONFIG_INPUT_GPIO_ROTARY_ENCODER=m
CONFIG_INPUT_DA9063_ONKEY=m
CONFIG_INPUT_ADXL34X=m
CONFIG_INPUT_ADXL34X_I2C=m
# CONFIG_INPUT_ADXL34X_SPI is not set
CONFIG_INPUT_IMS_PCU=m
CONFIG_INPUT_CMA3000=m
CONFIG_INPUT_CMA3000_I2C=m
CONFIG_INPUT_IDEAPAD_SLIDEBAR=m
CONFIG_INPUT_DRV260X_HAPTICS=m
CONFIG_INPUT_DRV2665_HAPTICS=m
CONFIG_INPUT_DRV2667_HAPTICS=m
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F54=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=m
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_XILINX_XPS_PS2=m
CONFIG_SERIO_ALTERA_PS2=m
CONFIG_SERIO_PS2MULT=m
# CONFIG_SERIO_ARC_PS2 is not set
CONFIG_SERIO_APBPS2=m
CONFIG_SERIO_GPIO_PS2=m
CONFIG_USERIO=m
CONFIG_GAMEPORT=m
# CONFIG_GAMEPORT_NS558 is not set
# CONFIG_GAMEPORT_L4 is not set
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=0
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=32
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
# CONFIG_SERIAL_8250_RSA is not set
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_FSL=y
CONFIG_SERIAL_8250_DW=m
CONFIG_SERIAL_8250_RT288X=y
CONFIG_SERIAL_OF_PLATFORM=m

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_KGDB_NMI is not set
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_CONSOLE_POLL=y
CONFIG_SERIAL_ICOM=m
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_SIFIVE is not set
CONFIG_SERIAL_QE=m
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX_CORE=m
CONFIG_SERIAL_SC16IS7XX=m
CONFIG_SERIAL_SC16IS7XX_I2C=y
# CONFIG_SERIAL_SC16IS7XX_SPI is not set
CONFIG_SERIAL_ALTERA_JTAGUART=m
CONFIG_SERIAL_ALTERA_UART=m
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_IFX6X60 is not set
CONFIG_SERIAL_XILINX_PS_UART=m
# CONFIG_SERIAL_ARC is not set
CONFIG_SERIAL_RP2=m
CONFIG_SERIAL_RP2_NR_UARTS=32
CONFIG_SERIAL_FSL_LPUART=m
CONFIG_SERIAL_FSL_LINFLEXUART=m
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_PPC_EPAPR_HV_BYTECHAN is not set
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
CONFIG_NULL_TTY=m
CONFIG_TRACE_ROUTER=m
CONFIG_TRACE_SINK=m
CONFIG_HVC_DRIVER=y
CONFIG_HVC_IRQ=y
CONFIG_HVC_CONSOLE=y
# CONFIG_HVC_OLD_HVSI is not set
CONFIG_HVC_OPAL=y
CONFIG_HVC_RTAS=y
# CONFIG_HVC_UDBG is not set
CONFIG_HVCS=m
CONFIG_SERIAL_DEV_BUS=m
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
# CONFIG_PPDEV is not set
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IBM_BSR=m
CONFIG_POWERNV_OP_PANEL=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
# CONFIG_IPMI_PANIC_STRING is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_POWERNV=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_HW_RANDOM_PSERIES=y
CONFIG_HW_RANDOM_POWERNV=y
# CONFIG_APPLICOM is not set
CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set
CONFIG_NVRAM=m
CONFIG_RAW_DRIVER=m
CONFIG_MAX_RAW_DEVS=4096
CONFIG_DEVPORT=y
# CONFIG_HANGCHECK_TIMER is not set
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_SPI=m
CONFIG_TCG_TIS_SPI_CR50=y
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_IBMVTPM=y
CONFIG_TCG_VTPM_PROXY=m
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
CONFIG_TCG_TIS_ST33ZP24_SPI=m
CONFIG_CRASHER=m
CONFIG_XILLYBUS=m
CONFIG_XILLYBUS_PCIE=m
# CONFIG_XILLYBUS_OF is not set
# end of Character devices

CONFIG_RANDOM_TRUST_CPU=y
CONFIG_RANDOM_TRUST_BOOTLOADER=y

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=m
CONFIG_I2C_MUX_GPIO=m
# CONFIG_I2C_MUX_GPMUX is not set
CONFIG_I2C_MUX_LTC4306=m
CONFIG_I2C_MUX_PCA9541=m
CONFIG_I2C_MUX_PCA954x=m
CONFIG_I2C_MUX_PINCTRL=m
CONFIG_I2C_MUX_REG=m
CONFIG_I2C_DEMUX_PINCTRL=m
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
CONFIG_I2C_AMD8111=m
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
CONFIG_I2C_NVIDIA_GPU=m
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
CONFIG_I2C_DESIGNWARE_PLATFORM=m
CONFIG_I2C_DESIGNWARE_SLAVE=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_GPIO=m
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
CONFIG_I2C_KEMPLD=m
# CONFIG_I2C_MPC is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_PXA_PCI is not set
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=m
CONFIG_I2C_DLN2=m
CONFIG_I2C_PARPORT=m
CONFIG_I2C_ROBOTFUZZ_OSIF=m
CONFIG_I2C_TAOS_EVM=m
CONFIG_I2C_TINY_USB=m
CONFIG_I2C_VIPERBOARD=m

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_OPAL=m
CONFIG_I2C_FSI=m
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=m
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=m
CONFIG_CDNS_I3C_MASTER=m
CONFIG_DW_I3C_MASTER=m
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
CONFIG_SPI_DLN2=m
CONFIG_SPI_FSI=m
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_FSL_SPI is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_PXA2XX_PCI is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set

#
# SPI Multiplexer support
#
CONFIG_SPI_MUX=m

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
CONFIG_SPI_LOOPBACK_TEST=m
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPMI=m
CONFIG_HSI=m
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=m
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_QORIQ=m

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PTP_1588_CLOCK_IDT82P33=m
CONFIG_PTP_1588_CLOCK_IDTCM=m
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AMD=m
CONFIG_PINCTRL_DA9062=m
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SINGLE is not set
# CONFIG_PINCTRL_SX150X is not set
# CONFIG_PINCTRL_STMFX is not set
# CONFIG_PINCTRL_OCELOT is not set
CONFIG_PINCTRL_MADERA=m
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_PINCTRL_CS47L92=y
CONFIG_PINCTRL_EQUILIBRIUM=m
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=m
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=m
# CONFIG_GPIO_ALTERA is not set
CONFIG_GPIO_CADENCE=m
# CONFIG_GPIO_DWAPB is not set
CONFIG_GPIO_EXAR=m
# CONFIG_GPIO_FTGPIO010 is not set
CONFIG_GPIO_GENERIC_PLATFORM=m
CONFIG_GPIO_GRGPIO=m
# CONFIG_GPIO_HLWD is not set
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_SIFIVE is not set
CONFIG_GPIO_XILINX=y
CONFIG_GPIO_AMD_FCH=m
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADP5588=m
CONFIG_GPIO_ADNP=m
CONFIG_GPIO_GW_PLD=m
CONFIG_GPIO_MAX7300=m
CONFIG_GPIO_MAX732X=m
CONFIG_GPIO_PCA953X=m
CONFIG_GPIO_PCF857X=m
CONFIG_GPIO_TPIC2810=m
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_DLN2=m
CONFIG_GPIO_KEMPLD=m
CONFIG_GPIO_LP3943=m
CONFIG_GPIO_MADERA=m
CONFIG_GPIO_MAX77650=m
CONFIG_GPIO_TQMX86=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
CONFIG_GPIO_PCI_IDIO_16=m
CONFIG_GPIO_PCIE_IDIO_24=m
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_74X164 is not set
CONFIG_GPIO_MAX3191X=m
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
CONFIG_GPIO_PISOSR=m
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=m
# end of USB GPIO expanders

CONFIG_GPIO_MOCKUP=m
CONFIG_W1=m
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
# CONFIG_W1_MASTER_DS2490 is not set
# CONFIG_W1_MASTER_DS2482 is not set
CONFIG_W1_MASTER_DS1WM=m
CONFIG_W1_MASTER_GPIO=m
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=m
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=m
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=m
CONFIG_W1_SLAVE_DS2805=m
CONFIG_W1_SLAVE_DS2430=m
CONFIG_W1_SLAVE_DS2431=m
# CONFIG_W1_SLAVE_DS2433 is not set
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

CONFIG_POWER_AVS=y
CONFIG_QCOM_CPR=m
# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
CONFIG_PDA_POWER=m
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=m
CONFIG_BATTERY_DS2760=m
CONFIG_BATTERY_DS2780=m
CONFIG_BATTERY_DS2781=m
CONFIG_BATTERY_DS2782=m
CONFIG_BATTERY_SBS=m
CONFIG_CHARGER_SBS=m
CONFIG_MANAGER_SBS=m
CONFIG_BATTERY_BQ27XXX=m
CONFIG_BATTERY_BQ27XXX_I2C=m
CONFIG_BATTERY_BQ27XXX_HDQ=m
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
CONFIG_BATTERY_MAX17040=m
CONFIG_BATTERY_MAX17042=m
CONFIG_BATTERY_MAX1721X=m
CONFIG_CHARGER_ISP1704=m
CONFIG_CHARGER_MAX8903=m
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_GPIO=m
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LT3651=m
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
CONFIG_CHARGER_MAX77650=m
# CONFIG_CHARGER_BQ2415X is not set
CONFIG_CHARGER_BQ24190=m
CONFIG_CHARGER_BQ24257=m
CONFIG_CHARGER_BQ24735=m
CONFIG_CHARGER_BQ25890=m
CONFIG_CHARGER_SMB347=m
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_CHARGER_RT9455=m
CONFIG_CHARGER_UCS1002=m
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
CONFIG_SENSORS_ADM1177=m
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
CONFIG_SENSORS_AS370=m
CONFIG_SENSORS_ASC7621=m
CONFIG_SENSORS_AXI_FAN_CONTROL=m
CONFIG_SENSORS_ASPEED=m
CONFIG_SENSORS_ATXP1=m
CONFIG_SENSORS_DRIVETEMP=m
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FTSTEUTATES=m
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=m
# CONFIG_SENSORS_GPIO_FAN is not set
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_IBMPOWERNV=m
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LINEAGE=m
CONFIG_SENSORS_LTC2945=m
CONFIG_SENSORS_LTC2947=m
CONFIG_SENSORS_LTC2947_I2C=m
CONFIG_SENSORS_LTC2947_SPI=m
CONFIG_SENSORS_LTC2990=m
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
CONFIG_SENSORS_LTC4222=m
CONFIG_SENSORS_LTC4245=m
CONFIG_SENSORS_LTC4260=m
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX31722=m
CONFIG_SENSORS_MAX31730=m
CONFIG_SENSORS_MAX6621=m
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=m
CONFIG_SENSORS_MCP3021=m
CONFIG_SENSORS_TC654=m
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT7802=m
CONFIG_SENSORS_NCT7904=m
CONFIG_SENSORS_NPCM7XX=m
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ADM1275=m
CONFIG_SENSORS_BEL_PFE=m
CONFIG_SENSORS_IBM_CFFPS=m
CONFIG_SENSORS_INSPUR_IPSPS=m
# CONFIG_SENSORS_IR35221 is not set
CONFIG_SENSORS_IR38064=m
CONFIG_SENSORS_IRPS5401=m
CONFIG_SENSORS_ISL68137=m
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=m
CONFIG_SENSORS_LTC2978_REGULATOR=y
CONFIG_SENSORS_LTC3815=m
CONFIG_SENSORS_MAX16064=m
CONFIG_SENSORS_MAX20730=m
CONFIG_SENSORS_MAX20751=m
CONFIG_SENSORS_MAX31785=m
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
CONFIG_SENSORS_PXE1610=m
CONFIG_SENSORS_TPS40422=m
CONFIG_SENSORS_TPS53679=m
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
CONFIG_SENSORS_XDPE122=m
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_PWM_FAN=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=m
CONFIG_SENSORS_SHTC1=m
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_STTS751=m
CONFIG_SENSORS_SMM665=m
CONFIG_SENSORS_ADC128D818=m
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
CONFIG_SENSORS_INA3221=m
CONFIG_SENSORS_TC74=m
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=m
CONFIG_SENSORS_TMP108=m
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
CONFIG_SENSORS_TMP513=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT8231=m
CONFIG_SENSORS_W83773G=m
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_THERMAL=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_OF=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
CONFIG_CPU_THERMAL=y
CONFIG_CPU_FREQ_THERMAL=y
CONFIG_DEVFREQ_THERMAL=y
# CONFIG_THERMAL_EMULATION is not set
CONFIG_THERMAL_MMIO=m
# CONFIG_QORIQ_THERMAL is not set
# CONFIG_DA9062_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=m
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP=y
# CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_SOFT_WATCHDOG_PRETIMEOUT=y
CONFIG_DA9062_WATCHDOG=m
CONFIG_GPIO_WATCHDOG=m
# CONFIG_XILINX_WATCHDOG is not set
CONFIG_ZIIRAVE_WATCHDOG=m
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
CONFIG_ALIM7101_WDT=m
# CONFIG_I6300ESB_WDT is not set
CONFIG_KEMPLD_WDT=m
CONFIG_MEN_A21_WDT=m
CONFIG_WATCHDOG_RTAS=m

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_BLOCKIO=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_B43_PCI_BRIDGE=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_BLOCKIO=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=m
# CONFIG_MFD_ACT8945A is not set
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_AS3722 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
CONFIG_MFD_MADERA=m
CONFIG_MFD_MADERA_I2C=m
CONFIG_MFD_MADERA_SPI=m
CONFIG_MFD_CS47L15=y
CONFIG_MFD_CS47L35=y
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
CONFIG_MFD_CS47L92=y
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=m
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_DLN2=m
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_HI6421_PMIC is not set
CONFIG_HTC_PASIC3=m
# CONFIG_HTC_I2CPLD is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
CONFIG_MFD_IQS62X=m
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=m
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77620 is not set
CONFIG_MFD_MAX77650=m
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=m
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_CPCAP is not set
CONFIG_MFD_VIPERBOARD=m
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_UCB1400_CORE is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_RK808 is not set
# CONFIG_MFD_RN5T618 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SMSC is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
# CONFIG_MFD_SYSCON is not set
CONFIG_MFD_TI_AM335X_TSCADC=m
CONFIG_MFD_LP3943=m
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=m
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=m
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TPS65217 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=m
CONFIG_MFD_LM3533=m
# CONFIG_MFD_TC3589X is not set
# CONFIG_MFD_TMIO is not set
CONFIG_MFD_TQMX86=m
CONFIG_MFD_VX855=m
# CONFIG_MFD_LOCHNAGAR is not set
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ROHM_BD718XX is not set
# CONFIG_MFD_ROHM_BD70528 is not set
# CONFIG_MFD_ROHM_BD71828 is not set
# CONFIG_MFD_STPMIC1 is not set
CONFIG_MFD_STMFX=m
# CONFIG_RAVE_SP_CORE is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=m
CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
CONFIG_REGULATOR_88PG86X=m
CONFIG_REGULATOR_ACT8865=m
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_DA9062=m
CONFIG_REGULATOR_DA9210=m
CONFIG_REGULATOR_DA9211=m
CONFIG_REGULATOR_FAN53555=m
CONFIG_REGULATOR_GPIO=m
CONFIG_REGULATOR_ISL9305=m
CONFIG_REGULATOR_ISL6271A=m
CONFIG_REGULATOR_LM363X=m
CONFIG_REGULATOR_LP3971=m
CONFIG_REGULATOR_LP3972=m
CONFIG_REGULATOR_LP872X=m
CONFIG_REGULATOR_LP8755=m
CONFIG_REGULATOR_LTC3589=m
CONFIG_REGULATOR_LTC3676=m
CONFIG_REGULATOR_MAX1586=m
CONFIG_REGULATOR_MAX77650=m
CONFIG_REGULATOR_MAX8649=m
CONFIG_REGULATOR_MAX8660=m
CONFIG_REGULATOR_MAX8907=m
CONFIG_REGULATOR_MAX8952=m
CONFIG_REGULATOR_MAX8973=m
CONFIG_REGULATOR_MCP16502=m
CONFIG_REGULATOR_MP5416=m
CONFIG_REGULATOR_MP8859=m
CONFIG_REGULATOR_MP886X=m
CONFIG_REGULATOR_MPQ7920=m
CONFIG_REGULATOR_MT6311=m
CONFIG_REGULATOR_PFUZE100=m
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=m
CONFIG_REGULATOR_PWM=m
CONFIG_REGULATOR_QCOM_SPMI=m
CONFIG_REGULATOR_SLG51000=m
CONFIG_REGULATOR_SY8106A=m
CONFIG_REGULATOR_SY8824X=m
CONFIG_REGULATOR_TPS51632=m
CONFIG_REGULATOR_TPS62360=m
CONFIG_REGULATOR_TPS65023=m
CONFIG_REGULATOR_TPS6507X=m
CONFIG_REGULATOR_TPS65132=m
CONFIG_REGULATOR_TPS6524X=m
CONFIG_REGULATOR_VCTRL=m
CONFIG_CEC_CORE=m
CONFIG_CEC_NOTIFIER=y
CONFIG_RC_CORE=m
CONFIG_RC_MAP=m
CONFIG_LIRC=y
CONFIG_RC_DECODERS=y
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_SONY_DECODER=m
CONFIG_IR_SANYO_DECODER=m
CONFIG_IR_SHARP_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_XMP_DECODER=m
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_RCMM_DECODER=m
CONFIG_RC_DEVICES=y
CONFIG_RC_ATI_REMOTE=m
CONFIG_IR_HIX5HD2=m
CONFIG_IR_IMON=m
CONFIG_IR_IMON_RAW=m
CONFIG_IR_MCEUSB=m
CONFIG_IR_REDRAT3=m
CONFIG_IR_SPI=m
CONFIG_IR_STREAMZAP=m
CONFIG_IR_IGORPLUGUSB=m
CONFIG_IR_IGUANA=m
CONFIG_IR_TTUSBIR=m
CONFIG_RC_LOOPBACK=m
CONFIG_IR_GPIO_CIR=m
# CONFIG_IR_GPIO_TX is not set
# CONFIG_IR_PWM_TX is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
CONFIG_IR_SIR=m
CONFIG_RC_XBOX_DVD=m
CONFIG_MEDIA_SUPPORT=m

#
# Multimedia core support
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_MEDIA_CEC_RC=y
CONFIG_MEDIA_CONTROLLER=y
CONFIG_MEDIA_CONTROLLER_DVB=y
CONFIG_MEDIA_CONTROLLER_REQUEST_API=y
CONFIG_VIDEO_DEV=m
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_V4L2=m
CONFIG_VIDEO_V4L2_I2C=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_VIDEO_TUNER=m
CONFIG_V4L2_MEM2MEM_DEV=m
CONFIG_V4L2_FLASH_LED_CLASS=m
CONFIG_V4L2_FWNODE=m
CONFIG_VIDEOBUF_GEN=m
CONFIG_VIDEOBUF_DMA_SG=m
CONFIG_VIDEOBUF_VMALLOC=m
CONFIG_DVB_CORE=m
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_NET=y
CONFIG_TTPCI_EEPROM=m
CONFIG_DVB_MAX_ADAPTERS=8
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=y

#
# Webcam devices
#
CONFIG_USB_VIDEO_CLASS=m
CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
CONFIG_USB_GSPCA=m
CONFIG_USB_M5602=m
CONFIG_USB_STV06XX=m
CONFIG_USB_GL860=m
CONFIG_USB_GSPCA_BENQ=m
CONFIG_USB_GSPCA_CONEX=m
CONFIG_USB_GSPCA_CPIA1=m
CONFIG_USB_GSPCA_DTCS033=m
CONFIG_USB_GSPCA_ETOMS=m
CONFIG_USB_GSPCA_FINEPIX=m
CONFIG_USB_GSPCA_JEILINJ=m
CONFIG_USB_GSPCA_JL2005BCD=m
CONFIG_USB_GSPCA_KINECT=m
CONFIG_USB_GSPCA_KONICA=m
CONFIG_USB_GSPCA_MARS=m
CONFIG_USB_GSPCA_MR97310A=m
CONFIG_USB_GSPCA_NW80X=m
CONFIG_USB_GSPCA_OV519=m
CONFIG_USB_GSPCA_OV534=m
CONFIG_USB_GSPCA_OV534_9=m
CONFIG_USB_GSPCA_PAC207=m
CONFIG_USB_GSPCA_PAC7302=m
CONFIG_USB_GSPCA_PAC7311=m
CONFIG_USB_GSPCA_SE401=m
CONFIG_USB_GSPCA_SN9C2028=m
CONFIG_USB_GSPCA_SN9C20X=m
CONFIG_USB_GSPCA_SONIXB=m
CONFIG_USB_GSPCA_SONIXJ=m
CONFIG_USB_GSPCA_SPCA500=m
CONFIG_USB_GSPCA_SPCA501=m
CONFIG_USB_GSPCA_SPCA505=m
CONFIG_USB_GSPCA_SPCA506=m
CONFIG_USB_GSPCA_SPCA508=m
CONFIG_USB_GSPCA_SPCA561=m
CONFIG_USB_GSPCA_SPCA1528=m
CONFIG_USB_GSPCA_SQ905=m
CONFIG_USB_GSPCA_SQ905C=m
CONFIG_USB_GSPCA_SQ930X=m
CONFIG_USB_GSPCA_STK014=m
CONFIG_USB_GSPCA_STK1135=m
CONFIG_USB_GSPCA_STV0680=m
CONFIG_USB_GSPCA_SUNPLUS=m
CONFIG_USB_GSPCA_T613=m
CONFIG_USB_GSPCA_TOPRO=m
CONFIG_USB_GSPCA_TOUPTEK=m
CONFIG_USB_GSPCA_TV8532=m
CONFIG_USB_GSPCA_VC032X=m
CONFIG_USB_GSPCA_VICAM=m
CONFIG_USB_GSPCA_XIRLINK_CIT=m
CONFIG_USB_GSPCA_ZC3XX=m
CONFIG_USB_PWC=m
# CONFIG_USB_PWC_DEBUG is not set
CONFIG_USB_PWC_INPUT_EVDEV=y
CONFIG_VIDEO_CPIA2=m
CONFIG_USB_ZR364XX=m
CONFIG_USB_STKWEBCAM=m
CONFIG_USB_S2255=m
CONFIG_VIDEO_USBTV=m

#
# Analog TV USB devices
#
CONFIG_VIDEO_PVRUSB2=m
CONFIG_VIDEO_PVRUSB2_SYSFS=y
CONFIG_VIDEO_PVRUSB2_DVB=y
# CONFIG_VIDEO_PVRUSB2_DEBUGIFC is not set
CONFIG_VIDEO_HDPVR=m
CONFIG_VIDEO_STK1160_COMMON=m
CONFIG_VIDEO_STK1160=m
CONFIG_VIDEO_GO7007=m
CONFIG_VIDEO_GO7007_USB=m
CONFIG_VIDEO_GO7007_LOADER=m
CONFIG_VIDEO_GO7007_USB_S2250_BOARD=m

#
# Analog/digital TV USB devices
#
CONFIG_VIDEO_AU0828=m
CONFIG_VIDEO_AU0828_V4L2=y
CONFIG_VIDEO_AU0828_RC=y
CONFIG_VIDEO_CX231XX=m
CONFIG_VIDEO_CX231XX_RC=y
CONFIG_VIDEO_CX231XX_ALSA=m
CONFIG_VIDEO_CX231XX_DVB=m
CONFIG_VIDEO_TM6000=m
CONFIG_VIDEO_TM6000_ALSA=m
CONFIG_VIDEO_TM6000_DVB=m

#
# Digital TV USB devices
#
CONFIG_DVB_USB=m
# CONFIG_DVB_USB_DEBUG is not set
CONFIG_DVB_USB_DIB3000MC=m
CONFIG_DVB_USB_A800=m
CONFIG_DVB_USB_DIBUSB_MB=m
# CONFIG_DVB_USB_DIBUSB_MB_FAULTY is not set
CONFIG_DVB_USB_DIBUSB_MC=m
CONFIG_DVB_USB_DIB0700=m
CONFIG_DVB_USB_UMT_010=m
CONFIG_DVB_USB_CXUSB=m
CONFIG_DVB_USB_CXUSB_ANALOG=y
CONFIG_DVB_USB_M920X=m
CONFIG_DVB_USB_DIGITV=m
CONFIG_DVB_USB_VP7045=m
CONFIG_DVB_USB_VP702X=m
CONFIG_DVB_USB_GP8PSK=m
CONFIG_DVB_USB_NOVA_T_USB2=m
CONFIG_DVB_USB_TTUSB2=m
CONFIG_DVB_USB_DTT200U=m
CONFIG_DVB_USB_OPERA1=m
CONFIG_DVB_USB_AF9005=m
CONFIG_DVB_USB_AF9005_REMOTE=m
CONFIG_DVB_USB_PCTV452E=m
CONFIG_DVB_USB_DW2102=m
CONFIG_DVB_USB_CINERGY_T2=m
CONFIG_DVB_USB_DTV5100=m
CONFIG_DVB_USB_AZ6027=m
CONFIG_DVB_USB_TECHNISAT_USB2=m
CONFIG_DVB_USB_V2=m
CONFIG_DVB_USB_AF9015=m
CONFIG_DVB_USB_AF9035=m
CONFIG_DVB_USB_ANYSEE=m
CONFIG_DVB_USB_AU6610=m
CONFIG_DVB_USB_AZ6007=m
CONFIG_DVB_USB_CE6230=m
CONFIG_DVB_USB_EC168=m
CONFIG_DVB_USB_GL861=m
CONFIG_DVB_USB_LME2510=m
CONFIG_DVB_USB_MXL111SF=m
CONFIG_DVB_USB_RTL28XXU=m
CONFIG_DVB_USB_DVBSKY=m
CONFIG_DVB_USB_ZD1301=m
CONFIG_DVB_TTUSB_BUDGET=m
CONFIG_DVB_TTUSB_DEC=m
CONFIG_SMS_USB_DRV=m
CONFIG_DVB_B2C2_FLEXCOP_USB=m
# CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
CONFIG_DVB_AS102=m

#
# Webcam, TV (analog/digital) USB devices
#
CONFIG_VIDEO_EM28XX=m
CONFIG_VIDEO_EM28XX_V4L2=m
CONFIG_VIDEO_EM28XX_ALSA=m
CONFIG_VIDEO_EM28XX_DVB=m
CONFIG_VIDEO_EM28XX_RC=m

#
# Software defined radio USB devices
#
CONFIG_USB_AIRSPY=m
CONFIG_USB_HACKRF=m
CONFIG_USB_MSI2500=m

#
# USB HDMI CEC adapters
#
CONFIG_USB_PULSE8_CEC=m
CONFIG_USB_RAINSHADOW_CEC=m
CONFIG_MEDIA_PCI_SUPPORT=y

#
# Media capture support
#
CONFIG_VIDEO_SOLO6X10=m
CONFIG_VIDEO_TW5864=m
CONFIG_VIDEO_TW68=m
CONFIG_VIDEO_TW686X=m

#
# Media capture/analog TV support
#
CONFIG_VIDEO_IVTV=m
# CONFIG_VIDEO_IVTV_DEPRECATED_IOCTLS is not set
CONFIG_VIDEO_IVTV_ALSA=m
CONFIG_VIDEO_FB_IVTV=m
CONFIG_VIDEO_HEXIUM_GEMINI=m
CONFIG_VIDEO_HEXIUM_ORION=m
CONFIG_VIDEO_MXB=m
CONFIG_VIDEO_DT3155=m

#
# Media capture/analog/hybrid TV support
#
CONFIG_VIDEO_CX18=m
CONFIG_VIDEO_CX18_ALSA=m
CONFIG_VIDEO_CX23885=m
CONFIG_MEDIA_ALTERA_CI=m
CONFIG_VIDEO_CX25821=m
CONFIG_VIDEO_CX25821_ALSA=m
CONFIG_VIDEO_CX88=m
CONFIG_VIDEO_CX88_ALSA=m
CONFIG_VIDEO_CX88_BLACKBIRD=m
CONFIG_VIDEO_CX88_DVB=m
CONFIG_VIDEO_CX88_ENABLE_VP3054=y
CONFIG_VIDEO_CX88_VP3054=m
CONFIG_VIDEO_CX88_MPEG=m
CONFIG_VIDEO_BT848=m
CONFIG_DVB_BT8XX=m
CONFIG_VIDEO_SAA7134=m
CONFIG_VIDEO_SAA7134_ALSA=m
CONFIG_VIDEO_SAA7134_RC=y
CONFIG_VIDEO_SAA7134_DVB=m
CONFIG_VIDEO_SAA7134_GO7007=m
CONFIG_VIDEO_SAA7164=m

#
# Media digital TV PCI Adapters
#
CONFIG_DVB_AV7110_IR=y
CONFIG_DVB_AV7110=m
CONFIG_DVB_AV7110_OSD=y
CONFIG_DVB_BUDGET_CORE=m
CONFIG_DVB_BUDGET=m
CONFIG_DVB_BUDGET_CI=m
CONFIG_DVB_BUDGET_AV=m
CONFIG_DVB_BUDGET_PATCH=m
CONFIG_DVB_B2C2_FLEXCOP_PCI=m
# CONFIG_DVB_B2C2_FLEXCOP_PCI_DEBUG is not set
CONFIG_DVB_PLUTO2=m
CONFIG_DVB_DM1105=m
CONFIG_DVB_PT1=m
CONFIG_DVB_PT3=m
CONFIG_MANTIS_CORE=m
CONFIG_DVB_MANTIS=m
CONFIG_DVB_HOPPER=m
CONFIG_DVB_NGENE=m
CONFIG_DVB_DDBRIDGE=m
# CONFIG_DVB_DDBRIDGE_MSIENABLE is not set
CONFIG_DVB_SMIPCIE=m
CONFIG_DVB_NETUP_UNIDVB=m
CONFIG_V4L_PLATFORM_DRIVERS=y
CONFIG_VIDEO_CADENCE=y
CONFIG_VIDEO_CADENCE_CSI2RX=m
CONFIG_VIDEO_CADENCE_CSI2TX=m
CONFIG_VIDEO_ASPEED=m
CONFIG_VIDEO_MUX=m
CONFIG_VIDEO_XILINX=m
CONFIG_VIDEO_XILINX_TPG=m
CONFIG_VIDEO_XILINX_VTC=m
CONFIG_V4L_MEM2MEM_DRIVERS=y
CONFIG_VIDEO_MEM2MEM_DEINTERLACE=m
# CONFIG_VIDEO_SH_VEU is not set
CONFIG_V4L_TEST_DRIVERS=y
CONFIG_VIDEO_VIMC=m
CONFIG_VIDEO_VIVID=m
CONFIG_VIDEO_VIVID_CEC=y
CONFIG_VIDEO_VIVID_MAX_DEVS=64
CONFIG_VIDEO_VIM2M=m
CONFIG_VIDEO_VICODEC=m
CONFIG_DVB_PLATFORM_DRIVERS=y
CONFIG_CEC_PLATFORM_DRIVERS=y
CONFIG_SDR_PLATFORM_DRIVERS=y

#
# Supported MMC/SDIO adapters
#
CONFIG_RADIO_ADAPTERS=y
CONFIG_RADIO_TEA575X=m
CONFIG_RADIO_SI470X=m
CONFIG_USB_SI470X=m
# CONFIG_I2C_SI470X is not set
CONFIG_RADIO_SI4713=m
CONFIG_USB_SI4713=m
CONFIG_PLATFORM_SI4713=m
CONFIG_I2C_SI4713=m
CONFIG_USB_MR800=m
CONFIG_USB_DSBR=m
CONFIG_RADIO_MAXIRADIO=m
CONFIG_RADIO_SHARK=m
CONFIG_RADIO_SHARK2=m
CONFIG_USB_KEENE=m
CONFIG_USB_RAREMONO=m
CONFIG_USB_MA901=m
CONFIG_RADIO_TEA5764=m
CONFIG_RADIO_SAA7706H=m
CONFIG_RADIO_TEF6862=m
CONFIG_RADIO_WL1273=m

#
# Texas Instruments WL128x FM driver (ST based)
#
CONFIG_RADIO_WL128X=m
# end of Texas Instruments WL128x FM driver (ST based)

#
# Supported FireWire (IEEE 1394) Adapters
#
CONFIG_DVB_FIREDTV=m
CONFIG_DVB_FIREDTV_INPUT=y
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_VIDEO_CX2341X=m
CONFIG_VIDEO_TVEEPROM=m
CONFIG_CYPRESS_FIRMWARE=m
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_DMA_CONTIG=m
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_VIDEOBUF2_DMA_SG=m
CONFIG_VIDEOBUF2_DVB=m
CONFIG_DVB_B2C2_FLEXCOP=m
CONFIG_VIDEO_SAA7146=m
CONFIG_VIDEO_SAA7146_VV=m
CONFIG_SMS_SIANO_MDTV=m
CONFIG_SMS_SIANO_RC=y
CONFIG_VIDEO_V4L2_TPG=m

#
# Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
#
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=m

#
# I2C Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_TVAUDIO=m
CONFIG_VIDEO_TDA7432=m
CONFIG_VIDEO_TDA9840=m
CONFIG_VIDEO_TEA6415C=m
CONFIG_VIDEO_TEA6420=m
CONFIG_VIDEO_MSP3400=m
CONFIG_VIDEO_CS3308=m
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=m
CONFIG_VIDEO_TLV320AIC23B=m
CONFIG_VIDEO_UDA1342=m
CONFIG_VIDEO_WM8775=m
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_VP27SMPX=m
CONFIG_VIDEO_SONY_BTF_MPX=m

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=m
CONFIG_VIDEO_ADV7183=m
CONFIG_VIDEO_ADV748X=m
CONFIG_VIDEO_ADV7604=m
CONFIG_VIDEO_ADV7604_CEC=y
CONFIG_VIDEO_ADV7842=m
CONFIG_VIDEO_ADV7842_CEC=y
CONFIG_VIDEO_BT819=m
CONFIG_VIDEO_BT856=m
CONFIG_VIDEO_BT866=m
CONFIG_VIDEO_KS0127=m
CONFIG_VIDEO_ML86V7667=m
CONFIG_VIDEO_SAA7110=m
CONFIG_VIDEO_SAA711X=m
CONFIG_VIDEO_TC358743=m
CONFIG_VIDEO_TC358743_CEC=y
CONFIG_VIDEO_TVP514X=m
CONFIG_VIDEO_TVP5150=m
CONFIG_VIDEO_TVP7002=m
CONFIG_VIDEO_TW2804=m
CONFIG_VIDEO_TW9903=m
CONFIG_VIDEO_TW9906=m
CONFIG_VIDEO_TW9910=m
CONFIG_VIDEO_VPX3220=m

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
CONFIG_VIDEO_CX25840=m

#
# Video encoders
#
CONFIG_VIDEO_SAA7127=m
CONFIG_VIDEO_SAA7185=m
CONFIG_VIDEO_ADV7170=m
CONFIG_VIDEO_ADV7175=m
CONFIG_VIDEO_ADV7343=m
CONFIG_VIDEO_ADV7393=m
CONFIG_VIDEO_AD9389B=m
CONFIG_VIDEO_AK881X=m
CONFIG_VIDEO_THS8200=m

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=m
CONFIG_VIDEO_HI556=m
CONFIG_VIDEO_IMX214=m
CONFIG_VIDEO_IMX219=m
CONFIG_VIDEO_IMX258=m
CONFIG_VIDEO_IMX274=m
CONFIG_VIDEO_IMX290=m
CONFIG_VIDEO_IMX319=m
CONFIG_VIDEO_IMX355=m
CONFIG_VIDEO_OV2640=m
CONFIG_VIDEO_OV2659=m
CONFIG_VIDEO_OV2680=m
CONFIG_VIDEO_OV2685=m
CONFIG_VIDEO_OV5640=m
CONFIG_VIDEO_OV5645=m
CONFIG_VIDEO_OV5647=m
CONFIG_VIDEO_OV6650=m
CONFIG_VIDEO_OV5670=m
CONFIG_VIDEO_OV5675=m
CONFIG_VIDEO_OV5695=m
CONFIG_VIDEO_OV7251=m
CONFIG_VIDEO_OV772X=m
CONFIG_VIDEO_OV7640=m
CONFIG_VIDEO_OV7670=m
CONFIG_VIDEO_OV7740=m
CONFIG_VIDEO_OV8856=m
CONFIG_VIDEO_OV9640=m
CONFIG_VIDEO_OV9650=m
CONFIG_VIDEO_OV13858=m
CONFIG_VIDEO_VS6624=m
CONFIG_VIDEO_MT9M001=m
CONFIG_VIDEO_MT9M032=m
CONFIG_VIDEO_MT9M111=m
CONFIG_VIDEO_MT9P031=m
CONFIG_VIDEO_MT9T001=m
CONFIG_VIDEO_MT9T112=m
CONFIG_VIDEO_MT9V011=m
CONFIG_VIDEO_MT9V032=m
CONFIG_VIDEO_MT9V111=m
CONFIG_VIDEO_SR030PC30=m
CONFIG_VIDEO_NOON010PC30=m
CONFIG_VIDEO_M5MOLS=m
CONFIG_VIDEO_RJ54N1=m
CONFIG_VIDEO_S5K6AA=m
CONFIG_VIDEO_S5K6A3=m
CONFIG_VIDEO_S5K4ECGX=m
CONFIG_VIDEO_S5K5BAF=m
CONFIG_VIDEO_ET8EK8=m
CONFIG_VIDEO_S5C73M3=m

#
# Lens drivers
#
CONFIG_VIDEO_AD5820=m
CONFIG_VIDEO_AK7375=m
CONFIG_VIDEO_DW9714=m
CONFIG_VIDEO_DW9807_VCM=m

#
# Flash devices
#
CONFIG_VIDEO_ADP1653=m
CONFIG_VIDEO_LM3560=m
CONFIG_VIDEO_LM3646=m

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=m
CONFIG_VIDEO_UPD64083=m

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=m

#
# SDR tuner chips
#
CONFIG_SDR_MAX2175=m

#
# Miscellaneous helper chips
#
CONFIG_VIDEO_THS7303=m
CONFIG_VIDEO_M52790=m
CONFIG_VIDEO_I2C=m
# CONFIG_VIDEO_ST_MIPID02 is not set
# end of I2C Encoders, decoders, sensors and other helper chips

#
# SPI helper chips
#
CONFIG_VIDEO_GS1662=m
# end of SPI helper chips

#
# Media SPI Adapters
#
CONFIG_CXD2880_SPI_DRV=m
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_TDA18250=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
CONFIG_MEDIA_TUNER_MSI001=m
CONFIG_MEDIA_TUNER_MT20XX=m
CONFIG_MEDIA_TUNER_MT2060=m
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MT2131=m
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC5000=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_MXL5005S=m
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_TDA18218=m
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=m
CONFIG_MEDIA_TUNER_FC0013=m
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_E4000=m
CONFIG_MEDIA_TUNER_FC2580=m
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_IT913X=m
CONFIG_MEDIA_TUNER_R820T=m
CONFIG_MEDIA_TUNER_MXL301RF=m
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_QM1D1B0004=m
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_STB0899=m
CONFIG_DVB_STB6100=m
CONFIG_DVB_STV090x=m
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=m
CONFIG_DVB_STV6111=m
CONFIG_DVB_MXL5XX=m
CONFIG_DVB_M88DS3103=m

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
CONFIG_DVB_TDA18271C2DD=m
CONFIG_DVB_SI2165=m
CONFIG_DVB_MN88472=m
CONFIG_DVB_MN88473=m

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
CONFIG_DVB_CX24123=m
CONFIG_DVB_MT312=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m
CONFIG_DVB_S5H1420=m
CONFIG_DVB_STV0288=m
CONFIG_DVB_STB6000=m
CONFIG_DVB_STV0299=m
CONFIG_DVB_STV6110=m
CONFIG_DVB_STV0900=m
CONFIG_DVB_TDA8083=m
CONFIG_DVB_TDA10086=m
CONFIG_DVB_TDA8261=m
CONFIG_DVB_VES1X93=m
CONFIG_DVB_TUNER_ITD1000=m
CONFIG_DVB_TUNER_CX24113=m
CONFIG_DVB_TDA826X=m
CONFIG_DVB_TUA6100=m
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=m
CONFIG_DVB_CX24120=m
CONFIG_DVB_SI21XX=m
CONFIG_DVB_TS2020=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
CONFIG_DVB_TDA10071=m

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_SP8870=m
CONFIG_DVB_SP887X=m
CONFIG_DVB_CX22700=m
CONFIG_DVB_CX22702=m
CONFIG_DVB_S5H1432=m
CONFIG_DVB_DRXD=m
CONFIG_DVB_L64781=m
CONFIG_DVB_TDA1004X=m
CONFIG_DVB_NXT6000=m
CONFIG_DVB_MT352=m
CONFIG_DVB_ZL10353=m
CONFIG_DVB_DIB3000MB=m
CONFIG_DVB_DIB3000MC=m
CONFIG_DVB_DIB7000M=m
CONFIG_DVB_DIB7000P=m
CONFIG_DVB_DIB9000=m
CONFIG_DVB_TDA10048=m
CONFIG_DVB_AF9013=m
CONFIG_DVB_EC100=m
CONFIG_DVB_STV0367=m
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=m
CONFIG_DVB_RTL2830=m
CONFIG_DVB_RTL2832=m
CONFIG_DVB_RTL2832_SDR=m
CONFIG_DVB_SI2168=m
CONFIG_DVB_AS102_FE=m
CONFIG_DVB_ZD1301_DEMOD=m
CONFIG_DVB_GP8PSK_FE=m
CONFIG_DVB_CXD2880=m

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=m
CONFIG_DVB_TDA10021=m
CONFIG_DVB_TDA10023=m
CONFIG_DVB_STV0297=m

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_NXT200X=m
CONFIG_DVB_OR51211=m
CONFIG_DVB_OR51132=m
CONFIG_DVB_BCM3510=m
CONFIG_DVB_LGDT330X=m
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LGDT3306A=m
CONFIG_DVB_LG2160=m
CONFIG_DVB_S5H1409=m
CONFIG_DVB_AU8522=m
CONFIG_DVB_AU8522_DTV=m
CONFIG_DVB_AU8522_V4L=m
CONFIG_DVB_S5H1411=m

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_S921=m
CONFIG_DVB_DIB8000=m
CONFIG_DVB_MB86A20S=m

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=m
CONFIG_DVB_MN88443X=m

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m
CONFIG_DVB_TUNER_DIB0070=m
CONFIG_DVB_TUNER_DIB0090=m

#
# SEC control devices for DVB-S
#
CONFIG_DVB_DRX39XYJ=m
CONFIG_DVB_LNBH25=m
CONFIG_DVB_LNBH29=m
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
CONFIG_DVB_ISL6405=m
CONFIG_DVB_ISL6421=m
CONFIG_DVB_ISL6423=m
CONFIG_DVB_A8293=m
CONFIG_DVB_LGS8GL5=m
CONFIG_DVB_LGS8GXX=m
CONFIG_DVB_ATBM8830=m
CONFIG_DVB_TDA665x=m
CONFIG_DVB_IX2505V=m
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_AF9033=m
CONFIG_DVB_HORUS3A=m
CONFIG_DVB_ASCOT2E=m
CONFIG_DVB_HELENE=m

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
CONFIG_DVB_SP2=m

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=m
# end of Customise DVB Frontends

#
# Graphics support
#
CONFIG_AGP=m
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_KMS_FB_HELPER=y
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_TTM=m
CONFIG_DRM_TTM_DMA_PAGE_POOL=y
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
CONFIG_DRM_I2C_NXP_TDA9950=m
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

CONFIG_DRM_RADEON=m
CONFIG_DRM_RADEON_USERPTR=y
CONFIG_DRM_AMDGPU=m
CONFIG_DRM_AMDGPU_SI=y
CONFIG_DRM_AMDGPU_CIK=y
CONFIG_DRM_AMDGPU_USERPTR=y
# CONFIG_DRM_AMDGPU_GART_DEBUGFS is not set

#
# ACP (Audio CoProcessor) Configuration
#
CONFIG_DRM_AMD_ACP=y
# end of ACP (Audio CoProcessor) Configuration

#
# Display Engine Configuration
#
CONFIG_DRM_AMD_DC=y
CONFIG_DRM_AMD_DC_DCN=y
CONFIG_DRM_AMD_DC_HDCP=y
# CONFIG_DEBUG_KERNEL_DC is not set
# end of Display Engine Configuration

CONFIG_HSA_AMD=y
CONFIG_DRM_NOUVEAU=m
# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
# CONFIG_NOUVEAU_DEBUG_MMU is not set
CONFIG_DRM_NOUVEAU_BACKLIGHT=y
CONFIG_DRM_VGEM=m
CONFIG_DRM_VKMS=m
CONFIG_DRM_UDL=m
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_RCAR_DW_HDMI is not set
# CONFIG_DRM_RCAR_LVDS is not set
CONFIG_DRM_QXL=m
CONFIG_DRM_BOCHS=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_BOE_HIMAX8279D is not set
# CONFIG_DRM_PANEL_BOE_TV101WUM_NL6 is not set
# CONFIG_DRM_PANEL_LVDS is not set
# CONFIG_DRM_PANEL_SIMPLE is not set
# CONFIG_DRM_PANEL_ELIDA_KD35T133 is not set
# CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02 is not set
# CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D is not set
# CONFIG_DRM_PANEL_ILITEK_IL9322 is not set
# CONFIG_DRM_PANEL_ILITEK_ILI9881C is not set
# CONFIG_DRM_PANEL_INNOLUX_P079ZCA is not set
# CONFIG_DRM_PANEL_JDI_LT070ME05000 is not set
# CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04 is not set
# CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
# CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
# CONFIG_DRM_PANEL_LG_LB035Q02 is not set
# CONFIG_DRM_PANEL_LG_LG4573 is not set
# CONFIG_DRM_PANEL_NEC_NL8048HL11 is not set
# CONFIG_DRM_PANEL_NOVATEK_NT35510 is not set
# CONFIG_DRM_PANEL_NOVATEK_NT39016 is not set
# CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO is not set
# CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS=m
# CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_RAYDIUM_RM67191 is not set
# CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
# CONFIG_DRM_PANEL_ROCKTECH_JH057N00900 is not set
# CONFIG_DRM_PANEL_RONBO_RB070D30 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6D16D0 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=m
# CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
# CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
# CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
# CONFIG_DRM_PANEL_SHARP_LS037V7DW01 is not set
# CONFIG_DRM_PANEL_SHARP_LS043T1LE01 is not set
# CONFIG_DRM_PANEL_SITRONIX_ST7701 is not set
# CONFIG_DRM_PANEL_SITRONIX_ST7789V is not set
# CONFIG_DRM_PANEL_SONY_ACX424AKP is not set
# CONFIG_DRM_PANEL_SONY_ACX565AKM is not set
# CONFIG_DRM_PANEL_TPO_TD028TTEC1 is not set
# CONFIG_DRM_PANEL_TPO_TD043MTEA1 is not set
# CONFIG_DRM_PANEL_TPO_TPG110 is not set
# CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA is not set
# CONFIG_DRM_PANEL_XINPENG_XPP055C272 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_CDNS_DSI is not set
# CONFIG_DRM_DISPLAY_CONNECTOR is not set
CONFIG_DRM_LVDS_CODEC=m
# CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
# CONFIG_DRM_NXP_PTN3460 is not set
# CONFIG_DRM_PARADE_PS8622 is not set
# CONFIG_DRM_PARADE_PS8640 is not set
# CONFIG_DRM_SIL_SII8620 is not set
# CONFIG_DRM_SII902X is not set
# CONFIG_DRM_SII9234 is not set
# CONFIG_DRM_SIMPLE_BRIDGE is not set
# CONFIG_DRM_THINE_THC63LVD1024 is not set
# CONFIG_DRM_TOSHIBA_TC358764 is not set
# CONFIG_DRM_TOSHIBA_TC358767 is not set
# CONFIG_DRM_TOSHIBA_TC358768 is not set
# CONFIG_DRM_TI_TFP410 is not set
# CONFIG_DRM_TI_SN65DSI86 is not set
# CONFIG_DRM_TI_TPD12S015 is not set
# CONFIG_DRM_ANALOGIX_ANX6345 is not set
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
CONFIG_DRM_I2C_ADV7511=m
CONFIG_DRM_I2C_ADV7511_CEC=y
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
# CONFIG_DRM_ARCPGU is not set
CONFIG_DRM_GM12U320=m
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=m
# CONFIG_DRM_LIB_RANDOM is not set

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_DDC=m
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_MACMODES=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_OF=y
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
CONFIG_FB_UVESA=m
CONFIG_FB_OPENCORES=m
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
CONFIG_FB_I740=m
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
CONFIG_FB_SMSCUFX=m
# CONFIG_FB_UDL is not set
CONFIG_FB_IBM_GXT4500=m
# CONFIG_FB_VIRTUAL is not set
CONFIG_FB_METRONOME=m
CONFIG_FB_MB862XX=m
CONFIG_FB_MB862XX_PCI_GDC=y
# CONFIG_FB_MB862XX_LIME is not set
CONFIG_FB_MB862XX_I2C=y
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_GENERIC=m
CONFIG_BACKLIGHT_LM3533=m
CONFIG_BACKLIGHT_PWM=m
CONFIG_BACKLIGHT_QCOM_WLED=m
CONFIG_BACKLIGHT_ADP8860=m
CONFIG_BACKLIGHT_ADP8870=m
CONFIG_BACKLIGHT_LM3630A=m
CONFIG_BACKLIGHT_LM3639=m
CONFIG_BACKLIGHT_LP855X=m
CONFIG_BACKLIGHT_GPIO=m
CONFIG_BACKLIGHT_LV5207LP=m
CONFIG_BACKLIGHT_BD6107=m
CONFIG_BACKLIGHT_ARCXCNN=m
CONFIG_BACKLIGHT_LED=m
# end of Backlight & LCD device support

CONFIG_VGASTATE=m
CONFIG_HDMI=y

#
# Console display driver support
#
# CONFIG_VGA_CONSOLE is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
CONFIG_LOGO_LINUX_VGA16=y
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

CONFIG_SOUND=m
CONFIG_SOUND_OSS_CORE=y
# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_HWDEP=m
CONFIG_SND_SEQ_DEVICE=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
CONFIG_SND_MIXER_OSS=m
CONFIG_SND_PCM_OSS=m
CONFIG_SND_PCM_OSS_PLUGINS=y
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_HRTIMER=m
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
CONFIG_SND_VERBOSE_PRINTK=y
CONFIG_SND_DEBUG=y
# CONFIG_SND_DEBUG_VERBOSE is not set
# CONFIG_SND_PCM_XRUN_DEBUG is not set
# CONFIG_SND_CTL_VALIDATION is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_SEQUENCER=m
CONFIG_SND_SEQ_DUMMY=m
CONFIG_SND_SEQUENCER_OSS=m
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_SEQ_MIDI_EVENT=m
CONFIG_SND_SEQ_MIDI=m
CONFIG_SND_SEQ_VIRMIDI=m
CONFIG_SND_MPU401_UART=m
# CONFIG_SND_OPL3_LIB_SEQ is not set
# CONFIG_SND_OPL4_LIB_SEQ is not set
CONFIG_SND_AC97_CODEC=m
CONFIG_SND_DRIVERS=y
CONFIG_SND_DUMMY=m
CONFIG_SND_ALOOP=m
CONFIG_SND_VIRMIDI=m
CONFIG_SND_MTPAV=m
CONFIG_SND_MTS64=m
CONFIG_SND_SERIAL_U16550=m
CONFIG_SND_MPU401=m
CONFIG_SND_PORTMAN2X4=m
CONFIG_SND_AC97_POWER_SAVE=y
CONFIG_SND_AC97_POWER_SAVE_DEFAULT=0
CONFIG_SND_PCI=y
# CONFIG_SND_AD1889 is not set
# CONFIG_SND_ALS4000 is not set
# CONFIG_SND_ATIIXP is not set
# CONFIG_SND_ATIIXP_MODEM is not set
# CONFIG_SND_AU8810 is not set
# CONFIG_SND_AU8820 is not set
# CONFIG_SND_AU8830 is not set
CONFIG_SND_AW2=m
# CONFIG_SND_BT87X is not set
# CONFIG_SND_CA0106 is not set
# CONFIG_SND_CMIPCI is not set
CONFIG_SND_OXYGEN_LIB=m
CONFIG_SND_OXYGEN=m
# CONFIG_SND_CS4281 is not set
# CONFIG_SND_CS46XX is not set
CONFIG_SND_CTXFI=m
# CONFIG_SND_DARLA20 is not set
# CONFIG_SND_GINA20 is not set
# CONFIG_SND_LAYLA20 is not set
# CONFIG_SND_DARLA24 is not set
# CONFIG_SND_GINA24 is not set
# CONFIG_SND_LAYLA24 is not set
# CONFIG_SND_MONA is not set
# CONFIG_SND_MIA is not set
# CONFIG_SND_ECHO3G is not set
# CONFIG_SND_INDIGO is not set
# CONFIG_SND_INDIGOIO is not set
# CONFIG_SND_INDIGODJ is not set
CONFIG_SND_INDIGOIOX=m
CONFIG_SND_INDIGODJX=m
# CONFIG_SND_EMU10K1_SEQ is not set
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
# CONFIG_SND_FM801 is not set
# CONFIG_SND_HDSP is not set
# CONFIG_SND_HDSPM is not set
# CONFIG_SND_ICE1724 is not set
CONFIG_SND_INTEL8X0=m
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_KORG1212 is not set
CONFIG_SND_LOLA=m
CONFIG_SND_LX6464ES=m
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
# CONFIG_SND_PCXHR is not set
# CONFIG_SND_RIPTIDE is not set
# CONFIG_SND_RME32 is not set
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
# CONFIG_SND_VIA82XX is not set
# CONFIG_SND_VIA82XX_MODEM is not set
CONFIG_SND_VIRTUOSO=m
# CONFIG_SND_VX222 is not set
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
# CONFIG_SND_HDA_INTEL is not set
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=0
CONFIG_SND_PPC=y
# CONFIG_SND_SPI is not set
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=m
CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER=y
CONFIG_SND_USB_UA101=m
CONFIG_SND_USB_USX2Y=m
CONFIG_SND_USB_CAIAQ=m
CONFIG_SND_USB_CAIAQ_INPUT=y
CONFIG_SND_USB_6FIRE=m
CONFIG_SND_USB_HIFACE=m
# CONFIG_SND_BCD2000 is not set
CONFIG_SND_USB_LINE6=m
CONFIG_SND_USB_POD=m
CONFIG_SND_USB_PODHD=m
CONFIG_SND_USB_TONEPORT=m
CONFIG_SND_USB_VARIAX=m
CONFIG_SND_FIREWIRE=y
CONFIG_SND_FIREWIRE_LIB=m
CONFIG_SND_DICE=m
CONFIG_SND_OXFW=m
CONFIG_SND_ISIGHT=m
CONFIG_SND_FIREWORKS=m
CONFIG_SND_BEBOB=m
CONFIG_SND_FIREWIRE_DIGI00X=m
CONFIG_SND_FIREWIRE_TASCAM=m
CONFIG_SND_FIREWIRE_MOTU=m
CONFIG_SND_FIREFACE=m
# CONFIG_SND_SOC is not set
CONFIG_AC97_BUS=m

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=m

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
CONFIG_HID_ACCUTOUCH=m
CONFIG_HID_ACRUX=m
CONFIG_HID_ACRUX_FF=y
CONFIG_HID_APPLE=m
CONFIG_HID_APPLEIR=m
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
CONFIG_HID_BETOP_FF=m
CONFIG_HID_BIGBEN_FF=m
CONFIG_HID_CHERRY=m
CONFIG_HID_CHICONY=m
CONFIG_HID_CORSAIR=m
CONFIG_HID_COUGAR=m
CONFIG_HID_MACALLY=m
CONFIG_HID_PRODIKEYS=m
CONFIG_HID_CMEDIA=m
CONFIG_HID_CP2112=m
CONFIG_HID_CREATIVE_SB0540=m
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
CONFIG_DRAGONRISE_FF=y
CONFIG_HID_EMS_FF=m
CONFIG_HID_ELAN=m
CONFIG_HID_ELECOM=m
CONFIG_HID_ELO=m
CONFIG_HID_EZKEY=m
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
CONFIG_HID_GLORIOUS=m
CONFIG_HID_HOLTEK=m
CONFIG_HOLTEK_FF=y
CONFIG_HID_GT683R=m
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
CONFIG_HID_UCLOGIC=m
CONFIG_HID_WALTOP=m
CONFIG_HID_VIEWSONIC=m
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
# CONFIG_HID_ITE is not set
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
CONFIG_LOGITECH_FF=y
# CONFIG_LOGIRUMBLEPAD2_FF is not set
CONFIG_LOGIG940_FF=y
CONFIG_LOGIWHEELS_FF=y
CONFIG_HID_MAGICMOUSE=m
CONFIG_HID_MALTRON=m
CONFIG_HID_MAYFLASH=m
CONFIG_HID_REDRAGON=m
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_NTI=m
CONFIG_HID_NTRIG=m
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
CONFIG_PANTHERLORD_FF=y
CONFIG_HID_PENMOUNT=m
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
CONFIG_HID_PRIMAX=m
CONFIG_HID_RETRODE=m
CONFIG_HID_ROCCAT=m
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
CONFIG_HID_SONY=m
CONFIG_SONY_FF=y
CONFIG_HID_SPEEDLINK=m
CONFIG_HID_STEAM=m
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
CONFIG_GREENASIA_FF=y
CONFIG_HID_SMARTJOYPLUS=m
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
CONFIG_THRUSTMASTER_FF=y
CONFIG_HID_UDRAW_PS3=m
CONFIG_HID_U2FZERO=m
CONFIG_HID_WACOM=m
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
CONFIG_ZEROPLUS_FF=y
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=m
# CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
CONFIG_HID_ALPS=m
CONFIG_HID_MCP2221=m
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=m
CONFIG_HID_PID=y
CONFIG_USB_HIDDEV=y

#
# USB HID Boot Protocol drivers
#
# CONFIG_USB_KBD is not set
# CONFIG_USB_MOUSE is not set
# end of USB HID Boot Protocol drivers
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID=m
# end of I2C HID support
# end of HID support

CONFIG_USB_OHCI_BIG_ENDIAN_DESC=y
CONFIG_USB_OHCI_BIG_ENDIAN_MMIO=y
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=m
CONFIG_USB_CONN_GPIO=m
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=m
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_DYNAMIC_MINORS is not set
CONFIG_USB_OTG=y
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
CONFIG_USB_OTG_FSM=m
CONFIG_USB_LEDS_TRIGGER_USBPORT=m
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=m

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=m
CONFIG_USB_XHCI_HCD=m
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=m
CONFIG_USB_XHCI_PLATFORM=m
CONFIG_USB_EHCI_HCD=m
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=m
CONFIG_USB_EHCI_FSL=m
CONFIG_USB_EHCI_HCD_PPC_OF=y
CONFIG_USB_EHCI_HCD_PLATFORM=m
CONFIG_USB_OXU210HP_HCD=m
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_FOTG210_HCD=m
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=m
CONFIG_USB_OHCI_HCD_PPC_OF_BE=y
# CONFIG_USB_OHCI_HCD_PPC_OF_LE is not set
CONFIG_USB_OHCI_HCD_PPC_OF=y
CONFIG_USB_OHCI_HCD_PCI=m
CONFIG_USB_OHCI_HCD_SSB=y
CONFIG_USB_OHCI_HCD_PLATFORM=m
CONFIG_USB_UHCI_HCD=m
CONFIG_USB_FHCI_HCD=m
# CONFIG_FHCI_DEBUG is not set
# CONFIG_USB_U132_HCD is not set
# CONFIG_USB_SL811_HCD is not set
CONFIG_USB_R8A66597_HCD=m
CONFIG_USB_HCD_BCMA=m
CONFIG_USB_HCD_SSB=m
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=m
CONFIG_USB_PRINTER=m
CONFIG_USB_WDM=m
CONFIG_USB_TMC=m

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
CONFIG_USB_STORAGE_REALTEK=m
CONFIG_REALTEK_AUTOPM=y
CONFIG_USB_STORAGE_DATAFAB=m
CONFIG_USB_STORAGE_FREECOM=m
CONFIG_USB_STORAGE_ISD200=m
CONFIG_USB_STORAGE_USBAT=m
CONFIG_USB_STORAGE_SDDR09=m
CONFIG_USB_STORAGE_SDDR55=m
CONFIG_USB_STORAGE_JUMPSHOT=m
CONFIG_USB_STORAGE_ALAUDA=m
CONFIG_USB_STORAGE_ONETOUCH=m
CONFIG_USB_STORAGE_KARMA=m
CONFIG_USB_STORAGE_CYPRESS_ATACB=m
CONFIG_USB_STORAGE_ENE_UB6250=m
CONFIG_USB_UAS=m

#
# USB Imaging devices
#
CONFIG_USB_MDC800=m
CONFIG_USB_MICROTEK=m
CONFIG_USBIP_CORE=m
CONFIG_USBIP_VHCI_HCD=m
CONFIG_USBIP_VHCI_HC_PORTS=8
CONFIG_USBIP_VHCI_NR_HCS=1
CONFIG_USBIP_HOST=m
# CONFIG_USBIP_DEBUG is not set
CONFIG_USB_CDNS3=m
CONFIG_USB_CDNS3_HOST=y
CONFIG_USB_MUSB_HDRC=m
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
CONFIG_USB_ISP1760=m
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y

#
# USB port drivers
#
CONFIG_USB_USS720=m
CONFIG_USB_SERIAL=m
CONFIG_USB_SERIAL_GENERIC=y
CONFIG_USB_SERIAL_SIMPLE=m
CONFIG_USB_SERIAL_AIRCABLE=m
CONFIG_USB_SERIAL_ARK3116=m
CONFIG_USB_SERIAL_BELKIN=m
CONFIG_USB_SERIAL_CH341=m
CONFIG_USB_SERIAL_WHITEHEAT=m
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
CONFIG_USB_SERIAL_CP210X=m
CONFIG_USB_SERIAL_CYPRESS_M8=m
CONFIG_USB_SERIAL_EMPEG=m
CONFIG_USB_SERIAL_FTDI_SIO=m
CONFIG_USB_SERIAL_VISOR=m
CONFIG_USB_SERIAL_IPAQ=m
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL_EDGEPORT=m
CONFIG_USB_SERIAL_EDGEPORT_TI=m
CONFIG_USB_SERIAL_F81232=m
CONFIG_USB_SERIAL_F8153X=m
CONFIG_USB_SERIAL_GARMIN=m
CONFIG_USB_SERIAL_IPW=m
CONFIG_USB_SERIAL_IUU=m
CONFIG_USB_SERIAL_KEYSPAN_PDA=m
CONFIG_USB_SERIAL_KEYSPAN=m
CONFIG_USB_SERIAL_KLSI=m
CONFIG_USB_SERIAL_KOBIL_SCT=m
CONFIG_USB_SERIAL_MCT_U232=m
CONFIG_USB_SERIAL_METRO=m
CONFIG_USB_SERIAL_MOS7720=m
CONFIG_USB_SERIAL_MOS7715_PARPORT=y
CONFIG_USB_SERIAL_MOS7840=m
CONFIG_USB_SERIAL_MXUPORT=m
CONFIG_USB_SERIAL_NAVMAN=m
CONFIG_USB_SERIAL_PL2303=m
CONFIG_USB_SERIAL_OTI6858=m
CONFIG_USB_SERIAL_QCAUX=m
CONFIG_USB_SERIAL_QUALCOMM=m
CONFIG_USB_SERIAL_SPCP8X5=m
CONFIG_USB_SERIAL_SAFE=m
CONFIG_USB_SERIAL_SAFE_PADDED=y
CONFIG_USB_SERIAL_SIERRAWIRELESS=m
CONFIG_USB_SERIAL_SYMBOL=m
CONFIG_USB_SERIAL_TI=m
CONFIG_USB_SERIAL_CYBERJACK=m
CONFIG_USB_SERIAL_XIRCOM=m
CONFIG_USB_SERIAL_WWAN=m
CONFIG_USB_SERIAL_OPTION=m
CONFIG_USB_SERIAL_OMNINET=m
CONFIG_USB_SERIAL_OPTICON=m
CONFIG_USB_SERIAL_XSENS_MT=m
CONFIG_USB_SERIAL_WISHBONE=m
CONFIG_USB_SERIAL_SSU100=m
CONFIG_USB_SERIAL_QT2=m
CONFIG_USB_SERIAL_UPD78F0730=m
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=m
CONFIG_USB_EMI26=m
CONFIG_USB_ADUTUX=m
CONFIG_USB_SEVSEG=m
CONFIG_USB_LEGOTOWER=m
CONFIG_USB_LCD=m
CONFIG_USB_CYPRESS_CY7C63=m
CONFIG_USB_CYTHERM=m
CONFIG_USB_IDMOUSE=m
CONFIG_USB_FTDI_ELAN=m
CONFIG_USB_APPLEDISPLAY=m
CONFIG_APPLE_MFI_FASTCHARGE=m
CONFIG_USB_SISUSBVGA=m
CONFIG_USB_SISUSBVGA_CON=y
CONFIG_USB_LD=m
CONFIG_USB_TRANCEVIBRATOR=m
CONFIG_USB_IOWARRIOR=m
# CONFIG_USB_TEST is not set
CONFIG_USB_EHSET_TEST_FIXTURE=m
CONFIG_USB_ISIGHTFW=m
CONFIG_USB_YUREX=m
CONFIG_USB_EZUSB_FX2=m
CONFIG_USB_HUB_USB251XB=m
CONFIG_USB_HSIC_USB3503=m
CONFIG_USB_HSIC_USB4604=m
CONFIG_USB_LINK_LAYER_TEST=m
CONFIG_USB_CHAOSKEY=m

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_NOP_USB_XCEIV=m
# CONFIG_USB_GPIO_VBUS is not set
CONFIG_USB_ISP1301=m
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=m
CONFIG_TYPEC_TCPM=m
CONFIG_TYPEC_TCPCI=m
CONFIG_TYPEC_RT1711H=m
CONFIG_TYPEC_FUSB302=m
CONFIG_TYPEC_UCSI=m
CONFIG_UCSI_CCG=m
CONFIG_TYPEC_HD3SS3220=m
CONFIG_TYPEC_TPS6598X=m

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_PI3USB30532=m
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_DP_ALTMODE=m
CONFIG_TYPEC_NVIDIA_ALTMODE=m
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=m
# CONFIG_MMC is not set
CONFIG_MEMSTICK=m
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
CONFIG_MSPRO_BLOCK=m
CONFIG_MS_BLOCK=m

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
CONFIG_MEMSTICK_JMICRON_38X=m
CONFIG_MEMSTICK_R592=m
CONFIG_MEMSTICK_REALTEK_PCI=m
CONFIG_MEMSTICK_REALTEK_USB=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=m
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
# CONFIG_LEDS_AAT1290 is not set
# CONFIG_LEDS_AN30259A is not set
# CONFIG_LEDS_AS3645A is not set
# CONFIG_LEDS_BCM6328 is not set
# CONFIG_LEDS_BCM6358 is not set
CONFIG_LEDS_CR0014114=m
CONFIG_LEDS_EL15203000=m
CONFIG_LEDS_LM3530=m
CONFIG_LEDS_LM3532=m
CONFIG_LEDS_LM3533=m
CONFIG_LEDS_LM3642=m
# CONFIG_LEDS_LM3692X is not set
CONFIG_LEDS_LM3601X=m
CONFIG_LEDS_PCA9532=m
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=m
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP55XX_COMMON=m
CONFIG_LEDS_LP5521=m
CONFIG_LEDS_LP5523=m
CONFIG_LEDS_LP5562=m
CONFIG_LEDS_LP8501=m
CONFIG_LEDS_LP8860=m
CONFIG_LEDS_PCA955X=m
CONFIG_LEDS_PCA955X_GPIO=y
CONFIG_LEDS_PCA963X=m
# CONFIG_LEDS_DAC124S085 is not set
CONFIG_LEDS_PWM=m
CONFIG_LEDS_REGULATOR=m
CONFIG_LEDS_BD2802=m
CONFIG_LEDS_LT3593=m
CONFIG_LEDS_TCA6507=m
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_MAX77650=m
CONFIG_LEDS_LM355x=m
# CONFIG_LEDS_KTD2692 is not set
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_POWERNV=m
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=m
CONFIG_LEDS_SPI_BYTE=m
CONFIG_LEDS_TI_LMU_COMMON=m
CONFIG_LEDS_LM3697=m
CONFIG_LEDS_LM36274=m

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
CONFIG_LEDS_TRIGGER_DISK=y
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=m
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=m
CONFIG_LEDS_TRIGGER_PATTERN=m
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_USER_MAD=m
CONFIG_INFINIBAND_USER_ACCESS=m
# CONFIG_INFINIBAND_EXP_LEGACY_VERBS_NEW_UAPI is not set
CONFIG_INFINIBAND_USER_MEM=y
CONFIG_INFINIBAND_ON_DEMAND_PAGING=y
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
CONFIG_INFINIBAND_MTHCA=m
CONFIG_INFINIBAND_MTHCA_DEBUG=y
CONFIG_INFINIBAND_CXGB4=m
CONFIG_INFINIBAND_EFA=m
CONFIG_INFINIBAND_I40IW=m
CONFIG_MLX4_INFINIBAND=m
CONFIG_MLX5_INFINIBAND=m
CONFIG_INFINIBAND_OCRDMA=m
CONFIG_INFINIBAND_BNXT_RE=m
CONFIG_INFINIBAND_QEDR=m
CONFIG_RDMA_RXE=m
CONFIG_RDMA_SIW=m
CONFIG_INFINIBAND_IPOIB=m
CONFIG_INFINIBAND_IPOIB_CM=y
CONFIG_INFINIBAND_IPOIB_DEBUG=y
# CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
CONFIG_INFINIBAND_SRP=m
CONFIG_INFINIBAND_SRPT=m
CONFIG_INFINIBAND_ISER=m
CONFIG_INFINIBAND_ISERT=m
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_CPC925=m
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_ABB5ZES3=m
CONFIG_RTC_DRV_ABEOZ9=m
CONFIG_RTC_DRV_ABX80X=m
CONFIG_RTC_DRV_DS1307=m
CONFIG_RTC_DRV_DS1307_CENTURY=y
CONFIG_RTC_DRV_DS1374=m
CONFIG_RTC_DRV_DS1374_WDT=y
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_HYM8563=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_MAX8907=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
# CONFIG_RTC_DRV_ISL12022 is not set
# CONFIG_RTC_DRV_ISL12026 is not set
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
CONFIG_RTC_DRV_PCF85063=m
CONFIG_RTC_DRV_PCF85363=m
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
# CONFIG_RTC_DRV_M41T80_WDT is not set
# CONFIG_RTC_DRV_BQ32K is not set
CONFIG_RTC_DRV_S35390A=m
CONFIG_RTC_DRV_FM3130=m
CONFIG_RTC_DRV_RX8010=m
# CONFIG_RTC_DRV_RX8581 is not set
# CONFIG_RTC_DRV_RX8025 is not set
# CONFIG_RTC_DRV_EM3027 is not set
CONFIG_RTC_DRV_RV3028=m
CONFIG_RTC_DRV_RV8803=m
CONFIG_RTC_DRV_SD3078=m

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
# CONFIG_RTC_DRV_RX4581 is not set
# CONFIG_RTC_DRV_RX6110 is not set
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
CONFIG_RTC_DRV_PCF2127=m
# CONFIG_RTC_DRV_RV3029C2 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=m
# CONFIG_RTC_DRV_DS1286 is not set
# CONFIG_RTC_DRV_DS1511 is not set
# CONFIG_RTC_DRV_DS1553 is not set
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
# CONFIG_RTC_DRV_DS2404 is not set
# CONFIG_RTC_DRV_DA9063 is not set
# CONFIG_RTC_DRV_STK17TA8 is not set
# CONFIG_RTC_DRV_M48T86 is not set
# CONFIG_RTC_DRV_M48T35 is not set
# CONFIG_RTC_DRV_M48T59 is not set
# CONFIG_RTC_DRV_MSM6242 is not set
# CONFIG_RTC_DRV_BQ4802 is not set
# CONFIG_RTC_DRV_RP5C01 is not set
# CONFIG_RTC_DRV_V3020 is not set
CONFIG_RTC_DRV_OPAL=m
# CONFIG_RTC_DRV_ZYNQMP is not set

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_GENERIC=m
CONFIG_RTC_DRV_CADENCE=m
# CONFIG_RTC_DRV_FTRTC010 is not set
# CONFIG_RTC_DRV_R7301 is not set

#
# HID Sensor RTC drivers
#
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=m
CONFIG_DMA_OF=y
CONFIG_ALTERA_MSGDMA=m
# CONFIG_DW_AXI_DMAC is not set
# CONFIG_FSL_EDMA is not set
CONFIG_INTEL_IDMA64=m
CONFIG_PLX_DMA=m
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
# CONFIG_DW_DMAC is not set
CONFIG_DW_DMAC_PCI=y
CONFIG_DW_EDMA=m
CONFIG_DW_EDMA_PCIE=m
CONFIG_SF_PDMA=m

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
# CONFIG_DMATEST is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_HD44780=m
# CONFIG_KS0108 is not set
# CONFIG_IMG_ASCII_LCD is not set
# CONFIG_HT16K33 is not set
CONFIG_PARPORT_PANEL=m
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
CONFIG_PANEL=m
CONFIG_CHARLCD=m
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
CONFIG_UIO_DMEM_GENIRQ=m
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
CONFIG_UIO_NETX=m
CONFIG_UIO_FSL_ELBC_GPCM=m
CONFIG_UIO_FSL_ELBC_GPCM_NETX5152=y
# CONFIG_UIO_PRUSS is not set
CONFIG_UIO_MF624=m
# CONFIG_VFIO_IOMMU_TYPE1 is not set
CONFIG_VFIO_IOMMU_SPAPR_TCE=m
CONFIG_VFIO_SPAPR_EEH=m
CONFIG_VFIO_VIRQFD=m
CONFIG_VFIO=m
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_PCI=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI_NVLINK2=y
CONFIG_VFIO_MDEV=m
CONFIG_VFIO_MDEV_DEVICE=m
CONFIG_IRQ_BYPASS_MANAGER=y
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
CONFIG_VIRTIO_VDPA=m
CONFIG_VIRTIO_PMEM=m
CONFIG_VIRTIO_BALLOON=m
CONFIG_VIRTIO_INPUT=m
CONFIG_VIRTIO_MMIO=m
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VDPA=m
CONFIG_VDPA_MENU=y
CONFIG_VDPA_SIM=m
CONFIG_IFCVF=m
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST_RING=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
CONFIG_VHOST_SCSI=m
CONFIG_VHOST_VSOCK=m
CONFIG_VHOST_VDPA=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV_TIMER is not set
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_STAGING=y
# CONFIG_PRISM2_USB is not set
# CONFIG_COMEDI is not set
CONFIG_RTL8192U=m
CONFIG_RTLLIB=m
CONFIG_RTLLIB_CRYPTO_CCMP=m
CONFIG_RTLLIB_CRYPTO_TKIP=m
CONFIG_RTLLIB_CRYPTO_WEP=m
CONFIG_RTL8192E=m
CONFIG_R8712U=m
CONFIG_R8188EU=m
CONFIG_88EU_AP_MODE=y
CONFIG_RTS5208=m
CONFIG_VT6655=m
CONFIG_VT6656=m
# CONFIG_FB_SM750 is not set

#
# Speakup console speech
#
CONFIG_SPEAKUP=m
CONFIG_SPEAKUP_SYNTH_ACNTSA=m
CONFIG_SPEAKUP_SYNTH_APOLLO=m
CONFIG_SPEAKUP_SYNTH_AUDPTR=m
CONFIG_SPEAKUP_SYNTH_BNS=m
CONFIG_SPEAKUP_SYNTH_DECTLK=m
CONFIG_SPEAKUP_SYNTH_DECEXT=m
CONFIG_SPEAKUP_SYNTH_LTLK=m
CONFIG_SPEAKUP_SYNTH_SOFT=m
CONFIG_SPEAKUP_SYNTH_SPKOUT=m
CONFIG_SPEAKUP_SYNTH_TXPRT=m
CONFIG_SPEAKUP_SYNTH_DUMMY=m
# end of Speakup console speech

CONFIG_STAGING_MEDIA=y

#
# soc_camera sensor drivers
#
CONFIG_VIDEO_USBVISION=m

#
# Android
#
# end of Android

CONFIG_LTE_GDM724X=m
CONFIG_FIREWIRE_SERIAL=m
CONFIG_FWTTY_MAX_TOTAL_PORTS=64
CONFIG_FWTTY_MAX_CARD_PORTS=32
# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
# CONFIG_FB_TFT is not set
# CONFIG_WILC1000_SPI is not set
# CONFIG_PI433 is not set

#
# Gasket devices
#
# end of Gasket devices

CONFIG_XIL_AXIS_FIFO=m
# CONFIG_FIELDBUS_DEV is not set
# CONFIG_KPC2000 is not set
CONFIG_QLGE=m
CONFIG_WFX=m
# CONFIG_GOLDFISH is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
CONFIG_MICROCHIP_PIT64B=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_PLATFORM_MHU is not set
# CONFIG_ALTERA_MBOX is not set
# CONFIG_MAILBOX_TEST is not set
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_OF_IOMMU=y
CONFIG_SPAPR_TCE_IOMMU=y

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=m
CONFIG_RPMSG_CHAR=m
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
CONFIG_RPMSG_VIRTIO=m
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Aspeed SoC drivers
#
# end of Aspeed SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
CONFIG_QUICC_ENGINE=y
CONFIG_UCC_SLOW=y
CONFIG_UCC=y
CONFIG_QE_USB=y
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SUNXI_SRAM is not set
# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# CONFIG_XILINX_VCU is not set
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=m
CONFIG_DEVFREQ_GOV_PERFORMANCE=m
CONFIG_DEVFREQ_GOV_POWERSAVE=m
CONFIG_DEVFREQ_GOV_USERSPACE=m
CONFIG_DEVFREQ_GOV_PASSIVE=m

#
# DEVFREQ Drivers
#
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_FSA9480=m
CONFIG_EXTCON_GPIO=m
CONFIG_EXTCON_MAX3355=m
CONFIG_EXTCON_PTN5150=m
# CONFIG_EXTCON_RT8973A is not set
CONFIG_EXTCON_SM5502=m
# CONFIG_EXTCON_USB_GPIO is not set
CONFIG_MEMORY=y
# CONFIG_IIO is not set
# CONFIG_NTB is not set
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_FSL_FTM is not set
CONFIG_PWM_LP3943=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
# CONFIG_ARM_GIC_V3_ITS is not set
# CONFIG_AL_FIC is not set
CONFIG_MADERA_IRQ=m
# end of IRQ chip support

CONFIG_IPACK_BUS=m
CONFIG_BOARD_TPCI200=m
CONFIG_SERIAL_IPOCTAL=m
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_BRCMSTB_RESCAL is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_INTEL_GW is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_SIMPLE is not set
# CONFIG_RESET_STM32MP157 is not set
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_SUNXI is not set
# CONFIG_RESET_TI_SYSCON is not set
# CONFIG_RESET_ZYNQ is not set
# CONFIG_RESET_TEGRA_BPMP is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
CONFIG_BCM_KONA_USB2_PHY=m
CONFIG_PHY_CADENCE_TORRENT=m
CONFIG_PHY_CADENCE_DPHY=m
CONFIG_PHY_CADENCE_SIERRA=m
CONFIG_PHY_FSL_IMX8MQ_USB=m
CONFIG_PHY_MIXEL_MIPI_DPHY=m
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_MAPPHONE_MDM6600 is not set
CONFIG_PHY_QCOM_USB_HS=m
# CONFIG_PHY_QCOM_USB_HSIC is not set
# CONFIG_PHY_TUSB1210 is not set
CONFIG_PHY_INTEL_EMMC=m
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_BLK=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_OF_PMEM=m
CONFIG_NVDIMM_KEYS=y
CONFIG_DAX_DRIVER=y
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=m
CONFIG_DEV_DAX_PMEM_COMPAT=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_SPMI_SDAM=m

#
# HW tracing support
#
CONFIG_STM=m
CONFIG_STM_PROTO_BASIC=m
CONFIG_STM_PROTO_SYS_T=m
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

CONFIG_FPGA=m
CONFIG_ALTERA_PR_IP_CORE=m
# CONFIG_ALTERA_PR_IP_CORE_PLAT is not set
CONFIG_FPGA_MGR_ALTERA_PS_SPI=m
CONFIG_FPGA_MGR_ALTERA_CVP=m
CONFIG_FPGA_MGR_XILINX_SPI=m
# CONFIG_FPGA_MGR_ICE40_SPI is not set
CONFIG_FPGA_MGR_MACHXO2_SPI=m
CONFIG_FPGA_BRIDGE=m
CONFIG_ALTERA_FREEZE_BRIDGE=m
CONFIG_XILINX_PR_DECOUPLER=m
CONFIG_FPGA_REGION=m
CONFIG_OF_FPGA_REGION=m
CONFIG_FPGA_DFL=m
CONFIG_FPGA_DFL_FME=m
CONFIG_FPGA_DFL_FME_MGR=m
CONFIG_FPGA_DFL_FME_BRIDGE=m
CONFIG_FPGA_DFL_FME_REGION=m
CONFIG_FPGA_DFL_AFU=m
CONFIG_FPGA_DFL_PCI=m
CONFIG_FSI=m
# CONFIG_FSI_NEW_DEV_NODE is not set
# CONFIG_FSI_MASTER_GPIO is not set
# CONFIG_FSI_MASTER_HUB is not set
# CONFIG_FSI_MASTER_ASPEED is not set
# CONFIG_FSI_SCOM is not set
CONFIG_FSI_SBEFIFO=m
CONFIG_FSI_OCC=m
CONFIG_MULTIPLEXER=m

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
# CONFIG_MUX_ADGS1408 is not set
# CONFIG_MUX_GPIO is not set
CONFIG_MUX_MMIO=m
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
CONFIG_INTERCONNECT=m
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_USE_FOR_EXT2=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=m
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set
CONFIG_REISERFS_FS_XATTR=y
CONFIG_REISERFS_FS_POSIX_ACL=y
CONFIG_REISERFS_FS_SECURITY=y
CONFIG_JFS_FS=m
CONFIG_JFS_POSIX_ACL=y
CONFIG_JFS_SECURITY=y
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
CONFIG_XFS_FS=m
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
# CONFIG_XFS_RT is not set
# CONFIG_XFS_ONLINE_SCRUB is not set
# CONFIG_XFS_WARN is not set
# CONFIG_XFS_DEBUG is not set
CONFIG_GFS2_FS=m
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
CONFIG_BTRFS_ASSERT=y
# CONFIG_BTRFS_FS_REF_VERIFY is not set
CONFIG_NILFS2_FS=m
# CONFIG_F2FS_FS is not set
CONFIG_ZONEFS_FS=m
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
# CONFIG_MANDATORY_FILE_LOCKING is not set
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
CONFIG_FS_VERITY=y
# CONFIG_FS_VERITY_DEBUG is not set
# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=m
CONFIG_QFMT_V1=m
CONFIG_QFMT_V2=m
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
CONFIG_VIRTIO_FS=m
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_HISTOGRAM is not set
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_FSCACHE_OBJECT_LIST=y
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_HISTOGRAM is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
CONFIG_EXFAT_FS=m
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
# CONFIG_NTFS_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
# CONFIG_PROC_PID_ARCH_STATUS is not set
# CONFIG_PROC_CPU_RESCTRL is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=m
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=m
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
CONFIG_ECRYPT_FS=m
CONFIG_ECRYPT_FS_MESSAGING=y
# CONFIG_HFS_FS is not set
CONFIG_HFSPLUS_FS=m
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_JFFS2_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_CRAMFS_MTD=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
CONFIG_SQUASHFS_LZ4=y
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
CONFIG_SQUASHFS_ZSTD=y
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
CONFIG_MINIX_FS=m
CONFIG_OMFS_FS=m
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
CONFIG_QNX6FS_FS=m
# CONFIG_QNX6FS_DEBUG is not set
CONFIG_ROMFS_FS=m
# CONFIG_ROMFS_BACKED_BY_BLOCK is not set
# CONFIG_ROMFS_BACKED_BY_MTD is not set
CONFIG_ROMFS_BACKED_BY_BOTH=y
CONFIG_ROMFS_ON_BLOCK=y
CONFIG_ROMFS_ON_MTD=y
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFLATE_COMPRESS=m
CONFIG_PSTORE_LZO_COMPRESS=y
# CONFIG_PSTORE_LZ4_COMPRESS is not set
CONFIG_PSTORE_LZ4HC_COMPRESS=m
# CONFIG_PSTORE_842_COMPRESS is not set
CONFIG_PSTORE_ZSTD_COMPRESS=y
CONFIG_PSTORE_COMPRESS=y
# CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_LZO_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="lzo"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_SYSV_FS is not set
CONFIG_UFS_FS=m
CONFIG_UFS_FS_WRITE=y
# CONFIG_UFS_DEBUG is not set
CONFIG_EROFS_FS=m
# CONFIG_EROFS_FS_DEBUG is not set
CONFIG_EROFS_FS_XATTR=y
CONFIG_EROFS_FS_POSIX_ACL=y
CONFIG_EROFS_FS_SECURITY=y
CONFIG_EROFS_FS_ZIP=y
CONFIG_EROFS_FS_CLUSTER_PAGE_LIMIT=1
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=m
CONFIG_NFS_V2=m
CONFIG_NFS_V3=m
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
CONFIG_NFS_SWAP=y
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_NFS_FSCACHE=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
# CONFIG_NFS_DISABLE_UDP_SUPPORT is not set
CONFIG_NFSD=m
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
CONFIG_NFSD_BLOCKLAYOUT=y
CONFIG_NFSD_SCSILAYOUT=y
CONFIG_NFSD_FLEXFILELAYOUT=y
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=m
CONFIG_LOCKD=m
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=m
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=m
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_SUNRPC_SWAP=y
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_SUNRPC_XPRT_RDMA=m
CONFIG_CEPH_FS=m
CONFIG_CEPH_FSCACHE=y
CONFIG_CEPH_FS_POSIX_ACL=y
CONFIG_CEPH_FS_SECURITY_LABEL=y
CONFIG_CIFS=m
# CONFIG_CIFS_STATS2 is not set
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_WEAK_PW_HASH=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SMB_DIRECT is not set
CONFIG_CIFS_FSCACHE=y
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_9P_FS=m
CONFIG_9P_FSCACHE=y
CONFIG_9P_FS_POSIX_ACL=y
CONFIG_9P_FS_SECURITY=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=m
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
CONFIG_DLM_DEBUG=y
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_BIG_KEYS=y
CONFIG_TRUSTED_KEYS=m
CONFIG_ENCRYPTED_KEYS=y
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITY_WRITABLE_HOOKS=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_INFINIBAND=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_LSM_MMAP_MIN_ADDR=0
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
# CONFIG_HARDENED_USERCOPY_FALLBACK is not set
# CONFIG_HARDENED_USERCOPY_PAGESPAN is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
CONFIG_SECURITY_SELINUX_DISABLE=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
# CONFIG_SECURITY_SMACK is not set
CONFIG_SECURITY_TOMOYO=y
CONFIG_SECURITY_TOMOYO_MAX_ACCEPT_ENTRY=2048
CONFIG_SECURITY_TOMOYO_MAX_AUDIT_LOG=1024
# CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER is not set
CONFIG_SECURITY_TOMOYO_POLICY_LOADER="/sbin/tomoyo-init"
CONFIG_SECURITY_TOMOYO_ACTIVATION_TRIGGER="/sbin/init"
# CONFIG_SECURITY_TOMOYO_INSECURE_BUILTIN_SETTING is not set
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
CONFIG_SECURITY_LOCKDOWN_LSM=y
CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
CONFIG_LOCK_DOWN_KERNEL_FORCE_NONE=y
# CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY is not set
# CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
CONFIG_INTEGRITY_PLATFORM_KEYRING=y
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
CONFIG_IMA_KEXEC=y
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_LSM_RULES=y
# CONFIG_IMA_TEMPLATE is not set
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
# CONFIG_IMA_DEFAULT_HASH_SHA1 is not set
CONFIG_IMA_DEFAULT_HASH_SHA256=y
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH="sha256"
# CONFIG_IMA_WRITE_POLICY is not set
CONFIG_IMA_READ_POLICY=y
CONFIG_IMA_APPRAISE=y
# CONFIG_IMA_ARCH_POLICY is not set
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=y
CONFIG_IMA_APPRAISE_MODSIG=y
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_KEYRINGS_PERMIT_SIGNED_BY_BUILTIN_OR_SECONDARY is not set
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
CONFIG_EVM_ADD_XATTRS=y
# CONFIG_EVM_LOAD_X509 is not set
# CONFIG_DEFAULT_SECURITY_SELINUX is not set
# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
CONFIG_DEFAULT_SECURITY_APPARMOR=y
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="integrity,apparmor"

#
# Kernel hardening options
#

#
# Memory initialization
#
# CONFIG_CC_HAS_AUTO_VAR_INIT is not set
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=m
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_ENGINE=m

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
CONFIG_CRYPTO_ECRDSA=m
CONFIG_CRYPTO_CURVE25519=m

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=m
CONFIG_CRYPTO_AEGIS128=m
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=m
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=m
CONFIG_CRYPTO_NHPOLY1305=m
CONFIG_CRYPTO_ADIANTUM=m
CONFIG_CRYPTO_ESSIV=m

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_VMAC=m

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_VPMSUM=m
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_XXHASH=m
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_BLAKE2S=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_VPMSUM=m
CONFIG_CRYPTO_VPMSUM_TESTER=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=m
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MD5_PPC=m
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD128=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_RMD256=m
CONFIG_CRYPTO_RMD320=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_PPC=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
CONFIG_CRYPTO_SM3=m
CONFIG_CRYPTO_STREEBOG=m
CONFIG_CRYPTO_TGR192=m
CONFIG_CRYPTO_WP512=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=m
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SALSA20=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SM4=m
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=m
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=m
CONFIG_CRYPTO_LZ4=m
CONFIG_CRYPTO_LZ4HC=m
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=m
CONFIG_CRYPTO_USER_API_HASH=m
CONFIG_CRYPTO_USER_API_SKCIPHER=m
CONFIG_CRYPTO_USER_API_RNG=m
CONFIG_CRYPTO_USER_API_AEAD=m
# CONFIG_CRYPTO_STATS is not set
CONFIG_CRYPTO_HASH_INFO=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=m
CONFIG_CRYPTO_LIB_BLAKE2S=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=m
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=m
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_NX=y
CONFIG_CRYPTO_DEV_NX_COMPRESS=y
CONFIG_CRYPTO_DEV_NX_COMPRESS_PSERIES=y
CONFIG_CRYPTO_DEV_NX_COMPRESS_POWERNV=y
CONFIG_CRYPTO_DEV_ATMEL_I2C=m
CONFIG_CRYPTO_DEV_ATMEL_ECC=m
CONFIG_CRYPTO_DEV_ATMEL_SHA204A=m
CONFIG_CRYPTO_DEV_NITROX=m
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=m
CONFIG_CRYPTO_DEV_VMX=y
CONFIG_CRYPTO_DEV_VMX_ENCRYPT=y
CONFIG_CRYPTO_DEV_CHELSIO=m
CONFIG_CHELSIO_IPSEC_INLINE=y
CONFIG_CHELSIO_TLS_DEVICE=y
CONFIG_CRYPTO_DEV_VIRTIO=m
CONFIG_CRYPTO_DEV_SAFEXCEL=m
# CONFIG_CRYPTO_DEV_CCREE is not set
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=m
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE=m
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_TPM_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
CONFIG_SECONDARY_TRUSTED_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
# CONFIG_HAVE_ARCH_BITREVERSE is not set
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
CONFIG_CRC4=m
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4HC_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=m
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_BTREE=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_DMA_VIRT_OPS=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_SGL_ALLOC=y
CONFIG_IOMMU_HELPER=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_LRU_CACHE=m
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONTS=y
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
# CONFIG_FONT_6x11 is not set
# CONFIG_FONT_7x14 is not set
# CONFIG_FONT_PEARL_8x8 is not set
# CONFIG_FONT_ACORN_8x8 is not set
# CONFIG_FONT_MINI_4x6 is not set
# CONFIG_FONT_6x10 is not set
# CONFIG_FONT_10x18 is not set
# CONFIG_FONT_SUN8x16 is not set
# CONFIG_FONT_SUN12x22 is not set
CONFIG_FONT_TER16x32=y
# CONFIG_SG_SPLIT is not set
CONFIG_SG_POOL=y
# CONFIG_ARCH_NO_SG_CHAIN is not set
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_MEMREMAP_COMPAT_ALIGN=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_UACCESS_MCSAFE=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
CONFIG_PARMAN=m
CONFIG_OBJAGG=m
# CONFIG_STRING_SELFTEST is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
# CONFIG_PRINTK_CALLER is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_DYNAMIC_DEBUG=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_BTF is not set
# CONFIG_GDB_SCRIPTS is not set
# CONFIG_ENABLE_MUST_CHECK is not set
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_KGDB=y
CONFIG_KGDB_SERIAL_CONSOLE=y
# CONFIG_KGDB_TESTS is not set
CONFIG_KGDB_KDB=y
CONFIG_KDB_DEFAULT_ENABLE=0x1
CONFIG_KDB_KEYBOARD=y
CONFIG_KDB_CONTINUE_CATASTROPHIC=0
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
# end of Generic Kernel Debugging Instruments

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
# CONFIG_DEBUG_VM is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_CC_HAS_KASAN_GENERIC=y
# CONFIG_CC_HAS_KASAN_SW_TAGS is not set
CONFIG_KASAN_STACK=1
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_HARDLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=0
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_PROVE_RCU is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_PERF_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=60
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_BOOTTIME_TRACING=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_PREEMPTIRQ_EVENTS is not set
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
# CONFIG_HWLAT_TRACER is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
CONFIG_BLK_DEV_IO_TRACE=y
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_BPF_KPROBE_OVERRIDE is not set
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_TRACING_MAP=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
CONFIG_IO_STRICT_DEVMEM=y

#
# powerpc Debugging
#
CONFIG_PPC_DISABLE_WERROR=y
CONFIG_PRINT_STACK_DEPTH=64
# CONFIG_HCALL_STATS is not set
# CONFIG_PPC_EMULATED_STATS is not set
# CONFIG_CODE_PATCHING_SELFTEST is not set
CONFIG_JUMP_LABEL_FEATURE_CHECKS=y
# CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG is not set
# CONFIG_FTR_FIXUP_SELFTEST is not set
# CONFIG_MSI_BITMAP_SELFTEST is not set
# CONFIG_PPC_IRQ_SOFT_MASK_DEBUG is not set
CONFIG_XMON=y
# CONFIG_XMON_DEFAULT is not set
CONFIG_XMON_DISASSEMBLY=y
CONFIG_XMON_DEFAULT_RO_MODE=y
CONFIG_DEBUGGER=y
CONFIG_BOOTX_TEXT=y
# CONFIG_PPC_EARLY_DEBUG is not set
# CONFIG_FAIL_IOMMU is not set
# CONFIG_PPC_PTDUMP is not set
# CONFIG_PPC_FAST_ENDIAN_SWITCH is not set
# end of powerpc Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
# CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT is not set
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=m
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
# CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=m
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_SORT is not set
# CONFIG_KPROBES_SANITY_TEST is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
CONFIG_RBTREE_TEST=m
# CONFIG_REED_SOLOMON_TEST is not set
CONFIG_INTERVAL_TREE_TEST=m
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
CONFIG_ASYNC_RAID6_TEST=m
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_BITFIELD is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_OVERFLOW is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_PARMAN is not set
CONFIG_TEST_LKM=m
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
CONFIG_TEST_FIRMWARE=m
CONFIG_TEST_SYSCTL=m
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
CONFIG_TEST_LIVEPATCH=m
# CONFIG_TEST_OBJAGG is not set
# CONFIG_TEST_STACKINIT is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

CONFIG_SUSE_KERNEL=y

#
# SUSE Release Details
#
# CONFIG_SUSE_PRODUCT_SLE is not set
# CONFIG_SUSE_PRODUCT_OPENSUSE_LEAP is not set
CONFIG_SUSE_PRODUCT_OPENSUSE_TUMBLEWEED=y
CONFIG_SUSE_PRODUCT_CODE=3
CONFIG_SUSE_VERSION=0
CONFIG_SUSE_PATCHLEVEL=0
CONFIG_SUSE_AUXRELEASE=0
# CONFIG_SUSE_KERNEL_SUPPORTED is not set
# CONFIG_SUSE_KERNEL_RELEASE is not set
# end of SUSE Release Details

--ni93GHxFvA+th69W--
