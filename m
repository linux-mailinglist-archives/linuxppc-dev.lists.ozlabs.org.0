Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B26B93B52FF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 13:24:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCT0l4hHTz3bTK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 21:24:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DB5d39Oq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DB5d39Oq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCT0C0gvTz2xvK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jun 2021 21:24:10 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15RBFK15061555; Sun, 27 Jun 2021 07:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=pp1; bh=dHK7329jdJGXvfW2PXYM4m3Q5hLuu3rREC7gWK9BJ1w=;
 b=DB5d39OqJ+SOy7E3pLWpzY4RMDK/rzhh6fe+38PuuHPqP7r7rY3+sHapG+1MDx6TUdZ7
 /nlbeisP5Ooz6AdHs+wRTe4FH3f9WykGvAO9biwlQaCUb+ZTVF62ADgraSFMnY6lnfzo
 O2ruVRVrYR0CehbzCaFUmlcuwcOdw+J0XBkvG1EzrbKj72vjog7R169omjA50MqoOQGG
 U6+saah/Ux8X8oQ/LcOZivFJ6uPMwHOsf1s8uH74UQUtep4FJoyU4oQZaOUKC5sP0AcI
 ZytkIXiCeRyNI2HjO8qEe/u5N5MCGVUrisi8YvPLxHsXozKaQ9bYaLNlE5fLBMZBgXWS 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39er9nr3e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Jun 2021 07:24:02 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15RBGrP5066245;
 Sun, 27 Jun 2021 07:24:01 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39er9nr3dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Jun 2021 07:24:01 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15RBNI9R013558;
 Sun, 27 Jun 2021 11:23:59 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 39dugh86q5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Jun 2021 11:23:58 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15RBNuNg32899538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 27 Jun 2021 11:23:56 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B0B0A405B;
 Sun, 27 Jun 2021 11:23:56 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D169A405F;
 Sun, 27 Jun 2021 11:23:55 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.199.58.163])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 27 Jun 2021 11:23:54 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Message-Id: <0C513B10-78DE-48F3-AD50-3A89225E20AF@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_5D0278C2-4335-422E-A4F3-E9C154B8099A"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [powerpc][next-20210625] Kernel
 warning(arch/powerpc/kernel/interrupt.c:518) during boot
Date: Sun, 27 Jun 2021 16:53:53 +0530
In-Reply-To: <1624788248.0kxmv878xd.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
References: <478A3DE4-159E-4FF8-92B4-6550F72951E6@linux.vnet.ibm.com>
 <1624733491.pxug6c02ws.astroid@bobo.none>
 <1624788248.0kxmv878xd.astroid@bobo.none>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bLw97MpvXyzdcTDonQORbIENQM2gPFW3
X-Proofpoint-ORIG-GUID: fTgA9-NsMbzkomP7I8u7CVXu0ZJ_U4Ea
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-27_01:2021-06-25,
 2021-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 suspectscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106270080
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_5D0278C2-4335-422E-A4F3-E9C154B8099A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 27-Jun-2021, at 3:36 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>> So there's definitely IRQMASK=3D0 and no MSR[EE]=3D0 in this frame, =
which is=20
>> what the warning was.
>>=20
>> I'd say either something hasn't set PACA_IRQ_HARD_DIS properly, so EE=20=

>> doesn't get enabled when irqs are restored, or maybe the  change to
>> arch_local_irq_restore(). Less likely that the stack got messed up.
>>=20
>> Can you try run with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=3Dy ?
>=20
> Nevermind, I think I've found the problem. Some code runs in the
> implicit soft-mask region without expecting to be masked. Working
> on a fix=E2=80=A6

:-) . I was able to recreate this after few attempts. It seem the =
warning isn=E2=80=99t
always triggered during boot. I had to run a kernel compile operation =
after
boot to trigger this warning again.

In case its helpful here is the additional trace with =
PPC_IRQ_SOFT_MASK_DEBUG.

[   92.106731] ------------[ cut here ]------------
[   92.106738] WARNING: CPU: 45 PID: 12757 at =
arch/powerpc/kernel/irq.c:255 arch_local_irq_restore+0x1d0/0x200
[   92.106753] Modules linked in: dm_mod bonding nft_ct nf_conntrack =
nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables libcrc32c =
nfnetlink sunrpc pseries_rng xts vmx_crypto uio_pdrv_genirq uio =
sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi =
ibmveth scsi_transport_srp fuse
[   92.106828] CPU: 45 PID: 12757 Comm: sh Kdump: loaded Tainted: G      =
  W         5.13.0-rc7-next-20210625 #1
[   92.106841] NIP:  c0000000000164d0 LR: c000000000cedaa8 CTR: =
0000000000000000
[   92.106849] REGS: c00000008dfeb7e0 TRAP: 0700   Tainted: G        W   =
       (5.13.0-rc7-next-20210625)
[   92.106859] MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  =
CR: 28004222  XER: 00000000
[   92.106892] CFAR: c00000000001632c IRQMASK: 0=20
               GPR00: c000000000ceda98 c00000008dfeba80 c000000002921e00 =
0000000000000000=20
               GPR04: 0000000000000000 0000000000000000 0000000000000000 =
00000000000000ff=20
               GPR08: 0000000000000001 0000000000000000 0000000000000001 =
0000000000000017=20
               GPR12: 0000000024004822 c000000007fb9200 000000012efd81d4 =
000000012ee50000=20
               GPR16: 0000000000000001 00000100268a0e00 000001002687ec10 =
0000000114200c40=20
               GPR20: 00003fffa93f8000 0000000000000000 00003fffa93f9300 =
000000012efb1988=20
               GPR24: 000000012ee7fe7c 000000012efccba0 000000012ee50000 =
c00000008d5d7600=20
               GPR28: c0000000314c0bc0 c000000040d9f100 c0000008beb5861c =
4b72201a3063fe13=20
[   92.107024] NIP [c0000000000164d0] arch_local_irq_restore+0x1d0/0x200
[   92.107035] LR [c000000000cedaa8] =
_raw_spin_unlock_irqrestore+0x88/0xb0
[   92.107047] Call Trace:
[   92.107052] [c00000008dfeba80] [c00000008dfebb50] 0xc00000008dfebb50 =
(unreliable)
[   92.107065] [c00000008dfebab0] [238c5bf052df0858] 0x238c5bf052df0858
[   92.107076] [c00000008dfebae0] [c0000000008178e8] =
get_random_u64+0x88/0x100
[   92.107090] [c00000008dfebb20] [c000000000020134] =
arch_randomize_brk+0xb4/0xd8
[   92.107105] [c00000008dfebb50] [c0000000005430b0] =
load_elf_binary+0xe70/0x1220
[   92.107119] [c00000008dfebc40] [c00000000047ded0] =
bprm_execve+0x410/0x800
[   92.107132] [c00000008dfebd10] [c00000000047e8ec] =
do_execveat_common.isra.44+0x21c/0x240
[   92.107145] [c00000008dfebd80] [c00000000047e964] =
sys_execve+0x54/0x70
[   92.107157] [c00000008dfebdb0] [c000000000032334] =
system_call_exception+0x164/0x2e0
[   92.107169] [c00000008dfebe10] [c00000000000c464] =
system_call_common+0xf4/0x258
[   92.107185] --- interrupt: c00 at 0x3fff9bb6b8a8
[   92.107193] NIP:  00003fff9bb6b8a8 LR: 00003fff9bb6c240 CTR: =
0000000000000000
[   92.107202] REGS: c00000008dfebe80 TRAP: 0c00   Tainted: G        W   =
       (5.13.0-rc7-next-20210625)
[   92.107213] MSR:  800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE>  CR: =
28004224  XER: 00000000
[   92.107243] IRQMASK: 0=20
               GPR00: 000000000000000b 00003fffc36a1440 00003fff9bc87300 =
00000100268a67d0=20
               GPR04: 0000010026887e50 0000010026882c50 fefefefefefefeff =
7f7f7f7f7f7f7f7f=20
               GPR08: 00000100268a67d0 0000000000000000 0000000000000000 =
0000000000000000=20
               GPR12: 0000000000000000 00003fff9bce3780 0000000114200db4 =
0000000000000000=20
               GPR16: 0000000000000001 00000100268a0e00 000001002687ec10 =
0000000114200c40=20
               GPR20: 00000001141dd820 0000000000000000 00000001141dd740 =
0000000114204358=20
               GPR24: 0000000114203948 0000010026876454 0000000000000001 =
0000010026882c50=20
               GPR28: 0000010026887e50 0000010026882c50 00000100268a67d0 =
00003fffc36a1440=20
[   92.107369] NIP [00003fff9bb6b8a8] 0x3fff9bb6b8a8
[   92.107378] LR [00003fff9bb6c240] 0x3fff9bb6c240
[   92.107386] --- interrupt: c00
[   92.107393] Instruction dump:
[   92.107400] 7d2000a6 71298000 40820048 39200000 992d0152 39400000 =
992d0153 614a8002=20
[   92.107427] 7d410164 4bfffe6c 60000000 60000000 <0fe00000> 4bfffe5c =
60000000 60000000=20
[   92.107451] ---[ end trace 5f1d49fb99f3613d ]=E2=80=94

Complete dmesg log attached.

Thanks
-Sachin


--Apple-Mail=_5D0278C2-4335-422E-A4F3-E9C154B8099A
Content-Disposition: attachment;
	filename=next-20210625.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="next-20210625.txt"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Reserving 512MB of memory at 128MB for crashkernel =
(System RAM: 35840MB)
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
[    0.000000] Enabling pkeys with max key count 8
[    0.000000] Activating Kernel Userspace Execution Prevention
[    0.000000] Activating Kernel Userspace Access Prevention
[    0.000000] Page orders: linear mapping =3D 24, virtual =3D 12, io =3D =
12, vmemmap =3D 24
[    0.000000] Using 1TB segments
[    0.000000] hash-mmu: Initializing hash mmu with SLB
[    0.000000] Linux version 5.13.0-rc7-next-20210625 =
(root@ltc-zzci-2.aus.stglabs.ibm.com) (gcc (GCC) 8.4.1 20200928 (Red Hat =
8.4.1-1), GNU ld version 2.30-93.el8) #1 SMP Sun Jun 27 05:45:43 CDT =
2021
[    0.000000] Found initrd at 0xc00000000d400000:0xc000000010d118ce
[    0.000000] Using pSeries machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Partition configured for 96 cpus.
[    0.000000] CPU maps initialized for 8 threads per core
[    0.000000]  (thread shift is 3)
[    0.000000] Allocated 3328 bytes for 96 pacas
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     =3D 0x8c0000000
[    0.000000] dcache_bsize      =3D 0x80
[    0.000000] icache_bsize      =3D 0x80
[    0.000000] cpu_features      =3D 0x0001c07b8f5f9187
[    0.000000]   possible        =3D 0x000ffbfbcf5fb187
[    0.000000]   always          =3D 0x0000000380008181
[    0.000000] cpu_user_features =3D 0xdc0065c2 0xeff00000
[    0.000000] mmu_features      =3D 0x7c006e01
[    0.000000] firmware_features =3D 0x0000009fc45bfc57
[    0.000000] vmalloc start     =3D 0xc0003d0000000000
[    0.000000] IO start          =3D 0xc0003e0000000000
[    0.000000] vmemmap start     =3D 0xc0003f0000000000
[    0.000000] hash-mmu: ppc64_pft_size    =3D 0x1c
[    0.000000] hash-mmu: htab_hash_mask    =3D 0x1fffff
[    0.000000] -----------------------------------------------------
[    0.000000] numa:   NODE_DATA [mem 0x8bfcd6c80-0x8bfcdbfff]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] rfi-flush: patched 14 locations (mttrig type flush)
[    0.000000] count-cache-flush: flush disabled.
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
[    0.000000] PV qspinlock hash table entries: 256 (order: 0, 4096 =
bytes, linear)
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] barrier-nospec: patched 389 locations
[    0.000000] Top of RAM: 0x8c0000000, Total RAM: 0x8c0000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x00000008bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x00000008bfffffff]
[    0.000000] Initmem setup node 0 [mem =
0x0000000000000000-0x00000008bfffffff]
[    0.000000] percpu: Embedded 37 pages/cpu s114456 r0 d37096 u262144
[    0.000000] pcpu-alloc: s114456 r0 d37096 u262144 alloc=3D1*1048576
[    0.000000] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07=20
[    0.000000] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15=20
[    0.000000] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 22 23=20
[    0.000000] pcpu-alloc: [0] 24 25 26 27 [0] 28 29 30 31=20
[    0.000000] pcpu-alloc: [0] 32 33 34 35 [0] 36 37 38 39=20
[    0.000000] pcpu-alloc: [0] 40 41 42 43 [0] 44 45 46 47=20
[    0.000000] pcpu-alloc: [0] 48 49 50 51 [0] 52 53 54 55=20
[    0.000000] pcpu-alloc: [0] 56 57 58 59 [0] 60 61 62 63=20
[    0.000000] pcpu-alloc: [0] 64 65 66 67 [0] 68 69 70 71=20
[    0.000000] pcpu-alloc: [0] 72 73 74 75 [0] 76 77 78 79=20
[    0.000000] pcpu-alloc: [0] 80 81 82 83 [0] 84 85 86 87=20
[    0.000000] pcpu-alloc: [0] 88 89 90 91 [0] 92 93 94 95=20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: =
9031680
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: =
BOOT_IMAGE=3D/boot/vmlinuz-5.13.0-rc7-next-20210625 =
root=3DUUID=3D681ebf25-b7c8-49b9-b247-35a96bc8183f ro =
crashkernel=3D384M-2G:64M,2G-:512M biosdevname=3D0
[    0.000000] Unknown command line parameters: =
BOOT_IMAGE=3D/boot/vmlinuz-5.13.0-rc7-next-20210625 =
crashkernel=3D384M-2G:64M,2G-:512M biosdevname=3D0
[    0.000000] Dentry cache hash table entries: 8388608 (order: 14, =
67108864 bytes, linear)
[    0.000000] Inode-cache hash table entries: 4194304 (order: 13, =
33554432 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 35357448K/36700160K available (13252K kernel =
code, 5244K rwdata, 4064K rodata, 4384K init, 2550K bss, 1342712K =
reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, =
CPUs=3D96, Nodes=3D2
[    0.000000] ftrace: allocating 33103 entries in 195 pages
[    0.000000] ftrace: allocated 194 pages with 3 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D2048 to =
nr_cpu_ids=3D96.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay =
is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, =
nr_cpu_ids=3D96
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] pic: no ISA interrupt controller
[    0.000000] rcu: 	Offload RCU callbacks from CPUs: (none).
[    0.000000] random: get_random_u64 called from =
start_kernel+0x9b0/0xc10 with crng_init=3D0
[    0.000000] time_init: decrementer frequency =3D 512.000000 MHz
[    0.000000] time_init: processor frequency   =3D 2900.000000 MHz
[    0.000002] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.000041] clocksource: timebase: mask: 0xffffffffffffffff =
max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000108] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000152] clockevent: decrementer mult[83126f] shift[24] cpu[0]
[    0.000242] Console: colour dummy device 80x25
[    0.000274] printk: console [hvc0] enabled
[    0.000304] printk: bootconsole [udbg0] disabled
[    0.000371] pid_max: default: 98304 minimum: 768
[    0.000434] LSM: Security Framework initializing
[    0.000454] Yama: becoming mindful.
[    0.000467] SELinux:  Initializing.
[    0.000602] Mount-cache hash table entries: 131072 (order: 8, 1048576 =
bytes, linear)
[    0.000678] Mountpoint-cache hash table entries: 131072 (order: 8, =
1048576 bytes, linear)
[    0.001696] POWER9 performance monitor hardware support registered
[    0.001737] rcu: Hierarchical SRCU implementation.
[    0.003750] smp: Bringing up secondary CPUs ...
[    0.028999] smp: Brought up 1 node, 64 CPUs
[    0.029008] numa: Node 0 CPUs: 0-63
[    0.029014] Big cores detected but using small core scheduling
[    0.030954] devtmpfs: initialized
[    0.035365] clocksource: jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.035382] futex hash table entries: 32768 (order: 10, 4194304 =
bytes, linear)
[    0.035882] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.035994] audit: initializing netlink subsys (disabled)
[    0.036095] audit: type=3D2000 audit(1624792326.030:1): =
state=3Dinitialized audit_enabled=3D0 res=3D1
[    0.036166] thermal_sys: Registered thermal governor 'fair_share'
[    0.036167] thermal_sys: Registered thermal governor 'step_wise'
[    0.036339] cpuidle: using governor menu
[    0.036381] RTAS daemon started
[    0.036607] pstore: Registered nvram as persistent store backend
[    0.037251] EEH: pSeries platform initialized
[    0.043241] PCI: Probing PCI hardware
[    0.043248] EEH: No capable adapters found: recovery disabled.
[    0.043252] PCI: Probing PCI hardware done
[    0.043348] pseries-rng: Registering arch random hook.
[    0.044804] Kprobes globally optimized
[    0.045174] HugeTLB registered 16.0 MiB page size, pre-allocated 0 =
pages
[    0.045181] HugeTLB registered 16.0 GiB page size, pre-allocated 0 =
pages
[    0.085299] wait_for_initramfs() called before rootfs_initcalls
[    0.089670] iommu: Default domain type: Translated=20
[    0.089719] vgaarb: loaded
[    0.089801] SCSI subsystem initialized
[    0.089837] usbcore: registered new interface driver usbfs
[    0.089848] usbcore: registered new interface driver hub
[    0.089879] usbcore: registered new device driver usb
[    0.090040] EDAC MC: Ver: 3.0.0
[    0.090338] NetLabel: Initializing
[    0.090342] NetLabel:  domain hash size =3D 128
[    0.090345] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.090359] NetLabel:  unlabeled traffic allowed by default
[    0.091140] clocksource: Switched to clocksource timebase
[    0.104582] VFS: Disk quotas dquot_6.6.0
[    0.104616] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 =
bytes)
[    0.107184] NET: Registered PF_INET protocol family
[    0.107337] IP idents hash table entries: 262144 (order: 9, 2097152 =
bytes, linear)
[    0.110050] tcp_listen_portaddr_hash hash table entries: 32768 =
(order: 7, 524288 bytes, linear)
[    0.110216] TCP established hash table entries: 524288 (order: 10, =
4194304 bytes, linear)
[    0.110952] TCP bind hash table entries: 65536 (order: 8, 1048576 =
bytes, linear)
[    0.111044] TCP: Hash tables configured (established 524288 bind =
65536)
[    0.111154] UDP hash table entries: 32768 (order: 8, 1048576 bytes, =
linear)
[    0.111252] UDP-Lite hash table entries: 32768 (order: 8, 1048576 =
bytes, linear)
[    0.111477] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.111486] PCI: CLS 0 bytes, default 128
[    0.111552] Trying to unpack rootfs image as initramfs...
[    0.112413] IOMMU table initialized, virtual merging enabled
[    0.128511] hv-24x7: read 1530 catalog entries, created 509 event =
attrs (0 failures), 275 descs
[    0.136073] Initialise system trusted keyrings
[    0.136166] workingset: timestamp_bits=3D38 max_order=3D24 =
bucket_order=3D0
[    0.137613] zbud: loaded
[    0.158833] NET: Registered PF_ALG protocol family
[    0.158839] Key type asymmetric registered
[    0.158842] Asymmetric key parser 'x509' registered
[    0.158851] Block layer SCSI generic (bsg) driver version 0.4 loaded =
(major 248)
[    0.158952] io scheduler mq-deadline registered
[    0.158959] io scheduler kyber registered
[    0.161625] atomic64_test: passed
[    0.161667] shpchp: Standard Hot Plug PCI Controller Driver version: =
0.4
[    0.162265] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.162635] Non-volatile memory driver v1.3
[    0.162694] Linux agpgart interface v0.103
[    0.162865] tpm_ibmvtpm 30000003: CRQ initialization completed
[    1.192320] rdac: device handler registered
[    1.192440] hp_sw: device handler registered
[    1.192444] emc: device handler registered
[    1.192594] alua: device handler registered
[    1.192733] libphy: Fixed MDIO Bus: probed
[    1.192787] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) =
Driver
[    1.192803] ehci-pci: EHCI PCI platform driver
[    1.192816] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.192828] ohci-pci: OHCI PCI platform driver
[    1.192839] uhci_hcd: USB Universal Host Controller Interface driver
[    1.192884] usbcore: registered new interface driver =
usbserial_generic
[    1.192893] usbserial: USB Serial support registered for generic
[    1.192971] mousedev: PS/2 mouse device common for all mice
[    1.193091] rtc-generic rtc-generic: registered as rtc0
[    1.193232] rtc-generic rtc-generic: setting system clock to =
2021-06-27T11:12:08 UTC (1624792328)
[    1.194808] pseries_idle_driver registered
[    1.194820] hid: raw HID events driver (C) Jiri Kosina
[    1.194961] usbcore: registered new interface driver usbhid
[    1.194966] usbhid: USB HID core driver
[    1.195009] drop_monitor: Initializing network drop monitor service
[    1.195083] Initializing XFRM netlink socket
[    1.195207] NET: Registered PF_INET6 protocol family
[    1.195827] Segment Routing with IPv6
[    1.195848] NET: Registered PF_PACKET protocol family
[    1.195854] mpls_gso: MPLS GSO support
[    1.195889] Running MSI bitmap self-tests ...
[    1.198345] registered taskstats version 1
[    1.198365] Loading compiled-in X.509 certificates
[    1.204435] alg: No test for pkcs1pad(rsa,sha1) =
(pkcs1pad(rsa-generic,sha1))
[    1.205115] Loaded X.509 cert 'Build time autogenerated kernel key: =
94d0d11f98fad0e99a9eff7ee03c5e8d9a4666eb'
[    1.205577] zswap: loaded using pool lzo/zbud
[    1.205760] pstore: Using crash dump compression: deflate
[    1.211882] Freeing unused kernel image (initmem) memory: 4384K
[    1.311428] Run /init as init process
[    1.311439]   with arguments:
[    1.311443]     /init
[    1.311446]   with environment:
[    1.311448]     HOME=3D/
[    1.311451]     TERM=3Dlinux
[    1.311454]     BOOT_IMAGE=3D/boot/vmlinuz-5.13.0-rc7-next-20210625
[    1.311458]     crashkernel=3D384M-2G:64M,2G-:512M
[    1.311460]     biosdevname=3D0
[    1.324807] systemd[1]: systemd 239 (239-45.el8) running in system =
mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP =
+LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS =
+KMOD +IDN2 -IDN +PCRE2 default-hierarchy=3Dlegacy)
[    1.325133] systemd[1]: Detected architecture ppc64-le.
[    1.325141] systemd[1]: Running in initial RAM disk.
[    1.401821] systemd[1]: Set hostname to =
<ltc-zzci-2.aus.stglabs.ibm.com>.
[    1.502967] random: systemd: uninitialized urandom read (16 bytes =
read)
[    1.503095] systemd[1]: Listening on Journal Socket (/dev/log).
[    1.503295] random: systemd: uninitialized urandom read (16 bytes =
read)
[    1.503307] systemd[1]: Reached target Swap.
[    1.503428] random: systemd: uninitialized urandom read (16 bytes =
read)
[    1.503440] systemd[1]: Reached target Local File Systems.
[    1.503656] systemd[1]: Listening on Journal Socket.
[    1.505343] systemd[1]: Starting Journal Service...
[    1.506418] systemd[1]: Starting Create list of required static =
device nodes for the current kernel...
[    1.579212] fuse: init (API version 7.34)
[    1.934212] synth uevent: /devices/vio: failed to send uevent
[    1.934222] vio vio: uevent: failed to send synthetic uevent
[    1.934308] synth uevent: /devices/vio/4000: failed to send uevent
[    1.934312] vio 4000: uevent: failed to send synthetic uevent
[    1.934328] synth uevent: /devices/vio/4001: failed to send uevent
[    1.934332] vio 4001: uevent: failed to send synthetic uevent
[    1.934347] synth uevent: /devices/vio/4002: failed to send uevent
[    1.934351] vio 4002: uevent: failed to send synthetic uevent
[    1.934366] synth uevent: /devices/vio/4004: failed to send uevent
[    1.934370] vio 4004: uevent: failed to send synthetic uevent
[    1.948417] random: fast init done
[    2.010019] ibmveth: IBM Power Virtual Ethernet Driver 1.06
[    2.015699] ibmveth 30000002 env2: renamed from eth0
[    2.015929] ibmvscsi 30000066: SRP_VERSION: 16.a
[    2.016030] ibmvscsi 30000066: Maximum ID: 64 Maximum LUN: 32 Maximum =
Channel: 3
[    2.016037] scsi host0: IBM POWER Virtual SCSI Adapter 1.5.9
[    2.016220] ibmvscsi 30000066: partner initialization complete
[    2.016256] ibmvscsi 30000066: host srp version: 16.a, host partition =
ltc-zzci-vios1 (100), OS 3, max io 1048576
[    2.016302] ibmvscsi 30000066: Client reserve enabled
[    2.016311] ibmvscsi 30000066: sent SRP login
[    2.016337] ibmvscsi 30000066: SRP_LOGIN succeeded
[    2.042065] scsi 0:0:1:0: Direct-Access     AIX      VDASD            =
0001 PQ: 0 ANSI: 3
[    2.123138] scsi 0:0:1:0: Attached scsi generic sg0 type 0
[    2.140916] sd 0:0:1:0: [sda] 585105408 512-byte logical blocks: (300 =
GB/279 GiB)
[    2.140958] sd 0:0:1:0: [sda] Write Protect is off
[    2.140965] sd 0:0:1:0: [sda] Mode Sense: 17 00 00 08
[    2.140998] sd 0:0:1:0: [sda] Cache data unavailable
[    2.141005] sd 0:0:1:0: [sda] Assuming drive cache: write through
[    2.251694]  sda: sda1 sda2 sda3 sda4 < sda5 >
[    2.254194] sd 0:0:1:0: [sda] Attached SCSI disk
[    4.185107] EXT4-fs (sda2): mounted filesystem with ordered data =
mode. Opts: (null). Quota mode: none.
[    5.049039] printk: systemd: 15 output lines suppressed due to =
ratelimiting
[    5.499756] SELinux:  Runtime disable is deprecated, use selinux=3D0 =
on the kernel cmdline.
[    5.499767] SELinux:  Disabled at runtime.
[    5.671176] audit: type=3D1404 audit(1624792332.970:2): enforcing=3D0 =
old_enforcing=3D0 auid=3D4294967295 ses=3D4294967295 enabled=3D0 =
old-enabled=3D1 lsm=3Dselinux res=3D1
[    5.821638] systemd[1]: systemd 239 (239-45.el8) running in system =
mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP =
+LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS =
+KMOD +IDN2 -IDN +PCRE2 default-hierarchy=3Dlegacy)
[    5.821929] systemd[1]: Detected architecture ppc64-le.
[    5.831224] systemd[1]: Set hostname to =
<ltc-zzci-2.aus.stglabs.ibm.com>.
[    5.885571] random: crng init done
[    5.885579] random: 7 urandom warning(s) missed due to ratelimiting
[    6.980906] systemd[1]: systemd-journald.service: Succeeded.
[    6.987018] systemd[1]: initrd-switch-root.service: Succeeded.
[    6.987363] systemd[1]: Stopped Switch Root.
[    6.988010] systemd[1]: systemd-journald.service: Service has no =
hold-off time (RestartSec=3D0), scheduling restart.
[    6.988108] systemd[1]: systemd-journald.service: Scheduled restart =
job, restart counter is at 1.
[    6.988207] systemd[1]: Stopped Journal Service.
[    6.989344] systemd[1]: Starting Journal Service...
[    7.148524] EXT4-fs (sda2): re-mounted. Opts: (null). Quota mode: =
none.
[    7.196100] Unable to find swap-space signature
[    7.310654] synth uevent: /devices/vio: failed to send uevent
[    7.310666] vio vio: uevent: failed to send synthetic uevent
[    7.310933] synth uevent: /devices/vio/4000: failed to send uevent
[    7.310937] vio 4000: uevent: failed to send synthetic uevent
[    7.310953] synth uevent: /devices/vio/4001: failed to send uevent
[    7.310957] vio 4001: uevent: failed to send synthetic uevent
[    7.310971] synth uevent: /devices/vio/4002: failed to send uevent
[    7.310975] vio 4002: uevent: failed to send synthetic uevent
[    7.310989] synth uevent: /devices/vio/4004: failed to send uevent
[    7.310993] vio 4004: uevent: failed to send synthetic uevent
[    8.010469] pseries_rng: Registering IBM pSeries RNG driver
[    8.399599] ibmveth 30000002 net0: renamed from env2
[    8.781995] EXT4-fs (sda3): mounted filesystem with ordered data =
mode. Opts: (null). Quota mode: none.
[    9.351118] ------------[ cut here ]------------
[    9.351132] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg || =
cfs_rq->avg.runnable_avg
[    9.351138] WARNING: CPU: 48 PID: 0 at kernel/sched/fair.c:3308 =
update_blocked_averages+0x7c8/0x800
[    9.351151] Modules linked in: pseries_rng xts vmx_crypto =
uio_pdrv_genirq uio sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod =
t10_pi sg ibmvscsi ibmveth scsi_transport_srp fuse
[    9.351178] CPU: 48 PID: 0 Comm: swapper/48 Not tainted =
5.13.0-rc7-next-20210625 #1
[    9.351185] NIP:  c0000000001b0a28 LR: c0000000001b0a24 CTR: =
c000000000721f00
[    9.351190] REGS: c0000000285b74b0 TRAP: 0700   Not tainted  =
(5.13.0-rc7-next-20210625)
[    9.351195] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
48000224  XER: 00000005
[    9.351207] CFAR: c000000000145700 IRQMASK: 1=20
               GPR00: c0000000001b0a24 c0000000285b7750 c000000002921e00 =
0000000000000048=20
               GPR04: 00000000ffff7fff c0000000285b7410 0000000000000027 =
c0000008bec07e18=20
               GPR08: 0000000000000023 0000000000000001 0000000000000027 =
c0000000027ddd18=20
               GPR12: 0000000000000000 c000000007fb6200 c0000008bec1a580 =
000000000000b971=20
               GPR16: 000000022d5eb98e 00000000000001f7 c00000003ccd0c00 =
0000000000000000=20
               GPR20: 0000000000000000 c000000002944fe0 0000000000000000 =
00000000000003cc=20
               GPR24: 0000000000000000 c0000008bec1af90 0000000000000001 =
c0000008bec1a600=20
               GPR28: 00000000000001f7 c00000003ccd0dc0 c00000003ccd0d00 =
0000000000000000=20
[    9.351266] NIP [c0000000001b0a28] =
update_blocked_averages+0x7c8/0x800
[    9.351272] LR [c0000000001b0a24] update_blocked_averages+0x7c4/0x800
[    9.351277] Call Trace:
[    9.351279] [c0000000285b7750] [c0000000001b0a24] =
update_blocked_averages+0x7c4/0x800 (unreliable)
[    9.351287] [c0000000285b7870] [c0000000001b6aa0] =
run_rebalance_domains+0xa0/0xd0
[    9.351294] [c0000000285b78a0] [c000000000cee0cc] =
__do_softirq+0x15c/0x3d4
[    9.351301] [c0000000285b7990] [c000000000150f34] =
irq_exit+0x1d4/0x1e0
[    9.351308] [c0000000285b79c0] [c000000000029da0] =
timer_interrupt+0x170/0x360
[    9.351315] [c0000000285b7a20] [c00000000000998c] =
decrementer_common_virt+0x1ac/0x1b0
[    9.351322] --- interrupt: 900 at =
plpar_hcall_norets_notrace+0x18/0x2c
[    9.351329] NIP:  c0000000000ef808 LR: c000000000a050a8 CTR: =
0000000000000000
[    9.351333] REGS: c0000000285b7a90 TRAP: 0900   Not tainted  =
(5.13.0-rc7-next-20210625)
[    9.351338] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 22000284  XER: 20040000
[    9.351352] CFAR: 0000000000000c00 IRQMASK: 0=20
               GPR00: 0000000000000000 c0000000285b7d30 c000000002921e00 =
0000000000000000=20
               GPR04: 0000000000000010 000000002c000040 0000000000000002 =
0000000000000040=20
               GPR08: 0000000000000000 0000000000000240 0000000000000024 =
0000000000000000=20
               GPR12: 00000000000c7523 c000000007fb6200 0000000000000000 =
000000001ef29700=20
               GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
               GPR20: 0000000000000000 0000000000000000 0000000000000000 =
c000000002865e88=20
               GPR24: 0000000000000001 000000022d5bd4e0 0000000000000000 =
0000000000000001=20
               GPR28: c0000008bec18fc8 0000000000000001 c000000002110998 =
c0000000021109a0=20
[    9.351412] NIP [c0000000000ef808] =
plpar_hcall_norets_notrace+0x18/0x2c
[    9.351417] LR [c000000000a050a8] check_and_cede_processor+0x48/0x60
[    9.351424] --- interrupt: 900
[    9.351426] [c0000000285b7d30] [c0000000285b7db0] 0xc0000000285b7db0 =
(unreliable)
[    9.351433] [c0000000285b7d90] [c000000000a05368] =
shared_cede_loop+0x78/0x170
[    9.351440] [c0000000285b7dd0] [c000000000a01c34] =
cpuidle_enter_state+0x2e4/0x4e0
[    9.351446] [c0000000285b7e30] [c000000000a01ed0] =
cpuidle_enter+0x50/0x70
[    9.351452] [c0000000285b7e70] [c0000000001a318c] =
call_cpuidle+0x4c/0x80
[    9.351460] [c0000000285b7e90] [c0000000001a3810] do_idle+0x380/0x3e0
[    9.351465] [c0000000285b7f10] [c0000000001a3aec] =
cpu_startup_entry+0x3c/0x50
[    9.351471] [c0000000285b7f40] [c0000000000654d0] =
start_secondary+0x280/0x2a0
[    9.351479] [c0000000285b7f90] [c00000000000d054] =
start_secondary_prolog+0x10/0x14
[    9.351485] Instruction dump:
[    9.351488] 38635a78 9be9fda5 4bf94c99 60000000 0fe00000 4bfff910 =
e9210070 e8610088=20
[    9.351499] 39400001 99490009 4bf94c79 60000000 <0fe00000> e95201ba =
2faa0000 4bfffbd0=20
[    9.351509] ---[ end trace 5f1d49fb99f3613b ]---
[    9.427038] RPC: Registered named UNIX socket transport module.
[    9.427049] RPC: Registered udp transport module.
[    9.427052] RPC: Registered tcp transport module.
[    9.427056] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   18.411772] sysrq: Changing Loglevel
[   18.411785] sysrq: Loglevel set to 9
[   19.952501] device-mapper: uevent: version 1.0.3
[   19.952630] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) =
initialised: dm-devel@redhat.com
[   92.105621] ------------[ cut here ]------------
[   92.105650] WARNING: CPU: 45 PID: 12757 at =
arch/powerpc/kernel/interrupt.c:518 =
interrupt_exit_kernel_prepare+0x280/0x2a0
[   92.105673] Modules linked in: dm_mod bonding nft_ct nf_conntrack =
nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables libcrc32c =
nfnetlink sunrpc pseries_rng xts vmx_crypto uio_pdrv_genirq uio =
sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi =
ibmveth scsi_transport_srp fuse
[   92.105774] CPU: 45 PID: 12757 Comm: sh Kdump: loaded Tainted: G      =
  W         5.13.0-rc7-next-20210625 #1
[   92.105789] NIP:  c000000000032a00 LR: c00000000000c958 CTR: =
000000000049f42c
[   92.105800] REGS: c00000008dfeb460 TRAP: 0700   Tainted: G        W   =
       (5.13.0-rc7-next-20210625)
[   92.105812] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28088288  =
XER: 00000000
[   92.105846] CFAR: c000000000032814 IRQMASK: 1=20
               GPR00: c00000000000c958 c00000008dfeb700 c000000002921e00 =
c00000008dfeb7c0=20
               GPR04: 8000000002803033 00000000000064cf 00000000000000d0 =
ffffffffffffffbf=20
               GPR08: 0000000000000040 0000000000000000 0000000000000003 =
000000000000000f=20
               GPR12: 0000000000008000 c000000007fb9200 000000012efd81d4 =
000000012ee50000=20
               GPR16: 0000000000000007 0000400000000008 0000400000000008 =
c00000002c464948=20
               GPR20: fcffffffffffffff 000000000001ffff 5455555555555555 =
00003fffffffffff=20
               GPR24: 00003ffff69ff790 0000000000000000 00003ffff69ff400 =
0000000000000220=20
               GPR28: 00003ffff69ff3f8 fcffffffffffffff 0000000000000000 =
c00000008dfeb7c0=20
[   92.106004] NIP [c000000000032a00] =
interrupt_exit_kernel_prepare+0x280/0x2a0
[   92.106017] LR [c00000000000c958] =
interrupt_return_srr_user_restart+0x2c/0x110
[   92.106030] Call Trace:
[   92.106036] [c00000008dfeb700] [00003ffff69ff400] 0x3ffff69ff400 =
(unreliable)
[   92.106049] [c00000008dfeb750] [c00000000000c958] =
interrupt_return_srr_user_restart+0x2c/0x110
[   92.106065] --- interrupt: 300 at strnlen_user+0xe0/0x240
[   92.106076] NIP:  c0000000006ff820 LR: c000000000541fc4 CTR: =
0000000000003fc3
[   92.106085] REGS: c00000008dfeb7c0 TRAP: 0300   Tainted: G        W   =
       (5.13.0-rc7-next-20210625)
[   92.106095] MSR:  8000000002803033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  =
CR: 44088222  XER: 00000000
[   92.106127] CFAR: c0000000006ff844 DAR: 00003ffff6a00000 DSISR: =
40000000 IRQMASK: 0=20
               GPR00: c000000000541fc4 c00000008dfeba60 c000000002921e00 =
0000000000000000=20
               GPR04: 0000000000020000 0000000000020008 00000000000001e8 =
00003ffff69ffe10=20
               GPR08: 00000000000001f0 0000000000000000 0000000000000000 =
0000000000000000=20
               GPR12: 0000000000000006 c000000007fb9200 000000012efd81d4 =
000000012ee50000=20
               GPR16: 0000000000000007 0000400000000008 0000400000000008 =
c00000002c464948=20
               GPR20: fcffffffffffffff 000000000001ffff 5455555555555555 =
00003fffffffffff=20
               GPR24: 00003ffff69ff790 0000000000000000 00003ffff69ff400 =
0000000000000220=20
               GPR28: 00003ffff69ff3f8 00003ffff69ffe16 00003ffff69ff400 =
c00000002c464800=20
[   92.106256] NIP [c0000000006ff820] strnlen_user+0xe0/0x240
[   92.106267] LR [c000000000541fc4] =
create_elf_tables.isra.22+0xa04/0xc80
[   92.106279] --- interrupt: 300
[   92.106285] [c00000008dfeba60] [c000000000ce91b8] =
down_read_killable+0x28/0x130 (unreliable)
[   92.106302] [c00000008dfeba90] [c000000000541fc4] =
create_elf_tables.isra.22+0xa04/0xc80
[   92.106315] [c00000008dfebb50] [c000000000543050] =
load_elf_binary+0xe10/0x1220
[   92.106329] [c00000008dfebc40] [c00000000047ded0] =
bprm_execve+0x410/0x800
[   92.106343] [c00000008dfebd10] [c00000000047e8ec] =
do_execveat_common.isra.44+0x21c/0x240
[   92.106356] [c00000008dfebd80] [c00000000047e964] =
sys_execve+0x54/0x70
[   92.106368] [c00000008dfebdb0] [c000000000032334] =
system_call_exception+0x164/0x2e0
[   92.106382] [c00000008dfebe10] [c00000000000c464] =
system_call_common+0xf4/0x258
[   92.106396] --- interrupt: c00 at 0x3fff9bb6b8a8
[   92.106405] NIP:  00003fff9bb6b8a8 LR: 00003fff9bb6c240 CTR: =
0000000000000000
[   92.106414] REGS: c00000008dfebe80 TRAP: 0c00   Tainted: G        W   =
       (5.13.0-rc7-next-20210625)
[   92.106424] MSR:  800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE>  CR: =
28004224  XER: 00000000
[   92.106454] IRQMASK: 0=20
               GPR00: 000000000000000b 00003fffc36a1440 00003fff9bc87300 =
00000100268a67d0=20
               GPR04: 0000010026887e50 0000010026882c50 fefefefefefefeff =
7f7f7f7f7f7f7f7f=20
               GPR08: 00000100268a67d0 0000000000000000 0000000000000000 =
0000000000000000=20
               GPR12: 0000000000000000 00003fff9bce3780 0000000114200db4 =
0000000000000000=20
               GPR16: 0000000000000001 00000100268a0e00 000001002687ec10 =
0000000114200c40=20
               GPR20: 00000001141dd820 0000000000000000 00000001141dd740 =
0000000114204358=20
               GPR24: 0000000114203948 0000010026876454 0000000000000001 =
0000010026882c50=20
               GPR28: 0000010026887e50 0000010026882c50 00000100268a67d0 =
00003fffc36a1440=20
[   92.106579] NIP [00003fff9bb6b8a8] 0x3fff9bb6b8a8
[   92.106588] LR [00003fff9bb6c240] 0x3fff9bb6c240
[   92.106596] --- interrupt: c00
[   92.106602] Instruction dump:
[   92.106611] 71290001 892d0153 61290001 992d0153 4082000c 392d0138 =
7c20492a 4bfe362d=20
[   92.106631] 60000000 4bfffe34 60000000 60000000 <0fe00000> 4bfffe14 =
60000000 60000000=20
[   92.106654] ---[ end trace 5f1d49fb99f3613c ]---
[   92.106731] ------------[ cut here ]------------
[   92.106738] WARNING: CPU: 45 PID: 12757 at =
arch/powerpc/kernel/irq.c:255 arch_local_irq_restore+0x1d0/0x200
[   92.106753] Modules linked in: dm_mod bonding nft_ct nf_conntrack =
nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables libcrc32c =
nfnetlink sunrpc pseries_rng xts vmx_crypto uio_pdrv_genirq uio =
sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi =
ibmveth scsi_transport_srp fuse
[   92.106828] CPU: 45 PID: 12757 Comm: sh Kdump: loaded Tainted: G      =
  W         5.13.0-rc7-next-20210625 #1
[   92.106841] NIP:  c0000000000164d0 LR: c000000000cedaa8 CTR: =
0000000000000000
[   92.106849] REGS: c00000008dfeb7e0 TRAP: 0700   Tainted: G        W   =
       (5.13.0-rc7-next-20210625)
[   92.106859] MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  =
CR: 28004222  XER: 00000000
[   92.106892] CFAR: c00000000001632c IRQMASK: 0=20
               GPR00: c000000000ceda98 c00000008dfeba80 c000000002921e00 =
0000000000000000=20
               GPR04: 0000000000000000 0000000000000000 0000000000000000 =
00000000000000ff=20
               GPR08: 0000000000000001 0000000000000000 0000000000000001 =
0000000000000017=20
               GPR12: 0000000024004822 c000000007fb9200 000000012efd81d4 =
000000012ee50000=20
               GPR16: 0000000000000001 00000100268a0e00 000001002687ec10 =
0000000114200c40=20
               GPR20: 00003fffa93f8000 0000000000000000 00003fffa93f9300 =
000000012efb1988=20
               GPR24: 000000012ee7fe7c 000000012efccba0 000000012ee50000 =
c00000008d5d7600=20
               GPR28: c0000000314c0bc0 c000000040d9f100 c0000008beb5861c =
4b72201a3063fe13=20
[   92.107024] NIP [c0000000000164d0] arch_local_irq_restore+0x1d0/0x200
[   92.107035] LR [c000000000cedaa8] =
_raw_spin_unlock_irqrestore+0x88/0xb0
[   92.107047] Call Trace:
[   92.107052] [c00000008dfeba80] [c00000008dfebb50] 0xc00000008dfebb50 =
(unreliable)
[   92.107065] [c00000008dfebab0] [238c5bf052df0858] 0x238c5bf052df0858
[   92.107076] [c00000008dfebae0] [c0000000008178e8] =
get_random_u64+0x88/0x100
[   92.107090] [c00000008dfebb20] [c000000000020134] =
arch_randomize_brk+0xb4/0xd8
[   92.107105] [c00000008dfebb50] [c0000000005430b0] =
load_elf_binary+0xe70/0x1220
[   92.107119] [c00000008dfebc40] [c00000000047ded0] =
bprm_execve+0x410/0x800
[   92.107132] [c00000008dfebd10] [c00000000047e8ec] =
do_execveat_common.isra.44+0x21c/0x240
[   92.107145] [c00000008dfebd80] [c00000000047e964] =
sys_execve+0x54/0x70
[   92.107157] [c00000008dfebdb0] [c000000000032334] =
system_call_exception+0x164/0x2e0
[   92.107169] [c00000008dfebe10] [c00000000000c464] =
system_call_common+0xf4/0x258
[   92.107185] --- interrupt: c00 at 0x3fff9bb6b8a8
[   92.107193] NIP:  00003fff9bb6b8a8 LR: 00003fff9bb6c240 CTR: =
0000000000000000
[   92.107202] REGS: c00000008dfebe80 TRAP: 0c00   Tainted: G        W   =
       (5.13.0-rc7-next-20210625)
[   92.107213] MSR:  800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE>  CR: =
28004224  XER: 00000000
[   92.107243] IRQMASK: 0=20
               GPR00: 000000000000000b 00003fffc36a1440 00003fff9bc87300 =
00000100268a67d0=20
               GPR04: 0000010026887e50 0000010026882c50 fefefefefefefeff =
7f7f7f7f7f7f7f7f=20
               GPR08: 00000100268a67d0 0000000000000000 0000000000000000 =
0000000000000000=20
               GPR12: 0000000000000000 00003fff9bce3780 0000000114200db4 =
0000000000000000=20
               GPR16: 0000000000000001 00000100268a0e00 000001002687ec10 =
0000000114200c40=20
               GPR20: 00000001141dd820 0000000000000000 00000001141dd740 =
0000000114204358=20
               GPR24: 0000000114203948 0000010026876454 0000000000000001 =
0000010026882c50=20
               GPR28: 0000010026887e50 0000010026882c50 00000100268a67d0 =
00003fffc36a1440=20
[   92.107369] NIP [00003fff9bb6b8a8] 0x3fff9bb6b8a8
[   92.107378] LR [00003fff9bb6c240] 0x3fff9bb6c240
[   92.107386] --- interrupt: c00
[   92.107393] Instruction dump:
[   92.107400] 7d2000a6 71298000 40820048 39200000 992d0152 39400000 =
992d0153 614a8002=20
[   92.107427] 7d410164 4bfffe6c 60000000 60000000 <0fe00000> 4bfffe5c =
60000000 60000000=20
[   92.107451] ---[ end trace 5f1d49fb99f3613d ]---

--Apple-Mail=_5D0278C2-4335-422E-A4F3-E9C154B8099A--

