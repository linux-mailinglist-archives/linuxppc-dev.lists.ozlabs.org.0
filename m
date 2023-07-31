Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED9D769923
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 16:12:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YIedBBej;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF0ZF58FYz3cC7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 00:12:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YIedBBej;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF0YJ6P45z2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 00:12:04 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VE94Sf015567;
	Mon, 31 Jul 2023 14:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 mime-version : subject : message-id : date : cc : to; s=pp1;
 bh=qGoiYS1thpXK4pygbZatBS83Vh7SufgViLXTPotdQSM=;
 b=YIedBBejx1ojbmX3ZGX0sf1AlG8kRHBoC8vJNrDRFyV1LU1zkq0bASHJofYATnIfEmUJ
 0LesexrIDmbebgBFjNQmCSBAsEhV2aMPhLBX0IU+H/rfEu4NNSjS+mZGZB3WO3pKETJa
 RvsVrOkTOM58t4s654PUW/viKKG59cjGq4vYPYMQjzJiF3jTpWTKpiWvy07lkjlj4Z6K
 wvpUi6UeBM1pgZxT1GUzvX8b3fRbe0jnyotBZTMX+VlF0o8jl5WCne1e7aLIPgXAGB3q
 IL78tiiII9VgR42NsBaMPswGSDIfZdBqvFgOVMZ3uRyQTq2tzW7lyl9iUwrKq5rltunZ 6w== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6dsesek8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 14:11:54 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36VCxV6s014530;
	Mon, 31 Jul 2023 14:10:02 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5ft12ycn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 14:10:01 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36VE9wNx16056888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Jul 2023 14:09:58 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A22542004B;
	Mon, 31 Jul 2023 14:09:58 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5570420040;
	Mon, 31 Jul 2023 14:09:56 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.67.116])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Jul 2023 14:09:56 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_2656C3F6-8440-442C-BEDB-E948DF81289F"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: [next-20230731] Kdump fails to capture vmcore (powerpc)
Message-Id: <F996AB3C-400E-447A-B142-9CB3600BCDD8@linux.ibm.com>
Date: Mon, 31 Jul 2023 19:39:44 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mm@kvack.org
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EFo1NlUzpds5R9M0AJE6QjMvfAK156cL
X-Proofpoint-ORIG-GUID: EFo1NlUzpds5R9M0AJE6QjMvfAK156cL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_06,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307310126
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_2656C3F6-8440-442C-BEDB-E948DF81289F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Kernel Crash dump(kdump) and firmware assisted dump on powerpc
fails to capture vmcore on recent linux-next builds.

Starting Kdump Vmcore Save Service...
systemd[1]: Starting Kdump Vmcore Save Service...
kdump[599]: Kdump is using the default log level(3).
kdump[635]: saving to /sysroot/var/crash/127.0.0.1-2023-07-31-09:01:28/
kdump[639]: Remounting the dump target in rw mode.
kdump[643]: saving vmcore-dmesg.txt to =
/sysroot/var/crash/127.0.0.1-2023-07-31-09:01:28/
kdump[649]: saving vmcore-dmesg.txt complete
kdump[651]: saving vmcore
kdump.sh[652]: readpage_elf: Attempt to read non-existent page at =
0x4000000000000000.
kdump.sh[652]: readmem: type_addr: 0, addr:0, size:8
kdump.sh[652]: get_vmemmap_list_info: Can't get vmemmap region addresses
kdump.sh[652]: get_machdep_info_ppc64: Can't get vmemmap list info.
kdump.sh[652]: makedumpfile Failed.
kdump[654]: saving vmcore failed, exitcode:1
kdump[656]: saving the /run/initramfs/kexec-dmesg.log to =
/sysroot/var/crash/127.0.0.1-2023-07-31-09:01:28//
kdump[663]: saving vmcore failed
systemd[1]: kdump-capture.service: Main process exited, code=3Dexited, =
status=3D1/FAILURE
systemd[1]: kdump-capture.service: Failed with result 'exit-code'.
systemd[1]: Failed to start Kdump Vmcore Save Service.
[FAILED] Failed to start Kdump Vmcore Save Service.

Git bisect points to following patch:

8dc9a0ad0c3e7f43e4e091e4e24634e21ce17a54 is the first bad commit
commit 8dc9a0ad0c3e7f43e4e091e4e24634e21ce17a54
    powerpc/book3s64/vmemmap: switch radix to use a different vmemmap =
handling function

Have attached the kdump log.

-Sachin


--Apple-Mail=_2656C3F6-8440-442C-BEDB-E948DF81289F
Content-Disposition: attachment;
	filename=kdump.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="kdump.txt"
Content-Transfer-Encoding: quoted-printable

OF stdout device is: /vdevice/vty@30000000
Preparing to boot Linux version 6.5.0-rc4-next-20230731 =
(root@ltcden8-lp8.aus.stglabs.ibm.com) (gcc (GCC) 11.3.1 20221121 (Red =
Hat 11.3.1-4), GNU ld version 2.35.2-39.el9) #16 SMP Mon Jul 31 08:57:57 =
CDT 2023
Detected machine type: 0000000000000101
command line: =
BOOT_IMAGE=3D(ieee1275//vdevice/v-scsi@3000006c/disk@8100000000000000,msdo=
s2)/vmlinuz-6.5.0-rc4-next-20230731 =
root=3DUUID=3Df9147eae-d3ac-44c4-875d-162ec95a7528 ro crashkernel=3D3072M =
fadump=3Don biosdevname=3D0 selinux=3D0
Max number of cores passed to firmware: 256 (NR_CPUS =3D 2048)
Calling ibm,client-architecture-support... done
memory layout at init:
  memory_limit : 0000000000000000 (16 MB aligned)
  alloc_bottom : 0000000015230000
  alloc_top    : 0000000020000000
  alloc_top_hi : 0000000020000000
  rmo_top      : 0000000020000000
  ram_top      : 0000000020000000
instantiating rtas at 0x000000001ec20000... done
instantiating sml at 0x000000001ec10000... done
prom_hold_cpus: skipped
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x0000000015240000 -> 0x00000000152419cf
Device tree struct  0x0000000015250000 -> 0x0000000015260000
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x000000000e550000 ...
[    0.000000] rtas fadump: Firmware-assisted dump is active.
[    0.000000] fadump: Firmware-assisted dump is active.
[    0.000000] fadump: Reserving 58368MB of memory at 0x000000c0000000 =
for preserving crash data
[    0.000000] radix-mmu: Page sizes from device-tree:
[    0.000000] radix-mmu: Page size shift =3D 12 AP=3D0x0
[    0.000000] radix-mmu: Page size shift =3D 16 AP=3D0x5
[    0.000000] radix-mmu: Page size shift =3D 21 AP=3D0x1
[    0.000000] radix-mmu: Page size shift =3D 30 AP=3D0x2
[    0.000000] Activating Kernel Userspace Access Prevention
[    0.000000] Activating Kernel Userspace Execution Prevention
[    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000002640000 =
with 64.0 KiB pages (exec)
[    0.000000] radix-mmu: Mapped 0x0000000002640000-0x0000000f00000000 =
with 64.0 KiB pages
[    0.000000] lpar: Using radix MMU under hypervisor
[    0.000000] Linux version 6.5.0-rc4-next-20230731 =
(root@ltcden8-lp8.aus.stglabs.ibm.com) (gcc (GCC) 11.3.1 20221121 (Red =
Hat 11.3.1-4), GNU ld version 2.35.2-39.el9) #16 SMP Mon Jul 31 08:57:57 =
CDT 2023
[    0.000000] Found initrd at 0xc000000011500000:0xc00000001522c688
[    0.000000] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Partition configured for 128 cpus.
[    0.000000] CPU maps initialized for 8 threads per core
[    0.000000] numa: Partition configured for 32 NUMA nodes.
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     =3D 0xf00000000
[    0.000000] dcache_bsize      =3D 0x80
[    0.000000] icache_bsize      =3D 0x80
[    0.000000] cpu_features      =3D 0x001c00eb8f5f9187
[    0.000000]   possible        =3D 0x001ffbfbcf5fb187
[    0.000000]   always          =3D 0x0000000380008181
[    0.000000] cpu_user_features =3D 0xdc0065c2 0xaef60000
[    0.000000] mmu_features      =3D 0xbc007641
[    0.000000] firmware_features =3D 0x00001dbfc45bfc57
[    0.000000] vmalloc start     =3D 0xc008000000000000
[    0.000000] IO start          =3D 0xc00a000000000000
[    0.000000] vmemmap start     =3D 0xc00c000000000000
[    0.000000] -----------------------------------------------------
[    0.000000] numa:   NODE_DATA [mem 0x47112e80-0x4711a67f]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] count-cache-flush: hardware flush enabled.
[    0.000000] link-stack-flush: software flush enabled.
[    0.000000] stf-barrier: eieio barrier available
[    0.000000] PPC64 nvram contains 15360 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000000effffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000effffffff]
[    0.000000] Initmem setup node 0 [mem =
0x0000000000000000-0x0000000effffffff]
[    0.000000] Initializing node 1 as memoryless
[    0.000000] Initmem setup node 1 as memoryless
[    0.000000] Initializing node 2 as memoryless
[    0.000000] Initmem setup node 2 as memoryless
[    0.000000] Initializing node 3 as memoryless
[    0.000000] Initmem setup node 3 as memoryless
[    0.000000] Initializing node 4 as memoryless
[    0.000000] Initmem setup node 4 as memoryless
[    0.000000] Initializing node 5 as memoryless
[    0.000000] Initmem setup node 5 as memoryless
[    0.000000] Initializing node 6 as memoryless
[    0.000000] Initmem setup node 6 as memoryless
[    0.000000] Initializing node 7 as memoryless
[    0.000000] Initmem setup node 7 as memoryless
[    0.000000] Initializing node 8 as memoryless
[    0.000000] Initmem setup node 8 as memoryless
[    0.000000] Initializing node 9 as memoryless
[    0.000000] Initmem setup node 9 as memoryless
[    0.000000] Initializing node 10 as memoryless
[    0.000000] Initmem setup node 10 as memoryless
[    0.000000] Initializing node 11 as memoryless
[    0.000000] Initmem setup node 11 as memoryless
[    0.000000] Initializing node 12 as memoryless
[    0.000000] Initmem setup node 12 as memoryless
[    0.000000] Initializing node 13 as memoryless
[    0.000000] Initmem setup node 13 as memoryless
[    0.000000] Initializing node 14 as memoryless
[    0.000000] Initmem setup node 14 as memoryless
[    0.000000] Initializing node 15 as memoryless
[    0.000000] Initmem setup node 15 as memoryless
[    0.000000] Initializing node 16 as memoryless
[    0.000000] Initmem setup node 16 as memoryless
[    0.000000] Initializing node 17 as memoryless
[    0.000000] Initmem setup node 17 as memoryless
[    0.000000] Initializing node 18 as memoryless
[    0.000000] Initmem setup node 18 as memoryless
[    0.000000] Initializing node 19 as memoryless
[    0.000000] Initmem setup node 19 as memoryless
[    0.000000] Initializing node 20 as memoryless
[    0.000000] Initmem setup node 20 as memoryless
[    0.000000] Initializing node 21 as memoryless
[    0.000000] Initmem setup node 21 as memoryless
[    0.000000] Initializing node 22 as memoryless
[    0.000000] Initmem setup node 22 as memoryless
[    0.000000] Initializing node 23 as memoryless
[    0.000000] Initmem setup node 23 as memoryless
[    0.000000] Initializing node 24 as memoryless
[    0.000000] Initmem setup node 24 as memoryless
[    0.000000] Initializing node 25 as memoryless
[    0.000000] Initmem setup node 25 as memoryless
[    0.000000] Initializing node 26 as memoryless
[    0.000000] Initmem setup node 26 as memoryless
[    0.000000] Initializing node 27 as memoryless
[    0.000000] Initmem setup node 27 as memoryless
[    0.000000] Initializing node 28 as memoryless
[    0.000000] Initmem setup node 28 as memoryless
[    0.000000] Initializing node 29 as memoryless
[    0.000000] Initmem setup node 29 as memoryless
[    0.000000] Initializing node 30 as memoryless
[    0.000000] Initmem setup node 30 as memoryless
[    0.000000] Initializing node 31 as memoryless
[    0.000000] Initmem setup node 31 as memoryless
[    0.000000] percpu: Embedded 10 pages/cpu s606888 r0 d48472 u655360
[    0.000000] Kernel command line: =
BOOT_IMAGE=3D(ieee1275//vdevice/v-scsi@3000006c/disk@8100000000000000,msdo=
s2)/vmlinuz-6.5.0-rc4-next-20230731 =
root=3DUUID=3Df9147eae-d3ac-44c4-875d-162ec95a7528 ro crashkernel=3D3072M =
fadump=3Don biosdevname=3D0 selinux=3D0
[    0.000000] Unknown kernel command line parameters =
"BOOT_IMAGE=3D(ieee1275//vdevice/v-scsi@3000006c/disk@8100000000000000,msd=
os2)/vmlinuz-6.5.0-rc4-next-20230731 biosdevname=3D0", will be passed to =
user space.
[    0.000000] random: crng init done
[    0.000000] Dentry cache hash table entries: 131072 (order: 4, =
1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 3, 524288 =
bytes, linear)
[    0.000000] Fallback order for Node 0: 0=20
[    0.000000] Fallback order for Node 1: 1 0=20
[    0.000000] Fallback order for Node 2: 2 0=20
[    0.000000] Fallback order for Node 3: 3 0=20
[    0.000000] Fallback order for Node 4: 4 0=20
[    0.000000] Fallback order for Node 5: 5 0=20
[    0.000000] Fallback order for Node 6: 6 0=20
[    0.000000] Fallback order for Node 7: 7 0=20
[    0.000000] Fallback order for Node 8: 8 0=20
[    0.000000] Fallback order for Node 9: 9 0=20
[    0.000000] Fallback order for Node 10: 10 0=20
[    0.000000] Fallback order for Node 11: 11 0=20
[    0.000000] Fallback order for Node 12: 12 0=20
[    0.000000] Fallback order for Node 13: 13 0=20
[    0.000000] Fallback order for Node 14: 14 0=20
[    0.000000] Fallback order for Node 15: 15 0=20
[    0.000000] Fallback order for Node 16: 16 0=20
[    0.000000] Fallback order for Node 17: 17 0=20
[    0.000000] Fallback order for Node 18: 18 0=20
[    0.000000] Fallback order for Node 19: 19 0=20
[    0.000000] Fallback order for Node 20: 20 0=20
[    0.000000] Fallback order for Node 21: 21 0=20
[    0.000000] Fallback order for Node 22: 22 0=20
[    0.000000] Fallback order for Node 23: 23 0=20
[    0.000000] Fallback order for Node 24: 24 0=20
[    0.000000] Fallback order for Node 25: 25 0=20
[    0.000000] Fallback order for Node 26: 26 0=20
[    0.000000] Fallback order for Node 27: 27 0=20
[    0.000000] Fallback order for Node 28: 28 0=20
[    0.000000] Fallback order for Node 29: 29 0=20
[    0.000000] Fallback order for Node 30: 30 0=20
[    0.000000] Fallback order for Node 31: 31 0=20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: =
982080
[    0.000000] Policy zone: Normal
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 836608K/62914560K available (16384K kernel code, =
5632K rwdata, 16384K rodata, 6400K init, 2793K bss, 62077952K reserved, =
0K cma-reserved)
[    0.000000] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, =
CPUs=3D128, Nodes=3D32
[    0.000000] ftrace: allocating 41776 entries in 16 pages
[    0.000000] ftrace: allocated 16 pages with 1 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D2048 to =
nr_cpu_ids=3D128.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay =
is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, =
nr_cpu_ids=3D128
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] xive: Using IRQ range [400000-40007f]
[    0.000000] xive: Interrupt handling initialized with spapr backend
[    0.000000] xive: Using priority 7 for all interrupts
[    0.000000] xive: Using 64kB queues
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes to big.
[    0.000001] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.000016] clocksource: timebase: mask: 0xffffffffffffffff =
max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000043] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000415] kfence: initialized - using 33554432 bytes for 255 =
objects at 0x(____ptrval____)-0x(____ptrval____)
[    0.000582] Console: colour dummy device 80x25
[    0.000597] printk: console [hvc0] enabled
[    0.000597] printk: console [hvc0] enabled
[    0.000608] printk: bootconsole [udbg0] disabled
[    0.000608] printk: bootconsole [udbg0] disabled
[    0.000721] pid_max: default: 131072 minimum: 1024
[    0.000946] LSM: initializing =
lsm=3Dlockdown,capability,yama,bpf,integrity
[    0.001017] Yama: becoming mindful.
[    0.001025] LSM support for eBPF active
[    0.001110] Mount-cache hash table entries: 8192 (order: 0, 65536 =
bytes, linear)
[    0.001118] Mountpoint-cache hash table entries: 8192 (order: 0, =
65536 bytes, linear)
[    0.002499] RCU Tasks Rude: Setting shift to 7 and lim to 1 =
rcu_task_cb_adjust=3D1.
[    0.002520] RCU Tasks Trace: Setting shift to 7 and lim to 1 =
rcu_task_cb_adjust=3D1.
[    0.002544] POWER10 performance monitor hardware support registered
[    0.002573] rcu: Hierarchical SRCU implementation.
[    0.002575] rcu: 	Max phase no-delay instances is 1000.
[    0.003461] smp: Bringing up secondary CPUs ...
[    0.009325] smp: Brought up 1 node, 32 CPUs
[    0.009337] numa: Node 0 CPUs: 0-31
[    0.009342] Big cores detected but using small core scheduling
[    0.011860] devtmpfs: initialized
[    0.014364] PCI host bridge /pci@800000020000012  ranges:
[    0.014373]  MEM 0x0000040100000000..0x000004017effffff -> =
0x0000000080000000=20
[    0.014378]  MEM 0x000004c000000000..0x000004ffffffffff -> =
0x0006220000000000=20
[    0.014396] PCI host bridge /pci@800000020000013  ranges:
[    0.014401]  MEM 0x0000040080000000..0x00000400feffffff -> =
0x0000000080000000=20
[    0.014404]  MEM 0x0000048000000000..0x000004bfffffffff -> =
0x0006200000000000=20
[    0.014417] PCI host bridge /pci@800000020000014  ranges:
[    0.014421]  MEM 0x0000040000000000..0x000004007effffff -> =
0x0000000080000000=20
[    0.014424]  MEM 0x0000044000000000..0x0000047fffffffff -> =
0x0006320000000000=20
[    0.014481] clocksource: jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.014487] futex hash table entries: 32768 (order: 6, 4194304 bytes, =
linear)
[    0.015151] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.015385] audit: initializing netlink subsys (disabled)
[    0.015443] audit: type=3D2000 audit(1690812084.010:1): =
state=3Dinitialized audit_enabled=3D0 res=3D1
[    0.015507] thermal_sys: Registered thermal governor 'fair_share'
[    0.015509] thermal_sys: Registered thermal governor 'step_wise'
[    0.015558] cpuidle: using governor menu
[    0.015703] HugeTLB support is disabled!
[    0.015934] pstore: Using crash dump compression: deflate
[    0.015937] pstore: Registered nvram as persistent store backend
[    0.016318] EEH: pSeries platform initialized
[    0.016434] plpks: POWER LPAR Platform KeyStore is not supported or =
enabled
[    0.021572] kprobes: kprobe jump-optimization is enabled. All kprobes =
are optimized if possible.
[    0.021816] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 =
pages
[    0.021820] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
[    0.046093] cryptd: max_cpu_qlen set to 1000
[    0.046408] iommu: Default domain type: Translated
[    0.046411] iommu: DMA domain TLB invalidation policy: strict mode
[    0.046541] SCSI subsystem initialized
[    0.046565] usbcore: registered new interface driver usbfs
[    0.046572] usbcore: registered new interface driver hub
[    0.046592] usbcore: registered new device driver usb
[    0.046611] pps_core: LinuxPPS API ver. 1 registered
[    0.046613] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 =
Rodolfo Giometti <giometti@linux.it>
[    0.046618] PTP clock support registered
[    0.046697] EDAC MC: Ver: 3.0.0
[    0.046888] NetLabel: Initializing
[    0.046891] NetLabel:  domain hash size =3D 128
[    0.046893] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.046907] NetLabel:  unlabeled traffic allowed by default
[    0.047793] PCI: Probing PCI hardware
[    0.047834] PCI host bridge to bus 0012:01
[    0.047837] pci_bus 0012:01: Unknown NUMA node; performance will be =
reduced
[    0.047841] pci_bus 0012:01: root bus resource [mem =
0x40100000000-0x4017effffff] (bus address [0x80000000-0xfeffffff])
[    0.047846] pci_bus 0012:01: root bus resource [mem =
0x4c000000000-0x4ffffffffff 64bit] (bus address =
[0x6220000000000-0x6223fffffffff])
[    0.047850] pci_bus 0012:01: root bus resource [bus 01-ff]
[    0.052646] IOMMU table initialized, virtual merging enabled
[    0.052682] PCI host bridge to bus 0013:01
[    0.052685] pci_bus 0013:01: Unknown NUMA node; performance will be =
reduced
[    0.052688] pci_bus 0013:01: root bus resource [mem =
0x40080000000-0x400feffffff] (bus address [0x80000000-0xfeffffff])
[    0.052692] pci_bus 0013:01: root bus resource [mem =
0x48000000000-0x4bfffffffff 64bit] (bus address =
[0x6200000000000-0x6203fffffffff])
[    0.052696] pci_bus 0013:01: root bus resource [bus 01-ff]
[    0.057536] PCI host bridge to bus 0014:01
[    0.057539] pci_bus 0014:01: Unknown NUMA node; performance will be =
reduced
[    0.057542] pci_bus 0014:01: root bus resource [mem =
0x40000000000-0x4007effffff] (bus address [0x80000000-0xfeffffff])
[    0.057546] pci_bus 0014:01: root bus resource [mem =
0x44000000000-0x47fffffffff 64bit] (bus address =
[0x6320000000000-0x6323fffffffff])
[    0.057550] pci_bus 0014:01: root bus resource [bus 01-ff]
[    0.062360] EEH: No capable adapters found: recovery disabled.
[    0.062422] vgaarb: loaded
[    0.062624] clocksource: Switched to clocksource timebase
[    0.070637] VFS: Disk quotas dquot_6.6.0
[    0.070682] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 =
bytes)
[    0.072167] NET: Registered PF_INET protocol family
[    0.072204] IP idents hash table entries: 16384 (order: 1, 131072 =
bytes, linear)
[    0.072729] tcp_listen_portaddr_hash hash table entries: 4096 (order: =
0, 65536 bytes, linear)
[    0.072740] Table-perturb hash table entries: 65536 (order: 2, 262144 =
bytes, linear)
[    0.072796] TCP established hash table entries: 8192 (order: 0, 65536 =
bytes, linear)
[    0.072810] TCP bind hash table entries: 8192 (order: 2, 262144 =
bytes, linear)
[    0.072831] TCP: Hash tables configured (established 8192 bind 8192)
[    0.073030] MPTCP token hash table entries: 4096 (order: 0, 98304 =
bytes, linear)
[    0.073052] UDP hash table entries: 2048 (order: 0, 65536 bytes, =
linear)
[    0.073060] UDP-Lite hash table entries: 2048 (order: 0, 65536 bytes, =
linear)
[    0.073207] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.073215] NET: Registered PF_XDP protocol family
[    0.073220] PCI: CLS 0 bytes, default 128
[    0.073268] Trying to unpack rootfs image as initramfs...
[    0.087602] vio_register_device_node: node lid missing 'reg'
[    0.087750] vas: GZIP feature is available
[    0.088851] hv-24x7: read 548 catalog entries, created 387 event =
attrs (0 failures), 387 descs
[    0.095330] Initialise system trusted keyrings
[    0.095450] workingset: timestamp_bits=3D38 max_order=3D14 =
bucket_order=3D0
[    0.095476] zbud: loaded
[    0.103889] NET: Registered PF_ALG protocol family
[    0.103908] Key type asymmetric registered
[    0.103912] Asymmetric key parser 'x509' registered
[    0.400373] Freeing initrd memory: 62592K
[    0.402888] Block layer SCSI generic (bsg) driver version 0.4 loaded =
(major 245)
[    0.402948] io scheduler mq-deadline registered
[    0.402951] io scheduler kyber registered
[    0.402969] io scheduler bfq registered
[    0.404246] atomic64_test: passed
[    0.404454] shpchp: Standard Hot Plug PCI Controller Driver version: =
0.4
[    0.404457] PowerPC PowerNV PCI Hotplug Driver version: 0.1
[    0.404703] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.405164] tpm_ibmvtpm 30000003: CRQ initialization completed
[    1.436901] rdac: device handler registered
[    1.436933] hp_sw: device handler registered
[    1.436936] emc: device handler registered
[    1.436976] alua: device handler registered
[    1.437136] usbcore: registered new interface driver =
usbserial_generic
[    1.437142] usbserial: USB Serial support registered for generic
[    1.437165] mousedev: PS/2 mouse device common for all mice
[    1.437213] rtc-generic rtc-generic: registered as rtc0
[    1.437231] rtc-generic rtc-generic: setting system clock to =
2023-07-31T14:01:26 UTC (1690812086)
[    1.437294] xcede: xcede_record_size =3D 10
[    1.437297] xcede: Record 0 : hint =3D 1, latency =3D 0x1800 tb =
ticks, Wake-on-irq =3D 1
[    1.437300] xcede: Record 1 : hint =3D 2, latency =3D 0x3c00 tb =
ticks, Wake-on-irq =3D 0
[    1.437303] cpuidle: Skipping the 2 Extended CEDE idle states
[    1.437305] cpuidle: Fixed up CEDE exit latency to 12 us
[    1.438255] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: =
max_sync_size new:65536 old:0
[    1.438260] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: =
max_sync_sg new:510 old:0
[    1.438263] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: =
max_sg_len new:4080 old:0
[    1.438318] hid: raw HID events driver (C) Jiri Kosina
[    1.438335] usbcore: registered new interface driver usbhid
[    1.438338] usbhid: USB HID core driver
[    1.438363] drop_monitor: Initializing network drop monitor service
[    1.438432] Initializing XFRM netlink socket
[    1.438484] NET: Registered PF_INET6 protocol family
[    1.438877] Segment Routing with IPv6
[    1.438883] In-situ OAM (IOAM) with IPv6
[    1.438900] NET: Registered PF_PACKET protocol family
[    1.438922] mpls_gso: MPLS GSO support
[    1.438964] secvar-sysfs: Failed to retrieve secvar operations
[    1.440071] registered taskstats version 1
[    1.441166] Loading compiled-in X.509 certificates
[    1.449350] Loaded X.509 cert 'Build time autogenerated kernel key: =
30605ad6e8600e9dfc35dc713fba848168c58686'
[    1.450839] page_owner is disabled
[    1.450852] Key type big_key registered
[    1.452514] Key type trusted registered
[    1.454302] Key type encrypted registered
[    1.454326] Secure boot mode disabled
[    1.454331] Loading compiled-in module X.509 certificates
[    1.454801] Loaded X.509 cert 'Build time autogenerated kernel key: =
30605ad6e8600e9dfc35dc713fba848168c58686'
[    1.454805] ima: Allocated hash algorithm: sha256
[    1.465632] Secure boot mode disabled
[    1.465645] Trusted boot mode disabled
[    1.465647] ima: No architecture policies found
[    1.465658] evm: Initialising EVM extended attributes:
[    1.465660] evm: security.selinux
[    1.465662] evm: security.SMACK64 (disabled)
[    1.465664] evm: security.SMACK64EXEC (disabled)
[    1.465666] evm: security.SMACK64TRANSMUTE (disabled)
[    1.465668] evm: security.SMACK64MMAP (disabled)
[    1.465670] evm: security.apparmor (disabled)
[    1.465672] evm: security.ima
[    1.465673] evm: security.capability
[    1.465675] evm: HMAC attrs: 0x1
[    1.465712] alg: No test for 842 (842-nx)
[    1.590023] clk: Disabling unused clocks
[    1.591300] Freeing unused kernel image (initmem) memory: 6400K
[    1.665298] Checked W+X mappings: passed, no W+X pages found
[    1.665325] Run /init as init process
[    1.709784] systemd[1]: systemd 252-15.el9 running in system mode =
(+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP +GCRYPT +GNUTLS =
+OPENSSL +ACL +BLKID +CURL +ELFUTILS -FIDO2 +IDN2 -IDN -IPTC +KMOD =
+LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +TPM2 =
+BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT =
default-hierarchy=3Dunified)
[    1.709800] systemd[1]: Detected virtualization powervm.
[    1.709806] systemd[1]: Detected architecture ppc64-le.
[    1.709810] systemd[1]: Running in initrd.

Welcome to Red Hat Enterprise Linux 9.3 Beta (Plow) =
dracut-057-21.git20230214.el9 (Initramfs)!

[    1.709911] systemd[1]: Hostname set to =
<ltcden8-lp8.aus.stglabs.ibm.com>.
[    1.789243] systemd-fstab-generator[362]: Failed to create unit file =
'/run/systemd/generator/sysroot.mount', as it already exists. Duplicate =
entry in '/etc/fstab'?
[    1.789463] systemd[359]: =
/usr/lib/systemd/system-generators/systemd-fstab-generator failed with =
exit status 1.
[    1.808243] systemd[1]: =
/usr/lib/systemd/system/kdump-capture.service:23: Standard output type =
syslog is obsolete, automatically updating to journal. Please update =
your unit file, and consider removing the setting altogether.
[    1.808260] systemd[1]: =
/usr/lib/systemd/system/kdump-capture.service:24: Standard output type =
syslog+console is obsolete, automatically updating to journal+console. =
Please update your unit file, and consider removing the setting =
altogether.
[    1.819199] systemd[1]: Queued start job for default target Initrd =
Default Target.
[    1.819366] systemd[1]: Started Dispatch Password Requests to Console =
Directory Watch.
[  OK  ] Started Dispatch Password =E2=80=A6ts to Console Directory =
Watch.
[    1.819512] systemd[1]: Reached target Initrd /usr File System.
[  OK  ] Reached target Initrd /usr File System.
[    1.819561] systemd[1]: Reached target Local File Systems.
[  OK  ] Reached target Local File Systems.
[    1.819603] systemd[1]: Reached target Path Units.
[  OK  ] Reached target Path Units.
[    1.819654] systemd[1]: Reached target Slice Units.
[  OK  ] Reached target Slice Units.
[    1.819699] systemd[1]: Reached target Swaps.
[  OK  ] Reached target Swaps.
[    1.819743] systemd[1]: Reached target Timer Units.
[  OK  ] Reached target Timer Units.
[    1.819851] systemd[1]: Listening on Journal Socket (/dev/log).
[  OK  ] Listening on Journal Socket (/dev/log).
[    1.819955] systemd[1]: Listening on Journal Socket.
[  OK  ] Listening on Journal Socket.
[    1.820067] systemd[1]: Listening on udev Control Socket.
[  OK  ] Listening on udev Control Socket.
[    1.820156] systemd[1]: Listening on udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[    1.820201] systemd[1]: Reached target Socket Units.
[  OK  ] Reached target Socket Units.
[    1.822070] systemd[1]: Starting Create List of Static Device =
Nodes...
         Starting Create List of Static Device Nodes...
[    1.823594] systemd[1]: Starting Journal Service...
         Starting Journal Service...
[    1.824567] systemd[1]: Starting Load Kernel Modules...
         Starting Load Kernel Modules...
[    1.825421] systemd[1]: Starting Setup Virtual Console...
         Starting Setup Virtual Console...
[    1.825863] systemd[1]: Finished Create List of Static Device Nodes.
[  OK  ] Finished Create List of Static Device Nodes.
[    1.826802] systemd[1]: Starting Create Static Device Nodes in =
/dev...
         Starting Create Static Device Nodes in /dev...
[    1.827921] fuse: module verification failed: signature and/or =
required key missing - tainting kernel
[    1.830943] systemd[1]: Finished Create Static Device Nodes in /dev.
[  OK  ] Finished Create Static Device Nodes in /dev.
[    1.835246] systemd[1]: Started Journal Service.
[  OK  ] Started Journal Service.
         Starting Create Volatile Files and Directories...
[    1.833800] systemd[1]: Starting Create Volatile Files and =
Directories...
[    1.847112] fuse: init (API version 7.38)
[    1.844779] systemd-modules-load[398]: Inserted module 'fuse'
[  OK  ] Finished Load Kernel Modules.
[    1.845059] systemd[1]: Finished Load Kernel Modules.
[    1.845943] systemd[1]: Starting Apply Kernel Variables...
         Starting Apply Kernel Variables...
[  OK  ] Finished Setup Virtual Console.
[    1.846385] systemd[1]: Finished Setup Virtual Console.
         Starting dracut ask for additional cmdline parameters...
[    1.847317] systemd[1]: Starting dracut ask for additional cmdline =
parameters...
[  OK  ] Finished Create Volatile Files and Directories.
[    1.847539] systemd[1]: Finished Create Volatile Files and =
Directories.
[  OK  ] Finished Apply Kernel Variables.
[    1.849246] systemd[1]: Finished Apply Kernel Variables.
[    1.867352] systemd[1]: Finished dracut ask for additional cmdline =
parameters.
[  OK  ] Finished dracut ask for additional cmdline parameters.
[    1.868350] systemd[1]: Starting dracut cmdline hook...
         Starting dracut cmdline hook...
[    1.874773] dracut-cmdline[425]: dracut-9.3 (Plow) =
dracut-057-21.git20230214.el9
[    1.876220] dracut-cmdline[425]: Using kernel command line =
parameters:  root=3DUUID=3Df9147eae-d3ac-44c4-875d-162ec95a7528 =
rootfstype=3Dxfs =
rootflags=3Drw,relatime,attr2,inode64,logbufs=3D8,logbsize=3D32k,noquota =
  =
BOOT_IMAGE=3D(ieee1275//vdevice/v-scsi@3000006c/disk@8100000000000000,msdo=
s2)/vmlinuz-6.5.0-rc4-next-20230731 =
root=3DUUID=3Df9147eae-d3ac-44c4-875d-162ec95a7528 ro crashkernel=3D3072M =
fadump=3Don biosdevname=3D0 selinux=3D0
[    1.888210] systemd[1]: Finished dracut cmdline hook.
[  OK  ] Finished dracut cmdline hook.
[    1.889260] systemd[1]: Starting dracut pre-udev hook...
         Starting dracut pre-udev hook...
[    1.898511] systemd[1]: Finished dracut pre-udev hook.
[  OK  ] Finished dracut pre-udev hook.
[    1.899569] systemd[1]: Starting Rule-based Manager for Device Events =
and Files...
         Starting Rule-based Manage=E2=80=A6for Device Events and =
Files...
[    1.912520] systemd-udevd[487]: Using default interface naming scheme =
'rhel-9.0'.
[    1.914238] systemd[1]: Started Rule-based Manager for Device Events =
and Files.
[  OK  ] Started Rule-based Manager for Device Events and Files.
[    1.914353] systemd[1]: dracut pre-trigger hook was skipped because =
no trigger condition checks were met.
[    1.915175] systemd[1]: Starting Coldplug All udev Devices...
         Starting Coldplug All udev Devices...
[    1.988975] synth uevent: /devices/vio: failed to send uevent
[    1.988984] vio vio: uevent: failed to send synthetic uevent: -19
[    1.986555] udevadm[494]: vio: Failed to write 'add' to =
'/sys/devices/vio/uevent', ignoring: No such device
[    1.987473] systemd[1]: sys-module-fuse.device: Failed to enqueue =
SYSTEMD_WANTS=3D job, ignoring: Unit sys-fs-fuse-connections.mount not =
found.
[    1.995111] synth uevent: /devices/vio/4000: failed to send uevent
[    1.995117] vio 4000: uevent: failed to send synthetic uevent: -19
[    1.995136] synth uevent: /devices/vio/4001: failed to send uevent
[    1.995139] vio 4001: uevent: failed to send synthetic uevent: -19
[    1.995153] synth uevent: /devices/vio/4002: failed to send uevent
[    1.995157] vio 4002: uevent: failed to send synthetic uevent: -19
[    1.995168] synth uevent: /devices/vio/4004: failed to send uevent
[    1.995171] vio 4004: uevent: failed to send synthetic uevent: -19
[    1.992556] udevadm[494]: 4000: Failed to write 'add' to =
'/sys/devices/vio/4000/uevent', ignoring: No such device
[    1.992707] udevadm[494]: 4001: Failed to write 'add' to =
'/sys/devices/vio/4001/uevent', ignoring: No such device
[    1.992783] udevadm[494]: 4002: Failed to write 'add' to =
'/sys/devices/vio/4002/uevent', ignoring: No such device
[    1.992853] udevadm[494]: 4004: Failed to write 'add' to =
'/sys/devices/vio/4004/uevent', ignoring: No such device
[  OK  ] Finished Coldplug All udev Devices.
[    1.993899] systemd[1]: Finished Coldplug All udev Devices.
[  OK  ] Reached target System Initialization.
[    1.995165] systemd[1]: Reached target System Initialization.
[  OK  ] Reached target Basic System.
[    1.995230] systemd[1]: Reached target Basic System.
[    1.996272] systemd[1]: Starting dracut initqueue hook...
         Starting dracut initqueue hook...
[    2.030645] ibmvscsi 3000006c: SRP_VERSION: 16.a
[    2.030703] ibmvscsi 3000006c: Maximum ID: 64 Maximum LUN: 32 Maximum =
Channel: 3
[    2.030708] scsi host0: IBM POWER Virtual SCSI Adapter 1.5.9
[    2.030851] ibmvscsi 3000006c: partner initialization complete
[    2.030871] ibmvscsi 3000006c: host srp version: 16.a, host partition =
ltcden8-vios1 (100), OS 3, max io 262144
[    2.030904] ibmvscsi 3000006c: Client reserve enabled
[    2.030909] ibmvscsi 3000006c: sent SRP login
[    2.030941] ibmvscsi 3000006c: SRP_LOGIN succeeded
[    2.062847] scsi 0:0:1:0: Direct-Access     AIX      VDASD            =
0001 PQ: 0 ANSI: 3
[    2.063096] scsi 0:0:2:0: CD-ROM            AIX      VOPTA            =
     PQ: 0 ANSI: 4
[    2.082957] scsi 0:0:1:0: Attached scsi generic sg0 type 0
[    2.082987] scsi 0:0:2:0: Attached scsi generic sg1 type 5
[    2.089688] sr 0:0:2:0: [sr0] scsi-1 drive
[    2.089694] cdrom: Uniform CD-ROM driver Revision: 3.20
[    2.094173] sd 0:0:1:0: [sda] 26214400 4096-byte logical blocks: (107 =
GB/100 GiB)
[    2.094202] sd 0:0:1:0: [sda] Write Protect is off
[    2.094227] sd 0:0:1:0: [sda] Cache data unavailable
[    2.094232] sd 0:0:1:0: [sda] Assuming drive cache: write through
[    2.095949]  sda: sda1 sda2 sda3 sda4 < sda5 sda6 >
[    2.096129] sd 0:0:1:0: [sda] Attached SCSI disk
[    2.114701] systemd[1]: Found device VDASD 2.
[  OK  ] Found device VDASD 2.
[  OK  ] Found device VDASD 3.
[    2.118436] systemd[1]: Found device VDASD 3.
[    2.120504] systemd[1]: Reached target Initrd Root Device.
[  OK  ] Reached target Initrd Root Device.
[    2.131038] systemd[1]: Finished dracut initqueue hook.
[  OK  ] Finished dracut initqueue hook.
[    2.131150] systemd[1]: Reached target Preparation for Remote File =
Systems.
[  OK  ] Reached target Preparation for Remote File Systems.
[    2.131201] systemd[1]: Reached target Remote File Systems.
[  OK  ] Reached target Remote File Systems.
[    2.131270] systemd[1]: dracut pre-mount hook was skipped because no =
trigger condition checks were met.
         Starting File System Check=E2=80=A6d3ac-44c4-875d-162ec95a7528...=

[    2.220226] systemd[1]: Starting File System Check on =
/dev/disk/by-uuid/f9147eae-d3ac-44c4-875d-162ec95a7528...
[    2.224301] systemd-fsck[558]: /usr/sbin/fsck.xfs: XFS file system.
[    2.224711] systemd[1]: Finished File System Check on =
/dev/disk/by-uuid/f9147eae-d3ac-44c4-875d-162ec95a7528.
[  OK  ] Finished File System Check=E2=80=A6e-d3ac-44c4-875d-162ec95a7528.=

         Mounting /sysroot...
[    2.860241] systemd[1]: Mounting /sysroot...
[    3.093933] SGI XFS with ACLs, security attributes, scrub, quota, no =
debug enabled
[    3.095675] XFS (sda3): Mounting V5 Filesystem =
f9147eae-d3ac-44c4-875d-162ec95a7528
[    3.201620] XFS (sda3): Starting recovery (logdev: internal)
[    3.319312] XFS (sda3): Ending recovery (logdev: internal)
[    3.317593] systemd[1]: Mounted /sysroot.
[  OK  ] Mounted /sysroot.
[    3.317722] systemd[1]: Reached target Initrd Root File System.
[  OK  ] Reached target Initrd Root File System.
         Starting Mountpoints Configured in the Real Root...
[    3.380165] systemd[1]: Starting Mountpoints Configured in the Real =
Root...
[    3.387989] systemd[1]: initrd-parse-etc.service: Deactivated =
successfully.
[    3.388123] systemd[1]: Finished Mountpoints Configured in the Real =
Root.
[  OK  ] Finished Mountpoints Configured in the Real Root.
[    3.388263] systemd[1]: Reached target Initrd File Systems.
[  OK  ] Reached target Initrd File Systems.
[    3.388339] systemd[1]: Reached target Initrd Default Target.
[  OK  ] Reached target Initrd Default Target.
[    3.388414] systemd[1]: dracut mount hook was skipped because no =
trigger condition checks were met.
[    3.389316] systemd[1]: Starting dracut pre-pivot and cleanup hook...
         Starting dracut pre-pivot and cleanup hook...
[  OK  ] Finished dracut pre-pivot and cleanup hook.
[    3.397265] systemd[1]: Finished dracut pre-pivot and cleanup hook.
         Starting Kdump Vmcore Save Service...
[    3.398217] systemd[1]: Starting Kdump Vmcore Save Service...
[    3.408204] kdump[599]: Kdump is using the default log level(3).
[    3.426352] kdump[635]: saving to =
/sysroot/var/crash/127.0.0.1-2023-07-31-09:01:28/
[    3.428846] kdump[639]: Remounting the dump target in rw mode.
[    3.432897] kdump[643]: saving vmcore-dmesg.txt to =
/sysroot/var/crash/127.0.0.1-2023-07-31-09:01:28/
[    3.438898] kdump[649]: saving vmcore-dmesg.txt complete
[    3.440087] kdump[651]: saving vmcore
[    3.442524] kdump.sh[652]: readpage_elf: Attempt to read non-existent =
page at 0x4000000000000000.
[    3.442592] kdump.sh[652]: readmem: type_addr: 0, addr:0, size:8
[    3.442655] kdump.sh[652]: get_vmemmap_list_info: Can't get vmemmap =
region addresses
[    3.442725] kdump.sh[652]: get_machdep_info_ppc64: Can't get vmemmap =
list info.
[    3.442800] kdump.sh[652]: makedumpfile Failed.
[    3.443770] kdump[654]: saving vmcore failed, exitcode:1
[    3.444996] kdump[656]: saving the /run/initramfs/kexec-dmesg.log to =
/sysroot/var/crash/127.0.0.1-2023-07-31-09:01:28//
[    3.453087] kdump[663]: saving vmcore failed
[    3.453351] systemd[1]: kdump-capture.service: Main process exited, =
code=3Dexited, status=3D1/FAILURE
[    3.453443] systemd[1]: kdump-capture.service: Failed with result =
'exit-code'.
[    3.453575] systemd[1]: Failed to start Kdump Vmcore Save Service.
[FAILED] Failed to start Kdump Vmcore Save Service.
See 'systemctl status kdump-capture.service' for details.
[    3.453676] systemd[1]: kdump-capture.service: Triggering OnFailure=3D =
dependencies.
[  OK  ] Stopped target Timer Units.
[    3.454022] systemd[1]: Stopped target Timer Units.
[    3.454105] systemd[1]: dracut-pre-udev.service: Deactivated =
successfully.
[  OK  ] Stopped dracut pre-udev hook.
[    3.454180] systemd[1]: Stopped dracut pre-udev hook.
[    3.454263] systemd[1]: dracut-cmdline.service: Deactivated =
successfully.
[  OK  ] Stopped dracut cmdline hook.
[    3.454338] systemd[1]: Stopped dracut cmdline hook.
[    3.454414] systemd[1]: dracut-cmdline-ask.service: Deactivated =
successfully.
[  OK  ] Stopped dracut ask for additional cmdline parameters.
[    3.454488] systemd[1]: Stopped dracut ask for additional cmdline =
parameters.
[    3.454590] systemd[1]: dracut-pre-pivot.service: Deactivated =
successfully.
[  OK  ] Stopped dracut pre-pivot and cleanup hook.
[    3.454671] systemd[1]: Stopped dracut pre-pivot and cleanup hook.
[    3.454742] systemd[1]: Stopped target Initrd Default Target.
[  OK  ] Stopped target Initrd Default Target.
[    3.454813] systemd[1]: Stopped target Basic System.
[  OK  ] Stopped target Basic System.
[    3.454880] systemd[1]: Stopped target Initrd File Systems.
[  OK  ] Stopped target Initrd File Systems.
[  OK  ] Stopped target Initrd Root File System.
[    3.454946] systemd[1]: Stopped target Initrd Root File System.
[  OK  ] Stopped target Initrd /usr File System.
[    3.455018] systemd[1]: Stopped target Initrd /usr File System.
[  OK  ] Stopped target Path Units.
[    3.455104] systemd[1]: Stopped target Path Units.
[    3.455167] systemd[1]: systemd-ask-password-console.path: =
Deactivated successfully.
[    3.490076] systemd[1]: Stopped Dispatch Password Requests to Console =
Directory Watch.
[  OK  ] Stopped Dispatch Password =E2=80=A6ts to Console Directory =
Watch.
[  OK  ] Stopped target Remote File Systems.
[    3.490145] systemd[1]: Stopped target Remote File Systems.
[  OK  ] Stopped target Preparation for Remote File Systems.
[    3.490217] systemd[1]: Stopped target Preparation for Remote File =
Systems.
[  OK  ] Stopped target Slice Units.
[    3.490308] systemd[1]: Stopped target Slice Units.
[  OK  ] Stopped target Socket Units.
[    3.490370] systemd[1]: Stopped target Socket Units.
[  OK  ] Stopped target System Initialization.
[    3.490435] systemd[1]: Stopped target System Initialization.
[  OK  ] Stopped target Swaps.
[    3.490499] systemd[1]: Stopped target Swaps.
[    3.490862] systemd[1]: Unmounting /sysroot...
         Unmounting /sysroot...
[    3.490942] systemd[1]: dracut-initqueue.service: Deactivated =
successfully.
[  OK  ] Stopped dracut initqueue hook.
[    3.491101] systemd[1]: Stopped dracut initqueue hook.
[    3.491991] systemd[1]: Starting Kdump Error Handler...
         Starting Kdump [    3.494603] XFS (sda3): Unmounting Filesystem =
f9147eae-d3ac-44c4-875d-162ec95a7528
Error Handler...
[    3.492080] systemd[1]: systemd-sysctl.service: Deactivated =
successfully.
[  OK  ] Stopped Apply Kernel Variables.
[    3.492163] systemd[1]: Stopped Apply Kernel Variables.
[    3.492334] systemd[1]: systemd-modules-load.service: Deactivated =
successfully.
[  OK  ] Stopped Load Kernel Modules.
[    3.492394] systemd[1]: Stopped Load Kernel Modules.
[    3.492463] systemd[1]: systemd-tmpfiles-setup-dev.service: =
Deactivated successfully.
[  OK  ] Stopped Create Static Device Nodes in /dev.
[    3.492531] systemd[1]: Stopped Create Static Device Nodes in /dev.
[    3.492657] systemd[1]: kmod-static-nodes.service: Deactivated =
successfully.
[  OK  ] Stopped Create List of Static Device Nodes.
[    3.492720] systemd[1]: Stopped Create List of Static Device Nodes.
[    3.492794] systemd[1]: systemd-tmpfiles-setup.service: Deactivated =
successfully.
[  OK  ] Stopped Create Volatile Files and Directories.
[    3.492858] systemd[1]: Stopped Create Volatile Files and =
Directories.
[  OK  ] Stopped target Local File Systems.
[    3.492975] systemd[1]: Stopped target Local File Systems.
[    3.493030] systemd[1]: systemd-udev-trigger.service: Deactivated =
successfully.
[  OK  ] Stopped Coldplug All udev Devices.
[    3.493091] systemd[1]: Stopped Coldplug All udev Devices.
[    3.493154] systemd[1]: systemd-udevd-control.socket: Deactivated =
successfully.
[  OK  ] Closed udev Control Socket.
[    3.493209] systemd[1]: Closed udev Control Socket.
[    3.493281] systemd[1]: systemd-udevd-kernel.socket: Deactivated =
successfully.
[  OK  ] Closed udev Kernel Socket.
[    3.493339] systemd[1]: Closed udev Kernel Socket.
[    3.493499] systemd[1]: =
run-credentials-systemd\x2dsysctl.service.mount: Deactivated =
successfully.
[    3.493577] systemd[1]: =
run-credentials-systemd\x2dtmpfiles\x2dsetup.service.mount: Deactivated =
successfully.
[    3.493651] systemd[1]: =
run-credentials-systemd\x2dtmpfiles\x2dsetup\x2ddev.service.mount: =
Deactivated successfully.
[    3.493969] systemd[1]: sysroot.mount: Deactivated successfully.
[  OK  ] Unmounted /sysroot.
[    3.494120] systemd[1]: Unmounted /sysroot.
[    3.494268] systemd[1]: systemd-fsck-root.service: Deactivated =
successfully.
[  OK  ] Stopped File System Check =E2=80=A6e-d3ac-44c4-875d-162ec95a7528.=

[    3.494326] systemd[1]: Stopped File System Check on =
/dev/disk/by-uuid/f9147eae-d3ac-44c4-875d-162ec95a7528.
[  OK  ] Stopped target Initrd Root Device.
[    3.494402] systemd[1]: Stopped target Initrd Root Device.
[    3.502280] kdump[678]: Kdump is using the default log level(3).
[    3.505899] kdump[683]: Executing failure action systemctl reboot -f
[    3.509339] systemd[1]: Shutting down.
[    3.510828] kdump[686]: Executing final action systemctl reboot -f
Failed to execute operation: Transport endpoint is not connected
[    3.575126] systemd-shutdown[1]: Syncing filesystems and block =
devices.
[    3.575318] systemd-shutdown[1]: Sending SIGTERM to remaining =
processes...
[    3.579467] systemd-journald[397]: Received SIGTERM from PID 1 =
(systemd-shutdow).
[    3.613416] systemd-shutdown[1]: Sending SIGKILL to remaining =
processes...
[    3.616697] systemd-shutdown[1]: Unmounting file systems.
[    3.616788] systemd-shutdown[1]: All filesystems unmounted.
[    3.616793] systemd-shutdown[1]: Deactivating swaps.
[    3.616806] systemd-shutdown[1]: All swaps deactivated.
[    3.616810] systemd-shutdown[1]: Detaching loop devices.
[    3.616913] systemd-shutdown[1]: All loop devices detached.
[    3.616917] systemd-shutdown[1]: Stopping MD devices.
[    3.616960] systemd-shutdown[1]: All MD devices stopped.
[    3.616965] systemd-shutdown[1]: Detaching DM devices.
[    3.617006] systemd-shutdown[1]: All DM devices detached.
[    3.617010] systemd-shutdown[1]: All filesystems, swaps, loop =
devices, MD devices and DM devices detached.
[    3.617547] systemd-shutdown[1]: Syncing filesystems and block =
devices.
[    3.617733] systemd-shutdown[1]: Rebooting.
[    3.619047] reboot: Restarting system

--Apple-Mail=_2656C3F6-8440-442C-BEDB-E948DF81289F--

