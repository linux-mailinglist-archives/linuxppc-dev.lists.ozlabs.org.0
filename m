Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D5673DC2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 12:24:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qLkAiX94;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqP8k0NRtz3bTr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 20:24:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qLkAiX94;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqP6n1FBWz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:22:40 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QAHRcC028316;
	Mon, 26 Jun 2023 10:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rKnaqMrhtfal6qJFhRUY26PfAk+2Nwoh3Jm2JBU0xCg=;
 b=qLkAiX94k87sVz4jnASQM70n6fii8ifH6WK65AEbTy8tQM0NUZHhF4tKMqcFZrBOz0rf
 jCNtFUy2qme9kGWTE5Xp0nk8lrizqGZwe2diRCdJUgWk63PLZYOOdC0gcql43TS6Dr+j
 jIZagcMnkxGTpdt/NILEa6ki9Y+6eR5qspHJU6IZQ+A8NX67JLkCzi8rO09YXdKU7EGy
 F0Wi1UWJT293RLt4KxVuSkIQnSYo47Vj5iBiw4bZN+HhLYoOGP2QvhXxI30gZvW2JvM3
 XWpFy9gyA159ghbWmkB3EUZjKN7MZHVmf+UCuD2hX0TJk2Ay8/vHRQ44WsWvPVjyd7Pp sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rf8sq842p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:28 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35QALa4m008926;
	Mon, 26 Jun 2023 10:22:27 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rf8sq841p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:27 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35Q87uJt005949;
	Mon, 26 Jun 2023 10:22:26 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3rdr45je3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:26 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35QAMOhx55443866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 10:22:25 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B86E58059;
	Mon, 26 Jun 2023 10:22:24 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8437F58057;
	Mon, 26 Jun 2023 10:22:20 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.116.175])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Jun 2023 10:22:20 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH 1/5] mm/hotplug: Embed vmem_altmap details in memory block
Date: Mon, 26 Jun 2023 15:52:08 +0530
Message-ID: <20230626102212.119919-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626102212.119919-1-aneesh.kumar@linux.ibm.com>
References: <20230626102212.119919-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Djf6zrLowzWQdY0mVP0wnjDhf796vocu
X-Proofpoint-GUID: pjL93lxYTRRIRa25q7paYaDFTW7zvZeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_06,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=443 mlxscore=0 spamscore=0 clxscore=1015 adultscore=0
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

With memmap on memory, some architecture needs more details w.r.t altmap
such as base_pfn, end_pfn, etc to unmap vmemmap memory.

Embed vmem_altmap data structure to memory_bock and use that instead of
nr_vmemmap_pages.

On memory unplug, if the kernel finds any memory block in the range to
be using vmem_altmap, the kernel fails to unplug the memory if the
request is not a single memory block unplug.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/base/memory.c    | 28 ++++++++++++++++++---------
 include/linux/memory.h   | 25 ++++++++++++++++++------
 include/linux/memremap.h | 18 +----------------
 mm/memory_hotplug.c      | 42 +++++++++++++++++-----------------------
 4 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index b456ac213610..523cc1d37c81 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -106,6 +106,7 @@ static void memory_block_release(struct device *dev)
 {
 	struct memory_block *mem = to_memory_block(dev);
 
+	WARN(mem->altmap.alloc, "Altmap not fully unmapped");
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
+	if (mem->altmap.alloc)
+		nr_vmemmap_pages = mem->altmap.alloc + mem->altmap.reserve;
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
+	if (mem->altmap.alloc)
+		nr_vmemmap_pages = mem->altmap.alloc + mem->altmap.reserve;
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
@@ -744,7 +751,10 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
 	mem->start_section_nr = block_id * sections_per_block;
 	mem->state = state;
 	mem->nid = NUMA_NO_NODE;
-	mem->nr_vmemmap_pages = nr_vmemmap_pages;
+	if (altmap)
+		memcpy(&mem->altmap, altmap, sizeof(*altmap));
+	else
+		mem->altmap.alloc = 0;
 	INIT_LIST_HEAD(&mem->group_next);
 
 #ifndef CONFIG_NUMA
@@ -783,14 +793,14 @@ static int __init add_boot_memory_block(unsigned long base_section_nr)
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
@@ -818,7 +828,7 @@ static void remove_memory_block(struct memory_block *memory)
  * Called under device_hotplug_lock.
  */
 int create_memory_block_devices(unsigned long start, unsigned long size,
-				unsigned long vmemmap_pages,
+				struct vmem_altmap *altmap,
 				struct memory_group *group)
 {
 	const unsigned long start_block_id = pfn_to_block_id(PFN_DOWN(start));
@@ -832,7 +842,7 @@ int create_memory_block_devices(unsigned long start, unsigned long size,
 		return -EINVAL;
 
 	for (block_id = start_block_id; block_id != end_block_id; block_id++) {
-		ret = add_hotplug_memory_block(block_id, vmemmap_pages, group);
+		ret = add_hotplug_memory_block(block_id, altmap, group);
 		if (ret)
 			break;
 	}
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 31343566c221..87f12924250f 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -64,6 +64,23 @@ struct memory_group {
 	};
 };
 
+/**
+ * struct vmem_altmap - pre-allocated storage for vmemmap_populate
+ * @base_pfn: base of the entire dev_pagemap mapping
+ * @reserve: pages mapped, but reserved for driver use (relative to @base)
+ * @free: free pages set aside in the mapping for memmap storage
+ * @align: pages reserved to meet allocation alignments
+ * @alloc: track pages consumed, private to vmemmap_populate()
+ */
+struct vmem_altmap {
+	unsigned long base_pfn;
+	const unsigned long end_pfn;
+	const unsigned long reserve;
+	unsigned long free;
+	unsigned long align;
+	unsigned long alloc;
+};
+
 struct memory_block {
 	unsigned long start_section_nr;
 	unsigned long state;		/* serialized by the dev->lock */
@@ -77,11 +94,7 @@ struct memory_block {
 	 */
 	struct zone *zone;
 	struct device dev;
-	/*
-	 * Number of vmemmap pages. These pages
-	 * lay at the beginning of the memory block.
-	 */
-	unsigned long nr_vmemmap_pages;
+	struct vmem_altmap altmap;
 	struct memory_group *group;	/* group (if any) for this block */
 	struct list_head group_next;	/* next block inside memory group */
 #if defined(CONFIG_MEMORY_FAILURE) && defined(CONFIG_MEMORY_HOTPLUG)
@@ -147,7 +160,7 @@ static inline int hotplug_memory_notifier(notifier_fn_t fn, int pri)
 extern int register_memory_notifier(struct notifier_block *nb);
 extern void unregister_memory_notifier(struct notifier_block *nb);
 int create_memory_block_devices(unsigned long start, unsigned long size,
-				unsigned long vmemmap_pages,
+				struct vmem_altmap *altmap,
 				struct memory_group *group);
 void remove_memory_block_devices(unsigned long start, unsigned long size);
 extern void memory_dev_init(void);
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 1314d9c5f05b..4cb326f85302 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_MEMREMAP_H_
 #define _LINUX_MEMREMAP_H_
 
+#include <linux/memory.h>
 #include <linux/mmzone.h>
 #include <linux/range.h>
 #include <linux/ioport.h>
@@ -10,23 +11,6 @@
 struct resource;
 struct device;
 
-/**
- * struct vmem_altmap - pre-allocated storage for vmemmap_populate
- * @base_pfn: base of the entire dev_pagemap mapping
- * @reserve: pages mapped, but reserved for driver use (relative to @base)
- * @free: free pages set aside in the mapping for memmap storage
- * @align: pages reserved to meet allocation alignments
- * @alloc: track pages consumed, private to vmemmap_populate()
- */
-struct vmem_altmap {
-	unsigned long base_pfn;
-	const unsigned long end_pfn;
-	const unsigned long reserve;
-	unsigned long free;
-	unsigned long align;
-	unsigned long alloc;
-};
-
 /*
  * Specialize ZONE_DEVICE memory into multiple types each has a different
  * usage.
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index eb18d1ac7e84..88a9c4443fc0 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1391,7 +1391,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		goto error;
 
 	/* create memory block devices after memory was added */
-	ret = create_memory_block_devices(start, size, mhp_altmap.alloc,
+	ret = create_memory_block_devices(start, size, &mhp_altmap,
 					  group);
 	if (ret) {
 		arch_remove_memory(start, size, NULL);
@@ -1993,12 +1993,18 @@ static int check_memblock_offlined_cb(struct memory_block *mem, void *arg)
 	return 0;
 }
 
-static int get_nr_vmemmap_pages_cb(struct memory_block *mem, void *arg)
+static int get_vmemmap_altmap_cb(struct memory_block *mem, void *arg)
 {
+	struct vmem_altmap **altmap = (struct vmem_altmap **)arg;
 	/*
-	 * If not set, continue with the next block.
+	 * If we have any pages allocated from altmap
+	 * return the altmap details and break callback.
 	 */
-	return mem->nr_vmemmap_pages;
+	if (mem->altmap.alloc) {
+		*altmap = &mem->altmap;
+		return 1;
+	}
+	return 0;
 }
 
 static int check_cpu_on_node(int nid)
@@ -2073,9 +2079,8 @@ EXPORT_SYMBOL(try_offline_node);
 
 static int __ref try_remove_memory(u64 start, u64 size)
 {
-	struct vmem_altmap mhp_altmap = {};
+	int ret;
 	struct vmem_altmap *altmap = NULL;
-	unsigned long nr_vmemmap_pages;
 	int rc = 0, nid = NUMA_NO_NODE;
 
 	BUG_ON(check_hotplug_memory_range(start, size));
@@ -2097,24 +2102,13 @@ static int __ref try_remove_memory(u64 start, u64 size)
 	 * We only support removing memory added with MHP_MEMMAP_ON_MEMORY in
 	 * the same granularity it was added - a single memory block.
 	 */
-	if (mhp_memmap_on_memory()) {
-		nr_vmemmap_pages = walk_memory_blocks(start, size, NULL,
-						      get_nr_vmemmap_pages_cb);
-		if (nr_vmemmap_pages) {
-			if (size != memory_block_size_bytes()) {
-				pr_warn("Refuse to remove %#llx - %#llx,"
-					"wrong granularity\n",
-					start, start + size);
-				return -EINVAL;
-			}
-
-			/*
-			 * Let remove_pmd_table->free_hugepage_table do the
-			 * right thing if we used vmem_altmap when hot-adding
-			 * the range.
-			 */
-			mhp_altmap.alloc = nr_vmemmap_pages;
-			altmap = &mhp_altmap;
+	ret = walk_memory_blocks(start, size, &altmap, get_vmemmap_altmap_cb);
+	if (ret) {
+		if (size != memory_block_size_bytes()) {
+			pr_warn("Refuse to remove %#llx - %#llx,"
+				"wrong granularity\n",
+				start, start + size);
+			return -EINVAL;
 		}
 	}
 
-- 
2.41.0

