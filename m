Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D199730D31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 04:24:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SPR5yJYQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhR2G71tfz30h9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 12:24:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SPR5yJYQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhR1M69NHz304M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 12:23:51 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F2HTXS005684;
	Thu, 15 Jun 2023 02:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=u2WmvoaaNS7qzj0jkOTzXWnXWo5yYBuLTZ2jchOr+Sw=;
 b=SPR5yJYQlzvP4w47nPGOSMUAwV5u2x++GE1TRgWpj9J7IAX4rVHDyUcCiFLlPpC5CJNM
 /XaUFvpMjGKkHZGdqou5pxN9t5Zfy9Pt6iUk+mUZToS7SrP41HHe+BxlgRdQgRY0kqOd
 SZeYvj7PXuO5lkk0XvDQEpR/aR2CkoXXr5iX9Noq07Xe6Tkk4ZnIzy5+5Au6+kn5fb1t
 NWNhBAoZnNMFz5TwPB/n1W1WgikgR7axBJBMXZD4/fqDzefo44uI6MNO6wNY/axsl3Ut
 aEetnfzGUQrJZZEO2IJZuFxos8jiy2o5QeI8PkpTZS5h5+17NL3fwIZs0DjcW/cOAdgz gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r7sqtr3e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 02:23:31 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35F2Jg0n015079;
	Thu, 15 Jun 2023 02:23:31 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r7sqtr3dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 02:23:31 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35F0x9SM012038;
	Thu, 15 Jun 2023 02:23:30 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3r4gt6ef3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 02:23:30 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35F2NSg435193572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 02:23:28 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 947AF5805F;
	Thu, 15 Jun 2023 02:23:28 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8A7158059;
	Thu, 15 Jun 2023 02:23:23 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.95.192])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jun 2023 02:23:23 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [PATCH 14/16] powerpc/book3s64/vmemmap: Switch radix to use a
 different vmemmap handling function
In-Reply-To: <8D29C151-B9A0-4046-8A5D-56F8A9BEA68F@linux.ibm.com>
References: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
 <20230606045608.55127-15-aneesh.kumar@linux.ibm.com>
 <8D29C151-B9A0-4046-8A5D-56F8A9BEA68F@linux.ibm.com>
Date: Thu, 15 Jun 2023 07:53:20 +0530
Message-ID: <87r0qdbh0n.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LNz00hYgzCf9GxzqBjqP-3NbWPJsJOKM
X-Proofpoint-ORIG-GUID: 45kbGOIeTqYi2nWw6DvuE0Ru9h2uRMKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_14,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306150016
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
Cc: Joao Martins <joao.m.martins@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mm@kvack.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>, Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.ibm.com> writes:

>> 1. First try to map things using PMD (2M)
>> 2. With altmap if altmap cross-boundary check returns true, fall back to=
 PAGE_SIZE
>> 3. IF we can't allocate PMD_SIZE backing memory for vmemmap, fallback to=
 PAGE_SIZE
>>=20
>> On removing vmemmap mapping, check if every subsection that is using the=
 vmemmap
>> area is invalid. If found to be invalid, that implies we can safely free=
 the
>> vmemmap area. We don't use the PAGE_UNUSED pattern used by x86 because w=
ith 64K
>> page size, we need to do the above check even at the PAGE_SIZE granulari=
ty.
>>=20
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>
> With this patch series applied I see the following warning
>
> [  OK  ] Started Monitoring of LVM2 mirrors,=E2=80=A6sing dmeventd or pro=
gress polling.
> [    3.283884] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: nvdim=
m pmu didn't register rc=3D-2
> [    3.284212] papr_scm ibm,persistent-memory:ibm,pmemory@44104002: nvdim=
m pmu didn't register rc=3D-2
> [    3.563890] radix-mmu: Mapped 0x0000040010000000-0x0000040c90000000 wi=
th 64.0 KiB pages
> [    3.703227] ------------[ cut here ]------------
> [    3.703236] failed to free all reserved pages
> [    3.703244] WARNING: CPU: 41 PID: 923 at mm/memremap.c:152 memunmap_pa=
ges+0x37c/0x3a0
> [    3.703252] Modules linked in: device_dax(+) nd_pmem nd_btt dax_pmem p=
apr_scm libnvdimm pseries_rng vmx_crypto aes_gcm_p10_crypto ext4 mbcache jb=
d2 sd_mod t10_pi crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp ibmvet=
h fuse
> [    3.703272] CPU: 41 PID: 923 Comm: systemd-udevd Not tainted 6.4.0-rc6=
-00037-gb6dad5178cea-dirty #1
> [    3.703276] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf0000=
06 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
> [    3.703280] NIP:  c00000000057a18c LR: c00000000057a188 CTR: 000000000=
05ca81c
> [    3.703283] REGS: c000000032a170d0 TRAP: 0700   Not tainted  (6.4.0-rc=
6-00037-gb6dad5178cea-dirty)
> [    3.703286] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48248824  XER: 00000002
> [    3.703296] CFAR: c00000000015f0c0 IRQMASK: 0  [    3.703296] GPR00: c=
00000000057a188 c000000032a17370 c000000001421500 0000000000000021  [    3.=
703296] GPR04: 00000000ffff7fff c000000032a17140 c000000032a17138 000000000=
0000027  [    3.703296] GPR08: c0000015c91a7c10 0000000000000001 0000000000=
000027 c000000002a18a20  [    3.703296] GPR12: 0000000048248824 c0000015cb9=
f4300 c000000032a17d68 c000000001262b20  [    3.703296] GPR16: c00800000131=
0000 000000000000ff20 000000000000fff2 c0080000012d7418  [    3.703296] GPR=
20: c000000032a17c30 0000000000000004 ffffffffffffc005 0000000001000200  [ =
   3.703296] GPR24: c000000002f11570 c00000000e376870 0000000000000001 0000=
000000000001  [    3.703296] GPR28: c00000000e376840 c00000000e3768c8 00000=
00000000000 c00000000e376840  [    3.703333] NIP [c00000000057a18c] memunma=
p_pages+0x37c/0x3a0
> [    3.703338] LR [c00000000057a188] memunmap_pages+0x378/0x3a0
> [    3.703342] Call Trace:
> [    3.703344] [c000000032a17370] [c00000000057a188] memunmap_pages+0x378=
/0x3a0 (unreliable)
> [    3.703349] [c000000032a17420] [c00000000057a928] memremap_pages+0x4a8=
/0x890
> [    3.703355] [c000000032a17500] [c00000000057ad4c] devm_memremap_pages+=
0x3c/0xd0
> [    3.703359] [c000000032a17540] [c0080000011c084c] dev_dax_probe+0x134/=
0x3a0 [device_dax]
> [    3.703366] [c000000032a175e0] [c0000000009f7e8c] dax_bus_probe+0xac/0=
x140
> [    3.703371] [c000000032a17610] [c0000000009b5828] really_probe+0x108/0=
x530
> [    3.703375] [c000000032a176a0] [c0000000009b5d04] __driver_probe_devic=
e+0xb4/0x200
> [    3.703379] [c000000032a17720] [c0000000009b5ea8] driver_probe_device+=
0x58/0x120
> [    3.703383] [c000000032a17760] [c0000000009b6298] __driver_attach+0x14=
8/0x250
> [    3.703387] [c000000032a177e0] [c0000000009b1a58] bus_for_each_dev+0xa=
8/0x130
> [    3.703392] [c000000032a17840] [c0000000009b4b34] driver_attach+0x34/0=
x50
> [    3.703396] [c000000032a17860] [c0000000009b3b98] bus_add_driver+0x258=
/0x300
> [    3.703400] [c000000032a178f0] [c0000000009b78d4] driver_register+0xa4=
/0x1b0
> [    3.703404] [c000000032a17960] [c0000000009f9530] __dax_driver_registe=
r+0x50/0x70
> [    3.703409] [c000000032a17980] [c0080000011c1374] dax_init+0x3c/0x58 [=
device_dax]
> [    3.703414] [c000000032a179a0] [c000000000013260] do_one_initcall+0x60=
/0x2f0
> [    3.703418] [c000000032a17a70] [c000000000248af8] do_init_module+0x78/=
0x310
> [    3.703424] [c000000032a17af0] [c00000000024bcac] load_module+0x2a7c/0=
x2f30
> [    3.703429] [c000000032a17d00] [c00000000024c4f0] __do_sys_finit_modul=
e+0xe0/0x180
> [    3.703434] [c000000032a17e10] [c0000000000374c0] system_call_exceptio=
n+0x140/0x350
> [    3.703439] [c000000032a17e50] [c00000000000d6a0] system_call_common+0=
x160/0x2e4
> [    3.703444] --- interrupt: c00 at 0x7fff9af2fb34
> [    3.703447] NIP:  00007fff9af2fb34 LR: 00007fff9b6dea9c CTR: 000000000=
0000000
> [    3.703450] REGS: c000000032a17e80 TRAP: 0c00   Not tainted  (6.4.0-rc=
6-00037-gb6dad5178cea-dirty)
> [    3.703453] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE=
>  CR: 28222204  XER: 00000000
> [    3.703462] IRQMASK: 0  [    3.703462] GPR00: 0000000000000161 00007ff=
fed351350 00007fff9b007300 000000000000000f  [    3.703462] GPR04: 00007fff=
9b6ead30 0000000000000000 000000000000000f 0000000000000000  [    3.703462]=
 GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
  [    3.703462] GPR12: 0000000000000000 00007fff9b7c6610 0000000000020000 =
000000011057db18  [    3.703462] GPR16: 00000001105c0108 0000000110585f48 0=
000000000000000 0000000000000000  [    3.703462] GPR20: 0000000000000000 00=
00000110585f80 0000000147985200 00007fffed351570  [    3.703462] GPR24: 000=
00001105c0128 0000000000020000 0000000000000000 0000000147981010  [    3.70=
3462] GPR28: 00007fff9b6ead30 0000000000020000 0000000000000000 00000001479=
85200  [    3.703497] NIP [00007fff9af2fb34] 0x7fff9af2fb34
> [    3.703499] LR [00007fff9b6dea9c] 0x7fff9b6dea9c
> [    3.703502] --- interrupt: c00
> [    3.703504] Code: 60000000 3d220170 8929b2b7 2f890000 409eff28 3c62ffe=
7 39200001 3d420170 3863c518 992ab2b7 4bbe4e55 60000000 <0fe00000> fac10060=
 fae10068 fb010070  [    3.703516] ---[ end trace 0000000000000000 ]---
> [    3.703520] device_dax: probe of dax0.0 failed with error -12
> [  OK  ] Created slice system-daxdev\x2dreconfigure.slice.
> [  OK  ] Started udev Wait for Complete Device Initialization.
> [  OK  ] Reached target Local File Systems (Pre).
> [  OK  ] Reached target Local File Systems.
>

The below change fixed the warning on the test machine you shared.

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/boo=
k3s64/radix_pgtable.c
index 1c49af91fd9c..d884c1b39128 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -994,6 +994,7 @@ void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, in=
t node,
 	pte_t entry;
 	pte_t *ptep =3D pmdp_ptep(pmdp);
=20
+	VM_BUG_ON(!IS_ALIGNED((unsigned long)(addr), PMD_SIZE));
 	entry =3D pfn_pte(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL);
 	set_pte_at(&init_mm, addr, ptep, entry);
 	asm volatile("ptesync": : :"memory");
@@ -1012,6 +1013,10 @@ static pte_t * __meminit radix__vmemmap_pte_populate=
(pmd_t *pmd, unsigned long a
 		void *p;
=20
 		if (!reuse) {
+
+			if (altmap && altmap_cross_boundary(altmap, addr, PAGE_SIZE))
+				altmap =3D NULL;
+
 			p =3D vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 			if (!p)
 				return NULL;
@@ -1028,6 +1033,8 @@ static pte_t * __meminit radix__vmemmap_pte_populate(=
pmd_t *pmd, unsigned long a
 			get_page(reuse);
 			p =3D page_to_virt(reuse);
 		}
+
+		VM_BUG_ON(!PAGE_ALIGNED(addr));
 		entry =3D pfn_pte(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL);
 		set_pte_at(&init_mm, addr, pte, entry);
 		asm volatile("ptesync": : :"memory");
@@ -1108,10 +1115,14 @@ int __meminit radix__vmemmap_populate(unsigned long=
 start, unsigned long end, in
 		pmd =3D vmemmap_pmd_alloc(pud, node, addr);
 		if (!pmd)
 			return -ENOMEM;
+
 		if (pmd_none(READ_ONCE(*pmd))) {
 			void *p;
=20
-			if (altmap && altmap_cross_boundary(altmap, start, PMD_SIZE)) {
+			if (!IS_ALIGNED(addr, PMD_SIZE))
+				goto base_mapping;
+
+			if (altmap && altmap_cross_boundary(altmap, addr, PMD_SIZE)) {
 				/* make sure we don't create altmap mappings covery things outside. */
 				goto base_mapping;
=20
