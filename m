Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9332276A804
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 06:48:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dDgPpotf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFN0j3Xp6z3dDh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 14:48:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dDgPpotf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFMsN2hYZz301R
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 14:42:16 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3714cMtv025271;
	Tue, 1 Aug 2023 04:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Nz49u6rQZIJZcp8dEnaFaAMsIWzwxQKo2rttnn8UJwE=;
 b=dDgPpotfGY15jMpTh9D8n2+bVZNEswPjleKsubxLVCbZQz6PX+7FH4VrCZN+dcCwQpjy
 MEg1enBn+WJTK3e9n1ejvMqF79HwQwwCvW1xcFBA0ObF27u7YOQK1ra5EAlv1cOfLhZ5
 fc6Hbl4yRf4SfowPeZJtaGDzxmnPyqVtHxgMEx4/KWkWAVbFF/U9TXZi5uw7SW2o7HpZ
 nf82hV5/Elu/5Sje7bX5qh05J2t/iDwdxs5mQf5QYIQyiWiQtzJ6VjvTxh7CyC60mlwU
 ymDPYHXXeNk0wDAzDbs31dDNQUdneY4xHikono96AESwkGsoWB7JHoFiNx4ExV3dLpPJ 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6tyv8b4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:42:04 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3714dN2H031613;
	Tue, 1 Aug 2023 04:42:03 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6tyv8any-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:42:03 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3713A2TH017127;
	Tue, 1 Aug 2023 04:41:51 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5fajgcw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:41:51 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3714forG34276050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Aug 2023 04:41:51 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE1445805D;
	Tue,  1 Aug 2023 04:41:50 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B0A35805A;
	Tue,  1 Aug 2023 04:41:47 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Aug 2023 04:41:46 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v7 6/7] mm/memory_hotplug: Embed vmem_altmap details in memory block
Date: Tue,  1 Aug 2023 10:11:15 +0530
Message-ID: <20230801044116.10674-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bOMnjWVFyiqIfXQFOjKKDtgupksjJUwR
X-Proofpoint-GUID: LO2oiRcnaXEEpwVIqWZnJewQOnhkc3I1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_02,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=878 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010041
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

With memmap on memory, some architecture needs more details w.r.t altmap
such as base_pfn, end_pfn, etc to unmap vmemmap memory. Instead of
computing them again when we remove a memory block, embed vmem_altmap
details in struct memory_block if we are using memmap on memory block
feature.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/base/memory.c  | 27 +++++++++++++--------
 include/linux/memory.h |  8 ++----
 mm/memory_hotplug.c    | 55 ++++++++++++++++++++++++++----------------
 3 files changed, 53 insertions(+), 37 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index b456ac213610..8191709c9ad2 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -105,7 +105,8 @@ EXPORT_SYMBOL(unregister_memory_notifier);
 static void memory_block_release(struct device *dev)
 {
 	struct memory_block *mem = to_memory_block(dev);
-
+	/* Verify that the altmap is freed */
+	WARN_ON(mem->altmap);
 	kfree(mem);
 }
 
@@ -183,7 +184,7 @@ static int memory_block_online(struct memory_block *mem)
 {
 	unsigned long start_pfn = section_nr_to_pfn(mem->start_section_nr);
 	unsigned long nr_pages = PAGES_PER_SECTION * sections_per_block;
-	unsigned long nr_vmemmap_pages = mem->nr_vmemmap_pages;
+	unsigned long nr_vmemmap_pages = 0;
 	struct zone *zone;
 	int ret;
 
@@ -200,6 +201,9 @@ static int memory_block_online(struct memory_block *mem)
 	 * stage helps to keep accounting easier to follow - e.g vmemmaps
 	 * belong to the same zone as the memory they backed.
 	 */
+	if (mem->altmap)
+		nr_vmemmap_pages = mem->altmap->free;
+
 	if (nr_vmemmap_pages) {
 		ret = mhp_init_memmap_on_memory(start_pfn, nr_vmemmap_pages, zone);
 		if (ret)
@@ -230,7 +234,7 @@ static int memory_block_offline(struct memory_block *mem)
 {
 	unsigned long start_pfn = section_nr_to_pfn(mem->start_section_nr);
 	unsigned long nr_pages = PAGES_PER_SECTION * sections_per_block;
-	unsigned long nr_vmemmap_pages = mem->nr_vmemmap_pages;
+	unsigned long nr_vmemmap_pages = 0;
 	int ret;
 
 	if (!mem->zone)
@@ -240,6 +244,9 @@ static int memory_block_offline(struct memory_block *mem)
 	 * Unaccount before offlining, such that unpopulated zone and kthreads
 	 * can properly be torn down in offline_pages().
 	 */
+	if (mem->altmap)
+		nr_vmemmap_pages = mem->altmap->free;
+
 	if (nr_vmemmap_pages)
 		adjust_present_page_count(pfn_to_page(start_pfn), mem->group,
 					  -nr_vmemmap_pages);
@@ -726,7 +733,7 @@ void memory_block_add_nid(struct memory_block *mem, int nid,
 #endif
 
 static int add_memory_block(unsigned long block_id, unsigned long state,
-			    unsigned long nr_vmemmap_pages,
+			    struct vmem_altmap *altmap,
 			    struct memory_group *group)
 {
 	struct memory_block *mem;
@@ -744,7 +751,7 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
 	mem->start_section_nr = block_id * sections_per_block;
 	mem->state = state;
 	mem->nid = NUMA_NO_NODE;
-	mem->nr_vmemmap_pages = nr_vmemmap_pages;
+	mem->altmap = altmap;
 	INIT_LIST_HEAD(&mem->group_next);
 
 #ifndef CONFIG_NUMA
@@ -783,14 +790,14 @@ static int __init add_boot_memory_block(unsigned long base_section_nr)
 	if (section_count == 0)
 		return 0;
 	return add_memory_block(memory_block_id(base_section_nr),
-				MEM_ONLINE, 0,  NULL);
+				MEM_ONLINE, NULL,  NULL);
 }
 
 static int add_hotplug_memory_block(unsigned long block_id,
-				    unsigned long nr_vmemmap_pages,
+				    struct vmem_altmap *altmap,
 				    struct memory_group *group)
 {
-	return add_memory_block(block_id, MEM_OFFLINE, nr_vmemmap_pages, group);
+	return add_memory_block(block_id, MEM_OFFLINE, altmap, group);
 }
 
 static void remove_memory_block(struct memory_block *memory)
@@ -818,7 +825,7 @@ static void remove_memory_block(struct memory_block *memory)
  * Called under device_hotplug_lock.
  */
 int create_memory_block_devices(unsigned long start, unsigned long size,
-				unsigned long vmemmap_pages,
+				struct vmem_altmap *altmap,
 				struct memory_group *group)
 {
 	const unsigned long start_block_id = pfn_to_block_id(PFN_DOWN(start));
@@ -832,7 +839,7 @@ int create_memory_block_devices(unsigned long start, unsigned long size,
 		return -EINVAL;
 
 	for (block_id = start_block_id; block_id != end_block_id; block_id++) {
-		ret = add_hotplug_memory_block(block_id, vmemmap_pages, group);
+		ret = add_hotplug_memory_block(block_id, altmap, group);
 		if (ret)
 			break;
 	}
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 31343566c221..f53cfdaaaa41 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -77,11 +77,7 @@ struct memory_block {
 	 */
 	struct zone *zone;
 	struct device dev;
-	/*
-	 * Number of vmemmap pages. These pages
-	 * lay at the beginning of the memory block.
-	 */
-	unsigned long nr_vmemmap_pages;
+	struct vmem_altmap *altmap;
 	struct memory_group *group;	/* group (if any) for this block */
 	struct list_head group_next;	/* next block inside memory group */
 #if defined(CONFIG_MEMORY_FAILURE) && defined(CONFIG_MEMORY_HOTPLUG)
@@ -147,7 +143,7 @@ static inline int hotplug_memory_notifier(notifier_fn_t fn, int pri)
 extern int register_memory_notifier(struct notifier_block *nb);
 extern void unregister_memory_notifier(struct notifier_block *nb);
 int create_memory_block_devices(unsigned long start, unsigned long size,
-				unsigned long vmemmap_pages,
+				struct vmem_altmap *altmap,
 				struct memory_group *group);
 void remove_memory_block_devices(unsigned long start, unsigned long size);
 extern void memory_dev_init(void);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 76b813991bdc..1ce8ad04a980 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1439,7 +1439,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
 		if (mhp_supports_memmap_on_memory(size)) {
 			mhp_altmap.free = memory_block_memmap_on_memory_pages();
-			params.altmap = &mhp_altmap;
+			params.altmap = kmalloc(sizeof(struct vmem_altmap), GFP_KERNEL);
+			if (!params.altmap)
+				goto error;
+
+			memcpy(params.altmap, &mhp_altmap, sizeof(mhp_altmap));
 		}
 		/* fallback to not using altmap  */
 	}
@@ -1447,13 +1451,13 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	/* call arch's memory hotadd */
 	ret = arch_add_memory(nid, start, size, &params);
 	if (ret < 0)
-		goto error;
+		goto error_free;
 
 	/* create memory block devices after memory was added */
-	ret = create_memory_block_devices(start, size, mhp_altmap.free, group);
+	ret = create_memory_block_devices(start, size, params.altmap, group);
 	if (ret) {
 		arch_remove_memory(start, size, NULL);
-		goto error;
+		goto error_free;
 	}
 
 	if (new_node) {
@@ -1490,6 +1494,8 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		walk_memory_blocks(start, size, NULL, online_memory_block);
 
 	return ret;
+error_free:
+	kfree(params.altmap);
 error:
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
 		memblock_remove(start, size);
@@ -2056,12 +2062,18 @@ static int check_memblock_offlined_cb(struct memory_block *mem, void *arg)
 	return 0;
 }
 
-static int get_nr_vmemmap_pages_cb(struct memory_block *mem, void *arg)
+static int test_has_altmap_cb(struct memory_block *mem, void *arg)
 {
+	struct memory_block **mem_ptr = (struct memory_block **)arg;
 	/*
-	 * If not set, continue with the next block.
+	 * return the memblock if we have altmap
+	 * and break callback.
 	 */
-	return mem->nr_vmemmap_pages;
+	if (mem->altmap) {
+		*mem_ptr = mem;
+		return 1;
+	}
+	return 0;
 }
 
 static int check_cpu_on_node(int nid)
@@ -2136,10 +2148,10 @@ EXPORT_SYMBOL(try_offline_node);
 
 static int __ref try_remove_memory(u64 start, u64 size)
 {
-	struct vmem_altmap mhp_altmap = {};
-	struct vmem_altmap *altmap = NULL;
-	unsigned long nr_vmemmap_pages;
+	int ret;
+	struct memory_block *mem;
 	int rc = 0, nid = NUMA_NO_NODE;
+	struct vmem_altmap *altmap = NULL;
 
 	BUG_ON(check_hotplug_memory_range(start, size));
 
@@ -2161,25 +2173,20 @@ static int __ref try_remove_memory(u64 start, u64 size)
 	 * the same granularity it was added - a single memory block.
 	 */
 	if (mhp_memmap_on_memory()) {
-		nr_vmemmap_pages = walk_memory_blocks(start, size, NULL,
-						      get_nr_vmemmap_pages_cb);
-		if (nr_vmemmap_pages) {
+		ret = walk_memory_blocks(start, size, &mem, test_has_altmap_cb);
+		if (ret) {
 			if (size != memory_block_size_bytes()) {
 				pr_warn("Refuse to remove %#llx - %#llx,"
 					"wrong granularity\n",
 					start, start + size);
 				return -EINVAL;
 			}
-
+			altmap = mem->altmap;
 			/*
-			 * Let remove_pmd_table->free_hugepage_table do the
-			 * right thing if we used vmem_altmap when hot-adding
-			 * the range.
+			 * Mark altmap NULL so that we can add a debug
+			 * check on memblock free.
 			 */
-			mhp_altmap.base_pfn = PHYS_PFN(start);
-			mhp_altmap.free = nr_vmemmap_pages;
-			mhp_altmap.alloc = nr_vmemmap_pages;
-			altmap = &mhp_altmap;
+			mem->altmap = NULL;
 		}
 	}
 
@@ -2196,6 +2203,12 @@ static int __ref try_remove_memory(u64 start, u64 size)
 
 	arch_remove_memory(start, size, altmap);
 
+	/* Verify that all vmemmap pages have actually been freed. */
+	if (altmap) {
+		WARN(altmap->alloc, "Altmap not fully unmapped");
+		kfree(altmap);
+	}
+
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
 		memblock_phys_free(start, size);
 		memblock_remove(start, size);
-- 
2.41.0

