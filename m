Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980137434BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 08:09:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QslK63y6Bz3c2T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 16:09:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QslJc0DRsz303Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 16:09:17 +1000 (AEST)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QslDg1z02zqVB2;
	Fri, 30 Jun 2023 14:05:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 14:08:41 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 2/2] mm: make show_free_areas() static
Date: Fri, 30 Jun 2023 14:22:53 +0800
Message-ID: <20230630062253.189440-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630062253.189440-1-wangkefeng.wang@huawei.com>
References: <20230630062253.189440-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, willy@infradead.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All callers of show_free_areas() pass 0 and NULL, so we can directly
use show_mem() instead of show_free_areas(0, NULL), which could make
show_free_areas() a static function.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
v2: update commit log and fix a missing show_free_areas() conversion

 arch/sparc/kernel/setup_32.c |  2 +-
 include/linux/mm.h           | 12 ------------
 mm/internal.h                |  6 ++++++
 mm/nommu.c                   |  8 ++++----
 mm/show_mem.c                |  4 ++--
 5 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
index 1adf5c1c16b8..34ef7febf0d5 100644
--- a/arch/sparc/kernel/setup_32.c
+++ b/arch/sparc/kernel/setup_32.c
@@ -83,7 +83,7 @@ static void prom_sync_me(void)
 			     "nop\n\t" : : "r" (&trapbase));
 
 	prom_printf("PROM SYNC COMMAND...\n");
-	show_free_areas(0, NULL);
+	show_mem();
 	if (!is_idle_task(current)) {
 		local_irq_enable();
 		ksys_sync();
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ddb140e14f3a..0a1314a3ffae 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2218,18 +2218,6 @@ extern void pagefault_out_of_memory(void);
 #define offset_in_thp(page, p)	((unsigned long)(p) & (thp_size(page) - 1))
 #define offset_in_folio(folio, p) ((unsigned long)(p) & (folio_size(folio) - 1))
 
-/*
- * Flags passed to show_mem() and show_free_areas() to suppress output in
- * various contexts.
- */
-#define SHOW_MEM_FILTER_NODES		(0x0001u)	/* disallowed nodes */
-
-extern void __show_free_areas(unsigned int flags, nodemask_t *nodemask, int max_zone_idx);
-static void __maybe_unused show_free_areas(unsigned int flags, nodemask_t *nodemask)
-{
-	__show_free_areas(flags, nodemask, MAX_NR_ZONES - 1);
-}
-
 /*
  * Parameter block passed down to zap_pte_range in exceptional cases.
  */
diff --git a/mm/internal.h b/mm/internal.h
index a7d9e980429a..721ed07d7fd6 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -61,6 +61,12 @@ void page_writeback_init(void);
 #define COMPOUND_MAPPED		0x800000
 #define FOLIO_PAGES_MAPPED	(COMPOUND_MAPPED - 1)
 
+/*
+ * Flags passed to __show_mem() and show_free_areas() to suppress output in
+ * various contexts.
+ */
+#define SHOW_MEM_FILTER_NODES		(0x0001u)	/* disallowed nodes */
+
 /*
  * How many individual pages have an elevated _mapcount.  Excludes
  * the folio's entire_mapcount.
diff --git a/mm/nommu.c b/mm/nommu.c
index f670d9979a26..bff51d8ec66e 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -990,7 +990,7 @@ static int do_mmap_private(struct vm_area_struct *vma,
 enomem:
 	pr_err("Allocation of length %lu from process %d (%s) failed\n",
 	       len, current->pid, current->comm);
-	show_free_areas(0, NULL);
+	show_mem();
 	return -ENOMEM;
 }
 
@@ -1223,20 +1223,20 @@ unsigned long do_mmap(struct file *file,
 	kmem_cache_free(vm_region_jar, region);
 	pr_warn("Allocation of vma for %lu byte allocation from process %d failed\n",
 			len, current->pid);
-	show_free_areas(0, NULL);
+	show_mem();
 	return -ENOMEM;
 
 error_getting_region:
 	pr_warn("Allocation of vm region for %lu byte allocation from process %d failed\n",
 			len, current->pid);
-	show_free_areas(0, NULL);
+	show_mem();
 	return -ENOMEM;
 
 error_vma_iter_prealloc:
 	kmem_cache_free(vm_region_jar, region);
 	vm_area_free(vma);
 	pr_warn("Allocation of vma tree for process %d failed\n", current->pid);
-	show_free_areas(0, NULL);
+	show_mem();
 	return -ENOMEM;
 
 }
diff --git a/mm/show_mem.c b/mm/show_mem.c
index 01f8e9905817..09c7d036d49e 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -186,7 +186,7 @@ static bool node_has_managed_zones(pg_data_t *pgdat, int max_zone_idx)
  * SHOW_MEM_FILTER_NODES: suppress nodes that are not allowed by current's
  *   cpuset.
  */
-void __show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
+static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
 {
 	unsigned long free_pcp = 0;
 	int cpu, nid;
@@ -406,7 +406,7 @@ void __show_mem(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
 	struct zone *zone;
 
 	printk("Mem-Info:\n");
-	__show_free_areas(filter, nodemask, max_zone_idx);
+	show_free_areas(filter, nodemask, max_zone_idx);
 
 	for_each_populated_zone(zone) {
 
-- 
2.41.0

