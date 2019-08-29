Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F3A124A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 09:06:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JtvK6tBwzDrRB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 17:06:37 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JtnG1M6CzDrCW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 17:01:22 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BE212308302F;
 Thu, 29 Aug 2019 07:01:18 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-166.ams2.redhat.com [10.36.117.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78B731001B05;
 Thu, 29 Aug 2019 07:01:04 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/11] mm/memory_hotplug: Remove zone parameter from
 __remove_pages()
Date: Thu, 29 Aug 2019 09:00:18 +0200
Message-Id: <20190829070019.12714-11-david@redhat.com>
In-Reply-To: <20190829070019.12714-1-david@redhat.com>
References: <20190829070019.12714-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 29 Aug 2019 07:01:19 +0000 (UTC)
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

No longer in use, let's drop it. Also drop it from __remove_section().

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
 include/linux/memory_hotplug.h |  4 ++--
 mm/memory_hotplug.c            | 13 ++++++-------
 mm/memremap.c                  |  3 +--
 10 files changed, 16 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 60c929f3683b..d10247fab0fd 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1069,7 +1069,6 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct zone *zone;
 
 	/*
 	 * FIXME: Cleanup page tables (also in arch_add_memory() in case
@@ -1078,7 +1077,6 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 	 * unplug. ARCH_ENABLE_MEMORY_HOTREMOVE must not be
 	 * unlocked yet.
 	 */
-	zone = page_zone(pfn_to_page(start_pfn));
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 }
 #endif
diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
index bf9df2625bc8..a6dd80a2c939 100644
--- a/arch/ia64/mm/init.c
+++ b/arch/ia64/mm/init.c
@@ -689,9 +689,7 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct zone *zone;
 
-	zone = page_zone(pfn_to_page(start_pfn));
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 }
 #endif
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 69f99128a8d6..f3a5e397b911 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -130,10 +130,9 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct page *page = pfn_to_page(start_pfn) + vmem_altmap_offset(altmap);
 	int ret;
 
-	__remove_pages(page_zone(page), start_pfn, nr_pages, altmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 
 	/* Remove htab bolted mappings for this section of memory */
 	start = (unsigned long)__va(start);
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 20340a03ad90..6f13eb66e375 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -296,10 +296,8 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct zone *zone;
 
-	zone = page_zone(pfn_to_page(start_pfn));
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 	vmem_remove_mapping(start, size);
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index dfdbaa50946e..d1b1ff2be17a 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -434,9 +434,7 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = PFN_DOWN(start);
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct zone *zone;
 
-	zone = page_zone(pfn_to_page(start_pfn));
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 4068abb9427f..9d036be27aaa 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -865,10 +865,8 @@ void arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct zone *zone;
 
-	zone = page_zone(pfn_to_page(start_pfn));
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 }
 #endif
 
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index a6b5c653727b..b8541d77452c 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1212,10 +1212,8 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct page *page = pfn_to_page(start_pfn) + vmem_altmap_offset(altmap);
-	struct zone *zone = page_zone(page);
 
-	__remove_pages(zone, start_pfn, nr_pages, altmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 	kernel_physical_mapping_remove(start, start + size);
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index f27559f11b64..85040ba5180c 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -125,8 +125,8 @@ static inline bool movable_node_is_enabled(void)
 
 extern void arch_remove_memory(int nid, u64 start, u64 size,
 			       struct vmem_altmap *altmap);
-extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
-			   unsigned long nr_pages, struct vmem_altmap *altmap);
+extern void __remove_pages(unsigned long start_pfn, unsigned long nr_pages,
+			   struct vmem_altmap *altmap);
 
 /* reasonably generic interface to expand the physical pages */
 extern int __add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 75859a57ecda..fe29c637c0a8 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -501,9 +501,9 @@ void __ref remove_pfn_range_from_zone(struct zone *zone,
 	set_zone_contiguous(zone);
 }
 
-static void __remove_section(struct zone *zone, unsigned long pfn,
-		unsigned long nr_pages, unsigned long map_offset,
-		struct vmem_altmap *altmap)
+static void __remove_section(unsigned long pfn, unsigned long nr_pages,
+			     unsigned long map_offset,
+			     struct vmem_altmap *altmap)
 {
 	struct mem_section *ms = __nr_to_section(pfn_to_section_nr(pfn));
 
@@ -515,7 +515,6 @@ static void __remove_section(struct zone *zone, unsigned long pfn,
 
 /**
  * __remove_pages() - remove sections of pages from a zone
- * @zone: zone from which pages need to be removed
  * @pfn: starting pageframe (must be aligned to start of a section)
  * @nr_pages: number of pages to remove (must be multiple of section size)
  * @altmap: alternative device page map or %NULL if default memmap is used
@@ -525,8 +524,8 @@ static void __remove_section(struct zone *zone, unsigned long pfn,
  * sure that pages are marked reserved and zones are adjust properly by
  * calling offline_pages().
  */
-void __remove_pages(struct zone *zone, unsigned long pfn,
-		    unsigned long nr_pages, struct vmem_altmap *altmap)
+void __remove_pages(unsigned long pfn, unsigned long nr_pages,
+		    struct vmem_altmap *altmap)
 {
 	unsigned long map_offset = 0;
 	unsigned long nr, start_sec, end_sec;
@@ -544,7 +543,7 @@ void __remove_pages(struct zone *zone, unsigned long pfn,
 		cond_resched();
 		pfns = min(nr_pages, PAGES_PER_SECTION
 				- (pfn & ~PAGE_SECTION_MASK));
-		__remove_section(zone, pfn, pfns, map_offset, altmap);
+		__remove_section(pfn, pfns, map_offset, altmap);
 		pfn += pfns;
 		nr_pages -= pfns;
 		map_offset = 0;
diff --git a/mm/memremap.c b/mm/memremap.c
index 7c662643a0aa..99e38cfcec95 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -140,8 +140,7 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 	remove_pfn_range_from_zone(page_zone(pfn_to_page(pfn)), pfn,
 				   PHYS_PFN(resource_size(res)));
 	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
-		__remove_pages(page_zone(pfn_to_page(pfn)), pfn,
-				 PHYS_PFN(resource_size(res)), NULL);
+		__remove_pages(pfn, PHYS_PFN(resource_size(res)), NULL);
 	} else {
 		arch_remove_memory(nid, res->start, resource_size(res),
 				pgmap_altmap(pgmap));
-- 
2.21.0

