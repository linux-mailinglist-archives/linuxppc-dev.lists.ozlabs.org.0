Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 110F0A3387
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 11:17:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KYlM1rFwzDr4m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 19:17:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KYj55ZZVzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 19:15:05 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B85E386662;
 Fri, 30 Aug 2019 09:15:02 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-243.ams2.redhat.com [10.36.117.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3306600F8;
 Fri, 30 Aug 2019 09:14:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/8] mm/memory_hotplug: Shrink zones when offlining memory
Date: Fri, 30 Aug 2019 11:14:23 +0200
Message-Id: <20190830091428.18399-4-david@redhat.com>
In-Reply-To: <20190830091428.18399-1-david@redhat.com>
References: <20190830091428.18399-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 30 Aug 2019 09:15:03 +0000 (UTC)
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

We currently try to shrink a single zone when removing memory. We use the
zone of the first page of the memory we are removing. If that memmap was
never initialized (e.g., memory was never onlined), we will read garbage
and can trigger kernel BUGs (due to a stale pointer):

:/# [   23.912993] BUG: unable to handle page fault for address: 000000000000353d
[   23.914219] #PF: supervisor write access in kernel mode
[   23.915199] #PF: error_code(0x0002) - not-present page
[   23.916160] PGD 0 P4D 0
[   23.916627] Oops: 0002 [#1] SMP PTI
[   23.917256] CPU: 1 PID: 7 Comm: kworker/u8:0 Not tainted 5.3.0-rc5-next-20190820+ #317
[   23.918900] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.4
[   23.921194] Workqueue: kacpi_hotplug acpi_hotplug_work_fn
[   23.922249] RIP: 0010:clear_zone_contiguous+0x5/0x10
[   23.923173] Code: 48 89 c6 48 89 c3 e8 2a fe ff ff 48 85 c0 75 cf 5b 5d c3 c6 85 fd 05 00 00 01 5b 5d c3 0f 1f 840
[   23.926876] RSP: 0018:ffffad2400043c98 EFLAGS: 00010246
[   23.927928] RAX: 0000000000000000 RBX: 0000000200000000 RCX: 0000000000000000
[   23.929458] RDX: 0000000000200000 RSI: 0000000000140000 RDI: 0000000000002f40
[   23.930899] RBP: 0000000140000000 R08: 0000000000000000 R09: 0000000000000001
[   23.932362] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000140000
[   23.933603] R13: 0000000000140000 R14: 0000000000002f40 R15: ffff9e3e7aff3680
[   23.934913] FS:  0000000000000000(0000) GS:ffff9e3e7bb00000(0000) knlGS:0000000000000000
[   23.936294] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   23.937481] CR2: 000000000000353d CR3: 0000000058610000 CR4: 00000000000006e0
[   23.938687] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   23.939889] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   23.941168] Call Trace:
[   23.941580]  __remove_pages+0x4b/0x640
[   23.942303]  ? mark_held_locks+0x49/0x70
[   23.943149]  arch_remove_memory+0x63/0x8d
[   23.943921]  try_remove_memory+0xdb/0x130
[   23.944766]  ? walk_memory_blocks+0x7f/0x9e
[   23.945616]  __remove_memory+0xa/0x11
[   23.946274]  acpi_memory_device_remove+0x70/0x100
[   23.947308]  acpi_bus_trim+0x55/0x90
[   23.947914]  acpi_device_hotplug+0x227/0x3a0
[   23.948714]  acpi_hotplug_work_fn+0x1a/0x30
[   23.949433]  process_one_work+0x221/0x550
[   23.950190]  worker_thread+0x50/0x3b0
[   23.950993]  kthread+0x105/0x140
[   23.951644]  ? process_one_work+0x550/0x550
[   23.952508]  ? kthread_park+0x80/0x80
[   23.953367]  ret_from_fork+0x3a/0x50
[   23.954025] Modules linked in:
[   23.954613] CR2: 000000000000353d
[   23.955248] ---[ end trace 93d982b1fb3e1a69 ]---

Instead, shrink the zones when offlining memory or when onlining failed.
Introduce and use remove_pfn_range_from_zone(() for that. We now properly
shrink the zones, even if we have DIMMs whereby
- Some memory blocks fall into no zone (never onlined)
- Some memory blocks fall into multiple zones (offlined+re-onlined)
- Multiple memory blocks that fall into different zones

Drop the zone parameter (with a potential dubious value) from
__remove_pages() and __remove_section().

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
Fixes: d0dc12e86b31 ("mm/memory_hotplug: optimize memory hotplug")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm64/mm/mmu.c            |  4 +---
 arch/ia64/mm/init.c            |  4 +---
 arch/powerpc/mm/mem.c          |  3 +--
 arch/s390/mm/init.c            |  4 +---
 arch/sh/mm/init.c              |  4 +---
 arch/x86/mm/init_32.c          |  4 +---
 arch/x86/mm/init_64.c          |  4 +---
 include/linux/memory_hotplug.h |  7 +++++--
 mm/memory_hotplug.c            | 31 ++++++++++++++++---------------
 mm/memremap.c                  |  3 +--
 10 files changed, 29 insertions(+), 39 deletions(-)

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
index f46ea71b4ffd..451efd4499cc 100644
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
@@ -345,6 +345,9 @@ extern int add_memory(int nid, u64 start, u64 size);
 extern int add_memory_resource(int nid, struct resource *resource);
 extern void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 		unsigned long nr_pages, struct vmem_altmap *altmap);
+extern void remove_pfn_range_from_zone(struct zone *zone,
+				       unsigned long start_pfn,
+				       unsigned long nr_pages);
 extern bool is_memblock_offlined(struct memory_block *mem);
 extern int sparse_add_section(int nid, unsigned long pfn,
 		unsigned long nr_pages, struct vmem_altmap *altmap);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index e0d1f6a9dfeb..4da59ec14dbb 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -457,8 +457,9 @@ static void update_pgdat_span(struct pglist_data *pgdat)
 	pgdat->node_spanned_pages = node_end_pfn - node_start_pfn;
 }
 
-static void __remove_zone(struct zone *zone, unsigned long start_pfn,
-		unsigned long nr_pages)
+void __ref remove_pfn_range_from_zone(struct zone *zone,
+				      unsigned long start_pfn,
+				      unsigned long nr_pages)
 {
 	struct pglist_data *pgdat = zone->zone_pgdat;
 	unsigned long flags;
@@ -471,28 +472,30 @@ static void __remove_zone(struct zone *zone, unsigned long start_pfn,
 	if (zone_idx(zone) == ZONE_DEVICE)
 		return;
 
+	clear_zone_contiguous(zone);
+
 	pgdat_resize_lock(zone->zone_pgdat, &flags);
 	shrink_zone_span(zone, start_pfn, start_pfn + nr_pages);
 	update_pgdat_span(pgdat);
 	pgdat_resize_unlock(zone->zone_pgdat, &flags);
+
+	set_zone_contiguous(zone);
 }
 
-static void __remove_section(struct zone *zone, unsigned long pfn,
-		unsigned long nr_pages, unsigned long map_offset,
-		struct vmem_altmap *altmap)
+static void __remove_section(unsigned long pfn, unsigned long nr_pages,
+			     unsigned long map_offset,
+			     struct vmem_altmap *altmap)
 {
 	struct mem_section *ms = __nr_to_section(pfn_to_section_nr(pfn));
 
 	if (WARN_ON_ONCE(!valid_section(ms)))
 		return;
 
-	__remove_zone(zone, pfn, nr_pages);
 	sparse_remove_section(ms, pfn, nr_pages, map_offset, altmap);
 }
 
 /**
- * __remove_pages() - remove sections of pages from a zone
- * @zone: zone from which pages need to be removed
+ * __remove_pages() - remove sections of pages
  * @pfn: starting pageframe (must be aligned to start of a section)
  * @nr_pages: number of pages to remove (must be multiple of section size)
  * @altmap: alternative device page map or %NULL if default memmap is used
@@ -502,16 +505,14 @@ static void __remove_section(struct zone *zone, unsigned long pfn,
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
 
 	map_offset = vmem_altmap_offset(altmap);
 
-	clear_zone_contiguous(zone);
-
 	if (check_pfn_span(pfn, nr_pages, "remove"))
 		return;
 
@@ -523,13 +524,11 @@ void __remove_pages(struct zone *zone, unsigned long pfn,
 		cond_resched();
 		pfns = min(nr_pages, PAGES_PER_SECTION
 				- (pfn & ~PAGE_SECTION_MASK));
-		__remove_section(zone, pfn, pfns, map_offset, altmap);
+		__remove_section(pfn, pfns, map_offset, altmap);
 		pfn += pfns;
 		nr_pages -= pfns;
 		map_offset = 0;
 	}
-
-	set_zone_contiguous(zone);
 }
 
 int set_online_page_callback(online_page_callback_t callback)
@@ -857,6 +856,7 @@ int __ref online_pages(unsigned long pfn, unsigned long nr_pages, int online_typ
 		 (unsigned long long) pfn << PAGE_SHIFT,
 		 (((unsigned long long) pfn + nr_pages) << PAGE_SHIFT) - 1);
 	memory_notify(MEM_CANCEL_ONLINE, &arg);
+	remove_pfn_range_from_zone(zone, pfn, nr_pages);
 	mem_hotplug_done();
 	return ret;
 }
@@ -1592,6 +1592,7 @@ static int __ref __offline_pages(unsigned long start_pfn,
 	writeback_set_ratelimit();
 
 	memory_notify(MEM_OFFLINE, &arg);
+	remove_pfn_range_from_zone(zone, start_pfn, nr_pages);
 	mem_hotplug_done();
 	return 0;
 
diff --git a/mm/memremap.c b/mm/memremap.c
index f6c17339cd0d..cb90c3e8804a 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -139,8 +139,7 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 	mem_hotplug_begin();
 	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
 		pfn = PHYS_PFN(res->start);
-		__remove_pages(page_zone(pfn_to_page(pfn)), pfn,
-				 PHYS_PFN(resource_size(res)), NULL);
+		__remove_pages(pfn, PHYS_PFN(resource_size(res)), NULL);
 	} else {
 		arch_remove_memory(nid, res->start, resource_size(res),
 				pgmap_altmap(pgmap));
-- 
2.21.0

