Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E9B561942
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 13:32:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYbmN46Tmz3dtn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 21:32:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rnLtduZ4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rnLtduZ4;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYblc27PCz3bnn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 21:32:11 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UApUDM009067;
	Thu, 30 Jun 2022 11:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 subject : message-id : date : cc : to : mime-version; s=pp1;
 bh=JyhFhZCSStQSS/MgGN8R6rpZ1wX7gN3GjvecG0EQbCc=;
 b=rnLtduZ4SVFuVX2+r4ItTUni3V6kLN/kYG9zi5+VDuCoZYu92HeCPgW2qVeoUc5Nh6Qc
 OVxr0CgY85L1hMZSKoOozfHBMyIg6XqREHLaFgo0Ka3Oi6JA1Xbu/YiTr4iG5N/sQush
 jo/9vNz25G9BOqmm/aKG1ngINARnf0MkkjdcrY/ph5o0dz4BPNNCTmUUFNqvmrdxBvtI
 ynSRm/Yk0ArkiqHP2TYKF+CdiXs4P6vqUW+C3agP4bO5Qt7z2Oy+kpGfw04QQZ80/AdU
 xhTScDXQeZosdJZHslCFkYk65MInsJVADrgNt0ElHMV7e7L4Pm8OZrLGuKE/Bvh9t2uB UA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1aet10gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 11:32:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25UBLXp1013511;
	Thu, 30 Jun 2022 11:32:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3gwsmj822t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 11:32:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25UBW05F20447662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 11:32:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F4B011C04A;
	Thu, 30 Jun 2022 11:32:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFE7A11C058;
	Thu, 30 Jun 2022 11:31:58 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.240.215])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jun 2022 11:31:58 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_AD465ED9-8489-45F6-A24C-8CF796917EC1"
Subject: [next-20220629] kobject warnings during boot
Message-Id: <FCDBE9B3-FC5A-4CA3-9C0F-33A04460CA43@linux.ibm.com>
Date: Thu, 30 Jun 2022 17:01:57 +0530
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
        Jason@zx2c4.com
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Qk9sFYO4zSkH7aNOSGKS9M7BHrBjx3Kj
X-Proofpoint-GUID: Qk9sFYO4zSkH7aNOSGKS9M7BHrBjx3Kj
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_07,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 mlxlogscore=926 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300043
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_AD465ED9-8489-45F6-A24C-8CF796917EC1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

While booting linux-next (5.19.0-rc4-next-20220629) on Power8 =
non-virtualised
following koject warning is seen:

[    0.000184] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000303] clockevent: decrementer mult[83126e98] shift[32] cpu[0]
[    0.000397] ------------[ cut here ]------------
[    0.000478] kobject: '(null)' ((____ptrval____)): is not initialized, =
yet kobject_get() is being called.
[    0.000667] WARNING: CPU: 0 PID: 0 at lib/kobject.c:626 =
kobject_get+0x90/0x100
[    0.000802] Modules linked in:
[    0.000861] CPU: 0 PID: 0 Comm: swapper/0 Not tainted =
5.19.0-rc4-next-20220629 #1
[    0.000995] NIP:  c00000000073b0c0 LR: c00000000073b0bc CTR: =
c0000000000d33a0
[    0.001120] REGS: c000000002a0f890 TRAP: 0700   Not tainted  =
(5.19.0-rc4-next-20220629)
[    0.001260] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: =
28008822  XER: 20000000
[    0.001428] CFAR: c00000000014f3a4 IRQMASK: 1
               GPR00: c00000000073b0bc c000000002a0fb30 c000000002a12000 =
000000000000005c
               GPR04: 00000000ffff7fff c000000002a0f8f0 c000000002a0f8e8 =
0000000000000000
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 =
c0000000028e6bb8
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 =
0000000000000000
               GPR16: 0000000000000000 0000000000000000 0000000000000278 =
c000000002a4dfe0
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 =
c000000000fe6e18
               GPR24: 0000000000000000 c000000002a0fe90 c000000000fe6e08 =
0000000000000000
               GPR28: 0000000000000000 c000000002952e80 c000000ffffc3f10 =
c000000002952e80
[    0.002681] NIP [c00000000073b0c0] kobject_get+0x90/0x100
[    0.002781] LR [c00000000073b0bc] kobject_get+0x8c/0x100
[    0.002880] Call Trace:
[    0.002925] [c000000002a0fb30] [c00000000073b0bc] =
kobject_get+0x8c/0x100 (unreliable)
[    0.003071] [c000000002a0fba0] [c00000000087e464] =
device_add+0xf4/0xb00
[    0.003194] [c000000002a0fc80] [c000000000a7f6e4] =
of_device_add+0x64/0x80
[    0.003321] [c000000002a0fcb0] [c000000000a800d0] =
of_platform_device_create_pdata+0xd0/0x1b0
[    0.003476] [c000000002a0fd00] [c00000000201fa44] =
pnv_get_random_long_early+0x240/0x2e4
[    0.003623] [c000000002a0fe20] [c000000002060c38] =
random_init+0xc0/0x214
[    0.003749] [c000000002a0fec0] [c0000000020048bc] =
start_kernel+0x98c/0xbf4
[    0.003878] [c000000002a0ff90] [c00000000000d978] =
start_here_common+0x1c/0x24
[    0.004008] Instruction dump:
[    0.004063] 4e800020 60000000 60000000 60000000 7c0802a6 3c62fe65 =
7fe5fb78 3863a8e0
[    0.004216] f8010080 e89f0000 4ba14285 60000000 <0fe00000> 60000000 =
60000000 60000000
[    0.004372] ---[ end trace 0000000000000000 ]---
[    0.004456] ------------[ cut here ]------------
[    0.004537] refcount_t: addition on 0; use-after-free.
[    0.004645] WARNING: CPU: 0 PID: 0 at lib/refcount.c:25 =
refcount_warn_saturate+0x164/0x1f0
[    0.004797] Modules linked in:
[    0.004853] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         =
5.19.0-rc4-next-20220629 #1
[    0.005010] NIP:  c0000000006e0a54 LR: c0000000006e0a50 CTR: =
c0000000000d33a0
[    0.005134] REGS: c000000002a0f830 TRAP: 0700   Tainted: G        W   =
       (5.19.0-rc4-next-20220629)

Reverting the following patch helps avoid this warning.

commit f3eac426657d985b97c92fa5f7ae1d43f04721f3
    powerpc/powernv: wire up rng during setup_arch

I have attached the dmesg log.

Thanks
- Sachin


--Apple-Mail=_AD465ED9-8489-45F6-A24C-8CF796917EC1
Content-Disposition: attachment;
	filename=dmesg.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="dmesg.log"
Content-Transfer-Encoding: 7bit

[    0.000000] Reserving 512MB of memory at 128MB for crashkernel (System RAM: 65536MB)
[    0.000000] hash-mmu: Page sizes from device-tree:
[    0.000000] hash-mmu: base_shift=12: shift=12, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=0
[    0.000000] hash-mmu: base_shift=12: shift=16, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=7
[    0.000000] hash-mmu: base_shift=12: shift=24, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=56
[    0.000000] hash-mmu: base_shift=16: shift=16, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=1
[    0.000000] hash-mmu: base_shift=16: shift=24, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=8
[    0.000000] hash-mmu: base_shift=24: shift=24, sllp=0x0100, avpnm=0x00000001, tlbiel=0, penc=0
[    0.000000] hash-mmu: base_shift=34: shift=34, sllp=0x0120, avpnm=0x000007ff, tlbiel=0, penc=3
[    0.000000] Enabling pkeys with max key count 32
[    0.000000] Activating Kernel Userspace Access Prevention
[    0.000000] Activating Kernel Userspace Execution Prevention
[    0.000000] Page orders: linear mapping = 24, virtual = 16, io = 16, vmemmap = 24
[    0.000000] Using 1TB segments
[    0.000000] hash-mmu: Initializing hash mmu with SLB
[    0.000000] Linux version 5.19.0-rc4-next-20220629 (root@ltc-test-ci3.aus.stglabs.ibm.com) (gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-10), GNU ld version 2.30-113.el8) #1 SMP Wed Jun 29 10:46:57 PDT 2022
[    0.000000] Found initrd at 0xc000000003770000:0xc000000006df3b00
[    0.000000] Using PowerNV machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] CPU maps initialized for 8 threads per core
[    0.000000]  (thread shift is 3)
[    0.000000] Allocated 5120 bytes for 80 pacas
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x1000000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x80
[    0.000000] cpu_features      = 0x000002fb8f5db187
[    0.000000]   possible        = 0x000ffbfbcf5fb187
[    0.000000]   always          = 0x0000000380008181
[    0.000000] cpu_user_features = 0xdc0065c2 0xef000000
[    0.000000] mmu_features      = 0x7c006e01
[    0.000000] firmware_features = 0x0000000110000000
[    0.000000] vmalloc start     = 0xc008000000000000
[    0.000000] IO start          = 0xc00a000000000000
[    0.000000] vmemmap start     = 0xc00c000000000000
[    0.000000] hash-mmu: ppc64_pft_size    = 0x0
[    0.000000] hash-mmu: htab_hash_mask    = 0x7ffff
[    0.000000] -----------------------------------------------------
[    0.000000] numa:   NODE_DATA [mem 0x7ffc84480-0x7ffc8957f]
[    0.000000] numa:   NODE_DATA [mem 0xfffc5ef00-0xfffc63fff]
[    0.000000] kvm_cma_reserve: reserving 3276 MiB for global area
[    0.000000] cma: Reserved 3280 MiB at 0x0000000100000000
[    0.000000] rfi-flush: ori type flush available
[    0.000000] rfi-flush: patched 13 locations (ori type flush)
[    0.000000] count-cache-flush: flush disabled.
[    0.000000] link-stack-flush: flush disabled.
[    0.000000] entry-flush: patched 61 locations (no flush)
[    0.000000] uaccess-flush: patched 1 locations (no flush)
[    0.000000] stf-barrier: hwsync barrier available
[    0.000000] stf-barrier: patched 61 entry locations (hwsync barrier)
[    0.000000] stf-barrier: patched 13 exit locations (hwsync barrier)
[    0.000000] OPAL nvram setup, 1048576 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] barrier-nospec: patched 346 locations
[    0.000000] Top of RAM: 0x1000000000, Total RAM: 0x1000000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000000fffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x00000007ffffffff]
[    0.000000]   node   1: [mem 0x0000000800000000-0x0000000fffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000007ffffffff]
[    0.000000] Initmem setup node 1 [mem 0x0000000800000000-0x0000000fffffffff]
[    0.000000] percpu: Embedded 10 pages/cpu s590888 r0 d64472 u1048576
[    0.000000] pcpu-alloc: s590888 r0 d64472 u1048576 alloc=1*1048576
[    0.000000] pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0] 06 [0] 07 
[    0.000000] pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11 [0] 12 [0] 13 [0] 14 [0] 15 
[    0.000000] pcpu-alloc: [0] 16 [0] 17 [0] 18 [0] 19 [0] 20 [0] 21 [0] 22 [0] 23 
[    0.000000] pcpu-alloc: [0] 24 [0] 25 [0] 26 [0] 27 [0] 28 [0] 29 [0] 30 [0] 31 
[    0.000000] pcpu-alloc: [0] 32 [0] 33 [0] 34 [0] 35 [0] 36 [0] 37 [0] 38 [0] 39 
[    0.000000] pcpu-alloc: [1] 40 [1] 41 [1] 42 [1] 43 [1] 44 [1] 45 [1] 46 [1] 47 
[    0.000000] pcpu-alloc: [1] 48 [1] 49 [1] 50 [1] 51 [1] 52 [1] 53 [1] 54 [1] 55 
[    0.000000] pcpu-alloc: [1] 56 [1] 57 [1] 58 [1] 59 [1] 60 [1] 61 [1] 62 [1] 63 
[    0.000000] pcpu-alloc: [1] 64 [1] 65 [1] 66 [1] 67 [1] 68 [1] 69 [1] 70 [1] 71 
[    0.000000] pcpu-alloc: [1] 72 [1] 73 [1] 74 [1] 75 [1] 76 [1] 77 [1] 78 [1] 79 
[    0.000000] Fallback order for Node 0: 0 1 
[    0.000000] Fallback order for Node 1: 1 0 
[    0.000000] Built 2 zonelists, mobility grouping on.  Total pages: 1047552
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=UUID=80faafcc-e5c9-444b-ba6a-9ac745228f8c ro crashkernel=384M-2G:64M,2G-:512M ipv6.disable=1 
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 62853696K/67108864K available (13632K kernel code, 5568K rwdata, 4288K rodata, 5184K init, 2553K bss, 896448K reserved, 3358720K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=80, Nodes=2
[    0.000000] ftrace: allocating 34323 entries in 13 pages
[    0.000000] ftrace: allocated 13 pages with 3 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=80.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=80
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] ICS OPAL backend registered
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] time_init: decrementer frequency = 512.000000 MHz
[    0.000000] time_init: processor frequency   = 3425.000000 MHz
[    0.000001] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000184] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000303] clockevent: decrementer mult[83126e98] shift[32] cpu[0]
[    0.000397] ------------[ cut here ]------------
[    0.000478] kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is being called.
[    0.000667] WARNING: CPU: 0 PID: 0 at lib/kobject.c:626 kobject_get+0x90/0x100
[    0.000802] Modules linked in:
[    0.000861] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.19.0-rc4-next-20220629 #1
[    0.000995] NIP:  c00000000073b0c0 LR: c00000000073b0bc CTR: c0000000000d33a0
[    0.001120] REGS: c000000002a0f890 TRAP: 0700   Not tainted  (5.19.0-rc4-next-20220629)
[    0.001260] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    0.001428] CFAR: c00000000014f3a4 IRQMASK: 1 
               GPR00: c00000000073b0bc c000000002a0fb30 c000000002a12000 000000000000005c 
               GPR04: 00000000ffff7fff c000000002a0f8f0 c000000002a0f8e8 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0 
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 c000000000fe6e18 
               GPR24: 0000000000000000 c000000002a0fe90 c000000000fe6e08 0000000000000000 
               GPR28: 0000000000000000 c000000002952e80 c000000ffffc3f10 c000000002952e80 
[    0.002681] NIP [c00000000073b0c0] kobject_get+0x90/0x100
[    0.002781] LR [c00000000073b0bc] kobject_get+0x8c/0x100
[    0.002880] Call Trace:
[    0.002925] [c000000002a0fb30] [c00000000073b0bc] kobject_get+0x8c/0x100 (unreliable)
[    0.003071] [c000000002a0fba0] [c00000000087e464] device_add+0xf4/0xb00
[    0.003194] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
[    0.003321] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
[    0.003476] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
[    0.003623] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
[    0.003749] [c000000002a0fec0] [c0000000020048bc] start_kernel+0x98c/0xbf4
[    0.003878] [c000000002a0ff90] [c00000000000d978] start_here_common+0x1c/0x24
[    0.004008] Instruction dump:
[    0.004063] 4e800020 60000000 60000000 60000000 7c0802a6 3c62fe65 7fe5fb78 3863a8e0 
[    0.004216] f8010080 e89f0000 4ba14285 60000000 <0fe00000> 60000000 60000000 60000000 
[    0.004372] ---[ end trace 0000000000000000 ]---
[    0.004456] ------------[ cut here ]------------
[    0.004537] refcount_t: addition on 0; use-after-free.
[    0.004645] WARNING: CPU: 0 PID: 0 at lib/refcount.c:25 refcount_warn_saturate+0x164/0x1f0
[    0.004797] Modules linked in:
[    0.004853] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.19.0-rc4-next-20220629 #1
[    0.005010] NIP:  c0000000006e0a54 LR: c0000000006e0a50 CTR: c0000000000d33a0
[    0.005134] REGS: c000000002a0f830 TRAP: 0700   Tainted: G        W          (5.19.0-rc4-next-20220629)
[    0.005298] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    0.005466] CFAR: c00000000014f3a4 IRQMASK: 1 
               GPR00: c0000000006e0a50 c000000002a0fad0 c000000002a12000 000000000000002a 
               GPR04: 00000000ffff7fff c000000002a0f890 c000000002a0f888 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0 
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 c000000000fe6e18 
               GPR24: 0000000000000000 c000000002a0fe90 c000000000fe6e08 0000000000000000 
               GPR28: 0000000000000000 c000000002952e80 c000000ffffc3f10 c000000002952e80 
[    0.006718] NIP [c0000000006e0a54] refcount_warn_saturate+0x164/0x1f0
[    0.006836] LR [c0000000006e0a50] refcount_warn_saturate+0x160/0x1f0
[    0.006954] Call Trace:
[    0.006998] [c000000002a0fad0] [c0000000006e0a50] refcount_warn_saturate+0x160/0x1f0 (unreliable)
[    0.007162] [c000000002a0fb30] [c00000000073b120] kobject_get+0xf0/0x100
[    0.007287] [c000000002a0fba0] [c00000000087e464] device_add+0xf4/0xb00
[    0.007410] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
[    0.007536] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
[    0.007690] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
[    0.007835] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
[    0.007960] [c000000002a0fec0] [c0000000020048bc] start_kernel+0x98c/0xbf4
[    0.008088] [c000000002a0ff90] [c00000000000d978] start_here_common+0x1c/0x24
[    0.008218] Instruction dump:
[    0.008273] 8929552a 2f890000 409eff24 7c0802a6 39200001 3c62fe64 3d42fff7 38635ff8 
[    0.008426] 992a552a f8010070 4ba6e8f1 60000000 <0fe00000> 60000000 60000000 3d22fff7 
[    0.008582] ---[ end trace 0000000000000000 ]---
[    0.008665] ------------[ cut here ]------------
[    0.008746] kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is being called.
[    0.008931] WARNING: CPU: 0 PID: 0 at lib/kobject.c:626 kobject_get+0x90/0x100
[    0.009063] Modules linked in:
[    0.009119] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.19.0-rc4-next-20220629 #1
[    0.009275] NIP:  c00000000073b0c0 LR: c00000000073b0bc CTR: c0000000000d33a0
[    0.009400] REGS: c000000002a0f780 TRAP: 0700   Tainted: G        W          (5.19.0-rc4-next-20220629)
[    0.009563] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    0.009730] CFAR: c00000000014f3a4 IRQMASK: 1 
               GPR00: c00000000073b0bc c000000002a0fa20 c000000002a12000 000000000000005c 
               GPR04: 00000000ffff7fff c000000002a0f7e0 c000000002a0f7d8 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0 
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 c000000000fe6e18 
               GPR24: 0000000000000000 c000000002a0fe90 c000000000fe6e08 0000000000000000 
               GPR28: 0000000000000000 0000000000000000 c000000002952e80 c000000002952e80 
[    0.010985] NIP [c00000000073b0c0] kobject_get+0x90/0x100
[    0.011086] LR [c00000000073b0bc] kobject_get+0x8c/0x100
[    0.011186] Call Trace:
[    0.011230] [c000000002a0fa20] [c00000000073b0bc] kobject_get+0x8c/0x100 (unreliable)
[    0.011376] [c000000002a0fa90] [c00000000073c670] kobject_add_internal+0xa0/0x3f0
[    0.011516] [c000000002a0fb20] [c00000000073ca2c] kobject_add+0x6c/0xf0
[    0.011640] [c000000002a0fba0] [c00000000087e4bc] device_add+0x14c/0xb00
[    0.011765] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
[    0.011892] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
[    0.012048] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
[    0.012194] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
[    0.012320] [c000000002a0fec0] [c0000000020048bc] start_kernel+0x98c/0xbf4
[    0.012449] [c000000002a0ff90] [c00000000000d978] start_here_common+0x1c/0x24
[    0.012580] Instruction dump:
[    0.012635] 4e800020 60000000 60000000 60000000 7c0802a6 3c62fe65 7fe5fb78 3863a8e0 
[    0.012789] f8010080 e89f0000 4ba14285 60000000 <0fe00000> 60000000 60000000 60000000 
[    0.012947] ---[ end trace 0000000000000000 ]---
[    0.013029] ------------[ cut here ]------------
[    0.013110] refcount_t: saturated; leaking memory.
[    0.013214] WARNING: CPU: 0 PID: 0 at lib/refcount.c:22 refcount_warn_saturate+0x124/0x1f0
[    0.013366] Modules linked in:
[    0.013423] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.19.0-rc4-next-20220629 #1
[    0.013580] NIP:  c0000000006e0a14 LR: c0000000006e0a10 CTR: c0000000000d33a0
[    0.013706] REGS: c000000002a0f720 TRAP: 0700   Tainted: G        W          (5.19.0-rc4-next-20220629)
[    0.013870] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    0.014039] CFAR: c00000000014f3a4 IRQMASK: 1 
               GPR00: c0000000006e0a10 c000000002a0f9c0 c000000002a12000 0000000000000026 
               GPR04: 00000000ffff7fff c000000002a0f780 c000000002a0f778 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0 
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 c000000000fe6e18 
               GPR24: 0000000000000000 c000000002a0fe90 c000000000fe6e08 0000000000000000 
               GPR28: 0000000000000000 0000000000000000 c000000002952e80 c000000002952e80 
[    0.015300] NIP [c0000000006e0a14] refcount_warn_saturate+0x124/0x1f0
[    0.015419] LR [c0000000006e0a10] refcount_warn_saturate+0x120/0x1f0
[    0.015537] Call Trace:
[    0.015581] [c000000002a0f9c0] [c0000000006e0a10] refcount_warn_saturate+0x120/0x1f0 (unreliable)
[    0.015746] [c000000002a0fa20] [c00000000073b0f0] kobject_get+0xc0/0x100
[    0.015872] [c000000002a0fa90] [c00000000073c670] kobject_add_internal+0xa0/0x3f0
[    0.016012] [c000000002a0fb20] [c00000000073ca2c] kobject_add+0x6c/0xf0
[    0.016136] [c000000002a0fba0] [c00000000087e4bc] device_add+0x14c/0xb00
[    0.016261] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
[    0.016388] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
[    0.016543] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
[    0.016689] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
[    0.016815] [c000000002a0fec0] [c0000000020048bc] start_kernel+0x98c/0xbf4
[    0.016944] [c000000002a0ff90] [c00000000000d978] start_here_common+0x1c/0x24
[    0.017075] Instruction dump:
[    0.017130] 89295529 2f890000 409eff64 7c0802a6 39200001 3c62fe64 3d42fff7 38635fc0 
[    0.017284] 992a5529 f8010070 4ba6e931 60000000 <0fe00000> 60000000 60000000 3d22fff7 
[    0.017441] ---[ end trace 0000000000000000 ]---
[    0.017524] ------------[ cut here ]------------
[    0.017606] kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_put() is being called.
[    0.017791] WARNING: CPU: 0 PID: 0 at lib/kobject.c:720 kobject_put+0x80/0x100
[    0.017925] Modules linked in:
[    0.017981] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.19.0-rc4-next-20220629 #1
[    0.018139] NIP:  c00000000073bc60 LR: c00000000073bc5c CTR: c0000000000d33a0
[    0.018265] REGS: c000000002a0f780 TRAP: 0700   Tainted: G        W          (5.19.0-rc4-next-20220629)
[    0.018429] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    0.018598] CFAR: c00000000014f3a4 IRQMASK: 1 
               GPR00: c00000000073bc5c c000000002a0fa20 c000000002a12000 000000000000005c 
               GPR04: 00000000ffff7fff c000000002a0f7e0 c000000002a0f7d8 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0 
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 c000000000fe6e18 
               GPR24: 0000000000000000 c000000002a0fe90 c000000000fe6e08 0000000000000000 
               GPR28: c000000002952a60 c000000002952e80 fffffffffffffffe c000000002952e80 
[    0.019862] NIP [c00000000073bc60] kobject_put+0x80/0x100
[    0.019963] LR [c00000000073bc5c] kobject_put+0x7c/0x100
[    0.020063] Call Trace:
[    0.020107] [c000000002a0fa20] [c00000000073bc5c] kobject_put+0x7c/0x100 (unreliable)
[    0.020254] [c000000002a0fa90] [c00000000073c8f0] kobject_add_internal+0x320/0x3f0
[    0.020395] [c000000002a0fb20] [c00000000073ca2c] kobject_add+0x6c/0xf0
[    0.020520] [c000000002a0fba0] [c00000000087e4bc] device_add+0x14c/0xb00
[    0.020645] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
[    0.020772] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
[    0.020928] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
[    0.021074] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
[    0.021201] [c000000002a0fec0] [c0000000020048bc] start_kernel+0x98c/0xbf4
[    0.021330] [c000000002a0ff90] [c00000000000d978] start_here_common+0x1c/0x24
[    0.021461] Instruction dump:
[    0.021516] ebe1fff8 4e800020 60000000 60000000 7c0802a6 3c62fe65 7fe5fb78 3863aaa8 
[    0.021670] f8010080 e89f0000 4ba136e5 60000000 <0fe00000> 60000000 60000000 60000000 
[    0.021828] ---[ end trace 0000000000000000 ]---
[    0.021910] ------------[ cut here ]------------
[    0.021991] refcount_t: underflow; use-after-free.
[    0.022095] WARNING: CPU: 0 PID: 0 at lib/refcount.c:28 refcount_warn_saturate+0x1e4/0x1f0
[    0.022248] Modules linked in:
[    0.022304] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.19.0-rc4-next-20220629 #1
[    0.022462] NIP:  c0000000006e0ad4 LR: c0000000006e0ad0 CTR: c0000000000d33a0
[    0.022588] REGS: c000000002a0f720 TRAP: 0700   Tainted: G        W          (5.19.0-rc4-next-20220629)
[    0.022753] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    0.022921] CFAR: c00000000014f3a4 IRQMASK: 1 
               GPR00: c0000000006e0ad0 c000000002a0f9c0 c000000002a12000 0000000000000026 
               GPR04: 00000000ffff7fff c000000002a0f780 c000000002a0f778 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0 
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 c000000000fe6e18 
               GPR24: 0000000000000000 c000000002a0fe90 c000000000fe6e08 0000000000000000 
               GPR28: c000000002952a60 c000000002952e80 fffffffffffffffe c000000002952e80 
[    0.024183] NIP [c0000000006e0ad4] refcount_warn_saturate+0x1e4/0x1f0
[    0.024302] LR [c0000000006e0ad0] refcount_warn_saturate+0x1e0/0x1f0
[    0.024420] Call Trace:
[    0.024465] [c000000002a0f9c0] [c0000000006e0ad0] refcount_warn_saturate+0x1e0/0x1f0 (unreliable)
[    0.024630] [c000000002a0fa20] [c00000000073bcc0] kobject_put+0xe0/0x100
[    0.024755] [c000000002a0fa90] [c00000000073c8f0] kobject_add_internal+0x320/0x3f0
[    0.024896] [c000000002a0fb20] [c00000000073ca2c] kobject_add+0x6c/0xf0
[    0.025020] [c000000002a0fba0] [c00000000087e4bc] device_add+0x14c/0xb00
[    0.025145] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
[    0.025272] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
[    0.025428] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
[    0.025574] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
[    0.025700] [c000000002a0fec0] [c0000000020048bc] start_kernel+0x98c/0xbf4
[    0.025829] [c000000002a0ff90] [c00000000000d978] start_here_common+0x1c/0x24
[    0.025960] Instruction dump:
[    0.026014] 7c0803a6 4bfffea8 60000000 7c0802a6 39200001 3c62fe64 3d42fff7 38636028 
[    0.026168] 992a552b f8010070 4ba6e871 60000000 <0fe00000> 60000000 60000000 3c4c0233 
[    0.026325] ---[ end trace 0000000000000000 ]---
[    0.026408] kobject_add_internal failed for 3ffff40000000.hwrng (error: -2 parent: (null))
[    0.026553] ------------[ cut here ]------------
[    0.026634] kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_put() is being called.
[    0.026820] WARNING: CPU: 0 PID: 0 at lib/kobject.c:720 kobject_put+0x80/0x100
[    0.026954] Modules linked in:
[    0.027011] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.19.0-rc4-next-20220629 #1
[    0.027168] NIP:  c00000000073bc60 LR: c00000000073bc5c CTR: c0000000000d33a0
[    0.027294] REGS: c000000002a0f890 TRAP: 0700   Tainted: G        W          (5.19.0-rc4-next-20220629)
[    0.027457] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    0.027626] CFAR: c00000000014f3a4 IRQMASK: 1 
               GPR00: c00000000073bc5c c000000002a0fb30 c000000002a12000 000000000000005c 
               GPR04: 00000000ffff7fff c000000002a0f8f0 c000000002a0f8e8 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0 
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 c000000000fe6e18 
               GPR24: 0000000000000000 c000000002a0fe90 c000000000fe6e08 0000000000000000 
               GPR28: 0000000000000000 c000000002952e80 fffffffffffffffe c000000002952e80 
[    0.028886] NIP [c00000000073bc60] kobject_put+0x80/0x100
[    0.028988] LR [c00000000073bc5c] kobject_put+0x7c/0x100
[    0.029087] Call Trace:
[    0.029131] [c000000002a0fb30] [c00000000073bc5c] kobject_put+0x7c/0x100 (unreliable)
[    0.029278] [c000000002a0fba0] [c00000000087e508] device_add+0x198/0xb00
[    0.029404] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
[    0.029531] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
[    0.029686] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
[    0.029832] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
[    0.029959] [c000000002a0fec0] [c0000000020048bc] start_kernel+0x98c/0xbf4
[    0.030087] [c000000002a0ff90] [c00000000000d978] start_here_common+0x1c/0x24
[    0.030217] Instruction dump:
[    0.030272] ebe1fff8 4e800020 60000000 60000000 7c0802a6 3c62fe65 7fe5fb78 3863aaa8 
[    0.030426] f8010080 e89f0000 4ba136e5 60000000 <0fe00000> 60000000 60000000 60000000 
[    0.030583] ---[ end trace 0000000000000000 ]---
[    0.032089] ------------[ cut here ]------------
[    0.032170] kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is being called.
[    0.032356] WARNING: CPU: 0 PID: 0 at lib/kobject.c:626 kobject_get+0x90/0x100
[    0.032489] Modules linked in:
[    0.032546] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.19.0-rc4-next-20220629 #1
[    0.032703] NIP:  c00000000073b0c0 LR: c00000000073b0bc CTR: c0000000000d33a0
[    0.032829] REGS: c000000002a0f890 TRAP: 0700   Tainted: G        W          (5.19.0-rc4-next-20220629)
[    0.032993] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    0.033162] CFAR: c00000000014f3a4 IRQMASK: 1 
               GPR00: c00000000073b0bc c000000002a0fb30 c000000002a12000 000000000000005c 
               GPR04: 00000000ffff7fff c000000002a0f8f0 c000000002a0f8e8 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0 
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 c000000000fe6e18 
               GPR24: 0000000000000001 c000000002a0fe90 c000000000fe6e08 0000000000000000 
               GPR28: 0000000000000000 c000000002952e80 c000000ffffc4208 c000000002952e80 
[    0.034425] NIP [c00000000073b0c0] kobject_get+0x90/0x100
[    0.034526] LR [c00000000073b0bc] kobject_get+0x8c/0x100
[    0.034625] Call Trace:
[    0.034669] [c000000002a0fb30] [c00000000073b0bc] kobject_get+0x8c/0x100 (unreliable)
[    0.034816] [c000000002a0fba0] [c00000000087e464] device_add+0xf4/0xb00
[    0.034940] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
[    0.035066] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
[    0.035222] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
[    0.035368] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
[    0.035494] [c000000002a0fec0] [c0000000020048bc] start_kernel+0x98c/0xbf4
[    0.035623] [c000000002a0ff90] [c00000000000d978] start_here_common+0x1c/0x24
[    0.035753] Instruction dump:
[    0.035808] 4e800020 60000000 60000000 60000000 7c0802a6 3c62fe65 7fe5fb78 3863a8e0 
[    0.035962] f8010080 e89f0000 4ba14285 60000000 <0fe00000> 60000000 60000000 60000000 
[    0.036119] ---[ end trace 0000000000000000 ]---
[    0.036202] ------------[ cut here ]------------
[    0.036283] kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is being called.
[    0.036469] WARNING: CPU: 0 PID: 0 at lib/kobject.c:626 kobject_get+0x90/0x100
[    0.036602] Modules linked in:
[    0.036659] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.19.0-rc4-next-20220629 #1
[    0.036817] NIP:  c00000000073b0c0 LR: c00000000073b0bc CTR: c0000000000d33a0
[    0.036943] REGS: c000000002a0f780 TRAP: 0700   Tainted: G        W          (5.19.0-rc4-next-20220629)
[    0.037107] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    0.037276] CFAR: c00000000014f3a4 IRQMASK: 1 
               GPR00: c00000000073b0bc c000000002a0fa20 c000000002a12000 000000000000005c 
               GPR04: 00000000ffff7fff c000000002a0f7e0 c000000002a0f7d8 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0 
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 c000000000fe6e18 
               GPR24: 0000000000000001 c000000002a0fe90 c000000000fe6e08 0000000000000000 
               GPR28: 0000000000000000 0000000000000000 c000000002952e80 c000000002952e80 
[    0.038537] NIP [c00000000073b0c0] kobject_get+0x90/0x100
[    0.038638] LR [c00000000073b0bc] kobject_get+0x8c/0x100
[    0.038737] Call Trace:
[    0.038781] [c000000002a0fa20] [c00000000073b0bc] kobject_get+0x8c/0x100 (unreliable)
[    0.038928] [c000000002a0fa90] [c00000000073c670] kobject_add_internal+0xa0/0x3f0
[    0.039067] [c000000002a0fb20] [c00000000073ca2c] kobject_add+0x6c/0xf0
[    0.039191] [c000000002a0fba0] [c00000000087e4bc] device_add+0x14c/0xb00
[    0.039316] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
[    0.039443] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
[    0.039599] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
[    0.039746] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
[    0.039873] [c000000002a0fec0] [c0000000020048bc] start_kernel+0x98c/0xbf4
[    0.040001] [c000000002a0ff90] [c00000000000d978] start_here_common+0x1c/0x24
[    0.040132] Instruction dump:
[    0.040187] 4e800020 60000000 60000000 60000000 7c0802a6 3c62fe65 7fe5fb78 3863a8e0 
[    0.040341] f8010080 e89f0000 4ba14285 60000000 <0fe00000> 60000000 60000000 60000000 
[    0.040498] ---[ end trace 0000000000000000 ]---
[    0.040581] ------------[ cut here ]------------
[    0.040662] kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_put() is being called.
[    0.040849] WARNING: CPU: 0 PID: 0 at lib/kobject.c:720 kobject_put+0x80/0x100
[    0.040982] Modules linked in:
[    0.041039] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.19.0-rc4-next-20220629 #1
[    0.041195] NIP:  c00000000073bc60 LR: c00000000073bc5c CTR: c0000000000d33a0
[    0.041321] REGS: c000000002a0f780 TRAP: 0700   Tainted: G        W          (5.19.0-rc4-next-20220629)
[    0.041486] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    0.041654] CFAR: c00000000014f3a4 IRQMASK: 1 
               GPR00: c00000000073bc5c c000000002a0fa20 c000000002a12000 000000000000005c 
               GPR04: 00000000ffff7fff c000000002a0f7e0 c000000002a0f7d8 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0 
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 c000000000fe6e18 
               GPR24: 0000000000000001 c000000002a0fe90 c000000000fe6e08 0000000000000000 
               GPR28: c000000002952a60 c000000002952e80 fffffffffffffffe c000000002952e80 
[    0.042914] NIP [c00000000073bc60] kobject_put+0x80/0x100
[    0.043015] LR [c00000000073bc5c] kobject_put+0x7c/0x100
[    0.043114] Call Trace:
[    0.043159] [c000000002a0fa20] [c00000000073bc5c] kobject_put+0x7c/0x100 (unreliable)
[    0.043305] [c000000002a0fa90] [c00000000073c8f0] kobject_add_internal+0x320/0x3f0
[    0.043445] [c000000002a0fb20] [c00000000073ca2c] kobject_add+0x6c/0xf0
[    0.043570] [c000000002a0fba0] [c00000000087e4bc] device_add+0x14c/0xb00
[    0.043695] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
[    0.043821] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
[    0.043977] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
[    0.044122] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
[    0.044248] [c000000002a0fec0] [c0000000020048bc] start_kernel+0x98c/0xbf4
[    0.044377] [c000000002a0ff90] [c00000000000d978] start_here_common+0x1c/0x24
[    0.044508] Instruction dump:
[    0.044563] ebe1fff8 4e800020 60000000 60000000 7c0802a6 3c62fe65 7fe5fb78 3863aaa8 
[    0.044717] f8010080 e89f0000 4ba136e5 60000000 <0fe00000> 60000000 60000000 60000000 
[    0.044874] ---[ end trace 0000000000000000 ]---
[    0.044956] kobject_add_internal failed for 3ffff40001000.hwrng (error: -2 parent: (null))
[    0.045101] ------------[ cut here ]------------
[    0.045182] kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_put() is being called.
[    0.045368] WARNING: CPU: 0 PID: 0 at lib/kobject.c:720 kobject_put+0x80/0x100
[    0.045501] Modules linked in:
[    0.045558] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.19.0-rc4-next-20220629 #1
[    0.045715] NIP:  c00000000073bc60 LR: c00000000073bc5c CTR: c0000000000d33a0
[    0.045841] REGS: c000000002a0f890 TRAP: 0700   Tainted: G        W          (5.19.0-rc4-next-20220629)
[    0.046005] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    0.046175] CFAR: c00000000014f3a4 IRQMASK: 1 
               GPR00: c00000000073bc5c c000000002a0fb30 c000000002a12000 000000000000005c 
               GPR04: 00000000ffff7fff c000000002a0f8f0 c000000002a0f8e8 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c000000002d00000 0000000000000003 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0 
               GPR20: c000000002a52238 c000000002a52820 c0000000000d8d60 c000000000fe6e18 
               GPR24: 0000000000000001 c000000002a0fe90 c000000000fe6e08 0000000000000000 
               GPR28: 0000000000000000 c000000002952e80 fffffffffffffffe c000000002952e80 
[    0.047438] NIP [c00000000073bc60] kobject_put+0x80/0x100
[    0.047539] LR [c00000000073bc5c] kobject_put+0x7c/0x100
[    0.047639] Call Trace:
[    0.047683] [c000000002a0fb30] [c00000000073bc5c] kobject_put+0x7c/0x100 (unreliable)
[    0.047830] [c000000002a0fba0] [c00000000087e508] device_add+0x198/0xb00
[    0.047955] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
[    0.048082] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
[    0.048238] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
[    0.048384] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
[    0.048510] [c000000002a0fec0] [c0000000020048bc] start_kernel+0x98c/0xbf4
[    0.048640] [c000000002a0ff90] [c00000000000d978] start_here_common+0x1c/0x24
[    0.048771] Instruction dump:
[    0.048826] ebe1fff8 4e800020 60000000 60000000 7c0802a6 3c62fe65 7fe5fb78 3863aaa8 
[    0.048980] f8010080 e89f0000 4ba136e5 60000000 <0fe00000> 60000000 60000000 60000000 
[    0.049137] ---[ end trace 0000000000000000 ]---
[    0.049517] Console: colour dummy device 80x25
[    0.049602] printk: console [hvc0] enabled
[    0.049681] printk: bootconsole [udbg0] disabled
[    0.049929] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.049950] pid_max: default: 81920 minimum: 640
[    0.050361] LSM: Security Framework initializing
[    0.050441] Yama: becoming mindful.
[    0.050484] SELinux:  Initializing.
[    0.050492] SELinux: CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE is non-zero.  This is deprecated and will be rejected in a future kernel release.
[    0.050509] SELinux: https://github.com/SELinuxProject/selinux-kernel/wiki/DEPRECATE-checkreqprot
[    0.055083] Dentry cache hash table entries: 8388608 (order: 10, 67108864 bytes, vmalloc)
[    0.057335] Inode-cache hash table entries: 4194304 (order: 9, 33554432 bytes, vmalloc)
[    0.057515] Mount-cache hash table entries: 131072 (order: 4, 1048576 bytes, vmalloc)
[    0.057597] Mountpoint-cache hash table entries: 131072 (order: 4, 1048576 bytes, vmalloc)
[    0.059538] cblist_init_generic: Setting adjustable number of callback queues.
[    0.059588] cblist_init_generic: Setting shift to 7 and lim to 1.
[    0.059641] POWER8 performance monitor hardware support registered
[    0.059695] power8-pmu: PMAO restore workaround active.
[    0.059753] rcu: Hierarchical SRCU implementation.
[    0.063378] smp: Bringing up secondary CPUs ...
[    0.119186] smp: Brought up 2 nodes, 80 CPUs
[    0.119216] numa: Node 0 CPUs: 0-39
[    0.119240] numa: Node 1 CPUs: 40-79
[    0.140022] devtmpfs: initialized
[    0.165433] Initializing IODA2 PHB (/pciex@3fffe40000000)
[    0.165533] PCI host bridge /pciex@3fffe40000000 (primary) ranges:
[    0.165567]  MEM 0x00003fe000000000..0x00003fe07ffeffff -> 0x0000000080000000 
[    0.165886]  MEM 0x0000200000000000..0x000020ffffffffff -> 0x0000200000000000 (M64 #0..15)
[    0.165909]  Using M64 #15 as default window
[    0.165973]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.165991]                  M64: 0x10000000000 [segment=0x100000000]
[    0.166008]   Allocated bitmap for 2040 MSIs (base IRQ 0x800)
[    0.167627] Initializing IODA2 PHB (/pciex@3fffe40100000)
[    0.167732] PCI host bridge /pciex@3fffe40100000  ranges:
[    0.167759]  MEM 0x00003fe080000000..0x00003fe0fffeffff -> 0x0000000080000000 
[    0.168072]  MEM 0x0000210000000000..0x000021ffffffffff -> 0x0000210000000000 (M64 #0..15)
[    0.168094]  Using M64 #15 as default window
[    0.168150]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.168168]                  M64: 0x10000000000 [segment=0x100000000]
[    0.168185]   Allocated bitmap for 2040 MSIs (base IRQ 0x1000)
[    0.169809] Initializing IODA2 PHB (/pciex@3fffe40400000)
[    0.169892] PCI host bridge /pciex@3fffe40400000  ranges:
[    0.169920]  MEM 0x00003fe200000000..0x00003fe27ffeffff -> 0x0000000080000000 
[    0.170233]  MEM 0x0000240000000000..0x000024ffffffffff -> 0x0000240000000000 (M64 #0..15)
[    0.170255]  Using M64 #15 as default window
[    0.170311]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.170329]                  M64: 0x10000000000 [segment=0x100000000]
[    0.170346]   Allocated bitmap for 2040 MSIs (base IRQ 0x2800)
[    0.172025] Initializing IODA2 PHB (/pciex@3fffe40500000)
[    0.172129] PCI host bridge /pciex@3fffe40500000  ranges:
[    0.172156]  MEM 0x00003fe280000000..0x00003fe2fffeffff -> 0x0000000080000000 
[    0.172468]  MEM 0x0000250000000000..0x000025ffffffffff -> 0x0000250000000000 (M64 #0..15)
[    0.172490]  Using M64 #15 as default window
[    0.172547]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.172565]                  M64: 0x10000000000 [segment=0x100000000]
[    0.172582]   Allocated bitmap for 2040 MSIs (base IRQ 0x3000)
[    0.174755] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.174824] futex hash table entries: 32768 (order: 6, 4194304 bytes, vmalloc)
[    0.182339] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.182815] audit: initializing netlink subsys (disabled)
[    0.183176] audit: type=2000 audit(1656526170.140:1): state=initialized audit_enabled=0 res=1
[    0.183457] thermal_sys: Registered thermal governor 'fair_share'
[    0.183462] thermal_sys: Registered thermal governor 'step_wise'
[    0.183923] cpuidle: using governor menu
[    0.184690] pstore: Registered nvram as persistent store backend
[    0.185896] EEH: PowerNV platform initialized
[    0.252204] PCI: Probing PCI hardware
[    0.252577] PCI host bridge to bus 0000:00
[    0.252594] pci_bus 0000:00: root bus resource [mem 0x3fe000000000-0x3fe07ffeffff] (bus address [0x80000000-0xfffeffff])
[    0.252622] pci_bus 0000:00: root bus resource [mem 0x200000000000-0x20fdffffffff 64bit pref]
[    0.252648] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.252667] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.252753] pci 0000:00:00.0: [1014:03dc] type 01 class 0x060400
[    0.253052] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
[    0.258859] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    0.258940] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.259733] PCI host bridge to bus 0001:00
[    0.259749] pci_bus 0001:00: root bus resource [mem 0x3fe080000000-0x3fe0fffeffff] (bus address [0x80000000-0xfffeffff])
[    0.259775] pci_bus 0001:00: root bus resource [mem 0x210000000000-0x21fdffffffff 64bit pref]
[    0.259800] pci_bus 0001:00: root bus resource [bus 00-ff]
[    0.259818] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to ff
[    0.259889] pci 0001:00:00.0: [1014:03dc] type 01 class 0x060400
[    0.260172] pci 0001:00:00.0: PME# supported from D0 D3hot D3cold
[    0.263344] pci 0001:01:00.0: [10b5:8732] type 01 class 0x060400
[    0.263410] pci 0001:01:00.0: reg 0x10: [mem 0x3fe081800000-0x3fe08183ffff]
[    0.263855] pci 0001:01:00.0: PME# supported from D0 D3hot D3cold
[    0.267020] pci 0001:00:00.0: PCI bridge to [bus 01-0d]
[    0.267367] pci 0001:02:01.0: [10b5:8732] type 01 class 0x060400
[    0.267868] pci 0001:02:01.0: PME# supported from D0 D3hot D3cold
[    0.268939] pci 0001:02:08.0: [10b5:8732] type 01 class 0x060400
[    0.269447] pci 0001:02:08.0: PME# supported from D0 D3hot D3cold
[    0.270018] pci 0001:02:09.0: [10b5:8732] type 01 class 0x060400
[    0.270534] pci 0001:02:09.0: PME# supported from D0 D3hot D3cold
[    0.272907] pci 0001:01:00.0: PCI bridge to [bus 02-0d]
[    0.275794] pci 0001:02:01.0: PCI bridge to [bus 03-07]
[    0.276077] pci 0001:08:00.0: [1014:034a] type 00 class 0x010400
[    0.276159] pci 0001:08:00.0: reg 0x10: [mem 0x3fe080820000-0x3fe08082ffff 64bit]
[    0.276224] pci 0001:08:00.0: reg 0x18: [mem 0x3fe080830000-0x3fe08083ffff 64bit]
[    0.276327] pci 0001:08:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    0.276594] pci 0001:08:00.0: PME# supported from D0 D3hot D3cold
[    0.276782] pci 0001:08:00.0: 63.008 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x8 link at 0001:00:00.0 (capable of 126.016 Gb/s with 8.0 GT/s PCIe x16 link)
[    0.279722] pci 0001:02:08.0: PCI bridge to [bus 08]
[    0.282619] pci 0001:02:09.0: PCI bridge to [bus 09-0d]
[    0.282769] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to 0d
[    0.283168] PCI host bridge to bus 0004:00
[    0.283183] pci_bus 0004:00: root bus resource [mem 0x3fe200000000-0x3fe27ffeffff] (bus address [0x80000000-0xfffeffff])
[    0.283210] pci_bus 0004:00: root bus resource [mem 0x240000000000-0x24fdffffffff 64bit pref]
[    0.283234] pci_bus 0004:00: root bus resource [bus 00-ff]
[    0.283253] pci_bus 0004:00: busn_res: [bus 00-ff] end is updated to ff
[    0.283325] pci 0004:00:00.0: [1014:03dc] type 01 class 0x060400
[    0.283617] pci 0004:00:00.0: PME# supported from D0 D3hot D3cold
[    0.289400] pci 0004:00:00.0: PCI bridge to [bus 01-ff]
[    0.289480] pci_bus 0004:00: busn_res: [bus 00-ff] end is updated to ff
[    0.290524] PCI host bridge to bus 0005:00
[    0.290539] pci_bus 0005:00: root bus resource [mem 0x3fe280000000-0x3fe2fffeffff] (bus address [0x80000000-0xfffeffff])
[    0.290566] pci_bus 0005:00: root bus resource [mem 0x250000000000-0x25fdffffffff 64bit pref]
[    0.290591] pci_bus 0005:00: root bus resource [bus 00-ff]
[    0.290609] pci_bus 0005:00: busn_res: [bus 00-ff] end is updated to ff
[    0.290680] pci 0005:00:00.0: [1014:03dc] type 01 class 0x060400
[    0.290970] pci 0005:00:00.0: PME# supported from D0 D3hot D3cold
[    0.294173] pci 0005:01:00.0: [10b5:8748] type 01 class 0x060400
[    0.294239] pci 0005:01:00.0: reg 0x10: [mem 0x3fe282800000-0x3fe28283ffff]
[    0.294686] pci 0005:01:00.0: PME# supported from D0 D3hot D3cold
[    0.297872] pci 0005:00:00.0: PCI bridge to [bus 01-13]
[    0.298224] pci 0005:02:01.0: [10b5:8748] type 01 class 0x060400
[    0.298734] pci 0005:02:01.0: PME# supported from D0 D3hot D3cold
[    0.299812] pci 0005:02:08.0: [10b5:8748] type 01 class 0x060400
[    0.300332] pci 0005:02:08.0: PME# supported from D0 D3hot D3cold
[    0.300905] pci 0005:02:09.0: [10b5:8748] type 01 class 0x060400
[    0.301432] pci 0005:02:09.0: PME# supported from D0 D3hot D3cold
[    0.302530] pci 0005:02:10.0: [10b5:8748] type 01 class 0x060400
[    0.303067] pci 0005:02:10.0: PME# supported from D0 D3hot D3cold
[    0.303715] pci 0005:02:11.0: [10b5:8748] type 01 class 0x060400
[    0.304259] pci 0005:02:11.0: PME# supported from D0 D3hot D3cold
[    0.305976] pci 0005:01:00.0: PCI bridge to [bus 02-13]
[    0.306259] pci 0005:03:00.0: [104c:8241] type 00 class 0x0c0330
[    0.306350] pci 0005:03:00.0: reg 0x10: [mem 0x3fe280000000-0x3fe28000ffff 64bit]
[    0.306418] pci 0005:03:00.0: reg 0x18: [mem 0x3fe280010000-0x3fe280011fff 64bit]
[    0.306580] pci 0005:03:00.0: BAR2 [mem size 0x00002000 64bit]: requesting alignment to 0x10000
[    0.306790] pci 0005:03:00.0: supports D1 D2
[    0.306807] pci 0005:03:00.0: PME# supported from D0 D1 D2 D3hot
[    0.309963] pci 0005:02:01.0: PCI bridge to [bus 03]
[    0.312860] pci 0005:02:08.0: PCI bridge to [bus 04-08]
[    0.313166] pci 0005:09:00.0: [14e4:1657] type 00 class 0x020000
[    0.313261] pci 0005:09:00.0: reg 0x10: [mem 0x250100000000-0x25010000ffff 64bit pref]
[    0.313331] pci 0005:09:00.0: reg 0x18: [mem 0x250100010000-0x25010001ffff 64bit pref]
[    0.313401] pci 0005:09:00.0: reg 0x20: [mem 0x250100020000-0x25010002ffff 64bit pref]
[    0.313454] pci 0005:09:00.0: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.313849] pci 0005:09:00.0: PME# supported from D0 D3hot D3cold
[    0.314402] pci 0005:09:00.1: [14e4:1657] type 00 class 0x020000
[    0.314498] pci 0005:09:00.1: reg 0x10: [mem 0x250100030000-0x25010003ffff 64bit pref]
[    0.314568] pci 0005:09:00.1: reg 0x18: [mem 0x250100040000-0x25010004ffff 64bit pref]
[    0.314638] pci 0005:09:00.1: reg 0x20: [mem 0x250100050000-0x25010005ffff 64bit pref]
[    0.314692] pci 0005:09:00.1: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.315092] pci 0005:09:00.1: PME# supported from D0 D3hot D3cold
[    0.315582] pci 0005:09:00.2: [14e4:1657] type 00 class 0x020000
[    0.315680] pci 0005:09:00.2: reg 0x10: [mem 0x250100060000-0x25010006ffff 64bit pref]
[    0.315751] pci 0005:09:00.2: reg 0x18: [mem 0x250100070000-0x25010007ffff 64bit pref]
[    0.315824] pci 0005:09:00.2: reg 0x20: [mem 0x250100080000-0x25010008ffff 64bit pref]
[    0.315878] pci 0005:09:00.2: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.316287] pci 0005:09:00.2: PME# supported from D0 D3hot D3cold
[    0.316777] pci 0005:09:00.3: [14e4:1657] type 00 class 0x020000
[    0.316874] pci 0005:09:00.3: reg 0x10: [mem 0x250100090000-0x25010009ffff 64bit pref]
[    0.316946] pci 0005:09:00.3: reg 0x18: [mem 0x2501000a0000-0x2501000affff 64bit pref]
[    0.317019] pci 0005:09:00.3: reg 0x20: [mem 0x2501000b0000-0x2501000bffff 64bit pref]
[    0.317073] pci 0005:09:00.3: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.317480] pci 0005:09:00.3: PME# supported from D0 D3hot D3cold
[    0.346771] pci 0005:02:09.0: PCI bridge to [bus 09]
[    0.349682] pci 0005:02:10.0: PCI bridge to [bus 0a-0e]
[    0.352586] pci 0005:02:11.0: PCI bridge to [bus 0f-13]
[    0.352769] pci_bus 0005:00: busn_res: [bus 00-ff] end is updated to 13
[    0.352806] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    0.352852] pci_bus 0000:00: resource 4 [mem 0x3fe000000000-0x3fe07ffeffff]
[    0.352873] pci_bus 0000:00: resource 5 [mem 0x200000000000-0x20fdffffffff 64bit pref]
[    0.352897] pci 0001:02:01.0: bridge window [io  0x1000-0x0fff] to [bus 03-07] add_size 1000
[    0.352924] pci 0001:02:01.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 03-07] add_size 100000000 add_align 100000000
[    0.352955] pci 0001:02:01.0: bridge window [mem 0x00800000-0x007fffff] to [bus 03-07] add_size 800000 add_align 800000
[    0.352984] pci 0001:02:08.0: bridge window [io  0x1000-0x0fff] to [bus 08] add_size 1000
[    0.353009] pci 0001:02:08.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 08] add_size 100000000 add_align 100000000
[    0.353042] pci 0001:02:09.0: bridge window [io  0x1000-0x0fff] to [bus 09-0d] add_size 1000
[    0.353067] pci 0001:02:09.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 09-0d] add_size 100000000 add_align 100000000
[    0.353098] pci 0001:02:09.0: bridge window [mem 0x00800000-0x007fffff] to [bus 09-0d] add_size 800000 add_align 800000
[    0.353128] pci 0001:01:00.0: bridge window [io  0x1000-0x0fff] to [bus 02-0d] add_size 3000
[    0.353155] pci 0001:01:00.0: bridge window [mem 0x100000000-0x3ffffffff 64bit pref] to [bus 02-0d] add_size 300000000 add_align 100000000
[    0.353188] pci 0001:01:00.0: bridge window [mem 0x00800000-0x01ffffff] to [bus 02-0d] add_size 1000000 add_align 800000
[    0.353217] pci 0001:00:00.0: bridge window [io  0x1000-0x0fff] to [bus 01-0d] add_size 3000
[    0.353243] pci 0001:00:00.0: bridge window [mem 0x100000000-0x3ffffffff 64bit pref] to [bus 01-0d] add_size 300000000 add_align 100000000
[    0.353275] pci 0001:00:00.0: bridge window [mem 0x00800000-0x027fffff] to [bus 01-0d] add_size 1000000 add_align 800000
[    0.353310] pci 0001:00:00.0: BAR 15: assigned [mem 0x210000000000-0x2105ffffffff 64bit pref]
[    0.353336] pci 0001:00:00.0: BAR 14: assigned [mem 0x3fe080000000-0x3fe082ffffff]
[    0.353359] pci 0001:00:00.0: BAR 13: no space for [io  size 0x3000]
[    0.353378] pci 0001:00:00.0: BAR 13: failed to assign [io  size 0x3000]
[    0.353401] pci 0001:00:00.0: BAR 13: no space for [io  size 0x3000]
[    0.353420] pci 0001:00:00.0: BAR 13: failed to assign [io  size 0x3000]
[    0.353445] pci 0001:01:00.0: BAR 15: assigned [mem 0x210000000000-0x2105ffffffff 64bit pref]
[    0.353470] pci 0001:01:00.0: BAR 14: assigned [mem 0x3fe080000000-0x3fe0827fffff]
[    0.353492] pci 0001:01:00.0: BAR 0: assigned [mem 0x3fe082800000-0x3fe08283ffff]
[    0.353522] pci 0001:01:00.0: BAR 13: no space for [io  size 0x3000]
[    0.353542] pci 0001:01:00.0: BAR 13: failed to assign [io  size 0x3000]
[    0.353564] pci 0001:01:00.0: BAR 13: no space for [io  size 0x3000]
[    0.353584] pci 0001:01:00.0: BAR 13: failed to assign [io  size 0x3000]
[    0.353613] pci 0001:02:01.0: BAR 15: assigned [mem 0x210000000000-0x2100ffffffff 64bit pref]
[    0.353638] pci 0001:02:08.0: BAR 15: assigned [mem 0x210100000000-0x2101ffffffff 64bit pref]
[    0.353663] pci 0001:02:09.0: BAR 15: assigned [mem 0x210200000000-0x2102ffffffff 64bit pref]
[    0.353688] pci 0001:02:01.0: BAR 14: assigned [mem 0x3fe080000000-0x3fe0807fffff]
[    0.353711] pci 0001:02:08.0: BAR 14: assigned [mem 0x3fe080800000-0x3fe080ffffff]
[    0.353734] pci 0001:02:09.0: BAR 14: assigned [mem 0x3fe081000000-0x3fe0817fffff]
[    0.353756] pci 0001:02:01.0: BAR 13: no space for [io  size 0x1000]
[    0.353776] pci 0001:02:01.0: BAR 13: failed to assign [io  size 0x1000]
[    0.353796] pci 0001:02:08.0: BAR 13: no space for [io  size 0x1000]
[    0.353815] pci 0001:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[    0.353835] pci 0001:02:09.0: BAR 13: no space for [io  size 0x1000]
[    0.353855] pci 0001:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[    0.353879] pci 0001:02:09.0: BAR 13: no space for [io  size 0x1000]
[    0.353898] pci 0001:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[    0.353923] pci 0001:02:08.0: BAR 13: no space for [io  size 0x1000]
[    0.353942] pci 0001:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[    0.353962] pci 0001:02:01.0: BAR 13: no space for [io  size 0x1000]
[    0.353981] pci 0001:02:01.0: BAR 13: failed to assign [io  size 0x1000]
[    0.354002] pci 0001:02:01.0: PCI bridge to [bus 03-07]
[    0.354029] pci 0001:02:01.0:   bridge window [mem 0x3fe080000000-0x3fe0807fffff]
[    0.354057] pci 0001:02:01.0:   bridge window [mem 0x210000000000-0x2100ffffffff 64bit pref]
[    0.354097] pci 0001:08:00.0: BAR 6: assigned [mem 0x3fe080800000-0x3fe08081ffff pref]
[    0.354121] pci 0001:08:00.0: BAR 0: assigned [mem 0x3fe080820000-0x3fe08082ffff 64bit]
[    0.354172] pci 0001:08:00.0: BAR 2: assigned [mem 0x3fe080830000-0x3fe08083ffff 64bit]
[    0.354224] pci 0001:02:08.0: PCI bridge to [bus 08]
[    0.354250] pci 0001:02:08.0:   bridge window [mem 0x3fe080800000-0x3fe080ffffff]
[    0.354279] pci 0001:02:08.0:   bridge window [mem 0x210100000000-0x2101ffffffff 64bit pref]
[    0.354316] pci 0001:02:09.0: PCI bridge to [bus 09-0d]
[    0.354343] pci 0001:02:09.0:   bridge window [mem 0x3fe081000000-0x3fe0817fffff]
[    0.354371] pci 0001:02:09.0:   bridge window [mem 0x210200000000-0x2102ffffffff 64bit pref]
[    0.354408] pci 0001:01:00.0: PCI bridge to [bus 02-0d]
[    0.354434] pci 0001:01:00.0:   bridge window [mem 0x3fe080000000-0x3fe0ffefffff]
[    0.354462] pci 0001:01:00.0:   bridge window [mem 0x210000000000-0x21fdfff0ffff 64bit pref]
[    0.354498] pci 0001:00:00.0: PCI bridge to [bus 01-0d]
[    0.354524] pci 0001:00:00.0:   bridge window [mem 0x3fe080000000-0x3fe0ffefffff]
[    0.354552] pci 0001:00:00.0:   bridge window [mem 0x210000000000-0x21fdfff0ffff 64bit pref]
[    0.354587] pci_bus 0001:00: resource 4 [mem 0x3fe080000000-0x3fe0fffeffff]
[    0.354608] pci_bus 0001:00: resource 5 [mem 0x210000000000-0x21fdffffffff 64bit pref]
[    0.354630] pci_bus 0001:01: resource 1 [mem 0x3fe080000000-0x3fe0ffefffff]
[    0.354651] pci_bus 0001:01: resource 2 [mem 0x210000000000-0x21fdfff0ffff 64bit pref]
[    0.354673] pci_bus 0001:02: resource 1 [mem 0x3fe080000000-0x3fe0ffefffff]
[    0.354694] pci_bus 0001:02: resource 2 [mem 0x210000000000-0x21fdfff0ffff 64bit pref]
[    0.354716] pci_bus 0001:03: resource 1 [mem 0x3fe080000000-0x3fe0807fffff]
[    0.354736] pci_bus 0001:03: resource 2 [mem 0x210000000000-0x2100ffffffff 64bit pref]
[    0.354759] pci_bus 0001:08: resource 1 [mem 0x3fe080800000-0x3fe080ffffff]
[    0.354779] pci_bus 0001:08: resource 2 [mem 0x210100000000-0x2101ffffffff 64bit pref]
[    0.354802] pci_bus 0001:09: resource 1 [mem 0x3fe081000000-0x3fe0817fffff]
[    0.354822] pci_bus 0001:09: resource 2 [mem 0x210200000000-0x2102ffffffff 64bit pref]
[    0.354847] pci 0004:00:00.0: PCI bridge to [bus 01-ff]
[    0.354892] pci_bus 0004:00: resource 4 [mem 0x3fe200000000-0x3fe27ffeffff]
[    0.354913] pci_bus 0004:00: resource 5 [mem 0x240000000000-0x24fdffffffff 64bit pref]
[    0.354939] pci 0005:02:08.0: bridge window [io  0x1000-0x0fff] to [bus 04-08] add_size 1000
[    0.354965] pci 0005:02:08.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 04-08] add_size 100000000 add_align 100000000
[    0.354997] pci 0005:02:08.0: bridge window [mem 0x00800000-0x007fffff] to [bus 04-08] add_size 800000 add_align 800000
[    0.355026] pci 0005:02:09.0: bridge window [io  0x1000-0x0fff] to [bus 09] add_size 1000
[    0.355055] pci 0005:02:10.0: bridge window [io  0x1000-0x0fff] to [bus 0a-0e] add_size 1000
[    0.355081] pci 0005:02:10.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 0a-0e] add_size 100000000 add_align 100000000
[    0.355112] pci 0005:02:10.0: bridge window [mem 0x00800000-0x007fffff] to [bus 0a-0e] add_size 800000 add_align 800000
[    0.355141] pci 0005:02:11.0: bridge window [io  0x1000-0x0fff] to [bus 0f-13] add_size 1000
[    0.355166] pci 0005:02:11.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 0f-13] add_size 100000000 add_align 100000000
[    0.355197] pci 0005:02:11.0: bridge window [mem 0x00800000-0x007fffff] to [bus 0f-13] add_size 800000 add_align 800000
[    0.355227] pci 0005:01:00.0: bridge window [io  0x1000-0x0fff] to [bus 02-13] add_size 4000
[    0.355255] pci 0005:01:00.0: bridge window [mem 0x100000000-0x4ffffffff 64bit pref] to [bus 02-13] add_size 300000000 add_align 100000000
[    0.355288] pci 0005:01:00.0: bridge window [mem 0x00800000-0x02ffffff] to [bus 02-13] add_size 1800000 add_align 800000
[    0.355318] pci 0005:00:00.0: bridge window [io  0x1000-0x0fff] to [bus 01-13] add_size 4000
[    0.355343] pci 0005:00:00.0: bridge window [mem 0x100000000-0x4ffffffff 64bit pref] to [bus 01-13] add_size 300000000 add_align 100000000
[    0.355375] pci 0005:00:00.0: bridge window [mem 0x00800000-0x037fffff] to [bus 01-13] add_size 1800000 add_align 800000
[    0.355408] pci 0005:00:00.0: BAR 15: assigned [mem 0x250000000000-0x2506ffffffff 64bit pref]
[    0.355433] pci 0005:00:00.0: BAR 14: assigned [mem 0x3fe280000000-0x3fe2847fffff]
[    0.355455] pci 0005:00:00.0: BAR 13: no space for [io  size 0x4000]
[    0.355475] pci 0005:00:00.0: BAR 13: failed to assign [io  size 0x4000]
[    0.355496] pci 0005:00:00.0: BAR 13: no space for [io  size 0x4000]
[    0.355516] pci 0005:00:00.0: BAR 13: failed to assign [io  size 0x4000]
[    0.355540] pci 0005:01:00.0: BAR 15: assigned [mem 0x250000000000-0x2506ffffffff 64bit pref]
[    0.355565] pci 0005:01:00.0: BAR 14: assigned [mem 0x3fe280000000-0x3fe283ffffff]
[    0.355588] pci 0005:01:00.0: BAR 0: assigned [mem 0x3fe284000000-0x3fe28403ffff]
[    0.355617] pci 0005:01:00.0: BAR 13: no space for [io  size 0x4000]
[    0.355638] pci 0005:01:00.0: BAR 13: failed to assign [io  size 0x4000]
[    0.355660] pci 0005:01:00.0: BAR 13: no space for [io  size 0x4000]
[    0.355680] pci 0005:01:00.0: BAR 13: failed to assign [io  size 0x4000]
[    0.355713] pci 0005:02:08.0: BAR 15: assigned [mem 0x250000000000-0x2500ffffffff 64bit pref]
[    0.355738] pci 0005:02:09.0: BAR 15: assigned [mem 0x250100000000-0x2501ffffffff 64bit pref]
[    0.355762] pci 0005:02:10.0: BAR 15: assigned [mem 0x250200000000-0x2502ffffffff 64bit pref]
[    0.355787] pci 0005:02:11.0: BAR 15: assigned [mem 0x250300000000-0x2503ffffffff 64bit pref]
[    0.355812] pci 0005:02:01.0: BAR 14: assigned [mem 0x3fe280000000-0x3fe2807fffff]
[    0.355835] pci 0005:02:08.0: BAR 14: assigned [mem 0x3fe280800000-0x3fe280ffffff]
[    0.355857] pci 0005:02:09.0: BAR 14: assigned [mem 0x3fe281000000-0x3fe2817fffff]
[    0.355880] pci 0005:02:10.0: BAR 14: assigned [mem 0x3fe281800000-0x3fe281ffffff]
[    0.355903] pci 0005:02:11.0: BAR 14: assigned [mem 0x3fe282000000-0x3fe2827fffff]
[    0.355926] pci 0005:02:08.0: BAR 13: no space for [io  size 0x1000]
[    0.355945] pci 0005:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[    0.355965] pci 0005:02:09.0: BAR 13: no space for [io  size 0x1000]
[    0.355985] pci 0005:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[    0.356005] pci 0005:02:10.0: BAR 13: no space for [io  size 0x1000]
[    0.356025] pci 0005:02:10.0: BAR 13: failed to assign [io  size 0x1000]
[    0.356045] pci 0005:02:11.0: BAR 13: no space for [io  size 0x1000]
[    0.356065] pci 0005:02:11.0: BAR 13: failed to assign [io  size 0x1000]
[    0.356091] pci 0005:02:11.0: BAR 13: no space for [io  size 0x1000]
[    0.356111] pci 0005:02:11.0: BAR 13: failed to assign [io  size 0x1000]
[    0.356131] pci 0005:02:10.0: BAR 13: no space for [io  size 0x1000]
[    0.356151] pci 0005:02:10.0: BAR 13: failed to assign [io  size 0x1000]
[    0.356171] pci 0005:02:09.0: BAR 13: no space for [io  size 0x1000]
[    0.356191] pci 0005:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[    0.356211] pci 0005:02:08.0: BAR 13: no space for [io  size 0x1000]
[    0.356230] pci 0005:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[    0.356253] pci 0005:03:00.0: BAR 0: assigned [mem 0x3fe280000000-0x3fe28000ffff 64bit]
[    0.356305] pci 0005:03:00.0: BAR 2: assigned [mem 0x3fe280010000-0x3fe280011fff 64bit]
[    0.356357] pci 0005:02:01.0: PCI bridge to [bus 03]
[    0.356384] pci 0005:02:01.0:   bridge window [mem 0x3fe280000000-0x3fe2807fffff]
[    0.356425] pci 0005:02:08.0: PCI bridge to [bus 04-08]
[    0.356453] pci 0005:02:08.0:   bridge window [mem 0x3fe280800000-0x3fe280ffffff]
[    0.356481] pci 0005:02:08.0:   bridge window [mem 0x250000000000-0x2500ffffffff 64bit pref]
[    0.356528] pci 0005:09:00.0: BAR 6: assigned [mem 0x3fe281000000-0x3fe28107ffff pref]
[    0.356552] pci 0005:09:00.1: BAR 6: assigned [mem 0x3fe281080000-0x3fe2810fffff pref]
[    0.356575] pci 0005:09:00.2: BAR 6: assigned [mem 0x3fe281100000-0x3fe28117ffff pref]
[    0.356599] pci 0005:09:00.3: BAR 6: assigned [mem 0x3fe281180000-0x3fe2811fffff pref]
[    0.356622] pci 0005:09:00.0: BAR 0: assigned [mem 0x250100000000-0x25010000ffff 64bit pref]
[    0.356677] pci 0005:09:00.0: BAR 2: assigned [mem 0x250100010000-0x25010001ffff 64bit pref]
[    0.356732] pci 0005:09:00.0: BAR 4: assigned [mem 0x250100020000-0x25010002ffff 64bit pref]
[    0.356787] pci 0005:09:00.1: BAR 0: assigned [mem 0x250100030000-0x25010003ffff 64bit pref]
[    0.356842] pci 0005:09:00.1: BAR 2: assigned [mem 0x250100040000-0x25010004ffff 64bit pref]
[    0.356898] pci 0005:09:00.1: BAR 4: assigned [mem 0x250100050000-0x25010005ffff 64bit pref]
[    0.356952] pci 0005:09:00.2: BAR 0: assigned [mem 0x250100060000-0x25010006ffff 64bit pref]
[    0.357008] pci 0005:09:00.2: BAR 2: assigned [mem 0x250100070000-0x25010007ffff 64bit pref]
[    0.357064] pci 0005:09:00.2: BAR 4: assigned [mem 0x250100080000-0x25010008ffff 64bit pref]
[    0.357119] pci 0005:09:00.3: BAR 0: assigned [mem 0x250100090000-0x25010009ffff 64bit pref]
[    0.357174] pci 0005:09:00.3: BAR 2: assigned [mem 0x2501000a0000-0x2501000affff 64bit pref]
[    0.357230] pci 0005:09:00.3: BAR 4: assigned [mem 0x2501000b0000-0x2501000bffff 64bit pref]
[    0.357288] pci 0005:02:09.0: PCI bridge to [bus 09]
[    0.357315] pci 0005:02:09.0:   bridge window [mem 0x3fe281000000-0x3fe2817fffff]
[    0.357343] pci 0005:02:09.0:   bridge window [mem 0x250100000000-0x2501ffffffff 64bit pref]
[    0.357380] pci 0005:02:10.0: PCI bridge to [bus 0a-0e]
[    0.357408] pci 0005:02:10.0:   bridge window [mem 0x3fe281800000-0x3fe281ffffff]
[    0.357436] pci 0005:02:10.0:   bridge window [mem 0x250200000000-0x2502ffffffff 64bit pref]
[    0.357474] pci 0005:02:11.0: PCI bridge to [bus 0f-13]
[    0.357501] pci 0005:02:11.0:   bridge window [mem 0x3fe282000000-0x3fe2827fffff]
[    0.357530] pci 0005:02:11.0:   bridge window [mem 0x250300000000-0x2503ffffffff 64bit pref]
[    0.357567] pci 0005:01:00.0: PCI bridge to [bus 02-13]
[    0.357594] pci 0005:01:00.0:   bridge window [mem 0x3fe280000000-0x3fe2ffefffff]
[    0.357621] pci 0005:01:00.0:   bridge window [mem 0x250000000000-0x25fdfff0ffff 64bit pref]
[    0.357657] pci 0005:00:00.0: PCI bridge to [bus 01-13]
[    0.357684] pci 0005:00:00.0:   bridge window [mem 0x3fe280000000-0x3fe2ffefffff]
[    0.357711] pci 0005:00:00.0:   bridge window [mem 0x250000000000-0x25fdfff0ffff 64bit pref]
[    0.357747] pci_bus 0005:00: resource 4 [mem 0x3fe280000000-0x3fe2fffeffff]
[    0.357767] pci_bus 0005:00: resource 5 [mem 0x250000000000-0x25fdffffffff 64bit pref]
[    0.357790] pci_bus 0005:01: resource 1 [mem 0x3fe280000000-0x3fe2ffefffff]
[    0.357810] pci_bus 0005:01: resource 2 [mem 0x250000000000-0x25fdfff0ffff 64bit pref]
[    0.357833] pci_bus 0005:02: resource 1 [mem 0x3fe280000000-0x3fe2ffefffff]
[    0.357854] pci_bus 0005:02: resource 2 [mem 0x250000000000-0x25fdfff0ffff 64bit pref]
[    0.357876] pci_bus 0005:03: resource 1 [mem 0x3fe280000000-0x3fe2807fffff]
[    0.357897] pci_bus 0005:04: resource 1 [mem 0x3fe280800000-0x3fe280ffffff]
[    0.357917] pci_bus 0005:04: resource 2 [mem 0x250000000000-0x2500ffffffff 64bit pref]
[    0.357940] pci_bus 0005:09: resource 1 [mem 0x3fe281000000-0x3fe2817fffff]
[    0.357960] pci_bus 0005:09: resource 2 [mem 0x250100000000-0x2501ffffffff 64bit pref]
[    0.357982] pci_bus 0005:0a: resource 1 [mem 0x3fe281800000-0x3fe281ffffff]
[    0.358002] pci_bus 0005:0a: resource 2 [mem 0x250200000000-0x2502ffffffff 64bit pref]
[    0.358025] pci_bus 0005:0f: resource 1 [mem 0x3fe282000000-0x3fe2827fffff]
[    0.358045] pci_bus 0005:0f: resource 2 [mem 0x250300000000-0x2503ffffffff 64bit pref]
[    0.358068] pci_bus 0000:00: Configuring PE for bus
[    0.358086] pci 0000:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    0.358552] pci 0000:00:00.0: Configured PE#fe
[    0.358652] pci_bus 0001:00: Configuring PE for bus
[    0.358668] pci 0001:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    0.359130] pci 0001:00:00.0: Configured PE#fe
[    0.359220] pci_bus 0001:01: Configuring PE for bus
[    0.359241] pci 0001:01     : [PE# fd] Secondary bus 0x0000000000000001 associated with PE#fd
[    0.359705] pci 0001:01:00.0: Configured PE#fd
[    0.359872] pci_bus 0001:02: Configuring PE for bus
[    0.359893] pci 0001:02     : [PE# fc] Secondary bus 0x0000000000000002 associated with PE#fc
[    0.360357] pci 0001:02:01.0: Configured PE#fc
[    0.360582] pci 0001:02:08.0: Added to existing PE#fc
[    0.360734] pci 0001:02:09.0: Added to existing PE#fc
[    0.360892] pci_bus 0001:08: Configuring PE for bus
[    0.360911] pci 0001:08     : [PE# fb] Secondary bus 0x0000000000000008 associated with PE#fb
[    0.361376] pci 0001:08:00.0: Configured PE#fb
[    0.361393] pci 0001:08     : [PE# fb] Setting up 32-bit TCE table at 0..80000000
[    0.362670] IOMMU table initialized, virtual merging enabled
[    0.362688] pci 0001:08     : [PE# fb] Setting up window#0 0..fffffffff pg=10000
[    0.362717] pci 0001:08     : [PE# fb] Enabling 64-bit DMA bypass
[    0.362765] pci 0001:08:00.0: Adding to iommu group 0
[    0.362911] pci_bus 0004:00: Configuring PE for bus
[    0.362928] pci 0004:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    0.363389] pci 0004:00:00.0: Configured PE#fe
[    0.363483] pci_bus 0005:00: Configuring PE for bus
[    0.363499] pci 0005:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    0.363968] pci 0005:00:00.0: Configured PE#fe
[    0.364059] pci_bus 0005:01: Configuring PE for bus
[    0.364078] pci 0005:01     : [PE# fd] Secondary bus 0x0000000000000001 associated with PE#fd
[    0.364542] pci 0005:01:00.0: Configured PE#fd
[    0.364703] pci_bus 0005:02: Configuring PE for bus
[    0.364723] pci 0005:02     : [PE# fc] Secondary bus 0x0000000000000002 associated with PE#fc
[    0.365187] pci 0005:02:01.0: Configured PE#fc
[    0.365357] pci 0005:02:08.0: Added to existing PE#fc
[    0.365510] pci 0005:02:09.0: Added to existing PE#fc
[    0.365668] pci 0005:02:10.0: Added to existing PE#fc
[    0.365861] pci 0005:02:11.0: Added to existing PE#fc
[    0.366061] pci_bus 0005:03: Configuring PE for bus
[    0.366080] pci 0005:03     : [PE# fb] Secondary bus 0x0000000000000003 associated with PE#fb
[    0.366546] pci 0005:03:00.0: Configured PE#fb
[    0.366562] pci 0005:03     : [PE# fb] Setting up 32-bit TCE table at 0..80000000
[    0.367890] pci 0005:03     : [PE# fb] Setting up window#0 0..fffffffff pg=10000
[    0.367918] pci 0005:03     : [PE# fb] Enabling 64-bit DMA bypass
[    0.367963] pci 0005:03:00.0: Adding to iommu group 1
[    0.368118] pci_bus 0005:09: Configuring PE for bus
[    0.368166] pci 0005:09     : [PE# 01] Secondary bus 0x0000000000000009 associated with PE#1
[    0.368634] pci 0005:09:00.0: Configured PE#1
[    0.368650] pci 0005:09     : [PE# 01] Setting up 32-bit TCE table at 0..80000000
[    0.369752] pci 0005:09     : [PE# 01] Setting up window#0 0..fffffffff pg=10000
[    0.369777] pci 0005:09     : [PE# 01] Enabling 64-bit DMA bypass
[    0.369820] pci 0005:09:00.0: Adding to iommu group 2
[    0.370010] pci 0005:09:00.1: Added to existing PE#1
[    0.370033] pci 0005:09:00.1: Adding to iommu group 2
[    0.370251] pci 0005:09:00.2: Added to existing PE#1
[    0.370274] pci 0005:09:00.2: Adding to iommu group 2
[    0.370453] pci 0005:09:00.3: Added to existing PE#1
[    0.370477] pci 0005:09:00.3: Adding to iommu group 2
[    0.370761] pci 0001:00:00.0: enabling device (0141 -> 0143)
[    0.370803] pci 0001:01:00.0: enabling device (0141 -> 0143)
[    0.370848] pci 0001:02:08.0: enabling device (0141 -> 0143)
[    0.370892] pci 0005:00:00.0: enabling device (0141 -> 0143)
[    0.370932] pci 0005:01:00.0: enabling device (0141 -> 0143)
[    0.370977] pci 0005:02:01.0: enabling device (0141 -> 0143)
[    0.371023] pci 0005:02:09.0: enabling device (0141 -> 0143)
[    0.371059] EEH: Capable adapter found: recovery enabled.
[    0.371239] PCI: Probing PCI hardware done
[    0.374984] opal-power: OPAL EPOW, DPO support detected.
[    0.376933] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.377142] HugeTLB: registered 16.0 MiB page size, pre-allocated 0 pages
[    0.377148] HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page
[    0.377153] HugeTLB: registered 16.0 GiB page size, pre-allocated 0 pages
[    0.377157] HugeTLB: 0 KiB vmemmap can be freed for a 16.0 GiB page
[    0.377886] iommu: Default domain type: Translated 
[    0.377891] iommu: DMA domain TLB invalidation policy: strict mode 
[    0.378042] SCSI subsystem initialized
[    0.378085] usbcore: registered new interface driver usbfs
[    0.378097] usbcore: registered new interface driver hub
[    0.378123] usbcore: registered new device driver usb
[    0.378227] EDAC MC: Ver: 3.0.0
[    0.378553] NetLabel: Initializing
[    0.378557] NetLabel:  domain hash size = 128
[    0.378560] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.378578] NetLabel:  unlabeled traffic allowed by default
[    0.378638] vgaarb: loaded
[    0.395470] clocksource: Switched to clocksource timebase
[    0.405384] VFS: Disk quotas dquot_6.6.0
[    0.405434] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
[    0.407405] NET: Registered PF_INET protocol family
[    0.407577] IP idents hash table entries: 262144 (order: 5, 2097152 bytes, vmalloc)
[    0.411231] tcp_listen_portaddr_hash hash table entries: 32768 (order: 3, 524288 bytes, vmalloc)
[    0.411304] Table-perturb hash table entries: 65536 (order: 2, 262144 bytes, vmalloc)
[    0.411317] TCP established hash table entries: 524288 (order: 6, 4194304 bytes, vmalloc)
[    0.412238] TCP bind hash table entries: 65536 (order: 4, 1048576 bytes, vmalloc)
[    0.412357] TCP: Hash tables configured (established 524288 bind 65536)
[    0.412437] UDP hash table entries: 32768 (order: 4, 1048576 bytes, vmalloc)
[    0.412557] UDP-Lite hash table entries: 32768 (order: 4, 1048576 bytes, vmalloc)
[    0.412790] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.412852] pci 0005:03:00.0: enabling device (0140 -> 0142)
[    0.412894] PCI: CLS 128 bytes, default 128
[    0.412957] Trying to unpack rootfs image as initramfs...
[    0.413015] rtas_flash: no firmware flash support
[    0.414971] Initialise system trusted keyrings
[    0.415037] workingset: timestamp_bits=38 max_order=20 bucket_order=0
[    0.416883] zbud: loaded
[    0.453572] NET: Registered PF_ALG protocol family
[    0.453580] Key type asymmetric registered
[    0.453606] Asymmetric key parser 'x509' registered
[    0.453672] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    0.453735] io scheduler mq-deadline registered
[    0.453740] io scheduler kyber registered
[    0.455605] atomic64_test: passed
[    0.455974] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.456056] hvc0: raw protocol on /ibm,opal/consoles/serial@0 (boot console)
[    0.456314] hvc1: hvsi protocol on /ibm,opal/consoles/serial@1
[    0.456347] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.456619] Non-volatile memory driver v1.3
[    0.456622] Linux agpgart interface v0.103
[    0.457097] rdac: device handler registered
[    0.457127] hp_sw: device handler registered
[    0.457131] emc: device handler registered
[    0.457181] alua: device handler registered
[    0.457316] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.457329] ehci-pci: EHCI PCI platform driver
[    0.457341] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.457354] ohci-pci: OHCI PCI platform driver
[    0.457366] uhci_hcd: USB Universal Host Controller Interface driver
[    0.457436] xhci_hcd 0005:03:00.0: xHCI Host Controller
[    0.457530] xhci_hcd 0005:03:00.0: new USB bus registered, assigned bus number 1
[    0.457661] xhci_hcd 0005:03:00.0: hcc params 0x0270f06d hci version 0x96 quirks 0x0000000004000000
[    0.457975] xhci_hcd 0005:03:00.0: xHCI Host Controller
[    0.458014] xhci_hcd 0005:03:00.0: new USB bus registered, assigned bus number 2
[    0.458021] xhci_hcd 0005:03:00.0: Host supports USB 3.0 SuperSpeed
[    0.458066] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.19
[    0.458073] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.458078] usb usb1: Product: xHCI Host Controller
[    0.458083] usb usb1: Manufacturer: Linux 5.19.0-rc4-next-20220629 xhci-hcd
[    0.458088] usb usb1: SerialNumber: 0005:03:00.0
[    0.458212] hub 1-0:1.0: USB hub found
[    0.458224] hub 1-0:1.0: 4 ports detected
[    0.458363] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    0.458386] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.19
[    0.458393] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.458399] usb usb2: Product: xHCI Host Controller
[    0.458403] usb usb2: Manufacturer: Linux 5.19.0-rc4-next-20220629 xhci-hcd
[    0.458408] usb usb2: SerialNumber: 0005:03:00.0
[    0.458517] hub 2-0:1.0: USB hub found
[    0.458528] hub 2-0:1.0: 4 ports detected
[    0.458697] usbcore: registered new interface driver usbserial_generic
[    0.458708] usbserial: USB Serial support registered for generic
[    0.458831] mousedev: PS/2 mouse device common for all mice
[    0.546537] rtc-opal opal-rtc: registered as rtc0
[    0.605398] rtc-opal opal-rtc: setting system clock to 2022-06-29T18:09:31 UTC (1656526171)
[    0.605428] powernv-cpufreq: cpufreq pstate min 0xffffffcf nominal 0xfffffff8 max 0x0
[    0.605433] powernv-cpufreq: Workload Optimized Frequency is disabled in the platform
[    0.607421] powernv_idle_driver registered
[    0.607487] nx_compress_powernv: coprocessor found on chip 0, CT 3 CI 1
[    0.607494] nx_compress_powernv: coprocessor found on chip 1, CT 3 CI 2
[    0.607511] hid: raw HID events driver (C) Jiri Kosina
[    0.607632] usbcore: registered new interface driver usbhid
[    0.607637] usbhid: USB HID core driver
[    0.607673] drop_monitor: Initializing network drop monitor service
[    0.607748] Initializing XFRM netlink socket
[    0.607754] IPv6: Loaded, but administratively disabled, reboot required to enable
[    0.607759] NET: Registered PF_PACKET protocol family
[    0.607766] mpls_gso: MPLS GSO support
[    0.607791] drmem: No dynamic reconfiguration memory found
[    0.607807] Running MSI bitmap self-tests ...
[    0.610666] registered taskstats version 1
[    0.611656] Loading compiled-in X.509 certificates
[    1.506589] Freeing initrd memory: 55808K
[    1.511148] alg: akcipher: decrypt test failed. err -22
[    1.511160] alg: akcipher: test 1 failed for rsa-generic, err=-22
[    1.511170] ------------[ cut here ]------------
[    1.511176] alg: self-tests for rsa-generic (rsa) failed (rc=-22)
[    1.511188] WARNING: CPU: 1 PID: 612 at crypto/testmgr.c:5774 alg_test+0x438/0x880
[    1.511210] Modules linked in:
[    1.511218] CPU: 1 PID: 612 Comm: cryptomgr_test Tainted: G        W         5.19.0-rc4-next-20220629 #1
[    1.511230] NIP:  c00000000062e0d8 LR: c00000000062e0d4 CTR: c00000000075e100
[    1.511239] REGS: c00000080d1bf980 TRAP: 0700   Tainted: G        W          (5.19.0-rc4-next-20220629)
[    1.511249] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 28008822  XER: 20000000
[    1.511270] CFAR: c00000000014f3a4 IRQMASK: 0 
               GPR00: c00000000062e0d4 c00000080d1bfc20 c000000002a12000 0000000000000035 
               GPR04: 00000000ffff7fff c00000080d1bf9e0 c00000080d1bf9d8 0000000000000000 
               GPR08: c000000002826b78 0000000000000000 c000000002566a50 c0000000028e6bb8 
               GPR12: 0000000000008800 c0000007ffffee80 c00000000018b818 c00000002c1e0080 
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
               GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
               GPR24: c000000000da4b68 0000000000000000 c000000043700080 0000000000000400 
               GPR28: c000000043700000 000000000000000d c000000002cd33d8 ffffffffffffffea 
[    1.511368] NIP [c00000000062e0d8] alg_test+0x438/0x880
[    1.511377] LR [c00000000062e0d4] alg_test+0x434/0x880
[    1.511386] Call Trace:
[    1.511390] [c00000080d1bfc20] [c00000000062e0d4] alg_test+0x434/0x880 (unreliable)
[    1.511403] [c00000080d1bfd90] [c00000000062c0a0] cryptomgr_test+0x40/0x70
[    1.511415] [c00000080d1bfdc0] [c00000000018b934] kthread+0x124/0x130
[    1.511428] [c00000080d1bfe10] [c00000000000cef4] ret_from_kernel_thread+0x5c/0x64
[    1.511439] Instruction dump:
[    1.511445] 409e02e4 3d22002c 892913fd 2f890000 409e02d4 3c62fe63 7f45d378 7f84e378 
[    1.511462] 7fe6fb78 3863ff40 4bb2126d 60000000 <0fe00000> fa2100f8 fa410100 fa610108 
[    1.511480] ---[ end trace 0000000000000000 ]---
[    1.511517] Problem loading in-kernel X.509 certificate (-2)
[    1.512787] zswap: loaded using pool lzo/zbud
[    1.513455] pstore: Using crash dump compression: deflate
[    1.513579] alg: No test for 842 (842-nx)
[    1.537243] Freeing unused kernel image (initmem) memory: 5184K
[    1.695433] Run /init as init process
[    1.695447]   with arguments:
[    1.695449]     /init
[    1.695451]   with environment:
[    1.695453]     HOME=/
[    1.695455]     TERM=linux
[    1.707110] systemd[1]: systemd 239 (239-56.el8) running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=legacy)
[    1.707972] systemd[1]: Detected architecture ppc64-le.
[    1.707985] systemd[1]: Running in initial RAM disk.
[    1.845696] systemd[1]: Set hostname to <ltc-test-ci3.aus.stglabs.ibm.com>.
[    4.785361] random: crng init done
[    4.785564] systemd[1]: Listening on udev Kernel Socket.
[    4.785728] systemd[1]: Reached target Slices.
[    4.785885] systemd[1]: Listening on Journal Socket (/dev/log).
[    4.786028] systemd[1]: Listening on Journal Socket.
[    4.787312] systemd[1]: Started Hardware RNG Entropy Gatherer Daemon.
[    4.788156] systemd[1]: Starting Setup Virtual Console...
[    4.893727] fuse: module verification failed: signature and/or required key missing - tainting kernel
[    4.903062] fuse: init (API version 7.36)
[    5.144752] pps_core: LinuxPPS API ver. 1 registered
[    5.144774] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    5.165285] PTP clock support registered
[    5.232519] tg3 0005:09:00.0: enabling device (0140 -> 0142)
[    5.244877] libata version 3.00 loaded.
[    5.279363] ipr: IBM Power RAID SCSI Device Driver version: 2.6.4 (March 14, 2017)
[    5.279408] ipr 0001:08:00.0: Found IOA with IRQ: 0
[    5.279617] ipr 0001:08:00.0: enabling device (0140 -> 0142)
[    5.280031] ipr 0001:08:00.0: Received IRQ : 39
[    5.280048] ipr 0001:08:00.0: Request for 16 MSI-Xs succeeded.
[    5.280808] ipr 0001:08:00.0: Initializing IOA.
[    5.280819] scsi host0: IBM 0 Storage Adapter
[    5.333802] tg3 0005:09:00.0 eth0: Tigon3 [partno(00RX892) rev 5719001] (PCI Express) MAC address 98:be:94:02:8b:90
[    5.333823] tg3 0005:09:00.0 eth0: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    5.333836] tg3 0005:09:00.0 eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[    5.333847] tg3 0005:09:00.0 eth0: dma_rwctrl[00000000] dma_mask[64-bit]
[    5.334020] tg3 0005:09:00.1: enabling device (0140 -> 0142)
[    5.374753] tg3 0005:09:00.1 eth1: Tigon3 [partno(00RX892) rev 5719001] (PCI Express) MAC address 98:be:94:02:8b:91
[    5.374771] tg3 0005:09:00.1 eth1: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    5.374783] tg3 0005:09:00.1 eth1: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[    5.374792] tg3 0005:09:00.1 eth1: dma_rwctrl[00000000] dma_mask[64-bit]
[    5.374949] tg3 0005:09:00.2: enabling device (0140 -> 0142)
[    5.424753] tg3 0005:09:00.2 eth2: Tigon3 [partno(00RX892) rev 5719001] (PCI Express) MAC address 98:be:94:02:8b:92
[    5.424772] tg3 0005:09:00.2 eth2: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    5.424783] tg3 0005:09:00.2 eth2: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[    5.424793] tg3 0005:09:00.2 eth2: dma_rwctrl[00000000] dma_mask[64-bit]
[    5.424950] tg3 0005:09:00.3: enabling device (0140 -> 0142)
[    5.474807] tg3 0005:09:00.3 eth3: Tigon3 [partno(00RX892) rev 5719001] (PCI Express) MAC address 98:be:94:02:8b:93
[    5.474827] tg3 0005:09:00.3 eth3: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    5.474839] tg3 0005:09:00.3 eth3: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[    5.474849] tg3 0005:09:00.3 eth3: dma_rwctrl[00000000] dma_mask[64-bit]
[   29.334697] ipr 0001:08:00.0: Starting IOA initialization sequence.
[   29.340091] ipr 0001:08:00.0: Adapter firmware version: 13512400
[   29.341178] ipr 0001:08:00.0: IOA initialized.
[   29.354083] scsi 0:3:0:0: No Device         IBM      57D7001SISIOA    0150 PQ: 0 ANSI: 0
[   29.354100] scsi 0:3:0:0: Resource path: 0/FE
[   29.386865] scsi 0:0:0:0: Direct-Access     IBM      MK1401GRRB       6209 PQ: 0 ANSI: 6
[   29.386882] scsi 0:0:0:0: Resource path: 0/00-00
[   29.387126] scsi 0:1:0:0: No Device         IBM      IPR-0   6DC75700      PQ: 0 ANSI: 3
[   29.387137] scsi 0:1:0:0: Resource path: 0/FD-00
[   29.387325] scsi 0:2:0:0: Direct-Access     IBM      IPR-0   6DC75700      PQ: 0 ANSI: 3
[   29.387336] scsi 0:2:0:0: Resource path: 0/FC-00-00
[   29.858162] scsi 0:0:1:0: Enclosure         IBM      VSBPD12M1 6GSAS    03 PQ: 0 ANSI: 2
[   29.858178] scsi 0:0:1:0: Resource path: 0/00-16
[   29.858472] scsi 0:0:2:0: Enclosure         IBM      VSBPD12M1 6GSAS    03 PQ: 0 ANSI: 2
[   29.858482] scsi 0:0:2:0: Resource path: 0/00-15
[   29.869535] tg3 0005:09:00.3 enP5p9s0f3: renamed from eth3
[   29.898576] scsi 0:3:0:0: Attached scsi generic sg0 type 31
[   29.898629] scsi 0:0:0:0: Attached scsi generic sg1 type 12
[   29.898666] scsi 0:1:0:0: Attached scsi generic sg2 type 31
[   29.898699] scsi 0:2:0:0: Attached scsi generic sg3 type 0
[   29.898732] scsi 0:0:1:0: Attached scsi generic sg4 type 13
[   29.898765] scsi 0:0:2:0: Attached scsi generic sg5 type 13
[   29.942762] sd 0:2:0:0: Power-on or device reset occurred
[   29.942922] sd 0:2:0:0: [sda] Spinning up disk...
[   29.965779] tg3 0005:09:00.1 enP5p9s0f1: renamed from eth1
[   30.035471] tg3 0005:09:00.0 enP5p9s0f0: renamed from eth0
[   30.135448] tg3 0005:09:00.2 enP5p9s0f2: renamed from eth2
[   31.075380] .ready
[   31.075548] sd 0:2:0:0: [sda] 272646144 512-byte logical blocks: (140 GB/130 GiB)
[   31.075559] sd 0:2:0:0: [sda] 4096-byte physical blocks
[   31.075611] sd 0:2:0:0: [sda] Write Protect is off
[   31.075620] sd 0:2:0:0: [sda] Mode Sense: 0b 00 00 08
[   31.075666] sd 0:2:0:0: [sda] Cache data unavailable
[   31.075675] sd 0:2:0:0: [sda] Assuming drive cache: write through
[   31.075685] sd 0:2:0:0: [sda] Preferred minimum I/O size 4096 bytes
[   31.098355]  sda: sda1 sda2 sda3
[   31.098650] sd 0:2:0:0: [sda] Attached SCSI disk
[   31.799459] EXT4-fs (sda2): mounted filesystem with ordered data mode. Quota mode: none.
[   32.578443] printk: systemd: 22 output lines suppressed due to ratelimiting
[   33.000533] SELinux:  Runtime disable is deprecated, use selinux=0 on the kernel cmdline.
[   33.000558] SELinux:  https://github.com/SELinuxProject/selinux-kernel/wiki/DEPRECATE-runtime-disable
[   38.035378] SELinux:  Disabled at runtime.
[   38.255401] audit: type=1404 audit(1656526209.140:2): enforcing=0 old_enforcing=0 auid=4294967295 ses=4294967295 enabled=0 old-enabled=1 lsm=selinux res=1
[   38.303400] systemd[1]: systemd 239 (239-56.el8) running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=legacy)
[   38.305047] systemd[1]: Detected architecture ppc64-le.
[   38.321704] systemd[1]: Set hostname to <ltc-test-ci3.aus.stglabs.ibm.com>.
[   39.260507] systemd[1]: Binding to IPv6 address not available since kernel does not support IPv6.
[   39.260553] systemd[1]: Binding to IPv6 address not available since kernel does not support IPv6.
[   39.635173] systemd[1]: systemd-journald.service: Succeeded.
[   39.635954] systemd[1]: initrd-switch-root.service: Succeeded.
[   39.636289] systemd[1]: Stopped Switch Root.
[   39.636913] systemd[1]: systemd-journald.service: Service has no hold-off time (RestartSec=0), scheduling restart.
[   39.637011] systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.
[   39.754357] EXT4-fs (sda2): re-mounted. Quota mode: none.
[   39.912728] Adding 31457216k swap on /dev/sda3.  Priority:-2 extents:1 across:31457216k FS
[   40.829279] IPMI message handler: version 39.2
[   40.907943] ipmi device interface
[   40.937548] ipmi-powernv ibm,opal:ipmi: Unable to map irq from device tree
[   40.979338] ipmi-powernv ibm,opal:ipmi: IPMI message handler: Found new BMC (man_id: 0x00a741, prod_id: 0x0132, dev_id: 0x20)
[   47.722978] ses 0:0:1:0: Attached Enclosure device
[   47.723018] ses 0:0:2:0: Attached Enclosure device
[   49.222711] RPC: Registered named UNIX socket transport module.
[   49.222726] RPC: Registered udp transport module.
[   49.222730] RPC: Registered tcp transport module.
[   49.222734] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   56.086673] sd 0:2:0:0: [sda] tag#452 FAILED Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=0s
[   56.086702] sd 0:2:0:0: [sda] tag#452 Sense Key : Illegal Request [current] 
[   56.086712] sd 0:2:0:0: [sda] tag#452 Add. Sense: Invalid field in cdb
[   56.086722] sd 0:2:0:0: [sda] tag#452 CDB: ATA command pass through(16) 85 06 20 00 00 00 00 00 00 00 00 00 00 40 e5 00
[   56.086777] sd 0:2:0:0: [sda] tag#453 FAILED Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=0s
[   56.086787] sd 0:2:0:0: [sda] tag#453 Sense Key : Illegal Request [current] 
[   56.086795] sd 0:2:0:0: [sda] tag#453 Add. Sense: Invalid field in cdb
[   56.086803] sd 0:2:0:0: [sda] tag#453 CDB: ATA command pass through(16) 85 06 20 00 00 00 00 00 00 00 00 00 00 40 98 00
[   80.308636] tg3 0005:09:00.0 enP5p9s0f0: Link is up at 1000 Mbps, full duplex
[   80.308657] tg3 0005:09:00.0 enP5p9s0f0: Flow control is off for TX and off for RX
[   80.308663] tg3 0005:09:00.0 enP5p9s0f0: EEE is disabled

--Apple-Mail=_AD465ED9-8489-45F6-A24C-8CF796917EC1--

