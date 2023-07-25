Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5D76103F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 12:06:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X7qt5qiV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9CPB1SHKz3dKT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 20:06:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X7qt5qiV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9CJj2gd3z3bxB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 20:03:01 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P9bQwd030208;
	Tue, 25 Jul 2023 10:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TI2fojHJqZOTXOjXW4T4ghtxOCpIAVJVu66eni78XAw=;
 b=X7qt5qiVZ6RjMw7m1C80iMAgUvrG66DWeHpDWtSValC+SDhVCMxG0pWbvvGpspSxXLgg
 oRkDpAilAYWDDyC4UpCerU2cuUZBZ348vYLNFDLZ0ycVy+zqZjEZB1gURlZa2OuHw8Zp
 npIv2VeQgUeJFs+FrsFG9QwyrYZrGOLY0u+ZTxgqy3qQ3NdLeBM2uzSpC4LmfZvqiYZ3
 f+TMo58K9PeoR0Kx5sMlBnRxlz0iVEV19ilQlDpOetpXvCDCubuSaoT2MwDzk0HqsfbV
 SDvCjw/SsITQV7M7YImjjicMrmCEfTAQu9aDuZL+Qbmxo8H5xawCZkFSOjprOV9+1/D7 EA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s261dggyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:02:49 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36P9bK7a029475;
	Tue, 25 Jul 2023 10:02:49 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s261dggy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:02:49 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36P7luSx014370;
	Tue, 25 Jul 2023 10:02:48 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0stxu91g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:02:48 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36PA2l4X34341420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jul 2023 10:02:47 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6732458051;
	Tue, 25 Jul 2023 10:02:47 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4A555805C;
	Tue, 25 Jul 2023 10:02:43 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Jul 2023 10:02:43 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 6/7] mm/hotplug: Embed vmem_altmap details in memory block
Date: Tue, 25 Jul 2023 15:32:11 +0530
Message-ID: <20230725100212.531277-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RvBgdAoKzzhcWz91Zef8ylqTCyK2VZzP
X-Proofpoint-ORIG-GUID: U-CQf83aWfBGnJpJq-ybP6Qtdoe_YkeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_04,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=781 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250082
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

No functional change in this patch

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/base/memory.c  | 32 +++++++++++++++++++++++---------
 include/linux/memory.h |  8 ++------
 mm/memory_hotplug.c    | 41 ++++++++++++++++++++++-------------------
 3 files changed, 47 insertions(+), 34 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index b456ac213610..0210ed7b7696 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -106,6 +106,7 @@ static void memory_block_release(struct device *dev)
 {
 	struct memory_block *mem = to_memory_block(dev);
 
+	kfree(mem->altmap);
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
@@ -744,7 +751,14 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
 	mem->start_section_nr = block_id * sections_per_block;
 	mem->state = state;
 	mem->nid = NUMA_NO_NODE;
-	mem->nr_vmemmap_pages = nr_vmemmap_pages;
+	if (altmap) {
+		mem->altmap = kmalloc(sizeof(struct vmem_altmap), GFP_KERNEL);
+		if (!mem->altmap) {
+			kfree(mem);
+			return -ENOMEM;
+		}
+		memcpy(mem->altmap, altmap, sizeof(*altmap));
+	}
 	INIT_LIST_HEAD(&mem->group_next);
 
 #ifndef CONFIG_NUMA
@@ -783,14 +797,14 @@ static int __init add_boot_memory_block(unsigned long base_section_nr)
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
@@ -818,7 +832,7 @@ static void remove_memory_block(struct memory_block *memory)
  * Called under device_hotplug_lock.
  */
 int create_memory_block_devices(unsigned long start, unsigned long size,
-				unsigned long vmemmap_pages,
+				struct vmem_altmap *altmap,
 				struct memory_group *group)
 {
 	const unsigned long start_block_id = pfn_to_block_id(PFN_DOWN(start));
@@ -832,7 +846,7 @@ int create_memory_block_devices(unsigned long start, unsigned long size,
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
index 5b472e137898..96e794f39313 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1460,7 +1460,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		goto error;
 
 	/* create memory block devices after memory was added */
-	ret = create_memory_block_devices(start, size, mhp_altmap.free, group);
+	ret = create_memory_block_devices(start, size, params.altmap, group);
 	if (ret) {
 		arch_remove_memory(start, size, NULL);
 		goto error;
@@ -2066,12 +2066,18 @@ static int check_memblock_offlined_cb(struct memory_block *mem, void *arg)
 	return 0;
 }
 
-static int get_nr_vmemmap_pages_cb(struct memory_block *mem, void *arg)
+static int get_vmemmap_altmap_cb(struct memory_block *mem, void *arg)
 {
+	struct vmem_altmap *altmap = (struct vmem_altmap *)arg;
 	/*
-	 * If not set, continue with the next block.
+	 * If we have any pages allocated from altmap
+	 * return the altmap details and break callback.
 	 */
-	return mem->nr_vmemmap_pages;
+	if (mem->altmap) {
+		memcpy(altmap, mem->altmap, sizeof(struct vmem_altmap));
+		return 1;
+	}
+	return 0;
 }
 
 static int check_cpu_on_node(int nid)
@@ -2146,9 +2152,8 @@ EXPORT_SYMBOL(try_offline_node);
 
 static int __ref try_remove_memory(u64 start, u64 size)
 {
-	struct vmem_altmap mhp_altmap = {};
-	struct vmem_altmap *altmap = NULL;
-	unsigned long nr_vmemmap_pages;
+	int ret;
+	struct vmem_altmap mhp_altmap, *altmap = NULL;
 	int rc = 0, nid = NUMA_NO_NODE;
 
 	BUG_ON(check_hotplug_memory_range(start, size));
@@ -2171,24 +2176,15 @@ static int __ref try_remove_memory(u64 start, u64 size)
 	 * the same granularity it was added - a single memory block.
 	 */
 	if (mhp_memmap_on_memory()) {
-		nr_vmemmap_pages = walk_memory_blocks(start, size, NULL,
-						      get_nr_vmemmap_pages_cb);
-		if (nr_vmemmap_pages) {
+		ret = walk_memory_blocks(start, size, &mhp_altmap,
+					 get_vmemmap_altmap_cb);
+		if (ret) {
 			if (size != memory_block_size_bytes()) {
 				pr_warn("Refuse to remove %#llx - %#llx,"
 					"wrong granularity\n",
 					start, start + size);
 				return -EINVAL;
 			}
-
-			/*
-			 * Let remove_pmd_table->free_hugepage_table do the
-			 * right thing if we used vmem_altmap when hot-adding
-			 * the range.
-			 */
-			mhp_altmap.base_pfn = PHYS_PFN(start);
-			mhp_altmap.free = nr_vmemmap_pages;
-			mhp_altmap.alloc = nr_vmemmap_pages;
 			altmap = &mhp_altmap;
 		}
 	}
@@ -2206,6 +2202,13 @@ static int __ref try_remove_memory(u64 start, u64 size)
 
 	arch_remove_memory(start, size, altmap);
 
+	/*
+	 * Now that we are tracking alloc and free correctly
+	 * we can add check to verify altmap free pages.
+	 */
+	if (altmap)
+		WARN(altmap->alloc, "Altmap not fully unmapped");
+
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
 		memblock_phys_free(start, size);
 		memblock_remove(start, size);
-- 
2.41.0

