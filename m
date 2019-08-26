Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA359CD28
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 12:15:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H7DB6rcszDqNT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 20:15:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H79G3rcHzDqfv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:12:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46H79F6vH7z8svw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:12:33 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46H79F4kT3z9sN1; Mon, 26 Aug 2019 20:12:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46H79C5yPRz9sDB
 for <linuxppc-dev@ozlabs.org>; Mon, 26 Aug 2019 20:12:30 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QA7wB2096812
 for <linuxppc-dev@ozlabs.org>; Mon, 26 Aug 2019 06:12:27 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2umctx1hx2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 26 Aug 2019 06:12:25 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Mon, 26 Aug 2019 11:12:23 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 26 Aug 2019 11:12:20 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7QACJFP37748764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 10:12:19 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5935EA405B;
 Mon, 26 Aug 2019 10:12:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85507A4065;
 Mon, 26 Aug 2019 10:12:17 +0000 (GMT)
Received: from [9.199.196.197] (unknown [9.199.196.197])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 26 Aug 2019 10:12:17 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_B2D23B4C-3B35-42DF-90AE-BAE6176E0042"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [powerpc]WARN : arch/powerpc/platforms/powernv/smp.c:160
Date: Mon, 26 Aug 2019 15:42:16 +0530
In-Reply-To: <87imqk4nad.fsf@concordia.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <AB1A20B4-523B-491E-AB89-124AD2810C17@linux.vnet.ibm.com>
 <87imqk4nad.fsf@concordia.ellerman.id.au>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19082610-0020-0000-0000-00000364119E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082610-0021-0000-0000-000021B958B1
Message-Id: <B641A885-76DF-4976-81AE-73D41AD71BAF@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908260112
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
Cc: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, ego@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_B2D23B4C-3B35-42DF-90AE-BAE6176E0042
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 26-Aug-2019, at 8:59 AM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
>> linux-next is currently broken on POWER8 non virtualized. Kernel
>> fails to reach login prompt with following kernel warning
>> repeatedly shown during boot.
>=20
> I don't see it on my test systems.
>=20
> The backtrace makes it look like you're doing CPU hot_un_plug during
> boot, which seems a bit odd.
>=20
There is no explicit hot un plug operation being done. This happens
during boot.

For some reason cpu=E2=80=99s are being off lined.  I had earlier =
reported
that kernel does not boot till login prompt. I was wrong. Kernel does
boot. Not surr if it=E2=80=99s a side effect of these warnings, SMT is =
off after
the boot.

# lscpu
Architecture:          ppc64le
Byte Order:            Little Endian
CPU(s):                80
On-line CPU(s) list:   0,8,16,24,32,40,48,56,64,72
Off-line CPU(s) list:  =
1-7,9-15,17-23,25-31,33-39,41-47,49-55,57-63,65-71,73-79
Thread(s) per core:    1
Core(s) per socket:    5
=E2=80=A6=E2=80=A6..
NUMA node0 CPU(s):     0,8,16,24,32
NUMA node1 CPU(s):     40,48,56,64,72
#
# ppc64_cpu --smt
SMT is off
#

I can manually turn on the SMT.=20

> Or possibly it's just that the cpu_is_offline() test in do_idle() is
> returning true due to some bug.
>=20
>> The problem dates back atleast till next-20190816.=20
>=20
> A bisect would be helpful obviously :)

Last successful kernel boot was with next-20190808. =20
Will attempt a bisect. Started failing with 9th Aug tree.

>=20
>> [   40.285606] WARNING: CPU: 1 PID: 0 at =
arch/powerpc/platforms/powernv/smp.c:160 =
pnv_smp_cpu_kill_self+0x50/0x2d0
>> [   40.285609] Modules linked in: kvm_hv kvm sunrpc dm_mirror =
dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg =
ipmi_powernv ipmi_devintf powernv_rng uio_pdrv_genirq uio leds_powernv =
ipmi_msghandler powernv_op_panel ibmpowernv ip_tables ext4 mbcache jbd2 =
sd_mod ipr tg3 libata ptp pps_core
>> [   40.285643] CPU: 1 PID: 0 Comm: swapper/1 Not tainted =
5.3.0-rc5-next-20190823-autotest-autotest #1
>> [   40.285644] NIP:  c0000000000b5f40 LR: c000000000055498 CTR: =
c0000000000b5ef0
>> [   40.285646] REGS: c0000007f5527980 TRAP: 0700   Not tainted  =
(5.3.0-rc5-next-20190823-autotest-autotest)
>> [   40.285646] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: =
24004028  XER: 00000000
>> [   40.285650] CFAR: c000000000055494 IRQMASK: 1=20
>> [   40.285650] GPR00: c000000000055498 c0000007f5527c10 =
c00000000148b200 0000000000000000=20
>> [   40.285650] GPR04: 0000000000000000 c0000007fa897d80 =
c0000007fa90c800 00000007f9980000=20
>> [   40.285650] GPR08: 0000000000000000 0000000000000001 =
0000000000000000 c0000007fa90c800=20
>> [   40.285650] GPR12: c0000000000b5ef0 c0000007ffffee00 =
0000000000000800 c000000ffffc11d0=20
>> [   40.285650] GPR16: 0000000000000001 c000000001035280 =
0000000000000000 c0000000015303c0=20
>> [   40.285650] GPR20: c000000000052d60 0000000000000001 =
c0000007f54cd800 c0000007f54cd880=20
>> [   40.285650] GPR24: 0000000000080000 c0000007f54cd800 =
c0000000014bdf78 c0000000014c20d8=20
>> [   40.285650] GPR28: 0000000000000002 c0000000014c2538 =
0000000000000001 c0000007f54cd800=20
>> [   40.285662] NIP [c0000000000b5f40] =
pnv_smp_cpu_kill_self+0x50/0x2d0
>> [   40.285664] LR [c000000000055498] cpu_die+0x48/0x64
>> [   40.285665] Call Trace:
>> [   40.285667] [c0000007f5527c10] [c000000000f85f10] =
ppc64_tlb_batch+0x0/0x1220 (unreliable)
>> [   40.285669] [c0000007f5527df0] [c000000000055498] =
cpu_die+0x48/0x64
>> [   40.285672] [c0000007f5527e10] [c0000000000226a0] =
arch_cpu_idle_dead+0x20/0x40
>> [   40.285674] [c0000007f5527e30] [c00000000016bd2c] =
do_idle+0x37c/0x3f0
>> [   40.285676] [c0000007f5527ed0] [c00000000016bfac] =
cpu_startup_entry+0x3c/0x50
>> [   40.285678] [c0000007f5527f00] [c000000000055198] =
start_secondary+0x638/0x680
>> [   40.285680] [c0000007f5527f90] [c00000000000ac5c] =
start_secondary_prolog+0x10/0x14
>> [   40.285680] Instruction dump:
>> [   40.285681] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 =
f821fe21 e90d1178=20
>> [   40.285684] f9010198 39000000 892d0988 792907e0 <0b090000> =
39200002 7d210164 39200003=20
>> [   40.285687] ---[ end trace 72c90a064122d9e4 ]=E2=80=94
>=20
> That WARN shouldn't really kill the boot, do you see anything else?

The machine actually boots till login prompt.=20
I have attached the boot log(5.3.0-rc4-next-20190814)

Thanks
-Sachin


--Apple-Mail=_B2D23B4C-3B35-42DF-90AE-BAE6176E0042
Content-Disposition: attachment;
	filename=boot.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="boot.log"
Content-Transfer-Encoding: 7bit

 kernel:kexec_core: Starting new kernel
[ 5001.260269] sd 0:2:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK
[ 5001.260461] sd 0:2:0:0: [sda] tag#0 CDB: Write(10) 2a 00 0d 45 f3 50 00 00 08 00
[ 5001.260625] print_req_error: I/O error, dev sda, sector 222688080
[ 5001.260763] EXT4-fs warning (device sda2): ext4_end_bio:323: I/O error 10 writing to inode 6953680 (offset 0 size 0 starting block 27836011)
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
[    0.000000] Linux version 5.3.0-rc4-next-20190814-autotest (root@ltc-test-ci3.aus.stglabs.ibm.com) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-28) (GCC)) #1 SMP Sun Aug 25 23:26:47 CDT 2019
[    0.000000] Found initrd at 0xc0000000031e0000:0xc0000000043f0fe6
[    0.000000] Using PowerNV machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] CPU maps initialized for 8 threads per core
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x1000000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x80
[    0.000000] cpu_features      = 0x000002ff8f5db1a7
[    0.000000]   possible        = 0x0000fbffcf5fb1a7
[    0.000000]   always          = 0x00000003800081a1
[    0.000000] cpu_user_features = 0xdc0065c2 0xef000000
[    0.000000] mmu_features      = 0x7c006001
[    0.000000] firmware_features = 0x0000000110000000
[    0.000000] vmalloc start     = 0xc008000000000000
[    0.000000] IO start          = 0xc00a000000000000
[    0.000000] vmemmap start     = 0xc00c000000000000
[    0.000000] hash-mmu: ppc64_pft_size    = 0x0
[    0.000000] hash-mmu: htab_hash_mask    = 0x7ffff
[    0.000000] -----------------------------------------------------
[    0.000000] cma: Reserved 3280 MiB at 0x0000000f2b000000
[    0.000000] numa:   NODE_DATA [mem 0x7ffca8900-0x7ffcaffff]
[    0.000000] numa:   NODE_DATA [mem 0xfffc20900-0xfffc27fff]
[    0.000000] rfi-flush: ori type flush available
[    0.000000] count-cache-flush: software flush disabled.
[    0.000000] stf-barrier: hwsync barrier available
[    0.000000] Initializing IODA2 PHB (/pciex@3fffe40000000)
[    0.000000] PCI host bridge /pciex@3fffe40000000 (primary) ranges:
[    0.000000]  MEM 0x00003fe000000000..0x00003fe07ffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0000200000000000..0x000020ffffffffff -> 0x0000200000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x10000000000 [segment=0x100000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x800)
[    0.000000] Initializing IODA2 PHB (/pciex@3fffe40100000)
[    0.000000] PCI host bridge /pciex@3fffe40100000  ranges:
[    0.000000]  MEM 0x00003fe080000000..0x00003fe0fffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0000210000000000..0x000021ffffffffff -> 0x0000210000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x10000000000 [segment=0x100000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x1000)
[    0.000000] Initializing IODA2 PHB (/pciex@3fffe40400000)
[    0.000000] PCI host bridge /pciex@3fffe40400000  ranges:
[    0.000000]  MEM 0x00003fe200000000..0x00003fe27ffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0000240000000000..0x000024ffffffffff -> 0x0000240000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x10000000000 [segment=0x100000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x2800)
[    0.000000] Initializing IODA2 PHB (/pciex@3fffe40500000)
[    0.000000] PCI host bridge /pciex@3fffe40500000  ranges:
[    0.000000]  MEM 0x00003fe280000000..0x00003fe2fffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0000250000000000..0x000025ffffffffff -> 0x0000250000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x10000000000 [segment=0x100000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x3000)
[    0.000000] OPAL nvram setup, 1048576 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000000fffffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x00000007ffffffff]
[    0.000000]   node   1: [mem 0x0000000800000000-0x0000000fffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000007ffffffff]
[    0.000000] Initmem setup node 1 [mem 0x0000000800000000-0x0000000fffffffff]
[    0.000000] percpu: Embedded 11 pages/cpu s623640 r0 d97256 u1048576
[    0.000000] Built 2 zonelists, mobility grouping on.  Total pages: 1047552
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=UUID=91aea3b3-0092-4b7c-85b4-427b6f6a82b2  
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 63236800K/67108864K available (11328K kernel code, 1728K rwdata, 3456K rodata, 4864K init, 3846K bss, 513344K reserved, 3358720K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=80, Nodes=2
[    0.000000] ftrace: allocating 30673 entries in 12 pages
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=80.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=80
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] ICS OPAL backend registered
[    0.000000] rcu: 	Offload RCU callbacks from CPUs: (none).
[    0.000000] random: get_random_u64 called from start_kernel+0x49c/0x700 with crng_init=0
[    0.000003] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000184] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000519] Console: colour dummy device 80x25
[    0.000601] printk: console [hvc0] enabled
[    0.000601] printk: console [hvc0] enabled
[    0.000678] printk: bootconsole [udbg0] disabled
[    0.000678] printk: bootconsole [udbg0] disabled
[    0.000972] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.000991] pid_max: default: 81920 minimum: 640
[    0.002604] LSM: Security Framework initializing
[    0.002841] SELinux:  Initializing.
[    0.003208] *** VALIDATE SELinux ***
[    0.007699] Dentry cache hash table entries: 8388608 (order: 10, 67108864 bytes, vmalloc)
[    0.009961] Inode-cache hash table entries: 4194304 (order: 9, 33554432 bytes, vmalloc)
[    0.010215] Mount-cache hash table entries: 131072 (order: 4, 1048576 bytes, vmalloc)
[    0.010297] Mountpoint-cache hash table entries: 131072 (order: 4, 1048576 bytes, vmalloc)
[    0.010703] *** VALIDATE shmem ***
[    0.011650] *** VALIDATE proc ***
[    0.011922] *** VALIDATE cgroup1 ***
[    0.011931] *** VALIDATE cgroup2 ***
[    0.012791] EEH: PowerNV platform initialized
[    0.012803] POWER8 performance monitor hardware support registered
[    0.012850] power8-pmu: PMAO restore workaround active.
[    0.012896] rcu: Hierarchical SRCU implementation.
[    0.014990] smp: Bringing up secondary CPUs ...
[    0.164551] smp: Brought up 2 nodes, 80 CPUs
[    0.164571] numa: Node 0 CPUs: 0-39
[    0.164586] numa: Node 1 CPUs: 40-79
[    0.164602] Using standard scheduler topology
[    0.177478] devtmpfs: initialized
[    0.208915] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.209013] futex hash table entries: 32768 (order: 6, 4194304 bytes, vmalloc)
[    0.215729] *** VALIDATE debugfs ***
[    0.215748] *** VALIDATE tracefs ***
[    0.216873] NET: Registered protocol family 16
[    0.217589] audit: initializing netlink subsys (disabled)
[    0.217981] audit: type=2000 audit(1566814039.210:1): state=initialized audit_enabled=0 res=1
[    0.218547] cpuidle: using governor menu
[    0.218846] pstore: Registered nvram as persistent store backend
[    0.321439] PCI: Probing PCI hardware
[    0.321552] PCI host bridge to bus 0000:00
[    0.321572] pci_bus 0000:00: root bus resource [mem 0x3fe000000000-0x3fe07ffeffff] (bus address [0x80000000-0xfffeffff])
[    0.321595] pci_bus 0000:00: root bus resource [mem 0x200000000000-0x20fdffffffff 64bit pref]
[    0.321617] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.321635] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.321706] pci 0000:00:00.0: [1014:03dc] type 01 class 0x060400
[    0.322004] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
[    0.329393] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    0.329473] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.329581] PCI host bridge to bus 0001:00
[    0.329598] pci_bus 0001:00: root bus resource [mem 0x3fe080000000-0x3fe0fffeffff] (bus address [0x80000000-0xfffeffff])
[    0.329621] pci_bus 0001:00: root bus resource [mem 0x210000000000-0x21fdffffffff 64bit pref]
[    0.329642] pci_bus 0001:00: root bus resource [bus 00-ff]
[    0.329658] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to ff
[    0.329715] pci 0001:00:00.0: [1014:03dc] type 01 class 0x060400
[    0.330011] pci 0001:00:00.0: PME# supported from D0 D3hot D3cold
[    0.333919] pci 0001:01:00.0: [10b5:8732] type 01 class 0x060400
[    0.334031] pci 0001:01:00.0: reg 0x10: [mem 0x3fe082800000-0x3fe08283ffff]
[    0.334449] pci 0001:01:00.0: PME# supported from D0 D3hot D3cold
[    0.338345] pci 0001:00:00.0: PCI bridge to [bus 01-0d]
[    0.338830] pci 0001:02:01.0: [10b5:8732] type 01 class 0x060400
[    0.339364] pci 0001:02:01.0: PME# supported from D0 D3hot D3cold
[    0.340479] pci 0001:02:08.0: [10b5:8732] type 01 class 0x060400
[    0.341022] pci 0001:02:08.0: PME# supported from D0 D3hot D3cold
[    0.341498] pci 0001:02:09.0: [10b5:8732] type 01 class 0x060400
[    0.342043] pci 0001:02:09.0: PME# supported from D0 D3hot D3cold
[    0.344860] pci 0001:01:00.0: PCI bridge to [bus 02-0d]
[    0.348725] pci 0001:02:01.0: PCI bridge to [bus 03-07]
[    0.348988] pci 0001:08:00.0: [1014:034a] type 00 class 0x010400
[    0.349096] pci 0001:08:00.0: reg 0x10: [mem 0x3fe080820000-0x3fe08082ffff 64bit]
[    0.349158] pci 0001:08:00.0: reg 0x18: [mem 0x3fe080830000-0x3fe08083ffff 64bit]
[    0.349258] pci 0001:08:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    0.349520] pci 0001:08:00.0: PME# supported from D0 D3hot D3cold
[    0.349668] pci 0001:08:00.0: 63.008 Gb/s available PCIe bandwidth, limited by 8 GT/s x8 link at 0001:00:00.0 (capable of 126.016 Gb/s with 8 GT/s x16 link)
[    0.353406] pci 0001:02:08.0: PCI bridge to [bus 08]
[    0.357100] pci 0001:02:09.0: PCI bridge to [bus 09-0d]
[    0.357252] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to 0d
[    0.357366] PCI host bridge to bus 0004:00
[    0.357383] pci_bus 0004:00: root bus resource [mem 0x3fe200000000-0x3fe27ffeffff] (bus address [0x80000000-0xfffeffff])
[    0.357406] pci_bus 0004:00: root bus resource [mem 0x240000000000-0x24fdffffffff 64bit pref]
[    0.357426] pci_bus 0004:00: root bus resource [bus 00-ff]
[    0.357442] pci_bus 0004:00: busn_res: [bus 00-ff] end is updated to ff
[    0.357501] pci 0004:00:00.0: [1014:03dc] type 01 class 0x060400
[    0.357791] pci 0004:00:00.0: PME# supported from D0 D3hot D3cold
[    0.365145] pci 0004:00:00.0: PCI bridge to [bus 01-ff]
[    0.365225] pci_bus 0004:00: busn_res: [bus 00-ff] end is updated to ff
[    0.365331] PCI host bridge to bus 0005:00
[    0.365348] pci_bus 0005:00: root bus resource [mem 0x3fe280000000-0x3fe2fffeffff] (bus address [0x80000000-0xfffeffff])
[    0.365371] pci_bus 0005:00: root bus resource [mem 0x250000000000-0x25fdffffffff 64bit pref]
[    0.365391] pci_bus 0005:00: root bus resource [bus 00-ff]
[    0.365408] pci_bus 0005:00: busn_res: [bus 00-ff] end is updated to ff
[    0.365465] pci 0005:00:00.0: [1014:03dc] type 01 class 0x060400
[    0.365778] pci 0005:00:00.0: PME# supported from D0 D3hot D3cold
[    0.369697] pci 0005:01:00.0: [10b5:8748] type 01 class 0x060400
[    0.369812] pci 0005:01:00.0: reg 0x10: [mem 0x3fe284000000-0x3fe28403ffff]
[    0.370238] pci 0005:01:00.0: PME# supported from D0 D3hot D3cold
[    0.374201] pci 0005:00:00.0: PCI bridge to [bus 01-13]
[    0.374615] pci 0005:02:01.0: [10b5:8748] type 01 class 0x060400
[    0.375158] pci 0005:02:01.0: PME# supported from D0 D3hot D3cold
[    0.376289] pci 0005:02:08.0: [10b5:8748] type 01 class 0x060400
[    0.376844] pci 0005:02:08.0: PME# supported from D0 D3hot D3cold
[    0.377324] pci 0005:02:09.0: [10b5:8748] type 01 class 0x060400
[    0.377885] pci 0005:02:09.0: PME# supported from D0 D3hot D3cold
[    0.379024] pci 0005:02:10.0: [10b5:8748] type 01 class 0x060400
[    0.379595] pci 0005:02:10.0: PME# supported from D0 D3hot D3cold
[    0.380089] pci 0005:02:11.0: [10b5:8748] type 01 class 0x060400
[    0.380667] pci 0005:02:11.0: PME# supported from D0 D3hot D3cold
[    0.382633] pci 0005:01:00.0: PCI bridge to [bus 02-13]
[    0.383312] pci 0005:03:00.0: [104c:8241] type 00 class 0x0c0330
[    0.383426] pci 0005:03:00.0: reg 0x10: [mem 0x3fe280000000-0x3fe28000ffff 64bit]
[    0.383490] pci 0005:03:00.0: reg 0x18: [mem 0x3fe280010000-0x3fe280011fff 64bit]
[    0.383645] pci 0005:03:00.0: BAR2 [mem size 0x00002000 64bit]: requesting alignment to 0x10000
[    0.383861] pci 0005:03:00.0: supports D1 D2
[    0.383877] pci 0005:03:00.0: PME# supported from D0 D1 D2 D3hot
[    0.387839] pci 0005:02:01.0: PCI bridge to [bus 03]
[    0.391533] pci 0005:02:08.0: PCI bridge to [bus 04-08]
[    0.391819] pci 0005:09:00.0: [14e4:1657] type 00 class 0x020000
[    0.391951] pci 0005:09:00.0: reg 0x10: [mem 0x250100000000-0x25010000ffff 64bit pref]
[    0.392018] pci 0005:09:00.0: reg 0x18: [mem 0x250100010000-0x25010001ffff 64bit pref]
[    0.392085] pci 0005:09:00.0: reg 0x20: [mem 0x250100020000-0x25010002ffff 64bit pref]
[    0.392135] pci 0005:09:00.0: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.392518] pci 0005:09:00.0: PME# supported from D0 D3hot D3cold
[    0.392914] pci 0005:09:00.1: [14e4:1657] type 00 class 0x020000
[    0.393048] pci 0005:09:00.1: reg 0x10: [mem 0x250100030000-0x25010003ffff 64bit pref]
[    0.393115] pci 0005:09:00.1: reg 0x18: [mem 0x250100040000-0x25010004ffff 64bit pref]
[    0.393183] pci 0005:09:00.1: reg 0x20: [mem 0x250100050000-0x25010005ffff 64bit pref]
[    0.393233] pci 0005:09:00.1: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.393623] pci 0005:09:00.1: PME# supported from D0 D3hot D3cold
[    0.394024] pci 0005:09:00.2: [14e4:1657] type 00 class 0x020000
[    0.394161] pci 0005:09:00.2: reg 0x10: [mem 0x250100060000-0x25010006ffff 64bit pref]
[    0.394229] pci 0005:09:00.2: reg 0x18: [mem 0x250100070000-0x25010007ffff 64bit pref]
[    0.394297] pci 0005:09:00.2: reg 0x20: [mem 0x250100080000-0x25010008ffff 64bit pref]
[    0.394348] pci 0005:09:00.2: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.394740] pci 0005:09:00.2: PME# supported from D0 D3hot D3cold
[    0.395075] pci 0005:09:00.3: [14e4:1657] type 00 class 0x020000
[    0.395212] pci 0005:09:00.3: reg 0x10: [mem 0x250100090000-0x25010009ffff 64bit pref]
[    0.395281] pci 0005:09:00.3: reg 0x18: [mem 0x2501000a0000-0x2501000affff 64bit pref]
[    0.395350] pci 0005:09:00.3: reg 0x20: [mem 0x2501000b0000-0x2501000bffff 64bit pref]
[    0.395400] pci 0005:09:00.3: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.395798] pci 0005:09:00.3: PME# supported from D0 D3hot D3cold
[    0.429518] pci 0005:02:09.0: PCI bridge to [bus 09]
[    0.433288] pci 0005:02:10.0: PCI bridge to [bus 0a-0e]
[    0.436973] pci 0005:02:11.0: PCI bridge to [bus 0f-13]
[    0.437161] pci_bus 0005:00: busn_res: [bus 00-ff] end is updated to 13
[    0.437213] pci 0000:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    0.437661] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    0.437706] pci_bus 0000:00: resource 4 [mem 0x3fe000000000-0x3fe07ffeffff]
[    0.437724] pci_bus 0000:00: resource 5 [mem 0x200000000000-0x20fdffffffff 64bit pref]
[    0.437746] pci 0001:02:01.0: bridge window [io  0x1000-0x0fff] to [bus 03-07] add_size 1000
[    0.437769] pci 0001:02:01.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 03-07] add_size 100000000 add_align 100000000
[    0.437795] pci 0001:02:01.0: bridge window [mem 0x00800000-0x007fffff] to [bus 03-07] add_size 800000 add_align 800000
[    0.437819] pci 0001:02:08.0: bridge window [io  0x1000-0x0fff] to [bus 08] add_size 1000
[    0.437841] pci 0001:02:08.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 08] add_size 100000000 add_align 100000000
[    0.437868] pci 0001:02:09.0: bridge window [io  0x1000-0x0fff] to [bus 09-0d] add_size 1000
[    0.437891] pci 0001:02:09.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 09-0d] add_size 100000000 add_align 100000000
[    0.437917] pci 0001:02:09.0: bridge window [mem 0x00800000-0x007fffff] to [bus 09-0d] add_size 800000 add_align 800000
[    0.437941] pci 0001:01:00.0: bridge window [io  0x1000-0x0fff] to [bus 02-0d] add_size 3000
[    0.437966] pci 0001:01:00.0: bridge window [mem 0x100000000-0x3ffffffff 64bit pref] to [bus 02-0d] add_size 300000000 add_align 100000000
[    0.437994] pci 0001:01:00.0: bridge window [mem 0x00800000-0x01ffffff] to [bus 02-0d] add_size 1000000 add_align 800000
[    0.438017] pci 0001:00:00.0: bridge window [io  0x1000-0x0fff] to [bus 01-0d] add_size 3000
[    0.438041] pci 0001:00:00.0: bridge window [mem 0x100000000-0x3ffffffff 64bit pref] to [bus 01-0d] add_size 300000000 add_align 100000000
[    0.438067] pci 0001:00:00.0: bridge window [mem 0x00800000-0x027fffff] to [bus 01-0d] add_size 1000000 add_align 800000
[    0.438098] pci 0001:00:00.0: BAR 15: assigned [mem 0x210000000000-0x2105ffffffff 64bit pref]
[    0.438119] pci 0001:00:00.0: BAR 14: assigned [mem 0x3fe080000000-0x3fe082ffffff]
[    0.438138] pci 0001:00:00.0: BAR 13: no space for [io  size 0x3000]
[    0.438154] pci 0001:00:00.0: BAR 13: failed to assign [io  size 0x3000]
[    0.438175] pci 0001:00:00.0: BAR 13: no space for [io  size 0x3000]
[    0.438191] pci 0001:00:00.0: BAR 13: failed to assign [io  size 0x3000]
[    0.438214] pci 0001:01:00.0: BAR 15: assigned [mem 0x210000000000-0x2105ffffffff 64bit pref]
[    0.438235] pci 0001:01:00.0: BAR 14: assigned [mem 0x3fe080000000-0x3fe0827fffff]
[    0.438254] pci 0001:01:00.0: BAR 0: assigned [mem 0x3fe082800000-0x3fe08283ffff]
[    0.438281] pci 0001:01:00.0: BAR 13: no space for [io  size 0x3000]
[    0.438298] pci 0001:01:00.0: BAR 13: failed to assign [io  size 0x3000]
[    0.438317] pci 0001:01:00.0: BAR 13: no space for [io  size 0x3000]
[    0.438334] pci 0001:01:00.0: BAR 13: failed to assign [io  size 0x3000]
[    0.438362] pci 0001:02:01.0: BAR 15: assigned [mem 0x210000000000-0x2100ffffffff 64bit pref]
[    0.438383] pci 0001:02:08.0: BAR 15: assigned [mem 0x210100000000-0x2101ffffffff 64bit pref]
[    0.438404] pci 0001:02:09.0: BAR 15: assigned [mem 0x210200000000-0x2102ffffffff 64bit pref]
[    0.438426] pci 0001:02:01.0: BAR 14: assigned [mem 0x3fe080000000-0x3fe0807fffff]
[    0.438445] pci 0001:02:08.0: BAR 14: assigned [mem 0x3fe080800000-0x3fe080ffffff]
[    0.438464] pci 0001:02:09.0: BAR 14: assigned [mem 0x3fe081000000-0x3fe0817fffff]
[    0.438483] pci 0001:02:01.0: BAR 13: no space for [io  size 0x1000]
[    0.438500] pci 0001:02:01.0: BAR 13: failed to assign [io  size 0x1000]
[    0.438517] pci 0001:02:08.0: BAR 13: no space for [io  size 0x1000]
[    0.438534] pci 0001:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[    0.438551] pci 0001:02:09.0: BAR 13: no space for [io  size 0x1000]
[    0.438568] pci 0001:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[    0.438589] pci 0001:02:09.0: BAR 13: no space for [io  size 0x1000]
[    0.438606] pci 0001:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[    0.438623] pci 0001:02:08.0: BAR 13: no space for [io  size 0x1000]
[    0.438639] pci 0001:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[    0.438657] pci 0001:02:01.0: BAR 13: no space for [io  size 0x1000]
[    0.438674] pci 0001:02:01.0: BAR 13: failed to assign [io  size 0x1000]
[    0.438692] pci 0001:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    0.439137] pci 0001:02:01.0: PCI bridge to [bus 03-07]
[    0.439164] pci 0001:02:01.0:   bridge window [mem 0x3fe080000000-0x3fe0807fffff]
[    0.439189] pci 0001:02:01.0:   bridge window [mem 0x210000000000-0x2100ffffffff 64bit pref]
[    0.439226] pci 0001:08:00.0: BAR 6: assigned [mem 0x3fe080800000-0x3fe08081ffff pref]
[    0.439248] pci 0001:08:00.0: BAR 0: assigned [mem 0x3fe080820000-0x3fe08082ffff 64bit]
[    0.439297] pci 0001:08:00.0: BAR 2: assigned [mem 0x3fe080830000-0x3fe08083ffff 64bit]
[    0.439348] pci 0001:08     : [PE# fd] Secondary bus 0x0000000000000008 associated with PE#fd
[    0.439797] pci 0001:08     : [PE# fd] Setting up 32-bit TCE table at 0..80000000
[    0.475107] IOMMU table initialized, virtual merging enabled
[    0.475126] pci 0001:08     : [PE# fd] Setting up window#0 0..7fffffff pg=1000
[    0.475147] pci 0001:08     : [PE# fd] Enabling 64-bit DMA bypass
[    0.475164] pci 0001:02:08.0: PCI bridge to [bus 08]
[    0.475192] pci 0001:02:08.0:   bridge window [mem 0x3fe080800000-0x3fe080ffffff]
[    0.475218] pci 0001:02:08.0:   bridge window [mem 0x210100000000-0x2101ffffffff 64bit pref]
[    0.475252] pci 0001:02:09.0: PCI bridge to [bus 09-0d]
[    0.475278] pci 0001:02:09.0:   bridge window [mem 0x3fe081000000-0x3fe0817fffff]
[    0.475304] pci 0001:02:09.0:   bridge window [mem 0x210200000000-0x2102ffffffff 64bit pref]
[    0.475341] pci 0001:02     : [PE# fc] Secondary bus 0x0000000000000002 associated with PE#fc
[    0.475787] pci 0001:01:00.0: PCI bridge to [bus 02-0d]
[    0.475814] pci 0001:01:00.0:   bridge window [mem 0x3fe080000000-0x3fe0ffefffff]
[    0.475839] pci 0001:01:00.0:   bridge window [mem 0x210000000000-0x21fdfff0ffff 64bit pref]
[    0.475876] pci 0001:01     : [PE# fb] Secondary bus 0x0000000000000001 associated with PE#fb
[    0.476327] pci 0001:00:00.0: PCI bridge to [bus 01-0d]
[    0.476352] pci 0001:00:00.0:   bridge window [mem 0x3fe080000000-0x3fe0ffefffff]
[    0.476378] pci 0001:00:00.0:   bridge window [mem 0x210000000000-0x21fdfff0ffff 64bit pref]
[    0.476412] pci_bus 0001:00: resource 4 [mem 0x3fe080000000-0x3fe0fffeffff]
[    0.476430] pci_bus 0001:00: resource 5 [mem 0x210000000000-0x21fdffffffff 64bit pref]
[    0.476449] pci_bus 0001:01: resource 1 [mem 0x3fe080000000-0x3fe0ffefffff]
[    0.476466] pci_bus 0001:01: resource 2 [mem 0x210000000000-0x21fdfff0ffff 64bit pref]
[    0.476485] pci_bus 0001:02: resource 1 [mem 0x3fe080000000-0x3fe0ffefffff]
[    0.476503] pci_bus 0001:02: resource 2 [mem 0x210000000000-0x21fdfff0ffff 64bit pref]
[    0.476522] pci_bus 0001:03: resource 1 [mem 0x3fe080000000-0x3fe0807fffff]
[    0.476539] pci_bus 0001:03: resource 2 [mem 0x210000000000-0x2100ffffffff 64bit pref]
[    0.476558] pci_bus 0001:08: resource 1 [mem 0x3fe080800000-0x3fe080ffffff]
[    0.476575] pci_bus 0001:08: resource 2 [mem 0x210100000000-0x2101ffffffff 64bit pref]
[    0.476594] pci_bus 0001:09: resource 1 [mem 0x3fe081000000-0x3fe0817fffff]
[    0.476612] pci_bus 0001:09: resource 2 [mem 0x210200000000-0x2102ffffffff 64bit pref]
[    0.476633] pci 0004:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    0.477078] pci 0004:00:00.0: PCI bridge to [bus 01-ff]
[    0.477123] pci_bus 0004:00: resource 4 [mem 0x3fe200000000-0x3fe27ffeffff]
[    0.477141] pci_bus 0004:00: resource 5 [mem 0x240000000000-0x24fdffffffff 64bit pref]
[    0.477164] pci 0005:02:08.0: bridge window [io  0x1000-0x0fff] to [bus 04-08] add_size 1000
[    0.477187] pci 0005:02:08.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 04-08] add_size 100000000 add_align 100000000
[    0.477213] pci 0005:02:08.0: bridge window [mem 0x00800000-0x007fffff] to [bus 04-08] add_size 800000 add_align 800000
[    0.477238] pci 0005:02:09.0: bridge window [io  0x1000-0x0fff] to [bus 09] add_size 1000
[    0.477263] pci 0005:02:10.0: bridge window [io  0x1000-0x0fff] to [bus 0a-0e] add_size 1000
[    0.477286] pci 0005:02:10.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 0a-0e] add_size 100000000 add_align 100000000
[    0.477312] pci 0005:02:10.0: bridge window [mem 0x00800000-0x007fffff] to [bus 0a-0e] add_size 800000 add_align 800000
[    0.477335] pci 0005:02:11.0: bridge window [io  0x1000-0x0fff] to [bus 0f-13] add_size 1000
[    0.477358] pci 0005:02:11.0: bridge window [mem 0x100000000-0xffffffff 64bit pref] to [bus 0f-13] add_size 100000000 add_align 100000000
[    0.477384] pci 0005:02:11.0: bridge window [mem 0x00800000-0x007fffff] to [bus 0f-13] add_size 800000 add_align 800000
[    0.477408] pci 0005:01:00.0: bridge window [io  0x1000-0x0fff] to [bus 02-13] add_size 4000
[    0.477434] pci 0005:01:00.0: bridge window [mem 0x100000000-0x4ffffffff 64bit pref] to [bus 02-13] add_size 300000000 add_align 100000000
[    0.477462] pci 0005:01:00.0: bridge window [mem 0x00800000-0x02ffffff] to [bus 02-13] add_size 1800000 add_align 800000
[    0.477486] pci 0005:00:00.0: bridge window [io  0x1000-0x0fff] to [bus 01-13] add_size 4000
[    0.477510] pci 0005:00:00.0: bridge window [mem 0x100000000-0x4ffffffff 64bit pref] to [bus 01-13] add_size 300000000 add_align 100000000
[    0.477537] pci 0005:00:00.0: bridge window [mem 0x00800000-0x037fffff] to [bus 01-13] add_size 1800000 add_align 800000
[    0.477564] pci 0005:00:00.0: BAR 15: assigned [mem 0x250000000000-0x2506ffffffff 64bit pref]
[    0.477585] pci 0005:00:00.0: BAR 14: assigned [mem 0x3fe280000000-0x3fe2847fffff]
[    0.477604] pci 0005:00:00.0: BAR 13: no space for [io  size 0x4000]
[    0.477620] pci 0005:00:00.0: BAR 13: failed to assign [io  size 0x4000]
[    0.477640] pci 0005:00:00.0: BAR 13: no space for [io  size 0x4000]
[    0.477656] pci 0005:00:00.0: BAR 13: failed to assign [io  size 0x4000]
[    0.477679] pci 0005:01:00.0: BAR 15: assigned [mem 0x250000000000-0x2506ffffffff 64bit pref]
[    0.477700] pci 0005:01:00.0: BAR 14: assigned [mem 0x3fe280000000-0x3fe283ffffff]
[    0.477719] pci 0005:01:00.0: BAR 0: assigned [mem 0x3fe284000000-0x3fe28403ffff]
[    0.477746] pci 0005:01:00.0: BAR 13: no space for [io  size 0x4000]
[    0.477762] pci 0005:01:00.0: BAR 13: failed to assign [io  size 0x4000]
[    0.477781] pci 0005:01:00.0: BAR 13: no space for [io  size 0x4000]
[    0.477798] pci 0005:01:00.0: BAR 13: failed to assign [io  size 0x4000]
[    0.477831] pci 0005:02:08.0: BAR 15: assigned [mem 0x250000000000-0x2500ffffffff 64bit pref]
[    0.477852] pci 0005:02:09.0: BAR 15: assigned [mem 0x250100000000-0x2501ffffffff 64bit pref]
[    0.477874] pci 0005:02:10.0: BAR 15: assigned [mem 0x250200000000-0x2502ffffffff 64bit pref]
[    0.477895] pci 0005:02:11.0: BAR 15: assigned [mem 0x250300000000-0x2503ffffffff 64bit pref]
[    0.477916] pci 0005:02:01.0: BAR 14: assigned [mem 0x3fe280000000-0x3fe2807fffff]
[    0.477935] pci 0005:02:08.0: BAR 14: assigned [mem 0x3fe280800000-0x3fe280ffffff]
[    0.477955] pci 0005:02:09.0: BAR 14: assigned [mem 0x3fe281000000-0x3fe2817fffff]
[    0.477974] pci 0005:02:10.0: BAR 14: assigned [mem 0x3fe281800000-0x3fe281ffffff]
[    0.477994] pci 0005:02:11.0: BAR 14: assigned [mem 0x3fe282000000-0x3fe2827fffff]
[    0.478012] pci 0005:02:08.0: BAR 13: no space for [io  size 0x1000]
[    0.478029] pci 0005:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[    0.478046] pci 0005:02:09.0: BAR 13: no space for [io  size 0x1000]
[    0.478062] pci 0005:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[    0.478080] pci 0005:02:10.0: BAR 13: no space for [io  size 0x1000]
[    0.478096] pci 0005:02:10.0: BAR 13: failed to assign [io  size 0x1000]
[    0.478114] pci 0005:02:11.0: BAR 13: no space for [io  size 0x1000]
[    0.478130] pci 0005:02:11.0: BAR 13: failed to assign [io  size 0x1000]
[    0.478153] pci 0005:02:11.0: BAR 13: no space for [io  size 0x1000]
[    0.478170] pci 0005:02:11.0: BAR 13: failed to assign [io  size 0x1000]
[    0.478187] pci 0005:02:10.0: BAR 13: no space for [io  size 0x1000]
[    0.478203] pci 0005:02:10.0: BAR 13: failed to assign [io  size 0x1000]
[    0.478220] pci 0005:02:09.0: BAR 13: no space for [io  size 0x1000]
[    0.478237] pci 0005:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[    0.478253] pci 0005:02:08.0: BAR 13: no space for [io  size 0x1000]
[    0.478270] pci 0005:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[    0.478291] pci 0005:03:00.0: BAR 0: assigned [mem 0x3fe280000000-0x3fe28000ffff 64bit]
[    0.478342] pci 0005:03:00.0: BAR 2: assigned [mem 0x3fe280010000-0x3fe280011fff 64bit]
[    0.478391] pci 0005:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    0.478842] pci 0005:03     : [PE# fd] Secondary bus 0x0000000000000003 associated with PE#fd
[    0.479291] pci 0005:03     : [PE# fd] Setting up 32-bit TCE table at 0..80000000
[    0.515087] pci 0005:03     : [PE# fd] Setting up window#0 0..7fffffff pg=1000
[    0.515257] pci 0005:03     : [PE# fd] Enabling 64-bit DMA bypass
[    0.515275] pci 0005:02:01.0: PCI bridge to [bus 03]
[    0.515302] pci 0005:02:01.0:   bridge window [mem 0x3fe280000000-0x3fe2807fffff]
[    0.515340] pci 0005:02:08.0: PCI bridge to [bus 04-08]
[    0.515367] pci 0005:02:08.0:   bridge window [mem 0x3fe280800000-0x3fe280ffffff]
[    0.515394] pci 0005:02:08.0:   bridge window [mem 0x250000000000-0x2500ffffffff 64bit pref]
[    0.515439] pci 0005:09:00.0: BAR 6: assigned [mem 0x3fe281000000-0x3fe28107ffff pref]
[    0.515460] pci 0005:09:00.1: BAR 6: assigned [mem 0x3fe281080000-0x3fe2810fffff pref]
[    0.515480] pci 0005:09:00.2: BAR 6: assigned [mem 0x3fe281100000-0x3fe28117ffff pref]
[    0.515501] pci 0005:09:00.3: BAR 6: assigned [mem 0x3fe281180000-0x3fe2811fffff pref]
[    0.515521] pci 0005:09:00.0: BAR 0: assigned [mem 0x250100000000-0x25010000ffff 64bit pref]
[    0.515573] pci 0005:09:00.0: BAR 2: assigned [mem 0x250100010000-0x25010001ffff 64bit pref]
[    0.515625] pci 0005:09:00.0: BAR 4: assigned [mem 0x250100020000-0x25010002ffff 64bit pref]
[    0.515677] pci 0005:09:00.1: BAR 0: assigned [mem 0x250100030000-0x25010003ffff 64bit pref]
[    0.515730] pci 0005:09:00.1: BAR 2: assigned [mem 0x250100040000-0x25010004ffff 64bit pref]
[    0.515782] pci 0005:09:00.1: BAR 4: assigned [mem 0x250100050000-0x25010005ffff 64bit pref]
[    0.515835] pci 0005:09:00.2: BAR 0: assigned [mem 0x250100060000-0x25010006ffff 64bit pref]
[    0.515888] pci 0005:09:00.2: BAR 2: assigned [mem 0x250100070000-0x25010007ffff 64bit pref]
[    0.515942] pci 0005:09:00.2: BAR 4: assigned [mem 0x250100080000-0x25010008ffff 64bit pref]
[    0.515995] pci 0005:09:00.3: BAR 0: assigned [mem 0x250100090000-0x25010009ffff 64bit pref]
[    0.516049] pci 0005:09:00.3: BAR 2: assigned [mem 0x2501000a0000-0x2501000affff 64bit pref]
[    0.516102] pci 0005:09:00.3: BAR 4: assigned [mem 0x2501000b0000-0x2501000bffff 64bit pref]
[    0.516188] pci 0005:09     : [PE# 01] Secondary bus 0x0000000000000009 associated with PE#1
[    0.516645] pci 0005:09     : [PE# 01] Setting up 32-bit TCE table at 0..80000000
[    0.552426] pci 0005:09     : [PE# 01] Setting up window#0 0..7fffffff pg=1000
[    0.552455] pci 0005:09     : [PE# 01] Enabling 64-bit DMA bypass
[    0.552472] pci 0005:02:09.0: PCI bridge to [bus 09]
[    0.552498] pci 0005:02:09.0:   bridge window [mem 0x3fe281000000-0x3fe2817fffff]
[    0.552521] pci 0005:02:09.0:   bridge window [mem 0x250100000000-0x2501ffffffff 64bit pref]
[    0.552553] pci 0005:02:10.0: PCI bridge to [bus 0a-0e]
[    0.552580] pci 0005:02:10.0:   bridge window [mem 0x3fe281800000-0x3fe281ffffff]
[    0.552606] pci 0005:02:10.0:   bridge window [mem 0x250200000000-0x2502ffffffff 64bit pref]
[    0.552641] pci 0005:02:11.0: PCI bridge to [bus 0f-13]
[    0.552668] pci 0005:02:11.0:   bridge window [mem 0x3fe282000000-0x3fe2827fffff]
[    0.552695] pci 0005:02:11.0:   bridge window [mem 0x250300000000-0x2503ffffffff 64bit pref]
[    0.552735] pci 0005:02     : [PE# fc] Secondary bus 0x0000000000000002 associated with PE#fc
[    0.553180] pci 0005:01:00.0: PCI bridge to [bus 02-13]
[    0.553206] pci 0005:01:00.0:   bridge window [mem 0x3fe280000000-0x3fe2ffefffff]
[    0.553231] pci 0005:01:00.0:   bridge window [mem 0x250000000000-0x25fdfff0ffff 64bit pref]
[    0.553268] pci 0005:01     : [PE# fb] Secondary bus 0x0000000000000001 associated with PE#fb
[    0.553717] pci 0005:00:00.0: PCI bridge to [bus 01-13]
[    0.553742] pci 0005:00:00.0:   bridge window [mem 0x3fe280000000-0x3fe2ffefffff]
[    0.553767] pci 0005:00:00.0:   bridge window [mem 0x250000000000-0x25fdfff0ffff 64bit pref]
[    0.553801] pci_bus 0005:00: resource 4 [mem 0x3fe280000000-0x3fe2fffeffff]
[    0.553818] pci_bus 0005:00: resource 5 [mem 0x250000000000-0x25fdffffffff 64bit pref]
[    0.553837] pci_bus 0005:01: resource 1 [mem 0x3fe280000000-0x3fe2ffefffff]
[    0.553855] pci_bus 0005:01: resource 2 [mem 0x250000000000-0x25fdfff0ffff 64bit pref]
[    0.553874] pci_bus 0005:02: resource 1 [mem 0x3fe280000000-0x3fe2ffefffff]
[    0.553892] pci_bus 0005:02: resource 2 [mem 0x250000000000-0x25fdfff0ffff 64bit pref]
[    0.553911] pci_bus 0005:03: resource 1 [mem 0x3fe280000000-0x3fe2807fffff]
[    0.553929] pci_bus 0005:04: resource 1 [mem 0x3fe280800000-0x3fe280ffffff]
[    0.553946] pci_bus 0005:04: resource 2 [mem 0x250000000000-0x2500ffffffff 64bit pref]
[    0.553965] pci_bus 0005:09: resource 1 [mem 0x3fe281000000-0x3fe2817fffff]
[    0.553983] pci_bus 0005:09: resource 2 [mem 0x250100000000-0x2501ffffffff 64bit pref]
[    0.554002] pci_bus 0005:0a: resource 1 [mem 0x3fe281800000-0x3fe281ffffff]
[    0.554019] pci_bus 0005:0a: resource 2 [mem 0x250200000000-0x2502ffffffff 64bit pref]
[    0.554038] pci_bus 0005:0f: resource 1 [mem 0x3fe282000000-0x3fe2827fffff]
[    0.554056] pci_bus 0005:0f: resource 2 [mem 0x250300000000-0x2503ffffffff 64bit pref]
[    0.554159] pci 0001:08:00.0: Adding to iommu group 0
[    0.554210] pci 0005:03:00.0: Adding to iommu group 1
[    0.554253] pci 0005:09:00.0: Adding to iommu group 2
[    0.554274] pci 0005:09:00.1: Adding to iommu group 2
[    0.554296] pci 0005:09:00.2: Adding to iommu group 2
[    0.554317] pci 0005:09:00.3: Adding to iommu group 2
[    0.554439] pci 0001:00:00.0: enabling device (0141 -> 0143)
[    0.554481] pci 0001:01:00.0: enabling device (0541 -> 0543)
[    0.554527] pci 0001:02:08.0: enabling device (0541 -> 0543)
[    0.554573] pci 0005:00:00.0: enabling device (0141 -> 0143)
[    0.554611] pci 0005:01:00.0: enabling device (0541 -> 0543)
[    0.554657] pci 0005:02:01.0: enabling device (0541 -> 0543)
[    0.554704] pci 0005:02:09.0: enabling device (0541 -> 0543)
[    0.556712] EEH: PCI Enhanced I/O Error Handling Enabled
[    0.559750] opal-power: OPAL EPOW, DPO support detected.
[    0.559958] powernv-rng: Registering arch random hook.
[    0.562501] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
[    0.562507] HugeTLB registered 16.0 GiB page size, pre-allocated 0 pages
[    0.862547] vgaarb: loaded
[    0.862752] SCSI subsystem initialized
[    0.862794] usbcore: registered new interface driver usbfs
[    0.862805] usbcore: registered new interface driver hub
[    0.863012] usbcore: registered new device driver usb
[    0.863250] EDAC MC: Ver: 3.0.0
[    0.863530] NetLabel: Initializing
[    0.863534] NetLabel:  domain hash size = 128
[    0.863537] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.863554] NetLabel:  unlabeled traffic allowed by default
[    0.863862] clocksource: Switched to clocksource timebase
[    0.879714] VFS: Disk quotas dquot_6.6.0
[    0.879849] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
[    0.879874] *** VALIDATE ramfs ***
[    0.879961] *** VALIDATE hugetlbfs ***
[    0.881347] thermal_sys: Registered thermal governor 'fair_share'
[    0.881347] thermal_sys: Registered thermal governor 'step_wise'
[    0.881853] NET: Registered protocol family 2
[    0.882271] tcp_listen_portaddr_hash hash table entries: 32768 (order: 3, 524288 bytes, vmalloc)
[    0.882345] TCP established hash table entries: 524288 (order: 6, 4194304 bytes, vmalloc)
[    0.883246] TCP bind hash table entries: 65536 (order: 4, 1048576 bytes, vmalloc)
[    0.883364] TCP: Hash tables configured (established 524288 bind 65536)
[    0.883467] UDP hash table entries: 32768 (order: 4, 1048576 bytes, vmalloc)
[    0.883588] UDP-Lite hash table entries: 32768 (order: 4, 1048576 bytes, vmalloc)
[    0.883951] NET: Registered protocol family 1
[    0.884012] pci 0005:03:00.0: enabling device (0140 -> 0142)
[    0.884052] PCI: CLS 128 bytes, default 128
[    0.884101] Trying to unpack rootfs image as initramfs...
[    1.147721] Freeing initrd memory: 18496K
[    1.147887] rtas_flash: no firmware flash support
[    1.149614] workingset: timestamp_bits=38 max_order=20 bucket_order=0
[    1.151173] zbud: loaded
[    1.151620] *** VALIDATE devpts ***
[    1.151662] *** VALIDATE autofs ***
[    1.166058] NET: Registered protocol family 38
[    1.166069] Key type asymmetric registered
[    1.166072] Asymmetric key parser 'x509' registered
[    1.166082] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
[    1.166227] io scheduler mq-deadline registered
[    1.166231] io scheduler kyber registered
[    1.166905] atomic64_test: passed
[    1.167174] pcieport 0001:02:01.0: enabling device (0541 -> 0543)
[    1.167509] pcieport 0001:02:09.0: enabling device (0541 -> 0543)
[    1.168126] pcieport 0005:02:08.0: enabling device (0541 -> 0543)
[    1.168482] pcieport 0005:02:10.0: enabling device (0541 -> 0543)
[    1.168663] pcieport 0005:02:11.0: enabling device (0541 -> 0543)
[    1.168842] PowerPC PowerNV PCI Hotplug Driver version: 0.1
[    1.169087] hvc0: raw protocol on /ibm,opal/consoles/serial@0 (boot console)
[    1.169274] hvc1: hvsi protocol on /ibm,opal/consoles/serial@1
[    1.169292] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.169530] Non-volatile memory driver v1.3
[    1.169552] Linux agpgart interface v0.103
[    1.170105] rdac: device handler registered
[    1.170135] hp_sw: device handler registered
[    1.170138] emc: device handler registered
[    1.170249] alua: device handler registered
[    1.170293] libphy: Fixed MDIO Bus: probed
[    1.170326] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.170339] ehci-pci: EHCI PCI platform driver
[    1.170350] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.170364] ohci-pci: OHCI PCI platform driver
[    1.170375] uhci_hcd: USB Universal Host Controller Interface driver
[    1.170443] xhci_hcd 0005:03:00.0: xHCI Host Controller
[    1.170516] xhci_hcd 0005:03:00.0: new USB bus registered, assigned bus number 1
[    1.170638] xhci_hcd 0005:03:00.0: hcc params 0x0270f06d hci version 0x96 quirks 0x0000000004000000
[    1.170918] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.03
[    1.170924] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.170929] usb usb1: Product: xHCI Host Controller
[    1.170933] usb usb1: Manufacturer: Linux 5.3.0-rc4-next-20190814-autotest xhci-hcd
[    1.170938] usb usb1: SerialNumber: 0005:03:00.0
[    1.171039] hub 1-0:1.0: USB hub found
[    1.171050] hub 1-0:1.0: 4 ports detected
[    1.171191] xhci_hcd 0005:03:00.0: xHCI Host Controller
[    1.171225] xhci_hcd 0005:03:00.0: new USB bus registered, assigned bus number 2
[    1.171231] xhci_hcd 0005:03:00.0: Host supports USB 3.0 SuperSpeed
[    1.171271] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.171296] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.03
[    1.171301] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.171306] usb usb2: Product: xHCI Host Controller
[    1.171310] usb usb2: Manufacturer: Linux 5.3.0-rc4-next-20190814-autotest xhci-hcd
[    1.171314] usb usb2: SerialNumber: 0005:03:00.0
[    1.171405] hub 2-0:1.0: USB hub found
[    1.171416] hub 2-0:1.0: 4 ports detected
[    1.171556] usbcore: registered new interface driver usbserial_generic
[    1.171566] usbserial: USB Serial support registered for generic
[    1.171679] mousedev: PS/2 mouse device common for all mice
[    1.229277] rtc-opal opal-rtc: registered as rtc0
[    1.229352] powernv-cpufreq: cpufreq pstate min 0xffffffcf nominal 0xfffffff8 max 0x0
[    1.229358] powernv-cpufreq: Workload Optimized Frequency is disabled in the platform
[    1.231589] nx_compress_powernv: coprocessor found on chip 0, CT 3 CI 1
[    1.231596] nx_compress_powernv: coprocessor found on chip 1, CT 3 CI 2
[    1.231692] alg: No test for 842 (842-nx)
[    1.232987] hidraw: raw HID events driver (C) Jiri Kosina
[    1.233105] usbcore: registered new interface driver usbhid
[    1.233109] usbhid: USB HID core driver
[    1.233236] drop_monitor: Initializing network drop monitor service
[    1.233312] Initializing XFRM netlink socket
[    1.233960] NET: Registered protocol family 10
[    1.234613] Segment Routing with IPv6
[    1.234634] NET: Registered protocol family 17
[    1.234686] drmem: No dynamic reconfiguration memory found
[    1.234915] registered taskstats version 1
[    1.235049] zswap: loaded using pool lzo/zbud
[    1.235127] pstore: Using crash dump compression: deflate
[    1.235133] *** VALIDATE pstore ***
[    1.248296] Key type big_key registered
[    1.256347] Key type encrypted registered
[    1.256361] ima: No TPM chip found, activating TPM-bypass!
[    1.256369] ima: Allocated hash algorithm: sha256
[    1.256386] ima: No architecture policies found
[    1.256409] evm: Initialising EVM extended attributes:
[    1.256415] evm: security.selinux
[    1.256419] evm: security.ima
[    1.256424] evm: security.capability
[    1.256429] evm: HMAC attrs: 0x1
[    1.284431] rtc-opal opal-rtc: setting system clock to 2019-08-26T10:07:20 UTC (1566814040)
[    1.288257] Freeing unused kernel memory: 4864K
[    1.288266] This architecture does not have kernel memory protection.
[    1.288276] Run /init as init process
[    1.297748] random: systemd: uninitialized urandom read (16 bytes read)
[    1.298306] random: systemd: uninitialized urandom read (16 bytes read)
[    1.298327] random: systemd: uninitialized urandom read (16 bytes read)
[    1.406088] systemd[1]: systemd 219 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 -SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    1.406748] systemd[1]: Detected architecture ppc64-le.
[    1.406758] systemd[1]: Running in initial RAM disk.

Welcome to Red Hat Enterprise Linux Server 7.5 (Maipo) dracut-033-535.el7 (Initramfs)!

[    1.406929] systemd[1]: Set hostname to <ltc-test-ci3.aus.stglabs.ibm.com>.
[  OK  ] Reached target Timers.
[    1.456313] systemd[1]: Reached target Timers.
[    1.456335] systemd[1]: Starting Timers.
[  OK  ] Created slice Root Slice.
[    1.456861] systemd[1]: Created slice Root Slice.
[    1.456876] systemd[1]: Starting Root Slice.
[  OK  ] Listening on Journal Socket.
[    1.457003] systemd[1]: Listening on Journal Socket.
[    1.457019] systemd[1]: Starting Journal Socket.
[  OK  ] Listening on udev Kernel Socket.
[  OK  ] Reached target Local File Systems.
[  OK  ] Created slice System Slice.
[  OK  ] Reached target Slices.
         Starting Apply Kernel Variables...
         Starting Setup Virtual Console...
         Starting dracut cmdline hook...
         Starting Create list of required st... nodes for the current kernel...
         Starting Journal Service...
[  OK  ] Listening on udev Control Socket.
[  OK  ] Reached target Sockets.
[  OK  ] Reached target Swap.
[  OK  ] Started Apply Kernel Variables.
[  OK  ] Started Create list of required sta...ce nodes for the current kernel.
         Starting Create Static Device Nodes in /dev...
[  OK  ] Started Create Static Device Nodes in /dev.
[  OK  ] Started Journal Service.
[  OK  ] Started Setup Virtual Console.
[  OK  ] Started dracut cmdline hook.
         Starting dracut pre-udev hook...
[  OK  ] Started dracut pre-udev hook.
         Starting udev Kernel Device Manager...
[  OK  ] Started udev Kernel Device Manager.
         Starting udev Coldplug all Devices...
         Mounting Configuration File System...
[  OK  ] Mounted Configuration File System.
[    1.631455] pps_core: LinuxPPS API ver. 1 registered
[    1.631476] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    1.632439] PTP clock support registered
[    1.636232] tg3.c:v3.137 (May 11, 2014)
[    1.636249] tg3 0005:09:00.0: enabling device (0140 -> 0142)
[    1.636439] synth uevent: /devices/vio: failed to send uevent
[    1.636450] vio vio: uevent: failed to send synthetic uevent
[    1.637116] random: fast init done
[  OK  ] Started udev Coldplug all Devices.
[  OK  ] Reached target System Initialization.
         Starting Show Plymouth Boot Screen...
[    1.641033] ipr: IBM Power RAID SCSI Device Driver version: 2.6.4 (March 14, 2017)
[    1.641082] ipr 0001:08:00.0: Found IOA with IRQ: 0
[    1.641304] ipr 0001:08:00.0: enabling device (0540 -> 0542)
[    1.641887] ipr 0001:08:00.0: Received IRQ : 513
[    1.641907] ipr 0001:08:00.0: Request for 16 MSI-Xs succeeded.
         Starting dracut initqueue hook...
[    1.643379] ipr 0001:08:00.0: Initializing IOA.
[    1.643402] scsi host0: IBM 0 Storage Adapter
[  OK  ] Started Show Plymouth Boot Screen.
[  OK  ] Reached target Paths.
[  OK  ] Reached target Basic System.
G[    1.682270] tg3 0005:09:00.0 eth0: Tigon3 [partno(00RX892) rev 5719001] (PCI Express) MAC address 98:be:94:02:8b:90
[    1.682283] tg3 0005:09:00.0 eth0: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    1.682293] tg3 0005:09:00.0 eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[    1.682302] tg3 0005:09:00.0 eth0: dma_rwctrl[00000000] dma_mask[64-bit]
[    1.682465] tg3 0005:09:00.1: enabling device (0140 -> 0142)
[    1.723324] tg3 0005:09:00.1 eth1: Tigon3 [partno(00RX892) rev 5719001] (PCI Express) MAC address 98:be:94:02:8b:91
[    1.723343] tg3 0005:09:00.1 eth1: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    1.723354] tg3 0005:09:00.1 eth1: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[    1.723362] tg3 0005:09:00.1 eth1: dma_rwctrl[00000000] dma_mask[64-bit]
[    1.723523] tg3 0005:09:00.2: enabling device (0140 -> 0142)
[    1.763316] tg3 0005:09:00.2 eth2: Tigon3 [partno(00RX892) rev 5719001] (PCI Express) MAC address 98:be:94:02:8b:92
[    1.763335] tg3 0005:09:00.2 eth2: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    1.763345] tg3 0005:09:00.2 eth2: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[    1.763354] tg3 0005:09:00.2 eth2: dma_rwctrl[00000000] dma_mask[64-bit]
[    1.763514] tg3 0005:09:00.3: enabling device (0140 -> 0142)
[    1.813302] tg3 0005:09:00.3 eth3: Tigon3 [partno(00RX892) rev 5719001] (PCI Express) MAC address 98:be:94:02:8b:93
[    1.813320] tg3 0005:09:00.3 eth3: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    1.813330] tg3 0005:09:00.3 eth3: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[    1.813339] tg3 0005:09:00.3 eth3: dma_rwctrl[00000000] dma_mask[64-bit]
[    1.816307] tg3 0005:09:00.0 enP5p9s0f0: renamed from eth0
[    1.994146] tg3 0005:09:00.1 enP5p9s0f1: renamed from eth1
[    2.073983] tg3 0005:09:00.3 enP5p9s0f3: renamed from eth3
[    2.163970] tg3 0005:09:00.2 enP5p9s0f2: renamed from eth2
[    5.855863] random: crng init done
[    5.855883] random: 7 urandom warning(s) missed due to ratelimiting
[   25.686695] ipr 0001:08:00.0: Starting IOA initialization sequence.
[   25.692118] ipr 0001:08:00.0: Adapter firmware version: 13512400
[   25.693198] ipr 0001:08:00.0: IOA initialized.
[   25.706113] scsi 0:3:0:0: No Device         IBM      57D7001SISIOA    0150 PQ: 0 ANSI: 0
[   25.706130] scsi 0:3:0:0: Resource path: 0/FE
[   25.738890] scsi 0:0:0:0: Direct-Access     IBM      MK1401GRRB       6209 PQ: 0 ANSI: 6
[   25.738907] scsi 0:0:0:0: Resource path: 0/00-00
[   25.739216] scsi 0:1:0:0: No Device         IBM      IPR-0   6DC75700      PQ: 0 ANSI: 3
[   25.739227] scsi 0:1:0:0: Resource path: 0/FD-00
[   25.739496] scsi 0:2:0:0: Direct-Access     IBM      IPR-0   6DC75700      PQ: 0 ANSI: 3
[   25.739507] scsi 0:2:0:0: Resource path: 0/FC-00-00
[   26.210182] scsi 0:0:1:0: Enclosure         IBM      VSBPD12M1 6GSAS    03 PQ: 0 ANSI: 2
[   26.210198] scsi 0:0:1:0: Resource path: 0/00-16
[   26.210586] scsi 0:0:2:0: Enclosure         IBM      VSBPD12M1 6GSAS    03 PQ: 0 ANSI: 2
[   26.210597] scsi 0:0:2:0: Resource path: 0/00-15
[   26.221568] sd 0:2:0:0: Power-on or device reset occurred
[   26.221718] sd 0:2:0:0: [sda] Spinning up disk...
[   27.353829] .ready
[   27.354147] sd 0:2:0:0: [sda] 272646144 512-byte logical blocks: (140 GB/130 GiB)
[   27.354157] sd 0:2:0:0: [sda] 4096-byte physical blocks
[   27.354208] sd 0:2:0:0: [sda] Write Protect is off
[   27.553875] sd 0:2:0:0: [sda] Cache data unavailable
[   27.553889] sd 0:2:0:0: [sda] Assuming drive cache: write through
[   27.771332]  sda: sda1 sda2 sda3
[   27.973912] sd 0:2:0:0: [sda] Attached SCSI disk
[  OK  ] Found device IPR-0_6DC75700 2.
         Starting File System Check on /dev/...3-0092-4b7c-85b4-427b6f6a82b2...
[  OK  ] Started dracut initqueue hook.
[  OK  ] Reached target Remote File Systems (Pre).
[  OK  ] Reached target Remote File Systems.
[  OK  ] Started File System Check on /dev/d...3b3-0092-4b7c-85b4-427b6f6a82b2.
         Mounting /sysroot...
[   28.814792] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
[  OK  ] Mounted /sysroot.
[  OK  ] Reached target Initrd Root File System.
         Starting Reload Configuration from the Real Root...
[  OK  ] Started Reload Configuration from the Real Root.
[  OK  ] Reached target Initrd File Systems.
[  OK  ] Reached target Initrd Default Target.
         Starting dracut pre-pivot and cleanup hook...
[  OK  ] Started dracut pre-pivot and cleanup hook.
         Starting Cleaning Up and Shutting Down Daemons...
         Starting Plymouth switch root service...
[  OK  ] Stopped target Timers.
[  OK  ] Stopped Cleaning Up and Shutting Down Daemons.
[  OK  ] Stopped dracut pre-pivot and cleanup hook.
         Stopping dracut pre-pivot and cleanup hook...
[  OK  ] Stopped target Remote File Systems.
[  OK  ] Stopped target Remote File Systems (Pre).
[  OK  ] Stopped target Initrd Default Target.
[  OK  ] Stopped dracut initqueue hook.
         Stopping dracut initqueue hook...
[  OK  ] Stopped target Basic System.
[  OK  ] Stopped target Sockets.
[  OK  ] Stopped target Slices.
[  OK  ] Stopped target System Initialization.
[  OK  ] Stopped target Local File Systems.
[  OK  ] Stopped udev Coldplug all Devices.
         Stopping udev Coldplug all Devices...
[  OK  ] Stopped target Swap.
[  OK  ] Stopped Apply Kernel Variables.
         Stopping Apply Kernel Variables...
         Stopping udev Kernel Device Manager...
[  OK  ] Stopped target Paths.
[  OK  ] Stopped udev Kernel Device Manager.
[  OK  ] Stopped dracut pre-udev hook.
         Stopping dracut pre-udev hook...
[  OK  ] Stopped dracut cmdline hook.
         Stopping dracut cmdline hook...
[  OK  ] Stopped Create Static Device Nodes in /dev.
         Stopping Create Static Device Nodes in /dev...
[  OK  ] Stopped Create list of required sta...ce nodes for the current kernel.
         Stopping Create list of required st... nodes for the current kernel...
[  OK  ] Closed udev Control Socket.
[  OK  ] Closed udev Kernel Socket.
         Starting Cleanup udevd DB...
[  OK  ] Started Plymouth switch root service.
[  OK  ] Started Cleanup udevd DB.
[  OK  ] Reached target Switch Root.
         Starting Switch Root...
[   29.192907] systemd-journald[663]: Received SIGTERM from PID 1 (systemd).
[   29.280322] printk: systemd: 24 output lines suppressed due to ratelimiting
[   29.469295] SELinux:  Disabled at runtime.
[   29.883884] audit: type=1404 audit(1566814069.090:2): enforcing=0 old_enforcing=0 auid=4294967295 ses=4294967295 enabled=0 old-enabled=1 lsm=selinux res=1
[   30.014395] systemd[1]: Inserted module 'ip_tables'

Welcome to Red Hat Enterprise Linux Server 7.5 (Maipo)!

[   30.208807] systemd-sysv-generator[1195]: stat() failed on /etc/rc.d/init.d/autotest: No such file or directory
[  OK  ] Stopped Switch Root.
[  OK  ] Stopped Journal Service.
         Starting Journal Service...
         Starting Create list of required st... nodes for the current kernel...
         Starting Replay Read-Ahead Data...
[  OK  ] Listening on Delayed Shutdown Socket.
[  OK  ] Created slice system-serial\x2dgetty.slice.
[  OK  ] Listening on udev Control Socket.
[  OK  ] Set up automount Arbitrary Executab...ats File System Automount Point.
[  OK  ] Created slice system-getty.slice.
         Mounting Debug File System...
         Starting Read and set NIS domainname from /etc/sysconfig/network...
[  OK  ] Listening on Device-mapper event daemon FIFOs.
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
[  OK  ] Stopped target Switch Root.
         Mounting Huge Pages File System...
[  OK  ] Listening on LVM2 poll daemon socket.
         Starting Collect Read-Ahead Data...
[  OK  ] Stopped target Initrd File Systems.
[  OK  ] Listening on LVM2 metadata daemon socket.
[  OK  ] Created slice User and Session Slice.
[  OK  ] Reached target Slices.
[  OK  ] Stopped target Initrd Root File System.
         Starting Monitoring of LVM2 mirrors... dmeventd or progress polling...
[  OK  ] Listening on udev Kernel Socket.
[  OK  ] Created slice system-selinux\x2dpol...grate\x2dlocal\x2dchanges.slice.
         Mounting POSIX Message Queue File System...
[  OK  ] Started Collect Read-Ahead Data.
[  OK  ] Started Replay Read-Ahead Data.
         Starting Remount Root and Kernel File Systems...
         Starting Apply Kernel Variables...
[  OK  ] Started Journal Service.
[  OK  ] Started Create list of required sta...ce nodes for the current kernel.
         Starting Create Static Device Nodes in /dev...
[  OK  ] Started Apply Kernel Variables.
[  OK  ] Started Create Static Device Nodes in /dev.
         Starting udev Kernel Device Manager...
[  OK  ] Started Read and set NIS domainname from /etc/sysconfig/network.
[  OK  ] Mounted Debug File System.
[  OK  ] Mounted POSIX Message Queue File System.
[  OK  ] Mounted Huge Pages File System.
[   31.190419] EXT4-fs (sda2): re-mounted. Opts: (null)
[  OK  ] Started Remount Root and Kernel File Systems.
         Starting Load/Save Random Seed...
         Starting Flush Journal to Persistent Storage...
         Starting udev Coldplug all Devices...
         Starting Configure read-only root support...
[  OK  ] Started Load/Save Random Seed.
[  OK  ] Started LVM2 metadata daemon.
         Starting LVM2 metadata daemon...
[   31.285719] systemd-journald[1213]: Received request to flush runtime journal from PID 1
[  OK  ] Started Flush Journal to Persistent Storage.
[   31.308203] synth uevent: /devices/vio: failed to send uevent
[   31.308218] vio vio: uevent: failed to send synthetic uevent
[  OK  ] Started Configure read-only root support.
[  OK  ] Started udev Coldplug all Devices.
         Starting udev Wait for Complete Device Initialization...
[  OK  ] Started udev Kernel Device Manager.
[   32.511458] powernv_rng: Registered powernv hwrng.
[   32.532411] IPMI message handler: version 39.2
[  OK  ] Found device /dev/hvc0.
[   32.552834] ipmi device interface
[   32.574670] ipmi-powernv ibm,opal:ipmi: Unable to map irq from device tree
G[   32.621588] ipmi-powernv ibm,opal:ipmi: IPMI message handler: Found new BMC (man_id: 0x00a741, prod_id: 0x0132, dev_id: 0x20)
[   33.387935] scsi 0:3:0:0: Attached scsi generic sg0 type 31
[   33.388021] scsi 0:0:0:0: Attached scsi generic sg1 type 12
[   33.388087] scsi 0:1:0:0: Attached scsi generic sg2 type 31
[   33.388162] sd 0:2:0:0: Attached scsi generic sg3 type 0
[   33.388232] scsi 0:0:1:0: Attached scsi generic sg4 type 13
[   33.388294] scsi 0:0:2:0: Attached scsi generic sg5 type 13
[  OK  ] Found device IPR-0_6DC75700 3.
         Activating swap /dev/disk/by-uuid/e...7-507b-4592-b2c7-014cf1649949...
[   34.193850] Adding 20971456k swap on /dev/sda3.  Priority:-2 extents:1 across:20971456k FS
[  OK  ] Activated swap /dev/disk/by-uuid/e51c6c07-507b-4592-b2c7-014cf1649949.
[  OK  ] Reached target Swap.
[  OK  ] Started Monitoring of LVM2 mirrors,...ng dmeventd or progress polling.
[  OK  ] Reached target Local File Systems (Pre).
[   40.042250] ses 0:0:1:0: Attached Enclosure device
[   40.042290] ses 0:0:2:0: Attached Enclosure device
[  OK  ] Started udev Wait for Complete Device Initialization.
         Starting Activation of DM RAID sets...
[   40.180961] device-mapper: uevent: version 1.0.3
[   40.181168] device-mapper: ioctl: 4.40.0-ioctl (2019-01-18) initialised: dm-devel@redhat.com
[  OK  ] Started Activation of DM RAID sets.
[  OK  ] Reached target Local File Systems.
         Starting Tell Plymouth To Write Out Runtime Data...
         Starting Import network configuration from initramfs...
         Starting Preprocess NFS configuration...
[  OK  ] Reached target Local Encrypted Volumes.
[  OK  ] Started Preprocess NFS configuration.
[  OK  ] Started Tell Plymouth To Write Out Runtime Data.
[  OK  ] Started Import network configuration from initramfs.
         Starting Create Volatile Files and Directories...
[  OK  ] Started Create Volatile Files and Directories.
         Starting Security Auditing Service...
         Mounting RPC Pipe File System...
[  OK  ] Started Security Auditing Service.
         Starting Update UTMP about System Boot/Shutdown...
[  OK  ] Started Update UTMP about System Boot/Shutdown.
[  OK  ] Reached target System Initialization.
[  OK  ] Listening on Open-iSCSI iscsid Socket.
[  OK  ] Listening on Open-iSCSI iscsiuio Socket.
[  OK  ] Listening on RPCbind Server Activation Socket.
         Starting RPC bind service...
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Listening on Virtual machine log manager socket.
[  OK  ] Reached target Timers.
[  OK  ] Listening on Virtual machine lock manager socket.
[  OK  ] Reached target Sockets.
[  OK  ] Reached target Paths.
[  OK  ] Reached target Basic System.
         Starting opal_errd (PowerNV platform error handling) Service...
         Starting Initialize hardware monitoring sensors...
         Starting GSSAPI Proxy Daemon...
[  OK  ] Started Hardware RNG Entropy Gatherer Daemon.
         Starting Hardware RNG Entropy Gatherer Daemon...
         Starting Kernel Samepage Merging...
         Starting IBM Power Raid dump daemon...
[  OK  ] Started ABRT Automated Bug Reporting Tool.
         Starting ABRT Automated Bug Reporting Tool...
[  OK  ] Started ABRT kernel log watcher.
         Starting ABRT kernel log watcher...
         Starting Dump dmesg to /var/log/dmesg...
         Starting Resets System Activity Logs...
         Starting Rollback uncommitted netcf...rk config change transactions...
[  OK  ] Started libstoragemgmt plug-in server daemon.
         Starting libstoragemgmt plug-in server daemon...
         Starting ppc64-diag rtas_errd (platform error handling) Service...
[  OK  ] Started D-Bus System Message Bus.
         Starting D-Bus System Message Bus...
[   40.575960] RPC: Registered named UNIX socket transport module.
[   40.575969] RPC: Registered udp transport module.
[   40.575973] RPC: Registered tcp transport module.
[   40.575976] RPC: Registered tcp NFSv4.1 backchannel transport module.
         Starting NTP client/server...
         Starting Login Service...
[  OK  ] Started Self Monitoring and Reporting Technology (SMART) Daemon.
         Starting Self Monitoring and Reporting Technology (SMART) Daemon...
         Starting Perform system configurati...pare system to run KVM guests...
         Starting Authorization Manager...
         Starting Install ABRT coredump hook...
[  OK  ] Mounted RPC Pipe File System.
[  OK  ] Started RPC bind service.
[  OK  ] Started opal_errd (PowerNV platform error handling) Service.
[  OK  ] Started GSSAPI Proxy Daemon.
[  OK  ] Started Kernel Samepage Merging.
[  OK  ] Started IBM Power Raid dump daemon.
[  OK  ] Started Dump dmesg to /var/log/dmesg.
[  OK  ] Started Resets System Activity Logs.
[  OK  ] Started Rollback uncommitted netcf network config change transactions.
[  OK  ] Started Initialize hardware monitoring sensors.
         Starting IBM Power Raid update daemon...
         Starting IBM Power Raid init daemon...
         Starting Kernel Samepage Merging (KSM) Tuning Daemon...
[  OK  ] Reached target rpc_pipefs.target.
[  OK  ] Reached target NFS client services.
[  OK  ] Started ppc64-diag rtas_errd (platform error handling) Service.
[  OK  ] Started IBM Power Raid init daemon.
[  OK  ] Started Login Service.
[  OK  ] Started Kernel Samepage Merging (KSM) Tuning Daemon.
[  OK  ] Started IBM Power Raid update daemon.
[  OK  ] Reached target IBM Power Raid utilities.
[  OK  ] Started Install ABRT coredump hook.
[  OK  ] Started NTP client/server.
[  OK  ] Started Authorization Manager.
         Starting firewalld - dynamic firewall daemon...
[   41.189494] WARNING: CPU: 1 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   41.189498] Modules linked in: kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   41.189531] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.3.0-rc4-next-20190814-autotest #1
[   41.189533] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   41.189535] REGS: c0000007f55b79a0 TRAP: 0700   Not tainted  (5.3.0-rc4-next-20190814-autotest)
[   41.189536] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22024828  XER: 00000000
[   41.189543] CFAR: c0000000000555f4 IRQMASK: 1 
[   41.189543] GPR00: c0000000000555f8 c0000007f55b7c30 c00000000147ae00 0000000000000000 
[   41.189543] GPR04: 0000000000000000 c0000007fa897d00 c0000007fa90c800 00000007f9990000 
[   41.189543] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fa90c800 
[   41.189543] GPR12: c0000000000b59e0 c0000007ffffee00 c0000007b6244700 c0000007e7d72048 
[   41.189543] GPR16: 0000000000000000 c0000007e7d722c0 0000000000000000 c0000000015203c0 
[   41.189543] GPR20: c000000000052ec0 c000000000052e90 c0000007fa905bd8 0000000000000004 
[   41.189543] GPR24: 0000000000000001 0000000000000001 0000000000080000 0000000000000008 
[   41.189543] GPR28: c0000000014b20d8 0000000000000002 c0000000014b2538 0000000000000001 
[   41.189565] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   41.189567] LR [c0000000000555f8] cpu_die+0x48/0x64
[   41.189567] Call Trace:
[   41.189570] [c0000007f55b7c30] [c0000007f55b7dc8] 0xc0000007f55b7dc8 (unreliable)
[   41.189572] [c0000007f55b7e10] [c0000000000555f8] cpu_die+0x48/0x64
[   41.189574] [c0000007f55b7e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   41.189577] [c0000007f55b7e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   41.189579] [c0000007f55b7ed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   41.189580] [c0000007f55b7f00] [c0000000000552f8] start_secondary+0x638/0x680
[   41.189582] [c0000007f55b7f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   41.189583] Instruction dump:
[   41.189583] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   41.189586] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   41.189589] ---[ end trace 003effe0326aa819 ]---
[  OK  ] Started firewalld - dynamic firewall daemon.
[  OK  ] Reached target Network (Pre).
         Starting Network Manager...
         Starting Hostname Service...
[   41.629299] WARNING: CPU: 2 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   41.629302] Modules linked in: iptable_filter(+) kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   41.629331] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   41.629332] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   41.629333] REGS: c0000007f55bb9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   41.629334] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24044828  XER: 00000000
[   41.629337] CFAR: c0000000000555f4 IRQMASK: 1 
[   41.629337] GPR00: c0000000000555f8 c0000007f55bbc30 c00000000147ae00 0000000000000000 
[   41.629337] GPR04: 0000000000000000 c0000007fa897d00 c0000007faa0c800 00000007f9a90000 
[   41.629337] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007faa0c800 
[   41.629337] GPR12: c0000000000b59e0 c0000007ffffdb80 0000000000000000 0000000000000001 
[   41.629337] GPR16: c000000f271e0c20 c0000007fbfb0708 0000000000000000 c0000000015203c0 
[   41.629337] GPR20: c000000000052ec0 c000000000052e90 c0000007faa05bd8 0000000000000008 
[   41.629337] GPR24: 0000000000000002 0000000000000001 0000000000080000 0000000000000010 
[   41.629337] GPR28: c0000000014b20d8 0000000000000004 c0000000014b2538 0000000000000001 
[   41.629349] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   41.629350] LR [c0000000000555f8] cpu_die+0x48/0x64
[   41.629351] Call Trace:
[   41.629353] [c0000007f55bbc30] [c0000007f55bbdc8] 0xc0000007f55bbdc8 (unreliable)
[   41.629354] [c0000007f55bbe10] [c0000000000555f8] cpu_die+0x48/0x64
[   41.629356] [c0000007f55bbe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   41.629359] [c0000007f55bbe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   41.629361] [c0000007f55bbed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   41.629362] [c0000007f55bbf00] [c0000000000552f8] start_secondary+0x638/0x680
[   41.629364] [c0000007f55bbf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   41.629365] Instruction dump:
[   41.629366] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   41.629368] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   41.629371] ---[ end trace 003effe0326aa81a ]---
[  OK  ] Started Hostname Service.
[  OK  ] Started Network Manager.
         Starting Network Manager Script Dispatcher Service...
         Starting Network Manager Wait Online...
[  OK  ] Started Network Manager Script Dispatcher Service.
[   42.189287] WARNING: CPU: 3 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   42.189291] Modules linked in: iptable_filter(+) kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   42.189317] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   42.189318] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   42.189320] REGS: c0000007f55bf9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   42.189320] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   42.189323] CFAR: c0000000000555f4 IRQMASK: 1 
[   42.189323] GPR00: c0000000000555f8 c0000007f55bfc30 c00000000147ae00 0000000000000000 
[   42.189323] GPR04: 0000000000000000 c0000007fa897d00 c0000007fab0c800 00000007f9b90000 
[   42.189323] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fab0c800 
[   42.189323] GPR12: c0000000000b59e0 c0000007ffffc900 0000000000000800 c000000ffffc11d0 
[   42.189323] GPR16: 0000000000000004 c000000001035280 0000000000000000 c0000000015203c0 
[   42.189323] GPR20: c000000000052ec0 c000000000052e90 c0000007fab05bd8 000000000000000c 
[   42.189323] GPR24: 0000000000000003 0000000000000001 0000000000080000 0000000000000018 
[   42.189323] GPR28: c0000000014b20d8 0000000000000008 c0000000014b2538 0000000000000001 
[   42.189335] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   42.189337] LR [c0000000000555f8] cpu_die+0x48/0x64
[   42.189338] Call Trace:
[   42.189340] [c0000007f55bfc30] [c0000007f55bfdc8] 0xc0000007f55bfdc8 (unreliable)
[   42.189341] [c0000007f55bfe10] [c0000000000555f8] cpu_die+0x48/0x64
[   42.189344] [c0000007f55bfe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   42.189346] [c0000007f55bfe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   42.189348] [c0000007f55bfed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   42.189349] [c0000007f55bff00] [c0000000000552f8] start_secondary+0x638/0x680
[   42.189351] [c0000007f55bff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   42.189352] Instruction dump:
[   42.189353] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   42.189356] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   42.189358] ---[ end trace 003effe0326aa81b ]---
[   42.579342] WARNING: CPU: 4 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   42.579345] Modules linked in: ip6_tables(+) iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   42.579379] CPU: 4 PID: 0 Comm: swapper/4 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   42.579381] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   42.579383] REGS: c0000007f55c39a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   42.579383] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24024028  XER: 00000000
[   42.579389] CFAR: c0000000000555f4 IRQMASK: 1 
[   42.579389] GPR00: c0000000000555f8 c0000007f55c3c30 c00000000147ae00 0000000000000000 
[   42.579389] GPR04: 0000000000000000 c0000007fa897d00 c0000007fac0c800 00000007f9c90000 
[   42.579389] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fac0c800 
[   42.579389] GPR12: c0000000000b59e0 c0000007ffffb680 c0000000016b1d0c 0000000000000090 
[   42.579389] GPR16: c00000000169d640 c0000000016b1d1c 0000000000000000 c0000000015203c0 
[   42.579389] GPR20: c000000000052ec0 c000000000052e90 c0000007fac05bd8 0000000000000010 
[   42.579389] GPR24: 0000000000000004 0000000000000001 0000000000080000 0000000000000020 
[   42.579389] GPR28: c0000000014b20d8 0000000000000010 c0000000014b2538 0000000000000001 
[   42.579410] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   42.579412] LR [c0000000000555f8] cpu_die+0x48/0x64
[   42.579413] Call Trace:
[   42.579416] [c0000007f55c3c30] [c0000007f55c3dc8] 0xc0000007f55c3dc8 (unreliable)
[   42.579419] [c0000007f55c3e10] [c0000000000555f8] cpu_die+0x48/0x64
[   42.579423] [c0000007f55c3e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   42.579426] [c0000007f55c3e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   42.579429] [c0000007f55c3ed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   42.579432] [c0000007f55c3f00] [c0000000000552f8] start_secondary+0x638/0x680
[   42.579435] [c0000007f55c3f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   42.579436] Instruction dump:
[   42.579437] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   42.579441] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   42.579446] ---[ end trace 003effe0326aa81c ]---
[   42.919234] WARNING: CPU: 5 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   42.919236] Modules linked in: ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   42.919269] CPU: 5 PID: 0 Comm: swapper/5 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   42.919271] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   42.919273] REGS: c0000007f55c79a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   42.919274] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   42.919281] CFAR: c0000000000555f4 IRQMASK: 1 
[   42.919281] GPR00: c0000000000555f8 c0000007f55c7c30 c00000000147ae00 0000000000000000 
[   42.919281] GPR04: 0000000000000000 c0000007fa897d00 c0000007fad0c800 00000007f9d90000 
[   42.919281] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fad0c800 
[   42.919281] GPR12: c0000000000b59e0 c0000007ffffa400 0000000000000800 c000000ffffc11d0 
[   42.919281] GPR16: 0000000000000010 c000000001035280 0000000000000000 c0000000015203c0 
[   42.919281] GPR20: c000000000052ec0 c000000000052e90 c0000007fad05bd8 0000000000000014 
[   42.919281] GPR24: 0000000000000005 0000000000000001 0000000000080000 0000000000000028 
[   42.919281] GPR28: c0000000014b20d8 0000000000000020 c0000000014b2538 0000000000000001 
[   42.919301] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   42.919303] LR [c0000000000555f8] cpu_die+0x48/0x64
[   42.919304] Call Trace:
[   42.919306] [c0000007f55c7c30] [c0000007f55c7dc8] 0xc0000007f55c7dc8 (unreliable)
[   42.919309] [c0000007f55c7e10] [c0000000000555f8] cpu_die+0x48/0x64
[   42.919312] [c0000007f55c7e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   42.919315] [c0000007f55c7e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   42.919319] [c0000007f55c7ed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   42.919321] [c0000007f55c7f00] [c0000000000552f8] start_secondary+0x638/0x680
[   42.919324] [c0000007f55c7f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   42.919325] Instruction dump:
[   42.919326] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   42.919330] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   42.919335] ---[ end trace 003effe0326aa81d ]---
[   43.259208] WARNING: CPU: 6 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   43.259211] Modules linked in: ip6table_filter(+) ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   43.259240] CPU: 6 PID: 0 Comm: swapper/6 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   43.259242] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   43.259244] REGS: c0000007f55cb9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   43.259245] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24884828  XER: 00000000
[   43.259252] CFAR: c0000000000555f4 IRQMASK: 1 
[   43.259252] GPR00: c0000000000555f8 c0000007f55cbc30 c00000000147ae00 0000000000000000 
[   43.259252] GPR04: 0000000000000000 c0000007fa897d00 c0000007fae0c800 00000007f9e90000 
[   43.259252] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fae0c800 
[   43.259252] GPR12: c0000000000b59e0 c0000007ffff9180 0000000000000000 c0000007c7de0480 
[   43.259252] GPR16: c0000007c7cd0480 0000000000000800 0000000000000000 c0000000015203c0 
[   43.259252] GPR20: c000000000052ec0 c000000000052e90 c0000007fae05bd8 0000000000000018 
[   43.259252] GPR24: 0000000000000006 0000000000000001 0000000000080000 0000000000000030 
[   43.259252] GPR28: c0000000014b20d8 0000000000000040 c0000000014b2538 0000000000000001 
[   43.259273] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   43.259276] LR [c0000000000555f8] cpu_die+0x48/0x64
[   43.259276] Call Trace:
[   43.259279] [c0000007f55cbc30] [c0000007f55cbdc8] 0xc0000007f55cbdc8 (unreliable)
[   43.259281] [c0000007f55cbe10] [c0000000000555f8] cpu_die+0x48/0x64
[   43.259285] [c0000007f55cbe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   43.259288] [c0000007f55cbe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   43.259291] [c0000007f55cbed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   43.259294] [c0000007f55cbf00] [c0000000000552f8] start_secondary+0x638/0x680
[   43.259297] [c0000007f55cbf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   43.259298] Instruction dump:
[   43.259299] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   43.259303] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   43.259307] ---[ end trace 003effe0326aa81e ]---
[   43.490798] tg3 0005:09:00.0 enP5p9s0f0: Link is up at 100 Mbps, full duplex
[   43.490819] tg3 0005:09:00.0 enP5p9s0f0: Flow control is on for TX and on for RX
[   43.490827] tg3 0005:09:00.0 enP5p9s0f0: EEE is disabled
[   43.490848] IPv6: ADDRCONF(NETDEV_CHANGE): enP5p9s0f0: link becomes ready
[   43.699212] WARNING: CPU: 7 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   43.699214] Modules linked in: ebtables(+) ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   43.699241] CPU: 7 PID: 0 Comm: swapper/7 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   43.699243] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   43.699246] REGS: c0000007f55cf9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   43.699247] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004828  XER: 00000000
[   43.699253] CFAR: c0000000000555f4 IRQMASK: 1 
[   43.699253] GPR00: c0000000000555f8 c0000007f55cfc30 c00000000147ae00 0000000000000000 
[   43.699253] GPR04: 0000000000000000 c0000007fa897d00 c0000007faf0c800 00000007f9f90000 
[   43.699253] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007faf0c800 
[   43.699253] GPR12: c0000000000b59e0 c0000007ffff7f00 0000000000000000 0000000000000000 
[   43.699253] GPR16: 0000000000000000 0000000000000000 0000000000000000 c0000000015203c0 
[   43.699253] GPR20: c000000000052ec0 c000000000052e90 c0000007faf05bd8 000000000000001c 
[   43.699253] GPR24: 0000000000000007 0000000000000001 0000000000080000 0000000000000038 
[   43.699253] GPR28: c0000000014b20d8 0000000000000080 c0000000014b2538 0000000000000001 
[   43.699274] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   43.699276] LR [c0000000000555f8] cpu_die+0x48/0x64
[   43.699277] Call Trace:
[   43.699279] [c0000007f55cfc30] [c0000007f55cfdc8] 0xc0000007f55cfdc8 (unreliable)
[   43.699282] [c0000007f55cfe10] [c0000000000555f8] cpu_die+0x48/0x64
[   43.699286] [c0000007f55cfe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   43.699289] [c0000007f55cfe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   43.699292] [c0000007f55cfed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   43.699295] [c0000007f55cff00] [c0000000000552f8] start_secondary+0x638/0x680
[   43.699298] [c0000007f55cff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   43.699299] Instruction dump:
[   43.699300] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   43.699304] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   43.699308] ---[ end trace 003effe0326aa81f ]---
[   44.069357] WARNING: CPU: 9 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   44.069361] Modules linked in: ebtable_filter(+) ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   44.069405] CPU: 9 PID: 0 Comm: swapper/9 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   44.069406] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   44.069408] REGS: c0000007f55d79a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   44.069409] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   44.069415] CFAR: c0000000000555f4 IRQMASK: 1 
[   44.069415] GPR00: c0000000000555f8 c0000007f55d7c30 c00000000147ae00 0000000000000000 
[   44.069415] GPR04: 0000000000000000 c0000007fa897d00 c0000007fb10c800 00000007fa190000 
[   44.069415] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fb10c800 
[   44.069415] GPR12: c0000000000b59e0 c0000007ffff5a00 0000000000000800 c000000ffffc11d0 
[   44.069415] GPR16: 0000000000000100 c000000001035280 0000000000000008 c0000000015203c0 
[   44.069415] GPR20: c000000000052ec0 c000000000052e90 c0000007fb105bd8 0000000000000024 
[   44.069415] GPR24: 0000000000000009 0000000000000001 0000000000080000 0000000000000048 
[   44.069415] GPR28: c0000000014b20d8 0000000000000200 c0000000014b2538 0000000000000001 
[   44.069434] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   44.069437] LR [c0000000000555f8] cpu_die+0x48/0x64
[   44.069437] Call Trace:
[   44.069440] [c0000007f55d7c30] [c0000007f55d7dc8] 0xc0000007f55d7dc8 (unreliable)
[   44.069443] [c0000007f55d7e10] [c0000000000555f8] cpu_die+0x48/0x64
[   44.069446] [c0000007f55d7e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   44.069450] [c0000007f55d7e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   44.069453] [c0000007f55d7ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   44.069455] [c0000007f55d7f00] [c0000000000552f8] start_secondary+0x638/0x680
[   44.069458] [c0000007f55d7f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   44.069459] Instruction dump:
[   44.069460] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   44.069465] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   44.069469] ---[ end trace 003effe0326aa820 ]---
[   44.369260] WARNING: CPU: 10 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   44.369262] Modules linked in: ebtable_filter(+) ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   44.369312] CPU: 10 PID: 0 Comm: swapper/10 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   44.369315] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   44.369317] REGS: c0000007f55db9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   44.369318] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   44.369324] CFAR: c0000000000555f4 IRQMASK: 1 
[   44.369324] GPR00: c0000000000555f8 c0000007f55dbc30 c00000000147ae00 0000000000000000 
[   44.369324] GPR04: 0000000000000000 c0000007fa897d00 c0000007fb20c800 00000007fa290000 
[   44.369324] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fb20c800 
[   44.369324] GPR12: c0000000000b59e0 c0000007ffff4780 0000000000000800 c000000ffffc11d0 
[   44.369324] GPR16: 0000000000000200 c000000001035280 0000000000000008 c0000000015203c0 
[   44.369324] GPR20: c000000000052ec0 c000000000052e90 c0000007fb205bd8 0000000000000028 
[   44.369324] GPR24: 000000000000000a 0000000000000001 0000000000080000 0000000000000050 
[   44.369324] GPR28: c0000000014b20d8 0000000000000400 c0000000014b2538 0000000000000001 
[   44.369344] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   44.369346] LR [c0000000000555f8] cpu_die+0x48/0x64
[   44.369347] Call Trace:
[   44.369349] [c0000007f55dbc30] [c0000007f55dbdc8] 0xc0000007f55dbdc8 (unreliable)
[   44.369351] [c0000007f55dbe10] [c0000000000555f8] cpu_die+0x48/0x64
[   44.369355] [c0000007f55dbe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   44.369358] [c0000007f55dbe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   44.369361] [c0000007f55dbed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   44.369363] [c0000007f55dbf00] [c0000000000552f8] start_secondary+0x638/0x680
[   44.369367] [c0000007f55dbf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   44.369367] Instruction dump:
[   44.369368] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   44.369373] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   44.369377] ---[ end trace 003effe0326aa821 ]---
[   44.689300] WARNING: CPU: 11 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   44.689304] Modules linked in: iptable_raw(+) ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   44.689343] CPU: 11 PID: 0 Comm: swapper/11 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   44.689345] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   44.689347] REGS: c0000007f55df9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   44.689348] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   44.689354] CFAR: c0000000000555f4 IRQMASK: 1 
[   44.689354] GPR00: c0000000000555f8 c0000007f55dfc30 c00000000147ae00 0000000000000000 
[   44.689354] GPR04: 0000000000000000 c0000007fa897d00 c0000007fb30c800 00000007fa390000 
[   44.689354] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fb30c800 
[   44.689354] GPR12: c0000000000b59e0 c0000007ffff3500 0000000000000800 c000000ffffc11d0 
[   44.689354] GPR16: 0000000000000400 c000000001035280 0000000000000008 c0000000015203c0 
[   44.689354] GPR20: c000000000052ec0 c000000000052e90 c0000007fb305bd8 000000000000002c 
[   44.689354] GPR24: 000000000000000b 0000000000000001 0000000000080000 0000000000000058 
[   44.689354] GPR28: c0000000014b20d8 0000000000000800 c0000000014b2538 0000000000000001 
[   44.689375] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   44.689377] LR [c0000000000555f8] cpu_die+0x48/0x64
[   44.689378] Call Trace:
[   44.689381] [c0000007f55dfc30] [c0000007f55dfdc8] 0xc0000007f55dfdc8 (unreliable)
[   44.689384] [c0000007f55dfe10] [c0000000000555f8] cpu_die+0x48/0x64
[   44.689388] [c0000007f55dfe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   44.689391] [c0000007f55dfe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   44.689394] [c0000007f55dfed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   44.689396] [c0000007f55dff00] [c0000000000552f8] start_secondary+0x638/0x680
[   44.689400] [c0000007f55dff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   44.689401] Instruction dump:
[   44.689402] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   44.689406] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   44.689410] ---[ end trace 003effe0326aa822 ]---
[   45.019213] WARNING: CPU: 12 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   45.019215] Modules linked in: iptable_raw(+) ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   45.019257] CPU: 12 PID: 0 Comm: swapper/12 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   45.019260] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   45.019262] REGS: c0000007f55e39a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   45.019263] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   45.019270] CFAR: c0000000000555f4 IRQMASK: 1 
[   45.019270] GPR00: c0000000000555f8 c0000007f55e3c30 c00000000147ae00 0000000000000000 
[   45.019270] GPR04: 0000000000000000 c0000007fa897d00 c0000007fb40c800 00000007fa490000 
[   45.019270] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fb40c800 
[   45.019270] GPR12: c0000000000b59e0 c0000007ffff2280 0000000000000800 c000000ffffc11d0 
[   45.019270] GPR16: 0000000000000800 c000000001035280 0000000000000008 c0000000015203c0 
[   45.019270] GPR20: c000000000052ec0 c000000000052e90 c0000007fb405bd8 0000000000000030 
[   45.019270] GPR24: 000000000000000c 0000000000000001 0000000000080000 0000000000000060 
[   45.019270] GPR28: c0000000014b20d8 0000000000001000 c0000000014b2538 0000000000000001 
[   45.019293] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   45.019295] LR [c0000000000555f8] cpu_die+0x48/0x64
[   45.019296] Call Trace:
[   45.019298] [c0000007f55e3c30] [c0000007f55e3dc8] 0xc0000007f55e3dc8 (unreliable)
[   45.019302] [c0000007f55e3e10] [c0000000000555f8] cpu_die+0x48/0x64
[   45.019305] [c0000007f55e3e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   45.019309] [c0000007f55e3e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   45.019312] [c0000007f55e3ed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   45.019315] [c0000007f55e3f00] [c0000000000552f8] start_secondary+0x638/0x680
[   45.019318] [c0000007f55e3f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   45.019319] Instruction dump:
[   45.019321] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   45.019325] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   45.019330] ---[ end trace 003effe0326aa823 ]---
[   45.369216] WARNING: CPU: 13 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   45.369220] Modules linked in: iptable_security(+) iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   45.369251] CPU: 13 PID: 0 Comm: swapper/13 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   45.369253] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   45.369255] REGS: c0000007f55e79a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   45.369256] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   45.369262] CFAR: c0000000000555f4 IRQMASK: 1 
[   45.369262] GPR00: c0000000000555f8 c0000007f55e7c30 c00000000147ae00 0000000000000000 
[   45.369262] GPR04: 0000000000000000 c0000007fa897d00 c0000007fb50c800 00000007fa590000 
[   45.369262] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fb50c800 
[   45.369262] GPR12: c0000000000b59e0 c0000007ffff1000 0000000000000800 c000000ffffc11d0 
[   45.369262] GPR16: 0000000000001000 c000000001035280 0000000000000008 c0000000015203c0 
[   45.369262] GPR20: c000000000052ec0 c000000000052e90 c0000007fb505bd8 0000000000000034 
[   45.369262] GPR24: 000000000000000d 0000000000000001 0000000000080000 0000000000000068 
[   45.369262] GPR28: c0000000014b20d8 0000000000002000 c0000000014b2538 0000000000000001 
[   45.369282] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   45.369285] LR [c0000000000555f8] cpu_die+0x48/0x64
[   45.369286] Call Trace:
[   45.369288] [c0000007f55e7c30] [c0000007f55e7dc8] 0xc0000007f55e7dc8 (unreliable)
[   45.369291] [c0000007f55e7e10] [c0000000000555f8] cpu_die+0x48/0x64
[   45.369295] [c0000007f55e7e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   45.369298] [c0000007f55e7e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   45.369301] [c0000007f55e7ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   45.369304] [c0000007f55e7f00] [c0000000000552f8] start_secondary+0x638/0x680
[   45.369307] [c0000007f55e7f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   45.369308] Instruction dump:
[   45.369309] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   45.369313] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   45.369318] ---[ end trace 003effe0326aa824 ]---
[   45.689106] WARNING: CPU: 14 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   45.689107] Modules linked in: iptable_security(+) iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   45.689136] CPU: 14 PID: 0 Comm: swapper/14 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   45.689138] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   45.689141] REGS: c0000007f55eb9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   45.689142] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   45.689149] CFAR: c0000000000555f4 IRQMASK: 1 
[   45.689149] GPR00: c0000000000555f8 c0000007f55ebc30 c00000000147ae00 0000000000000000 
[   45.689149] GPR04: 0000000000000000 c0000007fa897d00 c0000007fb60c800 00000007fa690000 
[   45.689149] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fb60c800 
[   45.689149] GPR12: c0000000000b59e0 c0000007fffefd80 0000000000000800 c000000ffffc11d0 
[   45.689149] GPR16: 0000000000002000 c000000001035280 0000000000000008 c0000000015203c0 
[   45.689149] GPR20: c000000000052ec0 c000000000052e90 c0000007fb605bd8 0000000000000038 
[   45.689149] GPR24: 000000000000000e 0000000000000001 0000000000080000 0000000000000070 
[   45.689149] GPR28: c0000000014b20d8 0000000000004000 c0000000014b2538 0000000000000001 
[   45.689171] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   45.689173] LR [c0000000000555f8] cpu_die+0x48/0x64
[   45.689174] Call Trace:
[   45.689176] [c0000007f55ebc30] [c0000007f55ebdc8] 0xc0000007f55ebdc8 (unreliable)
[   45.689178] [c0000007f55ebe10] [c0000000000555f8] cpu_die+0x48/0x64
[   45.689182] [c0000007f55ebe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   45.689185] [c0000007f55ebe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   45.689188] [c0000007f55ebed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   45.689190] [c0000007f55ebf00] [c0000000000552f8] start_secondary+0x638/0x680
[   45.689193] [c0000007f55ebf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   45.689194] Instruction dump:
[   45.689195] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   45.689199] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   45.689204] ---[ end trace 003effe0326aa825 ]---
[   46.069143] WARNING: CPU: 15 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   46.069146] Modules linked in: iptable_mangle(+) iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   46.069173] CPU: 15 PID: 0 Comm: swapper/15 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   46.069176] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   46.069178] REGS: c0000007f55ef9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   46.069179] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   46.069186] CFAR: c0000000000555f4 IRQMASK: 1 
[   46.069186] GPR00: c0000000000555f8 c0000007f55efc30 c00000000147ae00 0000000000000000 
[   46.069186] GPR04: 0000000000000000 c0000007fa897d00 c0000007fb70c800 00000007fa790000 
[   46.069186] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fb70c800 
[   46.069186] GPR12: c0000000000b59e0 c0000007fffeeb00 0000000000000800 c000000ffffc11d0 
[   46.069186] GPR16: 0000000000004000 c000000001035280 0000000000000008 c0000000015203c0 
[   46.069186] GPR20: c000000000052ec0 c000000000052e90 c0000007fb705bd8 000000000000003c 
[   46.069186] GPR24: 000000000000000f 0000000000000001 0000000000080000 0000000000000078 
[   46.069186] GPR28: c0000000014b20d8 0000000000008000 c0000000014b2538 0000000000000001 
[   46.069206] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   46.069209] LR [c0000000000555f8] cpu_die+0x48/0x64
[   46.069210] Call Trace:
[   46.069213] [c0000007f55efc30] [c0000007f55efdc8] 0xc0000007f55efdc8 (unreliable)
[   46.069215] [c0000007f55efe10] [c0000000000555f8] cpu_die+0x48/0x64
[   46.069219] [c0000007f55efe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   46.069223] [c0000007f55efe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   46.069226] [c0000007f55efed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   46.069228] [c0000007f55eff00] [c0000000000552f8] start_secondary+0x638/0x680
[   46.069231] [c0000007f55eff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   46.069232] Instruction dump:
[   46.069233] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   46.069238] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   46.069242] ---[ end trace 003effe0326aa826 ]---
[   46.409276] WARNING: CPU: 17 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   46.409279] Modules linked in: iptable_mangle(+) iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   46.409320] CPU: 17 PID: 0 Comm: swapper/17 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   46.409322] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   46.409325] REGS: c0000007f55f79a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   46.409326] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 28004028  XER: 00000000
[   46.409332] CFAR: c0000000000555f4 IRQMASK: 1 
[   46.409332] GPR00: c0000000000555f8 c0000007f55f7c30 c00000000147ae00 0000000000000000 
[   46.409332] GPR04: 0000000000000000 c0000007fa897d00 c0000007fb90c800 00000007fa990000 
[   46.409332] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fb90c800 
[   46.409332] GPR12: c0000000000b59e0 c0000007fffec600 0000000000000800 c000000ffffc11d0 
[   46.409332] GPR16: 0000000000010000 c000000001035280 0000000000000010 c0000000015203c0 
[   46.409332] GPR20: c000000000052ec0 c000000000052e90 c0000007fb905bd8 0000000000000044 
[   46.409332] GPR24: 0000000000000011 0000000000000001 0000000000080000 0000000000000088 
[   46.409332] GPR28: c0000000014b20d8 0000000000020000 c0000000014b2538 0000000000000001 
[   46.409353] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   46.409355] LR [c0000000000555f8] cpu_die+0x48/0x64
[   46.409356] Call Trace:
[   46.409358] [c0000007f55f7c30] [0000000000000010] 0x10 (unreliable)
[   46.409361] [c0000007f55f7e10] [c0000000000555f8] cpu_die+0x48/0x64
[   46.409364] [c0000007f55f7e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   46.409367] [c0000007f55f7e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   46.409370] [c0000007f55f7ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   46.409372] [c0000007f55f7f00] [c0000000000552f8] start_secondary+0x638/0x680
[   46.409375] [c0000007f55f7f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   46.409376] Instruction dump:
[   46.409377] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   46.409381] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   46.409386] ---[ end trace 003effe0326aa827 ]---
[   46.779244] WARNING: CPU: 18 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   46.779249] Modules linked in: libcrc32c(+) iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   46.779291] CPU: 18 PID: 0 Comm: swapper/18 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   46.779293] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   46.779295] REGS: c0000007f55fb9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   46.779296] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   46.779301] CFAR: c0000000000555f4 IRQMASK: 1 
[   46.779301] GPR00: c0000000000555f8 c0000007f55fbc30 c00000000147ae00 0000000000000000 
[   46.779301] GPR04: 0000000000000000 c0000007fa897d00 c0000007fba0c800 00000007faa90000 
[   46.779301] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fba0c800 
[   46.779301] GPR12: c0000000000b59e0 c0000007fffeb380 0000000000000800 c000000ffffc11d0 
[   46.779301] GPR16: 0000000000020000 c000000001035280 0000000000000010 c0000000015203c0 
[   46.779301] GPR20: c000000000052ec0 c000000000052e90 c0000007fba05bd8 0000000000000048 
[   46.779301] GPR24: 0000000000000012 0000000000000001 0000000000080000 0000000000000090 
[   46.779301] GPR28: c0000000014b20d8 0000000000040000 c0000000014b2538 0000000000000001 
[   46.779321] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   46.779324] LR [c0000000000555f8] cpu_die+0x48/0x64
[   46.779324] Call Trace:
[   46.779327] [c0000007f55fbc30] [c0000007f55fbdc8] 0xc0000007f55fbdc8 (unreliable)
[   46.779330] [c0000007f55fbe10] [c0000000000555f8] cpu_die+0x48/0x64
[   46.779333] [c0000007f55fbe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   46.779336] [c0000007f55fbe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   46.779339] [c0000007f55fbed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   46.779342] [c0000007f55fbf00] [c0000000000552f8] start_secondary+0x638/0x680
[   46.779345] [c0000007f55fbf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   46.779346] Instruction dump:
[   46.779347] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   46.779351] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   46.779356] ---[ end trace 003effe0326aa828 ]---
[   47.099179] WARNING: CPU: 19 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   47.099182] Modules linked in: libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   47.099227] CPU: 19 PID: 0 Comm: swapper/19 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   47.099229] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   47.099231] REGS: c0000007f55ff9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   47.099232] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   47.099237] CFAR: c0000000000555f4 IRQMASK: 1 
[   47.099237] GPR00: c0000000000555f8 c0000007f55ffc30 c00000000147ae00 0000000000000000 
[   47.099237] GPR04: 0000000000000000 c0000007fa897d00 c0000007fbb0c800 00000007fab90000 
[   47.099237] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fbb0c800 
[   47.099237] GPR12: c0000000000b59e0 c0000007fffea100 0000000000000800 c000000ffffc11d0 
[   47.099237] GPR16: 0000000000040000 c000000001035280 0000000000000010 c0000000015203c0 
[   47.099237] GPR20: c000000000052ec0 c000000000052e90 c0000007fbb05bd8 000000000000004c 
[   47.099237] GPR24: 0000000000000013 0000000000000001 0000000000080000 0000000000000098 
[   47.099237] GPR28: c0000000014b20d8 0000000000080000 c0000000014b2538 0000000000000001 
[   47.099257] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   47.099259] LR [c0000000000555f8] cpu_die+0x48/0x64
[   47.099260] Call Trace:
[   47.099262] [c0000007f55ffc30] [c0000007f55ffdc8] 0xc0000007f55ffdc8 (unreliable)
[   47.099265] [c0000007f55ffe10] [c0000000000555f8] cpu_die+0x48/0x64
[   47.099268] [c0000007f55ffe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   47.099271] [c0000007f55ffe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   47.099274] [c0000007f55ffed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   47.099277] [c0000007f55fff00] [c0000000000552f8] start_secondary+0x638/0x680
[   47.099280] [c0000007f55fff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   47.099281] Instruction dump:
[   47.099282] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   47.099286] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   47.099291] ---[ end trace 003effe0326aa829 ]---
[   47.439125] WARNING: CPU: 20 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   47.439128] Modules linked in: nf_defrag_ipv4(+) libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   47.439169] CPU: 20 PID: 0 Comm: swapper/20 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   47.439171] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   47.439173] REGS: c0000007f56839a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   47.439174] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   47.439180] CFAR: c0000000000555f4 IRQMASK: 1 
[   47.439180] GPR00: c0000000000555f8 c0000007f5683c30 c00000000147ae00 0000000000000000 
[   47.439180] GPR04: 0000000000000000 c0000007fa897d00 c0000007fbc0c800 00000007fac90000 
[   47.439180] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fbc0c800 
[   47.439180] GPR12: c0000000000b59e0 c0000007fffe8e80 0000000000000800 c000000ffffc11d0 
[   47.439180] GPR16: 0000000000080000 c000000001035280 0000000000000010 c0000000015203c0 
[   47.439180] GPR20: c000000000052ec0 c000000000052e90 c0000007fbc05bd8 0000000000000050 
[   47.439180] GPR24: 0000000000000014 0000000000000001 0000000000080000 00000000000000a0 
[   47.439180] GPR28: c0000000014b20d8 0000000000100000 c0000000014b2538 0000000000000001 
[   47.439203] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   47.439206] LR [c0000000000555f8] cpu_die+0x48/0x64
[   47.439206] Call Trace:
[   47.439208] [c0000007f5683c30] [c0000007f5683dc8] 0xc0000007f5683dc8 (unreliable)
[   47.439212] [c0000007f5683e10] [c0000000000555f8] cpu_die+0x48/0x64
[   47.439215] [c0000007f5683e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   47.439218] [c0000007f5683e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   47.439222] [c0000007f5683ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   47.439225] [c0000007f5683f00] [c0000000000552f8] start_secondary+0x638/0x680
[   47.439228] [c0000007f5683f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   47.439229] Instruction dump:
[   47.439231] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   47.439235] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   47.439241] ---[ end trace 003effe0326aa82a ]---
[   47.789068] WARNING: CPU: 21 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   47.789070] Modules linked in: nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   47.789104] CPU: 21 PID: 0 Comm: swapper/21 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   47.789106] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   47.789108] REGS: c0000007f56879a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   47.789109] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   47.789114] CFAR: c0000000000555f4 IRQMASK: 1 
[   47.789114] GPR00: c0000000000555f8 c0000007f5687c30 c00000000147ae00 0000000000000000 
[   47.789114] GPR04: 0000000000000000 c0000007fa897d00 c0000007fbd0c800 00000007fad90000 
[   47.789114] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fbd0c800 
[   47.789114] GPR12: c0000000000b59e0 c0000007fffe7c00 0000000000000800 c000000ffffc11d0 
[   47.789114] GPR16: 0000000000100000 c000000001035280 0000000000000010 c0000000015203c0 
[   47.789114] GPR20: c000000000052ec0 c000000000052e90 c0000007fbd05bd8 0000000000000054 
[   47.789114] GPR24: 0000000000000015 0000000000000001 0000000000080000 00000000000000a8 
[   47.789114] GPR28: c0000000014b20d8 0000000000200000 c0000000014b2538 0000000000000001 
[   47.789136] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   47.789139] LR [c0000000000555f8] cpu_die+0x48/0x64
[   47.789139] Call Trace:
[   47.789141] [c0000007f5687c30] [c0000007f5687dc8] 0xc0000007f5687dc8 (unreliable)
[   47.789144] [c0000007f5687e10] [c0000000000555f8] cpu_die+0x48/0x64
[   47.789148] [c0000007f5687e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   47.789151] [c0000007f5687e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   47.789154] [c0000007f5687ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   47.789157] [c0000007f5687f00] [c0000000000552f8] start_secondary+0x638/0x680
[   47.789160] [c0000007f5687f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   47.789162] Instruction dump:
[   47.789163] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   47.789167] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   47.789172] ---[ end trace 003effe0326aa82b ]---
[   48.199035] WARNING: CPU: 22 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   48.199037] Modules linked in: nf_defrag_ipv6(+) nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   48.199068] CPU: 22 PID: 0 Comm: swapper/22 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   48.199069] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   48.199071] REGS: c0000007f568b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   48.199072] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   48.199078] CFAR: c0000000000555f4 IRQMASK: 1 
[   48.199078] GPR00: c0000000000555f8 c0000007f568bc30 c00000000147ae00 0000000000000000 
[   48.199078] GPR04: 0000000000000000 c0000007fa897d00 c0000007fbe0c800 00000007fae90000 
[   48.199078] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fbe0c800 
[   48.199078] GPR12: c0000000000b59e0 c0000007fffe6980 0000000000000800 c000000ffffc11d0 
[   48.199078] GPR16: 0000000000200000 c000000001035280 0000000000000010 c0000000015203c0 
[   48.199078] GPR20: c000000000052ec0 c000000000052e90 c0000007fbe05bd8 0000000000000058 
[   48.199078] GPR24: 0000000000000016 0000000000000001 0000000000080000 00000000000000b0 
[   48.199078] GPR28: c0000000014b20d8 0000000000400000 c0000000014b2538 0000000000000001 
[   48.199101] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   48.199104] LR [c0000000000555f8] cpu_die+0x48/0x64
[   48.199104] Call Trace:
[   48.199106] [c0000007f568bc30] [c0000007f568bdc8] 0xc0000007f568bdc8 (unreliable)
[   48.199110] [c0000007f568be10] [c0000000000555f8] cpu_die+0x48/0x64
[   48.199113] [c0000007f568be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   48.199116] [c0000007f568be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   48.199120] [c0000007f568bed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   48.199123] [c0000007f568bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   48.199126] [c0000007f568bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   48.199127] Instruction dump:
[   48.199128] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   48.199133] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   48.199138] ---[ end trace 003effe0326aa82c ]---
[   48.539010] WARNING: CPU: 23 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   48.539011] Modules linked in: nf_defrag_ipv6(+) nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   48.539037] CPU: 23 PID: 0 Comm: swapper/23 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   48.539039] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   48.539042] REGS: c0000007f568f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   48.539043] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   48.539049] CFAR: c0000000000555f4 IRQMASK: 1 
[   48.539049] GPR00: c0000000000555f8 c0000007f568fc30 c00000000147ae00 0000000000000000 
[   48.539049] GPR04: 0000000000000000 c0000007fa897d00 c0000007fbf0c800 00000007faf90000 
[   48.539049] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fbf0c800 
[   48.539049] GPR12: c0000000000b59e0 c0000007fffe5700 0000000000000800 c000000ffffc11d0 
[   48.539049] GPR16: 0000000000400000 c000000001035280 0000000000000010 c0000000015203c0 
[   48.539049] GPR20: c000000000052ec0 c000000000052e90 c0000007fbf05bd8 000000000000005c 
[   48.539049] GPR24: 0000000000000017 0000000000000001 0000000000080000 00000000000000b8 
[   48.539049] GPR28: c0000000014b20d8 0000000000800000 c0000000014b2538 0000000000000001 
[   48.539069] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   48.539071] LR [c0000000000555f8] cpu_die+0x48/0x64
[   48.539072] Call Trace:
[   48.539074] [c0000007f568fc30] [c0000007f568fdc8] 0xc0000007f568fdc8 (unreliable)
[   48.539076] [c0000007f568fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   48.539080] [c0000007f568fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   48.539083] [c0000007f568fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   48.539086] [c0000007f568fed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   48.539088] [c0000007f568ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   48.539091] [c0000007f568ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   48.539092] Instruction dump:
[   48.539093] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   48.539097] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   48.539102] ---[ end trace 003effe0326aa82d ]---
[   48.979223] WARNING: CPU: 25 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   48.979227] Modules linked in: nf_conntrack(+) nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   48.979278] CPU: 25 PID: 0 Comm: swapper/25 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   48.979280] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   48.979282] REGS: c0000007f56979a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   48.979283] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   48.979289] CFAR: c0000000000555f4 IRQMASK: 1 
[   48.979289] GPR00: c0000000000555f8 c0000007f5697c30 c00000000147ae00 0000000000000000 
[   48.979289] GPR04: 0000000000000000 c0000007fa897d00 c0000007fc10c800 00000007fb190000 
[   48.979289] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fc10c800 
[   48.979289] GPR12: c0000000000b59e0 c0000007fffe3200 0000000000000800 c000000ffffc11d0 
[   48.979289] GPR16: 0000000001000000 c000000001035280 0000000000000018 c0000000015203c0 
[   48.979289] GPR20: c000000000052ec0 c000000000052e90 c0000007fc105bd8 0000000000000064 
[   48.979289] GPR24: 0000000000000019 0000000000000001 0000000000080000 00000000000000c8 
[   48.979289] GPR28: c0000000014b20d8 0000000002000000 c0000000014b2538 0000000000000001 
[   48.979310] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   48.979312] LR [c0000000000555f8] cpu_die+0x48/0x64
[   48.979313] Call Trace:
[   48.979315] [c0000007f5697c30] [c0000007f5697dc8] 0xc0000007f5697dc8 (unreliable)
[   48.979318] [c0000007f5697e10] [c0000000000555f8] cpu_die+0x48/0x64
[   48.979322] [c0000007f5697e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   48.979325] [c0000007f5697e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   48.979328] [c0000007f5697ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   48.979331] [c0000007f5697f00] [c0000000000552f8] start_secondary+0x638/0x680
[   48.979334] [c0000007f5697f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   48.979335] Instruction dump:
[   48.979336] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   48.979341] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   48.979345] ---[ end trace 003effe0326aa82e ]---
[   49.309038] WARNING: CPU: 26 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   49.309039] Modules linked in: nf_conntrack(+) nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   49.309063] CPU: 26 PID: 0 Comm: swapper/26 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   49.309065] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   49.309067] REGS: c0000007f569b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   49.309068] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   49.309075] CFAR: c0000000000555f4 IRQMASK: 1 
[   49.309075] GPR00: c0000000000555f8 c0000007f569bc30 c00000000147ae00 0000000000000000 
[   49.309075] GPR04: 0000000000000000 c0000007fa897d00 c0000007fc20c800 00000007fb290000 
[   49.309075] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fc20c800 
[   49.309075] GPR12: c0000000000b59e0 c0000007fffe1f80 0000000000000800 c000000ffffc11d0 
[   49.309075] GPR16: 0000000002000000 c000000001035280 0000000000000018 c0000000015203c0 
[   49.309075] GPR20: c000000000052ec0 c000000000052e90 c0000007fc205bd8 0000000000000068 
[   49.309075] GPR24: 000000000000001a 0000000000000001 0000000000080000 00000000000000d0 
[   49.309075] GPR28: c0000000014b20d8 0000000004000000 c0000000014b2538 0000000000000001 
[   49.309098] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   49.309100] LR [c0000000000555f8] cpu_die+0x48/0x64
[   49.309101] Call Trace:
[   49.309104] [c0000007f569bc30] [c0000007f569bdc8] 0xc0000007f569bdc8 (unreliable)
[   49.309107] [c0000007f569be10] [c0000000000555f8] cpu_die+0x48/0x64
[   49.309111] [c0000007f569be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   49.309114] [c0000007f569be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   49.309118] [c0000007f569bed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   49.309121] [c0000007f569bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   49.309124] [c0000007f569bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   49.309126] Instruction dump:
[   49.309127] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   49.309132] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   49.309138] ---[ end trace 003effe0326aa82f ]---
[   49.649033] WARNING: CPU: 27 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   49.649035] Modules linked in: nf_nat(+) nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   49.649074] CPU: 27 PID: 0 Comm: swapper/27 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   49.649076] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   49.649078] REGS: c0000007f569f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   49.649079] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   49.649084] CFAR: c0000000000555f4 IRQMASK: 1 
[   49.649084] GPR00: c0000000000555f8 c0000007f569fc30 c00000000147ae00 0000000000000000 
[   49.649084] GPR04: 0000000000000000 c0000007fa897d00 c0000007fc30c800 00000007fb390000 
[   49.649084] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fc30c800 
[   49.649084] GPR12: c0000000000b59e0 c0000007fffe0d00 0000000000000800 c000000ffffc11d0 
[   49.649084] GPR16: 0000000004000000 c000000001035280 0000000000000018 c0000000015203c0 
[   49.649084] GPR20: c000000000052ec0 c000000000052e90 c0000007fc305bd8 000000000000006c 
[   49.649084] GPR24: 000000000000001b 0000000000000001 0000000000080000 00000000000000d8 
[   49.649084] GPR28: c0000000014b20d8 0000000008000000 c0000000014b2538 0000000000000001 
[   49.649104] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   49.649106] LR [c0000000000555f8] cpu_die+0x48/0x64
[   49.649106] Call Trace:
[   49.649108] [c0000007f569fc30] [c0000007f569fdc8] 0xc0000007f569fdc8 (unreliable)
[   49.649111] [c0000007f569fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   49.649114] [c0000007f569fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   49.649117] [c0000007f569fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   49.649120] [c0000007f569fed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   49.649122] [c0000007f569ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   49.649125] [c0000007f569ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   49.649126] Instruction dump:
[   49.649127] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   49.649132] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   49.649136] ---[ end trace 003effe0326aa830 ]---
[   49.958980] WARNING: CPU: 28 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   49.958982] Modules linked in: nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   49.959018] CPU: 28 PID: 0 Comm: swapper/28 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   49.959019] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   49.959021] REGS: c0000007f56a39a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   49.959022] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   49.959027] CFAR: c0000000000555f4 IRQMASK: 1 
[   49.959027] GPR00: c0000000000555f8 c0000007f56a3c30 c00000000147ae00 0000000000000000 
[   49.959027] GPR04: 0000000000000000 c0000007fa897d00 c0000007fc40c800 00000007fb490000 
[   49.959027] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fc40c800 
[   49.959027] GPR12: c0000000000b59e0 c0000007fffdfa80 0000000000000800 c000000ffffc11d0 
[   49.959027] GPR16: 0000000008000000 c000000001035280 0000000000000018 c0000000015203c0 
[   49.959027] GPR20: c000000000052ec0 c000000000052e90 c0000007fc405bd8 0000000000000070 
[   49.959027] GPR24: 000000000000001c 0000000000000001 0000000000080000 00000000000000e0 
[   49.959027] GPR28: c0000000014b20d8 0000000010000000 c0000000014b2538 0000000000000001 
[   49.959048] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   49.959050] LR [c0000000000555f8] cpu_die+0x48/0x64
[   49.959050] Call Trace:
[   49.959052] [c0000007f56a3c30] [c0000007f56a3dc8] 0xc0000007f56a3dc8 (unreliable)
[   49.959055] [c0000007f56a3e10] [c0000000000555f8] cpu_die+0x48/0x64
[   49.959058] [c0000007f56a3e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   49.959061] [c0000007f56a3e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   49.959064] [c0000007f56a3ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   49.959067] [c0000007f56a3f00] [c0000000000552f8] start_secondary+0x638/0x680
[   49.959070] [c0000007f56a3f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   49.959071] Instruction dump:
[   49.959072] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   49.959076] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   49.959080] ---[ end trace 003effe0326aa831 ]---
[   50.298939] WARNING: CPU: 29 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   50.298940] Modules linked in: iptable_nat(+) nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   50.298976] CPU: 29 PID: 0 Comm: swapper/29 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   50.298978] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   50.298980] REGS: c0000007f56a79a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   50.298981] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   50.298987] CFAR: c0000000000555f4 IRQMASK: 1 
[   50.298987] GPR00: c0000000000555f8 c0000007f56a7c30 c00000000147ae00 0000000000000000 
[   50.298987] GPR04: 0000000000000000 c0000007fa897d00 c0000007fc50c800 00000007fb590000 
[   50.298987] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fc50c800 
[   50.298987] GPR12: c0000000000b59e0 c0000007fffde800 0000000000000800 c000000ffffc11d0 
[   50.298987] GPR16: 0000000010000000 c000000001035280 0000000000000018 c0000000015203c0 
[   50.298987] GPR20: c000000000052ec0 c000000000052e90 c0000007fc505bd8 0000000000000074 
[   50.298987] GPR24: 000000000000001d 0000000000000001 0000000000080000 00000000000000e8 
[   50.298987] GPR28: c0000000014b20d8 0000000020000000 c0000000014b2538 0000000000000001 
[   50.299010] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   50.299012] LR [c0000000000555f8] cpu_die+0x48/0x64
[   50.299013] Call Trace:
[   50.299015] [c0000007f56a7c30] [c0000007f56a7dc8] 0xc0000007f56a7dc8 (unreliable)
[   50.299018] [c0000007f56a7e10] [c0000000000555f8] cpu_die+0x48/0x64
[   50.299022] [c0000007f56a7e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   50.299025] [c0000007f56a7e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   50.299028] [c0000007f56a7ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   50.299031] [c0000007f56a7f00] [c0000000000552f8] start_secondary+0x638/0x680
[   50.299035] [c0000007f56a7f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   50.299036] Instruction dump:
[   50.299037] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   50.299042] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   50.299047] ---[ end trace 003effe0326aa832 ]---
[   50.578894] WARNING: CPU: 30 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   50.578895] Modules linked in: iptable_nat(+) nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   50.578927] CPU: 30 PID: 0 Comm: swapper/30 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   50.578929] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   50.578931] REGS: c0000007f56ab9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   50.578931] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   50.578937] CFAR: c0000000000555f4 IRQMASK: 1 
[   50.578937] GPR00: c0000000000555f8 c0000007f56abc30 c00000000147ae00 0000000000000000 
[   50.578937] GPR04: 0000000000000000 c0000007fa897d00 c0000007fc60c800 00000007fb690000 
[   50.578937] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fc60c800 
[   50.578937] GPR12: c0000000000b59e0 c0000007fffdd580 0000000000000800 c000000ffffc11d0 
[   50.578937] GPR16: 0000000020000000 c000000001035280 0000000000000018 c0000000015203c0 
[   50.578937] GPR20: c000000000052ec0 c000000000052e90 c0000007fc605bd8 0000000000000078 
[   50.578937] GPR24: 000000000000001e 0000000000000001 0000000000080000 00000000000000f0 
[   50.578937] GPR28: c0000000014b20d8 0000000040000000 c0000000014b2538 0000000000000001 
[   50.578957] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   50.578959] LR [c0000000000555f8] cpu_die+0x48/0x64
[   50.578960] Call Trace:
[   50.578962] [c0000007f56abc30] [c0000007f56abdc8] 0xc0000007f56abdc8 (unreliable)
[   50.578964] [c0000007f56abe10] [c0000000000555f8] cpu_die+0x48/0x64
[   50.578968] [c0000007f56abe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   50.578971] [c0000007f56abe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   50.578974] [c0000007f56abed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   50.578976] [c0000007f56abf00] [c0000000000552f8] start_secondary+0x638/0x680
[   50.578979] [c0000007f56abf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   50.578980] Instruction dump:
[   50.578981] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   50.578985] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   50.578990] ---[ end trace 003effe0326aa833 ]---
[   50.908874] WARNING: CPU: 31 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   50.908876] Modules linked in: ip6table_raw(+) iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   50.908904] CPU: 31 PID: 0 Comm: swapper/31 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   50.908905] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   50.908907] REGS: c0000007f56af9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   50.908908] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   50.908913] CFAR: c0000000000555f4 IRQMASK: 1 
[   50.908913] GPR00: c0000000000555f8 c0000007f56afc30 c00000000147ae00 0000000000000000 
[   50.908913] GPR04: 0000000000000000 c0000007fa897d00 c0000007fc70c800 00000007fb790000 
[   50.908913] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fc70c800 
[   50.908913] GPR12: c0000000000b59e0 c0000007fffdc300 0000000000000800 c000000ffffc11d0 
[   50.908913] GPR16: 0000000040000000 c000000001035280 0000000000000018 c0000000015203c0 
[   50.908913] GPR20: c000000000052ec0 c000000000052e90 c0000007fc705bd8 000000000000007c 
[   50.908913] GPR24: 000000000000001f 0000000000000001 0000000000080000 00000000000000f8 
[   50.908913] GPR28: c0000000014b20d8 0000000080000000 c0000000014b2538 0000000000000001 
[   50.908933] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   50.908935] LR [c0000000000555f8] cpu_die+0x48/0x64
[   50.908936] Call Trace:
[   50.908938] [c0000007f56afc30] [c0000007f56afdc8] 0xc0000007f56afdc8 (unreliable)
[   50.908941] [c0000007f56afe10] [c0000000000555f8] cpu_die+0x48/0x64
[   50.908944] [c0000007f56afe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   50.908947] [c0000007f56afe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   50.908950] [c0000007f56afed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   50.908952] [c0000007f56aff00] [c0000000000552f8] start_secondary+0x638/0x680
[   50.908955] [c0000007f56aff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   50.908956] Instruction dump:
[   50.908957] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   50.908962] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   50.908966] ---[ end trace 003effe0326aa834 ]---
[   51.259056] WARNING: CPU: 33 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   51.259061] Modules linked in: ip6table_security(+) ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   51.259103] CPU: 33 PID: 0 Comm: swapper/33 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   51.259105] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   51.259107] REGS: c0000007f56b79a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   51.259108] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   51.259113] CFAR: c0000000000555f4 IRQMASK: 1 
[   51.259113] GPR00: c0000000000555f8 c0000007f56b7c30 c00000000147ae00 0000000000000000 
[   51.259113] GPR04: 0000000000000000 c0000007fa897d00 c0000007fc90c800 00000007fb990000 
[   51.259113] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fc90c800 
[   51.259113] GPR12: c0000000000b59e0 c0000007fffd9e00 0000000000000800 c000000ffffc11d0 
[   51.259113] GPR16: 0000000100000000 c000000001035280 0000000000000020 c0000000015203c0 
[   51.259113] GPR20: c000000000052ec0 c000000000052e90 c0000007fc905bd8 0000000000000084 
[   51.259113] GPR24: 0000000000000021 0000000000000001 0000000000080000 0000000000000108 
[   51.259113] GPR28: c0000000014b20d8 0000000200000000 c0000000014b2538 0000000000000001 
[   51.259134] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   51.259136] LR [c0000000000555f8] cpu_die+0x48/0x64
[   51.259137] Call Trace:
[   51.259139] [c0000007f56b7c30] [c0000007f56b7dc8] 0xc0000007f56b7dc8 (unreliable)
[   51.259142] [c0000007f56b7e10] [c0000000000555f8] cpu_die+0x48/0x64
[   51.259146] [c0000007f56b7e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   51.259149] [c0000007f56b7e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   51.259152] [c0000007f56b7ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   51.259155] [c0000007f56b7f00] [c0000000000552f8] start_secondary+0x638/0x680
[   51.259158] [c0000007f56b7f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   51.259159] Instruction dump:
[   51.259160] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   51.259165] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   51.259169] ---[ end trace 003effe0326aa835 ]---
[   51.589041] WARNING: CPU: 34 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   51.589044] Modules linked in: ip6table_security(+) ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   51.589088] CPU: 34 PID: 0 Comm: swapper/34 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   51.589090] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   51.589092] REGS: c0000007f56bb9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   51.589092] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   51.589098] CFAR: c0000000000555f4 IRQMASK: 1 
[   51.589098] GPR00: c0000000000555f8 c0000007f56bbc30 c00000000147ae00 0000000000000000 
[   51.589098] GPR04: 0000000000000000 c0000007fa897d00 c0000007fca0c800 00000007fba90000 
[   51.589098] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fca0c800 
[   51.589098] GPR12: c0000000000b59e0 c0000007fffd8b80 0000000000000800 c000000ffffc11d0 
[   51.589098] GPR16: 0000000200000000 c000000001035280 0000000000000020 c0000000015203c0 
[   51.589098] GPR20: c000000000052ec0 c000000000052e90 c0000007fca05bd8 0000000000000088 
[   51.589098] GPR24: 0000000000000022 0000000000000001 0000000000080000 0000000000000110 
[   51.589098] GPR28: c0000000014b20d8 0000000400000000 c0000000014b2538 0000000000000001 
[   51.589118] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   51.589120] LR [c0000000000555f8] cpu_die+0x48/0x64
[   51.589121] Call Trace:
[   51.589123] [c0000007f56bbc30] [c0000007f56bbdc8] 0xc0000007f56bbdc8 (unreliable)
[   51.589126] [c0000007f56bbe10] [c0000000000555f8] cpu_die+0x48/0x64
[   51.589129] [c0000007f56bbe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   51.589132] [c0000007f56bbe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   51.589135] [c0000007f56bbed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   51.589138] [c0000007f56bbf00] [c0000000000552f8] start_secondary+0x638/0x680
[   51.589141] [c0000007f56bbf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   51.589142] Instruction dump:
[   51.589143] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   51.589147] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   51.589152] ---[ end trace 003effe0326aa836 ]---
[   51.908991] WARNING: CPU: 35 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   51.908993] Modules linked in: ip6table_mangle(+) ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   51.909038] CPU: 35 PID: 0 Comm: swapper/35 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   51.909040] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   51.909042] REGS: c0000007f56bf9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   51.909043] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   51.909049] CFAR: c0000000000555f4 IRQMASK: 1 
[   51.909049] GPR00: c0000000000555f8 c0000007f56bfc30 c00000000147ae00 0000000000000000 
[   51.909049] GPR04: 0000000000000000 c0000007fa897d00 c0000007fcb0c800 00000007fbb90000 
[   51.909049] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fcb0c800 
[   51.909049] GPR12: c0000000000b59e0 c0000007fffd7900 0000000000000800 c000000ffffc11d0 
[   51.909049] GPR16: 0000000400000000 c000000001035280 0000000000000020 c0000000015203c0 
[   51.909049] GPR20: c000000000052ec0 c000000000052e90 c0000007fcb05bd8 000000000000008c 
[   51.909049] GPR24: 0000000000000023 0000000000000001 0000000000080000 0000000000000118 
[   51.909049] GPR28: c0000000014b20d8 0000000800000000 c0000000014b2538 0000000000000001 
[   51.909071] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   51.909073] LR [c0000000000555f8] cpu_die+0x48/0x64
[   51.909074] Call Trace:
[   51.909076] [c0000007f56bfc30] [c0000007f56bfdc8] 0xc0000007f56bfdc8 (unreliable)
[   51.909079] [c0000007f56bfe10] [c0000000000555f8] cpu_die+0x48/0x64
[   51.909083] [c0000007f56bfe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   51.909086] [c0000007f56bfe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   51.909089] [c0000007f56bfed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   51.909092] [c0000007f56bff00] [c0000000000552f8] start_secondary+0x638/0x680
[   51.909095] [c0000007f56bff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   51.909096] Instruction dump:
[   51.909098] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   51.909102] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   51.909107] ---[ end trace 003effe0326aa837 ]---
         Starting Network Manager Script Dispatcher Service...
[  OK  ] Started Network Manager Wait Online.
         Starting LSB: Bring up/down networking...
[  OK  ] Started Network Manager Script Dispatcher Service.
[   52.368988] WARNING: CPU: 36 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   52.368994] Modules linked in: ip6table_mangle(+) ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   52.369030] CPU: 36 PID: 0 Comm: swapper/36 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   52.369031] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   52.369033] REGS: c0000007f56c39a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   52.369033] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   52.369038] CFAR: c0000000000555f4 IRQMASK: 1 
[   52.369038] GPR00: c0000000000555f8 c0000007f56c3c30 c00000000147ae00 0000000000000000 
[   52.369038] GPR04: 0000000000000000 c0000007fa897d00 c0000007fcc0c800 00000007fbc90000 
[   52.369038] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fcc0c800 
[   52.369038] GPR12: c0000000000b59e0 c0000007fffd6680 0000000000000800 c000000ffffc11d0 
[   52.369038] GPR16: 0000000800000000 c000000001035280 0000000000000020 c0000000015203c0 
[   52.369038] GPR20: c000000000052ec0 c000000000052e90 c0000007fcc05bd8 0000000000000090 
[   52.369038] GPR24: 0000000000000024 0000000000000001 0000000000080000 0000000000000120 
[   52.369038] GPR28: c0000000014b20d8 0000001000000000 c0000000014b2538 0000000000000001 
[   52.369055] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   52.369058] LR [c0000000000555f8] cpu_die+0x48/0x64
[   52.369058] Call Trace:
[   52.369061] [c0000007f56c3c30] [c0000007f56c3dc8] 0xc0000007f56c3dc8 (unreliable)
[   52.369063] [c0000007f56c3e10] [c0000000000555f8] cpu_die+0x48/0x64
[   52.369066] [c0000007f56c3e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   52.369069] [c0000007f56c3e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   52.369072] [c0000007f56c3ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   52.369074] [c0000007f56c3f00] [c0000000000552f8] start_secondary+0x638/0x680
[   52.369076] [c0000007f56c3f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   52.369077] Instruction dump:
[   52.369078] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   52.369082] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   52.369086] ---[ end trace 003effe0326aa838 ]---
[   52.718979] WARNING: CPU: 37 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   52.718984] Modules linked in: ip6table_nat(+) ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   52.719026] CPU: 37 PID: 0 Comm: swapper/37 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   52.719028] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   52.719030] REGS: c0000007f56c79a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   52.719031] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   52.719037] CFAR: c0000000000555f4 IRQMASK: 1 
[   52.719037] GPR00: c0000000000555f8 c0000007f56c7c30 c00000000147ae00 0000000000000000 
[   52.719037] GPR04: 0000000000000000 c0000007fa897d00 c0000007fcd0c800 00000007fbd90000 
[   52.719037] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fcd0c800 
[   52.719037] GPR12: c0000000000b59e0 c0000007fffd5400 0000000000000800 c000000ffffc11d0 
[   52.719037] GPR16: 0000001000000000 c000000001035280 0000000000000020 c0000000015203c0 
[   52.719037] GPR20: c000000000052ec0 c000000000052e90 c0000007fcd05bd8 0000000000000094 
[   52.719037] GPR24: 0000000000000025 0000000000000001 0000000000080000 0000000000000128 
[   52.719037] GPR28: c0000000014b20d8 0000002000000000 c0000000014b2538 0000000000000001 
[   52.719057] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   52.719060] LR [c0000000000555f8] cpu_die+0x48/0x64
[   52.719061] Call Trace:
[   52.719064] [c0000007f56c7c30] [c0000007f56c7dc8] 0xc0000007f56c7dc8 (unreliable)
[   52.719067] [c0000007f56c7e10] [c0000000000555f8] cpu_die+0x48/0x64
[   52.719071] [c0000007f56c7e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   52.719075] [c0000007f56c7e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   52.719078] [c0000007f56c7ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   52.719081] [c0000007f56c7f00] [c0000000000552f8] start_secondary+0x638/0x680
[   52.719084] [c0000007f56c7f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   52.719085] Instruction dump:
[   52.719087] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   52.719091] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   52.719096] ---[ end trace 003effe0326aa839 ]---
[  OK  ] Started LSB: Bring up/down networking.
[  OK  ] Reached target Network.
         Starting OpenSSH server daemon...
         Starting Dynamic System Tuning Daemon...
         Starting Enable periodic update of entitlement certificates....
         Starting High-performance, schema-free document-oriented database...
         Starting Postfix Mail Transport Agent...
         Starting Logout off all iSCSI sessions on shutdown...
[  OK  ] Reached target Network is Online.
         Starting Notify NFS peers of a restart...
         Starting System Logging Service...
[  OK  ] Started Enable periodic update of entitlement certificates..
[  OK  ] Started Logout off all iSCSI sessions on shutdown.
[  OK  ] Started Notify NFS peers of a restart.
[  OK  ] Reached target Remote File Systems (Pre).
[  OK  ] Reached target Remote File Systems.
         Starting LSB: Starts the Spacewalk Daemon...
         Starting Permit User Sessions...
         Starting Crash recovery kernel arming...
[  OK  ] Started Permit User Sessions.
[  OK  ] Started Command Scheduler.
         Starting Command Scheduler...
         Starting Wait for Plymouth Boot Screen to Quit...
         Starting Terminate Plymouth Boot Screen...
[  OK  ] Started Job spooling tools.
         Starting Job spooling tools...
[FAILED] Failed to start Crash recovery kernel arming.
See 'systemctl status kdump.service' for details.
[   53.158954] WARNING: CPU: 38 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   53.158957] Modules linked in: ip6table_nat(+) ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   53.158999] CPU: 38 PID: 0 Comm: swapper/38 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   53.159001] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   53.159003] REGS: c0000007f56cb9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   53.159003] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004088  XER: 00000000
[   53.159009] CFAR: c0000000000555f4 IRQMASK: 1 
[   53.159009] GPR00: c0000000000555f8 c0000007f56cbc30 c00000000147ae00 0000000000000000 
[   53.159009] GPR04: 0000000000000000 c0000007fa897d00 c0000007fce0c800 00000007fbe90000 
[   53.159009] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fce0c800 
[   53.159009] GPR12: c0000000000b59e0 c0000007fffd4180 0000000000000800 c000000ffffc11d0 
[   53.159009] GPR16: 0000002000000000 c000000001035280 0000000000000020 c0000000015203c0 
[   53.159009] GPR20: c000000000052ec0 c000000000052e90 c0000007fce05bd8 0000000000000098 
[   53.159009] GPR24: 0000000000000026 0000000000000001 0000000000080000 0000000000000130 
[   53.159009] GPR28: c0000000014b20d8 0000004000000000 c0000000014b2538 0000000000000001 
[   53.159030] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   53.159033] LR [c0000000000555f8] cpu_die+0x48/0x64
[   53.159033] Call Trace:
[   53.159036] [c0000007f56cbc30] [c0000007f56cbdc8] 0xc0000007f56cbdc8 (unreliable)
[   53.159039] [c0000007f56cbe10] [c0000000000555f8] cpu_die+0x48/0x64
[   53.159043] [c0000007f56cbe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   53.159046] [c0000007f56cbe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   53.159049] [c0000007f56cbed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   53.159052] [c0000007f56cbf00] [c0000000000552f8] start_secondary+0x638/0x680
[   53.159055] [c0000007f56cbf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   53.159056] Instruction dump:
[   53.159057] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   53.159062] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   53.159066] ---[ end trace 003effe0326aa83a ]---
[   53.458822] WARNING: CPU: 39 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   53.458824] Modules linked in: ebtable_broute(+) ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   53.458854] CPU: 39 PID: 0 Comm: swapper/39 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   53.458856] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   53.458858] REGS: c0000007f56cf9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   53.458859] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   53.458864] CFAR: c0000000000555f4 IRQMASK: 1 
[   53.458864] GPR00: c0000000000555f8 c0000007f56cfc30 c00000000147ae00 0000000000000000 
[   53.458864] GPR04: 0000000000000000 c0000007fa897d00 c0000007fcf0c800 00000007fbf90000 
[   53.458864] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fcf0c800 
[   53.458864] GPR12: c0000000000b59e0 c0000007fffd2f00 0000000000000800 c000000ffffc11d0 
[   53.458864] GPR16: 0000004000000000 c000000001035280 0000000000000020 c0000000015203c0 
[   53.458864] GPR20: c000000000052ec0 c000000000052e90 c0000007fcf05bd8 000000000000009c 
[   53.458864] GPR24: 0000000000000027 0000000000000001 0000000000080000 0000000000000138 
[   53.458864] GPR28: c0000000014b20d8 0000008000000000 c0000000014b2538 0000000000000001 
[   53.458884] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   53.458886] LR [c0000000000555f8] cpu_die+0x48/0x64
[   53.458887] Call Trace:
[   53.458889] [c0000007f56cfc30] [c0000007f56cfdc8] 0xc0000007f56cfdc8 (unreliable)
[   53.458892] [c0000007f56cfe10] [c0000000000555f8] cpu_die+0x48/0x64
[   53.458895] [c0000007f56cfe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   53.458898] [c0000007f56cfe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   53.458901] [c0000007f56cfed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   53.458903] [c0000007f56cff00] [c0000000000552f8] start_secondary+0x638/0x680
[   53.458907] [c0000007f56cff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   53.458907] Instruction dump:
[   53.458909] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   53.458913] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   53.458917] ---[ end trace 003effe0326aa83b ]---
[   53.809040] WARNING: CPU: 41 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   53.809042] Modules linked in: ebtable_broute(+) ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   53.809079] CPU: 41 PID: 0 Comm: swapper/41 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   53.809081] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   53.809083] REGS: c000000f242079a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   53.809084] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   53.809090] CFAR: c0000000000555f4 IRQMASK: 1 
[   53.809090] GPR00: c0000000000555f8 c000000f24207c30 c00000000147ae00 0000000000000000 
[   53.809090] GPR04: 0000000000000000 c0000007fa897d00 c000000f2890c800 0000000f27990000 
[   53.809090] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2890c800 
[   53.809090] GPR12: c0000000000b59e0 c000000fffffdb80 0000000000000800 c000000ffffc11d0 
[   53.809090] GPR16: 0000010000000000 c000000001035280 0000000000000028 c0000000015203c0 
[   53.809090] GPR20: c000000000052ec0 c000000000052e90 c000000f28905bd8 00000000000000a4 
[   53.809090] GPR24: 0000000000000029 0000000000000001 0000000000080000 0000000000000148 
[   53.809090] GPR28: c0000000014b20d8 0000020000000000 c0000000014b2538 0000000000000001 
[   53.809112] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   53.809114] LR [c0000000000555f8] cpu_die+0x48/0x64
[   53.809115] Call Trace:
[   53.809118] [c000000f24207c30] [c000000f24207dc8] 0xc000000f24207dc8 (unreliable)
[   53.809121] [c000000f24207e10] [c0000000000555f8] cpu_die+0x48/0x64
[   53.809125] [c000000f24207e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   53.809129] [c000000f24207e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   53.809132] [c000000f24207ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   53.809135] [c000000f24207f00] [c0000000000552f8] start_secondary+0x638/0x680
[   53.809138] [c000000f24207f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   53.809139] Instruction dump:
[   53.809141] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   53.809145] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   53.809150] ---[ end trace 003effe0326aa83c ]---
[   54.229003] WARNING: CPU: 42 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   54.229007] Modules linked in: ebtable_nat(+) ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   54.229057] CPU: 42 PID: 0 Comm: swapper/42 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   54.229059] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   54.229061] REGS: c000000f2420b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   54.229062] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   54.229067] CFAR: c0000000000555f4 IRQMASK: 1 
[   54.229067] GPR00: c0000000000555f8 c000000f2420bc30 c00000000147ae00 0000000000000000 
[   54.229067] GPR04: 0000000000000000 c0000007fa897d00 c000000f28a0c800 0000000f27a90000 
[   54.229067] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f28a0c800 
[   54.229067] GPR12: c0000000000b59e0 c000000fffffc900 0000000000000800 c000000ffffc11d0 
[   54.229067] GPR16: 0000020000000000 c000000001035280 0000000000000028 c0000000015203c0 
[   54.229067] GPR20: c000000000052ec0 c000000000052e90 c000000f28a05bd8 00000000000000a8 
[   54.229067] GPR24: 000000000000002a 0000000000000001 0000000000080000 0000000000000150 
[   54.229067] GPR28: c0000000014b20d8 0000040000000000 c0000000014b2538 0000000000000001 
[   54.229088] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   54.229091] LR [c0000000000555f8] cpu_die+0x48/0x64
[   54.229092] Call Trace:
[   54.229094] [c000000f2420bc30] [c000000f2420bdc8] 0xc000000f2420bdc8 (unreliable)
[   54.229097] [c000000f2420be10] [c0000000000555f8] cpu_die+0x48/0x64
[   54.229101] [c000000f2420be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   54.229105] [c000000f2420be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   54.229108] [c000000f2420bed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   54.229110] [c000000f2420bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   54.229114] [c000000f2420bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   54.229114] Instruction dump:
[   54.229116] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   54.229120] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   54.229124] ---[ end trace 003effe0326aa83d ]---
[   54.578894] WARNING: CPU: 43 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   54.578897] Modules linked in: ebtable_nat(+) ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   54.578944] CPU: 43 PID: 0 Comm: swapper/43 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   54.578946] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   54.578948] REGS: c000000f2420f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   54.578949] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   54.578954] CFAR: c0000000000555f4 IRQMASK: 1 
[   54.578954] GPR00: c0000000000555f8 c000000f2420fc30 c00000000147ae00 0000000000000000 
[   54.578954] GPR04: 0000000000000000 c0000007fa897d00 c000000f28b0c800 0000000f27b90000 
[   54.578954] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f28b0c800 
[   54.578954] GPR12: c0000000000b59e0 c000000ffffb4f80 0000000000000800 c000000ffffc11d0 
[   54.578954] GPR16: 0000040000000000 c000000001035280 0000000000000028 c0000000015203c0 
[   54.578954] GPR20: c000000000052ec0 c000000000052e90 c000000f28b05bd8 00000000000000ac 
[   54.578954] GPR24: 000000000000002b 0000000000000001 0000000000080000 0000000000000158 
[   54.578954] GPR28: c0000000014b20d8 0000080000000000 c0000000014b2538 0000000000000001 
[   54.578974] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   54.578976] LR [c0000000000555f8] cpu_die+0x48/0x64
[   54.578977] Call Trace:
[   54.578979] [c000000f2420fc30] [c000000f2420fdc8] 0xc000000f2420fdc8 (unreliable)
[   54.578981] [c000000f2420fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   54.578985] [c000000f2420fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   54.578988] [c000000f2420fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   54.578991] [c000000f2420fed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   54.578993] [c000000f2420ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   54.578996] [c000000f2420ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   54.578997] Instruction dump:
[   54.578998] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   54.579003] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   54.579007] ---[ end trace 003effe0326aa83e ]---
[   54.948921] WARNING: CPU: 44 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   54.948923] Modules linked in: nfnetlink(+) ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   54.948971] CPU: 44 PID: 0 Comm: swapper/44 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   54.948973] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   54.948974] REGS: c000000f242139a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   54.948975] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22044828  XER: 00000000
[   54.948981] CFAR: c0000000000555f4 IRQMASK: 1 
[   54.948981] GPR00: c0000000000555f8 c000000f24213c30 c00000000147ae00 0000000000000000 
[   54.948981] GPR04: 0000000000000000 c0000007fa897d00 c000000f28c0c800 0000000f27c90000 
[   54.948981] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f28c0c800 
[   54.948981] GPR12: c0000000000b59e0 c000000ffffb3d80 0000000121ecb220 0000000121ecb2a8 
[   54.948981] GPR16: 00007fff9401a0f0 00007fff9401a120 0000000000000028 c0000000015203c0 
[   54.948981] GPR20: c000000000052ec0 c000000000052e90 c000000f28c05bd8 00000000000000b0 
[   54.948981] GPR24: 000000000000002c 0000000000000001 0000000000080000 0000000000000160 
[   54.948981] GPR28: c0000000014b20d8 0000100000000000 c0000000014b2538 0000000000000001 
[   54.949001] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   54.949003] LR [c0000000000555f8] cpu_die+0x48/0x64
[   54.949004] Call Trace:
[   54.949006] [c000000f24213c30] [c000000f24213dc8] 0xc000000f24213dc8 (unreliable)
[   54.949008] [c000000f24213e10] [c0000000000555f8] cpu_die+0x48/0x64
[   54.949012] [c000000f24213e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   54.949015] [c000000f24213e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   54.949018] [c000000f24213ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   54.949021] [c000000f24213f00] [c0000000000552f8] start_secondary+0x638/0x680
[   54.949024] [c000000f24213f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   54.949025] Instruction dump:
[   54.949026] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   54.949030] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   54.949035] ---[ end trace 003effe0326aa83f ]---
[   55.348873] WARNING: CPU: 45 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   55.348876] Modules linked in: nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   55.348917] CPU: 45 PID: 0 Comm: swapper/45 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   55.348919] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   55.348921] REGS: c000000f242179a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   55.348922] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   55.348927] CFAR: c0000000000555f4 IRQMASK: 1 
[   55.348927] GPR00: c0000000000555f8 c000000f24217c30 c00000000147ae00 0000000000000000 
[   55.348927] GPR04: 0000000000000000 c0000007fa897d00 c000000f28d0c800 0000000f27d90000 
[   55.348927] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f28d0c800 
[   55.348927] GPR12: c0000000000b59e0 c000000ffffb2b80 0000000000000800 c000000ffffc11d0 
[   55.348927] GPR16: 0000100000000000 c000000001035280 0000000000000028 c0000000015203c0 
[   55.348927] GPR20: c000000000052ec0 c000000000052e90 c000000f28d05bd8 00000000000000b4 
[   55.348927] GPR24: 000000000000002d 0000000000000001 0000000000080000 0000000000000168 
[   55.348927] GPR28: c0000000014b20d8 0000200000000000 c0000000014b2538 0000000000000001 
[   55.348947] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   55.348949] LR [c0000000000555f8] cpu_die+0x48/0x64
[   55.348950] Call Trace:
[   55.348952] [c000000f24217c30] [c000000f24217dc8] 0xc000000f24217dc8 (unreliable)
[   55.348955] [c000000f24217e10] [c0000000000555f8] cpu_die+0x48/0x64
[   55.348958] [c000000f24217e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   55.348961] [c000000f24217e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   55.348964] [c000000f24217ed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   55.348967] [c000000f24217f00] [c0000000000552f8] start_secondary+0x638/0x680
[   55.348970] [c000000f24217f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   55.348971] Instruction dump:
[   55.348972] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   55.348976] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   55.348980] ---[ end trace 003effe0326aa840 ]---
[   55.678783] WARNING: CPU: 46 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   55.678784] Modules linked in: ip_set(+) nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   55.678821] CPU: 46 PID: 0 Comm: swapper/46 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   55.678823] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   55.678825] REGS: c000000f2421b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   55.678825] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   55.678831] CFAR: c0000000000555f4 IRQMASK: 1 
[   55.678831] GPR00: c0000000000555f8 c000000f2421bc30 c00000000147ae00 0000000000000000 
[   55.678831] GPR04: 0000000000000000 c0000007fa897d00 c000000f28e0c800 0000000f27e90000 
[   55.678831] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f28e0c800 
[   55.678831] GPR12: c0000000000b59e0 c000000ffffb1980 0000000000000800 c000000ffffc11d0 
[   55.678831] GPR16: 0000200000000000 c000000001035280 0000000000000028 c0000000015203c0 
[   55.678831] GPR20: c000000000052ec0 c000000000052e90 c000000f28e05bd8 00000000000000b8 
[   55.678831] GPR24: 000000000000002e 0000000000000001 0000000000080000 0000000000000170 
[   55.678831] GPR28: c0000000014b20d8 0000400000000000 c0000000014b2538 0000000000000001 
[   55.678851] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   55.678853] LR [c0000000000555f8] cpu_die+0x48/0x64
[   55.678854] Call Trace:
[   55.678856] [c000000f2421bc30] [c000000f2421bdc8] 0xc000000f2421bdc8 (unreliable)
[   55.678858] [c000000f2421be10] [c0000000000555f8] cpu_die+0x48/0x64
[   55.678862] [c000000f2421be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   55.678865] [c000000f2421be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   55.678868] [c000000f2421bed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   55.678870] [c000000f2421bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   55.678873] [c000000f2421bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   55.678874] Instruction dump:
[   55.678875] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   55.678880] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   55.678884] ---[ end trace 003effe0326aa841 ]---
[   55.988787] WARNING: CPU: 47 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   55.988788] Modules linked in: ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   55.988824] CPU: 47 PID: 0 Comm: swapper/47 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   55.988826] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   55.988828] REGS: c000000f2421f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   55.988829] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   55.988834] CFAR: c0000000000555f4 IRQMASK: 1 
[   55.988834] GPR00: c0000000000555f8 c000000f2421fc30 c00000000147ae00 0000000000000000 
[   55.988834] GPR04: 0000000000000000 c0000007fa897d00 c000000f28f0c800 0000000f27f90000 
[   55.988834] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f28f0c800 
[   55.988834] GPR12: c0000000000b59e0 c000000ffffb0780 0000000000000800 c000000ffffc11d0 
[   55.988834] GPR16: 0000400000000000 c000000001035280 0000000000000028 c0000000015203c0 
[   55.988834] GPR20: c000000000052ec0 c000000000052e90 c000000f28f05bd8 00000000000000bc 
[   55.988834] GPR24: 000000000000002f 0000000000000001 0000000000080000 0000000000000178 
[   55.988834] GPR28: c0000000014b20d8 0000800000000000 c0000000014b2538 0000000000000001 
[   55.988854] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   55.988856] LR [c0000000000555f8] cpu_die+0x48/0x64
[   55.988857] Call Trace:
[   55.988859] [c000000f2421fc30] [c000000f2421fdc8] 0xc000000f2421fdc8 (unreliable)
[   55.988862] [c000000f2421fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   55.988865] [c000000f2421fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   55.988869] [c000000f2421fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   55.988871] [c000000f2421fed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   55.988874] [c000000f2421ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   55.988877] [c000000f2421ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   55.988878] Instruction dump:
[   55.988879] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   55.988883] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   55.988887] ---[ end trace 003effe0326aa842 ]---
[   56.348992] WARNING: CPU: 49 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   56.348999] Modules linked in: ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   56.349050] CPU: 49 PID: 0 Comm: swapper/49 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   56.349052] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   56.349054] REGS: c000000f242279a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   56.349055] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   56.349061] CFAR: c0000000000555f4 IRQMASK: 1 
[   56.349061] GPR00: c0000000000555f8 c000000f24227c30 c00000000147ae00 0000000000000000 
[   56.349061] GPR04: 0000000000000000 c0000007fa897d00 c000000f2910c800 0000000f28190000 
[   56.349061] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2910c800 
[   56.349061] GPR12: c0000000000b59e0 c000000ffffae380 0000000000000800 c000000ffffc11d0 
[   56.349061] GPR16: 0001000000000000 c000000001035280 0000000000000030 c0000000015203c0 
[   56.349061] GPR20: c000000000052ec0 c000000000052e90 c000000f29105bd8 00000000000000c4 
[   56.349061] GPR24: 0000000000000031 0000000000000001 0000000000080000 0000000000000188 
[   56.349061] GPR28: c0000000014b20d8 0002000000000000 c0000000014b2538 0000000000000001 
[   56.349081] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   56.349084] LR [c0000000000555f8] cpu_die+0x48/0x64
[   56.349085] Call Trace:
[   56.349088] [c000000f24227c30] [c000000f24227dc8] 0xc000000f24227dc8 (unreliable)
[   56.349091] [c000000f24227e10] [c0000000000555f8] cpu_die+0x48/0x64
[   56.349095] [c000000f24227e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   56.349099] [c000000f24227e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   56.349102] [c000000f24227ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   56.349104] [c000000f24227f00] [c0000000000552f8] start_secondary+0x638/0x680
[   56.349107] [c000000f24227f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   56.349108] Instruction dump:
[   56.349110] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   56.349114] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   56.349119] ---[ end trace 003effe0326aa843 ]---
[   56.688893] WARNING: CPU: 50 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   56.688897] Modules linked in: xt_conntrack(+) ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   56.688939] CPU: 50 PID: 0 Comm: swapper/50 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   56.688941] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   56.688943] REGS: c000000f2422b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   56.688944] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   56.688950] CFAR: c0000000000555f4 IRQMASK: 1 
[   56.688950] GPR00: c0000000000555f8 c000000f2422bc30 c00000000147ae00 0000000000000000 
[   56.688950] GPR04: 0000000000000000 c0000007fa897d00 c000000f2920c800 0000000f28290000 
[   56.688950] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2920c800 
[   56.688950] GPR12: c0000000000b59e0 c000000ffffad180 0000000000000800 c000000ffffc11d0 
[   56.688950] GPR16: 0002000000000000 c000000001035280 0000000000000030 c0000000015203c0 
[   56.688950] GPR20: c000000000052ec0 c000000000052e90 c000000f29205bd8 00000000000000c8 
[   56.688950] GPR24: 0000000000000032 0000000000000001 0000000000080000 0000000000000190 
[   56.688950] GPR28: c0000000014b20d8 0004000000000000 c0000000014b2538 0000000000000001 
[   56.688969] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   56.688971] LR [c0000000000555f8] cpu_die+0x48/0x64
[   56.688972] Call Trace:
[   56.688975] [c000000f2422bc30] [c000000f2422bdc8] 0xc000000f2422bdc8 (unreliable)
[   56.688977] [c000000f2422be10] [c0000000000555f8] cpu_die+0x48/0x64
[   56.688981] [c000000f2422be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   56.688984] [c000000f2422be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   56.688987] [c000000f2422bed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   56.688989] [c000000f2422bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   56.688992] [c000000f2422bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   56.688993] Instruction dump:
[   56.688994] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   56.688998] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   56.689002] ---[ end trace 003effe0326aa844 ]---
[   57.008828] WARNING: CPU: 51 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   57.008830] Modules linked in: xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   57.008875] CPU: 51 PID: 0 Comm: swapper/51 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   57.008877] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   57.008878] REGS: c000000f2422f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   57.008879] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   57.008884] CFAR: c0000000000555f4 IRQMASK: 1 
[   57.008884] GPR00: c0000000000555f8 c000000f2422fc30 c00000000147ae00 0000000000000000 
[   57.008884] GPR04: 0000000000000000 c0000007fa897d00 c000000f2930c800 0000000f28390000 
[   57.008884] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2930c800 
[   57.008884] GPR12: c0000000000b59e0 c000000ffffabf80 0000000000000800 c000000ffffc11d0 
[   57.008884] GPR16: 0004000000000000 c000000001035280 0000000000000030 c0000000015203c0 
[   57.008884] GPR20: c000000000052ec0 c000000000052e90 c000000f29305bd8 00000000000000cc 
[   57.008884] GPR24: 0000000000000033 0000000000000001 0000000000080000 0000000000000198 
[   57.008884] GPR28: c0000000014b20d8 0008000000000000 c0000000014b2538 0000000000000001 
[   57.008903] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   57.008905] LR [c0000000000555f8] cpu_die+0x48/0x64
[   57.008906] Call Trace:
[   57.008908] [c000000f2422fc30] [c000000f2422fdc8] 0xc000000f2422fdc8 (unreliable)
[   57.008910] [c000000f2422fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   57.008913] [c000000f2422fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   57.008916] [c000000f2422fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   57.008919] [c000000f2422fed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   57.008922] [c000000f2422ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   57.008925] [c000000f2422ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   57.008925] Instruction dump:
[   57.008926] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   57.008930] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   57.008935] ---[ end trace 003effe0326aa845 ]---
[   57.341333] WARNING: CPU: 52 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   57.341335] Modules linked in: xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   57.341376] CPU: 52 PID: 0 Comm: swapper/52 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   57.341378] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   57.341380] REGS: c000000f242339a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   57.341381] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   57.341386] CFAR: c0000000000555f4 IRQMASK: 1 
[   57.341386] GPR00: c0000000000555f8 c000000f24233c30 c00000000147ae00 0000000000000000 
[   57.341386] GPR04: 0000000000000000 c0000007fa897d00 c000000f2940c800 0000000f28490000 
[   57.341386] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2940c800 
[   57.341386] GPR12: c0000000000b59e0 c000000ffffaad80 0000000000000800 c000000ffffc11d0 
[   57.341386] GPR16: 0008000000000000 c000000001035280 0000000000000030 c0000000015203c0 
[   57.341386] GPR20: c000000000052ec0 c000000000052e90 c000000f29405bd8 00000000000000d0 
[   57.341386] GPR24: 0000000000000034 0000000000000001 0000000000080000 00000000000001a0 
[   57.341386] GPR28: c0000000014b20d8 0010000000000000 c0000000014b2538 0000000000000001 
[   57.341406] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   57.341408] LR [c0000000000555f8] cpu_die+0x48/0x64
[   57.341409] Call Trace:
[   57.341411] [c000000f24233c30] [c000000f24233dc8] 0xc000000f24233dc8 (unreliable)
[   57.341414] [c000000f24233e10] [c0000000000555f8] cpu_die+0x48/0x64
[   57.341417] [c000000f24233e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   57.341420] [c000000f24233e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   57.341423] [c000000f24233ed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   57.341426] [c000000f24233f00] [c0000000000552f8] start_secondary+0x638/0x680
[   57.341429] [c000000f24233f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   57.341430] Instruction dump:
[   57.341431] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   57.341435] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   57.341439] ---[ end trace 003effe0326aa846 ]---
[   57.678750] WARNING: CPU: 53 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   57.678751] Modules linked in: nf_reject_ipv6(+) xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   57.678792] CPU: 53 PID: 0 Comm: swapper/53 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   57.678793] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   57.678795] REGS: c000000f242379a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   57.678796] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   57.678801] CFAR: c0000000000555f4 IRQMASK: 1 
[   57.678801] GPR00: c0000000000555f8 c000000f24237c30 c00000000147ae00 0000000000000000 
[   57.678801] GPR04: 0000000000000000 c0000007fa897d00 c000000f2950c800 0000000f28590000 
[   57.678801] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2950c800 
[   57.678801] GPR12: c0000000000b59e0 c000000ffffa9b80 0000000000000800 c000000ffffc11d0 
[   57.678801] GPR16: 0010000000000000 c000000001035280 0000000000000030 c0000000015203c0 
[   57.678801] GPR20: c000000000052ec0 c000000000052e90 c000000f29505bd8 00000000000000d4 
[   57.678801] GPR24: 0000000000000035 0000000000000001 0000000000080000 00000000000001a8 
[   57.678801] GPR28: c0000000014b20d8 0020000000000000 c0000000014b2538 0000000000000001 
[   57.678821] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   57.678823] LR [c0000000000555f8] cpu_die+0x48/0x64
[   57.678824] Call Trace:
[   57.678825] [c000000f24237c30] [c000000f24237dc8] 0xc000000f24237dc8 (unreliable)
[   57.678828] [c000000f24237e10] [c0000000000555f8] cpu_die+0x48/0x64
[   57.678831] [c000000f24237e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   57.678834] [c000000f24237e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   57.678837] [c000000f24237ed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   57.678840] [c000000f24237f00] [c0000000000552f8] start_secondary+0x638/0x680
[   57.678843] [c000000f24237f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   57.678844] Instruction dump:
[   57.678845] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   57.678849] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   57.678853] ---[ end trace 003effe0326aa847 ]---
[   58.064059] WARNING: CPU: 54 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   58.064062] Modules linked in: ip6t_REJECT(+) nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   58.064104] CPU: 54 PID: 0 Comm: swapper/54 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   58.064106] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   58.064108] REGS: c000000f2423b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   58.064109] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   58.064115] CFAR: c0000000000555f4 IRQMASK: 1 
[   58.064115] GPR00: c0000000000555f8 c000000f2423bc30 c00000000147ae00 0000000000000000 
[   58.064115] GPR04: 0000000000000000 c0000007fa897d00 c000000f2960c800 0000000f28690000 
[   58.064115] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2960c800 
[   58.064115] GPR12: c0000000000b59e0 c000000ffffa8980 0000000000000800 c000000ffffc11d0 
[   58.064115] GPR16: 0020000000000000 c000000001035280 0000000000000030 c0000000015203c0 
[   58.064115] GPR20: c000000000052ec0 c000000000052e90 c000000f29605bd8 00000000000000d8 
[   58.064115] GPR24: 0000000000000036 0000000000000001 0000000000080000 00000000000001b0 
[   58.064115] GPR28: c0000000014b20d8 0040000000000000 c0000000014b2538 0000000000000001 
[   58.064137] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   58.064140] LR [c0000000000555f8] cpu_die+0x48/0x64
[   58.064141] Call Trace:
[   58.064145] [c000000f2423bc30] [c000000f2423bdc8] 0xc000000f2423bdc8 (unreliable)
[   58.064147] [c000000f2423be10] [c0000000000555f8] cpu_die+0x48/0x64
[   58.064152] [c000000f2423be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   58.064156] [c000000f2423be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   58.064160] [c000000f2423bed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   58.064162] [c000000f2423bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   58.064166] [c000000f2423bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   58.064167] Instruction dump:
[   58.064169] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   58.064173] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   58.064178] ---[ end trace 003effe0326aa848 ]---
[   58.413108] WARNING: CPU: 55 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   58.413111] Modules linked in: ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   58.413153] CPU: 55 PID: 0 Comm: swapper/55 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   58.413155] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   58.413156] REGS: c000000f2423f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   58.413157] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   58.413163] CFAR: c0000000000555f4 IRQMASK: 1 
[   58.413163] GPR00: c0000000000555f8 c000000f2423fc30 c00000000147ae00 0000000000000000 
[   58.413163] GPR04: 0000000000000000 c0000007fa897d00 c000000f2970c800 0000000f28790000 
[   58.413163] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2970c800 
[   58.413163] GPR12: c0000000000b59e0 c000000ffffa7780 0000000000000800 c000000ffffc11d0 
[   58.413163] GPR16: 0040000000000000 c000000001035280 0000000000000030 c0000000015203c0 
[   58.413163] GPR20: c000000000052ec0 c000000000052e90 c000000f29705bd8 00000000000000dc 
[   58.413163] GPR24: 0000000000000037 0000000000000001 0000000000080000 00000000000001b8 
[   58.413163] GPR28: c0000000014b20d8 0080000000000000 c0000000014b2538 0000000000000001 
[   58.413182] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   58.413185] LR [c0000000000555f8] cpu_die+0x48/0x64
[   58.413186] Call Trace:
[   58.413188] [c000000f2423fc30] [c000000f2423fdc8] 0xc000000f2423fdc8 (unreliable)
[   58.413191] [c000000f2423fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   58.413195] [c000000f2423fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   58.413198] [c000000f2423fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   58.413201] [c000000f2423fed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   58.413203] [c000000f2423ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   58.413206] [c000000f2423ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   58.413207] Instruction dump:
[   58.413209] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   58.413213] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   58.413217] ---[ end trace 003effe0326aa849 ]---
[   58.816874] WARNING: CPU: 57 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   58.816878] Modules linked in: ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   58.816934] CPU: 57 PID: 0 Comm: swapper/57 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   58.816936] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   58.816938] REGS: c000000f242479a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   58.816939] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   58.816944] CFAR: c0000000000555f4 IRQMASK: 1 
[   58.816944] GPR00: c0000000000555f8 c000000f24247c30 c00000000147ae00 0000000000000000 
[   58.816944] GPR04: 0000000000000000 c0000007fa897d00 c000000f2990c800 0000000f28990000 
[   58.816944] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2990c800 
[   58.816944] GPR12: c0000000000b59e0 c000000ffffa5280 0000000000000800 c000000ffffc11d0 
[   58.816944] GPR16: 0100000000000000 c000000001035280 0000000000000038 c0000000015203c0 
[   58.816944] GPR20: c000000000052ec0 c000000000052e90 c000000f29905bd8 00000000000000e4 
[   58.816944] GPR24: 0000000000000039 0000000000000001 0000000000080000 00000000000001c8 
[   58.816944] GPR28: c0000000014b20d8 0200000000000000 c0000000014b2538 0000000000000001 
[   58.816965] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   58.816967] LR [c0000000000555f8] cpu_die+0x48/0x64
[   58.816968] Call Trace:
[   58.816970] [c000000f24247c30] [c000000f24247dc8] 0xc000000f24247dc8 (unreliable)
[   58.816973] [c000000f24247e10] [c0000000000555f8] cpu_die+0x48/0x64
[   58.816976] [c000000f24247e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   58.816980] [c000000f24247e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   58.816983] [c000000f24247ed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   58.816985] [c000000f24247f00] [c0000000000552f8] start_secondary+0x638/0x680
[   58.816989] [c000000f24247f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   58.816990] Instruction dump:
[   58.816991] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   58.816995] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   58.816999] ---[ end trace 003effe0326aa84a ]---

Red Hat Enterprise Linux Server 7.5 (Maipo)
Kernel 5.3.0-rc4-next-20190814-autotest on an ppc64le

ltc-test-ci3 login: [   59.220412] WARNING: CPU: 58 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   59.220415] Modules linked in: nf_reject_ipv4(+) ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   59.220461] CPU: 58 PID: 0 Comm: swapper/58 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   59.220463] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   59.220465] REGS: c000000f2424b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   59.220465] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   59.220471] CFAR: c0000000000555f4 IRQMASK: 1 
[   59.220471] GPR00: c0000000000555f8 c000000f2424bc30 c00000000147ae00 0000000000000000 
[   59.220471] GPR04: 0000000000000000 c0000007fa897d00 c000000f29a0c800 0000000f28a90000 
[   59.220471] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f29a0c800 
[   59.220471] GPR12: c0000000000b59e0 c000000ffffa4000 0000000000000800 c000000ffffc11d0 
[   59.220471] GPR16: 0200000000000000 c000000001035280 0000000000000038 c0000000015203c0 
[   59.220471] GPR20: c000000000052ec0 c000000000052e90 c000000f29a05bd8 00000000000000e8 
[   59.220471] GPR24: 000000000000003a 0000000000000001 0000000000080000 00000000000001d0 
[   59.220471] GPR28: c0000000014b20d8 0400000000000000 c0000000014b2538 0000000000000001 
[   59.220491] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   59.220493] LR [c0000000000555f8] cpu_die+0x48/0x64
[   59.220494] Call Trace:
[   59.220496] [c000000f2424bc30] [c000000f2424bdc8] 0xc000000f2424bdc8 (unreliable)
[   59.220499] [c000000f2424be10] [c0000000000555f8] cpu_die+0x48/0x64
[   59.220502] [c000000f2424be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   59.220506] [c000000f2424be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   59.220509] [c000000f2424bed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   59.220511] [c000000f2424bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   59.220515] [c000000f2424bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   59.220516] Instruction dump:
[   59.220517] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   59.220521] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   59.220525] ---[ end trace 003effe0326aa84b ]---
[   59.558562] WARNING: CPU: 59 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   59.558563] Modules linked in: nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   59.558604] CPU: 59 PID: 0 Comm: swapper/59 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   59.558606] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   59.558608] REGS: c000000f2424f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   59.558609] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   59.558614] CFAR: c0000000000555f4 IRQMASK: 1 
[   59.558614] GPR00: c0000000000555f8 c000000f2424fc30 c00000000147ae00 0000000000000000 
[   59.558614] GPR04: 0000000000000000 c0000007fa897d00 c000000f29b0c800 0000000f28b90000 
[   59.558614] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f29b0c800 
[   59.558614] GPR12: c0000000000b59e0 c000000ffffa2d80 0000000000000800 c000000ffffc11d0 
[   59.558614] GPR16: 0400000000000000 c000000001035280 0000000000000038 c0000000015203c0 
[   59.558614] GPR20: c000000000052ec0 c000000000052e90 c000000f29b05bd8 00000000000000ec 
[   59.558614] GPR24: 000000000000003b 0000000000000001 0000000000080000 00000000000001d8 
[   59.558614] GPR28: c0000000014b20d8 0800000000000000 c0000000014b2538 0000000000000001 
[   59.558634] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   59.558637] LR [c0000000000555f8] cpu_die+0x48/0x64
[   59.558637] Call Trace:
[   59.558639] [c000000f2424fc30] [c000000f2424fdc8] 0xc000000f2424fdc8 (unreliable)
[   59.558642] [c000000f2424fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   59.558645] [c000000f2424fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   59.558648] [c000000f2424fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   59.558651] [c000000f2424fed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   59.558653] [c000000f2424ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   59.558656] [c000000f2424ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   59.558657] Instruction dump:
[   59.558658] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   59.558662] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   59.558667] ---[ end trace 003effe0326aa84c ]---
[   59.940337] WARNING: CPU: 60 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   59.940339] Modules linked in: ipt_REJECT(+) nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   59.940380] CPU: 60 PID: 0 Comm: swapper/60 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   59.940381] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   59.940383] REGS: c000000f242539a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   59.940384] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   59.940389] CFAR: c0000000000555f4 IRQMASK: 1 
[   59.940389] GPR00: c0000000000555f8 c000000f24253c30 c00000000147ae00 0000000000000000 
[   59.940389] GPR04: 0000000000000000 c0000007fa897d00 c000000f29c0c800 0000000f28c90000 
[   59.940389] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f29c0c800 
[   59.940389] GPR12: c0000000000b59e0 c000000ffffa1b00 0000000000000800 c000000ffffc11d0 
[   59.940389] GPR16: 0800000000000000 c000000001035280 0000000000000038 c0000000015203c0 
[   59.940389] GPR20: c000000000052ec0 c000000000052e90 c000000f29c05bd8 00000000000000f0 
[   59.940389] GPR24: 000000000000003c 0000000000000001 0000000000080000 00000000000001e0 
[   59.940389] GPR28: c0000000014b20d8 1000000000000000 c0000000014b2538 0000000000000001 
[   59.940409] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   59.940411] LR [c0000000000555f8] cpu_die+0x48/0x64
[   59.940412] Call Trace:
[   59.940413] [c000000f24253c30] [c000000f24253dc8] 0xc000000f24253dc8 (unreliable)
[   59.940416] [c000000f24253e10] [c0000000000555f8] cpu_die+0x48/0x64
[   59.940419] [c000000f24253e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   59.940422] [c000000f24253e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   59.940425] [c000000f24253ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   59.940428] [c000000f24253f00] [c0000000000552f8] start_secondary+0x638/0x680
[   59.940431] [c000000f24253f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   59.940432] Instruction dump:
[   59.940433] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   59.940437] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   59.940441] ---[ end trace 003effe0326aa84d ]---
[   60.289412] WARNING: CPU: 61 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   60.289413] Modules linked in: ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   60.289451] CPU: 61 PID: 0 Comm: swapper/61 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   60.289453] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   60.289454] REGS: c000000f242579a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   60.289455] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   60.289460] CFAR: c0000000000555f4 IRQMASK: 1 
[   60.289460] GPR00: c0000000000555f8 c000000f24257c30 c00000000147ae00 0000000000000000 
[   60.289460] GPR04: 0000000000000000 c0000007fa897d00 c000000f29d0c800 0000000f28d90000 
[   60.289460] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f29d0c800 
[   60.289460] GPR12: c0000000000b59e0 c000000ffffa0880 0000000000000800 c000000ffffc11d0 
[   60.289460] GPR16: 1000000000000000 c000000001035280 0000000000000038 c0000000015203c0 
[   60.289460] GPR20: c000000000052ec0 c000000000052e90 c000000f29d05bd8 00000000000000f4 
[   60.289460] GPR24: 000000000000003d 0000000000000001 0000000000080000 00000000000001e8 
[   60.289460] GPR28: c0000000014b20d8 2000000000000000 c0000000014b2538 0000000000000001 
[   60.289481] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   60.289483] LR [c0000000000555f8] cpu_die+0x48/0x64
[   60.289483] Call Trace:
[   60.289485] [c000000f24257c30] [c000000f24257dc8] 0xc000000f24257dc8 (unreliable)
[   60.289488] [c000000f24257e10] [c0000000000555f8] cpu_die+0x48/0x64
[   60.289491] [c000000f24257e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   60.289494] [c000000f24257e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   60.289497] [c000000f24257ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   60.289499] [c000000f24257f00] [c0000000000552f8] start_secondary+0x638/0x680
[   60.289503] [c000000f24257f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   60.289503] Instruction dump:
[   60.289505] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   60.289509] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   60.289513] ---[ end trace 003effe0326aa84e ]---
[   60.758506] WARNING: CPU: 62 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   60.758510] Modules linked in: ip6t_rpfilter(+) ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   60.758557] CPU: 62 PID: 0 Comm: swapper/62 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   60.758559] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   60.758561] REGS: c000000f2425b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   60.758562] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   60.758568] CFAR: c0000000000555f4 IRQMASK: 1 
[   60.758568] GPR00: c0000000000555f8 c000000f2425bc30 c00000000147ae00 0000000000000000 
[   60.758568] GPR04: 0000000000000000 c0000007fa897d00 c000000f29e0c800 0000000f28e90000 
[   60.758568] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f29e0c800 
[   60.758568] GPR12: c0000000000b59e0 c000000ffff9f600 0000000000000800 c000000ffffc11d0 
[   60.758568] GPR16: 2000000000000000 c000000001035280 0000000000000038 c0000000015203c0 
[   60.758568] GPR20: c000000000052ec0 c000000000052e90 c000000f29e05bd8 00000000000000f8 
[   60.758568] GPR24: 000000000000003e 0000000000000001 0000000000080000 00000000000001f0 
[   60.758568] GPR28: c0000000014b20d8 4000000000000000 c0000000014b2538 0000000000000001 
[   60.758588] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   60.758591] LR [c0000000000555f8] cpu_die+0x48/0x64
[   60.758592] Call Trace:
[   60.758594] [c000000f2425bc30] [c000000f2425bdc8] 0xc000000f2425bdc8 (unreliable)
[   60.758597] [c000000f2425be10] [c0000000000555f8] cpu_die+0x48/0x64
[   60.758601] [c000000f2425be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   60.758605] [c000000f2425be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   60.758607] [c000000f2425bed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   60.758610] [c000000f2425bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   60.758613] [c000000f2425bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   60.758614] Instruction dump:
[   60.758615] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   60.758619] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   60.758624] ---[ end trace 003effe0326aa84f ]---
[   61.260353] WARNING: CPU: 63 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   61.260357] Modules linked in: ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   61.260405] CPU: 63 PID: 0 Comm: swapper/63 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   61.260407] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   61.260409] REGS: c000000f2425f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   61.260410] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   61.260416] CFAR: c0000000000555f4 IRQMASK: 1 
[   61.260416] GPR00: c0000000000555f8 c000000f2425fc30 c00000000147ae00 0000000000000000 
[   61.260416] GPR04: 0000000000000000 c0000007fa897d00 c000000f29f0c800 0000000f28f90000 
[   61.260416] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f29f0c800 
[   61.260416] GPR12: c0000000000b59e0 c000000ffff9e380 0000000000000800 c000000ffffc11d0 
[   61.260416] GPR16: 4000000000000000 c000000001035280 0000000000000038 c0000000015203c0 
[   61.260416] GPR20: c000000000052ec0 c000000000052e90 c000000f29f05bd8 00000000000000fc 
[   61.260416] GPR24: 000000000000003f 0000000000000001 0000000000080000 00000000000001f8 
[   61.260416] GPR28: c0000000014b20d8 8000000000000000 c0000000014b2538 0000000000000001 
[   61.260436] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   61.260439] LR [c0000000000555f8] cpu_die+0x48/0x64
[   61.260439] Call Trace:
[   61.260442] [c000000f2425fc30] [c000000f2425fdc8] 0xc000000f2425fdc8 (unreliable)
[   61.260445] [c000000f2425fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   61.260449] [c000000f2425fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   61.260453] [c000000f2425fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   61.260456] [c000000f2425fed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   61.260458] [c000000f2425ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   61.260462] [c000000f2425ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   61.260462] Instruction dump:
[   61.260464] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   61.260468] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   61.260472] ---[ end trace 003effe0326aa850 ]---
[   61.773194] WARNING: CPU: 65 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   61.773198] Modules linked in: ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   61.773256] CPU: 65 PID: 0 Comm: swapper/65 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   61.773259] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   61.773261] REGS: c000000f242679a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   61.773262] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   61.773268] CFAR: c0000000000555f4 IRQMASK: 1 
[   61.773268] GPR00: c0000000000555f8 c000000f24267c30 c00000000147ae00 0000000000000000 
[   61.773268] GPR04: 0000000000000000 c0000007fa897d00 c000000f2a10c800 0000000f29190000 
[   61.773268] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2a10c800 
[   61.773268] GPR12: c0000000000b59e0 c000000ffff9be80 0000000000000800 c000000ffffc11d0 
[   61.773268] GPR16: 0000000000000001 c000000001035280 0000000000000040 c0000000015203c0 
[   61.773268] GPR20: c000000000052ec0 c000000000052e90 c000000f2a105bd8 0000000000000104 
[   61.773268] GPR24: 0000000000000041 0000000000000001 0000000000080000 0000000000000208 
[   61.773268] GPR28: c0000000014b20e0 0000000000000002 c0000000014b2538 0000000000000001 
[   61.773290] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   61.773292] LR [c0000000000555f8] cpu_die+0x48/0x64
[   61.773293] Call Trace:
[   61.773297] [c000000f24267c30] [c000000f24267dc8] 0xc000000f24267dc8 (unreliable)
[   61.773300] [c000000f24267e10] [c0000000000555f8] cpu_die+0x48/0x64
[   61.773304] [c000000f24267e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   61.773308] [c000000f24267e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   61.773311] [c000000f24267ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   61.773314] [c000000f24267f00] [c0000000000552f8] start_secondary+0x638/0x680
[   61.773317] [c000000f24267f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   61.773318] Instruction dump:
[   61.773320] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   61.773324] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   61.773329] ---[ end trace 003effe0326aa851 ]---
[   62.285783] WARNING: CPU: 66 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   62.285786] Modules linked in: ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   62.285827] CPU: 66 PID: 0 Comm: swapper/66 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   62.285829] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   62.285830] REGS: c000000f2426b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   62.285831] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004828  XER: 00000000
[   62.285835] CFAR: c0000000000555f4 IRQMASK: 1 
[   62.285835] GPR00: c0000000000555f8 c000000f2426bc30 c00000000147ae00 0000000000000000 
[   62.285835] GPR04: 0000000000000000 c0000007fa897d00 c000000f2a20c800 0000000f29290000 
[   62.285835] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2a20c800 
[   62.285835] GPR12: c0000000000b59e0 c000000ffff9ac00 0000000000000000 0000000000000000 
[   62.285835] GPR16: 0000000000000000 0000000000000000 0000000000000040 c0000000015203c0 
[   62.285835] GPR20: c000000000052ec0 c000000000052e90 c000000f2a205bd8 0000000000000108 
[   62.285835] GPR24: 0000000000000042 0000000000000001 0000000000080000 0000000000000210 
[   62.285835] GPR28: c0000000014b20e0 0000000000000004 c0000000014b2538 0000000000000001 
[   62.285849] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   62.285852] LR [c0000000000555f8] cpu_die+0x48/0x64
[   62.285852] Call Trace:
[   62.285855] [c000000f2426bc30] [c000000f2426bdc8] 0xc000000f2426bdc8 (unreliable)
[   62.285857] [c000000f2426be10] [c0000000000555f8] cpu_die+0x48/0x64
[   62.285861] [c000000f2426be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   62.285864] [c000000f2426be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   62.285867] [c000000f2426bed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   62.285869] [c000000f2426bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   62.285871] [c000000f2426bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   62.285872] Instruction dump:
[   62.285873] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   62.285876] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   62.285880] ---[ end trace 003effe0326aa852 ]---
[   62.656765] WARNING: CPU: 67 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   62.656768] Modules linked in: ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   62.656813] CPU: 67 PID: 0 Comm: swapper/67 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   62.656815] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   62.656817] REGS: c000000f2426f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   62.656818] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22004028  XER: 00000000
[   62.656824] CFAR: c0000000000555f4 IRQMASK: 1 
[   62.656824] GPR00: c0000000000555f8 c000000f2426fc30 c00000000147ae00 0000000000000000 
[   62.656824] GPR04: 0000000000000000 c0000007fa897d00 c000000f2a30c800 0000000f29390000 
[   62.656824] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2a30c800 
[   62.656824] GPR12: c0000000000b59e0 c000000ffff99980 0000000000000800 c000000ffffc11d0 
[   62.656824] GPR16: 0000000000000004 c000000001035280 0000000000000040 c0000000015203c0 
[   62.656824] GPR20: c000000000052ec0 c000000000052e90 c000000f2a305bd8 000000000000010c 
[   62.656824] GPR24: 0000000000000043 0000000000000001 0000000000080000 0000000000000218 
[   62.656824] GPR28: c0000000014b20e0 0000000000000008 c0000000014b2538 0000000000000001 
[   62.656844] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   62.656847] LR [c0000000000555f8] cpu_die+0x48/0x64
[   62.656847] Call Trace:
[   62.656850] [c000000f2426fc30] [c000000f2426fdc8] 0xc000000f2426fdc8 (unreliable)
[   62.656853] [c000000f2426fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   62.656857] [c000000f2426fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   62.656860] [c000000f2426fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   62.656863] [c000000f2426fed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   62.656866] [c000000f2426ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   62.656869] [c000000f2426ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   62.656870] Instruction dump:
[   62.656871] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   62.656875] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   62.656880] ---[ end trace 003effe0326aa853 ]---
[   63.030003] WARNING: CPU: 68 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   63.030005] Modules linked in: binfmt_misc(+) ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   63.030046] CPU: 68 PID: 0 Comm: swapper/68 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   63.030048] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   63.030050] REGS: c000000f242739a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   63.030051] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   63.030056] CFAR: c0000000000555f4 IRQMASK: 1 
[   63.030056] GPR00: c0000000000555f8 c000000f24273c30 c00000000147ae00 0000000000000000 
[   63.030056] GPR04: 0000000000000000 c0000007fa897d00 c000000f2a40c800 0000000f29490000 
[   63.030056] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2a40c800 
[   63.030056] GPR12: c0000000000b59e0 c000000ffff98700 0000000000000800 c000000ffffc11d0 
[   63.030056] GPR16: 0000000000000008 c000000001035280 0000000000000040 c0000000015203c0 
[   63.030056] GPR20: c000000000052ec0 c000000000052e90 c000000f2a405bd8 0000000000000110 
[   63.030056] GPR24: 0000000000000044 0000000000000001 0000000000080000 0000000000000220 
[   63.030056] GPR28: c0000000014b20e0 0000000000000010 c0000000014b2538 0000000000000001 
[   63.030075] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   63.030078] LR [c0000000000555f8] cpu_die+0x48/0x64
[   63.030078] Call Trace:
[   63.030081] [c000000f24273c30] [c000000f24273dc8] 0xc000000f24273dc8 (unreliable)
[   63.030084] [c000000f24273e10] [c0000000000555f8] cpu_die+0x48/0x64
[   63.030087] [c000000f24273e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   63.030091] [c000000f24273e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   63.030094] [c000000f24273ed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   63.030096] [c000000f24273f00] [c0000000000552f8] start_secondary+0x638/0x680
[   63.030099] [c000000f24273f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   63.030100] Instruction dump:
[   63.030102] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   63.030106] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   63.030110] ---[ end trace 003effe0326aa854 ]---
[   63.309870] WARNING: CPU: 69 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   63.309872] Modules linked in: binfmt_misc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   63.309905] CPU: 69 PID: 0 Comm: swapper/69 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   63.309906] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   63.309908] REGS: c000000f242779a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   63.309909] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   63.309914] CFAR: c0000000000555f4 IRQMASK: 1 
[   63.309914] GPR00: c0000000000555f8 c000000f24277c30 c00000000147ae00 0000000000000000 
[   63.309914] GPR04: 0000000000000000 c0000007fa897d00 c000000f2a50c800 0000000f29590000 
[   63.309914] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2a50c800 
[   63.309914] GPR12: c0000000000b59e0 c000000ffff97480 0000000000000800 c000000ffffc11d0 
[   63.309914] GPR16: 0000000000000010 c000000001035280 0000000000000040 c0000000015203c0 
[   63.309914] GPR20: c000000000052ec0 c000000000052e90 c000000f2a505bd8 0000000000000114 
[   63.309914] GPR24: 0000000000000045 0000000000000001 0000000000080000 0000000000000228 
[   63.309914] GPR28: c0000000014b20e0 0000000000000020 c0000000014b2538 0000000000000001 
[   63.309933] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   63.309935] LR [c0000000000555f8] cpu_die+0x48/0x64
[   63.309936] Call Trace:
[   63.309937] [c000000f24277c30] [c000000f24277dc8] 0xc000000f24277dc8 (unreliable)
[   63.309940] [c000000f24277e10] [c0000000000555f8] cpu_die+0x48/0x64
[   63.309943] [c000000f24277e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   63.309946] [c000000f24277e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   63.309949] [c000000f24277ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   63.309951] [c000000f24277f00] [c0000000000552f8] start_secondary+0x638/0x680
[   63.309955] [c000000f24277f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   63.309955] Instruction dump:
[   63.309956] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   63.309961] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   63.309965] ---[ end trace 003effe0326aa855 ]---
[   63.659807] WARNING: CPU: 70 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   63.659808] Modules linked in: binfmt_misc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   63.659841] CPU: 70 PID: 0 Comm: swapper/70 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   63.659843] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   63.659845] REGS: c000000f2427b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   63.659845] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   63.659850] CFAR: c0000000000555f4 IRQMASK: 1 
[   63.659850] GPR00: c0000000000555f8 c000000f2427bc30 c00000000147ae00 0000000000000000 
[   63.659850] GPR04: 0000000000000000 c0000007fa897d00 c000000f2a60c800 0000000f29690000 
[   63.659850] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2a60c800 
[   63.659850] GPR12: c0000000000b59e0 c000000ffff96200 0000000000000800 c000000ffffc11d0 
[   63.659850] GPR16: 0000000000000020 c000000001035280 0000000000000040 c0000000015203c0 
[   63.659850] GPR20: c000000000052ec0 c000000000052e90 c000000f2a605bd8 0000000000000118 
[   63.659850] GPR24: 0000000000000046 0000000000000001 0000000000080000 0000000000000230 
[   63.659850] GPR28: c0000000014b20e0 0000000000000040 c0000000014b2538 0000000000000001 
[   63.659870] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   63.659872] LR [c0000000000555f8] cpu_die+0x48/0x64
[   63.659873] Call Trace:
[   63.659875] [c000000f2427bc30] [c000000f2427bdc8] 0xc000000f2427bdc8 (unreliable)
[   63.659878] [c000000f2427be10] [c0000000000555f8] cpu_die+0x48/0x64
[   63.659881] [c000000f2427be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   63.659884] [c000000f2427be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   63.659887] [c000000f2427bed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   63.659889] [c000000f2427bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   63.659892] [c000000f2427bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   63.659893] Instruction dump:
[   63.659894] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   63.659898] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   63.659903] ---[ end trace 003effe0326aa856 ]---
[   64.059765] WARNING: CPU: 71 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   64.059766] Modules linked in: binfmt_misc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   64.059797] CPU: 71 PID: 0 Comm: swapper/71 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   64.059799] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   64.059801] REGS: c000000f2427f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   64.059802] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   64.059807] CFAR: c0000000000555f4 IRQMASK: 1 
[   64.059807] GPR00: c0000000000555f8 c000000f2427fc30 c00000000147ae00 0000000000000000 
[   64.059807] GPR04: 0000000000000000 c0000007fa897d00 c000000f2a70c800 0000000f29790000 
[   64.059807] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2a70c800 
[   64.059807] GPR12: c0000000000b59e0 c000000ffff94f80 0000000000000800 c000000ffffc11d0 
[   64.059807] GPR16: 0000000000000040 c000000001035280 0000000000000040 c0000000015203c0 
[   64.059807] GPR20: c000000000052ec0 c000000000052e90 c000000f2a705bd8 000000000000011c 
[   64.059807] GPR24: 0000000000000047 0000000000000001 0000000000080000 0000000000000238 
[   64.059807] GPR28: c0000000014b20e0 0000000000000080 c0000000014b2538 0000000000000001 
[   64.059826] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   64.059828] LR [c0000000000555f8] cpu_die+0x48/0x64
[   64.059829] Call Trace:
[   64.059831] [c000000f2427fc30] [c000000f2427fdc8] 0xc000000f2427fdc8 (unreliable)
[   64.059833] [c000000f2427fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   64.059837] [c000000f2427fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   64.059839] [c000000f2427fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   64.059842] [c000000f2427fed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   64.059845] [c000000f2427ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   64.059848] [c000000f2427ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   64.059849] Instruction dump:
[   64.059850] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   64.059854] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   64.059858] ---[ end trace 003effe0326aa857 ]---
[   64.379941] WARNING: CPU: 73 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   64.379945] Modules linked in: binfmt_misc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   64.380001] CPU: 73 PID: 0 Comm: swapper/73 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   64.380003] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   64.380005] REGS: c000000f242879a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   64.380006] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   64.380012] CFAR: c0000000000555f4 IRQMASK: 1 
[   64.380012] GPR00: c0000000000555f8 c000000f24287c30 c00000000147ae00 0000000000000000 
[   64.380012] GPR04: 0000000000000000 c0000007fa897d00 c000000f2a90c800 0000000f29990000 
[   64.380012] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2a90c800 
[   64.380012] GPR12: c0000000000b59e0 c000000ffff92a80 0000000000000800 c000000ffffc11d0 
[   64.380012] GPR16: 0000000000000100 c000000001035280 0000000000000048 c0000000015203c0 
[   64.380012] GPR20: c000000000052ec0 c000000000052e90 c000000f2a905bd8 0000000000000124 
[   64.380012] GPR24: 0000000000000049 0000000000000001 0000000000080000 0000000000000248 
[   64.380012] GPR28: c0000000014b20e0 0000000000000200 c0000000014b2538 0000000000000001 
[   64.380032] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   64.380034] LR [c0000000000555f8] cpu_die+0x48/0x64
[   64.380035] Call Trace:
[   64.380039] [c000000f24287c30] [c000000f24287dc8] 0xc000000f24287dc8 (unreliable)
[   64.380041] [c000000f24287e10] [c0000000000555f8] cpu_die+0x48/0x64
[   64.380045] [c000000f24287e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   64.380049] [c000000f24287e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   64.380052] [c000000f24287ed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   64.380054] [c000000f24287f00] [c0000000000552f8] start_secondary+0x638/0x680
[   64.380057] [c000000f24287f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   64.380058] Instruction dump:
[   64.380060] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   64.380064] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   64.380069] ---[ end trace 003effe0326aa858 ]---
[   64.839793] WARNING: CPU: 74 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   64.839796] Modules linked in: binfmt_misc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   64.839842] CPU: 74 PID: 0 Comm: swapper/74 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   64.839843] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   64.839845] REGS: c000000f2428b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   64.839845] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   64.839850] CFAR: c0000000000555f4 IRQMASK: 1 
[   64.839850] GPR00: c0000000000555f8 c000000f2428bc30 c00000000147ae00 0000000000000000 
[   64.839850] GPR04: 0000000000000000 c0000007fa897d00 c000000f2aa0c800 0000000f29a90000 
[   64.839850] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2aa0c800 
[   64.839850] GPR12: c0000000000b59e0 c000000ffff91800 0000000000000800 c000000ffffc11d0 
[   64.839850] GPR16: 0000000000000200 c000000001035280 0000000000000048 c0000000015203c0 
[   64.839850] GPR20: c000000000052ec0 c000000000052e90 c000000f2aa05bd8 0000000000000128 
[   64.839850] GPR24: 000000000000004a 0000000000000001 0000000000080000 0000000000000250 
[   64.839850] GPR28: c0000000014b20e0 0000000000000400 c0000000014b2538 0000000000000001 
[   64.839865] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   64.839868] LR [c0000000000555f8] cpu_die+0x48/0x64
[   64.839868] Call Trace:
[   64.839871] [c000000f2428bc30] [c000000f2428bdc8] 0xc000000f2428bdc8 (unreliable)
[   64.839873] [c000000f2428be10] [c0000000000555f8] cpu_die+0x48/0x64
[   64.839876] [c000000f2428be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   64.839879] [c000000f2428be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   64.839881] [c000000f2428bed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   64.839883] [c000000f2428bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   64.839886] [c000000f2428bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   64.839886] Instruction dump:
[   64.839887] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   64.839891] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   64.839894] ---[ end trace 003effe0326aa859 ]---
[   65.179798] WARNING: CPU: 75 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   65.179802] Modules linked in: netlink_diag binfmt_misc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   65.179846] CPU: 75 PID: 0 Comm: swapper/75 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   65.179848] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   65.179850] REGS: c000000f2428f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   65.179851] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   65.179856] CFAR: c0000000000555f4 IRQMASK: 1 
[   65.179856] GPR00: c0000000000555f8 c000000f2428fc30 c00000000147ae00 0000000000000000 
[   65.179856] GPR04: 0000000000000000 c0000007fa897d00 c000000f2ab0c800 0000000f29b90000 
[   65.179856] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2ab0c800 
[   65.179856] GPR12: c0000000000b59e0 c000000ffff90580 0000000000000800 c000000ffffc11d0 
[   65.179856] GPR16: 0000000000000400 c000000001035280 0000000000000048 c0000000015203c0 
[   65.179856] GPR20: c000000000052ec0 c000000000052e90 c000000f2ab05bd8 000000000000012c 
[   65.179856] GPR24: 000000000000004b 0000000000000001 0000000000080000 0000000000000258 
[   65.179856] GPR28: c0000000014b20e0 0000000000000800 c0000000014b2538 0000000000000001 
[   65.179877] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   65.179879] LR [c0000000000555f8] cpu_die+0x48/0x64
[   65.179880] Call Trace:
[   65.179882] [c000000f2428fc30] [c000000f2428fdc8] 0xc000000f2428fdc8 (unreliable)
[   65.179885] [c000000f2428fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   65.179889] [c000000f2428fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   65.179892] [c000000f2428fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   65.179895] [c000000f2428fed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   65.179898] [c000000f2428ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   65.179901] [c000000f2428ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   65.179902] Instruction dump:
[   65.179903] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   65.179907] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   65.179912] ---[ end trace 003effe0326aa85a ]---
[   65.469696] WARNING: CPU: 76 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   65.469698] Modules linked in: af_packet_diag(+) netlink_diag binfmt_misc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   65.469735] CPU: 76 PID: 0 Comm: swapper/76 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   65.469737] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   65.469738] REGS: c000000f242939a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   65.469739] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   65.469744] CFAR: c0000000000555f4 IRQMASK: 1 
[   65.469744] GPR00: c0000000000555f8 c000000f24293c30 c00000000147ae00 0000000000000000 
[   65.469744] GPR04: 0000000000000000 c0000007fa897d00 c000000f2ac0c800 0000000f29c90000 
[   65.469744] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2ac0c800 
[   65.469744] GPR12: c0000000000b59e0 c000000ffff8f300 0000000000000800 c000000ffffc11d0 
[   65.469744] GPR16: 0000000000000800 c000000001035280 0000000000000048 c0000000015203c0 
[   65.469744] GPR20: c000000000052ec0 c000000000052e90 c000000f2ac05bd8 0000000000000130 
[   65.469744] GPR24: 000000000000004c 0000000000000001 0000000000080000 0000000000000260 
[   65.469744] GPR28: c0000000014b20e0 0000000000001000 c0000000014b2538 0000000000000001 
[   65.469764] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   65.469766] LR [c0000000000555f8] cpu_die+0x48/0x64
[   65.469767] Call Trace:
[   65.469769] [c000000f24293c30] [c000000f24293dc8] 0xc000000f24293dc8 (unreliable)
[   65.469771] [c000000f24293e10] [c0000000000555f8] cpu_die+0x48/0x64
[   65.469775] [c000000f24293e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   65.469778] [c000000f24293e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   65.469780] [c000000f24293ed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   65.469783] [c000000f24293f00] [c0000000000552f8] start_secondary+0x638/0x680
[   65.469786] [c000000f24293f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   65.469787] Instruction dump:
[   65.469788] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   65.469792] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   65.469797] ---[ end trace 003effe0326aa85b ]---
[   65.779627] WARNING: CPU: 77 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   65.779628] Modules linked in: af_packet_diag netlink_diag binfmt_misc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   65.779668] CPU: 77 PID: 0 Comm: swapper/77 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   65.779670] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   65.779672] REGS: c000000f242979a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   65.779672] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   65.779678] CFAR: c0000000000555f4 IRQMASK: 1 
[   65.779678] GPR00: c0000000000555f8 c000000f24297c30 c00000000147ae00 0000000000000000 
[   65.779678] GPR04: 0000000000000000 c0000007fa897d00 c000000f2ad0c800 0000000f29d90000 
[   65.779678] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2ad0c800 
[   65.779678] GPR12: c0000000000b59e0 c000000ffff8e080 0000000000000800 c000000ffffc11d0 
[   65.779678] GPR16: 0000000000001000 c000000001035280 0000000000000048 c0000000015203c0 
[   65.779678] GPR20: c000000000052ec0 c000000000052e90 c000000f2ad05bd8 0000000000000134 
[   65.779678] GPR24: 000000000000004d 0000000000000001 0000000000080000 0000000000000268 
[   65.779678] GPR28: c0000000014b20e0 0000000000002000 c0000000014b2538 0000000000000001 
[   65.779700] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   65.779703] LR [c0000000000555f8] cpu_die+0x48/0x64
[   65.779703] Call Trace:
[   65.779705] [c000000f24297c30] [c000000f24297dc8] 0xc000000f24297dc8 (unreliable)
[   65.779708] [c000000f24297e10] [c0000000000555f8] cpu_die+0x48/0x64
[   65.779712] [c000000f24297e30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   65.779715] [c000000f24297e50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   65.779719] [c000000f24297ed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   65.779721] [c000000f24297f00] [c0000000000552f8] start_secondary+0x638/0x680
[   65.779725] [c000000f24297f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   65.779726] Instruction dump:
[   65.779727] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   65.779732] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   65.779737] ---[ end trace 003effe0326aa85c ]---
[   66.089595] WARNING: CPU: 78 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   66.089597] Modules linked in: unix_diag(+) af_packet_diag netlink_diag binfmt_misc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   66.089632] CPU: 78 PID: 0 Comm: swapper/78 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   66.089634] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   66.089635] REGS: c000000f2429b9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   66.089636] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   66.089641] CFAR: c0000000000555f4 IRQMASK: 1 
[   66.089641] GPR00: c0000000000555f8 c000000f2429bc30 c00000000147ae00 0000000000000000 
[   66.089641] GPR04: 0000000000000000 c0000007fa897d00 c000000f2ae0c800 0000000f29e90000 
[   66.089641] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2ae0c800 
[   66.089641] GPR12: c0000000000b59e0 c000000ffff8ce00 0000000000000800 c000000ffffc11d0 
[   66.089641] GPR16: 0000000000002000 c000000001035280 0000000000000048 c0000000015203c0 
[   66.089641] GPR20: c000000000052ec0 c000000000052e90 c000000f2ae05bd8 0000000000000138 
[   66.089641] GPR24: 000000000000004e 0000000000000001 0000000000080000 0000000000000270 
[   66.089641] GPR28: c0000000014b20e0 0000000000004000 c0000000014b2538 0000000000000001 
[   66.089661] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   66.089663] LR [c0000000000555f8] cpu_die+0x48/0x64
[   66.089663] Call Trace:
[   66.089665] [c000000f2429bc30] [c000000f2429bdc8] 0xc000000f2429bdc8 (unreliable)
[   66.089668] [c000000f2429be10] [c0000000000555f8] cpu_die+0x48/0x64
[   66.089671] [c000000f2429be30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   66.089674] [c000000f2429be50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   66.089677] [c000000f2429bed0] [c00000000016bb1c] cpu_startup_entry+0x3c/0x40
[   66.089679] [c000000f2429bf00] [c0000000000552f8] start_secondary+0x638/0x680
[   66.089682] [c000000f2429bf90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   66.089683] Instruction dump:
[   66.089684] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   66.089688] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   66.089693] ---[ end trace 003effe0326aa85d ]---
[   66.419590] WARNING: CPU: 79 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   66.419591] Modules linked in: unix_diag af_packet_diag netlink_diag binfmt_misc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg uio_pdrv_genirq ipmi_powernv ipmi_devintf leds_powernv ipmi_msghandler uio ibmpowernv powernv_rng powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   66.419627] CPU: 79 PID: 0 Comm: swapper/79 Tainted: G        W         5.3.0-rc4-next-20190814-autotest #1
[   66.419629] NIP:  c0000000000b5a30 LR: c0000000000555f8 CTR: c0000000000b59e0
[   66.419631] REGS: c000000f2429f9a0 TRAP: 0700   Tainted: G        W          (5.3.0-rc4-next-20190814-autotest)
[   66.419632] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   66.419638] CFAR: c0000000000555f4 IRQMASK: 1 
[   66.419638] GPR00: c0000000000555f8 c000000f2429fc30 c00000000147ae00 0000000000000000 
[   66.419638] GPR04: 0000000000000000 c0000007fa897d00 c000000f2af0c800 0000000f29f90000 
[   66.419638] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000f2af0c800 
[   66.419638] GPR12: c0000000000b59e0 c000000ffff8bb80 0000000000000800 c000000ffffc11d0 
[   66.419638] GPR16: 0000000000004000 c000000001035280 0000000000000048 c0000000015203c0 
[   66.419638] GPR20: c000000000052ec0 c000000000052e90 c000000f2af05bd8 000000000000013c 
[   66.419638] GPR24: 000000000000004f 0000000000000001 0000000000080000 0000000000000278 
[   66.419638] GPR28: c0000000014b20e0 0000000000008000 c0000000014b2538 0000000000000001 
[   66.419660] NIP [c0000000000b5a30] pnv_smp_cpu_kill_self+0x50/0x2d0
[   66.419663] LR [c0000000000555f8] cpu_die+0x48/0x64
[   66.419663] Call Trace:
[   66.419665] [c000000f2429fc30] [c000000f2429fdc8] 0xc000000f2429fdc8 (unreliable)
[   66.419668] [c000000f2429fe10] [c0000000000555f8] cpu_die+0x48/0x64
[   66.419672] [c000000f2429fe30] [c0000000000228a0] arch_cpu_idle_dead+0x20/0x40
[   66.419675] [c000000f2429fe50] [c00000000016b89c] do_idle+0x36c/0x3e0
[   66.419678] [c000000f2429fed0] [c00000000016bb18] cpu_startup_entry+0x38/0x40
[   66.419681] [c000000f2429ff00] [c0000000000552f8] start_secondary+0x638/0x680
[   66.419684] [c000000f2429ff90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   66.419685] Instruction dump:
[   66.419686] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   66.419691] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   66.419696] ---[ end trace 003effe0326aa85e ]---
[   67.266533] MACsec IEEE 802.1AE
[   68.179445] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
[   68.224714] tun: Universal TUN/TAP device driver, 1.6
[   68.225318] virbr0: port 1(virbr0-nic) entered blocking state
[   68.225329] virbr0: port 1(virbr0-nic) entered disabled state
[   68.225427] device virbr0-nic entered promiscuous mode
[   68.370032] virbr0: port 1(virbr0-nic) entered blocking state
[   68.370048] virbr0: port 1(virbr0-nic) entered listening state
[   68.439803] virbr0: port 1(virbr0-nic) entered disabled state
root
Password: 
Last login: Mon Aug 26 04:59:45 from 9.199.196.197
ABRT has detected 10 problem(s). For more info run: abrt-cli list --since 1566813585
# lscpu
Architecture:          ppc64le
Byte Order:            Little Endian
CPU(s):                80
On-line CPU(s) list:   0,8,16,24,32,40,48,56,64,72
Off-line CPU(s) list:  1-7,9-15,17-23,25-31,33-39,41-47,49-55,57-63,65-71,73-79
Thread(s) per core:    1
Core(s) per socket:    5
Socket(s):             2
NUMA node(s):          2
Model:                 2.1 (pvr 004b 0201)
Model name:            POWER8E (raw), altivec supported
CPU max MHz:           3690.0000
CPU min MHz:           2061.0000
L1d cache:             64K
L1i cache:             32K
L2 cache:              512K
L3 cache:              8192K
NUMA node0 CPU(s):     0,8,16,24,32
NUMA node1 CPU(s):     40,48,56,64,72
# 


--Apple-Mail=_B2D23B4C-3B35-42DF-90AE-BAE6176E0042--

