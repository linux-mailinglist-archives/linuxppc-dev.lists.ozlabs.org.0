Return-Path: <linuxppc-dev+bounces-6805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A40A56D3C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 17:11:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8WVr5tpyz3cV2;
	Sat,  8 Mar 2025 03:11:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741363876;
	cv=none; b=mKcdwjpjywYmrKpewTf6x7gGkbBWSuh4EXE52LsopaPHs8LOKiy/U67xwq7JrrTE+OFSTeVGjui2J5XEiwDYG5j54aQjYB3Kxs52Ezng55HDvruVpvg6VOSc6dhkL9wot3Q+3Y7iLqZ/9144SpIR6xpwFK5dCXpE/5PkFUa0ZOaFriT0tt9UJTjc9O2Sj1vMpCrYti+hPF1CXrVVmpXDA9XKZVkRPtGAkQKyaI4y27yqjXHJgmvl4/S2R1uqm9trPvWVp5PNLUPJNEfXW3Ou1m5ecHHvgzyi+PkBExDYk8MtfLf3MEL0OmVWdkrOFsYrny2Iz6Fgco4MfbjZ2ogIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741363876; c=relaxed/relaxed;
	bh=aICviaODLLjP64JiXx9gQjYb1KxqcImFRPoVezmcMx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XgUZmoGZtfi74DpRoxL0xjJGhXZPNmVGQ2isNYe6aGShB7itftNDf+Hj8NDlMCQ15dwIFLTjPVF8LNoc42JrMd7YSdaKY/+0tsS8+2cuq7XZWy7RJwWdWsiiA5jo3Y9S7BAoh+rmZn/4r8ZhX65qLMFE8f9DXFHLpU/+2jtnZAafnIQxXyedv3U+YkU+wwTM9/0/Q3QJ/TgOxrlPt7UMtWBu5nldVAxvsUGA2px11VZHeeG+Z/3uJYXKvikBYmBryGFuEyxsDM9relxXzTbmJEF2kpLV0QbR4r/IaS3Ew3ASxmNlomTh+83ud44pO+Pu2rszB53w5IBwhX1RtdEk3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WlHMfpGV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WlHMfpGV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8WVq2v3Tz301n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 03:11:15 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527FajR6002330;
	Fri, 7 Mar 2025 16:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=aICviaODLLjP64JiX
	x9gQjYb1KxqcImFRPoVezmcMx8=; b=WlHMfpGVnCOvRrG86yv+vl5t2qfeLXFhs
	cPgvS5BDnKng+elaHamSNrJhxvQFtOPWXYPB0AZMaexjMUG9bbKpQ36qTvWpjEpN
	RIMQfpNBoIyAQliS7RnlPH5QcbsXf6oxSvg/g4f4IZVG5wXs5CU2lK2mv8N9PGrD
	mdVuq6uW32+Lev5FudgCbxj0dcnb+UcckP/8MSfIipWSo7v1b0AxUF/8OdN//Axy
	7cSY0xXE8dXfTQuVStOMCsoow7g7q8xY+prlvweSDTXLY+bVoTL+jC7GCla+UE/4
	Cp+DPFeFg/sNR7lYxGCyLFUQL1FuBRBBs/eohHrK1LuGHvLNQPT1Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 457jx04xgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 16:11:09 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 527G51cr000319;
	Fri, 7 Mar 2025 16:11:09 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 457jx04xgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 16:11:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 527G3hiZ013776;
	Fri, 7 Mar 2025 16:11:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454e2m7ncp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 16:11:08 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 527GB4Dn58196386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Mar 2025 16:11:05 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D086320040;
	Fri,  7 Mar 2025 16:11:04 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFFEE20043;
	Fri,  7 Mar 2025 16:11:03 +0000 (GMT)
Received: from ltcden14-lp2.aus.stglabs.ibm.com (unknown [9.53.174.194])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Mar 2025 16:11:03 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v2 2/2] book3s64/radix : Align section vmemmap start address to PAGE_SIZE
Date: Fri,  7 Mar 2025 10:10:36 -0600
Message-ID: <b931e862cbcbcec1a6f5e4a5e2c664687c54f6c2.1741363120.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <8231763344223c193e3452eab0ae8ea966aff466.1741363120.git.donettom@linux.ibm.com>
References: <8231763344223c193e3452eab0ae8ea966aff466.1741363120.git.donettom@linux.ibm.com>
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
X-Proofpoint-GUID: OyrlKqfG-2Osuh-npcuvi0gxJ0MVY6Mu
X-Proofpoint-ORIG-GUID: fQrBrn1-zu6y4EBlnCQtqciKzEBKzeal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_06,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503070118
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
v1 -> v2 : Added a fix for the VM_BUG_ON being triggered when the
           start address is not PMD_SIZE-aligned.
v1: https://lore.kernel.org/all/20250226043426.224494-1-donettom@linux.ibm.com/
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index bd6916419472..d0878f1f78f4 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1121,6 +1121,11 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	pmd_t *pmd;
 	pte_t *pte;
 
+	if (!IS_ALIGNED(start, PAGE_SIZE))
+		pr_warn_once("vmemmap region is not page aligned start:%lu, end:%lu, altmap:%d\n",
+				start, end, !!altmap);
+
+	start = ALIGN_DOWN(start, PAGE_SIZE);
 	for (addr = start; addr < end; addr = next) {
 		next = pmd_addr_end(addr, end);
 
@@ -1146,8 +1151,8 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
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


