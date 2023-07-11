Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F9B74E612
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:53:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U5X3W+wd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0T5p3vc9z3cHp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:53:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U5X3W+wd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0T1L28V8z3bpK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 14:49:26 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4MKnW004609;
	Tue, 11 Jul 2023 04:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qv5kdCJqHiGr521EXLRJQSJOrIbyQnPS8KUfUxzB4mk=;
 b=U5X3W+wdcJRG1keR0ENtpU7wWF9TFQxEzID1gCqBnn6Hc8zvRVHg6bRRg5FxfCuTIW+o
 zBB8F+W1uBrKpLkQALrIx1vRhi/NlaFTR0R3cZ/CdX7PNNH+oAfkSBm0U+8xKLaBw1S8
 NtB/f6AdKaxF2dCwokS4yPUlj/l+jTdsu+GBsJXDu1g2SxgiCf0x5AS1m38co+BOMCY9
 Kz42m0fevaSuWRJw08INAX7IpWyNeKziZzWImYti/H9XZZESkaFJnl7Pb3eiG+LQxUCN
 eGnDCGYOPa8KYN581G/HzJjqQkEruxH4oTRFWxfP07b1Fy89Tyc1ENifdqJ+v298P1kx 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs006ggta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:14 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36B4gZqj032046;
	Tue, 11 Jul 2023 04:49:14 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs006ggss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:14 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36AK4HvZ026626;
	Tue, 11 Jul 2023 04:49:12 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3rpye5m6xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:49:12 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36B4nBcK21365122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 04:49:11 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DEDF58063;
	Tue, 11 Jul 2023 04:49:11 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BA8E58055;
	Tue, 11 Jul 2023 04:49:06 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.86.43])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 04:49:05 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v3 4/7] mm/hotplug: Allow pageblock alignment via altmap reservation
Date: Tue, 11 Jul 2023 10:18:30 +0530
Message-ID: <20230711044834.72809-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vwn1gOIxSoMzp5Tu-WhT89dd-ZCdeN2n
X-Proofpoint-GUID: rkyAmsDTrnaNuMmXurezn3Z51PizvCCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_02,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add a new kconfig option that can be selected if we want to allow
pageblock alignment by reserving pages in the vmemmap altmap area.
This implies we will be reserving some pages for every memoryblock
This also allows the memmap on memory feature to be widely useful
with different memory block size values.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/Kconfig          |  9 +++++++
 mm/memory_hotplug.c | 59 +++++++++++++++++++++++++++++++++++++--------
 2 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 932349271e28..88a1472b2086 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -570,6 +570,15 @@ config MHP_MEMMAP_ON_MEMORY
 	depends on MEMORY_HOTPLUG && SPARSEMEM_VMEMMAP
 	depends on ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 
+config MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY
+       bool "Allow Reserving pages for page block aligment"
+       depends on MHP_MEMMAP_ON_MEMORY
+       help
+	This option allows memmap on memory feature to be more useful
+	with different memory block sizes. This is achieved by marking some pages
+	in each memory block as reserved so that we can get page-block alignment
+	for the remaining pages.
+
 endif # MEMORY_HOTPLUG
 
 config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 07c99b0cc371..f36aec1f7626 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1252,15 +1252,17 @@ static inline bool arch_supports_memmap_on_memory(unsigned long size)
 {
 	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
 	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
-	unsigned long remaining_size = size - vmemmap_size;
 
-	return IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
-		IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
+	return IS_ALIGNED(vmemmap_size, PMD_SIZE);
 }
 #endif
 
 static bool mhp_supports_memmap_on_memory(unsigned long size)
 {
+	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
+	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
+	unsigned long remaining_size = size - vmemmap_size;
+
 	/*
 	 * Besides having arch support and the feature enabled at runtime, we
 	 * need a few more assumptions to hold true:
@@ -1287,9 +1289,30 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
 	 *       altmap as an alternative source of memory, and we do not exactly
 	 *       populate a single PMD.
 	 */
-	return mhp_memmap_on_memory() &&
-		size == memory_block_size_bytes() &&
-		arch_supports_memmap_on_memory(size);
+	if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
+		return false;
+	 /*
+	  * Without page reservation remaining pages should be pageblock aligned.
+	  */
+	if (!IS_ENABLED(CONFIG_MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY) &&
+	    !IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)))
+		return false;
+
+	return arch_supports_memmap_on_memory(size);
+}
+
+static inline unsigned long memory_block_align_base(unsigned long size)
+{
+	if (IS_ENABLED(CONFIG_MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY)) {
+		unsigned long align;
+		unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
+		unsigned long vmemmap_size;
+
+		vmemmap_size = (nr_vmemmap_pages * sizeof(struct page)) >> PAGE_SHIFT;
+		align = pageblock_align(vmemmap_size) - vmemmap_size;
+		return align;
+	} else
+		return 0;
 }
 
 /*
@@ -1302,7 +1325,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
-	struct vmem_altmap mhp_altmap = {};
+	struct vmem_altmap mhp_altmap = {
+		.base_pfn =  PHYS_PFN(res->start),
+		.end_pfn  =  PHYS_PFN(res->end),
+		.reserve  = memory_block_align_base(resource_size(res)),
+	};
 	struct memory_group *group = NULL;
 	u64 start, size;
 	bool new_node = false;
@@ -1347,8 +1374,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	 */
 	if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
 		if (mhp_supports_memmap_on_memory(size)) {
-			mhp_altmap.free = PHYS_PFN(size);
-			mhp_altmap.base_pfn = PHYS_PFN(start);
+			mhp_altmap.free = PHYS_PFN(size) - mhp_altmap.reserve;
 			params.altmap = &mhp_altmap;
 		}
 		/* fallback to not using altmap  */
@@ -1360,7 +1386,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		goto error;
 
 	/* create memory block devices after memory was added */
-	ret = create_memory_block_devices(start, size, mhp_altmap.alloc,
+	ret = create_memory_block_devices(start, size, mhp_altmap.alloc + mhp_altmap.reserve,
 					  group);
 	if (ret) {
 		arch_remove_memory(start, size, NULL);
@@ -2260,3 +2286,16 @@ int offline_and_remove_memory(u64 start, u64 size)
 }
 EXPORT_SYMBOL_GPL(offline_and_remove_memory);
 #endif /* CONFIG_MEMORY_HOTREMOVE */
+
+static int __init memory_hotplug_init(void)
+{
+
+	if (IS_ENABLED(CONFIG_MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY) &&
+	    mhp_memmap_on_memory()) {
+		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
+			memory_block_align_base(memory_block_size_bytes()));
+
+	}
+	return 0;
+}
+module_init(memory_hotplug_init);
-- 
2.41.0

