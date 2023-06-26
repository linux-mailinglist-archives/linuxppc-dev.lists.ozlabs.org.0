Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1427E73DC34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 12:28:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=poSa4lSy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqPF06vGnz3c7y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 20:28:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=poSa4lSy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqP754Rmgz30g2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:22:57 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QAHOCj028263;
	Mon, 26 Jun 2023 10:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oxvnKRSpGoW8JFJutnQHFPsa2w6ImNzo01OT7dEV1Yo=;
 b=poSa4lSyeGRBevI379bTanXRVWiH5oEff+/dQwVevmCkNZQh6yFV9kMYJ6NB9qsS41vq
 4Y3XBHgF+eOrGa2d4PtOIphJqWXkllLSHeKlqX569qEJVQIDma0A+KfJLAPyBnPc4aF/
 sFqjtsQCDxmWJ839Cp/KAK7HnpK8nLzbAr6DVXgRE2DhdqKyBOB1eEGndEHX3WWl9Ym9
 wMbXEqxb1XC3qmQwgVDkaOCzYJGJ6EW+2lTW0OZqOmH7xifS8yUAsVJEv5OgylJls6zi
 0Oclbpd0AboD6EUUl55GnlYlAFytHJf1u1y4ZBd4Qgzcu4BX9gXLiNvhNSkwh0bYFGkL /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rf8sq84ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:46 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35QAKnAW005905;
	Mon, 26 Jun 2023 10:22:45 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rf8sq84a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:45 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35Q8Lqht028053;
	Mon, 26 Jun 2023 10:22:44 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3rdr45ae4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:44 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35QAMgtl52887914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 10:22:43 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5B8A58059;
	Mon, 26 Jun 2023 10:22:42 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BB6A58057;
	Mon, 26 Jun 2023 10:22:39 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.116.175])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Jun 2023 10:22:38 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH 5/5] powerpc/book3s64/memhotplug: Enable memmap on memory for radix
Date: Mon, 26 Jun 2023 15:52:12 +0530
Message-ID: <20230626102212.119919-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626102212.119919-1-aneesh.kumar@linux.ibm.com>
References: <20230626102212.119919-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: l6nyOvHImYr2ncmzpAHpJpj-D7a6hwbk
X-Proofpoint-GUID: p6ifLIVYMARIoyS0jhsdU5P2mBOTmdPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_06,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260091
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Radix vmemmap mapping can map things correctly at the PMD level or PTE
level based on different device boundary checks. We also use altmap.reserve
feature to align things correctly at pageblock granularity. We can end up
loosing some pages in memory with this. For ex: with 256MB memory block
size, we require 4 pages to map vmemmap pages, In order to align things
correctly we end up adding a reserve of 28 pages. ie, for every 4096 pages
28 pages get reserved.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 28 +++++++++++++++++++
 .../platforms/pseries/hotplug-memory.c        |  4 ++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6bd9ca6f2448..1b0954854a12 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -158,6 +158,7 @@ config PPC
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_KEEP_MEMBLOCK
+	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index afbae37612ad..e0e292b87b4b 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1692,3 +1692,31 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 
 	return 1;
 }
+
+/*
+ * mm/memory_hotplug.c:mhp_supports_memmap_on_memory goes into details
+ * some of the restrictions. We don't check for PMD_SIZE because our
+ * vmemmap allocation code can fallback correctly. The pageblock
+ * alignment requirement is met using altmap->reserve blocks.
+ */
+bool mhp_supports_memmap_on_memory(unsigned long size)
+{
+	if (!radix_enabled())
+		return false;
+	/*
+	 * The pageblock alignment requirement is met by using
+	 * reserve blocks in altmap.
+	 */
+	return size == memory_block_size_bytes();
+}
+
+unsigned long memory_block_align_base(struct resource *res)
+{
+	unsigned long base_pfn = PHYS_PFN(res->start);
+	unsigned long align, size = resource_size(res);
+	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
+	unsigned long vmemmap_size = (nr_vmemmap_pages * sizeof(struct page))/PAGE_SIZE;
+
+	align = pageblock_align(base_pfn + vmemmap_size) - (base_pfn + vmemmap_size);
+	return align;
+}
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 9c62c2c3b3d0..326db26d773e 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -617,6 +617,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 
 static int dlpar_add_lmb(struct drmem_lmb *lmb)
 {
+	mhp_t mhp_flags = MHP_NONE;
 	unsigned long block_sz;
 	int nid, rc;
 
@@ -637,7 +638,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 		nid = first_online_node;
 
 	/* Add the memory */
-	rc = __add_memory(nid, lmb->base_addr, block_sz, MHP_NONE);
+	mhp_flags |= get_memmap_on_memory_flags();
+	rc = __add_memory(nid, lmb->base_addr, block_sz, mhp_flags);
 	if (rc) {
 		invalidate_lmb_associativity_index(lmb);
 		return rc;
-- 
2.41.0

