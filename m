Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC603182B28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 09:26:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dMP61XZfzDqLr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 19:26:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dMMT3GJXzDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 19:25:08 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02C8Lf73104616
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 04:25:04 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yqgt5t8dy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 04:25:02 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Thu, 12 Mar 2020 08:23:31 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Mar 2020 08:23:27 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02C8NQhp47185990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 08:23:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3AF3A4053;
 Thu, 12 Mar 2020 08:23:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D340AA4040;
 Thu, 12 Mar 2020 08:23:23 +0000 (GMT)
Received: from [9.199.197.43] (unknown [9.199.197.43])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 Mar 2020 08:23:23 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_84315D49-E70C-46FA-A7DE-364B0CA38ACB"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 1/3] powerpc/numa: Set numa_node for all possible cpus
Date: Thu, 12 Mar 2020 13:53:22 +0530
In-Reply-To: <20200312052707.GA3277@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20200311110237.5731-1-srikar@linux.vnet.ibm.com>
 <20200311110237.5731-2-srikar@linux.vnet.ibm.com>
 <20200311115735.GM23944@dhcp22.suse.cz>
 <20200312052707.GA3277@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20031208-0020-0000-0000-000003B3213C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031208-0021-0000-0000-0000220B7453
Message-Id: <C5560C71-483A-41FB-BDE9-526F1E0CFA36@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-12_01:2020-03-11,
 2020-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003120044
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
Cc: linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Mel Gorman <mgorman@suse.de>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_84315D49-E70C-46FA-A7DE-364B0CA38ACB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 12-Mar-2020, at 10:57 AM, Srikar Dronamraju =
<srikar@linux.vnet.ibm.com> wrote:
>=20
> * Michal Hocko <mhocko@kernel.org> [2020-03-11 12:57:35]:
>=20
>> On Wed 11-03-20 16:32:35, Srikar Dronamraju wrote:
>>> A Powerpc system with multiple possible nodes and with CONFIG_NUMA
>>> enabled always used to have a node 0, even if node 0 does not any =
cpus
>>> or memory attached to it. As per PAPR, node affinity of a cpu is =
only
>>> available once its present / online. For all cpus that are possible =
but
>>> not present, cpu_to_node() would point to node 0.
>>>=20
>>> To ensure a cpuless, memoryless dummy node is not online, powerpc =
need
>>> to make sure all possible but not present cpu_to_node are set to a
>>> proper node.
>>=20
>> Just curious, is this somehow related to
>> http://lkml.kernel.org/r/20200227182650.GG3771@dhcp22.suse.cz?
>>=20
>=20
> The issue I am trying to fix is a known issue in Powerpc since many =
years.
> So this surely not a problem after a75056fc1e7c (mm/memcontrol.c: =
allocate
> shrinker_map on appropriate NUMA node").=20
>=20
> I tried v5.6-rc4 + a75056fc1e7c but didnt face any issues booting the
> kernel. Will work with Sachin/Abdul (reporters of the issue).
>=20

I applied this 3 patch series on top of March 11 next tree (commit =
d44a64766795 )
The kernel still fails to boot with same call trace.

[    6.159357] BUG: Kernel NULL pointer dereference on read at =
0x000073b0
[    6.159363] Faulting instruction address: 0xc0000000003d7174
[    6.159368] Oops: Kernel access of bad area, sig: 11 [#1]
[    6.159372] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[    6.159378] Modules linked in:
[    6.159382] CPU: 17 PID: 1 Comm: systemd Not tainted =
5.6.0-rc5-next-20200311-autotest+ #1
[    6.159388] NIP:  c0000000003d7174 LR: c0000000003d7714 CTR: =
c000000000400e70
[    6.159393] REGS: c0000008b36836d0 TRAP: 0300   Not tainted  =
(5.6.0-rc5-next-20200311-autotest+)
[    6.159398] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
24004848  XER: 00000000
[    6.159406] CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: =
40000000 IRQMASK: 1
[    6.159406] GPR00: c0000000003d7714 c0000008b3683960 c00000000155e300 =
c0000008b301f500
[    6.159406] GPR04: 0000000000000dc0 0000000000000000 c0000000003456f8 =
c0000008bb198620
[    6.159406] GPR08: 00000008ba0f0000 0000000000000001 0000000000000000 =
0000000000000000
[    6.159406] GPR12: 0000000024004848 c00000001ec55e00 0000000000000000 =
0000000000000000
[    6.159406] GPR16: c0000008b0a82048 c000000001595898 c000000001750ca8 =
0000000000000002
[    6.159406] GPR20: c000000001750cb8 c000000001624478 0000000fffffffe0 =
5deadbeef0000122
[    6.159406] GPR24: 0000000000000001 0000000000000dc0 0000000000000000 =
c0000000003456f8
[    6.159406] GPR28: c0000008b301f500 c0000008bb198620 0000000000000000 =
c00c000002285a40
[    6.159453] NIP [c0000000003d7174] ___slab_alloc+0x1f4/0x760
[    6.159458] LR [c0000000003d7714] __slab_alloc+0x34/0x60
[    6.159462] Call Trace:
[    6.159465] [c0000008b3683a40] [c0000008b3683a70] 0xc0000008b3683a70
[    6.159471] [c0000008b3683a70] [c0000000003d8b20] =
__kmalloc_node+0x110/0x490
[    6.159477] [c0000008b3683af0] [c0000000003456f8] =
kvmalloc_node+0x58/0x110
[    6.159483] [c0000008b3683b30] [c000000000400f78] =
mem_cgroup_css_online+0x108/0x270
[    6.159489] [c0000008b3683b90] [c000000000236ed8] =
online_css+0x48/0xd0
[    6.159494] [c0000008b3683bc0] [c00000000023ffac] =
cgroup_apply_control_enable+0x2ec/0x4d0
[    6.159501] [c0000008b3683ca0] [c0000000002437c8] =
cgroup_mkdir+0x228/0x5f0
[    6.159506] [c0000008b3683d10] [c000000000521780] =
kernfs_iop_mkdir+0x90/0xf0
[    6.159512] [c0000008b3683d50] [c00000000043f670] =
vfs_mkdir+0x110/0x230
[    6.159517] [c0000008b3683da0] [c000000000443150] =
do_mkdirat+0xb0/0x1a0
[    6.159523] [c0000008b3683e20] [c00000000000b278] =
system_call+0x5c/0x68
[    6.159527] Instruction dump:
[    6.159531] 7c421378 e95f0000 714a0001 4082fff0 4bffff64 60000000 =
60000000 faa10088
[    6.159538] 3ea2000c 3ab56178 7b4a1f24 7d55502a <e94a73b0> 2faa0000 =
409e0394 3d02002a
[    6.159545] ---[ end trace 36d65cb66091a5b6 ]=E2=80=94

Boot log attached.

Thanks
-Sachin=

--Apple-Mail=_84315D49-E70C-46FA-A7DE-364B0CA38ACB
Content-Disposition: attachment;
	filename=memory-less-node-boot.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="memory-less-node-boot.log"
Content-Transfer-Encoding: 7bit

# kexec -e
[ 4149.149473] kexec_core: Starting new kernel
[ 4149.169501] kexec: waiting for cpu 2 (physical 2) to enter 1 state
[ 4149.169512] kexec: waiting for cpu 23 (physical 23) to enter 1 state
[ 4149.169521] kexec: waiting for cpu 1 (physical 1) to enter 2 state
[ 4149.169596] kexec: waiting for cpu 2 (physical 2) to enter 2 state
[ 4149.169610] kexec: waiting for cpu 3 (physical 3) to enter 2 state
[ 4149.169620] kexec: waiting for cpu 8 (physical 8) to enter 2 state
[ 4149.333175] kexec: Starting switchover sequence.
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
[    0.000000] Linux version 5.6.0-rc5-next-20200311-autotest+ (root@ltc-zzci-2.aus.stglabs.ibm.com) (gcc version 8.3.1 20190507 (Red Hat 8.3.1-4) (GCC)) #1 SMP Thu Mar 12 03:03:59 CDT 2020
[    0.000000] Found initrd at 0xc000000003350000:0xc000000004d9808f
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
[    0.000000] Initmem setup node 1 [mem 0x0000000000000000-0x00000008bfffffff]
[    0.000000] percpu: Embedded 11 pages/cpu s624024 r0 d96872 u1048576
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 572880
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=UUID=681ebf25-b7c8-49b9-b247-35a96bc8183f 
[    0.000000] Dentry cache hash table entries: 8388608 (order: 10, 67108864 bytes, linear)
[    0.000000] Inode-cache hash table entries: 4194304 (order: 9, 33554432 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 36388480K/36700160K available (11840K kernel code, 1728K rwdata, 3712K rodata, 4992K init, 2845K bss, 311680K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=32, Nodes=32
[    0.000000] ftrace: allocating 29890 entries in 11 pages
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
[    0.000000] random: get_random_u64 called from start_kernel+0x748/0x9a4 with crng_init=0
[    0.000001] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.000065] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000173] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000299] Console: colour dummy device 80x25
[    0.000350] printk: console [hvc0] enabled
[    0.000350] printk: console [hvc0] enabled
[    0.000397] printk: bootconsole [udbg0] disabled
[    0.000397] printk: bootconsole [udbg0] disabled
[    0.000472] pid_max: default: 32768 minimum: 301
[    0.000621] Mount-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.000690] Mountpoint-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.001491] EEH: pSeries platform initialized
[    0.001499] POWER9 performance monitor hardware support registered
[    0.001531] rcu: Hierarchical SRCU implementation.
[    0.002227] smp: Bringing up secondary CPUs ...
[    0.011406] smp: Brought up 1 node, 32 CPUs
[    0.011413] numa: Node 1 CPUs: 0-31
[    0.011417] Using small cores at SMT level
[    0.011420] Using shared cache scheduler topology
[    0.012363] devtmpfs: initialized
[    0.015539] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.015550] futex hash table entries: 8192 (order: 4, 1048576 bytes, linear)
[    0.015773] thermal_sys: Registered thermal governor 'fair_share'
[    0.015774] thermal_sys: Registered thermal governor 'step_wise'
[    0.015880] NET: Registered protocol family 16
[    0.016023] audit: initializing netlink subsys (disabled)
[    0.016073] audit: type=2000 audit(1584000985.010:1): state=initialized audit_enabled=0 res=1
[    0.016180] cpuidle: using governor menu
[    0.016353] pstore: Registered nvram as persistent store backend
[    0.020998] PCI: Probing PCI hardware
[    0.021005] EEH: No capable adapters found: recovery disabled.
[    0.021071] pseries-rng: Registering arch random hook.
[    0.022801] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
[    0.022808] HugeTLB registered 16.0 GiB page size, pre-allocated 0 pages
[    0.263342] random: fast init done
[    0.264479] iommu: Default domain type: Translated 
[    0.264517] vgaarb: loaded
[    0.264595] SCSI subsystem initialized
[    0.264626] usbcore: registered new interface driver usbfs
[    0.264635] usbcore: registered new interface driver hub
[    0.264714] usbcore: registered new device driver usb
[    0.264835] EDAC MC: Ver: 3.0.0
[    0.265112] clocksource: Switched to clocksource timebase
[    0.276114] VFS: Disk quotas dquot_6.6.0
[    0.276139] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
[    0.277659] NET: Registered protocol family 2
[    0.277834] tcp_listen_portaddr_hash hash table entries: 32768 (order: 3, 524288 bytes, linear)
[    0.277888] TCP established hash table entries: 524288 (order: 6, 4194304 bytes, linear)
[    0.278586] TCP bind hash table entries: 65536 (order: 4, 1048576 bytes, linear)
[    0.278680] TCP: Hash tables configured (established 524288 bind 65536)
[    0.278718] UDP hash table entries: 32768 (order: 4, 1048576 bytes, linear)
[    0.278817] UDP-Lite hash table entries: 32768 (order: 4, 1048576 bytes, linear)
[    0.279011] NET: Registered protocol family 1
[    0.279020] PCI: CLS 0 bytes, default 128
[    0.279056] Trying to unpack rootfs image as initramfs...
[    0.690890] Freeing initrd memory: 26880K
[    0.693555] IOMMU table initialized, virtual merging enabled
[    0.713723] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs
[    0.714748] workingset: timestamp_bits=38 max_order=20 bucket_order=0
[    0.715826] zbud: loaded
[    0.725026] NET: Registered protocol family 38
[    0.725033] Key type asymmetric registered
[    0.725037] Asymmetric key parser 'x509' registered
[    0.725046] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
[    0.725138] io scheduler mq-deadline registered
[    0.725143] io scheduler kyber registered
[    0.725573] atomic64_test: passed
[    0.725607] PowerPC PowerNV PCI Hotplug Driver version: 0.1
[    0.725872] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.726066] Non-volatile memory driver v1.3
[    0.726089] Linux agpgart interface v0.103
[    6.005301] tpm_ibmvtpm 30000003: CRQ initialization completed
[    6.005309] tpm_ibmvtpm 30000003: ibmvtpm device is not ready
[    6.005310] tpm_ibmvtpm 30000003: ibmvtpm device is not ready
[    6.005540] rdac: device handler registered
[    6.005579] hp_sw: device handler registered
[    6.005583] emc: device handler registered
[    6.005651] alua: device handler registered
[    6.005730] libphy: Fixed MDIO Bus: probed
[    6.005763] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    6.005773] ehci-pci: EHCI PCI platform driver
[    6.005781] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    6.005790] ohci-pci: OHCI PCI platform driver
[    6.005797] uhci_hcd: USB Universal Host Controller Interface driver
[    6.005828] usbcore: registered new interface driver usbserial_generic
[    6.005835] usbserial: USB Serial support registered for generic
[    6.005882] mousedev: PS/2 mouse device common for all mice
[    6.005988] rtc-generic rtc-generic: registered as rtc0
[    6.006323] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_size new:65536 old:0
[    6.006332] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_sg new:510 old:0
[    6.006339] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sg_len new:4080 old:0
[    6.006396] alg: No test for 842 (842-nx)
[    6.007511] hid: raw HID events driver (C) Jiri Kosina
[    6.007602] usbcore: registered new interface driver usbhid
[    6.007605] usbhid: USB HID core driver
[    6.007657] drop_monitor: Initializing network drop monitor service
[    6.007735] Initializing XFRM netlink socket
[    6.007866] NET: Registered protocol family 10
[    6.008125] Segment Routing with IPv6
[    6.008141] NET: Registered protocol family 17
[    6.008645] registered taskstats version 1
[    6.008677] zswap: loaded using pool lzo/zbud
[    6.008809] pstore: Using crash dump compression: deflate
[    6.012620] Key type big_key registered
[    6.012774] rtc-generic rtc-generic: setting system clock to 2020-03-12T08:16:31 UTC (1584000991)
[    6.014119] Freeing unused kernel memory: 4992K
[    6.014124] Kernel memory protection not selected by kernel config.
[    6.014128] Run /init as init process
[    6.023254] systemd[1]: systemd 239 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=legacy)
[    6.023441] systemd[1]: Detected architecture ppc64-le.
[    6.023447] systemd[1]: Running in initial RAM disk.

Welcome to Red Hat Enterprise Linux 8.1 Beta (Ootpa) dracut-049-26.git20190806.el8 (Initramfs)!

[    6.105290] systemd[1]: Set hostname to <ltc-zzci-2.aus.stglabs.ibm.com>.
[    6.157928] random: systemd: uninitialized urandom read (16 bytes read)
[    6.157996] systemd[1]: Listening on udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[    6.158142] random: systemd: uninitialized urandom read (16 bytes read)
[    6.158225] systemd[1]: Listening on Journal Socket.
[  OK  ] Listening on Journal Socket.
[    6.158356] random: systemd: uninitialized urandom read (16 bytes read)
[    6.158368] systemd[1]: Reached target Timers.
[  OK  ] Reached target Timers.
[    6.159357] BUG: Kernel NULL pointer dereference on read at 0x000073b0
[    6.159363] Faulting instruction address: 0xc0000000003d7174
[    6.159368] Oops: Kernel access of bad area, sig: 11 [#1]
[    6.159372] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[    6.159378] Modules linked in:
[    6.159382] CPU: 17 PID: 1 Comm: systemd Not tainted 5.6.0-rc5-next-20200311-autotest+ #1
[    6.159388] NIP:  c0000000003d7174 LR: c0000000003d7714 CTR: c000000000400e70
[    6.159393] REGS: c0000008b36836d0 TRAP: 0300   Not tainted  (5.6.0-rc5-next-20200311-autotest+)
[    6.159398] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24004848  XER: 00000000
[    6.159406] CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: 40000000 IRQMASK: 1 
[    6.159406] GPR00: c0000000003d7714 c0000008b3683960 c00000000155e300 c0000008b301f500 
[    6.159406] GPR04: 0000000000000dc0 0000000000000000 c0000000003456f8 c0000008bb198620 
[    6.159406] GPR08: 00000008ba0f0000 0000000000000001 0000000000000000 0000000000000000 
[    6.159406] GPR12: 0000000024004848 c00000001ec55e00 0000000000000000 0000000000000000 
[    6.159406] GPR16: c0000008b0a82048 c000000001595898 c000000001750ca8 0000000000000002 
[    6.159406] GPR20: c000000001750cb8 c000000001624478 0000000fffffffe0 5deadbeef0000122 
[    6.159406] GPR24: 0000000000000001 0000000000000dc0 0000000000000000 c0000000003456f8 
[    6.159406] GPR28: c0000008b301f500 c0000008bb198620 0000000000000000 c00c000002285a40 
[    6.159453] NIP [c0000000003d7174] ___slab_alloc+0x1f4/0x760
[    6.159458] LR [c0000000003d7714] __slab_alloc+0x34/0x60
[    6.159462] Call Trace:
[    6.159465] [c0000008b3683a40] [c0000008b3683a70] 0xc0000008b3683a70
[    6.159471] [c0000008b3683a70] [c0000000003d8b20] __kmalloc_node+0x110/0x490
[    6.159477] [c0000008b3683af0] [c0000000003456f8] kvmalloc_node+0x58/0x110
[    6.159483] [c0000008b3683b30] [c000000000400f78] mem_cgroup_css_online+0x108/0x270
[    6.159489] [c0000008b3683b90] [c000000000236ed8] online_css+0x48/0xd0
[    6.159494] [c0000008b3683bc0] [c00000000023ffac] cgroup_apply_control_enable+0x2ec/0x4d0
[    6.159501] [c0000008b3683ca0] [c0000000002437c8] cgroup_mkdir+0x228/0x5f0
[    6.159506] [c0000008b3683d10] [c000000000521780] kernfs_iop_mkdir+0x90/0xf0
[    6.159512] [c0000008b3683d50] [c00000000043f670] vfs_mkdir+0x110/0x230
[    6.159517] [c0000008b3683da0] [c000000000443150] do_mkdirat+0xb0/0x1a0
[    6.159523] [c0000008b3683e20] [c00000000000b278] system_call+0x5c/0x68
[    6.159527] Instruction dump:
[    6.159531] 7c421378 e95f0000 714a0001 4082fff0 4bffff64 60000000 60000000 faa10088 
[    6.159538] 3ea2000c 3ab56178 7b4a1f24 7d55502a <e94a73b0> 2faa0000 409e0394 3d02002a 
[    6.159545] ---[ end trace 36d65cb66091a5b6 ]---
[    6.161610] 
[    7.161622] Kernel panic - not syncing: Fatal exception
[    7.169280] ------------[ cut here ]------------
[    7.169289] WARNING: CPU: 17 PID: 1 at drivers/tty/vt/vt.c:4266 do_unblank_screen+0x190/0x250
[    7.169297] Modules linked in:
[    7.169303] CPU: 17 PID: 1 Comm: systemd Tainted: G      D           5.6.0-rc5-next-20200311-autotest+ #1
[    7.169312] NIP:  c0000000006ed370 LR: c0000000006ed35c CTR: c000000000b7b960
[    7.169320] REGS: c0000008b36831b0 TRAP: 0700   Tainted: G      D            (5.6.0-rc5-next-20200311-autotest+)
[    7.169330] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28002242  XER: 2004000c
[    7.169341] CFAR: c0000000001c8948 IRQMASK: 3 
[    7.169341] GPR00: c0000000006ed35c c0000008b3683440 c00000000155e300 0000000000000000 
[    7.169341] GPR04: 0000000000000003 c0000008b06c200e 0000000000001dd7 c0000008b3683380 
[    7.169341] GPR08: c000000001423760 0000000000000000 0000000000000000 c0000008b36831ff 
[    7.169341] GPR12: 0000000028002448 c00000001ec55e00 0000000000000000 0000000000000000 
[    7.169341] GPR16: c0000008b0a82048 c000000001595898 c000000001750ca8 0000000000000002 
[    7.169341] GPR20: c000000001750cb8 c000000001624478 0000000fffffffe0 5deadbeef0000122 
[    7.169341] GPR24: 0000000000000001 0000000000000dc0 c00000000142c830 c0000000003456f8 
[    7.169341] GPR28: c000000001636f58 c000000001636f80 0000000000000000 c000000001745a88 
[    7.169409] NIP [c0000000006ed370] do_unblank_screen+0x190/0x250
[    7.169417] LR [c0000000006ed35c] do_unblank_screen+0x17c/0x250
[    7.169423] Call Trace:
[    7.169428] [c0000008b3683440] [c0000000006ed38c] do_unblank_screen+0x1ac/0x250 (unreliable)
[    7.169439] [c0000008b36834c0] [c00000000013eb24] panic+0x1e8/0x414
[    7.169447] [c0000008b3683560] [c00000000002c71c] oops_end+0x1ac/0x1b0
[    7.169455] [c0000008b36835e0] [c0000000000868e0] bad_page_fault+0x190/0x1e0
[    7.169464] [c0000008b3683660] [c00000000000a8a4] handle_page_fault+0x2c/0x30
[    7.169475] --- interrupt: 300 at ___slab_alloc+0x1f4/0x760
[    7.169475]     LR = __slab_alloc+0x34/0x60
[    7.169484] [c0000008b3683960] [0000000000000000] 0x0 (unreliable)
[    7.169491] [c0000008b3683a40] [c0000008b3683a70] 0xc0000008b3683a70
[    7.169500] [c0000008b3683a70] [c0000000003d8b20] __kmalloc_node+0x110/0x490
[    7.169509] [c0000008b3683af0] [c0000000003456f8] kvmalloc_node+0x58/0x110
[    7.169516] [c0000008b3683b30] [c000000000400f78] mem_cgroup_css_online+0x108/0x270
[    7.169525] [c0000008b3683b90] [c000000000236ed8] online_css+0x48/0xd0
[    7.169533] [c0000008b3683bc0] [c00000000023ffac] cgroup_apply_control_enable+0x2ec/0x4d0
[    7.169542] [c0000008b3683ca0] [c0000000002437c8] cgroup_mkdir+0x228/0x5f0
[    7.169550] [c0000008b3683d10] [c000000000521780] kernfs_iop_mkdir+0x90/0xf0
[    7.169559] [c0000008b3683d50] [c00000000043f670] vfs_mkdir+0x110/0x230
[    7.169567] [c0000008b3683da0] [c000000000443150] do_mkdirat+0xb0/0x1a0
[    7.169575] [c0000008b3683e20] [c00000000000b278] system_call+0x5c/0x68
[    7.169581] Instruction dump:
[    7.169586] 4e800020 60000000 60000000 60000000 7c0802a6 f8010090 4badb5e1 60000000 
[    7.169597] 813f0000 7d231b78 2f830000 409e0034 <0fe00000> e8010090 7c0803a6 4bfffeac 
[    7.169608] ---[ end trace 36d65cb66091a5b7 ]---
[    7.169615] Rebooting in 10 seconds..

--Apple-Mail=_84315D49-E70C-46FA-A7DE-364B0CA38ACB--

