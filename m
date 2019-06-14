Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C732D45A20
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 12:14:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QGfk0vbgzDrdM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 20:14:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QGNw45WDzDrVP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 20:02:08 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0BF8C3082E64;
 Fri, 14 Jun 2019 10:02:04 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-252.ams2.redhat.com [10.36.116.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FB715D9C3;
 Fri, 14 Jun 2019 10:01:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/6] mm/memory_hotplug: Move and simplify
 walk_memory_blocks()
Date: Fri, 14 Jun 2019 12:01:13 +0200
Message-Id: <20190614100114.311-6-david@redhat.com>
In-Reply-To: <20190614100114.311-1-david@redhat.com>
References: <20190614100114.311-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 14 Jun 2019 10:02:04 +0000 (UTC)
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
Cc: Oscar Salvador <osalvador@suse.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Michal Hocko <mhocko@suse.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 David Hildenbrand <david@redhat.com>,
 "mike.travis@hpe.com" <mike.travis@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, linux-acpi@vger.kernel.org,
 Andrew Banman <andrew.banman@hpe.com>, Arun KS <arunks@codeaurora.org>,
 Qian Cai <cai@lca.pw>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's move walk_memory_blocks() to the place where memory block logic
resides and simplify it. While at it, add a type for the callback function.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Andrew Banman <andrew.banman@hpe.com>
Cc: "mike.travis@hpe.com" <mike.travis@hpe.com>
Cc: Oscar Salvador <osalvador@suse.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: Arun KS <arunks@codeaurora.org>
Cc: Qian Cai <cai@lca.pw>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c          | 42 ++++++++++++++++++++++++++
 include/linux/memory.h         |  3 ++
 include/linux/memory_hotplug.h |  2 --
 mm/memory_hotplug.c            | 55 ----------------------------------
 4 files changed, 45 insertions(+), 57 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 3ed08e67e64f..4f2e2f3b3d78 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -44,6 +44,11 @@ static inline unsigned long pfn_to_block_id(unsigned long pfn)
 	return base_memory_block_id(pfn_to_section_nr(pfn));
 }
 
+static inline unsigned long phys_to_block_id(unsigned long phys)
+{
+	return pfn_to_block_id(PFN_DOWN(phys));
+}
+
 static int memory_subsys_online(struct device *dev);
 static int memory_subsys_offline(struct device *dev);
 
@@ -853,3 +858,40 @@ int __init memory_dev_init(void)
 		printk(KERN_ERR "%s() failed: %d\n", __func__, ret);
 	return ret;
 }
+
+/**
+ * walk_memory_blocks - walk through all present memory blocks overlapped
+ *			by the range [start, start + size)
+ *
+ * @start: start address of the memory range
+ * @size: size of the memory range
+ * @arg: argument passed to func
+ * @func: callback for each memory section walked
+ *
+ * This function walks through all present memory blocks overlapped by the
+ * range [start, start + size), calling func on each memory block.
+ *
+ * In case func() returns an error, walking is aborted and the error is
+ * returned.
+ */
+int walk_memory_blocks(unsigned long start, unsigned long size,
+		       void *arg, walk_memory_blocks_func_t func)
+{
+	const unsigned long start_block_id = phys_to_block_id(start);
+	const unsigned long end_block_id = phys_to_block_id(start + size - 1);
+	struct memory_block *mem;
+	unsigned long block_id;
+	int ret = 0;
+
+	for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
+		mem = find_memory_block_by_id(block_id, NULL);
+		if (!mem)
+			continue;
+
+		ret = func(mem, arg);
+		put_device(&mem->dev);
+		if (ret)
+			break;
+	}
+	return ret;
+}
diff --git a/include/linux/memory.h b/include/linux/memory.h
index f26a5417ec5d..b3b388775a30 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -119,6 +119,9 @@ extern int memory_isolate_notify(unsigned long val, void *v);
 extern struct memory_block *find_memory_block_hinted(struct mem_section *,
 							struct memory_block *);
 extern struct memory_block *find_memory_block(struct mem_section *);
+typedef int (*walk_memory_blocks_func_t)(struct memory_block *, void *);
+extern int walk_memory_blocks(unsigned long start, unsigned long size,
+			      void *arg, walk_memory_blocks_func_t func);
 #define CONFIG_MEM_BLOCK_SIZE	(PAGES_PER_SECTION<<PAGE_SHIFT)
 #endif /* CONFIG_MEMORY_HOTPLUG_SPARSE */
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index d9fffc34949f..475aff8efbf8 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -340,8 +340,6 @@ static inline void __remove_memory(int nid, u64 start, u64 size) {}
 #endif /* CONFIG_MEMORY_HOTREMOVE */
 
 extern void __ref free_area_init_core_hotplug(int nid);
-extern int walk_memory_blocks(unsigned long start, unsigned long size,
-		void *arg, int (*func)(struct memory_block *, void *));
 extern int __add_memory(int nid, u64 start, u64 size);
 extern int add_memory(int nid, u64 start, u64 size);
 extern int add_memory_resource(int nid, struct resource *resource);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 122a7d31efdd..fc558e9ff939 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1661,62 +1661,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages)
 {
 	return __offline_pages(start_pfn, start_pfn + nr_pages);
 }
-#endif /* CONFIG_MEMORY_HOTREMOVE */
 
-/**
- * walk_memory_blocks - walk through all present memory blocks overlapped
- *			by the range [start, start + size)
- *
- * @start: start address of the memory range
- * @size: size of the memory range
- * @arg: argument passed to func
- * @func: callback for each memory block walked
- *
- * This function walks through all present memory blocks overlapped by the
- * range [start, start + size), calling func on each memory block.
- *
- * Returns the return value of func.
- */
-int walk_memory_blocks(unsigned long start, unsigned long size,
-		void *arg, int (*func)(struct memory_block *, void *))
-{
-	const unsigned long start_pfn = PFN_DOWN(start);
-	const unsigned long end_pfn = PFN_UP(start + size - 1);
-	struct memory_block *mem = NULL;
-	struct mem_section *section;
-	unsigned long pfn, section_nr;
-	int ret;
-
-	for (pfn = start_pfn; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
-		section_nr = pfn_to_section_nr(pfn);
-		if (!present_section_nr(section_nr))
-			continue;
-
-		section = __nr_to_section(section_nr);
-		/* same memblock? */
-		if (mem)
-			if ((section_nr >= mem->start_section_nr) &&
-			    (section_nr <= mem->end_section_nr))
-				continue;
-
-		mem = find_memory_block_hinted(section, mem);
-		if (!mem)
-			continue;
-
-		ret = func(mem, arg);
-		if (ret) {
-			kobject_put(&mem->dev.kobj);
-			return ret;
-		}
-	}
-
-	if (mem)
-		kobject_put(&mem->dev.kobj);
-
-	return 0;
-}
-
-#ifdef CONFIG_MEMORY_HOTREMOVE
 static int check_memblock_offlined_cb(struct memory_block *mem, void *arg)
 {
 	int ret = !is_memblock_offlined(mem);
-- 
2.21.0

