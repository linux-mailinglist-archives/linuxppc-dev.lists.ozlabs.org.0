Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C484850DA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 16:13:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XWTw6Hf0zDqRD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 00:13:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XWQ51Mv0zDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 00:09:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5OE86BA075378
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 10:09:44 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tb00t844c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 10:09:40 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Mon, 24 Jun 2019 15:09:27 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Jun 2019 15:09:24 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5OE9NHb42270758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 14:09:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D062AE055;
 Mon, 24 Jun 2019 14:09:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDE2EAE05D;
 Mon, 24 Jun 2019 14:09:21 +0000 (GMT)
Received: from [9.199.48.172] (unknown [9.199.48.172])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jun 2019 14:09:21 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_4212258D-1CDC-415B-83AE-53D527635E7E"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: [next][PowerPC] RCU stalls while booting linux-next on PowerVM LPAR
Date: Mon, 24 Jun 2019 19:39:20 +0530
To: linuxppc-dev@lists.ozlabs.org, david@redhat.com,
 Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19062414-0016-0000-0000-0000028BE78E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062414-0017-0000-0000-000032E95431
Message-Id: <0F3EAC10-0EA8-4097-99F2-BC42D92291FE@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240115
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
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_4212258D-1CDC-415B-83AE-53D527635E7E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Latest -next fails to boot on POWER9 PowerVM LPAR due to RCU stalls.

This problem was introduced with next-20190620 (dc636f5d78).
next-20190619 was last good kernel.

Reverting following commit allows the kernel to boot.
2fd4aeea6b603 : mm/memory_hotplug: move and simplify =
walk_memory_blocks()


[    0.014409] Using shared cache scheduler topology
[    0.016302] devtmpfs: initialized
[    0.031022] clocksource: jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.031034] futex hash table entries: 16384 (order: 5, 2097152 bytes, =
linear)
[    0.031575] NET: Registered protocol family 16
[    0.031724] audit: initializing netlink subsys (disabled)
[    0.031796] audit: type=3D2000 audit(1561344029.030:1): =
state=3Dinitialized audit_enabled=3D0 res=3D1
[    0.032249] cpuidle: using governor menu
[    0.032403] pstore: Registered nvram as persistent store backend
[   60.061246] rcu: INFO: rcu_sched self-detected stall on CPU
[   60.061254] rcu: 	0-....: (5999 ticks this GP) =
idle=3D1ea/1/0x4000000000000002 softirq=3D5/5 fqs=3D2999=20
[   60.061261] 	(t=3D6000 jiffies g=3D-1187 q=3D0)
[   60.061265] NMI backtrace for cpu 0
[   60.061269] CPU: 0 PID: 1 Comm: swapper/0 Not tainted =
5.2.0-rc5-next-20190621-autotest-autotest #1
[   60.061275] Call Trace:
[   60.061280] [c0000018ee85f380] [c000000000b624ec] =
dump_stack+0xb0/0xf4 (unreliable)
[   60.061287] [c0000018ee85f3c0] [c000000000b6d464] =
nmi_cpu_backtrace+0x144/0x150
[   60.061293] [c0000018ee85f450] [c000000000b6d61c] =
nmi_trigger_cpumask_backtrace+0x1ac/0x1f0
[   60.061300] [c0000018ee85f4f0] [c0000000000692c8] =
arch_trigger_cpumask_backtrace+0x28/0x40
[   60.061306] [c0000018ee85f510] [c0000000001c5f90] =
rcu_dump_cpu_stacks+0x10c/0x16c
[   60.061313] [c0000018ee85f560] [c0000000001c4fe4] =
rcu_sched_clock_irq+0x744/0x990
[   60.061318] [c0000018ee85f630] [c0000000001d5b58] =
update_process_times+0x48/0x90
[   60.061325] [c0000018ee85f660] [c0000000001ea03c] =
tick_periodic+0x4c/0x120
[   60.061330] [c0000018ee85f690] [c0000000001ea150] =
tick_handle_periodic+0x40/0xe0
[   60.061336] [c0000018ee85f6d0] [c00000000002b5cc] =
timer_interrupt+0x10c/0x2e0
[   60.061342] [c0000018ee85f730] [c000000000009204] =
decrementer_common+0x134/0x140
[   60.061350] --- interrupt: 901 at replay_interrupt_return+0x0/0x4
[   60.061350]     LR =3D arch_local_irq_restore+0x84/0x90
[   60.061357] [c0000018ee85fa30] [c0000018ee85fbac] 0xc0000018ee85fbac =
(unreliable)
[   60.061364] [c0000018ee85fa50] [c000000000b88300] =
_raw_spin_unlock_irqrestore+0x50/0x80
[   60.061369] [c0000018ee85fa70] [c000000000b69da4] =
klist_next+0xb4/0x150
[   60.061376] [c0000018ee85fac0] [c000000000766ea0] =
subsys_find_device_by_id+0xf0/0x1a0
[   60.061382] [c0000018ee85fb20] [c000000000797a94] =
walk_memory_blocks+0x84/0x100
[   60.061388] [c0000018ee85fb80] [c000000000795ea0] =
link_mem_sections+0x40/0x60
[   60.061395] [c0000018ee85fbb0] [c000000000f28c28] =
topology_init+0xa0/0x268
[   60.061400] [c0000018ee85fc10] [c000000000010448] =
do_one_initcall+0x68/0x2c0
[   60.061406] [c0000018ee85fce0] [c000000000f247dc] =
kernel_init_freeable+0x318/0x47c
[   60.061411] [c0000018ee85fdb0] [c0000000000107c4] =
kernel_init+0x24/0x150
[   60.061417] [c0000018ee85fe20] [c00000000000ba54] =
ret_from_kernel_thread+0x5c/0x68
[   88.016563] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! =
[swapper/0:1]
[   88.016569] Modules linked in:


Thanks
-Sachin



--Apple-Mail=_4212258D-1CDC-415B-83AE-53D527635E7E
Content-Disposition: attachment;
	filename=boot.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="boot.log"
Content-Transfer-Encoding: 7bit

[    0.000000] hash-mmu: Page sizes from device-tree:
[    0.000000] hash-mmu: base_shift=12: shift=12, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=0
[    0.000000] hash-mmu: base_shift=12: shift=16, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=7
[    0.000000] hash-mmu: base_shift=12: shift=24, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=56
[    0.000000] hash-mmu: base_shift=16: shift=16, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=1
[    0.000000] hash-mmu: base_shift=16: shift=24, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=8
[    0.000000] hash-mmu: base_shift=24: shift=24, sllp=0x0100, avpnm=0x00000001, tlbiel=0, penc=0
[    0.000000] hash-mmu: base_shift=34: shift=34, sllp=0x0120, avpnm=0x000007ff, tlbiel=0, penc=3
[    0.000000] Using 1TB segments
[    0.000000] hash-mmu: Initializing hash mmu with SLB
[    0.000000] Linux version 5.2.0-rc5-next-20190620-autotest (root@ltczep10-lp3.aus.stglabs.ibm.com) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-36) (GCC)) #1 SMP Mon Jun 24 06:38:12 PDT 2019
[    0.000000] Found initrd at 0xc0000000032b0000:0xc0000000044c4efc
[    0.000000] Using pSeries machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Partition configured for 40 cpus.
[    0.000000] CPU maps initialized for 8 threads per core
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x1900000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x80
[    0.000000] cpu_features      = 0x0000c07f8f5f91a7
[    0.000000]   possible        = 0x0000fbffcf5fb1a7
[    0.000000]   always          = 0x00000003800081a1
[    0.000000] cpu_user_features = 0xdc0065c2 0xefe00000
[    0.000000] mmu_features      = 0x7c006001
[    0.000000] firmware_features = 0x00000013c45bfc57
[    0.000000] hash-mmu: ppc64_pft_size    = 0x1e
[    0.000000] hash-mmu: htab_hash_mask    = 0x7fffff
[    0.000000] hash-mmu: kernel vmalloc start   = 0xc008000000000000
[    0.000000] hash-mmu: kernel IO start        = 0xc00a000000000000
[    0.000000] hash-mmu: kernel vmemmap start   = 0xc00c000000000000
[    0.000000] -----------------------------------------------------
[    0.000000] numa:   NODE_DATA [mem 0x18ffe98980-0x18ffe9ffff]
[    0.000000] numa:     NODE_DATA(0) on node 3
[    0.000000] numa:   NODE_DATA [mem 0x18ffe91300-0x18ffe9897f]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] count-cache-flush: full software flush sequence enabled.
[    0.000000] stf-barrier: eieio barrier available
[    0.000000] PPC64 nvram contains 15360 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x00000018ffffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   3: [mem 0x0000000000000000-0x00000018ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000000000000]
[    0.000000] Initmem setup node 3 [mem 0x0000000000000000-0x00000018ffffffff]
[    0.000000] percpu: Embedded 11 pages/cpu s631960 r0 d88936 u1048576
[    0.000000] node[0] zonelist: 3:Normal 
[    0.000000] node[3] zonelist: 3:Normal 
[    0.000000] Built 2 zonelists, mobility grouping on.  Total pages: 1636800
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=UUID=5b503143-3264-4a73-bd1b-2b1cd7d250f6 
[    0.000000] Dentry cache hash table entries: 8388608 (order: 10, 67108864 bytes, linear)
[    0.000000] Inode-cache hash table entries: 4194304 (order: 9, 33554432 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 104547200K/104857600K available (11840K kernel code, 1792K rwdata, 3584K rodata, 4992K init, 3850K bss, 310400K reserved, 0K cma-reserved)
[    0.000000] random: get_random_u64 called from cache_random_seq_create+0xa4/0x1c0 with crng_init=0
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=40, Nodes=32
[    0.000000] ftrace: allocating 31746 entries in 12 pages
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=40.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=40
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] rcu: 	Offload RCU callbacks from CPUs: (none).
[    0.000002] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.000067] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000178] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000312] Console: colour dummy device 80x25
[    0.000363] printk: console [hvc0] enabled
[    0.000363] printk: console [hvc0] enabled
[    0.000411] printk: bootconsole [udbg0] disabled
[    0.000411] printk: bootconsole [udbg0] disabled
[    0.000508] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.000521] pid_max: default: 40960 minimum: 320
[    0.000673] LSM: Security Framework initializing
[    0.000759] Yama: becoming mindful.
[    0.000781] SELinux:  Initializing.
[    0.000944] *** VALIDATE SELinux ***
[    0.001035] Mount-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.001073] Mountpoint-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.001370] *** VALIDATE proc ***
[    0.001623] *** VALIDATE cgroup1 ***
[    0.001629] *** VALIDATE cgroup2 ***
[    0.002225] EEH: pSeries platform initialized
[    0.002233] POWER9 performance monitor hardware support registered
[    0.002272] rcu: Hierarchical SRCU implementation.
[    0.003078] smp: Bringing up secondary CPUs ...
[    0.014555] smp: Brought up 2 nodes, 40 CPUs
[    0.014564] numa: Node 0 CPUs:
[    0.014567] numa: Node 3 CPUs: 0-39
[    0.014571] Using small cores at SMT level
[    0.014575] Using shared cache scheduler topology
[    0.016465] devtmpfs: initialized
[    0.031046] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.031058] futex hash table entries: 16384 (order: 5, 2097152 bytes, linear)
[    0.031602] NET: Registered protocol family 16
[    0.031751] audit: initializing netlink subsys (disabled)
[    0.031822] audit: type=2000 audit(1561384091.030:1): state=initialized audit_enabled=0 res=1
[    0.032275] cpuidle: using governor menu
[    0.032429] pstore: Registered nvram as persistent store backend
[   60.061325] rcu: INFO: rcu_sched self-detected stall on CPU
[   60.061333] rcu: 	0-....: (5999 ticks this GP) idle=1ca/1/0x4000000000000002 softirq=5/5 fqs=2999 
[   60.061340] 	(t=6000 jiffies g=-1187 q=0)
[   60.061343] NMI backtrace for cpu 0
[   60.061349] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc5-next-20190620-autotest #1
[   60.061354] Call Trace:
[   60.061358] [c0000018ee813360] [c000000000b625cc] dump_stack+0xb0/0xf4 (unreliable)
[   60.061365] [c0000018ee8133a0] [c000000000b6d544] nmi_cpu_backtrace+0x144/0x150
[   60.061371] [c0000018ee813430] [c000000000b6d6fc] nmi_trigger_cpumask_backtrace+0x1ac/0x1f0
[   60.061378] [c0000018ee8134d0] [c0000000000692c8] arch_trigger_cpumask_backtrace+0x28/0x40
[   60.061385] [c0000018ee8134f0] [c0000000001c6210] rcu_dump_cpu_stacks+0x10c/0x16c
[   60.061391] [c0000018ee813540] [c0000000001c5264] rcu_sched_clock_irq+0x744/0x990
[   60.061397] [c0000018ee813610] [c0000000001d5e38] update_process_times+0x48/0x90
[   60.061403] [c0000018ee813640] [c0000000001ea31c] tick_periodic+0x4c/0x120
[   60.061408] [c0000018ee813670] [c0000000001ea430] tick_handle_periodic+0x40/0xe0
[   60.061414] [c0000018ee8136b0] [c00000000002b5cc] timer_interrupt+0x10c/0x2e0
[   60.061420] [c0000018ee813710] [c000000000009204] decrementer_common+0x134/0x140
[   60.061427] --- interrupt: 901 at replay_interrupt_return+0x0/0x4
[   60.061427]     LR = arch_local_irq_restore+0x84/0x90
[   60.061434] [c0000018ee813a10] [c0000018ee813bac] 0xc0000018ee813bac (unreliable)
[   60.061441] [c0000018ee813a30] [c000000000b883e0] _raw_spin_unlock_irqrestore+0x50/0x80
[   60.061447] [c0000018ee813a50] [c000000000b69e84] klist_next+0xb4/0x150
[   60.061453] [c0000018ee813aa0] [c000000000766f60] subsys_find_device_by_id+0xf0/0x1a0
[   60.061459] [c0000018ee813b00] [c000000000796464] find_memory_block_by_id+0x94/0xb0
[   60.061466] [c0000018ee813b30] [c000000000797b1c] walk_memory_blocks+0x7c/0xf0
[   60.061472] [c0000018ee813b80] [c000000000795f60] link_mem_sections+0x40/0x60
[   60.061478] [c0000018ee813bb0] [c000000000f28c28] topology_init+0xa0/0x268
[   60.061483] [c0000018ee813c10] [c000000000010448] do_one_initcall+0x68/0x2c0
[   60.061489] [c0000018ee813ce0] [c000000000f247dc] kernel_init_freeable+0x318/0x47c
[   60.061495] [c0000018ee813db0] [c0000000000107c4] kernel_init+0x24/0x150
[   60.061500] [c0000018ee813e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   88.016703] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
[   88.016709] Modules linked in:
[   88.016713] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc5-next-20190620-autotest #1
[   88.016718] NIP:  c00000000000ab8c LR: c00000000001b434 CTR: 0000000000000000
[   88.016724] REGS: c0000018ee813780 TRAP: 0901   Not tainted  (5.2.0-rc5-next-20190620-autotest)
[   88.016730] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44008484  XER: 00000005
[   88.016738] CFAR: c000000000b69e30 IRQMASK: 0 
[   88.016738] GPR00: c000000000b883e0 c0000018ee813a10 c000000001544d00 0000000000000900 
[   88.016738] GPR04: 0000000000000000 0000000000000000 0000000000000001 0000000000000004 
[   88.016738] GPR08: 0000000000000000 c0000018eb436d80 0000000000000001 0000000000000220 
[   88.016738] GPR12: 0000000000000000 c000000001990000 
[   88.016761] NIP [c00000000000ab8c] replay_interrupt_return+0x0/0x4
[   88.016767] LR [c00000000001b434] arch_local_irq_restore+0x84/0x90
[   88.016771] Call Trace:
[   88.016774] [c0000018ee813a10] [c0000018ee813bac] 0xc0000018ee813bac (unreliable)
[   88.016780] [c0000018ee813a30] [c000000000b883e0] _raw_spin_unlock_irqrestore+0x50/0x80
[   88.016786] [c0000018ee813a50] [c000000000b69e84] klist_next+0xb4/0x150
[   88.016792] [c0000018ee813aa0] [c000000000766f60] subsys_find_device_by_id+0xf0/0x1a0
[   88.016798] [c0000018ee813b00] [c000000000796464] find_memory_block_by_id+0x94/0xb0
[   88.016804] [c0000018ee813b30] [c000000000797b1c] walk_memory_blocks+0x7c/0xf0
[   88.016810] [c0000018ee813b80] [c000000000795f60] link_mem_sections+0x40/0x60
[   88.016816] [c0000018ee813bb0] [c000000000f28c28] topology_init+0xa0/0x268
[   88.016821] [c0000018ee813c10] [c000000000010448] do_one_initcall+0x68/0x2c0
[   88.016827] [c0000018ee813ce0] [c000000000f247dc] kernel_init_freeable+0x318/0x47c
[   88.016833] [c0000018ee813db0] [c0000000000107c4] kernel_init+0x24/0x150
[   88.016838] [c0000018ee813e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   88.016843] Instruction dump:
[   88.016847] 7d200026 618c8000 2c030900 4182e568 2c030500 4182e010 2c030f00 4182f2d8 
[   88.016854] 2c030a00 4182ffb8 60000000 60000000 <4e800020> 7c781b78 480003e1 480003f9 



--Apple-Mail=_4212258D-1CDC-415B-83AE-53D527635E7E--

