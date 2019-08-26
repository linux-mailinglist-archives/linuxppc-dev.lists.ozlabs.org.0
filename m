Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ADA9CD19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 12:12:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H79T6c23zDqLR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 20:12:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H77L4VCWzDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:10:54 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 098A33082E51;
 Mon, 26 Aug 2019 10:10:52 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-227.ams2.redhat.com [10.36.116.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C94E26060D;
 Mon, 26 Aug 2019 10:10:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] mm/memory_hotplug: Pass nid instead of zone to
 __remove_pages()
Date: Mon, 26 Aug 2019 12:10:12 +0200
Message-Id: <20190826101012.10575-7-david@redhat.com>
In-Reply-To: <20190826101012.10575-1-david@redhat.com>
References: <20190826101012.10575-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 26 Aug 2019 10:10:52 +0000 (UTC)
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org,
 Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Michal Hocko <mhocko@suse.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Yu Zhao <yuzhao@google.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-sh@vger.kernel.org, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Jun Yao <yaojun8558363@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Ira Weiny <ira.weiny@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Oscar Salvador <osalvador@suse.de>, Tony Luck <tony.luck@intel.com>,
 Steve Capper <steve.capper@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The zone parameter is no longer in use. Replace it with the nid, which
we can now use the nid to limit the number of zones we have to process
(vie for_each_zone_nid()). The function signature of __remove_pages() now
looks much more similar to the one of __add_pages().

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yu Zhao <yuzhao@google.com>
Cc: Jun Yao <yaojun8558363@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: Qian Cai <cai@lca.pw>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Logan Gunthorpe <logang@deltatee.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm64/mm/mmu.c            |  4 +---
 arch/ia64/mm/init.c            |  4 +---
 arch/powerpc/mm/mem.c          |  3 +--
 arch/s390/mm/init.c            |  4 +---
 arch/sh/mm/init.c              |  4 +---
 arch/x86/mm/init_32.c          |  4 +---
 arch/x86/mm/init_64.c          |  4 +---
 include/linux/memory_hotplug.h |  2 +-
 mm/memory_hotplug.c            | 17 +++++++++--------
 mm/memremap.c                  |  3 +--
 10 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e67bab4d613e..9a2d388314f3 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1080,7 +1080,6 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct zone *zone;
 
 	/*
 	 * FIXME: Cleanup page tables (also in arch_add_memory() in case
@@ -1089,7 +1088,6 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 	 * unplug. ARCH_ENABLE_MEMORY_HOTREMOVE must not be
 	 * unlocked yet.
 	 */
-	zone = page_zone(pfn_to_page(start_pfn));
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(nid, start_pfn, nr_pages, altmap);
 }
 #endif
diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
index bf9df2625bc8..ae6a3e718aa0 100644
--- a/arch/ia64/mm/init.c
+++ b/arch/ia64/mm/init.c
@@ -689,9 +689,7 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct zone *zone;
 
-	zone = page_zone(pfn_to_page(start_pfn));
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(nid, start_pfn, nr_pages, altmap);
 }
 #endif
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 9191a66b3bc5..af21e13529ce 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -130,10 +130,9 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct page *page = pfn_to_page(start_pfn) + vmem_altmap_offset(altmap);
 	int ret;
 
-	__remove_pages(page_zone(page), start_pfn, nr_pages, altmap);
+	__remove_pages(nid, start_pfn, nr_pages, altmap);
 
 	/* Remove htab bolted mappings for this section of memory */
 	start = (unsigned long)__va(start);
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 20340a03ad90..2a7373ed6ded 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -296,10 +296,8 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct zone *zone;
 
-	zone = page_zone(pfn_to_page(start_pfn));
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(nid, start_pfn, nr_pages, altmap);
 	vmem_remove_mapping(start, size);
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index dfdbaa50946e..32441b59297d 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -434,9 +434,7 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = PFN_DOWN(start);
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct zone *zone;
 
-	zone = page_zone(pfn_to_page(start_pfn));
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(nid, start_pfn, nr_pages, altmap);
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 4068abb9427f..2760e4bfbc56 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -865,10 +865,8 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct zone *zone;
 
-	zone = page_zone(pfn_to_page(start_pfn));
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(nid, start_pfn, nr_pages, altmap);
 }
 #endif
 
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index a6b5c653727b..99d92297f1cf 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1212,10 +1212,8 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct page *page = pfn_to_page(start_pfn) + vmem_altmap_offset(altmap);
-	struct zone *zone = page_zone(page);
 
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(nid, start_pfn, nr_pages, altmap);
 	kernel_physical_mapping_remove(start, start + size);
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index f46ea71b4ffd..c5b38e7dc8aa 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -125,7 +125,7 @@ static inline bool movable_node_is_enabled(void)
 
 extern void arch_remove_memory(int nid, u64 start, u64 size,
 			       struct vmem_altmap *altmap);
-extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
+extern void __remove_pages(int nid, unsigned long start_pfn,
 			   unsigned long nr_pages, struct vmem_altmap *altmap);
 
 /* reasonably generic interface to expand the physical pages */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index e88c96cf9d77..49ca3364eb70 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -514,7 +514,7 @@ static void __remove_zone(struct zone *zone, unsigned long start_pfn,
 	pgdat_resize_unlock(zone->zone_pgdat, &flags);
 }
 
-static void __remove_section(unsigned long pfn, unsigned long nr_pages,
+static void __remove_section(int nid, unsigned long pfn, unsigned long nr_pages,
 			     unsigned long map_offset,
 			     struct vmem_altmap *altmap)
 {
@@ -525,14 +525,14 @@ static void __remove_section(unsigned long pfn, unsigned long nr_pages,
 		return;
 
 	/* TODO: move zone handling out of memory removal path */
-	for_each_zone(zone)
+	for_each_zone_nid(zone, nid)
 		__remove_zone(zone, pfn, nr_pages);
 	sparse_remove_section(ms, pfn, nr_pages, map_offset, altmap);
 }
 
 /**
  * __remove_pages() - remove sections of pages from a zone
- * @zone: zone from which pages need to be removed
+ * @nid: the nid all pages were added to
  * @pfn: starting pageframe (must be aligned to start of a section)
  * @nr_pages: number of pages to remove (must be multiple of section size)
  * @altmap: alternative device page map or %NULL if default memmap is used
@@ -542,12 +542,13 @@ static void __remove_section(unsigned long pfn, unsigned long nr_pages,
  * sure that pages are marked reserved and zones are adjust properly by
  * calling offline_pages().
  */
-void __remove_pages(struct zone *zone, unsigned long pfn,
-		    unsigned long nr_pages, struct vmem_altmap *altmap)
+void __remove_pages(int nid, unsigned long pfn, unsigned long nr_pages,
+		    struct vmem_altmap *altmap)
 {
 	const unsigned long end_pfn = pfn + nr_pages;
 	unsigned long cur_nr_pages;
 	unsigned long map_offset = 0;
+	struct zone *zone;
 
 	if (check_pfn_span(pfn, nr_pages, "remove"))
 		return;
@@ -555,7 +556,7 @@ void __remove_pages(struct zone *zone, unsigned long pfn,
 	map_offset = vmem_altmap_offset(altmap);
 
 	/* TODO: move zone handling out of memory removal path */
-	for_each_zone(zone)
+	for_each_zone_nid(zone, nid)
 		if (zone_intersects(zone, pfn, nr_pages))
 			clear_zone_contiguous(zone);
 
@@ -563,12 +564,12 @@ void __remove_pages(struct zone *zone, unsigned long pfn,
 		cond_resched();
 		/* Select all remaining pages up to the next section boundary */
 		cur_nr_pages = min(end_pfn - pfn, -(pfn | PAGE_SECTION_MASK));
-		__remove_section(pfn, cur_nr_pages, map_offset, altmap);
+		__remove_section(nid, pfn, cur_nr_pages, map_offset, altmap);
 		map_offset = 0;
 	}
 
 	/* TODO: move zone handling out of memory removal path */
-	for_each_zone(zone)
+	for_each_zone_nid(zone, nid)
 		set_zone_contiguous(zone);
 }
 
diff --git a/mm/memremap.c b/mm/memremap.c
index 8a394552b5bd..292ef4c6b447 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -138,8 +138,7 @@ static void devm_memremap_pages_release(void *data)
 	mem_hotplug_begin();
 	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
 		pfn = PHYS_PFN(res->start);
-		__remove_pages(page_zone(pfn_to_page(pfn)), pfn,
-				 PHYS_PFN(resource_size(res)), NULL);
+		__remove_pages(nid, pfn, PHYS_PFN(resource_size(res)), NULL);
 	} else {
 		arch_remove_memory(nid, res->start, resource_size(res),
 				pgmap_altmap(pgmap));
-- 
2.21.0

