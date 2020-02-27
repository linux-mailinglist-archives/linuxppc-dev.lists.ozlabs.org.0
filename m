Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A32581722C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 17:05:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SyDq4ZYzzDr48
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 03:05:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sy841WN3zDr2w
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 03:01:06 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01RFxeEG113334
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 11:01:04 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydcnuxff6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 11:01:00 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Thu, 27 Feb 2020 16:00:57 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Feb 2020 16:00:54 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01RG0rgX58196082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 16:00:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E3CB4C040;
 Thu, 27 Feb 2020 16:00:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF8AA4C04A;
 Thu, 27 Feb 2020 16:00:50 +0000 (GMT)
Received: from [9.85.70.83] (unknown [9.85.70.83])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 16:00:50 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_FECDA6C3-C982-44C3-95E5-7002F73B8D7E"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9 
Date: Thu, 27 Feb 2020 21:30:49 +0530
In-Reply-To: <20200227121214.GE3771@dhcp22.suse.cz>
To: Michal Hocko <mhocko@kernel.org>
References: <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
 <20200227121214.GE3771@dhcp22.suse.cz>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20022716-0028-0000-0000-000003DE9318
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022716-0029-0000-0000-000024A3B2F7
Message-Id: <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_05:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=715 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002270124
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
Cc: Pekka Enberg <penberg@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 David Rientjes <rientjes@google.com>, Christopher Lameter <cl@linux.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_FECDA6C3-C982-44C3-95E5-7002F73B8D7E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 27-Feb-2020, at 5:42 PM, Michal Hocko <mhocko@kernel.org> wrote:
>=20
> A very good hint indeed. I would do this
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index eb2fe6edd73c..d9f1b6737e4d 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -137,6 +137,8 @@ static inline void set_numa_mem(int node)
> {
> 	this_cpu_write(_numa_mem_, node);
> 	_node_numa_mem_[numa_node_id()] =3D node;
> +	pr_info("%s %d -> %d\n", __FUNCTION__, numa_node_id(), node);
> +	dump_stack();
> }
> #endif
>=20
> Btw. it would be also helpful to get
> `faddr2line ___slab_alloc+0x334' from your kernel Sachin.

[linux-next]# ./scripts/faddr2line ./vmlinux ___slab_alloc+0x334=20
___slab_alloc+0x334/0x760:
new_slab_objects at mm/slub.c:2478
(inlined by) ___slab_alloc at mm/slub.c:2628
[linux-next]#=20

I have also attached boot log with a kernel that include about change.
I see the following o/p during boot:

[    0.005269] set_numa_mem 1 -> 1
[    0.005270] CPU: 12 PID: 0 Comm: swapper/12 Not tainted =
5.6.0-rc3-next-20200227-autotest+ #6
[    0.005271] Call Trace:
[    0.005272] [c0000008b37dfe80] [c000000000b5d948] =
dump_stack+0xbc/0x104 (unreliable)
[    0.005274] [c0000008b37dfec0] [c000000000059320] =
start_secondary+0x600/0x6e0
[    0.005277] [c0000008b37dff90] [c00000000000ac54] =
start_secondary_prolog+0x10/0x14

Thanks
-Sachin


--Apple-Mail=_FECDA6C3-C982-44C3-95E5-7002F73B8D7E
Content-Disposition: attachment;
	filename=boot.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="boot.log"
Content-Transfer-Encoding: 7bit

[ 2138.923585] kexec_core: Starting new kernel
[ 2138.943679] kexec: waiting for cpu 1 (physical 1) to enter 1 state
[ 2138.943690] kexec: waiting for cpu 9 (physical 9) to enter 1 state
[ 2138.943698] kexec: waiting for cpu 16 (physical 16) to enter 1 state
[ 2138.943707] kexec: waiting for cpu 1 (physical 1) to enter 2 state
[ 2138.943801] kexec: waiting for cpu 3 (physical 3) to enter 2 state
[ 2139.107518] kexec: Starting switchover sequence.
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
[    0.000000] Linux version 5.6.0-rc3-next-20200227-autotest+ (root@ltc-zzci-2.aus.stglabs.ibm.com) (gcc version 8.3.1 20190507 (Red Hat 8.3.1-4) (GCC)) #6 SMP Thu Feb 27 09:47:55 CST 2020
[    0.000000] Found initrd at 0xc000000003350000:0xc000000004d9841e
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
[    0.000000] Memory: 36388416K/36700160K available (11840K kernel code, 1728K rwdata, 3712K rodata, 4992K init, 2843K bss, 311744K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=32, Nodes=32
[    0.000000] ftrace: allocating 29836 entries in 11 pages
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
[    0.000064] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000171] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000296] Console: colour dummy device 80x25
[    0.000346] printk: console [hvc0] enabled
[    0.000346] printk: console [hvc0] enabled
[    0.000392] printk: bootconsole [udbg0] disabled
[    0.000392] printk: bootconsole [udbg0] disabled
[    0.000469] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.000482] pid_max: default: 32768 minimum: 301
[    0.000635] Mount-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.000704] Mountpoint-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.001533] EEH: pSeries platform initialized
[    0.001541] POWER9 performance monitor hardware support registered
[    0.001574] rcu: Hierarchical SRCU implementation.
[    0.002256] smp: Bringing up secondary CPUs ...
[    0.002455] set_numa_mem 1 -> 1
[    0.002458] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.002459] Call Trace:
[    0.002463] [c0000008b37b3e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.002466] [c0000008b37b3ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.002469] [c0000008b37b3f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.002758] set_numa_mem 1 -> 1
[    0.002761] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.002762] Call Trace:
[    0.002765] [c0000008b37b7e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.002768] [c0000008b37b7ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.002771] [c0000008b37b7f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.003040] set_numa_mem 1 -> 1
[    0.003042] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.003043] Call Trace:
[    0.003045] [c0000008b37bbe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.003047] [c0000008b37bbec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.003050] [c0000008b37bbf90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.003325] set_numa_mem 1 -> 1
[    0.003327] CPU: 4 PID: 0 Comm: swapper/4 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.003328] Call Trace:
[    0.003330] [c0000008b37bfe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.003333] [c0000008b37bfec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.003336] [c0000008b37bff90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.003576] set_numa_mem 1 -> 1
[    0.003578] CPU: 5 PID: 0 Comm: swapper/5 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.003578] Call Trace:
[    0.003580] [c0000008b37c3e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.003582] [c0000008b37c3ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.003584] [c0000008b37c3f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.003826] set_numa_mem 1 -> 1
[    0.003827] CPU: 6 PID: 0 Comm: swapper/6 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.003828] Call Trace:
[    0.003830] [c0000008b37c7e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.003832] [c0000008b37c7ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.003835] [c0000008b37c7f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.004052] set_numa_mem 1 -> 1
[    0.004053] CPU: 7 PID: 0 Comm: swapper/7 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.004053] Call Trace:
[    0.004055] [c0000008b37cbe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.004057] [c0000008b37cbec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.004058] [c0000008b37cbf90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.004298] set_numa_mem 1 -> 1
[    0.004302] CPU: 8 PID: 0 Comm: swapper/8 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.004303] Call Trace:
[    0.004306] [c0000008b37cfe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.004310] [c0000008b37cfec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.004312] [c0000008b37cff90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.004548] set_numa_mem 1 -> 1
[    0.004550] CPU: 9 PID: 0 Comm: swapper/9 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.004551] Call Trace:
[    0.004553] [c0000008b37d3e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.004556] [c0000008b37d3ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.004559] [c0000008b37d3f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.004791] set_numa_mem 1 -> 1
[    0.004794] CPU: 10 PID: 0 Comm: swapper/10 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.004794] Call Trace:
[    0.004796] [c0000008b37d7e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.004799] [c0000008b37d7ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.004801] [c0000008b37d7f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.005037] set_numa_mem 1 -> 1
[    0.005040] CPU: 11 PID: 0 Comm: swapper/11 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.005040] Call Trace:
[    0.005042] [c0000008b37dbe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.005045] [c0000008b37dbec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.005047] [c0000008b37dbf90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.005269] set_numa_mem 1 -> 1
[    0.005270] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.005271] Call Trace:
[    0.005272] [c0000008b37dfe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.005274] [c0000008b37dfec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.005277] [c0000008b37dff90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.005503] set_numa_mem 1 -> 1
[    0.005504] CPU: 13 PID: 0 Comm: swapper/13 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.005505] Call Trace:
[    0.005506] [c0000008b37e3e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.005508] [c0000008b37e3ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.005510] [c0000008b37e3f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.005732] set_numa_mem 1 -> 1
[    0.005733] CPU: 14 PID: 0 Comm: swapper/14 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.005733] Call Trace:
[    0.005735] [c0000008b37e7e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.005736] [c0000008b37e7ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.005738] [c0000008b37e7f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.005959] set_numa_mem 1 -> 1
[    0.005961] CPU: 15 PID: 0 Comm: swapper/15 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.005961] Call Trace:
[    0.005962] [c0000008b37ebe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.005964] [c0000008b37ebec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.005966] [c0000008b37ebf90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.006222] set_numa_mem 1 -> 1
[    0.006225] CPU: 16 PID: 0 Comm: swapper/16 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.006226] Call Trace:
[    0.006230] [c0000008b37efe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.006233] [c0000008b37efec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.006236] [c0000008b37eff90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.006468] set_numa_mem 1 -> 1
[    0.006470] CPU: 17 PID: 0 Comm: swapper/17 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.006471] Call Trace:
[    0.006473] [c0000008b37f3e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.006476] [c0000008b37f3ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.006479] [c0000008b37f3f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.006713] set_numa_mem 1 -> 1
[    0.006715] CPU: 18 PID: 0 Comm: swapper/18 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.006715] Call Trace:
[    0.006717] [c0000008b37f7e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.006720] [c0000008b37f7ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.006722] [c0000008b37f7f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.006957] set_numa_mem 1 -> 1
[    0.006959] CPU: 19 PID: 0 Comm: swapper/19 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.006960] Call Trace:
[    0.006962] [c0000008b37fbe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.006964] [c0000008b37fbec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.006967] [c0000008b37fbf90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.007181] set_numa_mem 1 -> 1
[    0.007183] CPU: 20 PID: 0 Comm: swapper/20 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.007183] Call Trace:
[    0.007185] [c0000008b37ffe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.007186] [c0000008b37ffec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.007188] [c0000008b37fff90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.007416] set_numa_mem 1 -> 1
[    0.007418] CPU: 21 PID: 0 Comm: swapper/21 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.007419] Call Trace:
[    0.007420] [c0000008b3883e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.007422] [c0000008b3883ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.007424] [c0000008b3883f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.007643] set_numa_mem 1 -> 1
[    0.007644] CPU: 22 PID: 0 Comm: swapper/22 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.007644] Call Trace:
[    0.007646] [c0000008b3887e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.007647] [c0000008b3887ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.007649] [c0000008b3887f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.007874] set_numa_mem 1 -> 1
[    0.007875] CPU: 23 PID: 0 Comm: swapper/23 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.007875] Call Trace:
[    0.007877] [c0000008b388be80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.007878] [c0000008b388bec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.007880] [c0000008b388bf90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.008159] set_numa_mem 1 -> 1
[    0.008163] CPU: 24 PID: 0 Comm: swapper/24 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.008164] Call Trace:
[    0.008168] [c0000008b388fe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.008171] [c0000008b388fec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.008174] [c0000008b388ff90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.008428] set_numa_mem 1 -> 1
[    0.008431] CPU: 25 PID: 0 Comm: swapper/25 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.008431] Call Trace:
[    0.008434] [c0000008b3893e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.008437] [c0000008b3893ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.008439] [c0000008b3893f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.008691] set_numa_mem 1 -> 1
[    0.008693] CPU: 26 PID: 0 Comm: swapper/26 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.008694] Call Trace:
[    0.008696] [c0000008b3897e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.008698] [c0000008b3897ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.008701] [c0000008b3897f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.008959] set_numa_mem 1 -> 1
[    0.008961] CPU: 27 PID: 0 Comm: swapper/27 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.008961] Call Trace:
[    0.008963] [c0000008b389be80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.008966] [c0000008b389bec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.008968] [c0000008b389bf90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.009199] set_numa_mem 1 -> 1
[    0.009200] CPU: 28 PID: 0 Comm: swapper/28 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.009201] Call Trace:
[    0.009202] [c0000008b389fe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.009204] [c0000008b389fec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.009206] [c0000008b389ff90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.009437] set_numa_mem 1 -> 1
[    0.009439] CPU: 29 PID: 0 Comm: swapper/29 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.009439] Call Trace:
[    0.009441] [c0000008b38a3e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.009443] [c0000008b38a3ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.009445] [c0000008b38a3f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.009663] set_numa_mem 1 -> 1
[    0.009664] CPU: 30 PID: 0 Comm: swapper/30 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.009664] Call Trace:
[    0.009666] [c0000008b38a7e80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.009667] [c0000008b38a7ec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.009669] [c0000008b38a7f90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.009896] set_numa_mem 1 -> 1
[    0.009897] CPU: 31 PID: 0 Comm: swapper/31 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    0.009897] Call Trace:
[    0.009899] [c0000008b38abe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
[    0.009900] [c0000008b38abec0] [c000000000059320] start_secondary+0x600/0x6e0
[    0.009902] [c0000008b38abf90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
[    0.009963] smp: Brought up 2 nodes, 32 CPUs
[    0.010611] numa: Node 0 CPUs:
[    0.010614] numa: Node 1 CPUs: 0-31
[    0.010618] Using small cores at SMT level
[    0.010621] Using shared cache scheduler topology
[    0.011573] devtmpfs: initialized
[    0.014714] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.014726] futex hash table entries: 8192 (order: 4, 1048576 bytes, linear)
[    0.014954] thermal_sys: Registered thermal governor 'fair_share'
[    0.014955] thermal_sys: Registered thermal governor 'step_wise'
[    0.015060] NET: Registered protocol family 16
[    0.015288] audit: initializing netlink subsys (disabled)
[    0.015392] audit: type=2000 audit(1582818719.010:1): state=initialized audit_enabled=0 res=1
[    0.015487] cpuidle: using governor menu
[    0.015662] pstore: Registered nvram as persistent store backend
[    0.020310] PCI: Probing PCI hardware
[    0.020316] EEH: No capable adapters found: recovery disabled.
[    0.020380] pseries-rng: Registering arch random hook.
[    0.022058] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
[    0.022064] HugeTLB registered 16.0 GiB page size, pre-allocated 0 pages
[    0.263351] random: fast init done
[    0.264500] iommu: Default domain type: Translated 
[    0.264544] vgaarb: loaded
[    0.264627] SCSI subsystem initialized
[    0.264658] usbcore: registered new interface driver usbfs
[    0.264668] usbcore: registered new interface driver hub
[    0.264750] usbcore: registered new device driver usb
[    0.264878] EDAC MC: Ver: 3.0.0
[    0.265160] clocksource: Switched to clocksource timebase
[    0.276006] VFS: Disk quotas dquot_6.6.0
[    0.276031] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
[    0.277944] NET: Registered protocol family 2
[    0.278125] tcp_listen_portaddr_hash hash table entries: 32768 (order: 3, 524288 bytes, linear)
[    0.278180] TCP established hash table entries: 524288 (order: 6, 4194304 bytes, linear)
[    0.278999] TCP bind hash table entries: 65536 (order: 4, 1048576 bytes, linear)
[    0.279092] TCP: Hash tables configured (established 524288 bind 65536)
[    0.279130] UDP hash table entries: 32768 (order: 4, 1048576 bytes, linear)
[    0.279228] UDP-Lite hash table entries: 32768 (order: 4, 1048576 bytes, linear)
[    0.279390] NET: Registered protocol family 1
[    0.279399] PCI: CLS 0 bytes, default 128
[    0.279434] Trying to unpack rootfs image as initramfs...
[    0.689225] Freeing initrd memory: 26880K
[    0.691842] IOMMU table initialized, virtual merging enabled
[    0.711971] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs
[    0.712990] workingset: timestamp_bits=38 max_order=20 bucket_order=0
[    0.714056] zbud: loaded
[    0.723141] NET: Registered protocol family 38
[    0.723148] Key type asymmetric registered
[    0.723151] Asymmetric key parser 'x509' registered
[    0.723161] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
[    0.723286] io scheduler mq-deadline registered
[    0.723291] io scheduler kyber registered
[    0.723707] atomic64_test: passed
[    0.723740] PowerPC PowerNV PCI Hotplug Driver version: 0.1
[    0.724041] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.724269] Non-volatile memory driver v1.3
[    0.724296] Linux agpgart interface v0.103
[    8.635272] tpm_ibmvtpm 30000003: CRQ initialization completed
[    8.635283] tpm_ibmvtpm 30000003: ibmvtpm device is not ready
[    8.635293] tpm_ibmvtpm 30000003: ibmvtpm device is not ready
[    8.635629] rdac: device handler registered
[    8.635688] hp_sw: device handler registered
[    8.635695] emc: device handler registered
[    8.635805] alua: device handler registered
[    8.635922] libphy: Fixed MDIO Bus: probed
[    8.635977] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    8.635992] ehci-pci: EHCI PCI platform driver
[    8.636004] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    8.636017] ohci-pci: OHCI PCI platform driver
[    8.636029] uhci_hcd: USB Universal Host Controller Interface driver
[    8.636074] usbcore: registered new interface driver usbserial_generic
[    8.636085] usbserial: USB Serial support registered for generic
[    8.636164] mousedev: PS/2 mouse device common for all mice
[    8.636326] rtc-generic rtc-generic: registered as rtc0
[    8.636829] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_size new:65536 old:0
[    8.636841] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_sg new:510 old:0
[    8.636849] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sg_len new:4080 old:0
[    8.636960] alg: No test for 842 (842-nx)
[    8.638514] hid: raw HID events driver (C) Jiri Kosina
[    8.638659] usbcore: registered new interface driver usbhid
[    8.638665] usbhid: USB HID core driver
[    8.638744] drop_monitor: Initializing network drop monitor service
[    8.638866] Initializing XFRM netlink socket
[    8.639094] NET: Registered protocol family 10
[    8.639548] Segment Routing with IPv6
[    8.639582] NET: Registered protocol family 17
[    8.640636] registered taskstats version 1
[    8.640692] zswap: loaded using pool lzo/zbud
[    8.640876] pstore: Using crash dump compression: deflate
[    8.645167] Key type big_key registered
[    8.645364] rtc-generic rtc-generic: setting system clock to 2020-02-27T15:52:08 UTC (1582818728)
[    8.646725] Freeing unused kernel memory: 4992K
[    8.646730] Kernel memory protection not selected by kernel config.
[    8.646735] Run /init as init process
[    8.655923] systemd[1]: systemd 239 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=legacy)
[    8.656113] systemd[1]: Detected architecture ppc64-le.
[    8.656119] systemd[1]: Running in initial RAM disk.

Welcome to Red Hat Enterprise Linux 8.1 Beta (Ootpa) dracut-049-26.git20190806.el8 (Initramfs)!

[    8.695464] systemd[1]: Set hostname to <ltc-zzci-2.aus.stglabs.ibm.com>.
[    8.748426] random: systemd: uninitialized urandom read (16 bytes read)
[    8.748448] systemd[1]: Reached target Swap.
[  OK  ] Reached target Swap.
[    8.748591] random: systemd: uninitialized urandom read (16 bytes read)
[    8.748665] systemd[1]: Listening on udev Control Socket.
[  OK  ] Listening on udev Control Socket.
[    8.748730] random: systemd: uninitialized urandom read (16 bytes read)
[    8.748779] systemd[1]: Listening on udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[    8.748917] systemd[1]: Listening on Journal Socket.
[  OK  ] Listening on Journal Socket.
[    8.749045] systemd[1]: Reached target Timers.
[  OK  ] Reached target Timers.
[    8.750087] BUG: Kernel NULL pointer dereference on read at 0x000073b0
[    8.750093] Faulting instruction address: 0xc0000000003d6a24
[    8.750098] Oops: Kernel access of bad area, sig: 11 [#1]
[    8.750103] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[    8.750107] Modules linked in:
[    8.750112] CPU: 30 PID: 1 Comm: systemd Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
[    8.750117] NIP:  c0000000003d6a24 LR: c0000000003d6fc4 CTR: 0000000000000000
[    8.750123] REGS: c0000008b37836d0 TRAP: 0300   Not tainted  (5.6.0-rc3-next-20200227-autotest+)
[    8.750128] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24004844  XER: 00000000
[    8.750136] CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: 40000000 IRQMASK: 1 
[    8.750136] GPR00: c0000000003d6fc4 c0000008b3783960 c00000000155d700 c0000008b301f500 
[    8.750136] GPR04: 0000000000000dc0 0000000000000002 c000000000345198 c0000008bbe98620 
[    8.750136] GPR08: 00000008badf0000 0000000000000001 0000000000000000 0000000000000000 
[    8.750136] GPR12: 0000000024004844 c00000001ec42600 0000000000000000 0000000000000000 
[    8.750136] GPR16: c0000008a00a0048 c000000001595898 c000000001750c18 0000000000000002 
[    8.750136] GPR20: c000000001750c28 c000000001624470 0000000fffffffe0 5deadbeef0000122 
[    8.750136] GPR24: 0000000000000001 0000000000000dc0 0000000000000002 c000000000345198 
[    8.750136] GPR28: c0000008b301f500 c0000008bbe98620 0000000000000000 c00c000002280700 
[    8.750183] NIP [c0000000003d6a24] ___slab_alloc+0x1f4/0x760
[    8.750189] LR [c0000000003d6fc4] __slab_alloc+0x34/0x60
[    8.750192] Call Trace:
[    8.750195] [c0000008b3783960] [c0000000003d6b64] ___slab_alloc+0x334/0x760 (unreliable)
[    8.750202] [c0000008b3783a40] [c0000000003d6fc4] __slab_alloc+0x34/0x60
[    8.750207] [c0000008b3783a70] [c0000000003d83d0] __kmalloc_node+0x110/0x490
[    8.750214] [c0000008b3783af0] [c000000000345198] kvmalloc_node+0x58/0x110
[    8.750219] [c0000008b3783b30] [c0000000004002c8] mem_cgroup_css_online+0x108/0x270
[    8.750225] [c0000008b3783b90] [c000000000236898] online_css+0x48/0xd0
[    8.750231] [c0000008b3783bc0] [c00000000023f8dc] cgroup_apply_control_enable+0x2ec/0x4d0
[    8.750237] [c0000008b3783ca0] [c000000000243108] cgroup_mkdir+0x228/0x5f0
[    8.750243] [c0000008b3783d10] [c00000000051fd20] kernfs_iop_mkdir+0x90/0xf0
[    8.750249] [c0000008b3783d50] [c00000000043f250] vfs_mkdir+0x110/0x230
[    8.750254] [c0000008b3783da0] [c0000000004432e0] do_mkdirat+0xb0/0x1a0
[    8.750260] [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
[    8.750265] Instruction dump:
[    8.750268] 7c421378 e95f0000 714a0001 4082fff0 4bffff64 60000000 60000000 faa10088 
[    8.750275] 3ea2000c 3ab56d70 7b4a1f24 7d55502a <e94a73b0> 2faa0000 409e0394 3d02002a 
[    8.750283] ---[ end trace 8d3beed514c605ba ]---
[    8.753228] 
[    9.753239] Kernel panic - not syncing: Fatal exception
[    9.763887] ------------[ cut here ]------------
[    9.763898] WARNING: CPU: 30 PID: 1 at drivers/tty/vt/vt.c:4268 do_unblank_screen+0x190/0x250
[    9.763906] Modules linked in:
[    9.763913] CPU: 30 PID: 1 Comm: systemd Tainted: G      D           5.6.0-rc3-next-20200227-autotest+ #6
[    9.763922] NIP:  c0000000006eb670 LR: c0000000006eb65c CTR: c000000000b77c20
[    9.763930] REGS: c0000008b37831b0 TRAP: 0700   Tainted: G      D            (5.6.0-rc3-next-20200227-autotest+)
[    9.763939] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28002222  XER: 2004000c
[    9.763950] CFAR: c0000000001c7f78 IRQMASK: 3 
[    9.763950] GPR00: c0000000006eb65c c0000008b3783440 c00000000155d700 0000000000000000 
[    9.763950] GPR04: 0000000000000003 c000000005f7c00e 0000000000001dd7 c0000008b3783380 
[    9.763950] GPR08: c000000001423760 0000000000000000 0000000000000000 c0000008b37831ff 
[    9.763950] GPR12: 0000000028002428 c00000001ec42600 0000000000000000 0000000000000000 
[    9.763950] GPR16: c0000008a00a0048 c000000001595898 c000000001750c18 0000000000000002 
[    9.763950] GPR20: c000000001750c28 c000000001624470 0000000fffffffe0 5deadbeef0000122 
[    9.763950] GPR24: 0000000000000001 0000000000000dc0 c00000000142c740 c000000000345198 
[    9.763950] GPR28: c000000001636f58 c000000001636f80 0000000000000000 c000000001745a08 
[    9.764017] NIP [c0000000006eb670] do_unblank_screen+0x190/0x250
[    9.764024] LR [c0000000006eb65c] do_unblank_screen+0x17c/0x250
[    9.764030] Call Trace:
[    9.764035] [c0000008b3783440] [c0000000006eb68c] do_unblank_screen+0x1ac/0x250 (unreliable)
[    9.764046] [c0000008b37834c0] [c00000000013e788] panic+0x1e8/0x410
[    9.764054] [c0000008b3783560] [c00000000002c75c] oops_end+0x1ac/0x1b0
[    9.764062] [c0000008b37835e0] [c000000000086800] bad_page_fault+0x190/0x1e0
[    9.764072] [c0000008b3783660] [c00000000000a8a4] handle_page_fault+0x2c/0x30
[    9.764082] --- interrupt: 300 at ___slab_alloc+0x1f4/0x760
[    9.764082]     LR = __slab_alloc+0x34/0x60
[    9.764092] [c0000008b3783960] [c0000000003d6b64] ___slab_alloc+0x334/0x760 (unreliable)
[    9.764101] [c0000008b3783a40] [c0000000003d6fc4] __slab_alloc+0x34/0x60
[    9.764109] [c0000008b3783a70] [c0000000003d83d0] __kmalloc_node+0x110/0x490
[    9.764118] [c0000008b3783af0] [c000000000345198] kvmalloc_node+0x58/0x110
[    9.764126] [c0000008b3783b30] [c0000000004002c8] mem_cgroup_css_online+0x108/0x270
[    9.764135] [c0000008b3783b90] [c000000000236898] online_css+0x48/0xd0
[    9.764143] [c0000008b3783bc0] [c00000000023f8dc] cgroup_apply_control_enable+0x2ec/0x4d0
[    9.764152] [c0000008b3783ca0] [c000000000243108] cgroup_mkdir+0x228/0x5f0
[    9.764161] [c0000008b3783d10] [c00000000051fd20] kernfs_iop_mkdir+0x90/0xf0
[    9.764169] [c0000008b3783d50] [c00000000043f250] vfs_mkdir+0x110/0x230
[    9.764177] [c0000008b3783da0] [c0000000004432e0] do_mkdirat+0xb0/0x1a0
[    9.764185] [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
[    9.764191] Instruction dump:
[    9.764196] 4e800020 60000000 60000000 60000000 7c0802a6 f8010090 4badc911 60000000 
[    9.764208] 813f0000 7d231b78 2f830000 409e0034 <0fe00000> e8010090 7c0803a6 4bfffeac 
[    9.764219] ---[ end trace 8d3beed514c605bb ]---
[    9.764225] Rebooting in 10 seconds..


--Apple-Mail=_FECDA6C3-C982-44C3-95E5-7002F73B8D7E--

