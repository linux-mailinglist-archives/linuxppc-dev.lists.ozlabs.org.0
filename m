Return-Path: <linuxppc-dev+bounces-6849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85004A594EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 13:44:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBGmq71rlz2ykX;
	Mon, 10 Mar 2025 23:44:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741610667;
	cv=none; b=hdNTbq/tW+WyLR1RM7d76+I2T5CrWbjiibK/Xe4VI7u9rXsLi7xe3ShHIRXfMNNqfKbiOIWi/wePCfSJFpFefZfvZaU8U6570ofcBj3bOZ7gOBWUlbvfk9kmiccjr7SZO3/XZSTPCqoC0yHzGVDfPQBxec7P2XKmO6ecnj0gfVjV7fse3J1duO82bh9D+Td8r6KQf1iokEQay+JqaljGT2rKCM8sObX36N2xB62geWUAEzVVz2MMLNv+bM8ZoyY9SKE6PxsMSb/qHoF9V6YnRGY00u4iD9M+Bj5cBPs67AOKprY8H/wRdL8QI213gY4Gbb+dSkTpN2DcKgoon7GYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741610667; c=relaxed/relaxed;
	bh=0ChmYoZpYKDZGQc3Bc6RUfBv3u4u8Av2x23dAMZ6zaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKU10lyumPd2yjvDmNBn6SGrceGnsBJ43QlOUJIISZkm4zIXJZqHp14cxr4wJD1hiTIStJ/Lh3ypWN3B2W/CUjkV3pVilWrzXLmqSlD3izZqZSxOSzwLjw2AURBnshqtCfyVp8ERZwXnSwMCCoYb1ldQAt1f64RiaxNSpxdzQkH+3yWKj2+i9DpV7/2lI0d8GWg9g7AA14/nGRE8bxMg52WmhBqlq9/I26RLg6ff43K0hIuOnUcOC5F+UCJS5uneIm3KBjc13RRRU7xPjZ9TqxtlgJv3eVWlDtJie5BMJ724NXWwwmYmr2d1as8xCK6sWHWwVEi5wkpIDjy5MTuuBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PMx5bsSy; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PMx5bsSy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBGmp5jyVz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Mar 2025 23:44:26 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AB3KsO025373;
	Mon, 10 Mar 2025 12:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=0ChmYoZpYKDZGQc3B
	c6RUfBv3u4u8Av2x23dAMZ6zaE=; b=PMx5bsSy5e7ChV6GpgRrD5G7918C1he2W
	sb7VFpOjvV57VjhOZdCJC9c/TcPuLoUVWrnmHsZ2+QYIB45DyUQ+0HPOUSbbwoHa
	B9pbRwpYQlXBeMdqAFyq4uOHarInUhlIlognlmhqdSYewG5OZ9k+lhc3etkZ4X6N
	BB9wxXuRbpDmd5rFvMPST0eYpwOEgkhyLkOb6jP818Ttjf2FGrjL3fkUkvHki+ix
	bxHton90PZ1wpjs/KdQu334MKgKcOaoNzKQXH4XpHYCCyR9Oc5c1mYDk9EH2eRDG
	Zocqj9l2OHPmAyrOxSs4wW4ty4R8UP86gCTz+JCYN3wtXfL287U0g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 459j5p38f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 12:44:21 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52ACiKTm027063;
	Mon, 10 Mar 2025 12:44:20 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 459j5p38f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 12:44:20 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52A8pg8B014019;
	Mon, 10 Mar 2025 12:44:20 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4592x1p6ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 12:44:20 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52ACiGSZ24773162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Mar 2025 12:44:17 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D94782004B;
	Mon, 10 Mar 2025 12:44:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E530720040;
	Mon, 10 Mar 2025 12:44:15 +0000 (GMT)
Received: from ltcden14-lp2.aus.stglabs.ibm.com (unknown [9.53.174.194])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Mar 2025 12:44:15 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v3 2/2] book3s64/radix : Align section vmemmap start address to PAGE_SIZE
Date: Mon, 10 Mar 2025 07:44:10 -0500
Message-ID: <8f98ec2b442977c618f7256cec88eb17dde3f2b9.1741609795.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <8231763344223c193e3452eab0ae8ea966aff466.1741609795.git.donettom@linux.ibm.com>
References: <8231763344223c193e3452eab0ae8ea966aff466.1741609795.git.donettom@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b2ZQS8zsvQuS_VF3dENwYy5Skl7ShXMA
X-Proofpoint-ORIG-GUID: OiCapCODdWEPT2SGHf4fT1mQNmlDWQMW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503100099
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A vmemmap altmap is a device-provided region used to provide
backing storage for struct pages. For each namespace, the altmap
should belong to that same namespace. If the namespaces are
created unaligned, there is a chance that the section vmemmap
start address could also be unaligned. If the section vmemmap
start address is unaligned, the altmap page allocated from the
current namespace might be used by the previous namespace also.
During the free operation, since the altmap is shared between two
namespaces, the previous namespace may detect that the page does
not belong to its altmap and incorrectly assume that the page is a
normal page. It then attempts to free the normal page, which leads
to a kernel crash.

Kernel attempted to read user page (18) - exploit attempt? (uid: 0)
BUG: Kernel NULL pointer dereference on read at 0x00000018
Faulting instruction address: 0xc000000000530c7c
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
CPU: 32 PID: 2104 Comm: ndctl Kdump: loaded Tainted: G        W
NIP:  c000000000530c7c LR: c000000000530e00 CTR: 0000000000007ffe
REGS: c000000015e57040 TRAP: 0300   Tainted: G        W
MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 84482404
CFAR: c000000000530dfc DAR: 0000000000000018 DSISR: 40000000 IRQMASK: 0
GPR00: c000000000530e00 c000000015e572e0 c000000002c5cb00 c00c000101008040
GPR04: 0000000000000000 0000000000000007 0000000000000001 000000000000001f
GPR08: 0000000000000005 0000000000000000 0000000000000018 0000000000002000
GPR12: c0000000001d2fb0 c0000060de6b0080 0000000000000000 c0000060dbf90020
GPR16: c00c000101008000 0000000000000001 0000000000000000 c000000125b20f00
GPR20: 0000000000000001 0000000000000000 ffffffffffffffff c00c000101007fff
GPR24: 0000000000000001 0000000000000000 0000000000000000 0000000000000000
GPR28: 0000000004040201 0000000000000001 0000000000000000 c00c000101008040
NIP [c000000000530c7c] get_pfnblock_flags_mask+0x7c/0xd0
LR [c000000000530e00] free_unref_page_prepare+0x130/0x4f0
Call Trace:
free_unref_page+0x50/0x1e0
free_reserved_page+0x40/0x68
free_vmemmap_pages+0x98/0xe0
remove_pte_table+0x164/0x1e8
remove_pmd_table+0x204/0x2c8
remove_pud_table+0x1c4/0x288
remove_pagetable+0x1c8/0x310
vmemmap_free+0x24/0x50
section_deactivate+0x28c/0x2a0
__remove_pages+0x84/0x110
arch_remove_memory+0x38/0x60
memunmap_pages+0x18c/0x3d0
devm_action_release+0x30/0x50
release_nodes+0x68/0x140
devres_release_group+0x100/0x190
dax_pmem_compat_release+0x44/0x80 [dax_pmem_compat]
device_for_each_child+0x8c/0x100
[dax_pmem_compat_remove+0x2c/0x50 [dax_pmem_compat]
nvdimm_bus_remove+0x78/0x140 [libnvdimm]
device_remove+0x70/0xd0

Another issue is that if there is no altmap, a PMD-sized vmemmap
page will be allocated from RAM, regardless of the alignment of
the section start address. If the section start address is not
aligned to the PMD size, a VM_BUG_ON will be triggered when
setting the PMD-sized page to page table.

In this patch, we are aligning the section vmemmap start address
to PAGE_SIZE. After alignment, the start address will not be
part of the current namespace, and a normal page will be allocated
for the vmemmap mapping of the current section. For the remaining
sections, altmaps will be allocated. During the free operation,
the normal page will be correctly freed.

In the same way, a PMD_SIZE vmemmap page will be allocated only if
the section start address is PMD_SIZE-aligned; otherwise, it will
fall back to a PAGE-sized vmemmap allocation.

Without this patch
==================
NS1 start               NS2 start
 _________________________________________________________
|         NS1               |            NS2              |
 ---------------------------------------------------------
| Altmap| Altmap | .....|Altmap| Altmap | ...........
|  NS1  |  NS1   |      | NS2  |  NS2   |

In the above scenario, NS1 and NS2 are two namespaces. The vmemmap
for NS1 comes from Altmap NS1, which belongs to NS1, and the
vmemmap for NS2 comes from Altmap NS2, which belongs to NS2.

The vmemmap start for NS2 is not aligned, so Altmap NS2 is shared
by both NS1 and NS2. During the free operation in NS1, Altmap NS2
is not part of NS1's altmap, causing it to attempt to free an
invalid page.

With this patch
===============
NS1 start               NS2 start
 _________________________________________________________
|         NS1               |            NS2              |
 ---------------------------------------------------------
| Altmap| Altmap | .....| Normal | Altmap | Altmap |.......
|  NS1  |  NS1   |      |  Page  |  NS2   |  NS2   |

If the vmemmap start for NS2 is not aligned then we are allocating
a normal page. NS1 and NS2 vmemmap will be freed correctly.

Fixes: 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
Co-developed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---

Optimizations suggested by Aneesh and Ritesh regarding aligning
the start to PMD size will be done as part of the next patch
series.

v2 -> v3 : Added a comment in the code as Aneesh suggested.
v2:https://lore.kernel.org/all/8231763344223c193e3452eab0ae8ea966aff466.1741363120.git.donettom@linux.ibm.com/
v1: https://lore.kernel.org/all/20250226043426.224494-1-donettom@linux.ibm.com/
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index bd6916419472..9f764bc42b8c 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1121,6 +1121,19 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	pmd_t *pmd;
 	pte_t *pte;
 
+	/*
+	 * Make sure we align the start vmemmap addr so that we calculate
+	 * the correct start_pfn in altmap boundary check to decided whether
+	 * we should use altmap or RAM based backing memory allocation. Also
+	 * the address need to be aligned for set_pte operation.
+
+	 * If the start addr is already PMD_SIZE aligned we will try to use
+	 * a pmd mapping. We don't want to be too aggressive here beacause
+	 * that will cause more allocations in RAM. So only if the namespace
+	 * vmemmap start addr is PMD_SIZE aligned we will use PMD mapping.
+	 */
+
+	start = ALIGN_DOWN(start, PAGE_SIZE);
 	for (addr = start; addr < end; addr = next) {
 		next = pmd_addr_end(addr, end);
 
@@ -1146,8 +1159,8 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 			 * in altmap block allocation failures, in which case
 			 * we fallback to RAM for vmemmap allocation.
 			 */
-			if (altmap && (!IS_ALIGNED(addr, PMD_SIZE) ||
-				       altmap_cross_boundary(altmap, addr, PMD_SIZE))) {
+			if (!IS_ALIGNED(addr, PMD_SIZE) || (altmap &&
+			    altmap_cross_boundary(altmap, addr, PMD_SIZE))) {
 				/*
 				 * make sure we don't create altmap mappings
 				 * covering things outside the device.
-- 
2.47.1


