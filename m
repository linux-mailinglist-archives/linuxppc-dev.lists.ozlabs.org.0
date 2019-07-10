Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A077164396
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 10:31:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kC8053XQzDqmf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 18:31:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kC0T5d8TzDqGP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 18:24:40 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6A8DJW9143259
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 04:24:36 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tnbgm2h02-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 04:24:34 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Wed, 10 Jul 2019 09:24:32 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Jul 2019 09:24:28 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6A8OQVD51970158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 08:24:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FF99A4060;
 Wed, 10 Jul 2019 08:24:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9294EA4054;
 Wed, 10 Jul 2019 08:24:24 +0000 (GMT)
Received: from [9.109.244.158] (unknown [9.109.244.158])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jul 2019 08:24:24 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_B540750B-9A34-490C-936C-792C6A5D64B1"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Linux Boot failure : WARNING at arch/powerpc/kernel/eeh.c:357
Date: Wed, 10 Jul 2019 13:54:23 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19071008-0016-0000-0000-00000290DEBF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071008-0017-0000-0000-000032EE964C
Message-Id: <48A915BA-2DC3-4575-96B8-15122EA5B0B8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-10_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=842 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907100099
X-Mailman-Approved-At: Wed, 10 Jul 2019 18:29:49 +1000
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_B540750B-9A34-490C-936C-792C6A5D64B1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Recent linuxppc (merge branch) builds fail to boot on POWER9 BMC box.
Following warning is printed continuously on the console:

Last successful boot was with commit 3661376f60.

[    4.101480] Console: switching to colour dummy device 80x25
[    4.101550] tg3 0005:01:00.1: enabling device (0140 -> 0142)
[    4.102249] nouveau 0004:04:00.0: enabling device (0140 -> 0142)
[    4.102305] nouveau 0004:04:00.0: NVIDIA GV100 (140000a1)
[    4.106342] WARNING: CPU: 0 PID: 2487 at =
arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.106364] Modules linked in: nouveau(+) ast(+) i2c_algo_bit =
drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt =
fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks =
tg3(+) ptp nvme pps_core nvme_core
[    4.106426] CPU: 0 PID: 2487 Comm: kworker/0:4 Not tainted 5.2.0-rc6+ =
#1
[    4.106454] Workqueue: events work_for_cpu_fn
[    4.106475] NIP:  c000000000043f08 LR: c000000000043eec CTR: =
c0000000005c2430
[    4.106540] REGS: c000003fd78b72b0 TRAP: 0700   Not tainted  =
(5.2.0-rc6+)
[    4.106577] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: =
84444028  XER: 20040000
[    4.106615] CFAR: c000000000074738 IRQMASK: 0=20
[    4.106615] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 =
c000203fff654348=20
[    4.106615] GPR04: c00a00008d301e00 0000000000000000 c000003fd78b7564 =
0000000000000015=20
[    4.106615] GPR08: c000203fff654348 0000000000000001 0000000000000001 =
4000000000000000=20
[    4.106615] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 =
c000003fefca4ec0=20
[    4.106615] GPR16: 0000000400040000 0000000000000000 0000000000000001 =
0000000000000001=20
[    4.106615] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 =
0000000040000000=20
[    4.106615] GPR24: 0000000040000000 0000000040000000 000000000000d600 =
c000003fc7c77000=20
[    4.106615] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 =
c00a00008d301e00=20
[    4.106870] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.106898] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.106933] Call Trace:
[    4.106942] [c000003fd78b7540] [0000000000000001] 0x1 (unreliable)
[    4.106957] [c000003fd78b7580] [c0000000005c2530] =
ioread32+0x100/0x170
[    4.107033] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 =
[nouveau]
[    4.107112] [c000003fd78b7600] [c00800000f0b5bb0] =
shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.107191] [c000003fd78b7650] [c00800000f0b5cf8] =
shadow_image+0xb8/0x360 [nouveau]
[    4.107276] [c000003fd78b7700] [c00800000f0b6040] =
shadow_method+0xa0/0x1a0 [nouveau]
[    4.107353] [c000003fd78b7780] [c00800000f0b6338] =
nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.107434] [c000003fd78b7910] [c00800000f0a23e8] =
nvkm_bios_new+0x98/0x530 [nouveau]
[    4.107505] [c000003fd78b79b0] [c00800000f134810] =
nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.107577] [c000003fd78b7aa0] [c00800000f137cb0] =
nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.107659] [c000003fd78b7b80] [c00800000f1a13a0] =
nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.107697] [c000003fd78b7bd0] [c0000000006112ec] =
local_pci_probe+0x6c/0x100
[    4.107732] [c000003fd78b7c50] [c0000000001430f8] =
work_for_cpu_fn+0x38/0x60
[    4.107776] [c000003fd78b7c80] [c000000000148118] =
process_one_work+0x1c8/0x4a0
[    4.107821] [c000003fd78b7d20] [c000000000148668] =
worker_thread+0x278/0x570
[    4.107866] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.107897] [c000003fd78b7e20] [c00000000000ba54] =
ret_from_kernel_thread+0x5c/0x68
[    4.107931] Instruction dump:
[    4.107962] e8690040 e92d1178 f9210028 39200000 48030631 60000000 =
2c230000 4182008c=20
[    4.108001] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 =
7bff0420 79295d24=20
[    4.108042] ---[ end trace 2a6f56e64fb66de9 ]=E2=80=94

WARN message is being printed by following code snippet :

static inline unsigned long eeh_token_to_phys(unsigned long token)
{
        pte_t *ptep;
        unsigned long pa;
        int hugepage_shift;

        /*
         * We won't find hugepages here(this is iomem). Hence we are not
         * worried about _PAGE_SPLITTING/collapse. Also we will not hit
         * page table free, because of init_mm.
         */
        ptep =3D find_init_mm_pte(token, &hugepage_shift);
        if (!ptep)
                return token;
        WARN_ON(hugepage_shift);  <=3D=3D=3D=3D=3D=3D
        pa =3D pte_pfn(*ptep) << PAGE_SHIFT;

        return pa | (token & (PAGE_SIZE-1));
}

Boot log attached.

Thanks
-Sachin

--Apple-Mail=_B540750B-9A34-490C-936C-792C6A5D64B1
Content-Disposition: attachment;
	filename=boot.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="boot.log"
Content-Transfer-Encoding: 7bit

[   29.676733] kexec_core: Starting new kernel
[  139.314078852,5] OPAL: Switch to big-endian OS
[  143.141412866,5] OPAL: Switch to little-endian OS
[    0.000000] crashkernel: memory value expected
[    0.000000] dt-cpu-ftrs: setup for ISA 3000
[    0.000000] dt-cpu-ftrs: not enabling: system-call-vectored (disabled or unsupported by kernel)
[    0.000000] dt-cpu-ftrs: final cpu/mmu features = 0x0000f86f8f5fb1a7 0x3c006041
[    0.000000] radix-mmu: Page sizes from device-tree:
[    0.000000] radix-mmu: Page size shift = 12 AP=0x0
[    0.000000] radix-mmu: Page size shift = 16 AP=0x5
[    0.000000] radix-mmu: Page size shift = 21 AP=0x1
[    0.000000] radix-mmu: Page size shift = 30 AP=0x2
[    0.000000] radix-mmu: Activating Kernel Userspace Execution Prevention
[    0.000000] radix-mmu: Activating Kernel Userspace Access Prevention
[    0.000000] radix-mmu: Initializing Radix MMU
[    0.000000] radix-mmu: Partition table (____ptrval____)
[    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000040000000 with 1.00 GiB pages (exec)
[    0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000004000000000 with 1.00 GiB pages
[    0.000000] radix-mmu: Mapped 0x0000200000000000-0x0000204000000000 with 1.00 GiB pages
[    0.000000] radix-mmu: Process table (____ptrval____) and radix root for kernel: (____ptrval____)
[    0.000000] Linux version 5.2.0-rc6+ (root@ltc-wspoon15.aus.stglabs.ibm.com) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-36) (GCC)) #1 SMP Wed Jun 26 18:30:58 CDT 2019
[    0.000000] Found initrd at 0xc0000000036a0000:0xc000000004ada2d2
[    0.000000] OPAL: Found memory mapped LPC bus on chip 0
[    0.000000] Using PowerNV machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] CPU maps initialized for 4 threads per core
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x8000000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x80
[    0.000000] cpu_features      = 0x0000f86f8f5fb1a7
[    0.000000]   possible        = 0x0000fbffcf5fb1a7
[    0.000000]   always          = 0x00000003800081a1
[    0.000000] cpu_user_features = 0xdc0065c2 0xaee00000
[    0.000000] mmu_features      = 0xbc006041
[    0.000000] firmware_features = 0x0000000110000000
[    0.000000] hash-mmu: ppc64_pft_size    = 0x0
[    0.000000] hash-mmu: kernel vmalloc start   = 0xc008000000000000
[    0.000000] hash-mmu: kernel IO start        = 0xc00a000000000000
[    0.000000] hash-mmu: kernel vmemmap start   = 0xc00c000000000000
[    0.000000] -----------------------------------------------------
[    0.000000] cma: Reserved 26224 MiB at 0x0000203995000000
[    0.000000] numa:   NODE_DATA [mem 0x3fff95c980-0x3fff963fff]
[    0.000000] numa:   NODE_DATA [mem 0x203fff00c980-0x203fff013fff]
[    0.000000] numa:   NODE_DATA [mem 0x203fff005300-0x203fff00c97f]
[    0.000000] numa:     NODE_DATA(252) on node 8
[    0.000000] numa:   NODE_DATA [mem 0x203ffce18980-0x203ffce1ffff]
[    0.000000] numa:     NODE_DATA(253) on node 8
[    0.000000] numa:   NODE_DATA [mem 0x203ffce11300-0x203ffce1897f]
[    0.000000] numa:     NODE_DATA(254) on node 8
[    0.000000] numa:   NODE_DATA [mem 0x203ffce09c80-0x203ffce112ff]
[    0.000000] numa:     NODE_DATA(255) on node 8
[    0.000000] Section 2113532 and 2113535 (node 8) have a circular dependency on usemap and pgdat allocations
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] count-cache-flush: software flush disabled.
[    0.000000] stf-barrier: eieio barrier available
[    0.000000] Initializing IODA2 PHB (/pciex@600c3c0000000)
[    0.000000] PCI host bridge /pciex@600c3c0000000 (primary) ranges:
[    0.000000]  MEM 0x000600c000000000..0x000600c07ffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0006000000000000..0x0006003fffffffff -> 0x0006000000000000 (M64 #1..31)
[    0.000000]  Using M64 #31 as default window
[    0.000000]   512 (511) PE's M32: 0x80000000 [segment=0x400000]
[    0.000000]                  M64: 0x4000000000 [segment=0x20000000]
[    0.000000]   Allocated bitmap for 4088 MSIs (base IRQ 0xfe000)
[    0.000000] Initializing IODA2 PHB (/pciex@600c3c0100000)
[    0.000000] PCI host bridge /pciex@600c3c0100000  ranges:
[    0.000000]  MEM 0x000600c080000000..0x000600c0fffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0006004000000000..0x0006007fffffffff -> 0x0006004000000000 (M64 #1..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x4000000000 [segment=0x40000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0xfd800)
[    0.000000] Initializing IODA2 PHB (/pciex@600c3c0200000)
[    0.000000] PCI host bridge /pciex@600c3c0200000  ranges:
[    0.000000]  MEM 0x000600c100000000..0x000600c17ffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0006008000000000..0x000600bfffffffff -> 0x0006008000000000 (M64 #1..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x4000000000 [segment=0x40000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0xfd000)
[    0.000000] Initializing IODA2 PHB (/pciex@600c3c0300000)
[    0.000000] PCI host bridge /pciex@600c3c0300000  ranges:
[    0.000000]  MEM 0x000600c180000000..0x000600c1fffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0006020000000000..0x0006023fffffffff -> 0x0006020000000000 (M64 #1..31)
[    0.000000]  Using M64 #31 as default window
[    0.000000]   512 (511) PE's M32: 0x80000000 [segment=0x400000]
[    0.000000]                  M64: 0x4000000000 [segment=0x20000000]
[    0.000000]   Allocated bitmap for 4088 MSIs (base IRQ 0xfc000)
[    0.000000] Initializing IODA2 PHB (/pciex@600c3c0400000)
[    0.000000] PCI host bridge /pciex@600c3c0400000  ranges:
[    0.000000]  MEM 0x000600c200000000..0x000600c27ffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0006024000000000..0x0006027fffffffff -> 0x0006024000000000 (M64 #1..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x4000000000 [segment=0x40000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0xfb800)
[    0.000000] Initializing IODA2 PHB (/pciex@600c3c0500000)
[    0.000000] PCI host bridge /pciex@600c3c0500000  ranges:
[    0.000000]  MEM 0x000600c280000000..0x000600c2fffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0006028000000000..0x000602bfffffffff -> 0x0006028000000000 (M64 #1..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x4000000000 [segment=0x40000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0xfb000)
[    0.000000] Initializing IODA2 PHB (/pciex@620c3c0000000)
[    0.000000] PCI host bridge /pciex@620c3c0000000  ranges:
[    0.000000]  MEM 0x000620c000000000..0x000620c07ffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0006200000000000..0x0006203fffffffff -> 0x0006200000000000 (M64 #1..31)
[    0.000000]  Using M64 #31 as default window
[    0.000000]   512 (511) PE's M32: 0x80000000 [segment=0x400000]
[    0.000000]                  M64: 0x4000000000 [segment=0x20000000]
[    0.000000]   Allocated bitmap for 4088 MSIs (base IRQ 0x1fe000)
[    0.000000] Initializing IODA2 PHB (/pciex@620c3c0300000)
[    0.000000] PCI host bridge /pciex@620c3c0300000  ranges:
[    0.000000]  MEM 0x000620c180000000..0x000620c1fffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0006220000000000..0x0006223fffffffff -> 0x0006220000000000 (M64 #1..31)
[    0.000000]  Using M64 #31 as default window
[    0.000000]   512 (511) PE's M32: 0x80000000 [segment=0x400000]
[    0.000000]                  M64: 0x4000000000 [segment=0x20000000]
[    0.000000]   Allocated bitmap for 4088 MSIs (base IRQ 0x1fd000)
[    0.000000] Initializing IODA2 PHB (/pciex@620c3c0400000)
[    0.000000] PCI host bridge /pciex@620c3c0400000  ranges:
[    0.000000]  MEM 0x000620c200000000..0x000620c27ffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0006224000000000..0x0006227fffffffff -> 0x0006224000000000 (M64 #1..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x4000000000 [segment=0x40000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x1fc800)
[    0.000000] Initializing IODA2 PHB (/pciex@620c3c0500000)
[    0.000000] PCI host bridge /pciex@620c3c0500000  ranges:
[    0.000000]  MEM 0x000620c280000000..0x000620c2fffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x0006228000000000..0x000622bfffffffff -> 0x0006228000000000 (M64 #1..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x4000000000 [segment=0x40000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x1fc000)
[    0.000000] Initializing NPU_NVLINK PHB (/pciex@6030200000000)
[    0.000000] PCI host bridge /pciex@6030200000000  ranges:
[    0.000000]  MEM 0x0006030201600000..0x000603020171ffff -> 0x0006030201600000 
[    0.000000]   Not support M64 window
[    0.000000]   016 (015) PE's M32: 0x130000 [segment=0x13000]
[    0.000000] Initializing NPU_NVLINK PHB (/pciex@6230200000000)
[    0.000000] PCI host bridge /pciex@6230200000000  ranges:
[    0.000000]  MEM 0x0006230201600000..0x000623020171ffff -> 0x0006230201600000 
[    0.000000]   Not support M64 window
[    0.000000]   016 (015) PE's M32: 0x130000 [segment=0x13000]
[    0.000000] OPAL nvram setup, 589824 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000203fffffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000003fffffffff]
[    0.000000]   node   8: [mem 0x0000200000000000-0x0000203fffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000003fffffffff]
[    0.000000] Initmem setup node 8 [mem 0x0000200000000000-0x0000203fffffffff]
[    0.000000] Could not find start_pfn for node 252
[    0.000000] Initmem setup node 252 [mem 0x0000000000000000-0x0000000000000000]
[    0.000000] Could not find start_pfn for node 253
[    0.000000] Initmem setup node 253 [mem 0x0000000000000000-0x0000000000000000]
[    0.000000] Could not find start_pfn for node 254
[    0.000000] Initmem setup node 254 [mem 0x0000000000000000-0x0000000000000000]
[    0.000000] Could not find start_pfn for node 255
[    0.000000] Initmem setup node 255 [mem 0x0000000000000000-0x0000000000000000]
[    0.000000] percpu: Embedded 11 pages/cpu s627608 r0 d93288 u720896
[    0.000000] Built 6 zonelists, mobility grouping on.  Total pages: 8380416
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=UUID=1c7a81ac-9d2b-4188-9785-e0fbd35a9fb9 ro crashkernel=auto
[    0.000000] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.000000] printk: log_buf_len total cpu_extra contributions: 651264 bytes
[    0.000000] printk: log_buf_len min size: 1048576 bytes
[    0.000000] printk: log_buf_len: 2097152 bytes
[    0.000000] printk: early log buf free: 1033436(98%)
[    0.000000] Memory: 509033216K/536870912K available (11200K kernel code, 1728K rwdata, 3456K rodata, 4800K init, 3846K bss, 984320K reserved, 26853376K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=160, Nodes=256
[    0.000000] ftrace: allocating 30232 entries in 12 pages
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=160.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=160
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] xive: Interrupt handling initialized with native backend
[    0.000000] xive: Using priority 7 for all interrupts
[    0.000000] xive: Using 64kB queues
[    0.000000] rcu: 	Offload RCU callbacks from CPUs: (none).
[    0.000000] random: get_random_u64 called from start_kernel+0x438/0x69c with crng_init=0
[    0.000009] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.002173] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.007469] clocksource: timebase mult[1f40000] shift[24] registered
[    0.011903] Console: colour dummy device 80x25
[    0.015034] printk: console [hvc0] enabled
[    0.015034] printk: console [hvc0] enabled
[    0.021196] printk: bootconsole [udbg0] disabled
[    0.021196] printk: bootconsole [udbg0] disabled
[    0.026653] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.026685] pid_max: default: 163840 minimum: 1280
[    0.028925] LSM: Security Framework initializing
[    0.029267] SELinux:  Initializing.
[    0.029920] *** VALIDATE SELinux ***
[    0.039795] Dentry cache hash table entries: 16777216 (order: 11, 134217728 bytes)
[    0.044727] Inode-cache hash table entries: 8388608 (order: 10, 67108864 bytes)
[    0.045099] Mount-cache hash table entries: 262144 (order: 5, 2097152 bytes)
[    0.045277] Mountpoint-cache hash table entries: 262144 (order: 5, 2097152 bytes)
[    0.046622] *** VALIDATE proc ***
[    0.046914] *** VALIDATE cgroup1 ***
[    0.046935] *** VALIDATE cgroup2 ***
[    0.047816] EEH: PowerNV platform initialized
[    0.047841] POWER9 performance monitor hardware support registered
[    0.047929] rcu: Hierarchical SRCU implementation.
[    0.050320] smp: Bringing up secondary CPUs ...
[    0.954131] smp: Brought up 6 nodes, 160 CPUs
[    0.954160] numa: Node 0 CPUs: 0-79
[    0.954175] numa: Node 8 CPUs: 80-159
[    0.954189] numa: Node 252 CPUs:
[    0.954212] numa: Node 253 CPUs:
[    0.954225] numa: Node 254 CPUs:
[    0.954248] numa: Node 255 CPUs:
[    0.954261] Using shared cache scheduler topology
[    0.988269] devtmpfs: initialized
[    1.085058] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    1.085166] futex hash table entries: 65536 (order: 7, 8388608 bytes)
[    1.100714] NET: Registered protocol family 16
[    1.101126] audit: initializing netlink subsys (disabled)
[    1.101275] audit: type=2000 audit(1561592268.080:1): state=initialized audit_enabled=0 res=1
[    1.101647] cpuidle: using governor menu
[    1.101900] pstore: Registered nvram as persistent store backend
[    1.189492] PCI: Probing PCI hardware
[    1.189597] PCI host bridge to bus 0000:00
[    1.189656] pci_bus 0000:00: root bus resource [mem 0x600c000000000-0x600c07ffeffff] (bus address [0x80000000-0xfffeffff])
[    1.189691] pci_bus 0000:00: root bus resource [mem 0x6000000000000-0x6003fbfffffff 64bit pref]
[    1.189738] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.189766] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    1.189845] pci 0000:00:00.0: [1014:04c1] type 01 class 0x060400
[    1.190112] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
[    1.197671] pci 0000:01:00.0: [144d:a822] type 00 class 0x010802
[    1.197761] pci 0000:01:00.0: reg 0x10: [mem 0x600c000020000-0x600c000023fff 64bit]
[    1.197866] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    1.197927] pci 0000:01:00.0: BAR0 [mem size 0x00004000 64bit]: requesting alignment to 0x10000
[    1.205442] pci 0000:00:00.0: PCI bridge to [bus 01]
[    1.205469] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
[    1.205583] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 01
[    1.205666] PCI host bridge to bus 0001:00
[    1.205682] pci_bus 0001:00: root bus resource [mem 0x600c080000000-0x600c0fffeffff] (bus address [0x80000000-0xfffeffff])
[    1.205706] pci_bus 0001:00: root bus resource [mem 0x6004000000000-0x6007f7fffffff 64bit pref]
[    1.205761] pci_bus 0001:00: root bus resource [bus 00-ff]
[    1.205801] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to ff
[    1.205878] pci 0001:00:00.0: [1014:04c1] type 01 class 0x060400
[    1.206148] pci 0001:00:00.0: PME# supported from D0 D3hot D3cold
[    1.213534] pci 0001:01:00.0: [104c:8241] type 00 class 0x0c0330
[    1.213617] pci 0001:01:00.0: reg 0x10: [mem 0x600c080000000-0x600c08000ffff 64bit]
[    1.213683] pci 0001:01:00.0: reg 0x18: [mem 0x600c080010000-0x600c080011fff 64bit]
[    1.213821] pci 0001:01:00.0: BAR2 [mem size 0x00002000 64bit]: requesting alignment to 0x10000
[    1.213998] pci 0001:01:00.0: supports D1 D2
[    1.214048] pci 0001:01:00.0: PME# supported from D0 D1 D2 D3hot
[    1.221406] pci 0001:00:00.0: PCI bridge to [bus 01]
[    1.221432] pci 0001:00:00.0:   bridge window [io  0x0000-0x0fff]
[    1.221526] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to 01
[    1.221599] PCI host bridge to bus 0002:00
[    1.221617] pci_bus 0002:00: root bus resource [mem 0x600c100000000-0x600c17ffeffff] (bus address [0x80000000-0xfffeffff])
[    1.221664] pci_bus 0002:00: root bus resource [mem 0x6008000000000-0x600bf7fffffff 64bit pref]
[    1.221705] pci_bus 0002:00: root bus resource [bus 00-ff]
[    1.221758] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to ff
[    1.221813] pci 0002:00:00.0: [1014:04c1] type 01 class 0x060400
[    1.222086] pci 0002:00:00.0: PME# supported from D0 D3hot D3cold
[    1.222170] random: fast init done
[    1.229458] pci 0002:01:00.0: [1a03:1150] type 01 class 0x060400
[    1.229774] pci 0002:01:00.0: supports D1 D2
[    1.229794] pci 0002:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.237133] pci 0002:00:00.0: PCI bridge to [bus 01-02]
[    1.237161] pci 0002:00:00.0:   bridge window [io  0x0000-0x0fff]
[    1.237327] pci_bus 0002:02: extended config space not accessible
[    1.237426] pci 0002:02:00.0: [1a03:2000] type 00 class 0x030000
[    1.237491] pci 0002:02:00.0: reg 0x10: [mem 0x600c100000000-0x600c100ffffff]
[    1.237562] pci 0002:02:00.0: reg 0x14: [mem 0x600c101000000-0x600c10101ffff]
[    1.237633] pci 0002:02:00.0: reg 0x18: [io  0x0000-0x007f]
[    1.237836] pci 0002:02:00.0: supports D1 D2
[    1.237868] pci 0002:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.245089] pci 0002:01:00.0: PCI bridge to [bus 02]
[    1.245180] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to 02
[    1.245262] PCI host bridge to bus 0003:00
[    1.245277] pci_bus 0003:00: root bus resource [mem 0x600c180000000-0x600c1fffeffff] (bus address [0x80000000-0xfffeffff])
[    1.245324] pci_bus 0003:00: root bus resource [mem 0x6020000000000-0x6023fbfffffff 64bit pref]
[    1.245401] pci_bus 0003:00: root bus resource [bus 00-ff]
[    1.245437] pci_bus 0003:00: busn_res: [bus 00-ff] end is updated to ff
[    1.245514] pci 0003:00:00.0: [1014:04c1] type 01 class 0x060400
[    1.245759] pci 0003:00:00.0: PME# supported from D0 D3hot D3cold
[    1.253162] pci 0003:01:00.0: [15b3:1019] type 00 class 0x020700
[    1.253484] pci 0003:01:00.0: reg 0x10: [mem 0x6020000000000-0x602001fffffff 64bit pref]
[    1.255065] pci 0003:01:00.0: PME# supported from D3cold
[    1.255392] pci 0003:01:00.0: reg 0x1a4: [mem 0x00000000-0x01ffffff 64bit pref]
[    1.255414] pci 0003:01:00.0: VF(n) BAR0 space: [mem 0x00000000-0x0fffffff 64bit pref] (contains BAR0 for 8 VFs)
[    1.256269] pci 0003:01:00.0: VF BAR0: [mem 0x00000000-0x3ffffffff 64bit pref] (expanded to 512 VFs for PE alignment)
[    1.256490] pci 0003:01:00.1: [15b3:1019] type 00 class 0x020700
[    1.256797] pci 0003:01:00.1: reg 0x10: [mem 0x6020020000000-0x602003fffffff 64bit pref]
[    1.258218] pci 0003:01:00.1: PME# supported from D3cold
[    1.258519] pci 0003:01:00.1: reg 0x1a4: [mem 0x00000000-0x01ffffff 64bit pref]
[    1.258547] pci 0003:01:00.1: VF(n) BAR0 space: [mem 0x00000000-0x0fffffff 64bit pref] (contains BAR0 for 8 VFs)
[    1.259300] pci 0003:01:00.1: VF BAR0: [mem 0x00000000-0x3ffffffff 64bit pref] (expanded to 512 VFs for PE alignment)
[    1.266697] pci 0003:00:00.0: PCI bridge to [bus 01]
[    1.266726] pci 0003:00:00.0:   bridge window [io  0x0000-0x0fff]
[    1.266854] pci_bus 0003:00: busn_res: [bus 00-ff] end is updated to 01
[    1.266927] PCI host bridge to bus 0004:00
[    1.266948] pci_bus 0004:00: root bus resource [mem 0x600c200000000-0x600c27ffeffff] (bus address [0x80000000-0xfffeffff])
[    1.267018] pci_bus 0004:00: root bus resource [mem 0x6024000000000-0x6027f7fffffff 64bit pref]
[    1.267074] pci_bus 0004:00: root bus resource [bus 00-ff]
[    1.267112] pci_bus 0004:00: busn_res: [bus 00-ff] end is updated to ff
[    1.267176] pci 0004:00:00.0: [1014:04c1] type 01 class 0x060400
[    1.267445] pci 0004:00:00.0: PME# supported from D0 D3hot D3cold
[    1.274835] pci 0004:01:00.0: [10b5:8725] type 01 class 0x060400
[    1.274929] pci 0004:01:00.0: reg 0x10: [mem 0x600c202800000-0x600c20283ffff]
[    1.275243] pci 0004:01:00.0: PME# supported from D0 D3hot D3cold
[    1.275516] pci 0004:01:00.1: [10b5:87d0] type 00 class 0x088000
[    1.275601] pci 0004:01:00.1: reg 0x10: [mem 0x600c202840000-0x600c202841fff]
[    1.275758] pci 0004:01:00.1: BAR0 [mem size 0x00002000]: requesting alignment to 0x10000
[    1.276084] pci 0004:01:00.2: [10b5:87d0] type 00 class 0x088000
[    1.276168] pci 0004:01:00.2: reg 0x10: [mem 0x600c202850000-0x600c202851fff]
[    1.276332] pci 0004:01:00.2: BAR0 [mem size 0x00002000]: requesting alignment to 0x10000
[    1.276661] pci 0004:01:00.3: [10b5:87d0] type 00 class 0x088000
[    1.276744] pci 0004:01:00.3: reg 0x10: [mem 0x600c202860000-0x600c202861fff]
[    1.276909] pci 0004:01:00.3: BAR0 [mem size 0x00002000]: requesting alignment to 0x10000
[    1.277249] pci 0004:01:00.4: [10b5:87d0] type 00 class 0x088000
[    1.277337] pci 0004:01:00.4: reg 0x10: [mem 0x600c202870000-0x600c202871fff]
[    1.277498] pci 0004:01:00.4: BAR0 [mem size 0x00002000]: requesting alignment to 0x10000
[    1.284955] pci 0004:00:00.0: PCI bridge to [bus 01-0a]
[    1.284981] pci 0004:00:00.0:   bridge window [io  0x0000-0x0fff]
[    1.285694] pci 0004:02:02.0: [10b5:8725] type 01 class 0x060400
[    1.286067] pci 0004:02:02.0: PME# supported from D0 D3hot D3cold
[    1.288069] pci 0004:02:0a.0: [10b5:8725] type 01 class 0x060400
[    1.288447] pci 0004:02:0a.0: PME# supported from D0 D3hot D3cold
[    1.288906] pci 0004:02:0b.0: [10b5:8725] type 01 class 0x060400
[    1.289278] pci 0004:02:0b.0: PME# supported from D0 D3hot D3cold
[    1.289743] pci 0004:02:0c.0: [10b5:8725] type 01 class 0x060400
[    1.290120] pci 0004:02:0c.0: PME# supported from D0 D3hot D3cold
[    1.294741] pci 0004:01:00.0: PCI bridge to [bus 02-0a]
[    1.295111] pci 0004:03:00.0: [1b4b:9235] type 00 class 0x010601
[    1.295182] pci 0004:03:00.0: reg 0x10: [io  0x8000-0x8007]
[    1.295226] pci 0004:03:00.0: reg 0x14: [io  0x8040-0x8043]
[    1.295268] pci 0004:03:00.0: reg 0x18: [io  0x8100-0x8107]
[    1.295313] pci 0004:03:00.0: reg 0x1c: [io  0x8140-0x8143]
[    1.295367] pci 0004:03:00.0: reg 0x20: [io  0x800000-0x80001f]
[    1.295423] pci 0004:03:00.0: reg 0x24: [mem 0x600c202000000-0x600c2020007ff]
[    1.295482] pci 0004:03:00.0: reg 0x30: [mem 0x600c250000000-0x600c25000ffff pref]
[    1.295534] pci 0004:03:00.0: BAR5 [mem size 0x00000800]: requesting alignment to 0x10000
[    1.295670] pci 0004:03:00.0: PME# supported from D3hot
[    1.303020] pci 0004:02:02.0: PCI bridge to [bus 03]
[    1.303209] pci 0004:04:00.0: [10de:1db1] type 00 class 0x030200
[    1.303319] pci 0004:04:00.0: reg 0x10: [mem 0x600c200000000-0x600c200ffffff]
[    1.303377] pci 0004:04:00.0: reg 0x14: [mem 0x6024000000000-0x60243ffffffff 64bit pref]
[    1.303457] pci 0004:04:00.0: reg 0x1c: [mem 0x6024400000000-0x6024401ffffff 64bit pref]
[    1.303822] pci 0004:04:00.0: 15.752 Gb/s available PCIe bandwidth, limited by 8 GT/s x2 link at 0004:02:0a.0 (capable of 126.016 Gb/s with 8 GT/s x16 link)
[    1.311063] pci 0004:02:0a.0: PCI bridge to [bus 04]
[    1.311255] pci 0004:05:00.0: [10de:1db1] type 00 class 0x030200
[    1.311357] pci 0004:05:00.0: reg 0x10: [mem 0x600c201000000-0x600c201ffffff]
[    1.311417] pci 0004:05:00.0: reg 0x14: [mem 0x6024800000000-0x6024bffffffff 64bit pref]
[    1.311494] pci 0004:05:00.0: reg 0x1c: [mem 0x6024600000000-0x6024601ffffff 64bit pref]
[    1.311910] pci 0004:05:00.0: 15.752 Gb/s available PCIe bandwidth, limited by 8 GT/s x2 link at 0004:02:0b.0 (capable of 126.016 Gb/s with 8 GT/s x16 link)
[    1.319145] pci 0004:02:0b.0: PCI bridge to [bus 05]
[    1.326360] pci 0004:02:0c.0: PCI bridge to [bus 06-0a]
[    1.326475] pci_bus 0004:00: busn_res: [bus 00-ff] end is updated to 0a
[    1.326582] PCI host bridge to bus 0005:00
[    1.326614] pci_bus 0005:00: root bus resource [mem 0x600c280000000-0x600c2fffeffff] (bus address [0x80000000-0xfffeffff])
[    1.326684] pci_bus 0005:00: root bus resource [mem 0x6028000000000-0x602bf7fffffff 64bit pref]
[    1.326739] pci_bus 0005:00: root bus resource [bus 00-ff]
[    1.326777] pci_bus 0005:00: busn_res: [bus 00-ff] end is updated to ff
[    1.326842] pci 0005:00:00.0: [1014:04c1] type 01 class 0x060400
[    1.327112] pci 0005:00:00.0: PME# supported from D0 D3hot D3cold
[    1.334507] pci 0005:01:00.0: [14e4:1657] type 00 class 0x020000
[    1.334595] pci 0005:01:00.0: reg 0x10: [mem 0x6028000000000-0x602800000ffff 64bit pref]
[    1.334656] pci 0005:01:00.0: reg 0x18: [mem 0x6028000010000-0x602800001ffff 64bit pref]
[    1.334704] pci 0005:01:00.0: reg 0x20: [mem 0x6028000020000-0x602800002ffff 64bit pref]
[    1.334988] pci 0005:01:00.0: PME# supported from D0 D3hot D3cold
[    1.335108] pci 0005:01:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 5 GT/s x2 link at 0005:00:00.0 (capable of 16.000 Gb/s with 5 GT/s x4 link)
[    1.335266] pci 0005:01:00.1: [14e4:1657] type 00 class 0x020000
[    1.335397] pci 0005:01:00.1: reg 0x10: [mem 0x6028000030000-0x602800003ffff 64bit pref]
[    1.335467] pci 0005:01:00.1: reg 0x18: [mem 0x6028000040000-0x602800004ffff 64bit pref]
[    1.335545] pci 0005:01:00.1: reg 0x20: [mem 0x6028000050000-0x602800005ffff 64bit pref]
[    1.335828] pci 0005:01:00.1: PME# supported from D0 D3hot D3cold
[    1.343134] pci 0005:00:00.0: PCI bridge to [bus 01]
[    1.343157] pci 0005:00:00.0:   bridge window [io  0x0000-0x0fff]
[    1.343286] pci_bus 0005:00: busn_res: [bus 00-ff] end is updated to 01
[    1.343382] PCI host bridge to bus 0030:00
[    1.343409] pci_bus 0030:00: root bus resource [mem 0x620c000000000-0x620c07ffeffff] (bus address [0x80000000-0xfffeffff])
[    1.343455] pci_bus 0030:00: root bus resource [mem 0x6200000000000-0x6203fbfffffff 64bit pref]
[    1.343489] pci_bus 0030:00: root bus resource [bus 00-ff]
[    1.343526] pci_bus 0030:00: busn_res: [bus 00-ff] end is updated to ff
[    1.343598] pci 0030:00:00.0: [1014:04c1] type 01 class 0x060400
[    1.343904] pci 0030:00:00.0: PME# supported from D0 D3hot D3cold
[    1.351356] pci 0030:01:00.0: [15b3:1015] type 00 class 0x020000
[    1.351630] pci 0030:01:00.0: reg 0x10: [mem 0x6200000000000-0x6200007ffffff 64bit pref]
[    1.351991] pci 0030:01:00.0: reg 0x30: [mem 0x00000000-0x000fffff pref]
[    1.352955] pci 0030:01:00.0: PME# supported from D3cold
[    1.353280] pci 0030:01:00.0: reg 0x1a4: [mem 0x00000000-0x01ffffff 64bit pref]
[    1.353302] pci 0030:01:00.0: VF(n) BAR0 space: [mem 0x00000000-0x0fffffff 64bit pref] (contains BAR0 for 8 VFs)
[    1.354093] pci 0030:01:00.0: VF BAR0: [mem 0x00000000-0x3ffffffff 64bit pref] (expanded to 512 VFs for PE alignment)
[    1.354320] pci 0030:01:00.1: [15b3:1015] type 00 class 0x020000
[    1.354583] pci 0030:01:00.1: reg 0x10: [mem 0x6200008000000-0x620000fffffff 64bit pref]
[    1.354945] pci 0030:01:00.1: reg 0x30: [mem 0x00000000-0x000fffff pref]
[    1.355868] pci 0030:01:00.1: PME# supported from D3cold
[    1.356164] pci 0030:01:00.1: reg 0x1a4: [mem 0x00000000-0x01ffffff 64bit pref]
[    1.356186] pci 0030:01:00.1: VF(n) BAR0 space: [mem 0x00000000-0x0fffffff 64bit pref] (contains BAR0 for 8 VFs)
[    1.356905] pci 0030:01:00.1: VF BAR0: [mem 0x00000000-0x3ffffffff 64bit pref] (expanded to 512 VFs for PE alignment)
[    1.364279] pci 0030:00:00.0: PCI bridge to [bus 01]
[    1.364302] pci 0030:00:00.0:   bridge window [io  0x0000-0x0fff]
[    1.364435] pci_bus 0030:00: busn_res: [bus 00-ff] end is updated to 01
[    1.364533] PCI host bridge to bus 0033:00
[    1.364558] pci_bus 0033:00: root bus resource [mem 0x620c180000000-0x620c1fffeffff] (bus address [0x80000000-0xfffeffff])
[    1.364630] pci_bus 0033:00: root bus resource [mem 0x6220000000000-0x6223fbfffffff 64bit pref]
[    1.364696] pci_bus 0033:00: root bus resource [bus 00-ff]
[    1.364736] pci_bus 0033:00: busn_res: [bus 00-ff] end is updated to ff
[    1.364806] pci 0033:00:00.0: [1014:04c1] type 01 class 0x060400
[    1.365120] pci 0033:00:00.0: PME# supported from D0 D3hot D3cold
[    1.372542] pci 0033:01:00.0: [15b3:1019] type 00 class 0x020700
[    1.372878] pci 0033:01:00.0: reg 0x10: [mem 0x6220000000000-0x622001fffffff 64bit pref]
[    1.374510] pci 0033:01:00.0: PME# supported from D3cold
[    1.374848] pci 0033:01:00.0: reg 0x1a4: [mem 0x00000000-0x01ffffff 64bit pref]
[    1.374877] pci 0033:01:00.0: VF(n) BAR0 space: [mem 0x00000000-0x0fffffff 64bit pref] (contains BAR0 for 8 VFs)
[    1.375722] pci 0033:01:00.0: VF BAR0: [mem 0x00000000-0x3ffffffff 64bit pref] (expanded to 512 VFs for PE alignment)
[    1.375955] pci 0033:01:00.1: [15b3:1019] type 00 class 0x020700
[    1.376268] pci 0033:01:00.1: reg 0x10: [mem 0x6220020000000-0x622003fffffff 64bit pref]
[    1.377728] pci 0033:01:00.1: PME# supported from D3cold
[    1.378037] pci 0033:01:00.1: reg 0x1a4: [mem 0x00000000-0x01ffffff 64bit pref]
[    1.378065] pci 0033:01:00.1: VF(n) BAR0 space: [mem 0x00000000-0x0fffffff 64bit pref] (contains BAR0 for 8 VFs)
[    1.378831] pci 0033:01:00.1: VF BAR0: [mem 0x00000000-0x3ffffffff 64bit pref] (expanded to 512 VFs for PE alignment)
[    1.386237] pci 0033:00:00.0: PCI bridge to [bus 01]
[    1.386264] pci 0033:00:00.0:   bridge window [io  0x0000-0x0fff]
[    1.386388] pci_bus 0033:00: busn_res: [bus 00-ff] end is updated to 01
[    1.386484] PCI host bridge to bus 0034:00
[    1.386510] pci_bus 0034:00: root bus resource [mem 0x620c200000000-0x620c27ffeffff] (bus address [0x80000000-0xfffeffff])
[    1.386547] pci_bus 0034:00: root bus resource [mem 0x6224000000000-0x6227f7fffffff 64bit pref]
[    1.386568] pci_bus 0034:00: root bus resource [bus 00-ff]
[    1.386606] pci_bus 0034:00: busn_res: [bus 00-ff] end is updated to ff
[    1.386676] pci 0034:00:00.0: [1014:04c1] type 01 class 0x060400
[    1.386954] pci 0034:00:00.0: PME# supported from D0 D3hot D3cold
[    1.401398] pci 0034:00:00.0: PCI bridge to [bus 01]
[    1.401424] pci 0034:00:00.0:   bridge window [io  0x0000-0x0fff]
[    1.401485] pci_bus 0034:00: busn_res: [bus 00-ff] end is updated to 01
[    1.401568] PCI host bridge to bus 0035:00
[    1.401593] pci_bus 0035:00: root bus resource [mem 0x620c280000000-0x620c2fffeffff] (bus address [0x80000000-0xfffeffff])
[    1.401652] pci_bus 0035:00: root bus resource [mem 0x6228000000000-0x622bf7fffffff 64bit pref]
[    1.401695] pci_bus 0035:00: root bus resource [bus 00-ff]
[    1.401734] pci_bus 0035:00: busn_res: [bus 00-ff] end is updated to ff
[    1.401805] pci 0035:00:00.0: [1014:04c1] type 01 class 0x060400
[    1.402106] pci 0035:00:00.0: PME# supported from D0 D3hot D3cold
[    1.409529] pci 0035:01:00.0: [10b5:8725] type 01 class 0x060400
[    1.409632] pci 0035:01:00.0: reg 0x10: [mem 0x620c282000000-0x620c28203ffff]
[    1.410014] pci 0035:01:00.0: PME# supported from D0 D3hot D3cold
[    1.417440] pci 0035:00:00.0: PCI bridge to [bus 01-09]
[    1.417466] pci 0035:00:00.0:   bridge window [io  0x0000-0x0fff]
[    1.418586] pci 0035:02:04.0: [10b5:8725] type 01 class 0x060400
[    1.419032] pci 0035:02:04.0: PME# supported from D0 D3hot D3cold
[    1.419519] pci 0035:02:05.0: [10b5:8725] type 01 class 0x060400
[    1.419968] pci 0035:02:05.0: PME# supported from D0 D3hot D3cold
[    1.421999] pci 0035:02:0d.0: [10b5:8725] type 01 class 0x060400
[    1.422451] pci 0035:02:0d.0: PME# supported from D0 D3hot D3cold
[    1.426895] pci 0035:01:00.0: PCI bridge to [bus 02-09]
[    1.427215] pci 0035:03:00.0: [10de:1db1] type 00 class 0x030200
[    1.427316] pci 0035:03:00.0: reg 0x10: [mem 0x620c280000000-0x620c280ffffff]
[    1.427367] pci 0035:03:00.0: reg 0x14: [mem 0x6228000000000-0x62283ffffffff 64bit pref]
[    1.427446] pci 0035:03:00.0: reg 0x1c: [mem 0x6228400000000-0x6228401ffffff 64bit pref]
[    1.427900] pci 0035:03:00.0: 15.752 Gb/s available PCIe bandwidth, limited by 8 GT/s x2 link at 0035:02:04.0 (capable of 126.016 Gb/s with 8 GT/s x16 link)
[    1.435144] pci 0035:02:04.0: PCI bridge to [bus 03]
[    1.435359] pci 0035:04:00.0: [10de:1db1] type 00 class 0x030200
[    1.435464] pci 0035:04:00.0: reg 0x10: [mem 0x620c281000000-0x620c281ffffff]
[    1.435545] pci 0035:04:00.0: reg 0x14: [mem 0x6228800000000-0x6228bffffffff 64bit pref]
[    1.435626] pci 0035:04:00.0: reg 0x1c: [mem 0x6228600000000-0x6228601ffffff 64bit pref]
[    1.436076] pci 0035:04:00.0: 15.752 Gb/s available PCIe bandwidth, limited by 8 GT/s x2 link at 0035:02:05.0 (capable of 126.016 Gb/s with 8 GT/s x16 link)
[    1.443329] pci 0035:02:05.0: PCI bridge to [bus 04]
[    1.450561] pci 0035:02:0d.0: PCI bridge to [bus 05-09]
[    1.450683] pci_bus 0035:00: busn_res: [bus 00-ff] end is updated to 09
[    1.450773] PCI host bridge to bus 0006:00
[    1.450808] pci_bus 0006:00: root bus resource [mem 0x6030201600000-0x603020171ffff]
[    1.450860] pci_bus 0006:00: root bus resource [bus 00-ff]
[    1.450900] pci_bus 0006:00: busn_res: [bus 00-ff] end is updated to ff
[    1.450950] pci 0006:00:00.0: [1014:04ea] type 00 class 0x068001
[    1.451055] pci 0006:00:00.0: reg 0x10: [mem 0x6030201600000-0x603020161ffff 64bit]
[    1.451105] pci 0006:00:00.0: reg 0x18: [mem 0x60302016c0000-0x60302016cffff 64bit]
[    1.451334] pci 0006:00:00.1: [1014:04ea] type 00 class 0x068001
[    1.451439] pci 0006:00:00.1: reg 0x10: [mem 0x6030201620000-0x603020163ffff 64bit]
[    1.451513] pci 0006:00:00.1: reg 0x18: [mem 0x60302016d0000-0x60302016dffff 64bit]
[    1.451746] pci 0006:00:00.2: [1014:04ea] type 00 class 0x068001
[    1.451872] pci 0006:00:00.2: reg 0x10: [mem 0x6030201640000-0x603020165ffff 64bit]
[    1.451946] pci 0006:00:00.2: reg 0x18: [mem 0x60302016e0000-0x60302016effff 64bit]
[    1.452416] pci 0006:00:01.0: [1014:04ea] type 00 class 0x068001
[    1.452510] pci 0006:00:01.0: reg 0x10: [mem 0x6030201660000-0x603020167ffff 64bit]
[    1.452579] pci 0006:00:01.0: reg 0x18: [mem 0x60302016f0000-0x60302016fffff 64bit]
[    1.452806] pci 0006:00:01.1: [1014:04ea] type 00 class 0x068001
[    1.452924] pci 0006:00:01.1: reg 0x10: [mem 0x6030201680000-0x603020169ffff 64bit]
[    1.452983] pci 0006:00:01.1: reg 0x18: [mem 0x6030201700000-0x603020170ffff 64bit]
[    1.453218] pci 0006:00:01.2: [1014:04ea] type 00 class 0x068001
[    1.453343] pci 0006:00:01.2: reg 0x10: [mem 0x60302016a0000-0x60302016bffff 64bit]
[    1.453410] pci 0006:00:01.2: reg 0x18: [mem 0x6030201710000-0x603020171ffff 64bit]
[    1.460718] pci_bus 0006:00: busn_res: [bus 00-ff] end is updated to 00
[    1.460801] PCI host bridge to bus 0007:00
[    1.460814] pci_bus 0007:00: root bus resource [mem 0x6230201600000-0x623020171ffff]
[    1.460857] pci_bus 0007:00: root bus resource [bus 00-ff]
[    1.460894] pci_bus 0007:00: busn_res: [bus 00-ff] end is updated to ff
[    1.460943] pci 0007:00:00.0: [1014:04ea] type 00 class 0x068001
[    1.461047] pci 0007:00:00.0: reg 0x10: [mem 0x6230201600000-0x623020161ffff 64bit]
[    1.461127] pci 0007:00:00.0: reg 0x18: [mem 0x62302016c0000-0x62302016cffff 64bit]
[    1.461354] pci 0007:00:00.1: [1014:04ea] type 00 class 0x068001
[    1.461473] pci 0007:00:00.1: reg 0x10: [mem 0x6230201620000-0x623020163ffff 64bit]
[    1.461553] pci 0007:00:00.1: reg 0x18: [mem 0x62302016d0000-0x62302016dffff 64bit]
[    1.461794] pci 0007:00:00.2: [1014:04ea] type 00 class 0x068001
[    1.461907] pci 0007:00:00.2: reg 0x10: [mem 0x6230201640000-0x623020165ffff 64bit]
[    1.461971] pci 0007:00:00.2: reg 0x18: [mem 0x62302016e0000-0x62302016effff 64bit]
[    1.462430] pci 0007:00:01.0: [1014:04ea] type 00 class 0x068001
[    1.462521] pci 0007:00:01.0: reg 0x10: [mem 0x6230201660000-0x623020167ffff 64bit]
[    1.462575] pci 0007:00:01.0: reg 0x18: [mem 0x62302016f0000-0x62302016fffff 64bit]
[    1.462805] pci 0007:00:01.1: [1014:04ea] type 00 class 0x068001
[    1.462913] pci 0007:00:01.1: reg 0x10: [mem 0x6230201680000-0x623020169ffff 64bit]
[    1.462971] pci 0007:00:01.1: reg 0x18: [mem 0x6230201700000-0x623020170ffff 64bit]
[    1.463203] pci 0007:00:01.2: [1014:04ea] type 00 class 0x068001
[    1.463289] pci 0007:00:01.2: reg 0x10: [mem 0x62302016a0000-0x62302016bffff 64bit]
[    1.463357] pci 0007:00:01.2: reg 0x18: [mem 0x6230201710000-0x623020171ffff 64bit]
[    1.470659] pci_bus 0007:00: busn_res: [bus 00-ff] end is updated to 00
[    1.470708] pci 0000:00:00.0: BAR 14: assigned [mem 0x600c000000000-0x600c0003fffff]
[    1.470730] pci 0000:01:00.0: BAR 6: assigned [mem 0x600c000000000-0x600c00001ffff pref]
[    1.470773] pci 0000:01:00.0: BAR 0: assigned [mem 0x600c000020000-0x600c000023fff 64bit]
[    1.470827] pci 0000:00     : [PE# 1fe] Secondary bus 0x0000000000000000 associated with PE#1fe
[    1.471119] pci 0000:01     : [PE# 1fd] Secondary bus 0x0000000000000001 associated with PE#1fd
[    1.471465] pci 0000:01     : [PE# 1fd] Setting up 32-bit TCE table at 0..80000000
[    1.484284] IOMMU table initialized, virtual merging enabled
[    1.484310] pci 0000:01     : [PE# 1fd] Setting up window#0 0..7fffffff pg=1000
[    1.484348] pci 0000:01     : [PE# 1fd] Enabling 64-bit DMA bypass
[    1.484389] pci 0000:00:00.0: PCI bridge to [bus 01]
[    1.484447] pci 0000:00:00.0:   bridge window [mem 0x600c000000000-0x600c07fefffff]
[    1.484496] pci_bus 0000:00: resource 4 [mem 0x600c000000000-0x600c07ffeffff]
[    1.484527] pci_bus 0000:00: resource 5 [mem 0x6000000000000-0x6003fbfffffff 64bit pref]
[    1.484547] pci_bus 0000:01: resource 1 [mem 0x600c000000000-0x600c07fefffff]
[    1.484602] pci 0001:00:00.0: BAR 14: assigned [mem 0x600c080000000-0x600c0807fffff]
[    1.484659] pci 0001:01:00.0: BAR 0: assigned [mem 0x600c080000000-0x600c08000ffff 64bit]
[    1.484721] pci 0001:01:00.0: BAR 2: assigned [mem 0x600c080010000-0x600c080011fff 64bit]
[    1.484793] pci 0001:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    1.485108] pci 0001:01     : [PE# fd] Secondary bus 0x0000000000000001 associated with PE#fd
[    1.485425] pci 0001:01     : [PE# fd] Setting up 32-bit TCE table at 0..80000000
[    1.498226] pci 0001:01     : [PE# fd] Setting up window#0 0..7fffffff pg=1000
[    1.498257] pci 0001:01     : [PE# fd] Enabling 64-bit DMA bypass
[    1.498287] pci 0001:00:00.0: PCI bridge to [bus 01]
[    1.498310] pci 0001:00:00.0:   bridge window [mem 0x600c080000000-0x600c0ffefffff]
[    1.498354] pci_bus 0001:00: resource 4 [mem 0x600c080000000-0x600c0fffeffff]
[    1.498385] pci_bus 0001:00: resource 5 [mem 0x6004000000000-0x6007f7fffffff 64bit pref]
[    1.498440] pci_bus 0001:01: resource 1 [mem 0x600c080000000-0x600c0ffefffff]
[    1.498498] pci 0002:00:00.0: BAR 14: assigned [mem 0x600c100000000-0x600c1017fffff]
[    1.498530] pci 0002:01:00.0: BAR 14: assigned [mem 0x600c100000000-0x600c1017fffff]
[    1.498571] pci 0002:01:00.0: BAR 13: no space for [io  size 0x1000]
[    1.498598] pci 0002:01:00.0: BAR 13: failed to assign [io  size 0x1000]
[    1.498641] pci 0002:02:00.0: BAR 0: assigned [mem 0x600c100000000-0x600c100ffffff]
[    1.498689] pci 0002:02:00.0: BAR 1: assigned [mem 0x600c101000000-0x600c10101ffff]
[    1.498731] pci 0002:02:00.0: BAR 2: no space for [io  size 0x0080]
[    1.498787] pci 0002:02:00.0: BAR 2: failed to assign [io  size 0x0080]
[    1.498851] pci 0002:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    1.499169] pci 0002:02     : [PE# fd] Secondary bus 0x0000000000000002..0x0000000000000002 associated with PE#fd
[    1.499485] pci 0002:02     : [PE# fd] Setting up 32-bit TCE table at 0..80000000
[    1.512259] pci 0002:02     : [PE# fd] Setting up window#0 0..7fffffff pg=1000
[    1.512289] pci 0002:02     : [PE# fd] Enabling 64-bit DMA bypass
[    1.512307] pci 0002:01:00.0: PCI bridge to [bus 02]
[    1.512342] pci 0002:01:00.0:   bridge window [mem 0x600c100000000-0x600c17fefffff]
[    1.512391] pci 0002:01     : [PE# fc] Secondary bus 0x0000000000000001 associated with PE#fc
[    1.512697] pci 0002:00:00.0: PCI bridge to [bus 01-02]
[    1.512718] pci 0002:00:00.0:   bridge window [mem 0x600c100000000-0x600c17fefffff]
[    1.512772] pci_bus 0002:00: Some PCI device resources are unassigned, try booting with pci=realloc
[    1.512808] pci_bus 0002:00: resource 4 [mem 0x600c100000000-0x600c17ffeffff]
[    1.512839] pci_bus 0002:00: resource 5 [mem 0x6008000000000-0x600bf7fffffff 64bit pref]
[    1.512881] pci_bus 0002:01: resource 1 [mem 0x600c100000000-0x600c17fefffff]
[    1.512956] pci_bus 0002:02: resource 1 [mem 0x600c100000000-0x600c17fefffff]
[    1.513002] pci 0003:00:00.0: bridge window [mem 0x20000000-0x5fffffff 64bit pref] to [bus 01] add_size bc0000000 add_align 400000000
[    1.513098] pci 0003:00:00.0: BAR 15: assigned [mem 0x6020000000000-0x6020bffffffff 64bit pref]
[    1.513146] pci 0003:01:00.0: BAR 7: assigned [mem 0x6020000000000-0x60203ffffffff 64bit pref]
[    1.513240] pci 0003:01:00.1: BAR 7: assigned [mem 0x6020400000000-0x60207ffffffff 64bit pref]
[    1.513332] pci 0003:01:00.0: BAR 0: assigned [mem 0x6020800000000-0x602081fffffff 64bit pref]
[    1.513445] pci 0003:01:00.1: BAR 0: assigned [mem 0x6020820000000-0x602083fffffff 64bit pref]
[    1.513568] pci 0003:00     : [PE# 1fe] Secondary bus 0x0000000000000000 associated with PE#1fe
[    1.513888] pci 0003:01     : [PE# 40] Secondary bus 0x0000000000000001 associated with PE#40
[    1.514224] pci 0003:01     : [PE# 40] Setting up 32-bit TCE table at 0..80000000
[    1.527036] pci 0003:01     : [PE# 40] Setting up window#0 0..7fffffff pg=1000
[    1.527065] pci 0003:01     : [PE# 40] Enabling 64-bit DMA bypass
[    1.527094] pci 0003:00:00.0: PCI bridge to [bus 01]
[    1.527120] pci 0003:00:00.0:   bridge window [mem 0x6020000000000-0x6023fbfffffff 64bit pref]
[    1.527173] pci_bus 0003:00: resource 4 [mem 0x600c180000000-0x600c1fffeffff]
[    1.527193] pci_bus 0003:00: resource 5 [mem 0x6020000000000-0x6023fbfffffff 64bit pref]
[    1.527225] pci_bus 0003:01: resource 2 [mem 0x6020000000000-0x6023fbfffffff 64bit pref]
[    1.527248] pci 0004:02:02.0: bridge window [mem 0x40000000-0x3fffffff 64bit pref] to [bus 03] add_size 40000000 add_align 40000000
[    1.527333] pci 0004:00:00.0: BAR 15: assigned [mem 0x6024000000000-0x6024cffffffff 64bit pref]
[    1.527376] pci 0004:00:00.0: BAR 14: assigned [mem 0x600c200000000-0x600c202ffffff]
[    1.527434] pci 0004:01:00.0: BAR 15: assigned [mem 0x6024000000000-0x6024cffffffff 64bit pref]
[    1.527490] pci 0004:01:00.0: BAR 14: assigned [mem 0x600c200000000-0x600c2027fffff]
[    1.527545] pci 0004:01:00.0: BAR 0: assigned [mem 0x600c202800000-0x600c20283ffff]
[    1.527605] pci 0004:01:00.1: BAR 0: assigned [mem 0x600c202840000-0x600c202841fff]
[    1.527652] pci 0004:01:00.2: BAR 0: assigned [mem 0x600c202850000-0x600c202851fff]
[    1.527706] pci 0004:01:00.3: BAR 0: assigned [mem 0x600c202860000-0x600c202861fff]
[    1.527743] pci 0004:01:00.4: BAR 0: assigned [mem 0x600c202870000-0x600c202871fff]
[    1.527790] pci 0004:01:00.0: BAR 13: no space for [io  size 0x1000]
[    1.527813] pci 0004:01:00.0: BAR 13: failed to assign [io  size 0x1000]
[    1.527843] pci 0004:01:00.0: BAR 13: no space for [io  size 0x1000]
[    1.527882] pci 0004:01:00.0: BAR 13: failed to assign [io  size 0x1000]
[    1.527970] pci 0004:02:0a.0: BAR 15: assigned [mem 0x6024000000000-0x60245ffffffff 64bit pref]
[    1.528038] pci 0004:02:0b.0: BAR 15: assigned [mem 0x6024600000000-0x6024bffffffff 64bit pref]
[    1.528092] pci 0004:02:02.0: BAR 15: assigned [mem 0x6024c00000000-0x6024c3fffffff 64bit pref]
[    1.528147] pci 0004:02:0a.0: BAR 14: assigned [mem 0x600c200000000-0x600c200ffffff]
[    1.528201] pci 0004:02:0b.0: BAR 14: assigned [mem 0x600c201000000-0x600c201ffffff]
[    1.528220] pci 0004:02:02.0: BAR 14: assigned [mem 0x600c202000000-0x600c2027fffff]
[    1.528262] pci 0004:02:02.0: BAR 13: no space for [io  size 0x1000]
[    1.528299] pci 0004:02:02.0: BAR 13: failed to assign [io  size 0x1000]
[    1.528341] pci 0004:02:02.0: BAR 13: no space for [io  size 0x1000]
[    1.528392] pci 0004:02:02.0: BAR 13: failed to assign [io  size 0x1000]
[    1.528443] pci 0004:03:00.0: BAR 5: assigned [mem 0x600c202000000-0x600c2020007ff]
[    1.528511] pci 0004:03:00.0: BAR 6: assigned [mem 0x600c202010000-0x600c20201ffff pref]
[    1.528557] pci 0004:03:00.0: BAR 4: no space for [io  size 0x0020]
[    1.528598] pci 0004:03:00.0: BAR 4: failed to assign [io  size 0x0020]
[    1.528650] pci 0004:03:00.0: BAR 0: no space for [io  size 0x0008]
[    1.528701] pci 0004:03:00.0: BAR 0: failed to assign [io  size 0x0008]
[    1.528739] pci 0004:03:00.0: BAR 2: no space for [io  size 0x0008]
[    1.528777] pci 0004:03:00.0: BAR 2: failed to assign [io  size 0x0008]
[    1.528829] pci 0004:03:00.0: BAR 1: no space for [io  size 0x0004]
[    1.528892] pci 0004:03:00.0: BAR 1: failed to assign [io  size 0x0004]
[    1.528932] pci 0004:03:00.0: BAR 3: no space for [io  size 0x0004]
[    1.528968] pci 0004:03:00.0: BAR 3: failed to assign [io  size 0x0004]
[    1.529031] pci 0004:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    1.529361] pci 0004:03     : [PE# fd] Secondary bus 0x0000000000000003 associated with PE#fd
[    1.529671] pci 0004:03     : [PE# fd] Setting up 32-bit TCE table at 0..80000000
[    1.542492] pci 0004:03     : [PE# fd] Setting up window#0 0..7fffffff pg=1000
[    1.542522] pci 0004:03     : [PE# fd] Enabling 64-bit DMA bypass
[    1.542540] pci 0004:02:02.0: PCI bridge to [bus 03]
[    1.542574] pci 0004:02:02.0:   bridge window [mem 0x600c202000000-0x600c2027fffff]
[    1.542608] pci 0004:02:02.0:   bridge window [mem 0x6024c00000000-0x6024c3fffffff 64bit pref]
[    1.542674] pci 0004:04:00.0: BAR 1: assigned [mem 0x6024000000000-0x60243ffffffff 64bit pref]
[    1.542738] pci 0004:04:00.0: BAR 3: assigned [mem 0x6024400000000-0x6024401ffffff 64bit pref]
[    1.542799] pci 0004:04:00.0: BAR 0: assigned [mem 0x600c200000000-0x600c200ffffff]
[    1.542920] pci 0004:04     : [PE# 00] Secondary bus 0x0000000000000004 associated with PE#0
[    1.543470] pci 0004:04     : [PE# 00] Setting up 32-bit TCE table at 0..80000000
[    1.556310] pci 0004:04     : [PE# 00] Setting up window#0 0..7fffffff pg=1000
[    1.556338] pci 0004:04     : [PE# 00] Enabling 64-bit DMA bypass
[    1.556378] pci 0004:02:0a.0: PCI bridge to [bus 04]
[    1.556422] pci 0004:02:0a.0:   bridge window [mem 0x600c200000000-0x600c200ffffff]
[    1.556445] pci 0004:02:0a.0:   bridge window [mem 0x6024000000000-0x60245ffffffff 64bit pref]
[    1.556477] pci 0004:05:00.0: BAR 1: assigned [mem 0x6024800000000-0x6024bffffffff 64bit pref]
[    1.556539] pci 0004:05:00.0: BAR 3: assigned [mem 0x6024600000000-0x6024601ffffff 64bit pref]
[    1.556578] pci 0004:05:00.0: BAR 0: assigned [mem 0x600c201000000-0x600c201ffffff]
[    1.556665] pci 0004:05     : [PE# 18] Secondary bus 0x0000000000000005 associated with PE#18
[    1.557205] pci 0004:05     : [PE# 18] Setting up 32-bit TCE table at 0..80000000
[    1.570028] pci 0004:05     : [PE# 18] Setting up window#0 0..7fffffff pg=1000
[    1.570055] pci 0004:05     : [PE# 18] Enabling 64-bit DMA bypass
[    1.570085] pci 0004:02:0b.0: PCI bridge to [bus 05]
[    1.570107] pci 0004:02:0b.0:   bridge window [mem 0x600c201000000-0x600c201ffffff]
[    1.570141] pci 0004:02:0b.0:   bridge window [mem 0x6024600000000-0x6024bffffffff 64bit pref]
[    1.570205] pci 0004:02:0c.0: PCI bridge to [bus 06-0a]
[    1.570246] pci 0004:02     : [PE# fc] Secondary bus 0x0000000000000002 associated with PE#fc
[    1.570531] pci 0004:01:00.0: PCI bridge to [bus 02-0a]
[    1.570555] pci 0004:01:00.0:   bridge window [mem 0x600c200000000-0x600c27fefffff]
[    1.570587] pci 0004:01:00.0:   bridge window [mem 0x6024000000000-0x6027f7ff0ffff 64bit pref]
[    1.570652] pci 0004:01     : [PE# fb] Secondary bus 0x0000000000000001 associated with PE#fb
[    1.570968] pci 0004:01     : [PE# fb] Setting up 32-bit TCE table at 0..80000000
[    1.583805] pci 0004:01     : [PE# fb] Setting up window#0 0..7fffffff pg=1000
[    1.583835] pci 0004:01     : [PE# fb] Enabling 64-bit DMA bypass
[    1.583853] pci 0004:00:00.0: PCI bridge to [bus 01-0a]
[    1.583887] pci 0004:00:00.0:   bridge window [mem 0x600c200000000-0x600c27fefffff]
[    1.583922] pci 0004:00:00.0:   bridge window [mem 0x6024000000000-0x6027f7ff0ffff 64bit pref]
[    1.583964] pci_bus 0004:00: Some PCI device resources are unassigned, try booting with pci=realloc
[    1.584008] pci_bus 0004:00: resource 4 [mem 0x600c200000000-0x600c27ffeffff]
[    1.584038] pci_bus 0004:00: resource 5 [mem 0x6024000000000-0x6027f7fffffff 64bit pref]
[    1.584091] pci_bus 0004:01: resource 1 [mem 0x600c200000000-0x600c27fefffff]
[    1.584120] pci_bus 0004:01: resource 2 [mem 0x6024000000000-0x6027f7ff0ffff 64bit pref]
[    1.584162] pci_bus 0004:02: resource 1 [mem 0x600c200000000-0x600c27fefffff]
[    1.584203] pci_bus 0004:02: resource 2 [mem 0x6024000000000-0x6027f7ff0ffff 64bit pref]
[    1.584232] pci_bus 0004:03: resource 1 [mem 0x600c202000000-0x600c2027fffff]
[    1.584264] pci_bus 0004:03: resource 2 [mem 0x6024c00000000-0x6024c3fffffff 64bit pref]
[    1.584317] pci_bus 0004:04: resource 1 [mem 0x600c200000000-0x600c200ffffff]
[    1.584371] pci_bus 0004:04: resource 2 [mem 0x6024000000000-0x60245ffffffff 64bit pref]
[    1.584424] pci_bus 0004:05: resource 1 [mem 0x600c201000000-0x600c201ffffff]
[    1.584477] pci_bus 0004:05: resource 2 [mem 0x6024600000000-0x6024bffffffff 64bit pref]
[    1.584524] pci 0005:00:00.0: BAR 15: assigned [mem 0x6028000000000-0x602803fffffff 64bit pref]
[    1.584590] pci 0005:01:00.0: BAR 0: assigned [mem 0x6028000000000-0x602800000ffff 64bit pref]
[    1.584665] pci 0005:01:00.0: BAR 2: assigned [mem 0x6028000010000-0x602800001ffff 64bit pref]
[    1.584761] pci 0005:01:00.0: BAR 4: assigned [mem 0x6028000020000-0x602800002ffff 64bit pref]
[    1.584869] pci 0005:01:00.1: BAR 0: assigned [mem 0x6028000030000-0x602800003ffff 64bit pref]
[    1.584944] pci 0005:01:00.1: BAR 2: assigned [mem 0x6028000040000-0x602800004ffff 64bit pref]
[    1.585031] pci 0005:01:00.1: BAR 4: assigned [mem 0x6028000050000-0x602800005ffff 64bit pref]
[    1.585114] pci 0005:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    1.585445] pci 0005:01     : [PE# 00] Secondary bus 0x0000000000000001 associated with PE#0
[    1.585741] pci 0005:01     : [PE# 00] Setting up 32-bit TCE table at 0..80000000
[    1.598558] pci 0005:01     : [PE# 00] Setting up window#0 0..7fffffff pg=1000
[    1.598588] pci 0005:01     : [PE# 00] Enabling 64-bit DMA bypass
[    1.598615] pci 0005:00:00.0: PCI bridge to [bus 01]
[    1.598642] pci 0005:00:00.0:   bridge window [mem 0x6028000000000-0x602bf7fffffff 64bit pref]
[    1.598682] pci_bus 0005:00: resource 4 [mem 0x600c280000000-0x600c2fffeffff]
[    1.598725] pci_bus 0005:00: resource 5 [mem 0x6028000000000-0x602bf7fffffff 64bit pref]
[    1.598789] pci_bus 0005:01: resource 2 [mem 0x6028000000000-0x602bf7fffffff 64bit pref]
[    1.598848] pci 0030:00:00.0: bridge window [mem 0x20000000-0x3fffffff 64bit pref] to [bus 01] add_size be0000000 add_align 400000000
[    1.598930] pci 0030:00:00.0: BAR 15: assigned [mem 0x6200000000000-0x6200bffffffff 64bit pref]
[    1.598995] pci 0030:00:00.0: BAR 14: assigned [mem 0x620c000000000-0x620c0003fffff]
[    1.599053] pci 0030:01:00.0: BAR 7: assigned [mem 0x6200000000000-0x62003ffffffff 64bit pref]
[    1.599133] pci 0030:01:00.1: BAR 7: assigned [mem 0x6200400000000-0x62007ffffffff 64bit pref]
[    1.599224] pci 0030:01:00.0: BAR 0: assigned [mem 0x6200800000000-0x6200807ffffff 64bit pref]
[    1.599339] pci 0030:01:00.1: BAR 0: assigned [mem 0x6200808000000-0x620080fffffff 64bit pref]
[    1.599478] pci 0030:01:00.0: BAR 6: assigned [mem 0x620c000000000-0x620c0000fffff pref]
[    1.599518] pci 0030:01:00.1: BAR 6: assigned [mem 0x620c000100000-0x620c0001fffff pref]
[    1.599551] pci 0030:00     : [PE# 1fe] Secondary bus 0x0000000000000000 associated with PE#1fe
[    1.599883] pci 0030:01     : [PE# 40] Secondary bus 0x0000000000000001 associated with PE#40
[    1.600193] pci 0030:01     : [PE# 40] Setting up 32-bit TCE table at 0..80000000
[    1.612991] pci 0030:01     : [PE# 40] Setting up window#0 0..7fffffff pg=1000
[    1.613103] pci 0030:01     : [PE# 40] Enabling 64-bit DMA bypass
[    1.613143] pci 0030:00:00.0: PCI bridge to [bus 01]
[    1.613166] pci 0030:00:00.0:   bridge window [mem 0x620c000000000-0x620c07fefffff]
[    1.613214] pci 0030:00:00.0:   bridge window [mem 0x6200000000000-0x6203fbff0ffff 64bit pref]
[    1.613257] pci_bus 0030:00: resource 4 [mem 0x620c000000000-0x620c07ffeffff]
[    1.613300] pci_bus 0030:00: resource 5 [mem 0x6200000000000-0x6203fbfffffff 64bit pref]
[    1.613342] pci_bus 0030:01: resource 1 [mem 0x620c000000000-0x620c07fefffff]
[    1.613371] pci_bus 0030:01: resource 2 [mem 0x6200000000000-0x6203fbff0ffff 64bit pref]
[    1.613417] pci 0033:00:00.0: bridge window [mem 0x20000000-0x5fffffff 64bit pref] to [bus 01] add_size bc0000000 add_align 400000000
[    1.613475] pci 0033:00:00.0: BAR 15: assigned [mem 0x6220000000000-0x6220bffffffff 64bit pref]
[    1.613522] pci 0033:01:00.0: BAR 7: assigned [mem 0x6220000000000-0x62203ffffffff 64bit pref]
[    1.613615] pci 0033:01:00.1: BAR 7: assigned [mem 0x6220400000000-0x62207ffffffff 64bit pref]
[    1.613709] pci 0033:01:00.0: BAR 0: assigned [mem 0x6220800000000-0x622081fffffff 64bit pref]
[    1.613858] pci 0033:01:00.1: BAR 0: assigned [mem 0x6220820000000-0x622083fffffff 64bit pref]
[    1.613955] pci 0033:00     : [PE# 1fe] Secondary bus 0x0000000000000000 associated with PE#1fe
[    1.614276] pci 0033:01     : [PE# 40] Secondary bus 0x0000000000000001 associated with PE#40
[    1.614625] pci 0033:01     : [PE# 40] Setting up 32-bit TCE table at 0..80000000
[    1.627447] pci 0033:01     : [PE# 40] Setting up window#0 0..7fffffff pg=1000
[    1.627472] pci 0033:01     : [PE# 40] Enabling 64-bit DMA bypass
[    1.627500] pci 0033:00:00.0: PCI bridge to [bus 01]
[    1.627528] pci 0033:00:00.0:   bridge window [mem 0x6220000000000-0x6223fbfffffff 64bit pref]
[    1.627572] pci_bus 0033:00: resource 4 [mem 0x620c180000000-0x620c1fffeffff]
[    1.627592] pci_bus 0033:00: resource 5 [mem 0x6220000000000-0x6223fbfffffff 64bit pref]
[    1.627622] pci_bus 0033:01: resource 2 [mem 0x6220000000000-0x6223fbfffffff 64bit pref]
[    1.627675] pci 0034:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    1.627980] pci 0034:00:00.0: PCI bridge to [bus 01]
[    1.628036] pci_bus 0034:00: resource 4 [mem 0x620c200000000-0x620c27ffeffff]
[    1.628100] pci_bus 0034:00: resource 5 [mem 0x6224000000000-0x6227f7fffffff 64bit pref]
[    1.628174] pci 0035:00:00.0: BAR 15: assigned [mem 0x6228000000000-0x6228bffffffff 64bit pref]
[    1.628221] pci 0035:00:00.0: BAR 14: assigned [mem 0x620c280000000-0x620c2827fffff]
[    1.628275] pci 0035:01:00.0: BAR 15: assigned [mem 0x6228000000000-0x6228bffffffff 64bit pref]
[    1.628297] pci 0035:01:00.0: BAR 14: assigned [mem 0x620c280000000-0x620c281ffffff]
[    1.628339] pci 0035:01:00.0: BAR 0: assigned [mem 0x620c282000000-0x620c28203ffff]
[    1.628390] pci 0035:02:04.0: BAR 15: assigned [mem 0x6228000000000-0x62285ffffffff 64bit pref]
[    1.628423] pci 0035:02:05.0: BAR 15: assigned [mem 0x6228600000000-0x6228bffffffff 64bit pref]
[    1.628477] pci 0035:02:04.0: BAR 14: assigned [mem 0x620c280000000-0x620c280ffffff]
[    1.628541] pci 0035:02:05.0: BAR 14: assigned [mem 0x620c281000000-0x620c281ffffff]
[    1.628573] pci 0035:03:00.0: BAR 1: assigned [mem 0x6228000000000-0x62283ffffffff 64bit pref]
[    1.628670] pci 0035:03:00.0: BAR 3: assigned [mem 0x6228400000000-0x6228401ffffff 64bit pref]
[    1.628758] pci 0035:03:00.0: BAR 0: assigned [mem 0x620c280000000-0x620c280ffffff]
[    1.628806] pci 0035:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[    1.629169] pci 0035:03     : [PE# 00] Secondary bus 0x0000000000000003 associated with PE#0
[    1.629740] pci 0035:03     : [PE# 00] Setting up 32-bit TCE table at 0..80000000
[    1.642554] pci 0035:03     : [PE# 00] Setting up window#0 0..7fffffff pg=1000
[    1.642580] pci 0035:03     : [PE# 00] Enabling 64-bit DMA bypass
[    1.642608] pci 0035:02:04.0: PCI bridge to [bus 03]
[    1.642632] pci 0035:02:04.0:   bridge window [mem 0x620c280000000-0x620c280ffffff]
[    1.642666] pci 0035:02:04.0:   bridge window [mem 0x6228000000000-0x62285ffffffff 64bit pref]
[    1.642732] pci 0035:04:00.0: BAR 1: assigned [mem 0x6228800000000-0x6228bffffffff 64bit pref]
[    1.642799] pci 0035:04:00.0: BAR 3: assigned [mem 0x6228600000000-0x6228601ffffff 64bit pref]
[    1.642888] pci 0035:04:00.0: BAR 0: assigned [mem 0x620c281000000-0x620c281ffffff]
[    1.642990] pci 0035:04     : [PE# 18] Secondary bus 0x0000000000000004 associated with PE#18
[    1.643539] pci 0035:04     : [PE# 18] Setting up 32-bit TCE table at 0..80000000
[    1.656355] pci 0035:04     : [PE# 18] Setting up window#0 0..7fffffff pg=1000
[    1.656379] pci 0035:04     : [PE# 18] Enabling 64-bit DMA bypass
[    1.656418] pci 0035:02:05.0: PCI bridge to [bus 04]
[    1.656441] pci 0035:02:05.0:   bridge window [mem 0x620c281000000-0x620c281ffffff]
[    1.656478] pci 0035:02:05.0:   bridge window [mem 0x6228600000000-0x6228bffffffff 64bit pref]
[    1.656519] pci 0035:02:0d.0: PCI bridge to [bus 05-09]
[    1.656575] pci 0035:02     : [PE# fd] Secondary bus 0x0000000000000002 associated with PE#fd
[    1.656883] pci 0035:01:00.0: PCI bridge to [bus 02-09]
[    1.656922] pci 0035:01:00.0:   bridge window [mem 0x620c280000000-0x620c2ffefffff]
[    1.656973] pci 0035:01:00.0:   bridge window [mem 0x6228000000000-0x622bf7ff0ffff 64bit pref]
[    1.657017] pci 0035:01     : [PE# fc] Secondary bus 0x0000000000000001 associated with PE#fc
[    1.657332] pci 0035:00:00.0: PCI bridge to [bus 01-09]
[    1.657362] pci 0035:00:00.0:   bridge window [mem 0x620c280000000-0x620c2ffefffff]
[    1.657403] pci 0035:00:00.0:   bridge window [mem 0x6228000000000-0x622bf7ff0ffff 64bit pref]
[    1.657469] pci_bus 0035:00: resource 4 [mem 0x620c280000000-0x620c2fffeffff]
[    1.657510] pci_bus 0035:00: resource 5 [mem 0x6228000000000-0x622bf7fffffff 64bit pref]
[    1.657541] pci_bus 0035:01: resource 1 [mem 0x620c280000000-0x620c2ffefffff]
[    1.657594] pci_bus 0035:01: resource 2 [mem 0x6228000000000-0x622bf7ff0ffff 64bit pref]
[    1.657647] pci_bus 0035:02: resource 1 [mem 0x620c280000000-0x620c2ffefffff]
[    1.657695] pci_bus 0035:02: resource 2 [mem 0x6228000000000-0x622bf7ff0ffff 64bit pref]
[    1.657749] pci_bus 0035:03: resource 1 [mem 0x620c280000000-0x620c280ffffff]
[    1.657802] pci_bus 0035:03: resource 2 [mem 0x6228000000000-0x62285ffffffff 64bit pref]
[    1.657855] pci_bus 0035:04: resource 1 [mem 0x620c281000000-0x620c281ffffff]
[    1.657909] pci_bus 0035:04: resource 2 [mem 0x6228600000000-0x6228bffffffff 64bit pref]
[    1.657970] pci 0006:00:00.0: BAR 0: assigned [mem 0x6030201600000-0x603020161ffff 64bit]
[    1.658069] pci 0006:00:00.1: BAR 0: assigned [mem 0x6030201620000-0x603020163ffff 64bit]
[    1.658168] pci 0006:00:00.2: BAR 0: assigned [mem 0x6030201640000-0x603020165ffff 64bit]
[    1.658271] pci 0006:00:01.0: BAR 0: assigned [mem 0x6030201660000-0x603020167ffff 64bit]
[    1.658373] pci 0006:00:01.1: BAR 0: assigned [mem 0x6030201680000-0x603020169ffff 64bit]
[    1.658475] pci 0006:00:01.2: BAR 0: assigned [mem 0x60302016a0000-0x60302016bffff 64bit]
[    1.658578] pci 0006:00:00.0: BAR 2: assigned [mem 0x60302016c0000-0x60302016cffff 64bit]
[    1.658677] pci 0006:00:00.1: BAR 2: assigned [mem 0x60302016d0000-0x60302016dffff 64bit]
[    1.658784] pci 0006:00:00.2: BAR 2: assigned [mem 0x60302016e0000-0x60302016effff 64bit]
[    1.658891] pci 0006:00:01.0: BAR 2: assigned [mem 0x60302016f0000-0x60302016fffff 64bit]
[    1.658966] pci 0006:00:01.1: BAR 2: assigned [mem 0x6030201700000-0x603020170ffff 64bit]
[    1.659070] pci 0006:00:01.2: BAR 2: assigned [mem 0x6030201710000-0x603020171ffff 64bit]
[    1.659185] pci_bus 0006:00: resource 4 [mem 0x6030201600000-0x603020171ffff]
[    1.659227] pci 0007:00:00.0: BAR 0: assigned [mem 0x6230201600000-0x623020161ffff 64bit]
[    1.659314] pci 0007:00:00.1: BAR 0: assigned [mem 0x6230201620000-0x623020163ffff 64bit]
[    1.659415] pci 0007:00:00.2: BAR 0: assigned [mem 0x6230201640000-0x623020165ffff 64bit]
[    1.659518] pci 0007:00:01.0: BAR 0: assigned [mem 0x6230201660000-0x623020167ffff 64bit]
[    1.659610] pci 0007:00:01.1: BAR 0: assigned [mem 0x6230201680000-0x623020169ffff 64bit]
[    1.659709] pci 0007:00:01.2: BAR 0: assigned [mem 0x62302016a0000-0x62302016bffff 64bit]
[    1.659807] pci 0007:00:00.0: BAR 2: assigned [mem 0x62302016c0000-0x62302016cffff 64bit]
[    1.659899] pci 0007:00:00.1: BAR 2: assigned [mem 0x62302016d0000-0x62302016dffff 64bit]
[    1.659982] pci 0007:00:00.2: BAR 2: assigned [mem 0x62302016e0000-0x62302016effff 64bit]
[    1.660074] pci 0007:00:01.0: BAR 2: assigned [mem 0x62302016f0000-0x62302016fffff 64bit]
[    1.660168] pci 0007:00:01.1: BAR 2: assigned [mem 0x6230201700000-0x623020170ffff 64bit]
[    1.660270] pci 0007:00:01.2: BAR 2: assigned [mem 0x6230201710000-0x623020171ffff 64bit]
[    1.660376] pci_bus 0007:00: resource 4 [mem 0x6230201600000-0x623020171ffff]
[    1.660462] pci 0006:00:00.0: [PE# 0d] Associated device to PE
[    1.660537] pci 0006:00:00.1: Associating to existing PE d
[    1.660597] pci 0006:00:00.2: Associating to existing PE d
[    1.660652] pci 0006:00:01.0: [PE# 0c] Associated device to PE
[    1.660721] pci 0006:00:01.1: Associating to existing PE c
[    1.660783] pci 0006:00:01.2: Associating to existing PE c
[    1.660833] NPU6: Found 1 MMIO ATSD registers
[    1.660869] pci 0007:00:00.0: [PE# 0d] Associated device to PE
[    1.660957] pci 0007:00:00.1: Associating to existing PE d
[    1.661041] pci 0007:00:00.2: Associating to existing PE d
[    1.661123] pci 0007:00:01.0: [PE# 0c] Associated device to PE
[    1.661229] pci 0007:00:01.1: Associating to existing PE c
[    1.661314] pci 0007:00:01.2: Associating to existing PE c
[    1.661352] NPU7: Found 1 MMIO ATSD registers
[    1.661665] pci 0000:01:00.0: Adding to iommu group 0
[    1.661773] pci 0001:01:00.0: Adding to iommu group 1
[    1.661813] pci 0002:02:00.0: Adding to iommu group 2
[    1.661864] pci 0003:01:00.0: Adding to iommu group 3
[    1.661894] pci 0003:01:00.1: Adding to iommu group 3
[    1.661947] pci 0004:03:00.0: Adding to iommu group 4
[    1.662014] pci 0004:04:00.0: Adding to iommu group 5
[    1.662088] pci 0004:05:00.0: Adding to iommu group 5
[    1.662152] pci 0004:01:00.0: Adding to iommu group 6
[    1.662195] pci 0004:01:00.1: Adding to iommu group 6
[    1.662232] pci 0004:01:00.2: Adding to iommu group 6
[    1.662271] pci 0004:01:00.3: Adding to iommu group 6
[    1.662320] pci 0004:01:00.4: Adding to iommu group 6
[    1.662369] pci 0005:01:00.0: Adding to iommu group 7
[    1.662410] pci 0005:01:00.1: Adding to iommu group 7
[    1.662455] pci 0030:01:00.0: Adding to iommu group 8
[    1.662484] pci 0030:01:00.1: Adding to iommu group 8
[    1.662535] pci 0033:01:00.0: Adding to iommu group 9
[    1.662567] pci 0033:01:00.1: Adding to iommu group 9
[    1.662652] pci 0035:03:00.0: Adding to iommu group 10
[    1.662728] pci 0035:04:00.0: Adding to iommu group 10
[    1.662792] pci 0006:00:00.0: Adding to iommu group 5
[    1.662825] pci 0006:00:00.1: Adding to iommu group 5
[    1.662858] pci 0006:00:00.2: Adding to iommu group 5
[    1.663017] pci 0006:00:01.0: Adding to iommu group 5
[    1.663064] pci 0006:00:01.1: Adding to iommu group 5
[    1.663120] pci 0006:00:01.2: Adding to iommu group 5
[    1.663211] pci 0007:00:00.0: Adding to iommu group 10
[    1.663279] pci 0007:00:00.1: Adding to iommu group 10
[    1.663345] pci 0007:00:00.2: Adding to iommu group 10
[    1.663591] pci 0007:00:01.0: Adding to iommu group 10
[    1.663660] pci 0007:00:01.1: Adding to iommu group 10
[    1.663734] pci 0007:00:01.2: Adding to iommu group 10
[    1.663887] pci 0000:00:00.0: enabling device (0101 -> 0103)
[    1.663942] pci 0001:00:00.0: enabling device (0101 -> 0103)
[    1.663986] pci 0002:00:00.0: enabling device (0101 -> 0103)
[    1.664041] pci 0002:01:00.0: enabling device (0141 -> 0143)
[    1.664099] pci 0003:00:00.0: enabling device (0101 -> 0103)
[    1.664152] pci 0004:00:00.0: enabling device (0101 -> 0103)
[    1.664198] pci 0004:01:00.0: enabling device (0141 -> 0143)
[    1.664256] pci 0004:02:02.0: enabling device (0141 -> 0143)
[    1.664316] pci 0004:02:0a.0: enabling device (0545 -> 0547)
[    1.664360] pci 0004:02:0b.0: enabling device (0545 -> 0547)
[    1.664415] pci 0005:00:00.0: enabling device (0101 -> 0103)
[    1.664501] pci 0030:00:00.0: enabling device (0101 -> 0103)
[    1.664537] pci 0033:00:00.0: enabling device (0101 -> 0103)
[    1.664589] pci 0035:00:00.0: enabling device (0105 -> 0107)
[    1.664634] pci 0035:01:00.0: enabling device (0545 -> 0547)
[    1.664673] pci 0035:02:04.0: enabling device (0545 -> 0547)
[    1.664711] pci 0035:02:05.0: enabling device (0545 -> 0547)
[    1.673785] EEH: PCI Enhanced I/O Error Handling Enabled
[    1.677489] cpuidle-powernv: Default stop: psscr = 0x0000000000000330,mask=0x00000000003003ff
[    1.677516] cpuidle-powernv: Deepest stop: psscr = 0x0000000000300375,mask=0x00000000003003ff
[    1.677546] cpuidle-powernv: First stop level that may lose SPRs = 0x4
[    1.677559] cpuidle-powernv: First stop level that may lose timebase = 0x10
[    1.684064] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    1.684089] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    2.201078] alg: No test for lzo-rle (lzo-rle-generic)
[    2.201292] alg: No test for lzo-rle (lzo-rle-scomp)
[    2.209952] pci 0002:02:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    2.210002] pci 0002:02:00.0: vgaarb: bridge control possible
[    2.210029] pci 0002:02:00.0: vgaarb: setting as boot device (VGA legacy resources not available)
[    2.210059] vgaarb: loaded
[    2.210398] SCSI subsystem initialized
[    2.210500] usbcore: registered new interface driver usbfs
[    2.210549] usbcore: registered new interface driver hub
[    2.211113] usbcore: registered new device driver usb
[    2.211705] EDAC MC: Ver: 3.0.0
[    2.212456] NetLabel: Initializing
[    2.212470] NetLabel:  domain hash size = 128
[    2.212482] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    2.212521] NetLabel:  unlabeled traffic allowed by default
[    2.213458] clocksource: Switched to clocksource timebase
[    2.242506] VFS: Disk quotas dquot_6.6.0
[    2.242745] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
[    2.242936] *** VALIDATE hugetlbfs ***
[    2.246942] NET: Registered protocol family 2
[    2.247622] tcp_listen_portaddr_hash hash table entries: 65536 (order: 4, 1048576 bytes)
[    2.247946] TCP established hash table entries: 524288 (order: 6, 4194304 bytes)
[    2.249453] TCP bind hash table entries: 65536 (order: 4, 1048576 bytes)
[    2.249775] TCP: Hash tables configured (established 524288 bind 65536)
[    2.250084] UDP hash table entries: 65536 (order: 5, 2097152 bytes)
[    2.250719] UDP-Lite hash table entries: 65536 (order: 5, 2097152 bytes)
[    2.251844] NET: Registered protocol family 1
[    2.251893] pci 0001:01:00.0: enabling device (0140 -> 0142)
[    2.252080] pci 0030:01:00.0: enabling device (0140 -> 0142)
[    2.252177] pci 0030:01:00.1: enabling device (0140 -> 0142)
[    2.252380] PCI: CLS 0 bytes, default 128
[    2.252469] Trying to unpack rootfs image as initramfs...
[    2.790725] Freeing initrd memory: 20672K
[    2.791310] rtas_flash: no firmware flash support
[    2.824026] workingset: timestamp_bits=38 max_order=23 bucket_order=0
[    2.827525] zbud: loaded
[    2.831195] NET: Registered protocol family 38
[    2.831215] Key type asymmetric registered
[    2.831225] Asymmetric key parser 'x509' registered
[    2.831257] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    2.831589] io scheduler mq-deadline registered
[    2.831602] io scheduler kyber registered
[    2.833730] atomic64_test: passed
[    2.836619] PowerPC PowerNV PCI Hotplug Driver version: 0.1
[    2.837073] pci 0002:02:00.0: enabling device (0141 -> 0143)
[    2.837105] Using unsupported 1024x768 (null) at 600c100010000, depth=32, pitch=4096
[    2.919773] Console: switching to colour frame buffer device 128x48
[    3.001115] fb0: Open Firmware frame buffer device on /pciex@600c3c0200000/pci@0/pci@0/vga@0
[    3.001433] hvc0: raw protocol on /ibm,opal/consoles/serial@0 (boot console)
[    3.001489] hvc0: No interrupts property, using OPAL event
[    3.001945] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    3.002495] Non-volatile memory driver v1.3
[    3.002561] Linux agpgart interface v0.103
[    3.003866] rdac: device handler registered
[    3.003939] hp_sw: device handler registered
[    3.003962] emc: device handler registered
[    3.004243] alua: device handler registered
[    3.004321] libphy: Fixed MDIO Bus: probed
[    3.004431] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.004496] ehci-pci: EHCI PCI platform driver
[    3.004567] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    3.004637] ohci-pci: OHCI PCI platform driver
[    3.004695] uhci_hcd: USB Universal Host Controller Interface driver
[    3.004842] xhci_hcd 0001:01:00.0: xHCI Host Controller
[    3.004928] xhci_hcd 0001:01:00.0: new USB bus registered, assigned bus number 1
[    3.005078] xhci_hcd 0001:01:00.0: hcc params 0x0270f06d hci version 0x96 quirks 0x0000000004000000
[    3.005740] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.02
[    3.005765] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.005781] usb usb1: Product: xHCI Host Controller
[    3.005806] usb usb1: Manufacturer: Linux 5.2.0-rc6+ xhci-hcd
[    3.005820] usb usb1: SerialNumber: 0001:01:00.0
[    3.006056] hub 1-0:1.0: USB hub found
[    3.006089] hub 1-0:1.0: 4 ports detected
[    3.006352] xhci_hcd 0001:01:00.0: xHCI Host Controller
[    3.006460] xhci_hcd 0001:01:00.0: new USB bus registered, assigned bus number 2
[    3.006505] xhci_hcd 0001:01:00.0: Host supports USB 3.0 SuperSpeed
[    3.006603] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    3.006668] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.02
[    3.006706] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.006756] usb usb2: Product: xHCI Host Controller
[    3.006781] usb usb2: Manufacturer: Linux 5.2.0-rc6+ xhci-hcd
[    3.006819] usb usb2: SerialNumber: 0001:01:00.0
[    3.007042] hub 2-0:1.0: USB hub found
[    3.007094] hub 2-0:1.0: 4 ports detected
[    3.007402] usbcore: registered new interface driver usbserial_generic
[    3.007427] usbserial: USB Serial support registered for generic
[    3.008176] mousedev: PS/2 mouse device common for all mice
[    3.183443] rtc-opal opal-rtc: registered as rtc0
[    3.184355] tpm_i2c_nuvoton 4-0057: VID: 1050 DID: FE RID: 04
[    3.196508] random: crng init done
[    3.303599] powernv-cpufreq: cpufreq pstate min 0x5a nominal 0x54 max 0x0
[    3.303616] powernv-cpufreq: Workload Optimized Frequency is enabled in the platform
[    3.330391] alg: No test for 842 (842-nx)
[    3.332097] hidraw: raw HID events driver (C) Jiri Kosina
[    3.332265] usbcore: registered new interface driver usbhid
[    3.332285] usbhid: USB HID core driver
[    3.332508] drop_monitor: Initializing network drop monitor service
[    3.332695] Initializing XFRM netlink socket
[    3.333297] NET: Registered protocol family 10
[    3.334098] Segment Routing with IPv6
[    3.334128] NET: Registered protocol family 17
[    3.334189] drmem: No dynamic reconfiguration memory found
[    3.334442] registered taskstats version 1
[    3.334631] zswap: loaded using pool lzo/zbud
[    3.334708] pstore: Using crash dump compression: deflate
[    3.341382] Key type big_key registered
[    3.353183] Key type encrypted registered
[    3.353196] ima: Allocated hash algorithm: sha256
[    3.383406] usb 1-3: new high-speed USB device number 2 using xhci_hcd
[    3.480954] No architecture policies found
[    3.480997] evm: Initialising EVM extended attributes:
[    3.481007] evm: security.selinux
[    3.481024] evm: security.ima
[    3.481031] evm: security.capability
[    3.481048] evm: HMAC attrs: 0x1
[    3.534717] rtc-opal opal-rtc: setting system clock to 2019-06-26T23:37:51 UTC (1561592271)
[    3.536730] Freeing unused kernel memory: 4800K
[    3.536741] This architecture does not have kernel memory protection.
[    3.536753] Run /init as init process
[    3.572184] usb 1-3: New USB device found, idVendor=1d6b, idProduct=0107, bcdDevice= 1.00
[    3.572207] usb 1-3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.572221] usb 1-3: Product: USB Virtual Hub
[    3.572240] usb 1-3: Manufacturer: Aspeed
[    3.572248] usb 1-3: SerialNumber: 00000000
[    3.583790] hub 1-3:1.0: USB hub found
[    3.585040] hub 1-3:1.0: 5 ports detected
[    3.632217] systemd[1]: systemd 219 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 -SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    3.674892] systemd[1]: Detected architecture ppc64-le.
[    3.674904] systemd[1]: Running in initial RAM disk.

Welcome to ^[[0;34mRed Hat Enterprise Linux Server 7.6 (Maipo) dracut-033-554.el7 (Initramfs)^[[0m!

[    3.675026] systemd[1]: Set hostname to <ltc-wspoon15.aus.stglabs.ibm.com>.
[    3.734310] systemd[1]: Created slice Root Slice.
[^[[32m  OK  ^[[0m] Created slice Root Slice.
[    3.734503] systemd[1]: Listening on udev Control Socket.
[^[[32m  OK  ^[[0m] Listening on udev Control Socket.
[    3.734640] systemd[1]: Listening on udev Kernel Socket.
[^[[32m  OK  ^[[0m] Listening on udev Kernel Socket.
[    3.734753] systemd[1]: Reached target Local File Systems.
[^[[32m  OK  ^[[0m] Reached target Local File Systems.
[    3.734939] systemd[1]: Listening on Journal Socket.
[^[[32m  OK  ^[[0m] Listening on Journal Socket.
[    3.735062] systemd[1]: Reached target Sockets.
[^[[32m  OK  ^[[0m] Reached target Sockets.
[^[[32m  OK  ^[[0m] Reached target Timers.
[^[[32m  OK  ^[[0m] Created slice System Slice.
         Starting Journal Service...
         Starting Apply Kernel Variables...
         Starting Create list of required st... nodes for the current kernel...
         Starting dracut cmdline hook...
         Starting Setup Virtual Console...
[^[[32m  OK  ^[[0m] Reached target Slices.
[^[[32m  OK  ^[[0m] Reached target Swap.
[^[[32m  OK  ^[[0m] Started Apply Kernel Variables.
[^[[32m  OK  ^[[0m] Started Create list of required sta...ce nodes for the current kernel.
         Starting Create Static Device Nodes in /dev...
[^[[32m  OK  ^[[0m] Started Create Static Device Nodes in /dev.
[^[[32m  OK  ^[[0m] Started Journal Service.
[^[[32m  OK  ^[[0m] Started dracut cmdline hook.
         Starting dracut pre-udev hook...
[^[[32m  OK  ^[[0m] Started Setup Virtual Console.
[^[[32m  OK  ^[[0m] Started dracut pre-udev hook.
         Starting udev Kernel Device Manager...
[^[[32m  OK  ^[[0m] Started udev Kernel Device Manager.
         Starting udev Coldplug all Devices...
         Mounting Configuration File System...
[^[[32m  OK  ^[[0m] Mounted Configuration File System.
[    4.021884] synth uevent: /devices/vio: failed to send uevent
[    4.021915] vio vio: uevent: failed to send synthetic uevent
[^[[32m  OK  ^[[0m] Started udev Coldplug all Devices.
         Starting Show Plymouth Boot Screen...
         Starting dracut initqueue hook...
[^[[32m  OK  ^[[0m] Reached target System Initialization.
[    4.045307] pps_core: LinuxPPS API ver. 1 registered
[    4.045330] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    4.046134] nvme nvme0: pci function 0000:01:00.0
[    4.046262] nvme 0000:01:00.0: enabling device (0140 -> 0142)
[    4.046423] PTP clock support registered
[    4.049477] tg3.c:v3.137 (May 11, 2014)
[    4.049519] tg3 0005:01:00.0: enabling device (0140 -> 0142)
[    4.058859] mlx5_core 0003:01:00.0: enabling device (0140 -> 0142)
[^[[32m  OK  ^[[0m[    4.058996] m]lx5_core 0003:01 :00.0: firmware version: 16.22.8042
Started Show Plymouth Boot Screen.[    4.059053] m^Mlx5_core 0003:01
:00.0: 126.024 Gb/s available PCIe bandwidth (16 GT/s x8 link)
[^[[32m  OK  ^[[0m] Started Forward Password Requests to Plymouth Directory Watch.^M
[^[[32m  OK  ^[[0m] Reached target Paths.^M
[^[[32m  OK  ^[[0m] Reached target Basic System.^M
[    4.062643] ahci 0004:03:00.0: enabling device (0541 -> 0543)
[    4.072952] ahci 0004:03:00.0: AHCI 0001.0000 32 slots 4 ports 6 Gbps 0xf impl SATA mode
[    4.072979] ahci 0004:03:00.0: flags: 64bit ncq sntf led only pmp fbs pio slum part sxs 
[    4.074820] scsi host0: ahci
[    4.075504] scsi host1: ahci
[    4.075829] scsi host2: ahci
[    4.076444] scsi host3: ahci
[    4.076885] ata1: SATA max UDMA/133 abar m2048@0x600c202000000 port 0x600c202000100 irq 93
[    4.076905] ata2: SATA max UDMA/133 abar m2048@0x600c202000000 port 0x600c202000180 irq 93
[    4.076916] ata3: SATA max UDMA/133 abar m2048@0x600c202000000 port 0x600c202000200 irq 93
[    4.076936] ata4: SATA max UDMA/133 abar m2048@0x600c202000000 port 0x600c202000280 irq 93
[    4.081795] tg3 0005:01:00.0 eth0: Tigon3 [partno(BCM95719) rev 5719001] (PCI Express) MAC address 08:94:ef:80:64:b8
[    4.081817] tg3 0005:01:00.0 eth0: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    4.081831] tg3 0005:01:00.0 eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[1] TSOcap[1]
[    4.081854] tg3 0005:01:00.0 eth0: dma_rwctrl[00000000] dma_mask[64-bit]
[    4.101423] fb0: switching to astdrmfb from OFfb vga
[    4.101480] Console: switching to colour dummy device 80x25
[    4.101550] tg3 0005:01:00.1: enabling device (0140 -> 0142)
[    4.102249] nouveau 0004:04:00.0: enabling device (0140 -> 0142)
[    4.102305] nouveau 0004:04:00.0: NVIDIA GV100 (140000a1)
[    4.106342] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.106364] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.106426] CPU: 0 PID: 2487 Comm: kworker/0:4 Not tainted 5.2.0-rc6+ #1
[    4.106454] Workqueue: events work_for_cpu_fn
[    4.106475] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.106540] REGS: c000003fd78b72b0 TRAP: 0700   Not tainted  (5.2.0-rc6+)
[    4.106577] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 20040000
[    4.106615] CFAR: c000000000074738 IRQMASK: 0 
[    4.106615] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.106615] GPR04: c00a00008d301e00 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.106615] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.106615] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.106615] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.106615] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.106615] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.106615] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d301e00 
[    4.106870] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.106898] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.106933] Call Trace:
[    4.106942] [c000003fd78b7540] [0000000000000001] 0x1 (unreliable)
[    4.106957] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.107033] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.107112] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.107191] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.107276] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.107353] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.107434] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.107505] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.107577] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.107659] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.107697] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.107732] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.107776] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.107821] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.107866] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.107897] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.107931] Instruction dump:
[    4.107962] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.108001] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.108042] ---[ end trace 2a6f56e64fb66de9 ]---
[    4.116797] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.116826] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.116884] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.116921] Workqueue: events work_for_cpu_fn
[    4.116932] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.116968] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.117002] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.117046] CFAR: c000000000074738 IRQMASK: 0 
[    4.117046] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.117046] GPR04: c00a00008d306024 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.117046] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.117046] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.117046] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.117046] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.117046] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.117046] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d306024 
[    4.117275] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.117313] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.117357] Call Trace:
[    4.117389] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.117428] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.117536] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.117645] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.117704] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.117767] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.117840] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.117911] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.117976] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.118046] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.118112] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.118135] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.118166] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.118188] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.118242] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.118272] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.118293] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.118325] Instruction dump:
[    4.118342] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.118376] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.118411] ---[ end trace 2a6f56e64fb66dea ]---
[    4.118724] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.118763] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.118839] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.118879] Workqueue: events work_for_cpu_fn
[    4.118914] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.118961] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.119001] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.119032] CFAR: c000000000074738 IRQMASK: 0 
[    4.119032] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.119032] GPR04: c00a00008d3061e0 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.119032] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.119032] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.119032] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.119032] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.119032] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.119032] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d3061e0 
[    4.119333] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.119357] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.119392] Call Trace:
[    4.119409] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.119437] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.119511] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.119597] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.119675] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.119786] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.119880] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.119988] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.120067] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.120142] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.120212] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.120237] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.120271] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.120311] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.120357] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.120396] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.120428] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.120461] Instruction dump:
[    4.120500] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.120533] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.120579] ---[ end trace 2a6f56e64fb66deb ]---
[    4.120851] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.120891] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.120963] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.120994] Workqueue: events work_for_cpu_fn
[    4.121012] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.121041] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.121070] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.121106] CFAR: c000000000074738 IRQMASK: 0 
[    4.121106] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.121106] GPR04: c00a00008d30639c 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.121106] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.121106] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.121106] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.121106] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.121106] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.121106] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d30639c 
[    4.121934] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.121998] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.122057] Call Trace:
[    4.122077] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.122163] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.122335] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.122444] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.122548] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.122653] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.122756] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.122873] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.122998] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.123139] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.123287] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.123341] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.123436] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.123506] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.123601] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.123673] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.123749] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.123817] Instruction dump:
[    4.123867] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.123937] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.124055] ---[ end trace 2a6f56e64fb66dec ]---
[    4.126934] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.127024] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.127112] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.127148] Workqueue: events work_for_cpu_fn
[    4.127179] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.127222] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.127261] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.127286] CFAR: c000000000074738 IRQMASK: 0 
[    4.127286] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.127286] GPR04: c00a00008d3078a0 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.127286] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.127286] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.127286] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.127286] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.127286] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.127286] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d3078a0 
[    4.127543] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.127555] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.127566] Call Trace:
[    4.127574] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.127609] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.127702] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.127782] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.127855] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.127946] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.128037] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.128128] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.128205] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.128299] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.128380] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.128410] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.128436] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.128472] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.128519] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.128564] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.128589] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.128636] Instruction dump:
[    4.128684] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.128770] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.128861] ---[ end trace 2a6f56e64fb66ded ]---
[    4.129207] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.129240] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.129372] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.129466] Workqueue: events work_for_cpu_fn
[    4.129512] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.129595] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.129653] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.129773] CFAR: c000000000074738 IRQMASK: 0 
[    4.129773] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.129773] GPR04: c00a00008d307ab4 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.129773] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.129773] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.129773] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.129773] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.129773] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.129773] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d307ab4 
[    4.130580] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.130627] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.130687] Call Trace:
[    4.130722] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.130819] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.130921] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.131016] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.131113] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.131223] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.131339] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.131448] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.131570] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.131689] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.131810] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.131861] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.131961] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.132042] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.132141] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.132213] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.132296] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.132359] Instruction dump:
[    4.132393] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.132502] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.132621] ---[ end trace 2a6f56e64fb66dee ]---
[    4.132818] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.132855] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.133118] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.133214] Workqueue: events work_for_cpu_fn
[    4.133280] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.133373] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.133477] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.133597] CFAR: c000000000074738 IRQMASK: 0 
[    4.133597] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.133597] GPR04: c00a00008d307b4c 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.133597] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.133597] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.133597] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.133597] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.133597] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.133597] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d307b4c 
[    4.134436] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.134482] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.134536] Call Trace:
[    4.134559] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.134667] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.134805] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.134926] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.135026] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.135144] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.135242] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.135366] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.135491] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.135604] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.135723] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.135777] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.135859] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.135953] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.136042] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.136119] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.136185] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.136281] Instruction dump:
[    4.136309] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.136402] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.136479] ---[ end trace 2a6f56e64fb66def ]---
[    4.136795] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.136827] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.136940] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.137047] Workqueue: events work_for_cpu_fn
[    4.137085] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.137159] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.137255] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.137353] CFAR: c000000000074738 IRQMASK: 0 
[    4.137353] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.137353] GPR04: c00a00008d307cfc 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.137353] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.137353] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.137353] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.137353] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.137353] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.137353] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d307cfc 
[    4.138153] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.138231] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.138294] Call Trace:
[    4.138321] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.138413] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.138547] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.138640] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.138733] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.138815] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.138931] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.139025] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.139149] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.139285] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.139391] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.139443] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.139522] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.139608] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.139710] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.139803] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.139886] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.139973] Instruction dump:
[    4.140005] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.140083] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.140163] ---[ end trace 2a6f56e64fb66df0 ]---
[    4.140959] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.140983] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.141074] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.141123] Workqueue: events work_for_cpu_fn
[    4.141156] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.141211] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.141243] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.141293] CFAR: c000000000074738 IRQMASK: 0 
[    4.141293] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.141293] GPR04: c00a00008d308238 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.141293] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.141293] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.141293] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.141293] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.141293] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.141293] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d308238 
[    4.142035] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.142105] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.142166] Call Trace:
[    4.142213] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.142313] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.142454] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.142568] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.142679] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.142800] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.142884] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.142986] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.143087] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.143197] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.143329] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.143391] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.143478] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.143582] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.143661] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.143724] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.143813] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.143891] Instruction dump:
[    4.143927] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.144041] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.144123] ---[ end trace 2a6f56e64fb66df1 ]---
[    4.150659] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.150683] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.150773] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.150813] Workqueue: events work_for_cpu_fn
[    4.150841] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.150871] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.150905] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.150961] CFAR: c000000000074738 IRQMASK: 0 
[    4.150961] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.150961] GPR04: c00a00008d30b44c 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.150961] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.150961] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.150961] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.150961] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.150961] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.150961] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d30b44c 
[    4.151165] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.151176] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.151203] Call Trace:
[    4.151222] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.151259] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.151330] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.151410] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.151490] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.151552] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.151600] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.151660] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.151723] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.151790] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.151853] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.151890] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.151934] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.151980] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.152010] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.152033] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.152063] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.152095] Instruction dump:
[    4.152111] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.152136] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.152150] ---[ end trace 2a6f56e64fb66df2 ]---
[    4.152224] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.152247] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.152316] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.152361] Workqueue: events work_for_cpu_fn
[    4.152401] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.152440] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.152482] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.152515] CFAR: c000000000074738 IRQMASK: 0 
[    4.152515] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.152515] GPR04: c00a00008d30b478 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.152515] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.152515] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.152515] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.152515] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.152515] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.152515] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d30b478 
[    4.152755] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.152787] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.152817] Call Trace:
[    4.152833] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.152878] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.152929] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.152993] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.153056] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.153100] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.153175] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.153228] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.153301] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.153383] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.153461] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.153487] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.153554] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.153574] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.153608] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.153664] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.153697] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.153745] Instruction dump:
[    4.153761] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.153785] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.153839] ---[ end trace 2a6f56e64fb66df3 ]---
[    4.160316] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.160331] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.160384] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.160425] Workqueue: events work_for_cpu_fn
[    4.160444] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.160474] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.160504] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.160539] CFAR: c000000000074738 IRQMASK: 0 
[    4.160539] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.160539] GPR04: c00a00008d30e5e0 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.160539] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.160539] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.160539] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.160539] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.160539] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.160539] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d30e5e0 
[    4.160743] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.160772] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.160790] Call Trace:
[    4.160797] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.160827] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.160882] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.160938] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.161000] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.161060] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.161119] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.161174] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.161242] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.161312] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.161376] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.161388] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.161418] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.161447] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.161477] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.161507] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.161529] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.161540] Instruction dump:
[    4.161547] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.161561] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.161594] ---[ end trace 2a6f56e64fb66df4 ]---
[    4.161639] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.161672] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.161748] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.161790] Workqueue: events work_for_cpu_fn
[    4.161819] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.161852] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.161884] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.161917] CFAR: c000000000074738 IRQMASK: 0 
[    4.161917] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.161917] GPR04: c00a00008d30e5e4 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.161917] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.161917] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.161917] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.161917] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.161917] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.161917] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d30e5e4 
[    4.162126] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.162154] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.162173] Call Trace:
[    4.162197] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.162219] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.162280] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.162351] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.162429] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.162488] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.162555] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.162636] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.162704] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.162757] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.162832] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.162857] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.162900] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.162913] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.162945] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.163007] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.163075] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.163156] Instruction dump:
[    4.163207] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.163291] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.163393] ---[ end trace 2a6f56e64fb66df5 ]---
[    4.163497] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.163589] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.163859] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.163960] Workqueue: events work_for_cpu_fn
[    4.164031] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.164110] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.164222] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.164342] CFAR: c000000000074738 IRQMASK: 0 
[    4.164342] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.164342] GPR04: c00a00008d30e5e8 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.164342] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.164342] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.164342] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.164342] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.164342] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.164342] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d30e5e8 
[    4.165155] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.165189] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.165267] Call Trace:
[    4.165301] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.165391] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.165524] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.165638] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.165733] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.165841] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.165952] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.166053] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.166178] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.166287] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.166410] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.166458] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.166526] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.166613] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.166696] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.166787] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.166867] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.166991] Instruction dump:
[    4.167012] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.167113] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.167249] ---[ end trace 2a6f56e64fb66df6 ]---
[    4.167354] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.167418] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.167644] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.167739] Workqueue: events work_for_cpu_fn
[    4.167794] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.167898] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.167980] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.168101] CFAR: c000000000074738 IRQMASK: 0 
[    4.168101] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.168101] GPR04: c00a00008d30e5ec 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.168101] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.168101] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.168101] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.168101] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.168101] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.168101] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d30e5ec 
[    4.168894] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.168956] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.169022] Call Trace:
[    4.169053] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.169145] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.169268] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.169377] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.169497] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.169610] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.169699] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.169804] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.169931] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.170040] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.170158] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.170210] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.170310] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.170367] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.170467] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.170548] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.170636] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.170723] Instruction dump:
[    4.170762] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.170828] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.170928] ---[ end trace 2a6f56e64fb66df7 ]---
[    4.171047] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.171138] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.171375] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.171472] Workqueue: events work_for_cpu_fn
[    4.171523] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.171624] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.171728] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.171820] CFAR: c000000000074738 IRQMASK: 0 
[    4.171820] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.171820] GPR04: c00a00008d30e5f0 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.171820] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.171820] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.171820] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.171820] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.171820] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.171820] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d30e5f0 
[    4.172616] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.172691] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.172775] Call Trace:
[    4.172795] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.172905] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.173027] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.173127] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.173225] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.173361] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.173456] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.173571] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.173667] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.173811] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.173908] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.173960] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.174059] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.174127] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.174203] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.174284] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.174372] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.174463] Instruction dump:
[    4.174510] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.174597] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.174694] ---[ end trace 2a6f56e64fb66df8 ]---
[    4.174828] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.174866] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.175121] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.175203] Workqueue: events work_for_cpu_fn
[    4.175248] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.175314] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.175408] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.175502] CFAR: c000000000074738 IRQMASK: 0 
[    4.175502] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.175502] GPR04: c00a00008d30e5f4 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.175502] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.175502] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.175502] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.175502] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.175502] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.175502] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d30e5f4 
[    4.176300] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.176351] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.176425] Call Trace:
[    4.176446] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.176548] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.176676] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.176761] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.176846] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.176934] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.177035] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.177128] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.177244] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.177332] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.177436] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.177504] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.177590] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.177668] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.177745] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.177828] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.177913] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.177976] Instruction dump:
[    4.178011] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.178113] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.178196] ---[ end trace 2a6f56e64fb66df9 ]---
[    4.178309] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.178368] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.178607] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.178683] Workqueue: events work_for_cpu_fn
[    4.178729] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.178806] REGS: c000003fd78b72b0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.178894] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.178975] CFAR: c000000000074738 IRQMASK: 0 
[    4.178975] GPR00: 00000000ae012000 c000003fd78b7540 c00000000144a200 c000203fff654348 
[    4.178975] GPR04: c00a00008d30e5f8 0000000000000000 c000003fd78b7564 0000000000000015 
[    4.178975] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.178975] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.178975] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.178975] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.178975] GPR24: 0000000040000000 0000000040000000 000000000000d600 c000003fc7c77000 
[    4.178975] GPR28: c000003fe6b32a80 000000000000e600 c000003fa9990000 c00a00008d30e5f8 
[    4.179755] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.179800] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.179866] Call Trace:
[    4.179902] [c000003fd78b7540] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.179995] [c000003fd78b7580] [c0000000005c2530] ioread32+0x100/0x170
[    4.180094] [c000003fd78b75b0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.180206] [c000003fd78b7600] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.180328] [c000003fd78b7650] [c00800000f0b5cf8] shadow_image+0xb8/0x360 [nouveau]
[    4.180425] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.180543] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.180638] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.180769] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.180882] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.180978] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.181023] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.181112] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.181184] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.181273] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.181371] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.181435] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.181526] Instruction dump:
[    4.181555] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.181643] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.181715] ---[ end trace 2a6f56e64fb66dfa ]---
[    4.182359] [drm] platform has no IO space, trying MMIO
[    4.182379] [drm] Using device-tree for configuration
[    4.182396] [drm] AST 2500 detected
[    4.182420] [drm] Analog VGA only
[    4.182444] [drm] dram MCLK=800 Mhz type=7 bus_width=16 size=01000000
[    4.182566] [TTM] Zone  kernel: Available graphics memory: 267956512 KiB
[    4.182590] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    4.182610] [TTM] Initializing pool allocator
[    4.205971] Console: switching to colour frame buffer device 128x48
[    4.220417] ast 0002:02:00.0: fb0: astdrmfb frame buffer device
[    4.255468] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.255499] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.255555] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.255580] Workqueue: events work_for_cpu_fn
[    4.255591] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.255629] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.255662] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 20040000
[    4.255705] CFAR: c000000000074738 IRQMASK: 0 
[    4.255705] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.255705] GPR04: c00a00008d31f2a4 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.255705] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.255705] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.255705] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.255705] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.255705] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.255705] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2a4 
[    4.255958] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.255994] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.256028] Call Trace:
[    4.256047] [c000003fd78b73e0] [c000003fd78b7460] 0xc000003fd78b7460 (unreliable)
[    4.256074] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.256148] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.256239] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.256325] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.256415] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.256497] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.256579] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.256659] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.256754] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.256857] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.256943] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.257039] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.257061] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.257107] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.257127] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.257159] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.257191] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.257222] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.257254] Instruction dump:
[    4.257270] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.257304] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.257337] ---[ end trace 2a6f56e64fb66dfb ]---
[    4.257409] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.257450] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.257534] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.257576] Workqueue: events work_for_cpu_fn
[    4.257595] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.257628] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.257661] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.257697] CFAR: c000000000074738 IRQMASK: 0 
[    4.257697] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.257697] GPR04: c00a00008d31f2a8 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.257697] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.257697] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.257697] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.257697] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.257697] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.257697] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2a8 
[    4.257897] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.257928] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.257957] Call Trace:
[    4.257973] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.258004] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.258068] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.258124] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.258192] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.258255] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.258312] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.258377] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.258439] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.258501] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.258565] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.258682] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.258780] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.258804] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.258831] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.258879] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.258916] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.258950] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.258985] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.259056] Instruction dump:
[    4.259076] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.259112] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.259169] ---[ end trace 2a6f56e64fb66dfc ]---
[    4.259278] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.259357] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.259572] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.259689] Workqueue: events work_for_cpu_fn
[    4.259759] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.259846] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.259934] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.260046] CFAR: c000000000074738 IRQMASK: 0 
[    4.260046] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.260046] GPR04: c00a00008d31f2ac 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.260046] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.260046] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.260046] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.260046] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.260046] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.260046] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2ac 
[    4.260940] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.261024] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.261060] Call Trace:
[    4.261119] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.261231] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.261407] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.261509] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.261615] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.261724] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.261821] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.261943] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.262078] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.262166] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.262285] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.262435] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.262517] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.262554] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.262649] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.262725] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.262787] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.262896] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.262984] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.263076] Instruction dump:
[    4.263137] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.263241] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.263348] ---[ end trace 2a6f56e64fb66dfd ]---
[    4.263455] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.263566] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.263752] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.263856] Workqueue: events work_for_cpu_fn
[    4.263917] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.263994] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.264071] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.264188] CFAR: c000000000074738 IRQMASK: 0 
[    4.264188] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.264188] GPR04: c00a00008d31f2b0 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.264188] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.264188] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.264188] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.264188] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.264188] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.264188] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2b0 
[    4.264966] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.265026] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.265106] Call Trace:
[    4.265128] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.265209] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.265346] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.265457] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.265555] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.265662] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.265773] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.265868] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.265982] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.266089] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.266265] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.266369] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.266474] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.266525] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.266616] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.266694] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.266784] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.266855] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.266912] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.267014] Instruction dump:
[    4.267049] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.267142] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.267233] ---[ end trace 2a6f56e64fb66dfe ]---
[    4.267347] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.267414] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.267665] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.267761] Workqueue: events work_for_cpu_fn
[    4.267803] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.267880] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.267975] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.268089] CFAR: c000000000074738 IRQMASK: 0 
[    4.268089] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.268089] GPR04: c00a00008d31f2b4 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.268089] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.268089] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.268089] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.268089] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.268089] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.268089] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2b4 
[    4.268868] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.268936] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.268983] Call Trace:
[    4.269031] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.269109] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.269220] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.269317] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.269423] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.269526] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.269629] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.269714] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.269827] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.269924] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.270043] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.270145] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.270295] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.270386] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.270475] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.270541] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.270621] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.270683] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.270770] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.270850] Instruction dump:
[    4.270885] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.270977] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.271065] ---[ end trace 2a6f56e64fb66dff ]---
[    4.271190] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.271239] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.271482] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.271572] Workqueue: events work_for_cpu_fn
[    4.271621] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.271692] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.271807] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.271917] CFAR: c000000000074738 IRQMASK: 0 
[    4.271917] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.271917] GPR04: c00a00008d31f2b8 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.271917] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.271917] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.271917] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.271917] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.271917] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.271917] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2b8 
[    4.272697] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.272772] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.272834] Call Trace:
[    4.272850] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.272961] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.273068] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.273157] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.273273] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.273371] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.273468] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.273583] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.273684] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.273774] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.273934] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.274022] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.274125] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.274178] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.274300] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.274377] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.274514] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.274568] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.274657] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.274751] Instruction dump:
[    4.274808] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.274926] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.275013] ---[ end trace 2a6f56e64fb66e00 ]---
[    4.275146] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.275244] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.275510] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.275620] Workqueue: events work_for_cpu_fn
[    4.275667] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.275786] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.275875] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.275979] CFAR: c000000000074738 IRQMASK: 0 
[    4.275979] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.275979] GPR04: c00a00008d31f2bc 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.275979] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.275979] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.275979] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.275979] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.275979] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.275979] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2bc 
[    4.276761] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.276809] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.276887] Call Trace:
[    4.276917] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.277015] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.277139] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.277242] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.277329] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.277437] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.277549] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.277651] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.277770] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.277874] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.277991] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.278112] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.278230] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.278270] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.278350] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.278459] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.278553] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.278633] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.278700] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.278822] Instruction dump:
[    4.278840] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.278915] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.278997] ---[ end trace 2a6f56e64fb66e01 ]---
[    4.279113] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.279189] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.279410] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.279484] Workqueue: events work_for_cpu_fn
[    4.279527] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.279604] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.279708] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.279808] CFAR: c000000000074738 IRQMASK: 0 
[    4.279808] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.279808] GPR04: c00a00008d31f2c0 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.279808] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.279808] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.279808] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.279808] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.279808] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.279808] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2c0 
[    4.280589] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.280653] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.280719] Call Trace:
[    4.280749] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.280854] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.280938] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.281091] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.281190] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.281302] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.281396] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.281532] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.281642] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.281759] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.281869] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.282005] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.282126] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.282185] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.282275] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.282358] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.282442] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.282531] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.282619] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.282710] Instruction dump:
[    4.282756] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.282835] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.282929] ---[ end trace 2a6f56e64fb66e02 ]---
[    4.283041] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.283123] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.283365] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.283453] Workqueue: events work_for_cpu_fn
[    4.283504] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.283596] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.283698] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.283819] CFAR: c000000000074738 IRQMASK: 0 
[    4.283819] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.283819] GPR04: c00a00008d31f2c4 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.283819] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.283819] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.283819] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.283819] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.283819] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.283819] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2c4 
[    4.284577] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.284663] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.284713] Call Trace:
[    4.284752] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.284861] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.284979] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.285107] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.285202] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.285302] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.285417] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.285522] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.285614] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.285724] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.285841] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.285963] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.286063] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.286122] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.286225] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.286325] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.286391] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.286455] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.286533] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.286620] Instruction dump:
[    4.286636] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.286729] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.286827] ---[ end trace 2a6f56e64fb66e03 ]---
[    4.286934] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.287016] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.287235] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.287339] Workqueue: events work_for_cpu_fn
[    4.287370] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.287459] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.287554] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.287658] CFAR: c000000000074738 IRQMASK: 0 
[    4.287658] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.287658] GPR04: c00a00008d31f2c8 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.287658] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.287658] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.287658] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.287658] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.287658] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.287658] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2c8 
[    4.288461] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.288527] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.288608] Call Trace:
[    4.288639] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.288733] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.288893] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.288993] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.289100] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.289224] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.289321] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.289586] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.289697] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.289810] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.289956] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.290068] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.290165] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.290252] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.290332] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.290414] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.290527] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.290597] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.290684] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.290760] Instruction dump:
[    4.290809] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.290889] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.290979] ---[ end trace 2a6f56e64fb66e04 ]---
[    4.291107] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.291187] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.291401] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.291500] Workqueue: events work_for_cpu_fn
[    4.291554] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.291641] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.291751] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.291855] CFAR: c000000000074738 IRQMASK: 0 
[    4.291855] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.291855] GPR04: c00a00008d31f2cc 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.291855] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.291855] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.291855] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.291855] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.291855] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.291855] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2cc 
[    4.292669] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.292728] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.292795] Call Trace:
[    4.292827] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.292919] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.293051] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.293137] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.293282] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.293385] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.293505] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.293622] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.293718] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.293825] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.293946] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.294084] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.294189] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.294231] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.294315] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.294423] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.294498] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.294594] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.294684] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.294772] Instruction dump:
[    4.294801] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.294894] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.294971] ---[ end trace 2a6f56e64fb66e05 ]---
[    4.295126] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.295162] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.295410] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.295502] Workqueue: events work_for_cpu_fn
[    4.295572] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.295660] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.295755] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.295855] CFAR: c000000000074738 IRQMASK: 0 
[    4.295855] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.295855] GPR04: c00a00008d31f2d0 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.295855] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.295855] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.295855] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.295855] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.295855] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.295855] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2d0 
[    4.296650] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.296716] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.296778] Call Trace:
[    4.296800] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.296902] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.297030] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.297145] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.297247] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.297343] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.297456] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.297559] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.297658] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.297778] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.297893] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.298008] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.298122] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.298159] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.298247] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.298349] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.298435] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.298509] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.298593] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.298687] Instruction dump:
[    4.298721] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.298806] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.298919] ---[ end trace 2a6f56e64fb66e06 ]---
[    4.299016] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.299076] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.299329] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.299413] Workqueue: events work_for_cpu_fn
[    4.299474] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.299541] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.299650] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.299746] CFAR: c000000000074738 IRQMASK: 0 
[    4.299746] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.299746] GPR04: c00a00008d31f2d4 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.299746] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.299746] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.299746] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.299746] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.299746] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.299746] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2d4 
[    4.300534] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.300600] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.300666] Call Trace:
[    4.300693] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.300776] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.300909] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.301012] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.301125] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.301240] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.301353] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.301448] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.301540] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.301658] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.301770] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.301891] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.302014] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.302061] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.302153] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.302255] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.302349] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.302444] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.302496] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.302601] Instruction dump:
[    4.302646] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.302720] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.302843] ---[ end trace 2a6f56e64fb66e07 ]---
[    4.302922] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.303003] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.303241] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.303338] Workqueue: events work_for_cpu_fn
[    4.303374] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.303461] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.303578] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.303673] CFAR: c000000000074738 IRQMASK: 0 
[    4.303673] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.303673] GPR04: c00a00008d31f2d8 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.303673] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.303673] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.303673] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.303673] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.303673] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.303673] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2d8 
[    4.304462] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.304530] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.304590] Call Trace:
[    4.304624] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.304713] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.304833] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.304929] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.305043] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.305176] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.305264] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.305369] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.305467] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.305576] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.305683] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.305805] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.305899] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.305948] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.306041] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.306106] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.306201] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.306276] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.306348] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.306432] Instruction dump:
[    4.306478] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.306566] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.306657] ---[ end trace 2a6f56e64fb66e08 ]---
[    4.306790] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.306838] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.307059] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.307153] Workqueue: events work_for_cpu_fn
[    4.307200] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.307290] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.307372] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.307480] CFAR: c000000000074738 IRQMASK: 0 
[    4.307480] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.307480] GPR04: c00a00008d31f2dc 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.307480] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.307480] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.307480] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.307480] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.307480] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.307480] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2dc 
[    4.308299] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.308362] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.308417] Call Trace:
[    4.308454] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.308532] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.308647] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.308776] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.308871] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.308980] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.309093] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.309191] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.309287] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.309409] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.309538] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.309635] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.309747] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.309804] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.309892] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.309991] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.310066] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.310159] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.310233] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.310306] Instruction dump:
[    4.310353] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.310436] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.310533] ---[ end trace 2a6f56e64fb66e09 ]---
[    4.310659] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.310693] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.310945] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.311038] Workqueue: events work_for_cpu_fn
[    4.311074] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.311168] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.311258] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.311350] CFAR: c000000000074738 IRQMASK: 0 
[    4.311350] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.311350] GPR04: c00a00008d31f2e0 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.311350] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.311350] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.311350] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.311350] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.311350] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.311350] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2e0 
[    4.312167] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.312246] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.312318] Call Trace:
[    4.312337] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.312421] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.312563] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.312650] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.312769] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.312879] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.312953] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.313046] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.313148] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.313255] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.313351] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.313465] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.313585] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.313626] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.313709] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.313786] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.313877] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.313950] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.314033] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.314119] Instruction dump:
[    4.314140] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.314241] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.314345] ---[ end trace 2a6f56e64fb66e0a ]---
[    4.314433] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.314510] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.314722] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.314824] Workqueue: events work_for_cpu_fn
[    4.314879] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.314959] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.315038] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.315151] CFAR: c000000000074738 IRQMASK: 0 
[    4.315151] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.315151] GPR04: c00a00008d31f2e4 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.315151] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.315151] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.315151] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.315151] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.315151] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.315151] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2e4 
[    4.315940] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.316000] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.316094] Call Trace:
[    4.316114] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.316180] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.316296] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.316391] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.316508] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.316609] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.316700] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.316807] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.316914] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.317008] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.317128] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.317212] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.317327] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.317396] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.317481] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.317568] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.317644] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.317723] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.317802] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.317877] Instruction dump:
[    4.317904] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.317997] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.318078] ---[ end trace 2a6f56e64fb66e0b ]---
[    4.318195] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.318247] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.318496] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.318580] Workqueue: events work_for_cpu_fn
[    4.318645] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.318738] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.318816] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.318924] CFAR: c000000000074738 IRQMASK: 0 
[    4.318924] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.318924] GPR04: c00a00008d31f2e8 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.318924] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.318924] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.318924] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.318924] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.318924] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.318924] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2e8 
[    4.319748] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.319805] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.319856] Call Trace:
[    4.319902] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.319989] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.320116] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.320219] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.320329] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.320437] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.320532] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.320641] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.320762] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.320859] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.320975] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.321079] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.321191] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.321252] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.321334] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.321419] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.321486] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.321580] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.321663] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.321740] Instruction dump:
[    4.321774] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.321877] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.321976] ---[ end trace 2a6f56e64fb66e0c ]---
[    4.322099] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.322146] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.322381] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.322481] Workqueue: events work_for_cpu_fn
[    4.322531] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.322614] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.322709] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.322823] CFAR: c000000000074738 IRQMASK: 0 
[    4.322823] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.322823] GPR04: c00a00008d31f2ec 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.322823] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.322823] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.322823] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.322823] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.322823] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.322823] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2ec 
[    4.323577] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.323634] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.323700] Call Trace:
[    4.323742] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.323835] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.323943] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.324026] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.324134] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.324238] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.324335] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.324448] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.324554] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.324659] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.324757] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.324868] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.324982] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.325041] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.325121] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.325200] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.325289] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.325365] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.325440] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.325523] Instruction dump:
[    4.325571] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.325664] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.325766] ---[ end trace 2a6f56e64fb66e0d ]---
[    4.325908] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.325943] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.326186] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.326287] Workqueue: events work_for_cpu_fn
[    4.326344] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.326427] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.326509] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.326619] CFAR: c000000000074738 IRQMASK: 0 
[    4.326619] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.326619] GPR04: c00a00008d31f2f0 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.326619] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.326619] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.326619] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.326619] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.326619] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.326619] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2f0 
[    4.327405] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.327485] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.327559] Call Trace:
[    4.327577] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.327678] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.327799] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.327900] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.328001] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.328096] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.328205] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.328322] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.328429] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.328537] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.328674] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.328763] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.328886] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.328937] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.329034] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.329112] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.329205] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.329277] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.329338] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.329438] Instruction dump:
[    4.329486] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.329572] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.329678] ---[ end trace 2a6f56e64fb66e0e ]---
[    4.329819] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.329870] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.330142] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.330248] Workqueue: events work_for_cpu_fn
[    4.330292] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.330359] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.330450] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.330532] CFAR: c000000000074738 IRQMASK: 0 
[    4.330532] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.330532] GPR04: c00a00008d31f2f4 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.330532] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.330532] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.330532] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.330532] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.330532] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.330532] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2f4 
[    4.331290] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.331363] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.331422] Call Trace:
[    4.331444] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.331554] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.331634] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.331752] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.331838] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.331932] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.332043] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.332145] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.332252] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.332326] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.332434] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.332581] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.332671] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.332754] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.332847] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.332913] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.332996] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.333078] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.333157] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.333248] Instruction dump:
[    4.333280] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.333394] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.333467] ---[ end trace 2a6f56e64fb66e0f ]---
[    4.333573] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.333673] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.333901] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.333974] Workqueue: events work_for_cpu_fn
[    4.334042] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.334115] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.334214] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.334318] CFAR: c000000000074738 IRQMASK: 0 
[    4.334318] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.334318] GPR04: c00a00008d31f2f8 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.334318] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.334318] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.334318] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.334318] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.334318] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.334318] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2f8 
[    4.335089] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.335167] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.335221] Call Trace:
[    4.335258] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.335377] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.335489] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.335597] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.335701] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.335789] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.335901] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.336017] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.336105] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.336210] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.336330] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.336439] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.336550] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.336600] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.336696] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.336765] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.336847] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.336930] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.337014] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.337110] Instruction dump:
[    4.337148] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.337249] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.337334] ---[ end trace 2a6f56e64fb66e10 ]---
[    4.337434] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.337511] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.337759] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.337849] Workqueue: events work_for_cpu_fn
[    4.337881] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.337962] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.338058] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.338172] CFAR: c000000000074738 IRQMASK: 0 
[    4.338172] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.338172] GPR04: c00a00008d31f2fc 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.338172] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.338172] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.338172] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.338172] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.338172] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.338172] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f2fc 
[    4.338958] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.339044] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.339108] Call Trace:
[    4.339139] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.339258] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.339385] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.339474] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.339572] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.339683] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.339797] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.339894] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.339985] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.340068] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.340181] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.340296] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.340400] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.340460] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.340524] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.340606] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.340702] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.340783] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.340867] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.340951] Instruction dump:
[    4.340985] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.341076] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.341171] ---[ end trace 2a6f56e64fb66e11 ]---
[    4.341283] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.341362] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.341598] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.341687] Workqueue: events work_for_cpu_fn
[    4.341739] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.341815] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.341910] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.342022] CFAR: c000000000074738 IRQMASK: 0 
[    4.342022] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.342022] GPR04: c00a00008d31f300 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.342022] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.342022] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.342022] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.342022] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.342022] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.342022] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f300 
[    4.342822] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.342877] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.342940] Call Trace:
[    4.342974] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.343085] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.343196] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.343314] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.343397] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.343488] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.343613] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.343687] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.343797] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.343885] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.344022] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.344132] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.344255] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.344305] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.344398] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.344463] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.344563] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.344640] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.344734] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.344816] Instruction dump:
[    4.344835] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.344921] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.345005] ---[ end trace 2a6f56e64fb66e12 ]---
[    4.345156] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.345217] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.345456] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.345555] Workqueue: events work_for_cpu_fn
[    4.345611] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.345678] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.345796] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.345932] CFAR: c000000000074738 IRQMASK: 0 
[    4.345932] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.345932] GPR04: c00a00008d31f304 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.345932] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.345932] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.345932] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.345932] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.345932] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.345932] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f304 
[    4.346684] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.346745] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.346793] Call Trace:
[    4.346827] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.346917] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.347023] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.347125] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.347222] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.347314] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.347424] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.347522] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.347624] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.347732] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.347835] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.347946] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.348059] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.348139] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.348224] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.348317] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.348382] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.348469] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.348543] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.348627] Instruction dump:
[    4.348655] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.348731] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.348820] ---[ end trace 2a6f56e64fb66e13 ]---
[    4.348922] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.348987] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.349227] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.349323] Workqueue: events work_for_cpu_fn
[    4.349411] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.349477] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.349566] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.349687] CFAR: c000000000074738 IRQMASK: 0 
[    4.349687] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.349687] GPR04: c00a00008d31f308 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.349687] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.349687] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.349687] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.349687] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.349687] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.349687] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f308 
[    4.403768] ata3: SATA link down (SStatus 0 SControl 300)
[    4.448195] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.448197] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.448199] Call Trace:
[    4.448251] ata4: SATA link down (SStatus 0 SControl 300)
[    4.448314] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.448565] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.448675] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.448804] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.448910] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.449007] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.449094] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.449197] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.449293] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.449398] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.449518] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.449602] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.449715] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.449766] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.449859] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.449958] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.450035] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.450090] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.450173] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.450240] Instruction dump:
[    4.450279] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.450360] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.450467] ---[ end trace 2a6f56e64fb66e14 ]---
[    4.450582] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.450656] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.450891] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.450985] Workqueue: events work_for_cpu_fn
[    4.451032] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.451125] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.451214] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.451297] CFAR: c000000000074738 IRQMASK: 0 
[    4.451297] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.451297] GPR04: c00a00008d31f30c 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.451297] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.451297] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.451297] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.451297] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.451297] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.451297] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f30c 
[    4.452097] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.452154] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.452221] Call Trace:
[    4.452254] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.452342] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.452474] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.452558] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.452660] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.452772] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.452883] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.452989] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.453097] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.453214] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.453328] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.453440] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.453543] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.453601] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.453697] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.453773] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.453870] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.453973] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.454052] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.454155] Instruction dump:
[    4.454176] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.454279] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.454367] ---[ end trace 2a6f56e64fb66e15 ]---
[    4.454495] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.454538] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.454776] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.454869] Workqueue: events work_for_cpu_fn
[    4.454901] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.454986] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.455059] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.455159] CFAR: c000000000074738 IRQMASK: 0 
[    4.455159] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.455159] GPR04: c00a00008d31f310 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.455159] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.455159] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.455159] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.455159] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.455159] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.455159] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f310 
[    4.455963] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.456027] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.456083] Call Trace:
[    4.456115] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.456207] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.456312] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.456408] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.456505] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.456615] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.456719] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.456831] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.456928] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.457031] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.457138] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.457223] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.457333] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.457402] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.457477] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.457561] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.457646] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.457735] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.457791] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.457868] Instruction dump:
[    4.457902] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.458006] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.458117] ---[ end trace 2a6f56e64fb66e16 ]---
[    4.458276] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.458316] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.458538] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.458619] Workqueue: events work_for_cpu_fn
[    4.458690] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.458771] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.458866] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.458981] CFAR: c000000000074738 IRQMASK: 0 
[    4.458981] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.458981] GPR04: c00a00008d31f314 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.458981] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.458981] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.458981] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.458981] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.458981] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.458981] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f314 
[    4.459770] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.459850] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.459895] Call Trace:
[    4.459937] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.460028] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.460120] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.460209] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.460327] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.460426] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.460517] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.460609] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.460715] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.460834] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.460968] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.461071] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.461177] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.461251] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.461334] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.461407] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.461468] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.461541] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.461618] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.461712] Instruction dump:
[    4.461746] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.461841] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.461941] ---[ end trace 2a6f56e64fb66e17 ]---
[    4.462021] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.462117] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.462387] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.462508] Workqueue: events work_for_cpu_fn
[    4.462561] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.462657] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.462721] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.462832] CFAR: c000000000074738 IRQMASK: 0 
[    4.462832] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.462832] GPR04: c00a00008d31f318 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.462832] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.462832] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.462832] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.462832] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.462832] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.462832] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f318 
[    4.463634] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.463693] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.463778] Call Trace:
[    4.463796] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.463893] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.464004] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.464104] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.464221] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.464358] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.464505] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.464618] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.464716] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.464823] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.464977] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.465073] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.465194] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.465285] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.613420] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    4.629506] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.629511] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.629627] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    4.629675] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.629678] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.630028] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.630128] Instruction dump:
[    4.630148] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.630243] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.630318] ---[ end trace 2a6f56e64fb66e18 ]---
[    4.630449] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.630529] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.630778] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.630874] Workqueue: events work_for_cpu_fn
[    4.630919] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.631002] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.631093] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.631188] CFAR: c000000000074738 IRQMASK: 0 
[    4.631188] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.631188] GPR04: c00a00008d31f31c 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.631188] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.631188] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.631188] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.631188] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.631188] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.631188] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f31c 
[    4.631273] ata2.00: ATA-10: MTFDDAK960TCB        00LY460 00LY569IBM,     MJ06, max UDMA/133
[    4.631971] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.632080] ata2.00: 1875385008 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    4.632176] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.632245] ata1.00: ATA-10: MTFDDAK960TCB        00LY460 00LY569IBM,     MJ06, max UDMA/133
[    4.632316] Call Trace:
[    4.632414] ata1.00: 1875385008 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    4.632430] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.632436] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.632730] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.632825] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.632932] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.633034] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.633142] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.633248] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.633359] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.633454] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.633582] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.633676] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.633793] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.633855] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.633955] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.634015] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.634090] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.634175] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.634257] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.634327] ata2.00: configured for UDMA/133
[    4.634348] Instruction dump:
[    4.634438] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.634524] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.634603] ---[ end trace 2a6f56e64fb66e19 ]---
[    4.634606] ata1.00: configured for UDMA/133
[    4.634740] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.634814] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.635056] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.635158] Workqueue: events work_for_cpu_fn
[    4.635204] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.635284] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.635378] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.635499] CFAR: c000000000074738 IRQMASK: 0 
[    4.635499] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.635499] GPR04: c00a00008d31f320 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.635499] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.635499] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.635499] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.635499] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.635499] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.635499] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f320 
[    4.636298] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.636348] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.636416] Call Trace:
[    4.636445] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.636581] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.636677] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.636774] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.636857] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.636967] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.637065] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.637167] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.637254] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.637363] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.637456] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.637565] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.637673] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.637742] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.637830] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.637887] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.638000] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.638085] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.638147] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.638236] Instruction dump:
[    4.638280] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.638347] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.638439] ---[ end trace 2a6f56e64fb66e1a ]---
[    4.638581] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.638637] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.638880] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.638964] Workqueue: events work_for_cpu_fn
[    4.639024] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.639113] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.639199] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.639304] CFAR: c000000000074738 IRQMASK: 0 
[    4.639304] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.639304] GPR04: c00a00008d31f324 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.639304] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.639304] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.639304] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.639304] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.639304] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.639304] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f324 
[    4.640104] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.640157] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.640253] Call Trace:
[    4.640272] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.640348] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.640488] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.640595] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.640716] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.640836] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.640912] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.641005] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.641094] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.641197] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.641324] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.641426] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.641537] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.641594] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.641659] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.641744] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.641864] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.641936] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.642015] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.642102] Instruction dump:
[    4.642119] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.642201] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.642311] ---[ end trace 2a6f56e64fb66e1b ]---
[    4.642398] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.642479] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.642693] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.642793] Workqueue: events work_for_cpu_fn
[    4.642825] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.642905] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.642995] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.643095] CFAR: c000000000074738 IRQMASK: 0 
[    4.643095] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.643095] GPR04: c00a00008d31f328 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.643095] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.643095] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.643095] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.643095] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.643095] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.643095] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f328 
[    4.643862] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.643925] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.643994] Call Trace:
[    4.644020] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.644107] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.644199] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.644308] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.644428] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.644546] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.644707] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.644801] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.644903] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.645014] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.645116] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.645226] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.645336] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.645388] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.645474] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.645566] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.645648] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.645734] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.645834] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.645908] Instruction dump:
[    4.645937] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.646025] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.646124] ---[ end trace 2a6f56e64fb66e1c ]---
[    4.646211] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.646289] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.646507] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.646596] Workqueue: events work_for_cpu_fn
[    4.646665] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.646750] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.646855] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.646956] CFAR: c000000000074738 IRQMASK: 0 
[    4.646956] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.646956] GPR04: c00a00008d31f32c 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.646956] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.646956] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.646956] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.646956] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.646956] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.646956] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f32c 
[    4.647727] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.647793] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.647852] Call Trace:
[    4.647885] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.647984] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.648092] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.648182] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.648295] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.648405] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.648495] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.648599] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.648681] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.648786] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.648884] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.648991] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.649099] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.649152] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.649239] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.649326] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.649412] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.649505] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.649581] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.649668] Instruction dump:
[    4.649700] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.649794] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.649896] ---[ end trace 2a6f56e64fb66e1d ]---
[    4.649977] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.650051] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.650278] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.650375] Workqueue: events work_for_cpu_fn
[    4.650421] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.650494] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.650578] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.650671] CFAR: c000000000074738 IRQMASK: 0 
[    4.650671] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.650671] GPR04: c00a00008d31f330 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.650671] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.650671] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.650671] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.650671] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.650671] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.650671] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f330 
[    4.651455] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.651531] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.651598] Call Trace:
[    4.651626] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.651702] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.651808] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.651898] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.652009] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.652124] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.652198] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.652296] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.652386] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.652494] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.652615] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.652719] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.652812] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.652875] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.652963] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.653031] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.653132] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.653220] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.653259] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.653351] Instruction dump:
[    4.653388] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.653483] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.653584] ---[ end trace 2a6f56e64fb66e1e ]---
[    4.653697] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.653757] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.653992] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.654081] Workqueue: events work_for_cpu_fn
[    4.654136] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.654223] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.654312] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.654420] CFAR: c000000000074738 IRQMASK: 0 
[    4.654420] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.654420] GPR04: c00a00008d31f334 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.654420] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.654420] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.654420] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.654420] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.654420] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.654420] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f334 
[    4.655199] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.655260] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.655345] Call Trace:
[    4.655362] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.655463] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.655577] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.655658] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.655770] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.655900] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.655992] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.656111] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.656208] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.656316] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.656426] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.656540] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.656645] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.656713] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.656802] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.656862] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.656941] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.657023] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.657126] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.657200] Instruction dump:
[    4.657248] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.657336] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.657425] ---[ end trace 2a6f56e64fb66e1f ]---
[    4.657567] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.657615] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.657850] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.657936] Workqueue: events work_for_cpu_fn
[    4.657997] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.658069] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.658168] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.658269] CFAR: c000000000074738 IRQMASK: 0 
[    4.658269] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.658269] GPR04: c00a00008d31f338 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.658269] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.658269] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.658269] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.658269] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.658269] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.658269] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f338 
[    4.659038] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.659040] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.659040] Call Trace:
[    4.659042] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.659044] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
^[%G[    4.659078] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.659474] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.829587] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.829689] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.829775] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.829881] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.829992] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.830100] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.830203] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.830306] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.830409] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.830475] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.830609] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.830661] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.830744] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.830820] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.830891] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.830982] Instruction dump:
[    4.831020] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.831093] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.831187] ---[ end trace 2a6f56e64fb66e20 ]---
[    4.831377] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.831416] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.831640] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.831742] Workqueue: events work_for_cpu_fn
[    4.831792] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.831866] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.831956] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.832072] CFAR: c000000000074738 IRQMASK: 0 
[    4.832072] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.832072] GPR04: c00a00008d31f33c 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.832072] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.832072] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.832072] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.832072] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.832072] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.832072] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f33c 
[    4.832822] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.832899] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.832962] Call Trace:
[    4.832979] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.833102] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.833213] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.833307] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.833415] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.833521] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.833615] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.833725] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.833850] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.833948] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.834075] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.834210] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.834308] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.834363] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.834470] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.834566] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.834634] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.834729] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.834825] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.834907] Instruction dump:
[    4.834943] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.835059] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.835142] ---[ end trace 2a6f56e64fb66e21 ]---
[    4.835275] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.835354] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
^[%G^[%G[    4.835575] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.835577] Workqueue: events work_for_cpu_fn
[    4.835578] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.835579] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.835580] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.835586] CFAR: c000000000074738 IRQMASK: 0 
[    4.835586] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.835586] GPR04: c00a00008d31f340 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.835586] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.835586] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.835586] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.835586] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.835586] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.835586] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f340 
[    4.835600] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.835601] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.835602] Call Trace:
[    4.835603] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.835605] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.835637] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.835671] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.835703] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.835736] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.835767] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.835800] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.835831] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.835863] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.835904] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.835947] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.835989] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.835992] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.835993] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.835995] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.835997] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.835999] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.836001] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.836002] Instruction dump:
[    4.836003] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.836006] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.836010] ---[ end trace 2a6f56e64fb66e22 ]---
[    4.836045] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.836046] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.836054] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.836056] Workqueue: events work_for_cpu_fn
[    4.836057] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.836058] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.836059] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.836065] CFAR: c000000000074738 IRQMASK: 0 
[    4.836065] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.836065] GPR04: c00a00008d31f344 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.836065] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.836065] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.836065] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.836065] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.836065] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.836065] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f344 
[    4.836078] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.836079] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.836080] Call Trace:
[    4.836081] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.836083] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.836114] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.836146] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.836180] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.836211] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.836244] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.836275] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.836306] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.836337] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.836379] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.836421] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.836463] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.836467] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.836468] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.836470] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.836472] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.836474] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.836476] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.836476] Instruction dump:
[    4.836477] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.836481] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.836484] ---[ end trace 2a6f56e64fb66e23 ]---
[    4.836517] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.836518] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.836526] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.836528] Workqueue: events work_for_cpu_fn
[    4.836529] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.836530] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.836530] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.836534] CFAR: c000000000074738 IRQMASK: 0 
[    4.836534] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.836534] GPR04: c00a00008d31f348 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.836534] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.836534] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.836534] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.836534] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.836534] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.836534] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f348 
[    4.836556] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.836558] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.836558] Call Trace:
[    4.836559] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.836561] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.836593] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.836625] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.836657] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.836688] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.836720] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.836751] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.836787] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.836817] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.836857] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.836897] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.836939] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.836940] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.836942] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.836943] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.836945] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.836947] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.836949] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.836950] Instruction dump:
[    4.836950] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.836954] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.836958] ---[ end trace 2a6f56e64fb66e24 ]---
[    4.836990] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.836990] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.836998] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.836999] Workqueue: events work_for_cpu_fn
[    4.837001] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.837002] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.837002] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.837006] CFAR: c000000000074738 IRQMASK: 0 
[    4.837006] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.837006] GPR04: c00a00008d31f34c 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.837006] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.837006] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.837006] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.837006] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.837006] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.837006] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f34c 
[    4.837018] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.837019] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.837020] Call Trace:
[    4.837021] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.837023] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.837055] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.837086] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.837117] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.837147] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.837178] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.837210] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.837240] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.837273] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.837314] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.837356] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.837398] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.837401] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.837403] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.837404] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.837406] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.837408] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.837410] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.837411] Instruction dump:
[    4.837412] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.837415] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.837419] ---[ end trace 2a6f56e64fb66e25 ]---
[    4.837448] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.837448] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.837456] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.837459] Workqueue: events work_for_cpu_fn
[    4.837460] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.837461] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.837462] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.837465] CFAR: c000000000074738 IRQMASK: 0 
[    4.837465] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.837465] GPR04: c00a00008d31f350 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.837465] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.837465] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.837465] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.837465] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.837465] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.837465] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f350 
[    4.837478] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.837479] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.837480] Call Trace:
[    4.837481] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.837483] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.837515] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.837548] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.837579] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.837611] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.837643] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.837674] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.837705] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.837738] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.837779] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.837820] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.837863] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.837865] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.837867] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.837868] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.837870] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.837872] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.837876] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.837877] Instruction dump:
[    4.837878] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.837882] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.837885] ---[ end trace 2a6f56e64fb66e26 ]---
[    4.837909] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.837910] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.837917] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.837919] Workqueue: events work_for_cpu_fn
[    4.837920] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.837921] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.837921] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.837925] CFAR: c000000000074738 IRQMASK: 0 
[    4.837925] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.837925] GPR04: c00a00008d31f354 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.837925] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.837925] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.837925] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.837925] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.837925] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.837925] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f354 
[    4.837940] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.837942] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.837942] Call Trace:
[    4.837943] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.837947] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.837979] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.838011] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.838043] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.838074] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.838105] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.838136] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.838167] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.838208] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.838248] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.838290] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.838332] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.838335] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.838337] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.838338] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.838340] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.838342] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.838344] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.838345] Instruction dump:
[    4.838346] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.838350] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.838353] ---[ end trace 2a6f56e64fb66e27 ]---
[    4.838373] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.838373] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.838381] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.838382] Workqueue: events work_for_cpu_fn
[    4.838384] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.838385] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.838385] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.838388] CFAR: c000000000074738 IRQMASK: 0 
[    4.838388] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.838388] GPR04: c00a00008d31f358 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.838388] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.838388] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.838388] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.838388] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.838388] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.838388] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f358 
[    4.838410] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.838411] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.838411] Call Trace:
[    4.838413] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.838414] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.838448] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.838479] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.838511] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.838543] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.838574] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.838605] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.838637] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.838668] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.838709] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.838750] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.838793] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.838795] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.838797] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.838798] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.838802] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.838804] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.838806] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.838807] Instruction dump:
[    4.838808] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.838811] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.838815] ---[ end trace 2a6f56e64fb66e28 ]---
[    4.838832] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.838832] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.838840] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.838841] Workqueue: events work_for_cpu_fn
[    4.838843] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.838844] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.838844] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.838847] CFAR: c000000000074738 IRQMASK: 0 
[    4.838847] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.838847] GPR04: c00a00008d31f35c 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.838847] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.838847] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.838847] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.838847] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.838847] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.838847] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f35c 
[    4.838867] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.838868] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.838869] Call Trace:
[    4.838871] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.838873] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.838904] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.838936] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.838968] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.838999] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.839031] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.839062] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.839094] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.839125] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.839167] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.839208] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.839255] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.839257] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.839258] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.839260] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.839262] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.839264] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.839266] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.839267] Instruction dump:
[    4.839268] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.839272] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.839276] ---[ end trace 2a6f56e64fb66e29 ]---
[    4.839292] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.839293] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.839300] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.839302] Workqueue: events work_for_cpu_fn
[    4.839303] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.839304] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.839305] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.839308] CFAR: c000000000074738 IRQMASK: 0 
[    4.839308] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.839308] GPR04: c00a00008d31f360 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.839308] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.839308] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.839308] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.839308] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.839308] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.839308] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f360 
[    4.839321] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.839322] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.839323] Call Trace:
[    4.839324] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.839326] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.839357] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.839387] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.839418] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.839448] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.839479] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.839509] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.839539] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.839570] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.839611] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.839653] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.839695] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.839698] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.839700] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.839701] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.839703] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.839705] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.839707] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.839708] Instruction dump:
[    4.839709] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.839712] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.839716] ---[ end trace 2a6f56e64fb66e2a ]---
[    4.839733] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.839733] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.839741] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.839742] Workqueue: events work_for_cpu_fn
[    4.839743] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.839745] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.839746] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.839751] CFAR: c000000000074738 IRQMASK: 0 
[    4.839751] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.839751] GPR04: c00a00008d31f364 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.839751] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.839751] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.839751] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.839751] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.839751] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.839751] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f364 
[    4.839764] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.839765] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.839766] Call Trace:
[    4.839767] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.839769] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.839800] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.839832] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.839865] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.839896] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.839927] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.839958] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.839990] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.840021] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.840063] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.840104] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.840147] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.840149] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.840150] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.840153] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.840155] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.840157] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.840159] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.840160] Instruction dump:
[    4.840161] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.840165] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.840168] ---[ end trace 2a6f56e64fb66e2b ]---
[    4.840187] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.840188] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.840195] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.840197] Workqueue: events work_for_cpu_fn
[    4.840198] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.840200] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.840200] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.840206] CFAR: c000000000074738 IRQMASK: 0 
[    4.840206] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.840206] GPR04: c00a00008d31f368 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.840206] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.840206] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.840206] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.840206] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.840206] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.840206] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f368 
[    4.840219] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.840220] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.840221] Call Trace:
[    4.840222] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.840223] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.840255] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.840287] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.840319] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.840350] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.840380] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.840412] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.840442] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.840474] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.840516] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.840558] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.840600] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.840603] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.840604] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.840606] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.840609] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.840611] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.840613] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.840614] Instruction dump:
[    4.840615] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.840619] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.840623] ---[ end trace 2a6f56e64fb66e2c ]---
[    4.840642] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.840643] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.840651] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.840652] Workqueue: events work_for_cpu_fn
[    4.840653] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.840654] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.840655] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.840660] CFAR: c000000000074738 IRQMASK: 0 
[    4.840660] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.840660] GPR04: c00a00008d31f36c 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.840660] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.840660] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.840660] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.840660] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.840660] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.840660] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f36c 
[    4.840675] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.840676] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.840677] Call Trace:
[    4.840678] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.840680] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.840711] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.840743] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.840775] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.840806] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.840837] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.840868] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.840900] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.840932] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.840973] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.841014] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.841057] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.841059] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.841061] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.841064] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.841066] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.841068] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.841070] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.841071] Instruction dump:
[    4.841072] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.841076] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.841080] ---[ end trace 2a6f56e64fb66e2d ]---
[    4.841101] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.841102] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.841112] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.841114] Workqueue: events work_for_cpu_fn
[    4.841115] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.841117] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.841117] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.841124] CFAR: c000000000074738 IRQMASK: 0 
[    4.841124] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.841124] GPR04: c00a00008d31f370 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.841124] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.841124] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.841124] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.841124] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.841124] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.841124] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f370 
[    4.841140] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.841142] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.841142] Call Trace:
[    4.841144] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.841146] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.841177] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.841209] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.841239] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.841273] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.841304] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.841337] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.841369] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.841400] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.841442] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.841482] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.841524] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.841527] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.841529] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.841531] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.841532] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.841534] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.841537] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.841537] Instruction dump:
[    4.841538] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.841542] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.841546] ---[ end trace 2a6f56e64fb66e2e ]---
[    4.841567] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.841567] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.841575] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.841577] Workqueue: events work_for_cpu_fn
[    4.841578] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.841579] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.841579] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.841584] CFAR: c000000000074738 IRQMASK: 0 
[    4.841584] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.841584] GPR04: c00a00008d31f374 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.841584] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.841584] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.841584] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.841584] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.841584] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.841584] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f374 
[    4.841604] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.841605] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.841606] Call Trace:
[    4.841607] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.841609] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.841640] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.841672] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.841709] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.841739] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.841769] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.841799] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.841829] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.841860] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.841916] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.841967] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.842029] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.842032] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.842034] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.842036] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.842039] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.842041] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.842044] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.842047] Instruction dump:
[    4.842048] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.842054] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.842060] ---[ end trace 2a6f56e64fb66e2f ]---
[    4.842087] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.842088] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.842102] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.842104] Workqueue: events work_for_cpu_fn
[    4.842106] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.842108] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.842108] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.842114] CFAR: c000000000074738 IRQMASK: 0 
[    4.842114] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.842114] GPR04: c00a00008d31f378 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.842114] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.842114] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.842114] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.842114] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.842114] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.842114] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f378 
[    4.842139] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.842141] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.842143] Call Trace:
[    4.842146] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.842148] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.842199] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.842251] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.842302] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.842352] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.842403] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.842453] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.842504] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.842554] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.842615] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.842675] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.842737] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.842740] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.842744] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.842746] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.842749] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.842751] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.842754] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.842756] Instruction dump:
[    4.842757] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.842763] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.842770] ---[ end trace 2a6f56e64fb66e30 ]---
[    4.842798] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.842800] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.842812] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.842815] Workqueue: events work_for_cpu_fn
[    4.842816] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.842818] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.842819] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.842825] CFAR: c000000000074738 IRQMASK: 0 
[    4.842825] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.842825] GPR04: c00a00008d31f37c 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.842825] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.842825] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.842825] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.842825] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.842825] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.842825] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f37c 
[    4.842847] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.842849] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.842850] Call Trace:
[    4.842852] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.842854] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.842905] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.842957] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.843007] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.843058] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.843108] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.843159] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.843209] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.843259] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.843319] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.843380] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.843441] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.843445] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.843448] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.843451] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.843453] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.843456] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.843459] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.843460] Instruction dump:
[    4.843462] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.843467] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.843474] ---[ end trace 2a6f56e64fb66e31 ]---
[    4.843499] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.843501] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.843515] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.843517] Workqueue: events work_for_cpu_fn
[    4.843519] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.843520] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.843521] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.843526] CFAR: c000000000074738 IRQMASK: 0 
[    4.843526] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.843526] GPR04: c00a00008d31f380 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.843526] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.843526] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.843526] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.843526] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.843526] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.843526] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f380 
[    4.843554] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.843556] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.843558] Call Trace:
[    4.843560] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.843563] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.843614] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.843663] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.843715] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.843764] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.843815] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.843865] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.843916] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.843966] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.844028] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.844087] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.844149] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.844152] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.844157] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.844159] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.844162] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.844165] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.844168] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.844169] Instruction dump:
[    4.844170] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.844176] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.844182] ---[ end trace 2a6f56e64fb66e32 ]---
[    4.844205] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.844206] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.844218] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.844220] Workqueue: events work_for_cpu_fn
[    4.844222] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.844224] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.844225] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.844233] CFAR: c000000000074738 IRQMASK: 0 
[    4.844233] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.844233] GPR04: c00a00008d31f384 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.844233] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.844233] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.844233] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.844233] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.844233] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.844233] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f384 
[    4.844254] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.844256] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.844256] Call Trace:
[    4.844258] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.844261] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.844311] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.844361] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.844413] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.844463] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.844515] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.844564] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.844616] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.844666] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.844731] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.844789] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.844849] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.844852] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.844854] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.844856] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.844859] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.844862] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.844865] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.844866] Instruction dump:
[    4.844867] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.844873] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.844878] ---[ end trace 2a6f56e64fb66e33 ]---
[    4.844901] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.844902] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.844914] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.844916] Workqueue: events work_for_cpu_fn
[    4.844918] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.844919] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.844920] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.844926] CFAR: c000000000074738 IRQMASK: 0 
[    4.844926] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.844926] GPR04: c00a00008d31f388 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.844926] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.844926] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.844926] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.844926] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.844926] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.844926] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f388 
[    4.844947] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.844949] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.844949] Call Trace:
[    4.844951] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.844954] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.845005] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.845054] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.845103] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.845152] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.845202] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.845254] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.845303] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.845352] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.845411] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.845472] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.845532] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.845536] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.845539] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.845541] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.845544] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.845547] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.845550] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.845551] Instruction dump:
[    4.845553] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.845558] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.845564] ---[ end trace 2a6f56e64fb66e34 ]---
[    4.845587] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.845587] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.845599] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.845601] Workqueue: events work_for_cpu_fn
[    4.845602] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.845604] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.845605] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.845613] CFAR: c000000000074738 IRQMASK: 0 
[    4.845613] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.845613] GPR04: c00a00008d31f38c 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.845613] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.845613] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.845613] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.845613] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.845613] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.845613] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f38c 
[    4.845632] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.845634] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.845635] Call Trace:
[    4.845636] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.845639] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.845690] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.845739] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.845789] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.845839] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.845889] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.845936] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.845988] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.846037] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.846096] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.846155] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.846215] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.846218] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.846222] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.846225] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.846228] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.846230] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.846234] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.846235] Instruction dump:
[    4.846236] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.846241] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.846246] ---[ end trace 2a6f56e64fb66e35 ]---
[    4.846269] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.846270] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.846281] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.846283] Workqueue: events work_for_cpu_fn
[    4.846285] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.846286] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.846287] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.846292] CFAR: c000000000074738 IRQMASK: 0 
[    4.846292] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.846292] GPR04: c00a00008d31f390 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.846292] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.846292] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.846292] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.846292] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.846292] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.846292] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f390 
[    4.846314] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.846316] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.846316] Call Trace:
[    4.846318] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.846321] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.846369] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.846420] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.846471] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.846522] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.846583] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.846633] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.846686] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.846735] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.846794] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.846852] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.846913] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.846915] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.846919] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.846922] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.846924] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.846927] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.846930] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.846931] Instruction dump:
[    4.846932] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.846938] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.846943] ---[ end trace 2a6f56e64fb66e36 ]---
[    4.846963] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.846964] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.846975] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.846977] Workqueue: events work_for_cpu_fn
[    4.846979] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.846980] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.846981] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.846987] CFAR: c000000000074738 IRQMASK: 0 
[    4.846987] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.846987] GPR04: c00a00008d31f394 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.846987] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.846987] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.846987] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.846987] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.846987] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.846987] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f394 
[    4.847009] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.847010] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.847011] Call Trace:
[    4.847013] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.847015] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.847064] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.847112] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.847162] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.847210] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.847260] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.847308] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.847357] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.847405] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.847464] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.847522] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.847583] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.847586] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.847590] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.847593] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.847595] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.847598] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.847601] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.847602] Instruction dump:
[    4.847603] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.847609] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.847614] ---[ end trace 2a6f56e64fb66e37 ]---
[    4.847633] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.847634] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.847645] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.847647] Workqueue: events work_for_cpu_fn
[    4.847649] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.847650] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.847651] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.847656] CFAR: c000000000074738 IRQMASK: 0 
[    4.847656] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.847656] GPR04: c00a00008d31f398 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.847656] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.847656] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.847656] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.847656] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.847656] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.847656] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f398 
[    4.847685] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.847687] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.847689] Call Trace:
[    4.847691] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.847694] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.847742] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.847790] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.847840] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.847888] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.847938] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.847985] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.848034] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.848083] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.848147] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.848204] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.848263] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.848266] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.848268] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.848270] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.848272] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.848275] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.848278] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.848279] Instruction dump:
[    4.848280] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.848285] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.848290] ---[ end trace 2a6f56e64fb66e38 ]---
[    4.848316] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.848317] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.848328] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.848330] Workqueue: events work_for_cpu_fn
[    4.848332] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.848333] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.848334] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.848339] CFAR: c000000000074738 IRQMASK: 0 
[    4.848339] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.848339] GPR04: c00a00008d31f39c 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.848339] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.848339] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.848339] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.848339] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.848339] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.848339] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f39c 
[    4.848358] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.848360] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.848361] Call Trace:
[    4.848363] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.848365] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.848413] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.848461] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.848509] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.848557] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.848606] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.848653] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.848702] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.848750] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.848809] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.848867] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.848928] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.848931] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.848935] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.848937] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.848940] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.848942] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.848945] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.848946] Instruction dump:
[    4.848947] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.848952] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.848958] ---[ end trace 2a6f56e64fb66e39 ]---
[    4.848986] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.848987] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.849000] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.849002] Workqueue: events work_for_cpu_fn
[    4.849004] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.849006] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.849006] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.849012] CFAR: c000000000074738 IRQMASK: 0 
[    4.849012] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.849012] GPR04: c00a00008d31f3a0 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.849012] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.849012] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.849012] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.849012] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.849012] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.849012] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3a0 
[    4.849039] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.849040] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.849041] Call Trace:
[    4.849043] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.849046] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.849094] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.849142] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.849192] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.849239] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.849289] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.849337] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.849386] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.849435] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.849494] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.849554] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.849615] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.849618] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.849622] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.849625] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.849627] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.849630] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.849633] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.849634] Instruction dump:
[    4.849636] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.849640] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.849648] ---[ end trace 2a6f56e64fb66e3a ]---
[    4.849680] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.849681] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.849693] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.849695] Workqueue: events work_for_cpu_fn
[    4.849697] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.849699] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.849700] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.849706] CFAR: c000000000074738 IRQMASK: 0 
[    4.849706] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.849706] GPR04: c00a00008d31f3a4 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.849706] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.849706] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.849706] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.849706] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.849706] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.849706] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3a4 
[    4.849735] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.849737] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.849737] Call Trace:
[    4.849738] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.849740] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.849772] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.849803] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.849836] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.849866] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.849898] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.849929] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.849961] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.849992] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.850034] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.850074] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.850118] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.850120] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.850122] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.850125] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.850126] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.850128] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.850131] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.850131] Instruction dump:
[    4.850133] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.850136] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.850140] ---[ end trace 2a6f56e64fb66e3b ]---
[    4.850160] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.850161] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.850168] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.850170] Workqueue: events work_for_cpu_fn
[    4.850171] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.850172] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.850173] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.850177] CFAR: c000000000074738 IRQMASK: 0 
[    4.850177] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.850177] GPR04: c00a00008d31f3a8 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.850177] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.850177] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.850177] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.850177] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.850177] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.850177] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3a8 
[    4.850196] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.850198] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.850200] Call Trace:
[    4.850201] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.850203] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.850234] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.850266] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.850298] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.850329] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.850360] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.850391] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.850423] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.850454] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.850497] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.850537] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.850580] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.850582] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.850584] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.850587] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.850589] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.850591] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.850593] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.850594] Instruction dump:
[    4.850595] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.850598] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.850602] ---[ end trace 2a6f56e64fb66e3c ]---
[    4.850621] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.850622] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.850629] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.850631] Workqueue: events work_for_cpu_fn
[    4.850632] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.850633] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.850634] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.850637] CFAR: c000000000074738 IRQMASK: 0 
[    4.850637] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.850637] GPR04: c00a00008d31f3ac 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.850637] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.850637] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.850637] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.850637] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.850637] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.850637] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3ac 
[    4.850660] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.850662] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.850663] Call Trace:
[    4.850665] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.850667] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.850700] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.850732] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.850772] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.850802] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.850832] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.850862] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.850892] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.850922] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.850962] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.851002] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.851044] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.851046] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.851048] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.851051] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.851053] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.851055] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.851057] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.851058] Instruction dump:
[    4.851059] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.851063] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.851068] ---[ end trace 2a6f56e64fb66e3d ]---
[    4.851088] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.851089] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.851098] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.851100] Workqueue: events work_for_cpu_fn
[    4.851101] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.851102] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.851103] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.851106] CFAR: c000000000074738 IRQMASK: 0 
[    4.851106] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.851106] GPR04: c00a00008d31f3b0 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.851106] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.851106] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.851106] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.851106] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.851106] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.851106] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3b0 
[    4.851125] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.851127] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.851128] Call Trace:
[    4.851129] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.851130] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.851161] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.851193] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.851225] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.851256] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.851288] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.851318] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.851350] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.851380] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.851422] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.851463] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.851506] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.851508] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.851510] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.851512] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.851514] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.851516] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.851518] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.851519] Instruction dump:
[    4.851520] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.851525] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.851528] ---[ end trace 2a6f56e64fb66e3e ]---
[    4.851548] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.851549] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.851560] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.851562] Workqueue: events work_for_cpu_fn
[    4.851563] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.851564] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.851564] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.851568] CFAR: c000000000074738 IRQMASK: 0 
[    4.851568] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.851568] GPR04: c00a00008d31f3b4 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.851568] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.851568] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.851568] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.851568] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.851568] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.851568] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3b4 
[    4.851587] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.851590] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.851590] Call Trace:
[    4.851592] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.851593] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.851624] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.851655] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.851687] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.851718] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.851749] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.851780] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.851811] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.851842] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.851883] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.851924] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.851967] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.851969] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.851971] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.851973] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.851974] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.851976] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.851979] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.851979] Instruction dump:
[    4.851980] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    4.851984] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    4.851989] ---[ end trace 2a6f56e64fb66e3f ]---
[    4.852008] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    4.852008] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    4.852017] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    4.852019] Workqueue: events work_for_cpu_fn
[    4.852021] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    4.852022] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[    4.852022] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[    4.852026] CFAR: c000000000074738 IRQMASK: 0 
[    4.852026] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[    4.852026] GPR04: c00a00008d31f3b8 0000000000000000 c000003fd78b7404 0000000000000015 
[    4.852026] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[    4.852026] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[    4.852026] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[    4.852026] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[    4.852026] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[    4.852026] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3b8 
[    4.852044] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[    4.852047] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[    4.852047] Call Trace:
[    4.852049] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[    4.852050] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[    4.852081] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[    4.852112] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[    4.852144] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[    4.852175] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.852206] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[    4.852237] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[    4.852268] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[    4.852299] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[    4.852340] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[    4.852381] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[    4.852424] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[    4.852426] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[    4.852428] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[    4.852430] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[    4.852432] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[    4.852434] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[    4.852436] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[    4.852438] Instruction dump:
[    6.533741] nvme nvme0: Shutdown timeout set to 10 seconds
[    6.872915] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[    6.872918] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[    6.883475] nvme nvme0: 128/0/0 default/read/poll queues
[    7.572484] ---[ end trace 2a6f56e64fb66e40 ]---
[    7.572512] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[    7.579942]  nvme0n1: p1 p2 p3
[    7.992478] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[    7.997355] scsi 0:0:0:0: Direct-Access     ATA      MTFDDAK960TCB    MJ06 PQ: 0 ANSI: 5
[    7.997385] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[    7.997387] Workqueue: events work_for_cpu_fn
[    7.998117] scsi 1:0:0:0: Direct-Access     ATA      MTFDDAK960TCB    MJ06 PQ: 0 ANSI: 5
[    7.998552] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[    7.998554] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.186178] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.186181] CFAR: c000000000074738 IRQMASK: 0 
[   12.186181] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.186181] GPR04: c00a00008d31f3bc 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.186181] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.186181] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.186181] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.186181] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.186181] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.186181] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3bc 
[   12.186191] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.186192] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.186193] Call Trace:
[   12.186194] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.186196] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.186220] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.186243] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.186265] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.186286] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.186308] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.186328] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.186349] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.186370] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.186399] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.186428] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.186457] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.186458] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.186459] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.186461] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.186462] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.186464] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.186465] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.186466] Instruction dump:
[   12.186467] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.186469] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.186472] ---[ end trace 2a6f56e64fb66e41 ]---
[   12.186501] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.186502] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.186508] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.186509] Workqueue: events work_for_cpu_fn
[   12.186510] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.186511] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.186511] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.186514] CFAR: c000000000074738 IRQMASK: 0 
[   12.186514] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.186514] GPR04: c00a00008d31f3c0 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.186514] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.186514] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.186514] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.186514] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.186514] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.186514] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3c0 
[   12.186523] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.186524] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.186525] Call Trace:
[   12.186526] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.186532] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.186553] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.186574] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.186595] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.186616] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.186636] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.186657] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.186677] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.186698] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.186727] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.186756] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.186785] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.186786] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.186787] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.186788] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.186789] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.186791] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.186792] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.186793] Instruction dump:
[   12.186794] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.186796] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.186799] ---[ end trace 2a6f56e64fb66e42 ]---
[   12.186818] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.186818] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.186825] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.186827] Workqueue: events work_for_cpu_fn
[   12.186829] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.186830] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.186831] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.186833] CFAR: c000000000074738 IRQMASK: 0 
[   12.186833] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.186833] GPR04: c00a00008d31f3c4 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.186833] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.186833] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.186833] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.186833] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.186833] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.186833] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3c4 
[   12.186842] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.186843] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.186843] Call Trace:
[   12.186844] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.186846] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.186867] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.186889] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.186910] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.186932] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.186953] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.186975] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.186996] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.187018] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.187048] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.187078] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.187108] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.187109] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.187111] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.187113] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.187115] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.187116] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.187118] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.187118] Instruction dump:
[   12.187119] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.187121] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.187124] ---[ end trace 2a6f56e64fb66e43 ]---
[   12.187141] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.187142] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.187147] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.187148] Workqueue: events work_for_cpu_fn
[   12.187149] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.187151] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.187152] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.187154] CFAR: c000000000074738 IRQMASK: 0 
[   12.187154] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.187154] GPR04: c00a00008d31f3c8 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.187154] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.187154] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.187154] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.187154] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.187154] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.187154] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3c8 
[   12.187163] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.187164] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.187164] Call Trace:
[   12.187165] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.187167] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.187188] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.187210] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.187232] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.187254] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.187275] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.187297] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.187318] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.187339] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.187369] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.187399] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.187428] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.187431] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.187432] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.187433] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.187434] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.187435] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.187437] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.187437] Instruction dump:
[   12.187438] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.187441] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.187443] ---[ end trace 2a6f56e64fb66e44 ]---
[   12.187458] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.187459] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.187464] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.187466] Workqueue: events work_for_cpu_fn
[   12.187467] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.187469] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.187469] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.187472] CFAR: c000000000074738 IRQMASK: 0 
[   12.187472] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.187472] GPR04: c00a00008d31f3cc 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.187472] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.187472] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.187472] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.187472] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.187472] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.187472] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3cc 
[   12.187481] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.187482] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.187482] Call Trace:
[   12.187483] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.187485] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.187506] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.187528] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.187549] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.187571] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.187592] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.187613] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.187634] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.187656] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.187684] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.187715] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.187744] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.187747] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.187748] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.187749] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.187751] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.187752] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.187754] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.187754] Instruction dump:
[   12.187755] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.187757] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.187760] ---[ end trace 2a6f56e64fb66e45 ]---
[   12.187775] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.187775] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.187780] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.187782] Workqueue: events work_for_cpu_fn
[   12.187783] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.187785] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.187786] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.187788] CFAR: c000000000074738 IRQMASK: 0 
[   12.187788] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.187788] GPR04: c00a00008d31f3d0 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.187788] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.187788] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.187788] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.187788] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.187788] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.187788] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3d0 
[   12.187797] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.187798] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.187798] Call Trace:
[   12.187799] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.187800] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.187822] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.187844] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.187865] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.187888] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.187909] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.187930] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.187951] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.187973] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.188002] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.188032] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.188061] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.188064] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.188065] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.188066] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.188067] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.188069] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.188070] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.188071] Instruction dump:
[   12.188071] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.188074] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.188076] ---[ end trace 2a6f56e64fb66e46 ]---
[   12.188092] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.188092] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.188097] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.188099] Workqueue: events work_for_cpu_fn
[   12.188100] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.188102] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.188103] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.188105] CFAR: c000000000074738 IRQMASK: 0 
[   12.188105] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.188105] GPR04: c00a00008d31f3d4 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.188105] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.188105] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.188105] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.188105] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.188105] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.188105] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3d4 
[   12.188114] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.188115] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.188115] Call Trace:
[   12.188116] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.188118] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.188138] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.188162] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.188183] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.188203] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.188223] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.188244] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.188263] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.188283] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.188312] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.188339] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.188368] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.188369] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.188370] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.188371] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.188373] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.188374] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.188376] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.188376] Instruction dump:
[   12.188377] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.188379] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.188382] ---[ end trace 2a6f56e64fb66e47 ]---
[   12.188397] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.188397] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.188402] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.188403] Workqueue: events work_for_cpu_fn
[   12.188404] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.188405] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.188405] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.188407] CFAR: c000000000074738 IRQMASK: 0 
[   12.188407] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.188407] GPR04: c00a00008d31f3d8 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.188407] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.188407] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.188407] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.188407] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.188407] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.188407] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3d8 
[   12.188419] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.188420] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.188420] Call Trace:
[   12.188421] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.188422] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.188443] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.188464] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.188486] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.188507] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.188527] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.188549] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.188569] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.188589] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.188619] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.188647] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.188678] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.188679] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.188680] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.188683] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.188684] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.188686] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.188688] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.188688] Instruction dump:
[   12.188689] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.188691] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.188694] ---[ end trace 2a6f56e64fb66e48 ]---
[   12.188709] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.188710] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.188714] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.188716] Workqueue: events work_for_cpu_fn
[   12.188717] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.188718] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.188718] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.188723] CFAR: c000000000074738 IRQMASK: 0 
[   12.188723] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.188723] GPR04: c00a00008d31f3dc 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.188723] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.188723] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.188723] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.188723] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.188723] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.188723] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3dc 
[   12.188732] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.188733] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.188733] Call Trace:
[   12.188734] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.188735] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.188756] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.188777] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.188799] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.188819] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.188841] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.188862] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.188883] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.188904] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.188934] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.188963] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.188993] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.188995] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.188996] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.188999] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.189000] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.189002] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.189004] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.189004] Instruction dump:
[   12.189005] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.189007] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.189010] ---[ end trace 2a6f56e64fb66e49 ]---
[   12.189025] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.189025] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.189030] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.189031] Workqueue: events work_for_cpu_fn
[   12.189033] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.189033] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.189034] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.189038] CFAR: c000000000074738 IRQMASK: 0 
[   12.189038] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.189038] GPR04: c00a00008d31f3e0 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.189038] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.189038] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.189038] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.189038] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.189038] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.189038] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3e0 
[   12.189047] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.189048] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.189048] Call Trace:
[   12.189049] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.189051] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.189072] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.189093] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.189115] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.189136] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.189158] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.189178] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.189200] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.189220] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.189250] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.189279] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.189309] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.189311] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.189312] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.189315] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.189316] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.189317] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.189319] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.189320] Instruction dump:
[   12.189320] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.189323] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.189325] ---[ end trace 2a6f56e64fb66e4a ]---
[   12.189340] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.189341] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.189346] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.189347] Workqueue: events work_for_cpu_fn
[   12.189348] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.189349] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.189350] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.189354] CFAR: c000000000074738 IRQMASK: 0 
[   12.189354] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.189354] GPR04: c00a00008d31f3e4 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.189354] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.189354] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.189354] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.189354] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.189354] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.189354] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3e4 
[   12.189363] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.189364] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.189364] Call Trace:
[   12.189365] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.189366] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.189387] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.189408] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.189429] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.189450] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.189471] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.189492] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.189513] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.189534] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.189564] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.189593] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.189624] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.189626] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.189627] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.189629] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.189631] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.189632] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.189634] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.189634] Instruction dump:
[   12.189635] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.189637] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.189640] ---[ end trace 2a6f56e64fb66e4b ]---
[   12.189655] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.189655] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.189660] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.189662] Workqueue: events work_for_cpu_fn
[   12.189663] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.189664] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.189664] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.189668] CFAR: c000000000074738 IRQMASK: 0 
[   12.189668] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.189668] GPR04: c00a00008d31f3e8 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.189668] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.189668] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.189668] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.189668] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.189668] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.189668] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3e8 
[   12.189677] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.189678] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.189679] Call Trace:
[   12.189680] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.189681] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.189702] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.189725] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.189746] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.189770] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.189789] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.189810] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.189829] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.189849] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.189877] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.189905] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.189934] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.189935] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.189936] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.189937] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.189939] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.189940] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.189941] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.189942] Instruction dump:
[   12.189943] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.189945] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.189948] ---[ end trace 2a6f56e64fb66e4c ]---
[   12.189963] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.189963] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.189968] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.189969] Workqueue: events work_for_cpu_fn
[   12.189970] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.189970] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.189971] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.189973] CFAR: c000000000074738 IRQMASK: 0 
[   12.189973] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.189973] GPR04: c00a00008d31f3ec 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.189973] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.189973] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.189973] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.189973] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.189973] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.189973] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3ec 
[   12.189982] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.189983] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.189983] Call Trace:
[   12.189984] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.189985] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.190006] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.190026] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.190047] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.190068] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.190088] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.190108] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.190129] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.190150] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.190179] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.190208] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.190238] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.190240] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.190241] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.190244] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.190245] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.190246] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.190248] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.190249] Instruction dump:
[   12.190249] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.190252] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.190254] ---[ end trace 2a6f56e64fb66e4d ]---
[   12.190269] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.190270] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.190275] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.190276] Workqueue: events work_for_cpu_fn
[   12.190277] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.190278] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.190279] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.190282] CFAR: c000000000074738 IRQMASK: 0 
[   12.190282] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.190282] GPR04: c00a00008d31f3f0 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.190282] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.190282] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.190282] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.190282] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.190282] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.190282] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3f0 
[   12.190292] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.190292] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.190293] Call Trace:
[   12.190294] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.190295] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.190316] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.190337] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.190359] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.190379] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.190401] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.190420] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.190442] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.190463] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.190493] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.190521] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.190552] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.190553] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.190555] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.190557] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.190559] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.190560] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.190562] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.190562] Instruction dump:
[   12.190563] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.190566] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.190568] ---[ end trace 2a6f56e64fb66e4e ]---
[   12.190583] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.190584] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.190589] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.190590] Workqueue: events work_for_cpu_fn
[   12.190591] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.190592] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.190592] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.190597] CFAR: c000000000074738 IRQMASK: 0 
[   12.190597] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.190597] GPR04: c00a00008d31f3f4 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.190597] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.190597] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.190597] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.190597] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.190597] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.190597] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3f4 
[   12.190606] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.190607] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.190607] Call Trace:
[   12.190608] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.190609] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.190630] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.190651] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.190673] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.190693] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.190715] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.190736] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.190757] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.190779] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.190808] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.190838] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.190868] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.190870] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.190871] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.190874] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.190875] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.190877] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.190879] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.190879] Instruction dump:
[   12.190880] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.190883] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.190885] ---[ end trace 2a6f56e64fb66e4f ]---
[   12.190900] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.190901] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.190906] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.190908] Workqueue: events work_for_cpu_fn
[   12.190909] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.190910] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.190910] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.190915] CFAR: c000000000074738 IRQMASK: 0 
[   12.190915] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.190915] GPR04: c00a00008d31f3f8 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.190915] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.190915] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.190915] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.190915] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.190915] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.190915] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f3f8 
[   12.190924] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.190925] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.190925] Call Trace:
[   12.190926] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.190927] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.190948] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.190969] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.190991] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.191011] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.191033] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.191054] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.191074] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.191095] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.191124] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.191155] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.191186] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.191187] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.191189] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.191191] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.191193] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.191194] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.191196] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.191197] Instruction dump:
[   12.191197] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.191200] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.191202] ---[ end trace 2a6f56e64fb66e50 ]---
[   12.191356] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.191357] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.191361] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.191363] Workqueue: events work_for_cpu_fn
[   12.191364] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.191364] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.191365] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.191367] CFAR: c000000000074738 IRQMASK: 0 
[   12.191367] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.191367] GPR04: c00a00008d31f518 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.191367] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.191367] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.191367] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.191367] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.191367] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.191367] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f518 
[   12.191376] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.191377] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.191377] Call Trace:
[   12.191378] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.191379] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.191400] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.191420] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.191440] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.191460] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.191480] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.191500] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.191519] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.191539] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.191568] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.191596] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.191627] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.191628] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.191630] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.191631] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.191634] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.191636] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.191637] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.191638] Instruction dump:
[   12.191638] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.191641] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.191643] ---[ end trace 2a6f56e64fb66e51 ]---
[   12.191658] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.191659] Modules linked in: nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.191664] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.191665] Workqueue: events work_for_cpu_fn
[   12.191666] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.191667] REGS: c000003fd78b7150 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.191668] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.191671] CFAR: c000000000074738 IRQMASK: 0 
[   12.191671] GPR00: 00000000ae012000 c000003fd78b73e0 c00000000144a200 c000203fff654348 
[   12.191671] GPR04: c00a00008d31f51c 0000000000000000 c000003fd78b7404 0000000000000015 
[   12.191671] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.191671] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.191671] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.191671] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.191671] GPR24: 0000000040000000 0000000040000000 000000000000f600 c000003fc7c77000 
[   12.191671] GPR28: c000003fe6b32a80 0000000000020400 c000003fac4c0000 c00a00008d31f51c 
[   12.191681] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.191682] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.191682] Call Trace:
[   12.191683] [c000003fd78b73e0] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.191684] [c000003fd78b7420] [c0000000005c2530] ioread32+0x100/0x170
[   12.191705] [c000003fd78b7450] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.191726] [c000003fd78b74a0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.191747] [c000003fd78b74f0] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.191768] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.191790] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.191810] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.191831] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.191852] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.191882] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.191911] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.191941] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.191943] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.191944] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.191947] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.191948] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.191949] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.191951] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.191951] Instruction dump:
[   12.191952] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.191955] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.191957] ---[ end trace 2a6f56e64fb66e52 ]---
[   12.199497] sd 0:0:0:0: [sda] 1875385008 512-byte logical blocks: (960 GB/894 GiB)
[   12.199505] sd 1:0:0:0: [sdb] 1875385008 512-byte logical blocks: (960 GB/894 GiB)
[   12.199507] sd 1:0:0:0: [sdb] 4096-byte physical blocks
[   12.199525] sd 1:0:0:0: [sdb] Write Protect is off
[   12.199553] sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   12.202420] sd 1:0:0:0: [sdb] Attached SCSI removable disk
[   12.225079] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.225080] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.225087] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.225089] Workqueue: events work_for_cpu_fn
[   12.225090] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.225091] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.225091] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 20040000
[   12.225094] CFAR: c000000000074738 IRQMASK: 0 
[   12.225094] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.225094] GPR04: c00a00008d32fd78 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.225094] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.225094] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.225094] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.225094] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.225094] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.225094] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d32fd78 
[   12.225104] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.225105] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.225105] Call Trace:
[   12.225127] [c000003fd78b7330] [c00800000f0a231c] nvbios_extend+0x7c/0xb0 [nouveau] (unreliable)
[   12.225129] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.225149] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.225170] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.225190] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.225210] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.225230] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.225251] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.225271] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.225291] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.225311] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.225340] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.225368] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.225397] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.225398] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.225400] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.225401] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.225402] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.225404] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.225406] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.225406] Instruction dump:
[   12.225407] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.225410] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.225413] ---[ end trace 2a6f56e64fb66e53 ]---
[   12.225429] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.225430] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.225435] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.225436] Workqueue: events work_for_cpu_fn
[   12.225437] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.225438] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.225439] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.225441] CFAR: c000000000074738 IRQMASK: 0 
[   12.225441] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.225441] GPR04: c00a00008d32fd7c 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.225441] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.225441] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.225441] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.225441] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.225441] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.225441] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d32fd7c 
[   12.225450] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.225451] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.225451] Call Trace:
[   12.225453] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.225454] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.225475] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.225496] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.225516] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.225536] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.225556] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.225576] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.225595] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.225615] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.225635] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.225664] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.225693] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.225722] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.225723] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.225724] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.225726] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.225727] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.225729] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.225730] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.225731] Instruction dump:
[   12.225732] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.225735] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.225738] ---[ end trace 2a6f56e64fb66e54 ]---
[   12.226043] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.226043] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.226048] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.226050] Workqueue: events work_for_cpu_fn
[   12.226051] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.226052] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.226052] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.226055] CFAR: c000000000074738 IRQMASK: 0 
[   12.226055] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.226055] GPR04: c00a00008d32ffd4 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.226055] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.226055] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.226055] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.226055] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.226055] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.226055] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d32ffd4 
[   12.226064] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.226065] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.226065] Call Trace:
[   12.226066] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.226068] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.226089] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.226109] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.226129] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.226150] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.226170] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.226190] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.226210] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.226230] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.226249] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.226278] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.226306] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.226335] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.226336] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.226337] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.226339] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.226340] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.226341] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.226343] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.226344] Instruction dump:
[   12.226345] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.226347] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.226350] ---[ end trace 2a6f56e64fb66e55 ]---
[   12.226698] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.226698] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.226703] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.226705] Workqueue: events work_for_cpu_fn
[   12.226706] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.226707] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.226707] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.226710] CFAR: c000000000074738 IRQMASK: 0 
[   12.226710] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.226710] GPR04: c00a00008d330284 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.226710] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.226710] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.226710] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.226710] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.226710] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.226710] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330284 
[   12.226718] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.226720] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.226720] Call Trace:
[   12.226721] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.226722] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.226743] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.226764] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.226784] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.226803] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.226824] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.226844] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.226864] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.226883] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.226903] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.226931] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.226959] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.226988] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.226989] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.226990] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.226992] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.226993] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.226994] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.226996] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.226997] Instruction dump:
[   12.226998] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.227000] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.227003] ---[ end trace 2a6f56e64fb66e56 ]---
[   12.227018] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.227019] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.227024] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.227025] Workqueue: events work_for_cpu_fn
[   12.227026] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.227027] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.227028] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.227030] CFAR: c000000000074738 IRQMASK: 0 
[   12.227030] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.227030] GPR04: c00a00008d330288 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.227030] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.227030] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.227030] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.227030] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.227030] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.227030] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330288 
[   12.227039] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.227040] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.227040] Call Trace:
[   12.227041] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.227043] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.227063] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.227084] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.227104] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.227124] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.227144] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.227164] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.227184] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.227204] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.227224] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.227253] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.227281] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.227309] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.227311] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.227312] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.227313] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.227314] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.227316] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.227318] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.227318] Instruction dump:
[   12.227319] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.227322] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.227324] ---[ end trace 2a6f56e64fb66e57 ]---
[   12.227340] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.227340] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.227345] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.227347] Workqueue: events work_for_cpu_fn
[   12.227348] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.227349] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.227349] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.227351] CFAR: c000000000074738 IRQMASK: 0 
[   12.227351] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.227351] GPR04: c00a00008d33028c 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.227351] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.227351] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.227351] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.227351] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.227351] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.227351] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d33028c 
[   12.227360] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.227361] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.227361] Call Trace:
[   12.227363] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.227364] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.227384] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.227404] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.227424] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.227443] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.227463] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.227483] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.227503] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.227523] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.227543] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.227571] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.227599] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.227628] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.227629] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.227630] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.227631] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.227633] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.227634] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.227636] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.227637] Instruction dump:
[   12.227637] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.227640] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.227643] ---[ end trace 2a6f56e64fb66e58 ]---
[   12.227658] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.227659] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.227664] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.227665] Workqueue: events work_for_cpu_fn
[   12.227666] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.227667] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.227668] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.227670] CFAR: c000000000074738 IRQMASK: 0 
[   12.227670] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.227670] GPR04: c00a00008d330290 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.227670] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.227670] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.227670] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.227670] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.227670] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.227670] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330290 
[   12.227679] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.227680] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.227680] Call Trace:
[   12.227681] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.227682] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.227703] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.227723] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.227743] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.227763] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.227783] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.227802] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.227822] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.227842] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.227861] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.227890] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.227918] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.227947] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.227948] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.227949] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.227950] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.227952] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.227953] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.227955] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.227955] Instruction dump:
[   12.227956] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.227959] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.227962] ---[ end trace 2a6f56e64fb66e59 ]---
[   12.227977] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.227977] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.227982] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.227984] Workqueue: events work_for_cpu_fn
[   12.227985] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.227985] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.227986] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.227988] CFAR: c000000000074738 IRQMASK: 0 
[   12.227988] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.227988] GPR04: c00a00008d330294 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.227988] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.227988] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.227988] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.227988] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.227988] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.227988] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330294 
[   12.227997] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.227998] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.227998] Call Trace:
[   12.227999] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.228001] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.228022] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.228042] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.228062] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.228082] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.228102] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.228122] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.228142] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.228162] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.228181] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.228210] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.228238] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.228267] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.228268] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.228269] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.228270] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.228272] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.228273] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.228275] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.228276] Instruction dump:
[   12.228276] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.228279] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.228282] ---[ end trace 2a6f56e64fb66e5a ]---
[   12.228297] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.228297] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.228302] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.228304] Workqueue: events work_for_cpu_fn
[   12.228305] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.228306] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.228306] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.228309] CFAR: c000000000074738 IRQMASK: 0 
[   12.228309] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.228309] GPR04: c00a00008d330298 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.228309] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.228309] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.228309] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.228309] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.228309] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.228309] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330298 
[   12.228317] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.228318] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.228319] Call Trace:
[   12.228320] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.228321] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.228342] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.228362] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.228383] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.228403] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.228423] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.228442] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.228462] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.228482] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.228502] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.228530] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.228559] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.228587] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.228588] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.228589] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.228591] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.228592] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.228593] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.228595] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.228596] Instruction dump:
[   12.228597] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.228599] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.228602] ---[ end trace 2a6f56e64fb66e5b ]---
[   12.228617] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.228618] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.228623] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.228624] Workqueue: events work_for_cpu_fn
[   12.228625] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.228626] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.228626] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.228629] CFAR: c000000000074738 IRQMASK: 0 
[   12.228629] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.228629] GPR04: c00a00008d33029c 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.228629] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.228629] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.228629] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.228629] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.228629] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.228629] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d33029c 
[   12.228637] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.228638] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.228639] Call Trace:
[   12.228640] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.228641] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.228662] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.228683] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.228703] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.228723] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.228743] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.228763] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.228783] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.228802] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.228822] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.228851] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.228879] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.228908] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.228909] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.228910] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.228911] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.228913] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.228914] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.228916] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.228917] Instruction dump:
[   12.228917] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.228920] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.228923] ---[ end trace 2a6f56e64fb66e5c ]---
[   12.228938] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.228938] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.228943] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.228945] Workqueue: events work_for_cpu_fn
[   12.228946] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.228947] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.228947] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.228949] CFAR: c000000000074738 IRQMASK: 0 
[   12.228949] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.228949] GPR04: c00a00008d3302a0 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.228949] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.228949] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.228949] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.228949] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.228949] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.228949] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302a0 
[   12.228958] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.228959] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.228959] Call Trace:
[   12.228961] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.228962] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.228982] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.229002] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.229023] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.229043] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.229063] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.229083] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.229103] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.229122] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.229142] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.229170] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.229199] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.229228] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.229229] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.229230] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.229231] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.229233] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.229234] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.229236] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.229236] Instruction dump:
[   12.229237] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.229240] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.229243] ---[ end trace 2a6f56e64fb66e5d ]---
[   12.229258] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.229258] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.229263] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.229265] Workqueue: events work_for_cpu_fn
[   12.229266] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.229267] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.229267] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.229269] CFAR: c000000000074738 IRQMASK: 0 
[   12.229269] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.229269] GPR04: c00a00008d3302a4 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.229269] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.229269] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.229269] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.229269] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.229269] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.229269] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302a4 
[   12.229278] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.229279] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.229279] Call Trace:
[   12.229280] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.229282] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.229303] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.229322] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.229343] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.229363] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.229382] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.229402] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.229422] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.229442] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.229461] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.229490] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.229518] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.229547] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.229549] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.229550] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.229551] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.229552] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.229554] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.229555] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.229556] Instruction dump:
[   12.229557] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.229560] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.229562] ---[ end trace 2a6f56e64fb66e5e ]---
[   12.229577] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.229578] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.229583] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.229584] Workqueue: events work_for_cpu_fn
[   12.229585] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.229586] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.229586] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.229589] CFAR: c000000000074738 IRQMASK: 0 
[   12.229589] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.229589] GPR04: c00a00008d3302a8 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.229589] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.229589] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.229589] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.229589] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.229589] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.229589] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302a8 
[   12.229597] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.229598] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.229599] Call Trace:
[   12.229600] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.229601] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.229622] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.229643] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.229664] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.229684] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.229704] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.229723] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.229743] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.229763] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.229783] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.229812] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.229840] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.229868] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.229870] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.229871] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.229872] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.229873] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.229875] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.229877] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.229877] Instruction dump:
[   12.229878] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.229881] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.229883] ---[ end trace 2a6f56e64fb66e5f ]---
[   12.229899] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.229899] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.229904] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.229905] Workqueue: events work_for_cpu_fn
[   12.229906] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.229907] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.229908] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.229910] CFAR: c000000000074738 IRQMASK: 0 
[   12.229910] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.229910] GPR04: c00a00008d3302ac 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.229910] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.229910] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.229910] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.229910] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.229910] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.229910] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302ac 
[   12.229919] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.229920] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.229920] Call Trace:
[   12.229921] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.229922] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.229943] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.229964] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.229985] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.230005] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.230025] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.230044] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.230065] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.230085] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.230105] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.230134] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.230162] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.230190] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.230191] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.230193] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.230194] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.230195] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.230197] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.230198] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.230199] Instruction dump:
[   12.230200] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.230203] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.230205] ---[ end trace 2a6f56e64fb66e60 ]---
[   12.230220] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.230221] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.230226] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.230227] Workqueue: events work_for_cpu_fn
[   12.230228] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.230229] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.230229] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.230232] CFAR: c000000000074738 IRQMASK: 0 
[   12.230232] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.230232] GPR04: c00a00008d3302b0 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.230232] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.230232] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.230232] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.230232] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.230232] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.230232] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302b0 
[   12.230240] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.230241] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.230242] Call Trace:
[   12.230243] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.230244] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.230265] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.230285] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.230305] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.230325] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.230345] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.230365] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.230385] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.230405] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.230425] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.230453] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.230481] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.230510] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.230511] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.230512] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.230514] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.230515] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.230516] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.230518] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.230519] Instruction dump:
[   12.230519] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.230522] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.230525] ---[ end trace 2a6f56e64fb66e61 ]---
[   12.230540] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.230540] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.230545] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.230547] Workqueue: events work_for_cpu_fn
[   12.230548] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.230549] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.230549] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.230552] CFAR: c000000000074738 IRQMASK: 0 
[   12.230552] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.230552] GPR04: c00a00008d3302b4 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.230552] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.230552] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.230552] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.230552] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.230552] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.230552] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302b4 
[   12.230560] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.230561] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.230561] Call Trace:
[   12.230562] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.230564] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.230585] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.230605] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.230625] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.230644] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.230664] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.230684] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.230704] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.230724] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.230744] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.230773] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.230801] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.230830] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.230831] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.230832] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.230834] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.230835] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.230836] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.230838] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.230839] Instruction dump:
[   12.230840] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.230842] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.230845] ---[ end trace 2a6f56e64fb66e62 ]---
[   12.230860] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.230861] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.230865] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.230867] Workqueue: events work_for_cpu_fn
[   12.230868] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.230869] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.230869] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.230872] CFAR: c000000000074738 IRQMASK: 0 
[   12.230872] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.230872] GPR04: c00a00008d3302b8 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.230872] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.230872] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.230872] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.230872] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.230872] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.230872] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302b8 
[   12.230880] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.230881] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.230882] Call Trace:
[   12.230883] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.230884] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.230905] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.230925] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.230946] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.230966] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.230985] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.231005] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.231025] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.231045] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.231065] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.231093] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.231122] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.231150] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.231152] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.231153] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.231154] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.231155] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.231157] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.231159] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.231159] Instruction dump:
[   12.231160] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.231163] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.231166] ---[ end trace 2a6f56e64fb66e63 ]---
[   12.231181] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.231181] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.231186] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.231188] Workqueue: events work_for_cpu_fn
[   12.231189] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.231190] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.231190] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.231192] CFAR: c000000000074738 IRQMASK: 0 
[   12.231192] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.231192] GPR04: c00a00008d3302bc 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.231192] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.231192] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.231192] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.231192] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.231192] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.231192] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302bc 
[   12.231201] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.231202] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.231202] Call Trace:
[   12.231204] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.231205] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.231226] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.231247] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.231267] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.231287] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.231307] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.231327] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.231347] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.231367] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.231387] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.231416] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.231444] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.231473] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.231474] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.231475] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.231477] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.231478] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.231479] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.231481] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.231482] Instruction dump:
[   12.231482] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.231485] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.231488] ---[ end trace 2a6f56e64fb66e64 ]---
[   12.231503] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.231503] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.231508] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.231510] Workqueue: events work_for_cpu_fn
[   12.231511] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.231512] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.231512] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.231514] CFAR: c000000000074738 IRQMASK: 0 
[   12.231514] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.231514] GPR04: c00a00008d3302c0 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.231514] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.231514] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.231514] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.231514] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.231514] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.231514] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302c0 
[   12.231523] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.231524] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.231524] Call Trace:
[   12.231525] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.231527] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.231547] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.231567] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.231588] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.231607] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.231627] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.231646] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.231666] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.231686] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.231706] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.231734] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.231763] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.231792] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.231793] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.231795] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.231796] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.231797] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.231799] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.231800] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.231801] Instruction dump:
[   12.231802] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.231805] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.231807] ---[ end trace 2a6f56e64fb66e65 ]---
[   12.231822] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.231823] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.231828] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.231829] Workqueue: events work_for_cpu_fn
[   12.231830] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.231831] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.231832] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.231834] CFAR: c000000000074738 IRQMASK: 0 
[   12.231834] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.231834] GPR04: c00a00008d3302c4 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.231834] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.231834] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.231834] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.231834] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.231834] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.231834] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302c4 
[   12.231842] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.231843] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.231844] Call Trace:
[   12.231845] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.231846] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.231868] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.231887] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.231908] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.231928] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.231948] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.231968] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.231987] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.232007] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.232027] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.232056] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.232084] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.232113] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.232114] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.232115] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.232117] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.232118] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.232120] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.232121] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.232122] Instruction dump:
[   12.232123] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.232125] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.232128] ---[ end trace 2a6f56e64fb66e66 ]---
[   12.232143] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.232144] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.232149] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.232150] Workqueue: events work_for_cpu_fn
[   12.232151] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.232152] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.232153] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.232155] CFAR: c000000000074738 IRQMASK: 0 
[   12.232155] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.232155] GPR04: c00a00008d3302c8 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.232155] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.232155] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.232155] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.232155] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.232155] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.232155] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302c8 
[   12.232163] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.232164] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.232165] Call Trace:
[   12.232166] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.232167] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.232188] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.232208] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.232229] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.232249] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.232268] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.232288] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.232308] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.232328] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.232348] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.232376] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.232405] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.232434] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.232435] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.232436] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.232437] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.232439] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.232440] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.232442] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.232443] Instruction dump:
[   12.232444] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.232446] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.232449] ---[ end trace 2a6f56e64fb66e67 ]---
[   12.232465] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.232465] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.232470] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.232472] Workqueue: events work_for_cpu_fn
[   12.232473] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.232474] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.232474] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.232476] CFAR: c000000000074738 IRQMASK: 0 
[   12.232476] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.232476] GPR04: c00a00008d3302cc 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.232476] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.232476] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.232476] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.232476] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.232476] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.232476] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302cc 
[   12.232485] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.232486] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.232486] Call Trace:
[   12.232487] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.232489] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.232509] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.232530] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.232550] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.232569] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.232590] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.232609] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.232629] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.232649] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.232669] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.232698] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.232726] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.232754] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.232756] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.232757] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.232758] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.232759] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.232761] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.232763] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.232763] Instruction dump:
[   12.232764] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.232767] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.232769] ---[ end trace 2a6f56e64fb66e68 ]---
[   12.232785] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.232785] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.232790] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.232792] Workqueue: events work_for_cpu_fn
[   12.232793] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.232793] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.232794] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.232796] CFAR: c000000000074738 IRQMASK: 0 
[   12.232796] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.232796] GPR04: c00a00008d3302d0 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.232796] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.232796] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.232796] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.232796] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.232796] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.232796] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302d0 
[   12.232805] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.232806] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.232806] Call Trace:
[   12.232807] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.232809] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.232829] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.232849] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.232869] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.232888] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.232908] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.232928] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.232947] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.232967] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.232987] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.233016] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.233044] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.233073] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.233074] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.233076] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.233077] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.233078] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.233080] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.233081] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.233082] Instruction dump:
[   12.233083] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.233085] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.233088] ---[ end trace 2a6f56e64fb66e69 ]---
[   12.233103] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.233104] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.233109] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.233110] Workqueue: events work_for_cpu_fn
[   12.233111] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.233112] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.233113] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.233115] CFAR: c000000000074738 IRQMASK: 0 
[   12.233115] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.233115] GPR04: c00a00008d3302d4 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.233115] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.233115] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.233115] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.233115] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.233115] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.233115] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302d4 
[   12.233124] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.233125] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.233125] Call Trace:
[   12.233126] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.233128] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.233148] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.233169] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.233189] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.233209] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.233230] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.233250] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.233270] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.233290] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.233310] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.233339] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.233367] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.233401] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.233403] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.233404] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.233405] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.233407] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.233408] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.233410] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.233411] Instruction dump:
[   12.233412] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.233414] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.233417] ---[ end trace 2a6f56e64fb66e6a ]---
[   12.233437] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.233438] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.233443] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.233444] Workqueue: events work_for_cpu_fn
[   12.233445] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.233446] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.233447] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.233449] CFAR: c000000000074738 IRQMASK: 0 
[   12.233449] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.233449] GPR04: c00a00008d3302d8 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.233449] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.233449] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.233449] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.233449] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.233449] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.233449] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302d8 
[   12.233457] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.233459] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.233459] Call Trace:
[   12.233460] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.233461] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.233482] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.233502] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.233522] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.233543] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.233564] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.233585] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.233607] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.233627] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.233649] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.233678] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.233708] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.233738] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.233740] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.233741] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.233743] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.233744] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.233746] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.233748] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.233748] Instruction dump:
[   12.233749] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.233752] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.233755] ---[ end trace 2a6f56e64fb66e6b ]---
[   12.233771] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.233771] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.233780] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.233781] Workqueue: events work_for_cpu_fn
[   12.233782] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.233783] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.233783] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.233786] CFAR: c000000000074738 IRQMASK: 0 
[   12.233786] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.233786] GPR04: c00a00008d3302dc 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.233786] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.233786] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.233786] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.233786] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.233786] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.233786] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302dc 
[   12.233797] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.233798] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.233802] Call Trace:
[   12.233804] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.233805] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.233825] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.233845] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.233865] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.233885] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.233905] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.233924] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.233944] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.233964] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.233984] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.234012] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.234041] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.234070] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.234071] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.234072] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.234073] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.234075] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.234076] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.234078] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.234078] Instruction dump:
[   12.234079] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.234082] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.234085] ---[ end trace 2a6f56e64fb66e6c ]---
[   12.234100] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.234100] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.234105] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.234107] Workqueue: events work_for_cpu_fn
[   12.234108] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.234109] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.234109] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.234112] CFAR: c000000000074738 IRQMASK: 0 
[   12.234112] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.234112] GPR04: c00a00008d3302e0 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.234112] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.234112] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.234112] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.234112] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.234112] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.234112] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302e0 
[   12.234121] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.234122] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.234122] Call Trace:
[   12.234123] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.234124] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.234145] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.234166] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.234188] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.234208] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.234230] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.234250] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.234272] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.234292] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.234314] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.234343] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.234372] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.234402] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.234405] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.234406] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.234407] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.234408] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.234410] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.234412] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.234412] Instruction dump:
[   12.234413] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.234416] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.234419] ---[ end trace 2a6f56e64fb66e6d ]---
[   12.234434] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.234435] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.234443] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.234445] Workqueue: events work_for_cpu_fn
[   12.234446] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.234447] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.234447] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.234449] CFAR: c000000000074738 IRQMASK: 0 
[   12.234449] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.234449] GPR04: c00a00008d3302e4 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.234449] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.234449] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.234449] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.234449] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.234449] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.234449] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302e4 
[   12.234459] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.234462] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.234462] Call Trace:
[   12.234463] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.234465] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.234485] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.234506] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.234528] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.234549] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.234570] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.234591] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.234612] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.234633] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.234655] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.234685] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.234715] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.234744] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.234747] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.234748] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.234749] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.234751] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.234752] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.234754] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.234754] Instruction dump:
[   12.234755] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.234758] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.234761] ---[ end trace 2a6f56e64fb66e6e ]---
[   12.234776] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.234777] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.234785] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.234787] Workqueue: events work_for_cpu_fn
[   12.234788] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.234789] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.234789] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.234792] CFAR: c000000000074738 IRQMASK: 0 
[   12.234792] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.234792] GPR04: c00a00008d3302e8 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.234792] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.234792] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.234792] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.234792] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.234792] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.234792] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302e8 
[   12.234803] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.234805] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.234806] Call Trace:
[   12.234807] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.234808] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.234829] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.234850] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.234872] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.234892] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.234914] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.234934] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.234956] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.234976] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.234998] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.235026] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.235056] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.235086] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.235088] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.235089] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.235091] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.235092] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.235094] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.235096] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.235096] Instruction dump:
[   12.235097] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.235100] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.235103] ---[ end trace 2a6f56e64fb66e6f ]---
[   12.235118] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.235119] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.235127] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.235129] Workqueue: events work_for_cpu_fn
[   12.235130] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.235130] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.235131] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.235133] CFAR: c000000000074738 IRQMASK: 0 
[   12.235133] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.235133] GPR04: c00a00008d3302ec 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.235133] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.235133] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.235133] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.235133] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.235133] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.235133] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302ec 
[   12.235146] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.235147] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.235148] Call Trace:
[   12.235149] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.235150] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.235171] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.235192] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.235214] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.235235] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.235257] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.235277] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.235298] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.235319] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.235340] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.235370] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.235399] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.235429] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.235432] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.235433] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.235434] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.235435] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.235437] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.235439] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.235439] Instruction dump:
[   12.235440] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.235443] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.235445] ---[ end trace 2a6f56e64fb66e70 ]---
[   12.235461] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.235462] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.235472] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.235473] Workqueue: events work_for_cpu_fn
[   12.235474] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.235475] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.235475] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.235478] CFAR: c000000000074738 IRQMASK: 0 
[   12.235478] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.235478] GPR04: c00a00008d3302f0 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.235478] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.235478] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.235478] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.235478] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.235478] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.235478] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302f0 
[   12.235487] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.235488] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.235489] Call Trace:
[   12.235490] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.235491] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.235512] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.235533] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.235553] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.235573] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.235594] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.235613] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.235633] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.235653] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.235673] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.235702] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.235730] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.235759] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.235761] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.235762] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.235765] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.235767] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.235768] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.235770] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.235770] Instruction dump:
[   12.235771] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.235774] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.235777] ---[ end trace 2a6f56e64fb66e71 ]---
[   12.235792] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.235793] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.235798] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.235800] Workqueue: events work_for_cpu_fn
[   12.235801] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.235802] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.235803] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.235805] CFAR: c000000000074738 IRQMASK: 0 
[   12.235805] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.235805] GPR04: c00a00008d3302f4 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.235805] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.235805] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.235805] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.235805] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.235805] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.235805] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302f4 
[   12.235815] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.235816] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.235818] Call Trace:
[   12.235819] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.235820] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.235841] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.235862] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.235884] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.235904] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.235926] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.235947] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.235968] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.235988] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.236009] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.236038] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.236068] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.236098] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.236101] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.236102] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.236103] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.236105] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.236106] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.236108] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.236108] Instruction dump:
[   12.236109] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.236112] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.236115] ---[ end trace 2a6f56e64fb66e72 ]---
[   12.236130] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.236131] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.236138] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.236139] Workqueue: events work_for_cpu_fn
[   12.236140] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.236141] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.236142] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.236144] CFAR: c000000000074738 IRQMASK: 0 
[   12.236144] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.236144] GPR04: c00a00008d3302f8 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.236144] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.236144] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.236144] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.236144] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.236144] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.236144] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302f8 
[   12.236157] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.236159] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.236160] Call Trace:
[   12.236161] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.236162] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.236183] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.236203] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.236225] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.236245] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.236266] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.236287] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.236308] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.236327] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.236350] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.236378] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.236408] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.236437] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.236440] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.236441] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.236442] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.236444] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.236445] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.236447] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.236448] Instruction dump:
[   12.236448] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.236451] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.236454] ---[ end trace 2a6f56e64fb66e73 ]---
[   12.236469] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.236470] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.236479] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.236481] Workqueue: events work_for_cpu_fn
[   12.236483] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.236483] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.236484] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.236486] CFAR: c000000000074738 IRQMASK: 0 
[   12.236486] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.236486] GPR04: c00a00008d3302fc 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.236486] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.236486] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.236486] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.236486] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.236486] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.236486] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d3302fc 
[   12.236496] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.236497] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.236498] Call Trace:
[   12.236499] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.236501] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.236521] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.236542] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.236564] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.236584] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.236605] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.236625] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.236646] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.236667] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.236688] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.236717] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.236746] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.236775] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.236778] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.236779] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.236781] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.236782] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.236783] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.236785] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.236786] Instruction dump:
[   12.236787] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.236789] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.236792] ---[ end trace 2a6f56e64fb66e74 ]---
[   12.237108] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.237108] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.237114] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.237115] Workqueue: events work_for_cpu_fn
[   12.237116] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.237117] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.237118] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.237120] CFAR: c000000000074738 IRQMASK: 0 
[   12.237120] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.237120] GPR04: c00a00008d330568 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.237120] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.237120] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.237120] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.237120] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.237120] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.237120] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330568 
[   12.237129] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.237130] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.237131] Call Trace:
[   12.237132] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.237133] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.237154] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.237174] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.237196] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.237217] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.237239] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.237259] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.237281] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.237301] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.237322] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.237351] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.237381] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.237410] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.237413] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.237414] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.237415] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.237417] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.237418] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.237420] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.237421] Instruction dump:
[   12.237421] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.237424] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.237427] ---[ end trace 2a6f56e64fb66e75 ]---
[   12.238547] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.238547] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.238552] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.238554] Workqueue: events work_for_cpu_fn
[   12.238555] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.238556] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.238556] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.238559] CFAR: c000000000074738 IRQMASK: 0 
[   12.238559] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.238559] GPR04: c00a00008d330e44 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.238559] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.238559] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.238559] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.238559] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.238559] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.238559] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330e44 
[   12.238577] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.238578] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.238579] Call Trace:
[   12.238580] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.238581] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.238602] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.238623] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.238644] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.238664] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.238686] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.238706] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.238727] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.238747] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.238769] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.238798] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.238828] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.238858] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.238861] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.238862] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.238863] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.238864] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.238866] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.238868] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.238868] Instruction dump:
[   12.238869] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.238872] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.238875] ---[ end trace 2a6f56e64fb66e76 ]---
[   12.238894] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.238895] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.238900] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.238902] Workqueue: events work_for_cpu_fn
[   12.238903] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.238904] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.238904] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.238906] CFAR: c000000000074738 IRQMASK: 0 
[   12.238906] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.238906] GPR04: c00a00008d330e50 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.238906] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.238906] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.238906] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.238906] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.238906] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.238906] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330e50 
[   12.238926] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.238927] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.238927] Call Trace:
[   12.238928] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.238930] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.238951] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.238972] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.238995] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.239015] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.239034] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.239054] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.239073] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.239093] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.239113] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.239142] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.239170] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.239200] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.239201] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.239202] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.239203] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.239205] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.239206] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.239208] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.239208] Instruction dump:
[   12.239209] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.239212] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.239215] ---[ end trace 2a6f56e64fb66e77 ]---
[   12.239234] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.239235] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.239240] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.239242] Workqueue: events work_for_cpu_fn
[   12.239244] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.239245] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.239245] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.239248] CFAR: c000000000074738 IRQMASK: 0 
[   12.239248] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.239248] GPR04: c00a00008d330e5c 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.239248] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.239248] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.239248] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.239248] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.239248] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.239248] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330e5c 
[   12.239257] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.239258] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.239259] Call Trace:
[   12.239260] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.239262] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.239283] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.239305] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.239326] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.239347] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.239368] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.239388] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.239409] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.239430] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.239451] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.239480] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.239509] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.239539] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.239541] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.239543] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.239544] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.239546] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.239547] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.239549] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.239550] Instruction dump:
[   12.239550] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.239553] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.239556] ---[ end trace 2a6f56e64fb66e78 ]---
[   12.239653] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.239654] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.239660] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.239663] Workqueue: events work_for_cpu_fn
[   12.239664] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.239665] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.239665] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.239667] CFAR: c000000000074738 IRQMASK: 0 
[   12.239667] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.239667] GPR04: c00a00008d330f08 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.239667] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.239667] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.239667] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.239667] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.239667] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.239667] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330f08 
[   12.239677] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.239678] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.239679] Call Trace:
[   12.239680] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.239683] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.239704] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.239724] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.239746] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.239766] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.239787] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.239807] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.239828] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.239848] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.239870] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.239899] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.239928] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.239958] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.239960] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.239961] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.239963] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.239964] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.239966] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.239967] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.239968] Instruction dump:
[   12.239969] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.239971] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.239974] ---[ end trace 2a6f56e64fb66e79 ]---
[   12.239992] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.239993] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.239999] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.240000] Workqueue: events work_for_cpu_fn
[   12.240001] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.240002] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.240002] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.240005] CFAR: c000000000074738 IRQMASK: 0 
[   12.240005] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.240005] GPR04: c00a00008d330f10 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.240005] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.240005] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.240005] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.240005] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.240005] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.240005] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330f10 
[   12.240020] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.240021] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.240021] Call Trace:
[   12.240022] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.240024] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.240045] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.240066] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.240087] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.240108] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.240129] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.240150] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.240171] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.240191] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.240213] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.240242] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.240271] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.240301] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.240304] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.240305] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.240307] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.240308] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.240309] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.240311] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.240312] Instruction dump:
[   12.240312] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.240315] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.240318] ---[ end trace 2a6f56e64fb66e7a ]---
[   12.240335] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.240336] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.240344] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.240345] Workqueue: events work_for_cpu_fn
[   12.240346] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.240347] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.240348] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.240350] CFAR: c000000000074738 IRQMASK: 0 
[   12.240350] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.240350] GPR04: c00a00008d330f18 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.240350] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.240350] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.240350] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.240350] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.240350] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.240350] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330f18 
[   12.240365] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.240366] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.240370] Call Trace:
[   12.240371] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.240372] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.240393] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.240413] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.240434] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.240454] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.240474] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.240493] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.240513] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.240533] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.240553] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.240582] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.240610] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.240639] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.240641] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.240642] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.240645] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.240646] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.240648] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.240649] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.240650] Instruction dump:
[   12.240651] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.240653] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.240656] ---[ end trace 2a6f56e64fb66e7b ]---
[   12.240673] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.240674] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.240681] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.240683] Workqueue: events work_for_cpu_fn
[   12.240684] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.240684] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.240685] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.240687] CFAR: c000000000074738 IRQMASK: 0 
[   12.240687] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.240687] GPR04: c00a00008d330f20 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.240687] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.240687] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.240687] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.240687] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.240687] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.240687] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330f20 
[   12.240698] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.240700] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.240701] Call Trace:
[   12.240702] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.240703] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.240724] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.240745] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.240767] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.240787] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.240809] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.240830] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.240851] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.240871] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.240892] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.240921] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.240951] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.240980] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.240983] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.240984] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.240985] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.240986] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.240988] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.240990] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.240990] Instruction dump:
[   12.240991] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.240994] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.240997] ---[ end trace 2a6f56e64fb66e7c ]---
[   12.241015] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0
[   12.241016] Modules linked in: sd_mod nouveau(+) ast(+) i2c_algo_bit drm_kms_helper ahci syscopyarea sysfillrect libahci sysimgblt fb_sys_fops ttm libata drm mlx5_core(+) drm_panel_orientation_quirks tg3(+) ptp nvme pps_core nvme_core
[   12.241022] CPU: 0 PID: 2487 Comm: kworker/0:4 Tainted: G        W         5.2.0-rc6+ #1
[   12.241023] Workqueue: events work_for_cpu_fn
[   12.241024] NIP:  c000000000043f08 LR: c000000000043eec CTR: c0000000005c2430
[   12.241025] REGS: c000003fd78b70a0 TRAP: 0700   Tainted: G        W          (5.2.0-rc6+)
[   12.241025] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84444028  XER: 00000000
[   12.241028] CFAR: c000000000074738 IRQMASK: 0 
[   12.241028] GPR00: 00000000ae012000 c000003fd78b7330 c00000000144a200 c000203fff654348 
[   12.241028] GPR04: c00a00008d330f28 0000000000000000 c000003fd78b7354 0000000000000015 
[   12.241028] GPR08: c000203fff654348 0000000000000001 0000000000000001 4000000000000000 
[   12.241028] GPR12: 0000000000000005 c000000001890000 c0000000001510b8 c000003fefca4ec0 
[   12.241028] GPR16: 0000000400040000 0000000000000000 0000000000000001 0000000000000001 
[   12.241028] GPR20: c000003febbd50b0 0000000000000002 0000000000000000 0000000040000000 
[   12.241028] GPR24: 0000000040000000 0000000040000000 0000000000011000 c000003fc7c77000 
[   12.241028] GPR28: c000003fe6b32a80 0000000000031400 c000003f6d1c0000 c00a00008d330f28 
[   12.241037] NIP [c000000000043f08] eeh_check_failure+0x68/0xf0
[   12.241038] LR [c000000000043eec] eeh_check_failure+0x4c/0xf0
[   12.241039] Call Trace:
[   12.241040] [c000003fd78b7330] [c000000000043f34] eeh_check_failure+0x94/0xf0 (unreliable)
[   12.241043] [c000003fd78b7370] [c0000000005c2530] ioread32+0x100/0x170
[   12.241063] [c000003fd78b73a0] [c00800000f0b7008] prom_read+0x78/0xf0 [nouveau]
[   12.241084] [c000003fd78b73f0] [c00800000f0b5bb0] shadow_fetch.isra.1+0x90/0x120 [nouveau]
[   12.241106] [c000003fd78b7440] [c00800000f0b5d68] shadow_image+0x128/0x360 [nouveau]
[   12.241126] [c000003fd78b74f0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.241147] [c000003fd78b75a0] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.241167] [c000003fd78b7650] [c00800000f0b5dfc] shadow_image+0x1bc/0x360 [nouveau]
[   12.241189] [c000003fd78b7700] [c00800000f0b6040] shadow_method+0xa0/0x1a0 [nouveau]
[   12.241209] [c000003fd78b7780] [c00800000f0b6338] nvbios_shadow+0x1f8/0x3f0 [nouveau]
[   12.241230] [c000003fd78b7910] [c00800000f0a23e8] nvkm_bios_new+0x98/0x530 [nouveau]
[   12.241259] [c000003fd78b79b0] [c00800000f134810] nvkm_device_ctor+0x1610/0x4120 [nouveau]
[   12.241288] [c000003fd78b7aa0] [c00800000f137cb0] nvkm_device_pci_new+0x180/0x3d0 [nouveau]
[   12.241318] [c000003fd78b7b80] [c00800000f1a13a0] nouveau_drm_probe+0x220/0x360 [nouveau]
[   12.241320] [c000003fd78b7bd0] [c0000000006112ec] local_pci_probe+0x6c/0x100
[   12.241322] [c000003fd78b7c50] [c0000000001430f8] work_for_cpu_fn+0x38/0x60
[   12.241323] [c000003fd78b7c80] [c000000000148118] process_one_work+0x1c8/0x4a0
[   12.241324] [c000003fd78b7d20] [c000000000148668] worker_thread+0x278/0x570
[   12.241326] [c000003fd78b7db0] [c000000000151210] kthread+0x160/0x1a0
[   12.241328] [c000003fd78b7e20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
[   12.241328] Instruction dump:
[   12.241329] e8690040 e92d1178 f9210028 39200000 48030631 60000000 2c230000 4182008c 
[   12.241332] 81410024 7d4a0034 554ad97e 694a0001 <0b0a0000> 7d201c28 7bff0420 79295d24 
[   12.241335] ---[ end trace 2a6f56e64fb66e7d ]---
[   12.241354] WARNING: CPU: 0 PID: 2487 at arch/powerpc/kernel/eeh.c:357 eeh_check_failure+0x68/0xf0

--Apple-Mail=_B540750B-9A34-490C-936C-792C6A5D64B1--

