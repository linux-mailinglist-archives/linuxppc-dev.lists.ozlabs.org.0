Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87472764A0A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 10:06:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rf2S1HOd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBNdF3CJDz3dLK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 18:06:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rf2S1HOd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBNYd3qGcz3cLv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 18:03:17 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R7cZvY013832;
	Thu, 27 Jul 2023 08:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XeNGIPUf7wZ3h97+WSmcctwpHIYSBEv685Z8C0KQiMQ=;
 b=rf2S1HOd/gq/zj3tbDPe7Wmq2XMGLP3Dk2JJGm27JEFzBOQoXvXwEwYPg1IrLZqgDUhU
 ZodJfIrN/PUTpQqD+tJEkECllcdguWY7jLPO1DGVZ7BIGXdHZxY8aYbepj6zHzzEX52z
 +HGyqZKIRIJXKdkfoJObPgSEnNBJjWeIx8+ObVs0BoA9q05TColY3MFQ0tFIbX1yXqvt
 R+7zDRlY1tQgFzPMzuMXSZAJWaubUlO6YB6TeECaNnNNfPpPZxLzvFEUf8HrYWBMKCHa
 XStVXqKw/Of24Xj4sxM0IuuQ3AM5KJR6A+ZyPYZkPfxnYCP36oDObUO64ZvpZwBF+rW+ rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3k83je83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:03:05 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36R7cm5e015801;
	Thu, 27 Jul 2023 08:03:05 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3k83je62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:03:04 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36R7xj6R014373;
	Thu, 27 Jul 2023 08:03:02 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0styc20s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:03:02 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36R831VE56033536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jul 2023 08:03:02 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B146F5805B;
	Thu, 27 Jul 2023 08:03:01 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99D395804B;
	Thu, 27 Jul 2023 08:02:57 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jul 2023 08:02:57 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v6 4/7] mm/memory_hotplug: Support memmap_on_memory when memmap is not aligned to pageblocks
Date: Thu, 27 Jul 2023 13:32:29 +0530
Message-ID: <20230727080232.667439-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
References: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pAxZu9ZG_ClK_Ghs-RfQSrd973aFl_FZ
X-Proofpoint-GUID: SGC6UnTeHfmk9y6EpBJGu1pSeXJexq59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270066
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

Currently, memmap_on_memory feature is only supported with memory block
sizes that result in vmemmap pages covering full page blocks. This is
because memory onlining/offlining code requires applicable ranges to be
pageblock-aligned, for example, to set the migratetypes properly.

This patch helps to lift that restriction by reserving more pages than
required for vmemmap space. This helps the start address to be page
block aligned with different memory block sizes. Using this facility
implies the kernel will be reserving some pages for every memoryblock.
This allows the memmap on memory feature to be widely useful with
different memory block size values.

For ex: with 64K page size and 256MiB memory block size, we require 4
pages to map vmemmap pages, To align things correctly we end up adding a
reserve of 28 pages. ie, for every 4096 pages 28 pages get reserved.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../admin-guide/mm/memory-hotplug.rst         |  12 ++
 mm/memory_hotplug.c                           | 120 +++++++++++++++---
 2 files changed, 113 insertions(+), 19 deletions(-)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index bd77841041af..2994958c7ce8 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -433,6 +433,18 @@ The following module parameters are currently defined:
 				 memory in a way that huge pages in bigger
 				 granularity cannot be formed on hotplugged
 				 memory.
+
+				 With value "force" it could result in memory
+				 wastage due to memmap size limitations. For
+				 example, if the memmap for a memory block
+				 requires 1 MiB, but the pageblock size is 2
+				 MiB, 1 MiB of hotplugged memory will be wasted.
+				 Note that there are still cases where the
+				 feature cannot be enforced: for example, if the
+				 memmap is smaller than a single page, or if the
+				 architecture does not support the forced mode
+				 in all configurations.
+
 ``online_policy``		 read-write: Set the basic policy used for
 				 automatic zone selection when onlining memory
 				 blocks without specifying a target zone.
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 746cb7c08c64..fe94feb32d71 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -41,17 +41,83 @@
 #include "internal.h"
 #include "shuffle.h"
 
+enum {
+	MEMMAP_ON_MEMORY_DISABLE = 0,
+	MEMMAP_ON_MEMORY_ENABLE,
+	MEMMAP_ON_MEMORY_FORCE,
+};
+
+static int memmap_mode __read_mostly = MEMMAP_ON_MEMORY_DISABLE;
+
+static inline unsigned long memory_block_memmap_size(void)
+{
+	return PHYS_PFN(memory_block_size_bytes()) * sizeof(struct page);
+}
+
+static inline unsigned long memory_block_memmap_on_memory_pages(void)
+{
+	unsigned long nr_pages = PFN_UP(memory_block_memmap_size());
+
+	/*
+	 * In "forced" memmap_on_memory mode, we add extra pages to align the
+	 * vmemmap size to cover full pageblocks. That way, we can add memory
+	 * even if the vmemmap size is not properly aligned, however, we might waste
+	 * memory.
+	 */
+	if (memmap_mode == MEMMAP_ON_MEMORY_FORCE)
+		return pageblock_align(nr_pages);
+	return nr_pages;
+}
+
 #ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
 /*
  * memory_hotplug.memmap_on_memory parameter
  */
-static bool memmap_on_memory __ro_after_init;
-module_param(memmap_on_memory, bool, 0444);
-MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug");
+static int set_memmap_mode(const char *val, const struct kernel_param *kp)
+{
+	int ret, mode;
+	bool enabled;
+
+	if (sysfs_streq(val, "force") ||  sysfs_streq(val, "FORCE")) {
+		mode = MEMMAP_ON_MEMORY_FORCE;
+	} else {
+		ret = kstrtobool(val, &enabled);
+		if (ret < 0)
+			return ret;
+		if (enabled)
+			mode = MEMMAP_ON_MEMORY_ENABLE;
+		else
+			mode = MEMMAP_ON_MEMORY_DISABLE;
+	}
+	*((int *)kp->arg) = mode;
+	if (mode == MEMMAP_ON_MEMORY_FORCE) {
+		unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
+
+		pr_info_once("Memory hotplug will reserve %ld pages in each memory block\n",
+			     memmap_pages - PFN_UP(memory_block_memmap_size()));
+	}
+	return 0;
+}
+
+static int get_memmap_mode(char *buffer, const struct kernel_param *kp)
+{
+	if (*((int *)kp->arg) == MEMMAP_ON_MEMORY_FORCE)
+		return sprintf(buffer,  "force\n");
+	return param_get_bool(buffer, kp);
+}
+
+static const struct kernel_param_ops memmap_mode_ops = {
+	.set = set_memmap_mode,
+	.get = get_memmap_mode,
+};
+module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0444);
+MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug\n"
+		 "With value \"force\" it could result in memory wastage due "
+		 "to memmap size limitations (Y/N/force)");
 
 static inline bool mhp_memmap_on_memory(void)
 {
-	return memmap_on_memory;
+	return memmap_mode != MEMMAP_ON_MEMORY_DISABLE;
 }
 #else
 static inline bool mhp_memmap_on_memory(void)
@@ -1247,11 +1313,6 @@ static int online_memory_block(struct memory_block *mem, void *arg)
 	return device_online(&mem->dev);
 }
 
-static inline unsigned long memory_block_memmap_size(void)
-{
-	return PHYS_PFN(memory_block_size_bytes()) * sizeof(struct page);
-}
-
 #ifndef arch_supports_memmap_on_memory
 static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
 {
@@ -1267,7 +1328,7 @@ static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
 static bool mhp_supports_memmap_on_memory(unsigned long size)
 {
 	unsigned long vmemmap_size = memory_block_memmap_size();
-	unsigned long remaining_size = size - vmemmap_size;
+	unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
 
 	/*
 	 * Besides having arch support and the feature enabled at runtime, we
@@ -1295,10 +1356,28 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
 	 *       altmap as an alternative source of memory, and we do not exactly
 	 *       populate a single PMD.
 	 */
-	return mhp_memmap_on_memory() &&
-	       size == memory_block_size_bytes() &&
-	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)) &&
-	       arch_supports_memmap_on_memory(vmemmap_size);
+	if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
+		return false;
+
+	/*
+	 * Make sure the vmemmap allocation is fully contained
+	 * so that we always allocate vmemmap memory from altmap area.
+	 */
+	if (!IS_ALIGNED(vmemmap_size, PAGE_SIZE))
+		return false;
+
+	/*
+	 * start pfn should be pageblock_nr_pages aligned for correctly
+	 * setting migrate types
+	 */
+	if (!pageblock_aligned(memmap_pages))
+		return false;
+
+	if (memmap_pages == PHYS_PFN(memory_block_size_bytes()))
+		/* No effective hotplugged memory doesn't make sense. */
+		return false;
+
+	return arch_supports_memmap_on_memory(vmemmap_size);
 }
 
 /*
@@ -1311,7 +1390,10 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
-	struct vmem_altmap mhp_altmap = {};
+	struct vmem_altmap mhp_altmap = {
+		.base_pfn =  PHYS_PFN(res->start),
+		.end_pfn  =  PHYS_PFN(res->end),
+	};
 	struct memory_group *group = NULL;
 	u64 start, size;
 	bool new_node = false;
@@ -1356,8 +1438,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	 */
 	if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
 		if (mhp_supports_memmap_on_memory(size)) {
-			mhp_altmap.free = PHYS_PFN(size);
-			mhp_altmap.base_pfn = PHYS_PFN(start);
+			mhp_altmap.free = memory_block_memmap_on_memory_pages();
 			params.altmap = &mhp_altmap;
 		}
 		/* fallback to not using altmap  */
@@ -1369,8 +1450,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		goto error;
 
 	/* create memory block devices after memory was added */
-	ret = create_memory_block_devices(start, size, mhp_altmap.alloc,
-					  group);
+	ret = create_memory_block_devices(start, size, mhp_altmap.free, group);
 	if (ret) {
 		arch_remove_memory(start, size, NULL);
 		goto error;
@@ -2096,6 +2176,8 @@ static int __ref try_remove_memory(u64 start, u64 size)
 			 * right thing if we used vmem_altmap when hot-adding
 			 * the range.
 			 */
+			mhp_altmap.base_pfn = PHYS_PFN(start);
+			mhp_altmap.free = nr_vmemmap_pages;
 			mhp_altmap.alloc = nr_vmemmap_pages;
 			altmap = &mhp_altmap;
 		}
-- 
2.41.0

