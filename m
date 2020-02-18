Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDED162598
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 12:36:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MJhg6NrFzDqcX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 22:36:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MJfB36d7zDqHl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 22:34:10 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01IAhl3T025782
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 05:45:31 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y6dp9b7b1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 05:45:31 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Tue, 18 Feb 2020 10:45:28 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Feb 2020 10:45:26 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01IAjPL051314892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 10:45:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33765AE05F;
 Tue, 18 Feb 2020 10:45:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DF59AE055;
 Tue, 18 Feb 2020 10:45:24 +0000 (GMT)
Received: from [9.199.196.80] (unknown [9.199.196.80])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Feb 2020 10:45:24 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_7F156D1F-73D2-487E-9410-6A7B259D8A13"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9 
Date: Tue, 18 Feb 2020 16:15:23 +0530
To: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Kirill Tkhai <ktkhai@virtuozzo.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20021810-0008-0000-0000-00000354120F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021810-0009-0000-0000-00004A751ABE
Message-Id: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_02:2020-02-17,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxlogscore=464 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002180088
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_7F156D1F-73D2-487E-9410-6A7B259D8A13
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Todays next fails to boot on a POWER9 PowerVM logical partition
with following trace:

[    8.767660] random: systemd: uninitialized urandom read (16 bytes =
read)
[    8.768629] BUG: Kernel NULL pointer dereference on read at =
0x000073b0
[    8.768635] Faulting instruction address: 0xc0000000003d55f4
[    8.768641] Oops: Kernel access of bad area, sig: 11 [#1]
[    8.768645] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[    8.768650] Modules linked in:
[    8.768655] CPU: 19 PID: 1 Comm: systemd Not tainted =
5.6.0-rc2-next-20200218-autotest #1
[    8.768660] NIP:  c0000000003d55f4 LR: c0000000003d5b94 CTR: =
0000000000000000
[    8.768666] REGS: c0000008b37836d0 TRAP: 0300   Not tainted  =
(5.6.0-rc2-next-20200218-autotest)
[    8.768671] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
24004844  XER: 00000000
[    8.768679] CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: =
40000000 IRQMASK: 1
[    8.768679] GPR00: c0000000003d5b94 c0000008b3783960 c00000000155d400 =
c0000008b301f500
[    8.768679] GPR04: 0000000000000dc0 0000000000000002 c0000000003443d8 =
c0000008bb398620
[    8.768679] GPR08: 00000008ba2f0000 0000000000000001 0000000000000000 =
0000000000000000
[    8.768679] GPR12: 0000000024004844 c00000001ec52a00 0000000000000000 =
0000000000000000
[    8.768679] GPR16: c0000008a1b20048 c000000001595898 c000000001750c18 =
0000000000000002
[    8.768679] GPR20: c000000001750c28 c000000001624470 0000000fffffffe0 =
5deadbeef0000122
[    8.768679] GPR24: 0000000000000001 0000000000000dc0 0000000000000002 =
c0000000003443d8
[    8.768679] GPR28: c0000008b301f500 c0000008bb398620 0000000000000000 =
c00c000002287180
[    8.768727] NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760
[    8.768732] LR [c0000000003d5b94] __slab_alloc+0x34/0x60
[    8.768735] Call Trace:
[    8.768739] [c0000008b3783960] [c0000000003d5734] =
___slab_alloc+0x334/0x760 (unreliable)
[    8.768745] [c0000008b3783a40] [c0000000003d5b94] =
__slab_alloc+0x34/0x60
[    8.768751] [c0000008b3783a70] [c0000000003d6fa0] =
__kmalloc_node+0x110/0x490
[    8.768757] [c0000008b3783af0] [c0000000003443d8] =
kvmalloc_node+0x58/0x110
[    8.768763] [c0000008b3783b30] [c0000000003fee38] =
mem_cgroup_css_online+0x108/0x270
[    8.768769] [c0000008b3783b90] [c000000000235aa8] =
online_css+0x48/0xd0
[    8.768775] [c0000008b3783bc0] [c00000000023eaec] =
cgroup_apply_control_enable+0x2ec/0x4d0
[    8.768781] [c0000008b3783ca0] [c000000000242318] =
cgroup_mkdir+0x228/0x5f0
[    8.768786] [c0000008b3783d10] [c00000000051e170] =
kernfs_iop_mkdir+0x90/0xf0
[    8.768792] [c0000008b3783d50] [c00000000043dc00] =
vfs_mkdir+0x110/0x230
[    8.768797] [c0000008b3783da0] [c000000000441c90] =
do_mkdirat+0xb0/0x1a0
[    8.768804] [c0000008b3783e20] [c00000000000b278] =
system_call+0x5c/0x68
[    8.768808] Instruction dump:
[    8.768811] 7c421378 e95f0000 714a0001 4082fff0 4bffff64 60000000 =
60000000 faa10088
[    8.768818] 3ea2000c 3ab57070 7b4a1f24 7d55502a <e94a73b0> 2faa0000 =
409e0394 3d02002a
[    8.768826] ---[ end trace 631af2cb73507891 ]---
[    8.770876]
[    9.770887] Kernel panic - not syncing: Fatal exception

Bisect reveals the problem was introduced in next-20200217 by following =
commit=20

commit a75056fc1e7c=20
mm/memcontrol.c: allocate shrinker_map on appropriate NUMA node

I can boot the kernel successfully if the patch is reverted.=20

Boot log attached.

Thanks
-Sachin


--Apple-Mail=_7F156D1F-73D2-487E-9410-6A7B259D8A13
Content-Disposition: attachment;
	filename=next-20200218.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="next-20200218.log"
Content-Transfer-Encoding: 7bit

[pexpect]#kexec -e
[22603.697266] kexec_core: Starting new kernel
[22603.717296] kexec: waiting for cpu 2 (physical 2) to enter 1 state
[22603.717308] kexec: waiting for cpu 1 (physical 1) to enter 2 state
[22603.717363] kexec: waiting for cpu 2 (physical 2) to enter 2 state
[22603.717375] kexec: waiting for cpu 3 (physical 3) to enter 2 state
[22603.717384] kexec: waiting for cpu 4 (physical 4) to enter 2 state
[22603.717395] kexec: waiting for cpu 15 (physical 15) to enter 2 state
[22603.717404] kexec: waiting for cpu 31 (physical 31) to enter 2 state
[22603.880936] kexec: Starting switchover sequence.
I'm in purgatory
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
[    0.000000] Linux version 5.6.0-rc2-next-20200218-autotest (root@ltc-zzci-2.aus.stglabs.ibm.com) (gcc version 8.3.1 20190507 (Red Hat 8.3.1-4) (GCC)) #1 SMP Tue Feb 18 03:28:40 CST 2020
[    0.000000] Found initrd at 0xc000000003160000:0xc000000004bb41ea
[    0.000000] Using pSeries machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Partition configured for 32 cpus.
[    0.000000] CPU maps initialized for 8 threads per core
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x8c0000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x80
[    0.000000] cpu_features      = 0x0001c07f8f5f91a7
[    0.000000]   possible        = 0x0003fbffcf5fb1a7
[    0.000000]   always          = 0x00000003800081a1
[    0.000000] cpu_user_features = 0xdc0065c2 0xefe00000
[    0.000000] mmu_features      = 0x7c006001
[    0.000000] firmware_features = 0x00000097c45bfc57
[    0.000000] vmalloc start     = 0xc008000000000000
[    0.000000] IO start          = 0xc00a000000000000
[    0.000000] vmemmap start     = 0xc00c000000000000
[    0.000000] hash-mmu: ppc64_pft_size    = 0x1c
[    0.000000] hash-mmu: htab_hash_mask    = 0x1fffff
[    0.000000] -----------------------------------------------------
[    0.000000] numa:   NODE_DATA [mem 0x8bfedc900-0x8bfee3fff]
[    0.000000] numa:     NODE_DATA(0) on node 1
[    0.000000] numa:   NODE_DATA [mem 0x8bfed5200-0x8bfedc8ff]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] link-stack-flush: software flush enabled.
[    0.000000] count-cache-flush: software flush disabled.
[    0.000000] stf-barrier: eieio barrier available
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:0 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:2 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:10 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:2 psize:2 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:2 psize:10 block size:8
[    0.000000] PPC64 nvram contains 15360 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x00000008bfffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   1: [mem 0x0000000000000000-0x00000008bfffffff]
[    0.000000] Could not find start_pfn for node 0
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000000000000]
[    0.000000] Initmem setup node 1 [mem 0x0000000000000000-0x00000008bfffffff]
[    0.000000] percpu: Embedded 11 pages/cpu s624024 r0 d96872 u1048576
[    0.000000] Built 2 zonelists, mobility grouping on.  Total pages: 572880
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=UUID=681ebf25-b7c8-49b9-b247-35a96bc8183f 
[    0.000000] Dentry cache hash table entries: 8388608 (order: 10, 67108864 bytes, linear)
[    0.000000] Inode-cache hash table entries: 4194304 (order: 9, 33554432 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 36388352K/36700160K available (11840K kernel code, 1728K rwdata, 3712K rodata, 4992K init, 2842K bss, 311808K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=32, Nodes=32
[    0.000000] ftrace: allocating 29812 entries in 11 pages
[    0.000000] ftrace: allocated 11 pages with 3 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=32.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=32
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] xive: Using IRQ range [94000-9401f]
[    0.000000] xive: Interrupt handling initialized with spapr backend
[    0.000000] xive: Using priority 7 for all interrupts
[    0.000000] xive: Using 64kB queues
[    0.000000] rcu: 	Offload RCU callbacks from CPUs: (none).
[    0.000000] random: get_random_u64 called from start_kernel+0x704/0x960 with crng_init=0
[    0.000001] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.000065] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000172] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000299] Console: colour dummy device 80x25
[    0.000348] printk: console [hvc0] enabled
[    0.000348] printk: console [hvc0] enabled
[    0.000395] printk: bootconsole [udbg0] disabled
[    0.000395] printk: bootconsole [udbg0] disabled
[    0.000472] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.000485] pid_max: default: 32768 minimum: 301
[    0.000640] Mount-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.000711] Mountpoint-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.001521] EEH: pSeries platform initialized
[    0.001529] POWER9 performance monitor hardware support registered
[    0.001562] rcu: Hierarchical SRCU implementation.
[    0.002261] smp: Bringing up secondary CPUs ...
[    0.009907] smp: Brought up 2 nodes, 32 CPUs
[    0.009915] numa: Node 0 CPUs:
[    0.009918] numa: Node 1 CPUs: 0-31
[    0.009922] Using small cores at SMT level
[    0.009925] Using shared cache scheduler topology
[    0.010886] devtmpfs: initialized
[    0.013983] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.013993] futex hash table entries: 8192 (order: 4, 1048576 bytes, linear)
[    0.014219] thermal_sys: Registered thermal governor 'fair_share'
[    0.014220] thermal_sys: Registered thermal governor 'step_wise'
[    0.014326] NET: Registered protocol family 16
[    0.014548] audit: initializing netlink subsys (disabled)
[    0.014651] audit: type=2000 audit(1582021217.010:1): state=initialized audit_enabled=0 res=1
[    0.014745] cpuidle: using governor menu
[    0.014918] pstore: Registered nvram as persistent store backend
[    0.019457] PCI: Probing PCI hardware
[    0.019464] EEH: No capable adapters found: recovery disabled.
[    0.019528] pseries-rng: Registering arch random hook.
[    0.021204] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
[    0.021211] HugeTLB registered 16.0 GiB page size, pre-allocated 0 pages
[    0.262509] random: fast init done
[    0.263568] iommu: Default domain type: Translated 
[    0.263610] vgaarb: loaded
[    0.263690] SCSI subsystem initialized
[    0.263721] usbcore: registered new interface driver usbfs
[    0.263730] usbcore: registered new interface driver hub
[    0.263809] usbcore: registered new device driver usb
[    0.263942] EDAC MC: Ver: 3.0.0
[    0.264240] clocksource: Switched to clocksource timebase
[    0.275109] VFS: Disk quotas dquot_6.6.0
[    0.275134] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
[    0.277054] NET: Registered protocol family 2
[    0.277232] tcp_listen_portaddr_hash hash table entries: 32768 (order: 3, 524288 bytes, linear)
[    0.277285] TCP established hash table entries: 524288 (order: 6, 4194304 bytes, linear)
[    0.278078] TCP bind hash table entries: 65536 (order: 4, 1048576 bytes, linear)
[    0.278171] TCP: Hash tables configured (established 524288 bind 65536)
[    0.278207] UDP hash table entries: 32768 (order: 4, 1048576 bytes, linear)
[    0.278345] UDP-Lite hash table entries: 32768 (order: 4, 1048576 bytes, linear)
[    0.278790] NET: Registered protocol family 1
[    0.278799] PCI: CLS 0 bytes, default 128
[    0.278835] Trying to unpack rootfs image as initramfs...
[    0.688786] Freeing initrd memory: 26944K
[    0.691421] IOMMU table initialized, virtual merging enabled
[    0.711501] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs
[    0.712517] workingset: timestamp_bits=38 max_order=20 bucket_order=0
[    0.713567] zbud: loaded
[    0.722396] NET: Registered protocol family 38
[    0.722402] Key type asymmetric registered
[    0.722406] Asymmetric key parser 'x509' registered
[    0.722416] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
[    0.722510] io scheduler mq-deadline registered
[    0.722514] io scheduler kyber registered
[    0.722936] atomic64_test: passed
[    0.722969] PowerPC PowerNV PCI Hotplug Driver version: 0.1
[    0.723277] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.723505] Non-volatile memory driver v1.3
[    0.723533] Linux agpgart interface v0.103
[    8.634413] tpm_ibmvtpm 30000003: ibmvtpm device is not ready
[    8.634418] tpm_ibmvtpm 30000003: CRQ initialization completed
[    8.634423] tpm_ibmvtpm 30000003: ibmvtpm device is not ready
[    8.634763] rdac: device handler registered
[    8.634822] hp_sw: device handler registered
[    8.634827] emc: device handler registered
[    8.634934] alua: device handler registered
[    8.635049] libphy: Fixed MDIO Bus: probed
[    8.635103] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    8.635119] ehci-pci: EHCI PCI platform driver
[    8.635131] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    8.635145] ohci-pci: OHCI PCI platform driver
[    8.635157] uhci_hcd: USB Universal Host Controller Interface driver
[    8.635201] usbcore: registered new interface driver usbserial_generic
[    8.635211] usbserial: USB Serial support registered for generic
[    8.635292] mousedev: PS/2 mouse device common for all mice
[    8.635444] rtc-generic rtc-generic: registered as rtc0
[    8.635933] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_size new:65536 old:0
[    8.635944] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_sg new:510 old:0
[    8.635952] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sg_len new:4080 old:0
[    8.636029] alg: No test for 842 (842-nx)
[    8.637537] hid: raw HID events driver (C) Jiri Kosina
[    8.637671] usbcore: registered new interface driver usbhid
[    8.637677] usbhid: USB HID core driver
[    8.637748] drop_monitor: Initializing network drop monitor service
[    8.637857] Initializing XFRM netlink socket
[    8.638055] NET: Registered protocol family 10
[    8.638579] Segment Routing with IPv6
[    8.638620] NET: Registered protocol family 17
[    8.639674] registered taskstats version 1
[    8.639728] zswap: loaded using pool lzo/zbud
[    8.639899] pstore: Using crash dump compression: deflate
[    8.644602] Key type big_key registered
[    8.644763] rtc-generic rtc-generic: setting system clock to 2020-02-18T10:20:26 UTC (1582021226)
[    8.646127] Freeing unused kernel memory: 4992K
[    8.646132] Kernel memory protection not selected by kernel config.
[    8.646136] Run /init as init process
[    8.655323] systemd[1]: systemd 239 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=legacy)
[    8.655511] systemd[1]: Detected architecture ppc64-le.
[    8.655518] systemd[1]: Running in initial RAM disk.

Welcome to Red Hat Enterprise Linux 8.1 Beta (Ootpa) dracut-049-26.git20190806.el8 (Initramfs)!

[    8.714833] systemd[1]: Set hostname to <ltc-zzci-2.aus.stglabs.ibm.com>.
[    8.767334] random: systemd: uninitialized urandom read (16 bytes read)
[    8.767443] systemd[1]: Listening on Journal Socket.
[  OK  ] Listening on Journal Socket.
[    8.767588] random: systemd: uninitialized urandom read (16 bytes read)
[    8.767600] systemd[1]: Reached target Local File Systems.
[  OK  ] Reached target Local File Systems.
[    8.767660] random: systemd: uninitialized urandom read (16 bytes read)
[    8.768629] BUG: Kernel NULL pointer dereference on read at 0x000073b0
[    8.768635] Faulting instruction address: 0xc0000000003d55f4
[    8.768641] Oops: Kernel access of bad area, sig: 11 [#1]
[    8.768645] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[    8.768650] Modules linked in:
[    8.768655] CPU: 19 PID: 1 Comm: systemd Not tainted 5.6.0-rc2-next-20200218-autotest #1
[    8.768660] NIP:  c0000000003d55f4 LR: c0000000003d5b94 CTR: 0000000000000000
[    8.768666] REGS: c0000008b37836d0 TRAP: 0300   Not tainted  (5.6.0-rc2-next-20200218-autotest)
[    8.768671] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24004844  XER: 00000000
[    8.768679] CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: 40000000 IRQMASK: 1 
[    8.768679] GPR00: c0000000003d5b94 c0000008b3783960 c00000000155d400 c0000008b301f500 
[    8.768679] GPR04: 0000000000000dc0 0000000000000002 c0000000003443d8 c0000008bb398620 
[    8.768679] GPR08: 00000008ba2f0000 0000000000000001 0000000000000000 0000000000000000 
[    8.768679] GPR12: 0000000024004844 c00000001ec52a00 0000000000000000 0000000000000000 
[    8.768679] GPR16: c0000008a1b20048 c000000001595898 c000000001750c18 0000000000000002 
[    8.768679] GPR20: c000000001750c28 c000000001624470 0000000fffffffe0 5deadbeef0000122 
[    8.768679] GPR24: 0000000000000001 0000000000000dc0 0000000000000002 c0000000003443d8 
[    8.768679] GPR28: c0000008b301f500 c0000008bb398620 0000000000000000 c00c000002287180 
[    8.768727] NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760
[    8.768732] LR [c0000000003d5b94] __slab_alloc+0x34/0x60
[    8.768735] Call Trace:
[    8.768739] [c0000008b3783960] [c0000000003d5734] ___slab_alloc+0x334/0x760 (unreliable)
[    8.768745] [c0000008b3783a40] [c0000000003d5b94] __slab_alloc+0x34/0x60
[    8.768751] [c0000008b3783a70] [c0000000003d6fa0] __kmalloc_node+0x110/0x490
[    8.768757] [c0000008b3783af0] [c0000000003443d8] kvmalloc_node+0x58/0x110
[    8.768763] [c0000008b3783b30] [c0000000003fee38] mem_cgroup_css_online+0x108/0x270
[    8.768769] [c0000008b3783b90] [c000000000235aa8] online_css+0x48/0xd0
[    8.768775] [c0000008b3783bc0] [c00000000023eaec] cgroup_apply_control_enable+0x2ec/0x4d0
[    8.768781] [c0000008b3783ca0] [c000000000242318] cgroup_mkdir+0x228/0x5f0
[    8.768786] [c0000008b3783d10] [c00000000051e170] kernfs_iop_mkdir+0x90/0xf0
[    8.768792] [c0000008b3783d50] [c00000000043dc00] vfs_mkdir+0x110/0x230
[    8.768797] [c0000008b3783da0] [c000000000441c90] do_mkdirat+0xb0/0x1a0
[    8.768804] [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
[    8.768808] Instruction dump:
[    8.768811] 7c421378 e95f0000 714a0001 4082fff0 4bffff64 60000000 60000000 faa10088 
[    8.768818] 3ea2000c 3ab57070 7b4a1f24 7d55502a <e94a73b0> 2faa0000 409e0394 3d02002a 
[    8.768826] ---[ end trace 631af2cb73507891 ]---
[    8.770876] 
[    9.770887] Kernel panic - not syncing: Fatal exception
[    9.778279] ------------[ cut here ]------------
[    9.778289] WARNING: CPU: 19 PID: 1 at drivers/tty/vt/vt.c:4267 do_unblank_screen+0x190/0x250
[    9.778298] Modules linked in:
[    9.778304] CPU: 19 PID: 1 Comm: systemd Tainted: G      D           5.6.0-rc2-next-20200218-autotest #1
[    9.778313] NIP:  c0000000006e9180 LR: c0000000006e916c CTR: c000000000b74c60
[    9.778321] REGS: c0000008b37831b0 TRAP: 0700   Tainted: G      D            (5.6.0-rc2-next-20200218-autotest)
[    9.778330] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28002242  XER: 2004000c
[    9.778341] CFAR: c0000000001c74b8 IRQMASK: 3 
[    9.778341] GPR00: c0000000006e916c c0000008b3783440 c00000000155d400 0000000000000000 
[    9.778341] GPR04: 0000000000000003 c0000008ad01400e 0000000000001dd7 c0000008b3783380 
[    9.778341] GPR08: c000000001423760 0000000000000000 0000000000000000 c0000008b37831ff 
[    9.778341] GPR12: 0000000028002448 c00000001ec52a00 0000000000000000 0000000000000000 
[    9.778341] GPR16: c0000008a1b20048 c000000001595898 c000000001750c18 0000000000000002 
[    9.778341] GPR20: c000000001750c28 c000000001624470 0000000fffffffe0 5deadbeef0000122 
[    9.778341] GPR24: 0000000000000001 0000000000000dc0 c00000000142c740 c0000000003443d8 
[    9.778341] GPR28: c000000001636f58 c000000001636f80 0000000000000000 c000000001745a08 
[    9.778410] NIP [c0000000006e9180] do_unblank_screen+0x190/0x250
[    9.778418] LR [c0000000006e916c] do_unblank_screen+0x17c/0x250
[    9.778424] Call Trace:
[    9.778429] [c0000008b3783440] [c0000000006e919c] do_unblank_screen+0x1ac/0x250 (unreliable)
[    9.778440] [c0000008b37834c0] [c00000000013e6b8] panic+0x1e8/0x410
[    9.778448] [c0000008b3783560] [c00000000002c6fc] oops_end+0x1ac/0x1b0
[    9.778457] [c0000008b37835e0] [c000000000086790] bad_page_fault+0x190/0x1e0
[    9.778466] [c0000008b3783660] [c00000000000a8a4] handle_page_fault+0x2c/0x30
[    9.778476] --- interrupt: 300 at ___slab_alloc+0x1f4/0x760
[    9.778476]     LR = __slab_alloc+0x34/0x60
[    9.778486] [c0000008b3783960] [c0000000003d5734] ___slab_alloc+0x334/0x760 (unreliable)
[    9.778495] [c0000008b3783a40] [c0000000003d5b94] __slab_alloc+0x34/0x60
[    9.778504] [c0000008b3783a70] [c0000000003d6fa0] __kmalloc_node+0x110/0x490
[    9.778513] [c0000008b3783af0] [c0000000003443d8] kvmalloc_node+0x58/0x110
[    9.778521] [c0000008b3783b30] [c0000000003fee38] mem_cgroup_css_online+0x108/0x270
[    9.778530] [c0000008b3783b90] [c000000000235aa8] online_css+0x48/0xd0
[    9.778538] [c0000008b3783bc0] [c00000000023eaec] cgroup_apply_control_enable+0x2ec/0x4d0
[    9.778547] [c0000008b3783ca0] [c000000000242318] cgroup_mkdir+0x228/0x5f0
[    9.778556] [c0000008b3783d10] [c00000000051e170] kernfs_iop_mkdir+0x90/0xf0
[    9.778565] [c0000008b3783d50] [c00000000043dc00] vfs_mkdir+0x110/0x230
[    9.778572] [c0000008b3783da0] [c000000000441c90] do_mkdirat+0xb0/0x1a0
[    9.778581] [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
[    9.778587] Instruction dump:
[    9.778592] 4e800020 60000000 60000000 60000000 7c0802a6 f8010090 4bade341 60000000 
[    9.778604] 813f0000 7d231b78 2f830000 409e0034 <0fe00000> e8010090 7c0803a6 4bfffeac 
[    9.778615] ---[ end trace 631af2cb73507892 ]---
[    9.778621] Rebooting in 10 seconds..


--Apple-Mail=_7F156D1F-73D2-487E-9410-6A7B259D8A13--

