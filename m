Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8C7248B69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 18:22:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWGR60KTFzDqfk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 02:22:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Q2YllB9n; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWF2k0Z0jzDqc5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 01:19:57 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD7D0207DE;
 Tue, 18 Aug 2020 15:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763995;
 bh=ozDs+ikcDN9A8o1w1ZdwHNmljXS0aLZyo/vOcdPYmPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q2YllB9nxUs1S8Yq+B7V9TZ9cWz5F/+xOingwwq7uoFzA7Y3VtgRDQ88+C68JDaKk
 9Cp0/R0cjM1AjjyNT45D7/sgkudmCC50TRmJL2WZildNh9PimFmugzn8K80+/wDka2
 Rhm31KncO57PPdeDTZwxahtVjAg9quHFjMnG2guE=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 17/17] memblock: use separate iterators for memory and
 reserved regions
Date: Tue, 18 Aug 2020 18:16:34 +0300
Message-Id: <20200818151634.14343-18-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

for_each_memblock() is used to iterate over memblock.memory in
a few places that use data from memblock_region rather than the memory
ranges.

Introduce separate for_each_mem_region() and for_each_reserved_mem_region()
to improve encapsulation of memblock internals from its users.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: Baoquan He <bhe@redhat.com>
Acked-by: Ingo Molnar <mingo@kernel.org>		   # x86
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>  # MIPS
Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>   # .clang-format
---
 .clang-format                  |  3 ++-
 arch/arm64/kernel/setup.c      |  2 +-
 arch/arm64/mm/numa.c           |  2 +-
 arch/mips/netlogic/xlp/setup.c |  2 +-
 arch/riscv/mm/init.c           |  2 +-
 arch/x86/mm/numa.c             |  2 +-
 include/linux/memblock.h       | 19 ++++++++++++++++---
 mm/memblock.c                  |  4 ++--
 mm/page_alloc.c                |  8 ++++----
 9 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/.clang-format b/.clang-format
index 2b77cc419b97..a118fdde25c1 100644
--- a/.clang-format
+++ b/.clang-format
@@ -201,7 +201,7 @@ ForEachMacros:
   - 'for_each_matching_node'
   - 'for_each_matching_node_and_match'
   - 'for_each_member'
-  - 'for_each_memblock'
+  - 'for_each_mem_region'
   - 'for_each_memblock_type'
   - 'for_each_memcg_cache_index'
   - 'for_each_mem_pfn_range'
@@ -268,6 +268,7 @@ ForEachMacros:
   - 'for_each_property_of_node'
   - 'for_each_registered_fb'
   - 'for_each_reserved_mem_range'
+  - 'for_each_reserved_mem_region'
   - 'for_each_rtd_codec_dais'
   - 'for_each_rtd_codec_dais_rollback'
   - 'for_each_rtd_components'
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index a986c6f8ab42..dcce72ac072b 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -217,7 +217,7 @@ static void __init request_standard_resources(void)
 	if (!standard_resources)
 		panic("%s: Failed to allocate %zu bytes\n", __func__, res_size);
 
-	for_each_memblock(memory, region) {
+	for_each_mem_region(region) {
 		res = &standard_resources[i++];
 		if (memblock_is_nomap(region)) {
 			res->name  = "reserved";
diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 8a97cd3d2dfe..5efdbd01a59c 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -350,7 +350,7 @@ static int __init numa_register_nodes(void)
 	struct memblock_region *mblk;
 
 	/* Check that valid nid is set to memblks */
-	for_each_memblock(memory, mblk) {
+	for_each_mem_region(mblk) {
 		int mblk_nid = memblock_get_region_node(mblk);
 
 		if (mblk_nid == NUMA_NO_NODE || mblk_nid >= MAX_NUMNODES) {
diff --git a/arch/mips/netlogic/xlp/setup.c b/arch/mips/netlogic/xlp/setup.c
index 1a0fc5b62ba4..6e3102bcd2f1 100644
--- a/arch/mips/netlogic/xlp/setup.c
+++ b/arch/mips/netlogic/xlp/setup.c
@@ -70,7 +70,7 @@ static void nlm_fixup_mem(void)
 	const int pref_backup = 512;
 	struct memblock_region *mem;
 
-	for_each_memblock(memory, mem) {
+	for_each_mem_region(mem) {
 		memblock_remove(mem->base + mem->size - pref_backup,
 			pref_backup);
 	}
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 06355716d19a..1fb6a826c2fd 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -531,7 +531,7 @@ static void __init resource_init(void)
 {
 	struct memblock_region *region;
 
-	for_each_memblock(memory, region) {
+	for_each_mem_region(region) {
 		struct resource *res;
 
 		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index aa76ec2d359b..b6246768479d 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -516,7 +516,7 @@ static void __init numa_clear_kernel_node_hotplug(void)
 	 *   memory ranges, because quirks such as trim_snb_memory()
 	 *   reserve specific pages for Sandy Bridge graphics. ]
 	 */
-	for_each_memblock(reserved, mb_region) {
+	for_each_reserved_mem_region(mb_region) {
 		int nid = memblock_get_region_node(mb_region);
 
 		if (nid != MAX_NUMNODES)
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 354078713cd1..ef131255cedc 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -553,9 +553,22 @@ static inline unsigned long memblock_region_reserved_end_pfn(const struct memblo
 	return PFN_UP(reg->base + reg->size);
 }
 
-#define for_each_memblock(memblock_type, region)					\
-	for (region = memblock.memblock_type.regions;					\
-	     region < (memblock.memblock_type.regions + memblock.memblock_type.cnt);	\
+/**
+ * for_each_mem_region - itereate over memory regions
+ * @region: loop variable
+ */
+#define for_each_mem_region(region)					\
+	for (region = memblock.memory.regions;				\
+	     region < (memblock.memory.regions + memblock.memory.cnt);	\
+	     region++)
+
+/**
+ * for_each_reserved_mem_region - itereate over reserved memory regions
+ * @region: loop variable
+ */
+#define for_each_reserved_mem_region(region)				\
+	for (region = memblock.reserved.regions;			\
+	     region < (memblock.reserved.regions + memblock.reserved.cnt); \
 	     region++)
 
 extern void *alloc_large_system_hash(const char *tablename,
diff --git a/mm/memblock.c b/mm/memblock.c
index d0be57acccf2..4eacfed872c4 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1664,7 +1664,7 @@ static phys_addr_t __init_memblock __find_max_addr(phys_addr_t limit)
 	 * the memory memblock regions, if the @limit exceeds the total size
 	 * of those regions, max_addr will keep original value PHYS_ADDR_MAX
 	 */
-	for_each_memblock(memory, r) {
+	for_each_mem_region(r) {
 		if (limit <= r->size) {
 			max_addr = r->base + limit;
 			break;
@@ -1834,7 +1834,7 @@ void __init_memblock memblock_trim_memory(phys_addr_t align)
 	phys_addr_t start, end, orig_start, orig_end;
 	struct memblock_region *r;
 
-	for_each_memblock(memory, r) {
+	for_each_mem_region(r) {
 		orig_start = r->base;
 		orig_end = r->base + r->size;
 		start = round_up(orig_start, align);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12da56b1cf39..366982d1a1c2 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5950,7 +5950,7 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
 
 	if (mirrored_kernelcore && zone == ZONE_MOVABLE) {
 		if (!r || *pfn >= memblock_region_memory_end_pfn(r)) {
-			for_each_memblock(memory, r) {
+			for_each_mem_region(r) {
 				if (*pfn < memblock_region_memory_end_pfn(r))
 					break;
 			}
@@ -6535,7 +6535,7 @@ static unsigned long __init zone_absent_pages_in_node(int nid,
 		unsigned long start_pfn, end_pfn;
 		struct memblock_region *r;
 
-		for_each_memblock(memory, r) {
+		for_each_mem_region(r) {
 			start_pfn = clamp(memblock_region_memory_base_pfn(r),
 					  zone_start_pfn, zone_end_pfn);
 			end_pfn = clamp(memblock_region_memory_end_pfn(r),
@@ -7129,7 +7129,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 	 * options.
 	 */
 	if (movable_node_is_enabled()) {
-		for_each_memblock(memory, r) {
+		for_each_mem_region(r) {
 			if (!memblock_is_hotpluggable(r))
 				continue;
 
@@ -7150,7 +7150,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 	if (mirrored_kernelcore) {
 		bool mem_below_4gb_not_mirrored = false;
 
-		for_each_memblock(memory, r) {
+		for_each_mem_region(r) {
 			if (memblock_is_mirror(r))
 				continue;
 
-- 
2.26.2

