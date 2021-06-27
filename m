Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E323B5376
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 15:31:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCWpj0DwGz30Gc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 23:31:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h9gb3deI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h9gb3deI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCWpB2MS2z2yL6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jun 2021 23:30:41 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15RD4BgQ006228; Sun, 27 Jun 2021 09:30:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 mime-version : subject : message-id : date : cc : to; s=pp1;
 bh=cgJr9oaE9WYGihUsi6PFISluz0Jl7iSM+TPVAOiA8JA=;
 b=h9gb3deIoq5X5Plep7gFtoXfiRhYW4oTy9LeWyg6V+OCc3Ce09brU1lTzuJA7YHiRc0r
 D8h73HncjPCqS3pSWw/OHkZYrfL5XI9Q/a/H6plxPh9Ijo5e7BQu6uZfZWUlUiD20+5s
 RXYD6D0L+OLHBMT2erIYQQXuWDngbwut/mePiJZhpACx7eI9875tj4UnbmuiK1zL1TWq
 KjG9unw/EiwJGhsE3wBPGU17/4gHaqHP11XzDWrDUXraVhLiqy5ICXde7wYxeV+OCGRC
 dklBjOXPzZXjL2len/iiIxT/wsZE7o7IN883YfgSvZVQn9txLek3LKpK9qO9DoJWGt3V KA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ersmsckx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Jun 2021 09:30:25 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15RDSpdx009503;
 Sun, 27 Jun 2021 13:30:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 39dughgd6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Jun 2021 13:30:23 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15RDSpOa33685976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 27 Jun 2021 13:28:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0886A4064;
 Sun, 27 Jun 2021 13:30:20 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3992A4062;
 Sun, 27 Jun 2021 13:30:19 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.199.58.163])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 27 Jun 2021 13:30:19 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_57E7A8F3-B9FF-4B10-B2FC-BCDDD568ED89"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: [powerpc][next-20210625] WARN block/mq-deadline-main.c:743 during boot
Message-Id: <74F24228-8BC7-49FA-BD43-A9FB90269E76@linux.vnet.ibm.com>
Date: Sun, 27 Jun 2021 19:00:18 +0530
To: linux-block@vger.kernel.org
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KiYM-EC6Ez-JeobF7iifK9He9IovJoA4
X-Proofpoint-GUID: KiYM-EC6Ez-JeobF7iifK9He9IovJoA4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-27_01:2021-06-25,
 2021-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106270095
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
Cc: axboe@kernel.dk, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bvanassche@acm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_57E7A8F3-B9FF-4B10-B2FC-BCDDD568ED89
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

While booting 5.13.0-rc7-next-20210625 on POWER9 LPAR following warning
is seen:

[    3.111826] device-mapper: multipath service-time: version 0.3.0 =
loaded
[    3.485799] ------------[ cut here ]------------
[    3.485809] WARNING: CPU: 9 PID: 225 at block/mq-deadline-main.c:743 =
dd_insert_requests+0x460/0x4a0
[    3.485819] Modules linked in: dm_service_time sd_mod t10_pi sg =
ibmvfc scsi_transport_fc ibmveth dm_multipath dm_mirror dm_region_hash =
dm_log dm_mod fuse
[    3.485836] CPU: 9 PID: 225 Comm: kworker/9:1H Not tainted =
5.13.0-rc7-next-20210625 #3
[    3.485842] Workqueue: kblockd blk_mq_requeue_work
[    3.485848] NIP:  c0000000006a5c20 LR: c0000000006a5958 CTR: =
c0000000006a57c0
[    3.485852] REGS: c000000009d2f800 TRAP: 0700   Not tainted  =
(5.13.0-rc7-next-20210625)
[    3.485857] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 24004828  XER: 00000001
[    3.485871] CFAR: c0000000006a5964 IRQMASK: 0=20
[    3.485871] GPR00: c0000000006a5920 c000000009d2faa0 c000000001adb700 =
0000000000000000=20
[    3.485871] GPR04: c000000028750048 c000000028750048 0000000000000000 =
c000000028750048=20
[    3.485871] GPR08: 0000000000000020 c000000009530400 0000000000000024 =
0000000000000007=20
[    3.485871] GPR12: 0000000000002000 c00000001ec53280 c00000000018bb48 =
c000000009530400=20
[    3.485871] GPR16: 0000000000000000 c000000028750000 0000000c00002204 =
c00000000d77512c=20
[    3.485871] GPR20: c00000000d775000 000000000004001a c000000000d96928 =
c00000002ea4e400=20
[    3.485871] GPR24: c00000002e190000 0000000000000003 c000000009d2fb98 =
c000000009d2fac8=20
[    3.485871] GPR28: c00000000d775000 0000000000000001 0000000000080700 =
c000000028750048=20
[    3.485925] NIP [c0000000006a5c20] dd_insert_requests+0x460/0x4a0
[    3.485930] LR [c0000000006a5958] dd_insert_requests+0x198/0x4a0
[    3.485935] Call Trace:
[    3.485937] [c000000009d2faa0] [c00000000001e528] =
__switch_to+0x2c8/0x480 (unreliable)
[    3.485945] [c000000009d2fb70] [c00000000068550c] =
blk_mq_sched_insert_request+0xfc/0x210
[    3.485951] [c000000009d2fbf0] [c00000000067d314] =
blk_mq_requeue_work+0x174/0x250
[    3.485958] [c000000009d2fc60] [c00000000017f634] =
process_one_work+0x264/0x540
[    3.485964] [c000000009d2fd00] [c00000000017f998] =
worker_thread+0x88/0x630
[    3.485970] [c000000009d2fda0] [c00000000018bcd4] kthread+0x194/0x1a0
[    3.485976] [c000000009d2fe10] [c00000000000c750] =
ret_from_kernel_thread+0x5c/0x6c
[    3.485983] Instruction dump:
[    3.485986] 7ea94838 2f890000 409eff64 7e248b78 7f03c378 4bfbd0dd =
60000000 e9380000=20
[    3.485996] 2fa90000 409eff48 fa380000 4bffff40 <0fe00000> 4bfffd44 =
60000000 60000000=20
[    3.486005] ---[ end trace 42319989f7cb8ff4 ]---
[  OK  ] Found device =
/dev/disk/by-uuid/186c6f84-531c-4570-89cc-6490f20090e9.

Last known tested & working build was 5.13.0-rc6-next-20210618.

This problem seems to be introduced with

commit 08a9ad8bf60738
       block/mq-deadline: Add cgroup support

Reverting this patch allows the kernel to boot without the mentioned =
warning.

Have attached the boot log. IOSCHED_DEADLINE is set to yes.

CONFIG_MQ_IOSCHED_DEADLINE=3Dy
CONFIG_MQ_IOSCHED_KYBER=3Dy
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

Thanks
-Sachin


--Apple-Mail=_57E7A8F3-B9FF-4B10-B2FC-BCDDD568ED89
Content-Disposition: attachment;
	filename=next-boot.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="next-boot.txt"
Content-Transfer-Encoding: quoted-printable

[    0.000000] crashkernel: memory value expected
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
[    0.000000] Page orders: linear mapping =3D 24, virtual =3D 16, io =3D =
16, vmemmap =3D 24
[    0.000000] Using 1TB segments
[    0.000000] hash-mmu: Initializing hash mmu with SLB
[    0.000000] Linux version 5.13.0-rc7-next-20210625 =
(root@ltcfleet2-lp13.aus.stglabs.ibm.com) (gcc (GCC) 8.4.1 20200928 (Red =
Hat 8.4.1-1), GNU ld version 2.30-93.el8) #1 SMP Sun Jun 27 06:16:48 EDT =
2021
[    0.000000] Found initrd at 0xc00000000c700000:0xc000000010d05c11
[    0.000000] Using pSeries machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Partition configured for 16 cpus.
[    0.000000] CPU maps initialized for 8 threads per core
[    0.000000]  (thread shift is 3)
[    0.000000] Allocated 4608 bytes for 16 pacas
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     =3D 0xa00000000
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
[    0.000000] hash-mmu: ppc64_pft_size    =3D 0x1d
[    0.000000] hash-mmu: htab_hash_mask    =3D 0x3fffff
[    0.000000] -----------------------------------------------------
[    0.000000] numa:   NODE_DATA [mem 0x9fff5ef80-0x9fff63fff]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] rfi-flush: patched 14 locations (mttrig type flush)
[    0.000000] count-cache-flush: software flush enabled.
[    0.000000] link-stack-flush: software flush enabled.
[    0.000000] entry-flush: patched 61 locations (mttrig type flush)
[    0.000000] uaccess-flush: patched 1 locations (mttrig type flush)
[    0.000000] stf-barrier: eieio barrier available
[    0.000000] stf-barrier: patched 61 entry locations (eieio barrier)
[    0.000000] stf-barrier: patched 14 exit locations (eieio barrier)
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
[    0.000000] barrier-nospec: patched 390 locations
[    0.000000] Top of RAM: 0xa00000000, Total RAM: 0xa00000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x00000009ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   7: [mem 0x0000000000000000-0x00000009ffffffff]
[    0.000000] Initmem setup node 7 [mem =
0x0000000000000000-0x00000009ffffffff]
[    0.000000] percpu: Embedded 10 pages/cpu s605976 r0 d49384 u1048576
[    0.000000] pcpu-alloc: s605976 r0 d49384 u1048576 alloc=3D1*1048576
[    0.000000] pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0] =
06 [0] 07=20
[    0.000000] pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11 [0] 12 [0] 13 [0] =
14 [0] 15=20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: =
654720
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: =
BOOT_IMAGE=3D/boot/vmlinuz-5.13.0-rc7-next-20210625 =
root=3DUUID=3D186c6f84-531c-4570-89cc-6490f20090e9 ro crashkernel=3Dauto =
biosdevname=3D0
[    0.000000] Unknown command line parameters: =
BOOT_IMAGE=3D/boot/vmlinuz-5.13.0-rc7-next-20210625 crashkernel=3Dauto =
biosdevname=3D0
[    0.000000] Dentry cache hash table entries: 8388608 (order: 10, =
67108864 bytes, linear)
[    0.000000] Inode-cache hash table entries: 4194304 (order: 9, =
33554432 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 41585600K/41943040K available (13376K kernel =
code, 5440K rwdata, 4096K rodata, 4992K init, 2929K bss, 357440K =
reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, =
CPUs=3D16, Nodes=3D8
[    0.000000] ftrace: allocating 33185 entries in 13 pages
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
[    0.000000] pic: no ISA interrupt controller
[    0.000000] rcu: 	Offload RCU callbacks from CPUs: (none).
[    0.000000] random: get_random_u64 called from =
start_kernel+0x9b0/0xc10 with crng_init=3D0
[    0.000000] time_init: decrementer frequency =3D 512.000000 MHz
[    0.000000] time_init: processor frequency   =3D 3150.000000 MHz
[    0.000001] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.000024] clocksource: timebase: mask: 0xffffffffffffffff =
max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000064] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000090] clockevent: decrementer mult[83126f] shift[24] cpu[0]
[    0.000118] Console: colour dummy device 80x25
[    0.000137] printk: console [hvc0] enabled
[    0.000155] printk: bootconsole [udbg0] disabled
[    0.000189] pid_max: default: 32768 minimum: 301
[    0.000213] LSM: Security Framework initializing
[    0.000222] Yama: becoming mindful.
[    0.000228] SELinux:  Initializing.
[    0.000308] Mount-cache hash table entries: 131072 (order: 4, 1048576 =
bytes, linear)
[    0.000365] Mountpoint-cache hash table entries: 131072 (order: 4, =
1048576 bytes, linear)
[    0.000751] POWER9 performance monitor hardware support registered
[    0.000772] rcu: Hierarchical SRCU implementation.
[    0.001358] smp: Bringing up secondary CPUs ...
[    0.005415] smp: Brought up 1 node, 16 CPUs
[    0.005423] numa: Node 7 CPUs: 0-15
[    0.005428] Big cores detected but using small core scheduling
[    0.005867] devtmpfs: initialized
[    0.031559] clocksource: jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.031568] futex hash table entries: 4096 (order: 3, 524288 bytes, =
linear)
[    0.031756] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.031848] audit: initializing netlink subsys (disabled)
[    0.031905] audit: type=3D2000 audit(1624791942.030:1): =
state=3Dinitialized audit_enabled=3D0 res=3D1
[    0.031956] thermal_sys: Registered thermal governor 'fair_share'
[    0.031958] thermal_sys: Registered thermal governor 'step_wise'
[    0.032011] cpuidle: using governor menu
[    0.032079] RTAS daemon started
[    0.032184] pstore: Registered nvram as persistent store backend
[    0.032761] EEH: pSeries platform initialized
[    0.039808] PCI: Probing PCI hardware
[    0.039812] EEH: No capable adapters found: recovery disabled.
[    0.039815] PCI: Probing PCI hardware done
[    0.039916] pseries-rng: Registering arch random hook.
[    0.041026] Kprobes globally optimized
[    0.041194] HugeTLB registered 16.0 MiB page size, pre-allocated 0 =
pages
[    0.041199] HugeTLB registered 16.0 GiB page size, pre-allocated 0 =
pages
[    0.072269] wait_for_initramfs() called before rootfs_initcalls
[    0.075230] iommu: Default domain type: Translated=20
[    0.075279] vgaarb: loaded
[    0.075346] SCSI subsystem initialized
[    0.075376] usbcore: registered new interface driver usbfs
[    0.075386] usbcore: registered new interface driver hub
[    0.075396] usbcore: registered new device driver usb
[    0.075460] EDAC MC: Ver: 3.0.0
[    0.075653] NetLabel: Initializing
[    0.075656] NetLabel:  domain hash size =3D 128
[    0.075659] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.075673] NetLabel:  unlabeled traffic allowed by default
[    0.075788] clocksource: Switched to clocksource timebase
[    0.085323] VFS: Disk quotas dquot_6.6.0
[    0.085343] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 =
bytes)
[    0.086435] random: fast init done
[    0.087364] NET: Registered PF_INET protocol family
[    0.087487] IP idents hash table entries: 262144 (order: 5, 2097152 =
bytes, linear)
[    0.089972] tcp_listen_portaddr_hash hash table entries: 32768 =
(order: 3, 524288 bytes, linear)
[    0.090031] TCP established hash table entries: 524288 (order: 6, =
4194304 bytes, linear)
[    0.090872] TCP bind hash table entries: 65536 (order: 4, 1048576 =
bytes, linear)
[    0.090960] TCP: Hash tables configured (established 524288 bind =
65536)
[    0.090991] UDP hash table entries: 32768 (order: 4, 1048576 bytes, =
linear)
[    0.091101] UDP-Lite hash table entries: 32768 (order: 4, 1048576 =
bytes, linear)
[    0.091241] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.091248] PCI: CLS 0 bytes, default 128
[    0.091287] Trying to unpack rootfs image as initramfs...
[    0.091950] IOMMU table initialized, virtual merging enabled
[    0.111223] vas: API is supported only with radix page tables
[    0.112396] hv-24x7: read 1530 catalog entries, created 509 event =
attrs (0 failures), 275 descs
[    0.114351] Initialise system trusted keyrings
[    0.114401] workingset: timestamp_bits=3D38 max_order=3D20 =
bucket_order=3D0
[    0.115661] zbud: loaded
[    0.134910] NET: Registered PF_ALG protocol family
[    0.134916] Key type asymmetric registered
[    0.134920] Asymmetric key parser 'x509' registered
[    0.134927] Block layer SCSI generic (bsg) driver version 0.4 loaded =
(major 248)
[    0.134971] io scheduler mq-deadline registered
[    0.134976] io scheduler kyber registered
[    0.135283] atomic64_test: passed
[    0.135323] shpchp: Standard Hot Plug PCI Controller Driver version: =
0.4
[    0.135632] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.135882] Non-volatile memory driver v1.3
[    0.135910] Linux agpgart interface v0.103
[    0.136136] tpm_ibmvtpm 30000003: CRQ initialization completed
[    1.085686] Freeing initrd memory: 71680K
[    1.206495] rdac: device handler registered
[    1.206534] hp_sw: device handler registered
[    1.206537] emc: device handler registered
[    1.206572] alua: device handler registered
[    1.206668] libphy: Fixed MDIO Bus: probed
[    1.206710] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) =
Driver
[    1.206722] ehci-pci: EHCI PCI platform driver
[    1.206731] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.206740] ohci-pci: OHCI PCI platform driver
[    1.206747] uhci_hcd: USB Universal Host Controller Interface driver
[    1.206782] usbcore: registered new interface driver =
usbserial_generic
[    1.206789] usbserial: USB Serial support registered for generic
[    1.206845] mousedev: PS/2 mouse device common for all mice
[    1.206945] rtc-generic rtc-generic: registered as rtc0
[    1.206998] rtc-generic rtc-generic: setting system clock to =
2021-06-27T11:05:43 UTC (1624791943)
[    1.207079] xcede: xcede_record_size =3D 10
[    1.207082] xcede: Record 0 : hint =3D 1, latency =3D 0x400 tb ticks, =
Wake-on-irq =3D 1
[    1.207086] xcede: Record 1 : hint =3D 2, latency =3D 0x3e8000 tb =
ticks, Wake-on-irq =3D 0
[    1.207090] cpuidle: Skipping the 2 Extended CEDE idle states
[    1.207093] cpuidle: Fixed up CEDE exit latency to 1 us
[    1.207260] pseries_idle_driver registered
[    1.207280] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: =
max_sync_size new:65536 old:0
[    1.207285] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: =
max_sync_sg new:510 old:0
[    1.207290] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: =
max_sg_len new:4080 old:0
[    1.207328] alg: No test for 842 (842-nx)
[    1.207352] NX-GZIP is not supported. Returned=3D-524
[    1.207371] hid: raw HID events driver (C) Jiri Kosina
[    1.207463] usbcore: registered new interface driver usbhid
[    1.207466] usbhid: USB HID core driver
[    1.207479] drop_monitor: Initializing network drop monitor service
[    1.207534] Initializing XFRM netlink socket
[    1.207610] NET: Registered PF_INET6 protocol family
[    1.207799] Segment Routing with IPv6
[    1.207815] NET: Registered PF_PACKET protocol family
[    1.207820] mpls_gso: MPLS GSO support
[    1.207890] Running MSI bitmap self-tests ...
[    1.208529] registered taskstats version 1
[    1.208541] Loading compiled-in X.509 certificates
[    1.210917] alg: No test for pkcs1pad(rsa,sha1) =
(pkcs1pad(rsa-generic,sha1))
[    1.211522] Loaded X.509 cert 'Build time autogenerated kernel key: =
0f27eafbb5f2c161086ea66b5cf058fe022f9e54'
[    1.211574] zswap: loaded using pool lzo/zbud
[    1.211672] pstore: Using crash dump compression: deflate
[    1.212994] Freeing unused kernel image (initmem) memory: 4992K
[    1.212999] Kernel memory protection not selected by kernel config.
[    1.213005] Run /init as init process
[    1.213008]   with arguments:
[    1.213009]     /init
[    1.213011]   with environment:
[    1.213011]     HOME=3D/
[    1.213012]     TERM=3Dlinux
[    1.213013]     BOOT_IMAGE=3D/boot/vmlinuz-5.13.0-rc7-next-20210625
[    1.213015]     crashkernel=3Dauto
[    1.213016]     biosdevname=3D0
[    1.220578] systemd[1]: systemd 239 (239-45.el8) running in system =
mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP =
+LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS =
+KMOD +IDN2 -IDN +PCRE2 default-hierarchy=3Dlegacy)
[    1.220694] systemd[1]: Detected architecture ppc64-le.
[    1.220700] systemd[1]: Running in initial RAM disk.
[    1.276398] systemd[1]: Set hostname to =
<ltcfleet2-lp13.aus.stglabs.ibm.com>.
[    1.324932] random: systemd: uninitialized urandom read (16 bytes =
read)
[    1.325004] systemd[1]: Listening on udev Kernel Socket.
[    1.325194] random: systemd: uninitialized urandom read (16 bytes =
read)
[    1.325205] systemd[1]: Reached target Timers.
[    1.325308] random: systemd: uninitialized urandom read (16 bytes =
read)
[    1.325409] systemd[1]: Listening on Journal Socket.
[    1.326607] systemd[1]: Starting Create list of required static =
device nodes for the current kernel...
[    1.327362] systemd[1]: Starting Setup Virtual Console...
[    1.328109] systemd[1]: Started Hardware RNG Entropy Gatherer Daemon.
[    1.439732] fuse: init (API version 7.34)
[    1.541578] device-mapper: uevent: version 1.0.3
[    1.541657] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) =
initialised: dm-devel@redhat.com
[    1.925623] synth uevent: /devices/vio: failed to send uevent
[    1.925650] vio vio: uevent: failed to send synthetic uevent
[    1.925823] synth uevent: /devices/vio/4000: failed to send uevent
[    1.925831] vio 4000: uevent: failed to send synthetic uevent
[    1.925850] synth uevent: /devices/vio/4001: failed to send uevent
[    1.925856] vio 4001: uevent: failed to send synthetic uevent
[    1.925881] synth uevent: /devices/vio/4002: failed to send uevent
[    1.925888] vio 4002: uevent: failed to send synthetic uevent
[    1.925915] synth uevent: /devices/vio/4004: failed to send uevent
[    1.925923] vio 4004: uevent: failed to send synthetic uevent
[    2.084494] ibmveth: IBM Power Virtual Ethernet Driver 1.06
[    2.086264] ibmveth 30000002 env2: renamed from eth0
[    2.099854] ibmvfc: IBM Virtual Fibre Channel Driver version: 1.0.11 =
(April 12, 2013)
[    2.100403] scsi host0: IBM POWER Virtual FC Adapter
[    2.101472] ibmvfc 300004bd: Partner initialization complete
[    2.101943] scsi host1: IBM POWER Virtual FC Adapter
[    2.103112] ibmvfc 300008a5: Partner initialization complete
[    2.110937] ibmvfc 300004bd: Host partition: ltcfleet2-vios1, device: =
vfchost7 U78D5.ND1.CSS130E-P1-C2-C1-T1 U9080.M9S.130A098-V100-C1213 max =
sectors 2048
[    2.113277] ibmvfc 300008a5: Host partition: ltcfleet2-vios2, device: =
vfchost10 U78D5.ND2.CSS140C-P1-C2-C1-T1 U9080.M9S.130A098-V200-C2213 max =
sectors 2048
[    2.191711] scsi 0:0:0:0: Direct-Access     IBM      2145             =
0000 PQ: 0 ANSI: 6
[    2.192475] scsi 0:0:1:0: Direct-Access     IBM      2145             =
0000 PQ: 0 ANSI: 6
[    2.206687] scsi 1:0:0:0: Direct-Access     IBM      2145             =
0000 PQ: 0 ANSI: 6
[    2.207550] scsi 1:0:1:0: Direct-Access     IBM      2145             =
0000 PQ: 0 ANSI: 6
[    2.215833] scsi 0:0:0:0: alua: supports implicit TPGS
[    2.215841] scsi 0:0:0:0: alua: device =
naa.60050768028383d7f00000000000001f port group 0 rel port 80
[    2.215948] scsi 0:0:1:0: alua: supports implicit TPGS
[    2.215954] scsi 0:0:1:0: alua: device =
naa.60050768028383d7f00000000000001f port group 1 rel port 880
[    2.216058] scsi 1:0:0:0: alua: supports implicit TPGS
[    2.216063] scsi 1:0:0:0: alua: device =
naa.60050768028383d7f00000000000001f port group 0 rel port 80
[    2.216158] scsi 1:0:1:0: alua: supports implicit TPGS
[    2.216163] scsi 1:0:1:0: alua: device =
naa.60050768028383d7f00000000000001f port group 1 rel port 880
[    2.233836] scsi 0:0:0:0: Attached scsi generic sg0 type 0
[    2.233908] scsi 0:0:1:0: Attached scsi generic sg1 type 0
[    2.233971] scsi 1:0:0:0: Attached scsi generic sg2 type 0
[    2.234032] scsi 1:0:1:0: Attached scsi generic sg3 type 0
[    2.236764] scsi 0:0:1:0: Power-on or device reset occurred
[    2.236837] scsi 0:0:0:0: Power-on or device reset occurred
[    2.248623] sd 1:0:0:0: Power-on or device reset occurred
[    2.248649] sd 1:0:1:0: Power-on or device reset occurred
[    2.275942] sd 0:0:1:0: alua: transition timeout set to 60 seconds
[    2.275952] sd 0:0:1:0: alua: port group 01 state N non-preferred =
supports tolusna
[    2.275966] sd 0:0:0:0: alua: transition timeout set to 60 seconds
[    2.275972] sd 0:0:0:0: alua: port group 00 state A non-preferred =
supports tolusna
[    2.276425] sd 0:0:0:0: [sda] 209715200 512-byte logical blocks: (107 =
GB/100 GiB)
[    2.276426] sd 0:0:1:0: [sdb] 209715200 512-byte logical blocks: (107 =
GB/100 GiB)
[    2.276530] sd 0:0:0:0: [sda] Write Protect is off
[    2.276531] sd 0:0:1:0: [sdb] Write Protect is off
[    2.276535] sd 0:0:0:0: [sda] Mode Sense: 97 00 10 08
[    2.276538] sd 0:0:1:0: [sdb] Mode Sense: 97 00 10 08
[    2.276693] sd 0:0:0:0: [sda] Write cache: disabled, read cache: =
enabled, supports DPO and FUA
[    2.276711] sd 0:0:1:0: [sdb] Write cache: disabled, read cache: =
enabled, supports DPO and FUA
[    2.296361] sd 1:0:1:0: [sdd] 209715200 512-byte logical blocks: (107 =
GB/100 GiB)
[    2.296362] sd 1:0:0:0: [sdc] 209715200 512-byte logical blocks: (107 =
GB/100 GiB)
[    2.296461] sd 1:0:0:0: [sdc] Write Protect is off
[    2.296463] sd 1:0:1:0: [sdd] Write Protect is off
[    2.296468] sd 1:0:0:0: [sdc] Mode Sense: 97 00 10 08
[    2.296471] sd 1:0:1:0: [sdd] Mode Sense: 97 00 10 08
[    2.296671] sd 1:0:1:0: [sdd] Write cache: disabled, read cache: =
enabled, supports DPO and FUA
[    2.296671] sd 1:0:0:0: [sdc] Write cache: disabled, read cache: =
enabled, supports DPO and FUA
[    2.358146]  sda: sda1 sda2 sda3
[    2.359725] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.402821]  sdb: sdb1 sdb2 sdb3
[    2.404314] sd 0:0:1:0: [sdb] Attached SCSI disk
[    2.408138]  sdc: sdc1 sdc2 sdc3
[    2.408323]  sdd: sdd1 sdd2 sdd3
[    2.410172] sd 1:0:0:0: [sdc] Attached SCSI disk
[    2.410333] sd 1:0:1:0: [sdd] Attached SCSI disk
[    2.787982] device-mapper: multipath service-time: version 0.3.0 =
loaded
[    3.086066] ------------[ cut here ]------------
[    3.086075] WARNING: CPU: 15 PID: 226 at block/mq-deadline-main.c:743 =
dd_insert_requests+0x460/0x4a0
[    3.086085] Modules linked in: dm_service_time sd_mod t10_pi sg =
ibmvfc scsi_transport_fc ibmveth dm_multipath dm_mirror dm_region_hash =
dm_log dm_mod fuse
[    3.086102] CPU: 15 PID: 226 Comm: kworker/15:1H Not tainted =
5.13.0-rc7-next-20210625 #1
[    3.086109] Workqueue: kblockd blk_mq_requeue_work
[    3.086115] NIP:  c0000000006a4b40 LR: c0000000006a4878 CTR: =
c0000000006a46e0
[    3.086119] REGS: c00000002824f800 TRAP: 0700   Not tainted  =
(5.13.0-rc7-next-20210625)
[    3.086124] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48004828  XER: 00000001
[    3.086138] CFAR: c0000000006a4884 IRQMASK: 0=20
               GPR00: c0000000006a4840 c00000002824faa0 c000000001adb800 =
0000000000000000=20
               GPR04: c00000000b5d0048 c00000000b5d0048 0000000000000000 =
c00000000b5d0048=20
               GPR08: 0000000000000020 c000000009530400 0000000000000009 =
0000000000000007=20
               GPR12: 0000000000002000 c00000001ec3a280 c00000000018bd38 =
c000000009530400=20
               GPR16: 0000000000000000 c00000000b5d0000 0000000c00002204 =
c00000000baeb32c=20
               GPR20: c00000000baeb200 000000000004001a c000000000d96928 =
c00000002d1a7400=20
               GPR24: c000000029ca0000 0000000000000003 c00000002824fb98 =
c00000002824fac8=20
               GPR28: c00000000baeb200 0000000000000001 0000000000080700 =
c00000000b5d0048=20
[    3.086192] NIP [c0000000006a4b40] dd_insert_requests+0x460/0x4a0
[    3.086198] LR [c0000000006a4878] dd_insert_requests+0x198/0x4a0
[    3.086203] Call Trace:
[    3.086205] [c00000002824faa0] [c00000000001e608] =
__switch_to+0x2c8/0x480 (unreliable)
[    3.086212] [c00000002824fb70] [c0000000006846cc] =
blk_mq_sched_insert_request+0xfc/0x210
[    3.086219] [c00000002824fbf0] [c00000000067c4d4] =
blk_mq_requeue_work+0x174/0x250
[    3.086225] [c00000002824fc60] [c00000000017f814] =
process_one_work+0x264/0x540
[    3.086231] [c00000002824fd00] [c00000000017fb78] =
worker_thread+0x88/0x630
[    3.086237] [c00000002824fda0] [c00000000018bec4] kthread+0x194/0x1a0
[    3.086242] [c00000002824fe10] [c00000000000c750] =
ret_from_kernel_thread+0x5c/0x6c
[    3.086249] Instruction dump:
[    3.086252] 7ea94838 2f890000 409eff64 7e248b78 7f03c378 4bfbd35d =
60000000 e9380000=20
[    3.086261] 2fa90000 409eff48 fa380000 4bffff40 <0fe00000> 4bfffd44 =
60000000 60000000=20
[    3.086271] ---[ end trace 146cb6ccf9618f87 ]---
[    3.503164] EXT4-fs (dm-2): mounted filesystem with ordered data =
mode. Opts: (null). Quota mode: none.
[    4.299787] random: crng init done
[    4.299797] random: 7 urandom warning(s) missed due to ratelimiting
[    4.360924] printk: systemd: 13 output lines suppressed due to =
ratelimiting
[    5.114418] SELinux:  Runtime disable is deprecated, use selinux=3D0 =
on the kernel cmdline.
[    5.114432] SELinux:  Disabled at runtime.
[    5.295807] audit: type=3D1404 audit(1624791947.580:2): enforcing=3D0 =
old_enforcing=3D0 auid=3D4294967295 ses=3D4294967295 enabled=3D0 =
old-enabled=3D1 lsm=3Dselinux res=3D1
[    5.628450] systemd[1]: systemd 239 (239-45.el8) running in system =
mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP =
+LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS =
+KMOD +IDN2 -IDN +PCRE2 default-hierarchy=3Dlegacy)
[    5.628558] systemd[1]: Detected architecture ppc64-le.
[    5.640381] systemd[1]: Set hostname to =
<ltcfleet2-lp13.aus.stglabs.ibm.com>.
[    7.560448] systemd[1]: systemd-journald.service: Succeeded.
[    7.561093] systemd[1]: initrd-switch-root.service: Succeeded.
[    7.561371] systemd[1]: Stopped Switch Root.
[    7.561877] systemd[1]: systemd-journald.service: Service has no =
hold-off time (RestartSec=3D0), scheduling restart.
[    7.561933] systemd[1]: systemd-journald.service: Scheduled restart =
job, restart counter is at 1.
[    7.561990] systemd[1]: Stopped Journal Service.
[    7.562726] systemd[1]: Starting Journal Service...
[    7.645456] EXT4-fs (dm-2): re-mounted. Opts: (null). Quota mode: =
none.
[    7.682451] Adding 10485696k swap on /dev/mapper/mpatha3.  =
Priority:-2 extents:1 across:10485696k FS
[    8.118997] synth uevent: /devices/vio: failed to send uevent
[    8.119008] vio vio: uevent: failed to send synthetic uevent
[    8.119675] synth uevent: /devices/vio/4000: failed to send uevent
[    8.119679] vio 4000: uevent: failed to send synthetic uevent
[    8.119692] synth uevent: /devices/vio/4001: failed to send uevent
[    8.119696] vio 4001: uevent: failed to send synthetic uevent
[    8.119708] synth uevent: /devices/vio/4002: failed to send uevent
[    8.119712] vio 4002: uevent: failed to send synthetic uevent
[    8.119724] synth uevent: /devices/vio/4004: failed to send uevent
[    8.119728] vio 4004: uevent: failed to send synthetic uevent
[    9.414602] pseries_rng: Registering IBM pSeries RNG driver
[   10.145804] ibmveth 30000002 net0: renamed from env2
[   11.327861] RPC: Registered named UNIX socket transport module.
[   11.327873] RPC: Registered udp transport module.
[   11.327876] RPC: Registered tcp transport module.
[   11.327879] RPC: Registered tcp NFSv4.1 backchannel transport module.

--Apple-Mail=_57E7A8F3-B9FF-4B10-B2FC-BCDDD568ED89--

