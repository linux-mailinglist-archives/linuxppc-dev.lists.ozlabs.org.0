Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D464574E614
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:54:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ItPoa9bt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0T6m5KHZz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:54:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ItPoa9bt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0T1R4ttQz3bpK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 14:49:31 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4kwXo016793;
	Tue, 11 Jul 2023 04:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9hGLX82mpM7A1sG7cUX4F22RXgthqmPVRb138g4/vAU=;
 b=ItPoa9bt3C43BAS676bvRNT1jZcjwr1NAJmXMLZkqS63/ltVOYhgSaycan52ArAGCHqr
 TKTJXu+dnNDs+7cMap/dziHWV+/9GTFpAsI7ZQAWtWS5ERj8RjRb8ey0B9yHrjf0CMqd
 ZBGG4zito4yiygTY+rXZhJE5ZMNbBhA0wjTIC+8P7WlnsDuUn0w9ZVpzCa8EMFP3DJ64
 7DDTDEVFjeGQZyv1y5GKd2cjKBm6AFWpw7KAW9Dxr+0zdBc2O/S4S5oIrPjqlY8Bqq6W
 U817niqRB0W3ZOhdBA84jO+my+xfKQ+m3GExlz6HYgtXTyzcJaLAg3v/Tjms9Ns55aAA rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs0btg4a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:20 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36B4kuEq016759;
	Tue, 11 Jul 2023 04:49:19 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs0btg497-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:19 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4ZL56017145;
	Tue, 11 Jul 2023 04:49:18 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3rpye6vedj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:18 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36B4nHCK34603388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 04:49:17 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A78558055;
	Tue, 11 Jul 2023 04:49:17 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A5AB58063;
	Tue, 11 Jul 2023 04:49:12 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.86.43])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 04:49:11 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v3 5/7] powerpc/book3s64/memhotplug: Enable memmap on memory for radix
Date: Tue, 11 Jul 2023 10:18:31 +0530
Message-ID: <20230711044834.72809-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iew4llAaLdvPnwP5c6khYbjOxStUR01A
X-Proofpoint-GUID: 06NDGcN6XjIVYL-dF1kmE_6ApCwGdXkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_02,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110040
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
level based on different device boundary checks. Hence we skip the
restrictions w.r.t vmemmap size to be multiple of PMD_SIZE. This also
makes the feature widely useful because to use PMD_SIZE vmemmap area we
require a memory block size of 2GiB

We can also use MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY to that the feature
can work with a memory block size of 256MB. Using altmap.reserve feature
to align things correctly at pageblock granularity. We can end up
losing some pages in memory with this. For ex: with a 256MiB memory block
size, we require 4 pages to map vmemmap pages, In order to align things
correctly we end up adding a reserve of 28 pages. ie, for every 4096
pages 28 pages get reserved.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/pgtable.h            | 28 +++++++++++++++++++
 .../platforms/pseries/hotplug-memory.c        |  3 +-
 mm/memory_hotplug.c                           |  2 ++
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 116d6add0bb0..f890907e5bbf 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -157,6 +157,7 @@ config PPC
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_KEEP_MEMBLOCK
+	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 68817ea7f994..8e6c92dde6ad 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -169,6 +169,34 @@ static inline bool is_ioremap_addr(const void *x)
 int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size);
 bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
 			   unsigned long page_size);
+/*
+ * mm/memory_hotplug.c:mhp_supports_memmap_on_memory goes into details
+ * some of the restrictions. We don't check for PMD_SIZE because our
+ * vmemmap allocation code can fallback correctly. The pageblock
+ * alignment requirement is met using altmap->reserve blocks.
+ */
+#define arch_supports_memmap_on_memory arch_supports_memmap_on_memory
+static inline bool arch_supports_memmap_on_memory(unsigned long size)
+{
+	unsigned long nr_pages = size >> PAGE_SHIFT;
+	unsigned long vmemmap_size = nr_pages * sizeof(struct page);
+
+	if (!radix_enabled())
+		return false;
+
+#ifdef CONFIG_PPC_4K_PAGES
+	return IS_ALIGNED(vmemmap_size, PMD_SIZE);
+#else
+	/*
+	 * Make sure the vmemmap allocation is fully contianed
+	 * so that we always allocate vmemmap memory from altmap area.
+	 * The pageblock alignment requirement is met by using
+	 * reserve blocks in altmap.
+	 */
+	return IS_ALIGNED(vmemmap_size,  PAGE_SIZE);
+#endif
+}
+
 #endif /* CONFIG_PPC64 */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 9c62c2c3b3d0..1447509357a7 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -617,6 +617,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 
 static int dlpar_add_lmb(struct drmem_lmb *lmb)
 {
+	mhp_t mhp_flags = MHP_NONE | MHP_MEMMAP_ON_MEMORY;
 	unsigned long block_sz;
 	int nid, rc;
 
@@ -637,7 +638,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 		nid = first_online_node;
 
 	/* Add the memory */
-	rc = __add_memory(nid, lmb->base_addr, block_sz, MHP_NONE);
+	rc = __add_memory(nid, lmb->base_addr, block_sz, mhp_flags);
 	if (rc) {
 		invalidate_lmb_associativity_index(lmb);
 		return rc;
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index f36aec1f7626..0c4d3fdd31a2 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2108,6 +2108,8 @@ static int __ref try_remove_memory(u64 start, u64 size)
 			 * right thing if we used vmem_altmap when hot-adding
 			 * the range.
 			 */
+			mhp_altmap.base_pfn = PHYS_PFN(start);
+			mhp_altmap.free = PHYS_PFN(size) - nr_vmemmap_pages;
 			mhp_altmap.alloc = nr_vmemmap_pages;
 			altmap = &mhp_altmap;
 		}
-- 
2.41.0

