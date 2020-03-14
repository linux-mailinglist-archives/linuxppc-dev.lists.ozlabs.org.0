Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4C318551E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Mar 2020 09:11:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48fZzJ1q9YzDqYj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Mar 2020 19:11:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48fZxV2sxYzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Mar 2020 19:10:21 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02E81i2K035487
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Mar 2020 04:10:18 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yru8qrf9s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Mar 2020 04:10:18 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Sat, 14 Mar 2020 08:10:16 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 14 Mar 2020 08:10:12 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02E8ABjo30933202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 14 Mar 2020 08:10:11 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7297E42041;
 Sat, 14 Mar 2020 08:10:11 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA7E142049;
 Sat, 14 Mar 2020 08:10:06 +0000 (GMT)
Received: from [9.85.72.41] (unknown [9.85.72.41])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 14 Mar 2020 08:10:06 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_4D8EC7C3-2942-4D63-9380-D3F40A3E8B3E"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9 
Date: Sat, 14 Mar 2020 13:40:05 +0530
In-Reply-To: <11e69587-8b64-6088-cb5c-d7d719842535@suse.cz>
To: Vlastimil Babka <vbabka@suse.cz>, Michael Ellerman <mpe@ellerman.id.au>
References: <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
 <20200227121214.GE3771@dhcp22.suse.cz>
 <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com>
 <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz>
 <20200227182650.GG3771@dhcp22.suse.cz> <20200310150114.GO8447@dhcp22.suse.cz>
 <87a74lix5p.fsf@mpe.ellerman.id.au>
 <F0FBAD4E-3257-4DFD-BFE2-4AD7D811CFB3@linux.vnet.ibm.com>
 <875zf8y1i1.fsf@mpe.ellerman.id.au>
 <20200313111246.GB25144@linux.vnet.ibm.com>
 <11e69587-8b64-6088-cb5c-d7d719842535@suse.cz>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20031408-4275-0000-0000-000003AC15D4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031408-4276-0000-0000-000038C138BA
Message-Id: <252C8513-60A6-43CC-B61D-E286909F88C3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-14_02:2020-03-12,
 2020-03-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=785
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003140041
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Pekka Enberg <penberg@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, David Rientjes <rientjes@google.com>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Kirill Tkhai <ktkhai@virtuozzo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_4D8EC7C3-2942-4D63-9380-D3F40A3E8B3E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 13-Mar-2020, at 5:05 PM, Vlastimil Babka <vbabka@suse.cz> wrote:
>=20
> On 3/13/20 12:12 PM, Srikar Dronamraju wrote:
>> * Michael Ellerman <mpe@ellerman.id.au> [2020-03-13 21:48:06]:
>>=20
>>> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
>>>>> The patch below might work. Sachin can you test this? I tried =
faking up
>>>>> a system with a memoryless node zero but couldn't get it to even =
start
>>>>> booting.
>>>>>=20
>>>> The patch did not help. The kernel crashed during
>>>> the boot with the same call trace.
>>>>=20
>>>> BUG_ON() introduced with the patch was not triggered.
>>>=20
>>> OK, that's weird.
>>>=20
>>> I eventually managed to get a memoryless node going in sim, and it
>>> appears to work there.
>>>=20
>>> eg in dmesg:
>>>=20
>>>  [    0.000000][    T0] numa:   NODE_DATA [mem =
0x2000fffa2f80-0x2000fffa7fff]
>>>  [    0.000000][    T0] numa:     NODE_DATA(0) on node 1
>>>  [    0.000000][    T0] numa:   NODE_DATA [mem =
0x2000fff9df00-0x2000fffa2f7f]
>>>  ...
>>>  [    0.000000][    T0] Early memory node ranges
>>>  [    0.000000][    T0]   node   1: [mem =
0x0000000000000000-0x00000000ffffffff]
>>>  [    0.000000][    T0]   node   1: [mem =
0x0000200000000000-0x00002000ffffffff]
>>>  [    0.000000][    T0] Could not find start_pfn for node 0
>>>  [    0.000000][    T0] Initmem setup node 0 [mem =
0x0000000000000000-0x0000000000000000]
>>>  [    0.000000][    T0] On node 0 totalpages: 0
>>>  [    0.000000][    T0] Initmem setup node 1 [mem =
0x0000000000000000-0x00002000ffffffff]
>>>  [    0.000000][    T0] On node 1 totalpages: 131072
>>>=20
>>>  # dmesg | grep set_numa
>>>  [    0.000000][    T0] set_numa_mem: mem node for 0 =3D 1
>>>  [    0.005654][    T0] set_numa_mem: mem node for 1 =3D 1
>>>=20
>>> So is the problem more than just node zero having no memory?
>>>=20

I tried with just the patch Michael suggested on top of March 13 next =
tree.
I still see the same failure. Here is a snippet from the log

[    0.000000] numa:   NODE_DATA [mem 0x8bfedc900-0x8bfee3fff]
[    0.000000] numa:     NODE_DATA(0) on node 1
[    0.000000] numa:   NODE_DATA [mem 0x8bfed5200-0x8bfedc8ff]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] link-stack-flush: software flush enabled.
[    0.000000] count-cache-flush: software flush disabled.
[    0.000000] stf-barrier: eieio barrier available
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:0 block =
size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:2 block =
size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:10 block =
size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:2 psize:2 block =
size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:2 psize:10 block =
size:8
[    0.000000] PPC64 nvram contains 15360 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x00000008bfffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   1: [mem 0x0000000000000000-0x00000008bfffffff]
[    0.000000] Could not find start_pfn for node 0
[    0.000000] Initmem setup node 0 [mem =
0x0000000000000000-0x0000000000000000]
[    0.000000] Initmem setup node 1 [mem =
0x0000000000000000-0x00000008bfffffff]
[    0.000000] percpu: Embedded 11 pages/cpu s624024 r0 d96872 u1048576
[    0.000000] Built 2 zonelists, mobility grouping on.  Total pages: =
572880

Have attached the complete boot log.

Thanks
-Sachin


--Apple-Mail=_4D8EC7C3-2942-4D63-9380-D3F40A3E8B3E
Content-Disposition: attachment;
	filename=kernel-boot.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="kernel-boot.log"
Content-Transfer-Encoding: 7bit

[ 1076.006474] kexec_core: Starting new kernel
[ 1076.026510] kexec: waiting for cpu 2 (physical 2) to enter 1 state
[ 1076.026522] kexec: waiting for cpu 27 (physical 27) to enter 1 state
[ 1076.026531] kexec: waiting for cpu 1 (physical 1) to enter 2 state
[ 1076.026580] kexec: waiting for cpu 2 (physical 2) to enter 2 state
[ 1076.026594] kexec: waiting for cpu 3 (physical 3) to enter 2 state
[ 1076.026602] kexec: waiting for cpu 4 (physical 4) to enter 2 state
[ 1076.026609] kexec: waiting for cpu 6 (physical 6) to enter 2 state
[ 1076.026617] kexec: waiting for cpu 11 (physical 11) to enter 2 state
[ 1076.026625] kexec: waiting for cpu 12 (physical 12) to enter 2 state
[ 1076.026632] kexec: waiting for cpu 13 (physical 13) to enter 2 state
[ 1076.190318] kexec: Starting switchover sequence.
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
[    0.000000] Linux version 5.6.0-rc5-next-20200313-autotest+ (root@ltc-zzci-2.aus.stglabs.ibm.com) (gcc version 8.3.1 20190507 (Red Hat 8.3.1-4) (GCC)) #2 SMP Sat Mar 14 02:57:33 CDT 2020
[    0.000000] Found initrd at 0xc000000003350000:0xc000000004d9bd2d
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
[    0.000000] Memory: 36388416K/36700160K available (11840K kernel code, 1728K rwdata, 3712K rodata, 4992K init, 2847K bss, 311744K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=32, Nodes=32
[    0.000000] ftrace: allocating 29850 entries in 11 pages
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
[    0.000172] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000299] Console: colour dummy device 80x25
[    0.000349] printk: console [hvc0] enabled
[    0.000349] printk: console [hvc0] enabled
[    0.000395] printk: bootconsole [udbg0] disabled
[    0.000395] printk: bootconsole [udbg0] disabled
[    0.000472] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.000486] pid_max: default: 32768 minimum: 301
[    0.000645] Mount-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.000716] Mountpoint-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.001517] EEH: pSeries platform initialized
[    0.001525] POWER9 performance monitor hardware support registered
[    0.001558] rcu: Hierarchical SRCU implementation.
[    0.002269] smp: Bringing up secondary CPUs ...
[    0.011609] smp: Brought up 2 nodes, 32 CPUs
[    0.011617] numa: Node 0 CPUs:
[    0.011620] numa: Node 1 CPUs: 0-31
[    0.011624] Using small cores at SMT level
[    0.011627] Using shared cache scheduler topology
[    0.012586] devtmpfs: initialized
[    0.015708] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.015720] futex hash table entries: 8192 (order: 4, 1048576 bytes, linear)
[    0.015945] thermal_sys: Registered thermal governor 'fair_share'
[    0.015946] thermal_sys: Registered thermal governor 'step_wise'
[    0.016053] NET: Registered protocol family 16
[    0.016196] audit: initializing netlink subsys (disabled)
[    0.016247] audit: type=2000 audit(1584172954.010:1): state=initialized audit_enabled=0 res=1
[    0.016358] cpuidle: using governor menu
[    0.016532] pstore: Registered nvram as persistent store backend
[    0.021111] PCI: Probing PCI hardware
[    0.021118] EEH: No capable adapters found: recovery disabled.
[    0.021183] pseries-rng: Registering arch random hook.
[    0.022869] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
[    0.022876] HugeTLB registered 16.0 GiB page size, pre-allocated 0 pages
[    0.263654] random: fast init done
[    0.264788] iommu: Default domain type: Translated 
[    0.264827] vgaarb: loaded
[    0.264909] SCSI subsystem initialized
[    0.264939] usbcore: registered new interface driver usbfs
[    0.264949] usbcore: registered new interface driver hub
[    0.265029] usbcore: registered new device driver usb
[    0.265148] EDAC MC: Ver: 3.0.0
[    0.265428] clocksource: Switched to clocksource timebase
[    0.276297] VFS: Disk quotas dquot_6.6.0
[    0.276323] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
[    0.277822] NET: Registered protocol family 2
[    0.277997] tcp_listen_portaddr_hash hash table entries: 32768 (order: 3, 524288 bytes, linear)
[    0.278051] TCP established hash table entries: 524288 (order: 6, 4194304 bytes, linear)
[    0.278910] TCP bind hash table entries: 65536 (order: 4, 1048576 bytes, linear)
[    0.279002] TCP: Hash tables configured (established 524288 bind 65536)
[    0.279041] UDP hash table entries: 32768 (order: 4, 1048576 bytes, linear)
[    0.279142] UDP-Lite hash table entries: 32768 (order: 4, 1048576 bytes, linear)
[    0.279300] NET: Registered protocol family 1
[    0.279309] PCI: CLS 0 bytes, default 128
[    0.279345] Trying to unpack rootfs image as initramfs...
[    0.691840] Freeing initrd memory: 26880K
[    0.694449] IOMMU table initialized, virtual merging enabled
[    0.715112] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs
[    0.716123] workingset: timestamp_bits=38 max_order=20 bucket_order=0
[    0.717188] zbud: loaded
[    0.725830] NET: Registered protocol family 38
[    0.725837] Key type asymmetric registered
[    0.725841] Asymmetric key parser 'x509' registered
[    0.725851] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
[    0.725934] io scheduler mq-deadline registered
[    0.725939] io scheduler kyber registered
[    0.726367] atomic64_test: passed
[    0.726400] PowerPC PowerNV PCI Hotplug Driver version: 0.1
[    0.726708] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.726934] Non-volatile memory driver v1.3
[    0.726961] Linux agpgart interface v0.103
[    6.005618] tpm_ibmvtpm 30000003: CRQ initialization completed
[    6.005625] tpm_ibmvtpm 30000003: ibmvtpm device is not ready
[    6.005633] tpm_ibmvtpm 30000003: ibmvtpm device is not ready
[    6.005859] rdac: device handler registered
[    6.005900] hp_sw: device handler registered
[    6.005904] emc: device handler registered
[    6.005969] alua: device handler registered
[    6.006050] libphy: Fixed MDIO Bus: probed
[    6.006087] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    6.006097] ehci-pci: EHCI PCI platform driver
[    6.006105] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    6.006114] ohci-pci: OHCI PCI platform driver
[    6.006122] uhci_hcd: USB Universal Host Controller Interface driver
[    6.006151] usbcore: registered new interface driver usbserial_generic
[    6.006159] usbserial: USB Serial support registered for generic
[    6.006211] mousedev: PS/2 mouse device common for all mice
[    6.006305] rtc-generic rtc-generic: registered as rtc0
[    6.006636] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_size new:65536 old:0
[    6.006646] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_sg new:510 old:0
[    6.006652] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sg_len new:4080 old:0
[    6.006699] alg: No test for 842 (842-nx)
[    6.007796] hid: raw HID events driver (C) Jiri Kosina
[    6.007883] usbcore: registered new interface driver usbhid
[    6.007886] usbhid: USB HID core driver
[    6.007932] drop_monitor: Initializing network drop monitor service
[    6.008011] Initializing XFRM netlink socket
[    6.008150] NET: Registered protocol family 10
[    6.008417] Segment Routing with IPv6
[    6.008434] NET: Registered protocol family 17
[    6.008976] registered taskstats version 1
[    6.009008] zswap: loaded using pool lzo/zbud
[    6.009141] pstore: Using crash dump compression: deflate
[    6.013169] Key type big_key registered
[    6.013328] rtc-generic rtc-generic: setting system clock to 2020-03-14T08:02:40 UTC (1584172960)
[    6.014708] Freeing unused kernel memory: 4992K
[    6.014713] Kernel memory protection not selected by kernel config.
[    6.014718] Run /init as init process
[    6.023848] systemd[1]: systemd 239 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=legacy)
[    6.024035] systemd[1]: Detected architecture ppc64-le.
[    6.024041] systemd[1]: Running in initial RAM disk.

Welcome to Red Hat Enterprise Linux 8.1 Beta (Ootpa) dracut-049-26.git20190806.el8 (Initramfs)!

[    6.075728] systemd[1]: Set hostname to <ltc-zzci-2.aus.stglabs.ibm.com>.
[    6.128043] random: systemd: uninitialized urandom read (16 bytes read)
[    6.128067] systemd[1]: Reached target Timers.
[  OK  ] Reached target Timers.
[    6.128205] random: systemd: uninitialized urandom read (16 bytes read)
[    6.128261] systemd[1]: Listening on udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[    6.128324] random: systemd: uninitialized urandom read (16 bytes read)
[    6.128391] systemd[1]: Listening on udev Control Socket.
[  OK  ] Listening on udev Control Socket.
[    6.128524] systemd[1]: Listening on Journal Socket.
[  OK  ] Listening on Journal Socket.
[    6.129551] BUG: Kernel NULL pointer dereference on read at 0x000073b0
[    6.129557] Faulting instruction address: 0xc0000000003d5d44
[    6.129562] Oops: Kernel access of bad area, sig: 11 [#1]
[    6.129567] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[    6.129571] Modules linked in:
[    6.129576] CPU: 10 PID: 1 Comm: systemd Not tainted 5.6.0-rc5-next-20200313-autotest+ #2
[    6.129581] NIP:  c0000000003d5d44 LR: c0000000003d62e4 CTR: 0000000000000000
[    6.129587] REGS: c0000008b37836d0 TRAP: 0300   Not tainted  (5.6.0-rc5-next-20200313-autotest+)
[    6.129593] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24004844  XER: 00000000
[    6.129600] CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: 40000000 IRQMASK: 1 
[    6.129600] GPR00: c0000000003d62e4 c0000008b3783960 c00000000155e300 c0000008b301f500 
[    6.129600] GPR04: 0000000000000dc0 0000000000000002 c000000000343938 c0000008baa98620 
[    6.129600] GPR08: 00000008b99f0000 0000000000000001 0000000000000000 0000000000000000 
[    6.129600] GPR12: 0000000024004844 c00000001eca1a00 0000000000000000 0000000000000000 
[    6.129600] GPR16: c0000008a3f62048 c000000001595818 c000000001750ca8 0000000000000002 
[    6.129600] GPR20: c000000001750cb8 c000000001624478 0000000fffffffe0 5deadbeef0000122 
[    6.129600] GPR24: 0000000000000001 0000000000000dc0 0000000000000002 c000000000343938 
[    6.129600] GPR28: c0000008b301f500 c0000008baa98620 0000000000000000 c00c00000000d100 
[    6.129647] NIP [c0000000003d5d44] ___slab_alloc+0x1f4/0x760
[    6.129652] LR [c0000000003d62e4] __slab_alloc+0x34/0x60
[    6.129656] Call Trace:
[    6.129659] [c0000008b3783960] [c0000000003d5e84] ___slab_alloc+0x334/0x760 (unreliable)
[    6.129666] [c0000008b3783a40] [c0000000003d62e4] __slab_alloc+0x34/0x60
[    6.129671] [c0000008b3783a70] [c0000000003d76f0] __kmalloc_node+0x110/0x490
[    6.129677] [c0000008b3783af0] [c000000000343938] kvmalloc_node+0x58/0x110
[    6.129683] [c0000008b3783b30] [c0000000003ffb84] mem_cgroup_css_online+0x104/0x270
[    6.129689] [c0000008b3783b90] [c000000000234d88] online_css+0x48/0xd0
[    6.129695] [c0000008b3783bc0] [c00000000023de5c] cgroup_apply_control_enable+0x2ec/0x4d0
[    6.129701] [c0000008b3783ca0] [c000000000241678] cgroup_mkdir+0x228/0x5f0
[    6.129706] [c0000008b3783d10] [c0000000005201a0] kernfs_iop_mkdir+0x90/0xf0
[    6.129713] [c0000008b3783d50] [c00000000043e240] vfs_mkdir+0x110/0x230
[    6.129718] [c0000008b3783da0] [c000000000441d20] do_mkdirat+0xb0/0x1a0
[    6.129724] [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
[    6.129728] Instruction dump:
[    6.129731] 7c421378 e95f0000 714a0001 4082fff0 4bffff64 60000000 60000000 faa10088 
[    6.129738] 3ea2000c 3ab56178 7b4a1f24 7d55502a <e94a73b0> 2faa0000 409e0394 3d02002a 
[    6.129746] ---[ end trace fb1a7e13ad04058f ]---
[    6.131789] 
[    7.131801] Kernel panic - not syncing: Fatal exception
[    7.138925] ------------[ cut here ]------------
[    7.138935] WARNING: CPU: 10 PID: 1 at drivers/tty/vt/vt.c:4266 do_unblank_screen+0x190/0x250
[    7.138943] Modules linked in:
[    7.138949] CPU: 10 PID: 1 Comm: systemd Tainted: G      D           5.6.0-rc5-next-20200313-autotest+ #2
[    7.138958] NIP:  c0000000006ec1c0 LR: c0000000006ec1ac CTR: c000000000b7d410
[    7.138966] REGS: c0000008b37831b0 TRAP: 0700   Tainted: G      D            (5.6.0-rc5-next-20200313-autotest+)
[    7.138975] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28002242  XER: 2004000c
[    7.138986] CFAR: c0000000001c67d8 IRQMASK: 3 
[    7.138986] GPR00: c0000000006ec1ac c0000008b3783440 c00000000155e300 0000000000000000 
[    7.138986] GPR04: 0000000000000003 c0000008aea8a00e 0000000000001dd7 c0000008b3783380 
[    7.138986] GPR08: c0000000014234e0 0000000000000000 0000000000000000 c0000008b37831ff 
[    7.138986] GPR12: 0000000028002448 c00000001eca1a00 0000000000000000 0000000000000000 
[    7.138986] GPR16: c0000008a3f62048 c000000001595818 c000000001750ca8 0000000000000002 
[    7.138986] GPR20: c000000001750cb8 c000000001624478 0000000fffffffe0 5deadbeef0000122 
[    7.138986] GPR24: 0000000000000001 0000000000000dc0 c00000000142c5b0 c000000000343938 
[    7.138986] GPR28: c000000001636f58 c000000001636f80 0000000000000000 c000000001745a88 
[    7.139053] NIP [c0000000006ec1c0] do_unblank_screen+0x190/0x250
[    7.139060] LR [c0000000006ec1ac] do_unblank_screen+0x17c/0x250
[    7.139067] Call Trace:
[    7.139071] [c0000008b3783440] [c0000000006ec1dc] do_unblank_screen+0x1ac/0x250 (unreliable)
[    7.139082] [c0000008b37834c0] [c00000000013caa4] panic+0x1e8/0x414
[    7.139091] [c0000008b3783560] [c00000000002a70c] oops_end+0x1ac/0x1b0
[    7.139099] [c0000008b37835e0] [c0000000000848a0] bad_page_fault+0x190/0x1e0
[    7.139108] [c0000008b3783660] [c00000000000a8a4] handle_page_fault+0x2c/0x30
[    7.139118] --- interrupt: 300 at ___slab_alloc+0x1f4/0x760
[    7.139118]     LR = __slab_alloc+0x34/0x60
[    7.139128] [c0000008b3783960] [c0000000003d5e84] ___slab_alloc+0x334/0x760 (unreliable)
[    7.139137] [c0000008b3783a40] [c0000000003d62e4] __slab_alloc+0x34/0x60
[    7.139145] [c0000008b3783a70] [c0000000003d76f0] __kmalloc_node+0x110/0x490
[    7.139153] [c0000008b3783af0] [c000000000343938] kvmalloc_node+0x58/0x110
[    7.139162] [c0000008b3783b30] [c0000000003ffb84] mem_cgroup_css_online+0x104/0x270
[    7.139171] [c0000008b3783b90] [c000000000234d88] online_css+0x48/0xd0
[    7.139178] [c0000008b3783bc0] [c00000000023de5c] cgroup_apply_control_enable+0x2ec/0x4d0
[    7.139187] [c0000008b3783ca0] [c000000000241678] cgroup_mkdir+0x228/0x5f0
[    7.139196] [c0000008b3783d10] [c0000000005201a0] kernfs_iop_mkdir+0x90/0xf0
[    7.139205] [c0000008b3783d50] [c00000000043e240] vfs_mkdir+0x110/0x230
[    7.139213] [c0000008b3783da0] [c000000000441d20] do_mkdirat+0xb0/0x1a0
[    7.139221] [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
[    7.139227] Instruction dump:
[    7.139232] 4e800020 60000000 60000000 60000000 7c0802a6 f8010090 4bada621 60000000 
[    7.139243] 813f0000 7d231b78 2f830000 409e0034 <0fe00000> e8010090 7c0803a6 4bfffeac 
[    7.139254] ---[ end trace fb1a7e13ad040590 ]---
[    7.139260] Rebooting in 10 seconds..

--Apple-Mail=_4D8EC7C3-2942-4D63-9380-D3F40A3E8B3E--

