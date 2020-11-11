Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ED72AF477
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 16:11:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWSqx4ggnzDqys
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 02:11:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FjlD6IMO; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FjlD6IMO; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWSRf2RbWzDqQl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 01:54:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MWnBRq9PHvur9WoMxYhfb4ZElv4UhjwblZCapc3dW1k=;
 b=FjlD6IMOOtBAy1UuqorakBB0OB6l9kT59qUCZhBpWalZjZXS8o4p7PT6IgYZrIBfdh533E
 8p15G7dudve1ljRYdX87f5KlrEpDQbFFUx1Xsql7GlUIAiiZqHBlrULpp8ZbEUZh64wQ3g
 ib5ATTelRLJG0mqX1zhMxVeVHVI0JYA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MWnBRq9PHvur9WoMxYhfb4ZElv4UhjwblZCapc3dW1k=;
 b=FjlD6IMOOtBAy1UuqorakBB0OB6l9kT59qUCZhBpWalZjZXS8o4p7PT6IgYZrIBfdh533E
 8p15G7dudve1ljRYdX87f5KlrEpDQbFFUx1Xsql7GlUIAiiZqHBlrULpp8ZbEUZh64wQ3g
 ib5ATTelRLJG0mqX1zhMxVeVHVI0JYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-pkCbRx5rMSKc3AjbWQCS4A-1; Wed, 11 Nov 2020 09:53:59 -0500
X-MC-Unique: pkCbRx5rMSKc3AjbWQCS4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A5F51099F76;
 Wed, 11 Nov 2020 14:53:57 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-151.ams2.redhat.com [10.36.114.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 711F927BB5;
 Wed, 11 Nov 2020 14:53:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] powernv/memtrace: don't abuse memory hot(un)plug
 infrastructure for memory allocations
Date: Wed, 11 Nov 2020 15:53:22 +0100
Message-Id: <20201111145322.15793-9-david@redhat.com>
In-Reply-To: <20201111145322.15793-1-david@redhat.com>
References: <20201111145322.15793-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Michal Hocko <mhocko@suse.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's use alloc_contig_pages() for allocating memory and remove the
linear mapping manually via arch_remove_linear_mapping(). Mark all pages
PG_offline, such that they will definitely not get touched - e.g.,
when hibernating. When freeing memory, try to revert what we did.

The original idea was discussed in:
 https://lkml.kernel.org/r/48340e96-7e6b-736f-9e23-d3111b915b6e@redhat.com

This is similar to CONFIG_DEBUG_PAGEALLOC handling on other
architectures, whereby only single pages are unmapped from the linear
mapping. Let's mimic what memory hot(un)plug would do with the linear
mapping.

We now need MEMORY_HOTPLUG and CONTIG_ALLOC as dependencies. Add a TODO
that we want to use __GFP_ZERO for clearing once alloc_contig_pages()
understands that.

Tested with in QEMU/TCG with 10 GiB of main memory:
  [root@localhost ~]# echo 0x40000000 > /sys/kernel/debug/powerpc/memtrace/enable
  [  105.903043][ T1080] memtrace: Allocated trace memory on node 0 at 0x0000000080000000
  [root@localhost ~]# echo 0x40000000 > /sys/kernel/debug/powerpc/memtrace/enable
  [  145.042493][ T1080] radix-mmu: Mapped 0x0000000080000000-0x00000000c0000000 with 64.0 KiB pages
  [  145.049019][ T1080] memtrace: Freed trace memory back on node 0
  [  145.333960][ T1080] memtrace: Allocated trace memory on node 0 at 0x0000000080000000
  [root@localhost ~]# echo 0x80000000 > /sys/kernel/debug/powerpc/memtrace/enable
  [  213.606916][ T1080] radix-mmu: Mapped 0x0000000080000000-0x00000000c0000000 with 64.0 KiB pages
  [  213.613855][ T1080] memtrace: Freed trace memory back on node 0
  [  214.185094][ T1080] memtrace: Allocated trace memory on node 0 at 0x0000000080000000
  [root@localhost ~]# echo 0x100000000 > /sys/kernel/debug/powerpc/memtrace/enable
  [  234.874872][ T1080] radix-mmu: Mapped 0x0000000080000000-0x0000000100000000 with 64.0 KiB pages
  [  234.886974][ T1080] memtrace: Freed trace memory back on node 0
  [  234.890153][ T1080] memtrace: Failed to allocate trace memory on node 0
  [root@localhost ~]# echo 0x40000000 > /sys/kernel/debug/powerpc/memtrace/enable
  [  259.490196][ T1080] memtrace: Allocated trace memory on node 0 at 0x0000000080000000

I also made sure allocated memory is properly zeroed.

Note 1: We currently won't be allocating from ZONE_MOVABLE - because our
	pages are not movable. However, as we don't run with any memory
	hot(un)plug mechanism around, we could make an exception to
	increase the chance of allocations succeeding.

Note 2: PG_reserved isn't sufficient. E.g., kernel_page_present() used
	along PG_reserved in hibernation code will always return "true"
	on powerpc, resulting in the pages getting touched. It's too
	generic - e.g., indicates boot allocations.

Note 3: For now, we keep using memory_block_size_bytes() as minimum
	granularity.

Suggested-by: Michal Hocko <mhocko@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Rashmica Gupta <rashmica.g@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/Kconfig    |   8 +-
 arch/powerpc/platforms/powernv/memtrace.c | 163 ++++++++--------------
 2 files changed, 62 insertions(+), 109 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 938803eab0ad..619b093a0657 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -27,11 +27,11 @@ config OPAL_PRD
 	  recovery diagnostics on OpenPower machines
 
 config PPC_MEMTRACE
-	bool "Enable removal of RAM from kernel mappings for tracing"
-	depends on PPC_POWERNV && MEMORY_HOTREMOVE
+	bool "Enable runtime allocation of RAM for tracing"
+	depends on PPC_POWERNV && MEMORY_HOTPLUG && CONTIG_ALLOC
 	help
-	  Enabling this option allows for the removal of memory (RAM)
-	  from the kernel mappings to be used for hardware tracing.
+	  Enabling this option allows for runtime allocation of memory (RAM)
+	  for hardware tracing.
 
 config PPC_VAS
 	bool "IBM Virtual Accelerator Switchboard (VAS)"
diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 0e42fe2d7b6a..5fc9408bb0b3 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -51,33 +51,12 @@ static const struct file_operations memtrace_fops = {
 	.open	= simple_open,
 };
 
-static int check_memblock_online(struct memory_block *mem, void *arg)
-{
-	if (mem->state != MEM_ONLINE)
-		return -1;
-
-	return 0;
-}
-
-static int change_memblock_state(struct memory_block *mem, void *arg)
-{
-	unsigned long state = (unsigned long)arg;
-
-	mem->state = state;
-
-	return 0;
-}
-
 static void memtrace_clear_range(unsigned long start_pfn,
 				 unsigned long nr_pages)
 {
 	unsigned long pfn;
 
-	/*
-	 * As pages are offline, we cannot trust the memmap anymore. As HIGHMEM
-	 * does not apply, avoid passing around "struct page" and use
-	 * clear_page() instead directly.
-	 */
+	/* As HIGHMEM does not apply, use clear_page() directly. */
 	for (pfn = start_pfn; pfn < start_pfn + nr_pages; pfn++) {
 		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
 			cond_resched();
@@ -85,72 +64,39 @@ static void memtrace_clear_range(unsigned long start_pfn,
 	}
 }
 
-/* called with device_hotplug_lock held */
-static bool memtrace_offline_pages(u32 nid, u64 start_pfn, u64 nr_pages)
-{
-	const unsigned long start = PFN_PHYS(start_pfn);
-	const unsigned long size = PFN_PHYS(nr_pages);
-
-	if (walk_memory_blocks(start, size, NULL, check_memblock_online))
-		return false;
-
-	walk_memory_blocks(start, size, (void *)MEM_GOING_OFFLINE,
-			   change_memblock_state);
-
-	if (offline_pages(start_pfn, nr_pages)) {
-		walk_memory_blocks(start, size, (void *)MEM_ONLINE,
-				   change_memblock_state);
-		return false;
-	}
-
-	walk_memory_blocks(start, size, (void *)MEM_OFFLINE,
-			   change_memblock_state);
-
-
-	return true;
-}
-
 static u64 memtrace_alloc_node(u32 nid, u64 size)
 {
-	u64 start_pfn, end_pfn, nr_pages, pfn;
-	u64 base_pfn;
-	u64 bytes = memory_block_size_bytes();
+	const unsigned long nr_pages = PHYS_PFN(size);
+	unsigned long pfn, start_pfn;
+	struct page *page;
 
-	if (!node_spanned_pages(nid))
+	/*
+	 * Trace memory needs to be aligned to the size, which is guaranteed
+	 * by alloc_contig_pages().
+	 */
+	page = alloc_contig_pages(nr_pages, GFP_KERNEL | __GFP_THISNODE |
+				  __GFP_NOWARN, nid, NULL);
+	if (!page)
 		return 0;
+	start_pfn = page_to_pfn(page);
 
-	start_pfn = node_start_pfn(nid);
-	end_pfn = node_end_pfn(nid);
-	nr_pages = size >> PAGE_SHIFT;
-
-	/* Trace memory needs to be aligned to the size */
-	end_pfn = round_down(end_pfn - nr_pages, nr_pages);
-
-	lock_device_hotplug();
-	for (base_pfn = end_pfn; base_pfn > start_pfn; base_pfn -= nr_pages) {
-		if (memtrace_offline_pages(nid, base_pfn, nr_pages) == true) {
-			/*
-			 * Clear the range while we still have a linear
-			 * mapping.
-			 */
-			memtrace_clear_range(base_pfn, nr_pages);
-			/*
-			 * Remove memory in memory block size chunks so that
-			 * iomem resources are always split to the same size and
-			 * we never try to remove memory that spans two iomem
-			 * resources.
-			 */
-			end_pfn = base_pfn + nr_pages;
-			for (pfn = base_pfn; pfn < end_pfn; pfn += bytes>> PAGE_SHIFT) {
-				__remove_memory(nid, pfn << PAGE_SHIFT, bytes);
-			}
-			unlock_device_hotplug();
-			return base_pfn << PAGE_SHIFT;
-		}
-	}
-	unlock_device_hotplug();
+	/*
+	 * Clear the range while we still have a linear mapping.
+	 *
+	 * TODO: use __GFP_ZERO with alloc_contig_pages() once supported.
+	 */
+	memtrace_clear_range(start_pfn, nr_pages);
 
-	return 0;
+	/*
+	 * Set pages PageOffline(), to indicate that nobody (e.g., hibernation,
+	 * dumping, ...) should be touching these pages.
+	 */
+	for (pfn = start_pfn; pfn < start_pfn + nr_pages; pfn++)
+		__SetPageOffline(pfn_to_page(pfn));
+
+	arch_remove_linear_mapping(PFN_PHYS(start_pfn), size);
+
+	return PFN_PHYS(start_pfn);
 }
 
 static int memtrace_init_regions_runtime(u64 size)
@@ -220,16 +166,30 @@ static int memtrace_init_debugfs(void)
 	return ret;
 }
 
-static int online_mem_block(struct memory_block *mem, void *arg)
+static int memtrace_free(int nid, u64 start, u64 size)
 {
-	return device_online(&mem->dev);
+	struct mhp_params params = { .pgprot = PAGE_KERNEL };
+	const unsigned long nr_pages = PHYS_PFN(size);
+	const unsigned long start_pfn = PHYS_PFN(start);
+	unsigned long pfn;
+	int ret;
+
+	ret = arch_create_linear_mapping(nid, start, size, &params);
+	if (ret)
+		return ret;
+
+	for (pfn = start_pfn; pfn < start_pfn + nr_pages; pfn++)
+		__ClearPageOffline(pfn_to_page(pfn));
+
+	free_contig_range(start_pfn, nr_pages);
+	return 0;
 }
 
 /*
- * Iterate through the chunks of memory we have removed from the kernel
- * and attempt to add them back to the kernel.
+ * Iterate through the chunks of memory we allocated and attempt to expose
+ * them back to the kernel.
  */
-static int memtrace_online(void)
+static int memtrace_free_regions(void)
 {
 	int i, ret = 0;
 	struct memtrace_entry *ent;
@@ -237,7 +197,7 @@ static int memtrace_online(void)
 	for (i = memtrace_array_nr - 1; i >= 0; i--) {
 		ent = &memtrace_array[i];
 
-		/* We have onlined this chunk previously */
+		/* We have freed this chunk previously */
 		if (ent->nid == NUMA_NO_NODE)
 			continue;
 
@@ -247,30 +207,25 @@ static int memtrace_online(void)
 			ent->mem = 0;
 		}
 
-		if (add_memory(ent->nid, ent->start, ent->size, MHP_NONE)) {
-			pr_err("Failed to add trace memory to node %d\n",
+		if (memtrace_free(ent->nid, ent->start, ent->size)) {
+			pr_err("Failed to free trace memory on node %d\n",
 				ent->nid);
 			ret += 1;
 			continue;
 		}
 
-		lock_device_hotplug();
-		walk_memory_blocks(ent->start, ent->size, NULL,
-				   online_mem_block);
-		unlock_device_hotplug();
-
 		/*
-		 * Memory was added successfully so clean up references to it
-		 * so on reentry we can tell that this chunk was added.
+		 * Memory was freed successfully so clean up references to it
+		 * so on reentry we can tell that this chunk was freed.
 		 */
 		debugfs_remove_recursive(ent->dir);
-		pr_info("Added trace memory back to node %d\n", ent->nid);
+		pr_info("Freed trace memory back on node %d\n", ent->nid);
 		ent->size = ent->start = ent->nid = NUMA_NO_NODE;
 	}
 	if (ret)
 		return ret;
 
-	/* If all chunks of memory were added successfully, reset globals */
+	/* If all chunks of memory were freed successfully, reset globals */
 	kfree(memtrace_array);
 	memtrace_array = NULL;
 	memtrace_size = 0;
@@ -295,18 +250,16 @@ static int memtrace_enable_set(void *data, u64 val)
 
 	mutex_lock(&memtrace_mutex);
 
-	/* Re-add/online previously removed/offlined memory */
-	if (memtrace_size) {
-		if (memtrace_online())
-			goto out_unlock;
-	}
+	/* Free all previously allocated memory. */
+	if (memtrace_size && memtrace_free_regions())
+		goto out_unlock;
 
 	if (!val) {
 		rc = 0;
 		goto out_unlock;
 	}
 
-	/* Offline and remove memory */
+	/* Allocate memory. */
 	if (memtrace_init_regions_runtime(val))
 		goto out_unlock;
 
-- 
2.26.2

