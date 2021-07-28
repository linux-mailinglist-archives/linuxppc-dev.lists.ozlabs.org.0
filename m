Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF03D8956
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 10:01:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZR2P1qDcz30Gk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 18:01:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BbSUyoyt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BbSUyoyt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZR1s2Wbbz2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 18:01:20 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16S7YX4n070935; Wed, 28 Jul 2021 04:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 mime-version : subject : message-id : date : cc : to; s=pp1;
 bh=sX6t+hnPTD5Unujw885sURJ/bF39OsQqw5GxwxfhQMg=;
 b=BbSUyoytUrEnLydXcIiktgJURPfyYivf2cfzKN4TMKE7J4OXhUZnST3ed8eGRPK3j2Or
 izk9sitDwDkjn0vyHuJ35j7qSHOMG2P556Fu2D+kTmEgM68HyMy/5YAGJSmXdhPjE4uF
 CA85lTVHEGosPETMhmdgmuqCGP61E/cnpZJHq7u9DcHUp6Pnrgxi4Zsd1P2etibeBdG9
 9nIwvSZDfMUycAhuAkRT/KYifsoIl5xGQeRwbAPlGOYqXaFm1nLB1hlxYEcQN+Tn6ds0
 fjuoa55dlMNbRb0j6F4OULkRdlGXXyAxWJ+YbLnPVRYFNp4eA4xQjEbZhg4heOipjXkU 6Q== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a31ym2p2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 04:01:17 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16S7q8ib021327;
 Wed, 28 Jul 2021 08:01:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3a235xrkd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 08:01:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16S81Aso29294954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 08:01:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8726CAE05D;
 Wed, 28 Jul 2021 08:01:10 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 118A5AE079;
 Wed, 28 Jul 2021 08:01:09 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.64.77])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Jul 2021 08:01:08 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_DDBD3AF7-3EEF-4A31-B940-855A3A93F776"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: [powerpc][next-20210727] Boot failure - kernel BUG at
 arch/powerpc/kernel/interrupt.c:98!
Message-Id: <1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com>
Date: Wed, 28 Jul 2021 13:31:06 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1G2eFTIPNZmlB30pLYgCj-rOoPd-3pOY
X-Proofpoint-ORIG-GUID: 1G2eFTIPNZmlB30pLYgCj-rOoPd-3pOY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-28_05:2021-07-27,
 2021-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107280041
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
Cc: linux-next@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_DDBD3AF7-3EEF-4A31-B940-855A3A93F776
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

linux-next fails to boot on Power server (POWER8/POWER9). Following =
traces
are seen during boot

[    0.010799] software IO TLB: tearing down default memory pool
[    0.010805] ------------[ cut here ]------------
[    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!
[    0.010812] Oops: Exception in kernel mode, sig: 5 [#1]
[    0.010816] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[    0.010820] Modules linked in:
[    0.010824] CPU: 1 PID: 1 Comm: swapper/0 Not tainted =
5.14.0-rc3-next-20210727 #1
[    0.010830] NIP:  c000000000032cfc LR: c00000000000c764 CTR: =
c00000000000c670
[    0.010834] REGS: c000000003603b10 TRAP: 0700   Not tainted  =
(5.14.0-rc3-next-20210727)
[    0.010838] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
28000222  XER: 00000002
[    0.010848] CFAR: c00000000000c760 IRQMASK: 3=20
[    0.010848] GPR00: c00000000000c764 c000000003603db0 c0000000029bd000 =
0000000000000001=20
[    0.010848] GPR04: 0000000000000a68 0000000000000400 c000000003603868 =
ffffffffffffffff=20
[    0.010848] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000003=20
[    0.010848] GPR12: ffffffffffffffff c00000001ec9ee80 c000000000012a28 =
0000000000000000=20
[    0.010848] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    0.010848] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    0.010848] GPR24: 000000000000f134 0000000000000000 ffffffffffffffff =
c000000003603868=20
[    0.010848] GPR28: 0000000000000400 0000000000000a68 c00000000202e9c0 =
c000000003603e80=20
[    0.010896] NIP [c000000000032cfc] system_call_exception+0x8c/0x2e0
[    0.010901] LR [c00000000000c764] system_call_common+0xf4/0x258
[    0.010907] Call Trace:
[    0.010909] [c000000003603db0] [c00000000016a6dc] =
calculate_sigpending+0x4c/0xe0 (unreliable)
[    0.010915] [c000000003603e10] [c00000000000c764] =
system_call_common+0xf4/0x258
[    0.010921] --- interrupt: c00 at kvm_template_end+0x4/0x8
[    0.010926] NIP:  c000000000092dec LR: c000000000114fc8 CTR: =
0000000000000000
[    0.010930] REGS: c000000003603e80 TRAP: 0c00   Not tainted  =
(5.14.0-rc3-next-20210727)
[    0.010934] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
28000222  XER: 00000000
[    0.010943] IRQMASK: 0=20
[    0.010943] GPR00: c00000000202e9c0 c000000003603b00 c0000000029bd000 =
000000000000f134=20
[    0.010943] GPR04: 0000000000000a68 0000000000000400 c000000003603868 =
ffffffffffffffff=20
[    0.010943] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    0.010943] GPR12: 0000000000000000 c00000001ec9ee80 c000000000012a28 =
0000000000000000=20
[    0.010943] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    0.010943] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    0.010943] GPR24: c0000000020033c4 c00000000110afc0 c000000002081950 =
c000000003277d40=20
[    0.010943] GPR28: 0000000000000000 c00000000a680000 0000000004000000 =
00000000000d0000=20
[    0.010989] NIP [c000000000092dec] kvm_template_end+0x4/0x8
[    0.010993] LR [c000000000114fc8] set_memory_encrypted+0x38/0x60
[    0.010999] --- interrupt: c00
[    0.011001] [c000000003603b00] [c00000000000c764] =
system_call_common+0xf4/0x258 (unreliable)
[    0.011008] Instruction dump:
[    0.011011] 694a0003 312affff 7d495110 0b0a0000 60000000 60000000 =
e87f0108 68690002=20
[    0.011019] 7929ffe2 0b090000 68634000 786397e2 <0b030000> e93f0138 =
792907e0 0b090000=20
[    0.011029] ---[ end trace a20ad55589efcb10 ]---
[    0.012297]=20
[    1.012304] Kernel panic - not syncing: Fatal exception

next-20210723 was good. The boot failure seems to have been introduced =
with next-20210726.

I have attached the boot log.

Thanks
-Sachin


--Apple-Mail=_DDBD3AF7-3EEF-4A31-B940-855A3A93F776
Content-Disposition: attachment;
	filename=boot.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="boot.txt"
Content-Transfer-Encoding: quoted-printable

[    0.000000] hash-mmu: Page sizes from device-tree:
[    0.000000] hash-mmu: base_shift=3D12: shift=3D12, sllp=3D0x0000, =
avpnm=3D0x00000000, tlbiel=3D1, penc=3D0
[    0.000000] hash-mmu: base_shift=3D12: shift=3D16, sllp=3D0x0000, =
avpnm=3D0x00000000, tlbiel=3D1, penc=3D7
[    0.000000] hash-mmu: base_shift=3D12: shift=3D24, sllp=3D0x0000, =
avpnm=3D0x00000000, tlbiel=3D1, penc=3D56
[    0.000000] hash-mmu: base_shift=3D16: shift=3D16, sllp=3D0x0110, =
avpnm=3D0x00000000, tlbiel=3D1, penc=3D1
[    0.000000] hash-mmu: base_shift=3D16: shift=3D24, sllp=3D0x0110, =
avpnm=3D0x00000000, tlbiel=3D1, penc=3D8
[    0.000000] hash-mmu: base_shift=3D24: shift=3D24, sllp=3D0x0100, =
avpnm=3D0x00000001, tlbiel=3D0, penc=3D0
[    0.000000] hash-mmu: base_shift=3D34: shift=3D34, sllp=3D0x0120, =
avpnm=3D0x000007ff, tlbiel=3D0, penc=3D3
[    0.000000] Enabling pkeys with max key count 31
[    0.000000] Activating Kernel Userspace Execution Prevention
[    0.000000] Activating Kernel Userspace Access Prevention
[    0.000000] Using 1TB segments
[    0.000000] hash-mmu: Initializing hash mmu with SLB
[    0.000000] Linux version 5.14.0-rc3-next-20210727 =
(root@ltczz304-lp7.aus.stglabs.ibm.com) (gcc (GCC) 8.4.1 20200928 (Red =
Hat 8.4.1-1), GNU ld version 2.30-93.el8) #1 SMP Wed Jul 28 01:12:04 EDT =
2021
[    0.000000] Found initrd at 0xc000000005580000:0xc00000000a67e40b
[    0.000000] Using pSeries machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Partition configured for 16 cpus.
[    0.000000] CPU maps initialized for 8 threads per core
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     =3D 0x640000000
[    0.000000] dcache_bsize      =3D 0x80
[    0.000000] icache_bsize      =3D 0x80
[    0.000000] cpu_features      =3D 0x0001c07b8f5f9187
[    0.000000]   possible        =3D 0x000ffbfbcf5fb187
[    0.000000]   always          =3D 0x0000000380008181
[    0.000000] cpu_user_features =3D 0xdc0065c2 0xeff00000
[    0.000000] mmu_features      =3D 0x7c006e01
[    0.000000] firmware_features =3D 0x0000009fc45bfc57
[    0.000000] vmalloc start     =3D 0xc008000000000000
[    0.000000] IO start          =3D 0xc00a000000000000
[    0.000000] vmemmap start     =3D 0xc00c000000000000
[    0.000000] hash-mmu: ppc64_pft_size    =3D 0x1c
[    0.000000] hash-mmu: htab_hash_mask    =3D 0x1fffff
[    0.000000] -----------------------------------------------------
[    0.000000] numa:   NODE_DATA [mem 0x63ff5ef80-0x63ff63fff]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] count-cache-flush: flush disabled.
[    0.000000] link-stack-flush: software flush enabled.
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
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000063fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000063fffffff]
[    0.000000] Initmem setup node 0 [mem =
0x0000000000000000-0x000000063fffffff]
[    0.000000] percpu: Embedded 10 pages/cpu s605976 r0 d49384 u1048576
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: =
409200
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: =
BOOT_IMAGE=3D/boot/vmlinuz-4.18.0-305.el8.ppc64le =
root=3DUUID=3D1d8cf2d2-972f-44c6-ad53-dfc23e7c0dc2 ro crashkernel=3Dauto =
biosdevname=3D0=20
[    0.000000] Unknown command line parameters: =
BOOT_IMAGE=3D/boot/vmlinuz-4.18.0-305.el8.ppc64le crashkernel=3Dauto =
biosdevname=3D0
[    0.000000] Dentry cache hash table entries: 4194304 (order: 9, =
33554432 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2097152 (order: 8, =
16777216 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 25904768K/26214400K available (13376K kernel =
code, 5440K rwdata, 4160K rodata, 4992K init, 2866K bss, 309632K =
reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, =
CPUs=3D16, Nodes=3D2
[    0.000000] ftrace: allocating 33320 entries in 13 pages
[    0.000000] ftrace: allocated 13 pages with 3 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D2048 to =
nr_cpu_ids=3D16.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay =
is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, =
nr_cpu_ids=3D16
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] xive: Using IRQ range [400000-40000f]
[    0.000000] xive: Interrupt handling initialized with spapr backend
[    0.000000] xive: Using priority 7 for all interrupts
[    0.000000] xive: Using 64kB queues
[    0.000000] rcu: 	Offload RCU callbacks from CPUs: (none).
[    0.000000] random: get_random_u64 called from =
start_kernel+0x9a8/0xc08 with crng_init=3D0
[    0.000001] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.000031] clocksource: timebase: mask: 0xffffffffffffffff =
max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000082] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000161] Console: colour dummy device 80x25
[    0.000188] printk: console [hvc0] enabled
[    0.000188] printk: console [hvc0] enabled
[    0.000211] printk: bootconsole [udbg0] disabled
[    0.000211] printk: bootconsole [udbg0] disabled
[    0.000257] pid_max: default: 32768 minimum: 301
[    0.000298] LSM: Security Framework initializing
[    0.000311] Yama: becoming mindful.
[    0.000320] SELinux:  Initializing.
[    0.000396] Mount-cache hash table entries: 65536 (order: 3, 524288 =
bytes, linear)
[    0.000433] Mountpoint-cache hash table entries: 65536 (order: 3, =
524288 bytes, linear)
[    0.000993] POWER9 performance monitor hardware support registered
[    0.001023] rcu: Hierarchical SRCU implementation.
[    0.002202] smp: Bringing up secondary CPUs ...
[    0.005838] smp: Brought up 1 node, 16 CPUs
[    0.005844] numa: Node 0 CPUs: 0-15
[    0.005849] Big cores detected but using small core scheduling
[    0.006221] devtmpfs: initialized
[    0.007918] clocksource: jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.007925] futex hash table entries: 4096 (order: 3, 524288 bytes, =
linear)
[    0.008076] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.008177] audit: initializing netlink subsys (disabled)
[    0.008224] audit: type=3D2000 audit(1627450491.000:1): =
state=3Dinitialized audit_enabled=3D0 res=3D1
[    0.008276] thermal_sys: Registered thermal governor 'fair_share'
[    0.008277] thermal_sys: Registered thermal governor 'step_wise'
[    0.008326] cpuidle: using governor menu
[    0.008479] pstore: Registered nvram as persistent store backend
[    0.009004] EEH: pSeries platform initialized
[    0.010799] software IO TLB: tearing down default memory pool
[    0.010805] ------------[ cut here ]------------
[    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!
[    0.010812] Oops: Exception in kernel mode, sig: 5 [#1]
[    0.010816] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[    0.010820] Modules linked in:
[    0.010824] CPU: 1 PID: 1 Comm: swapper/0 Not tainted =
5.14.0-rc3-next-20210727 #1
[    0.010830] NIP:  c000000000032cfc LR: c00000000000c764 CTR: =
c00000000000c670
[    0.010834] REGS: c000000003603b10 TRAP: 0700   Not tainted  =
(5.14.0-rc3-next-20210727)
[    0.010838] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
28000222  XER: 00000002
[    0.010848] CFAR: c00000000000c760 IRQMASK: 3=20
[    0.010848] GPR00: c00000000000c764 c000000003603db0 c0000000029bd000 =
0000000000000001=20
[    0.010848] GPR04: 0000000000000a68 0000000000000400 c000000003603868 =
ffffffffffffffff=20
[    0.010848] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000003=20
[    0.010848] GPR12: ffffffffffffffff c00000001ec9ee80 c000000000012a28 =
0000000000000000=20
[    0.010848] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    0.010848] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    0.010848] GPR24: 000000000000f134 0000000000000000 ffffffffffffffff =
c000000003603868=20
[    0.010848] GPR28: 0000000000000400 0000000000000a68 c00000000202e9c0 =
c000000003603e80=20
[    0.010896] NIP [c000000000032cfc] system_call_exception+0x8c/0x2e0
[    0.010901] LR [c00000000000c764] system_call_common+0xf4/0x258
[    0.010907] Call Trace:
[    0.010909] [c000000003603db0] [c00000000016a6dc] =
calculate_sigpending+0x4c/0xe0 (unreliable)
[    0.010915] [c000000003603e10] [c00000000000c764] =
system_call_common+0xf4/0x258
[    0.010921] --- interrupt: c00 at kvm_template_end+0x4/0x8
[    0.010926] NIP:  c000000000092dec LR: c000000000114fc8 CTR: =
0000000000000000
[    0.010930] REGS: c000000003603e80 TRAP: 0c00   Not tainted  =
(5.14.0-rc3-next-20210727)
[    0.010934] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
28000222  XER: 00000000
[    0.010943] IRQMASK: 0=20
[    0.010943] GPR00: c00000000202e9c0 c000000003603b00 c0000000029bd000 =
000000000000f134=20
[    0.010943] GPR04: 0000000000000a68 0000000000000400 c000000003603868 =
ffffffffffffffff=20
[    0.010943] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    0.010943] GPR12: 0000000000000000 c00000001ec9ee80 c000000000012a28 =
0000000000000000=20
[    0.010943] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    0.010943] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    0.010943] GPR24: c0000000020033c4 c00000000110afc0 c000000002081950 =
c000000003277d40=20
[    0.010943] GPR28: 0000000000000000 c00000000a680000 0000000004000000 =
00000000000d0000=20
[    0.010989] NIP [c000000000092dec] kvm_template_end+0x4/0x8
[    0.010993] LR [c000000000114fc8] set_memory_encrypted+0x38/0x60
[    0.010999] --- interrupt: c00
[    0.011001] [c000000003603b00] [c00000000000c764] =
system_call_common+0xf4/0x258 (unreliable)
[    0.011008] Instruction dump:
[    0.011011] 694a0003 312affff 7d495110 0b0a0000 60000000 60000000 =
e87f0108 68690002=20
[    0.011019] 7929ffe2 0b090000 68634000 786397e2 <0b030000> e93f0138 =
792907e0 0b090000=20
[    0.011029] ---[ end trace a20ad55589efcb10 ]---
[    0.012297]=20
[    1.012304] Kernel panic - not syncing: Fatal exception
[    1.015990] ------------[ cut here ]------------
[    1.015994] WARNING: CPU: 1 PID: 1 at drivers/tty/vt/vt.c:4394 =
do_unblank_screen+0x190/0x250
[    1.016004] Modules linked in:
[    1.016008] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G      D           =
5.14.0-rc3-next-20210727 #1
[    1.016016] NIP:  c0000000007fdd00 LR: c0000000007fdcec CTR: =
c00000000003de00
[    1.016022] REGS: c000000003603660 TRAP: 0700   Tainted: G      D     =
       (5.14.0-rc3-next-20210727)
[    1.016028] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28002222  =
XER: 2004000c
[    1.016043] CFAR: c0000000001ed078 IRQMASK: 3=20
[    1.016043] GPR00: c0000000007fdcec c000000003603900 c0000000029bd000 =
0000000000000000=20
[    1.016043] GPR04: 0000000000000003 0000000000000f75 c0000000036035e0 =
0000000000000000=20
[    1.016043] GPR08: 0000000639fe0000 0000000000000000 0000000000000000 =
c0000000027b6ec8=20
[    1.016043] GPR12: c00000000003de00 c00000001ec9ee80 c000000000012a28 =
0000000000000000=20
[    1.016043] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    1.016043] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    1.016043] GPR24: 000000000000f134 0000000000000000 c0000000024eda70 =
c000000003603868=20
[    1.016043] GPR28: c000000002a99a58 c000000002a99a90 0000000000000000 =
c000000002ba7e20=20
[    1.016120] NIP [c0000000007fdd00] do_unblank_screen+0x190/0x250
[    1.016127] LR [c0000000007fdcec] do_unblank_screen+0x17c/0x250
[    1.016133] Call Trace:
[    1.016136] [c000000003603900] [c0000000007fdd1c] =
do_unblank_screen+0x1ac/0x250 (unreliable)
[    1.016145] [c000000003603980] [c000000000151a2c] panic+0x1e8/0x40c
[    1.016153] [c000000003603a20] [c00000000002b2fc] =
oops_end+0x1fc/0x200
[    1.016162] [c000000003603aa0] [c000000000009614] =
program_check_common_virt+0x2d4/0x320
[    1.016170] --- interrupt: 700 at system_call_exception+0x8c/0x2e0
[    1.016177] NIP:  c000000000032cfc LR: c00000000000c764 CTR: =
c00000000000c670
[    1.016183] REGS: c000000003603b10 TRAP: 0700   Tainted: G      D     =
       (5.14.0-rc3-next-20210727)
[    1.016189] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
28000222  XER: 00000002
[    1.016205] CFAR: c00000000000c760 IRQMASK: 3=20
[    1.016205] GPR00: c00000000000c764 c000000003603db0 c0000000029bd000 =
0000000000000001=20
[    1.016205] GPR04: 0000000000000a68 0000000000000400 c000000003603868 =
ffffffffffffffff=20
[    1.016205] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000003=20
[    1.016205] GPR12: ffffffffffffffff c00000001ec9ee80 c000000000012a28 =
0000000000000000=20
[    1.016205] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    1.016205] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    1.016205] GPR24: 000000000000f134 0000000000000000 ffffffffffffffff =
c000000003603868=20
[    1.016205] GPR28: 0000000000000400 0000000000000a68 c00000000202e9c0 =
c000000003603e80=20
[    1.016281] NIP [c000000000032cfc] system_call_exception+0x8c/0x2e0
[    1.016287] LR [c00000000000c764] system_call_common+0xf4/0x258
[    1.016294] --- interrupt: 700
[    1.016298] [c000000003603db0] [c00000000016a6dc] =
calculate_sigpending+0x4c/0xe0 (unreliable)
[    1.016307] [c000000003603e10] [c00000000000c764] =
system_call_common+0xf4/0x258
[    1.016316] --- interrupt: c00 at kvm_template_end+0x4/0x8
[    1.016322] NIP:  c000000000092dec LR: c000000000114fc8 CTR: =
0000000000000000
[    1.016328] REGS: c000000003603e80 TRAP: 0c00   Tainted: G      D     =
       (5.14.0-rc3-next-20210727)
[    1.016334] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
28000222  XER: 00000000
[    1.016350] IRQMASK: 0=20
[    1.016350] GPR00: c00000000202e9c0 c000000003603b00 c0000000029bd000 =
000000000000f134=20
[    1.016350] GPR04: 0000000000000a68 0000000000000400 c000000003603868 =
ffffffffffffffff=20
[    1.016350] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    1.016350] GPR12: 0000000000000000 c00000001ec9ee80 c000000000012a28 =
0000000000000000=20
[    1.016350] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    1.016350] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    1.016350] GPR24: c0000000020033c4 c00000000110afc0 c000000002081950 =
c000000003277d40=20
[    1.016350] GPR28: 0000000000000000 c00000000a680000 0000000004000000 =
00000000000d0000=20
[    1.016423] NIP [c000000000092dec] kvm_template_end+0x4/0x8
[    1.016430] LR [c000000000114fc8] set_memory_encrypted+0x38/0x60
[    1.016437] --- interrupt: c00
[    1.016440] [c000000003603b00] [c00000000000c764] =
system_call_common+0xf4/0x258 (unreliable)
[    1.016450] Instruction dump:
[    1.016454] 4e800020 60000000 60000000 60000000 7c0802a6 f8010090 =
4b9ef381 60000000=20
[    1.016468] 813f0000 7d231b78 2f830000 409e0034 <0fe00000> e8010090 =
7c0803a6 4bfffeac=20
[    1.016482] ---[ end trace a20ad55589efcb11 ]---
[    1.016488] Rebooting in 10 seconds..

--Apple-Mail=_DDBD3AF7-3EEF-4A31-B940-855A3A93F776--

