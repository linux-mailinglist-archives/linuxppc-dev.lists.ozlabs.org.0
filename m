Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 399FA2301A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 07:22:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BG4nJ3wyjzDqv8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 15:22:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=x+PwdBnF; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BG4Yp5l4WzDr1V
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 15:12:45 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 062C32177B;
 Tue, 28 Jul 2020 05:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913163;
 bh=AgkSEjcZN+4R6IPrVqzpRXpoFcyMHs54nGgAVWDTHPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=x+PwdBnFBSyRKhO6/VqoU+SYFSiUr4ZPNt1hhIVRjzQ9HePzYy2S+Yej0Z/u11LyZ
 uG+rbcxXiMNQpl4LSWOpjj+pufoPsK+yHEQT836x2daZ8a9CQWGcIAPHex79AOe15D
 gx9ohcFjCH4Hd8YFqXCT+rPcPQSgxmmLmhUebxnM=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 03/15] arm,
 xtensa: simplify initialization of high memory pages
Date: Tue, 28 Jul 2020 08:11:41 +0300
Message-Id: <20200728051153.1590-4-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

The function free_highpages() in both arm and xtensa essentially open-code
for_each_free_mem_range() loop to detect high memory pages that were not
reserved and that should be initialized and passed to the buddy allocator.

Replace open-coded implementation of for_each_free_mem_range() with usage
of memblock API to simplify the code.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arm/mm/init.c    | 48 +++++++------------------------------
 arch/xtensa/mm/init.c | 55 ++++++++-----------------------------------
 2 files changed, 18 insertions(+), 85 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 01e18e43b174..626af348eb8f 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -352,61 +352,29 @@ static void __init free_unused_memmap(void)
 #endif
 }
 
-#ifdef CONFIG_HIGHMEM
-static inline void free_area_high(unsigned long pfn, unsigned long end)
-{
-	for (; pfn < end; pfn++)
-		free_highmem_page(pfn_to_page(pfn));
-}
-#endif
-
 static void __init free_highpages(void)
 {
 #ifdef CONFIG_HIGHMEM
 	unsigned long max_low = max_low_pfn;
-	struct memblock_region *mem, *res;
+	phys_addr_t range_start, range_end;
+	u64 i;
 
 	/* set highmem page free */
-	for_each_memblock(memory, mem) {
-		unsigned long start = memblock_region_memory_base_pfn(mem);
-		unsigned long end = memblock_region_memory_end_pfn(mem);
+	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE,
+				&range_start, &range_end, NULL) {
+		unsigned long start = PHYS_PFN(range_start);
+		unsigned long end = PHYS_PFN(range_end);
 
 		/* Ignore complete lowmem entries */
 		if (end <= max_low)
 			continue;
 
-		if (memblock_is_nomap(mem))
-			continue;
-
 		/* Truncate partial highmem entries */
 		if (start < max_low)
 			start = max_low;
 
-		/* Find and exclude any reserved regions */
-		for_each_memblock(reserved, res) {
-			unsigned long res_start, res_end;
-
-			res_start = memblock_region_reserved_base_pfn(res);
-			res_end = memblock_region_reserved_end_pfn(res);
-
-			if (res_end < start)
-				continue;
-			if (res_start < start)
-				res_start = start;
-			if (res_start > end)
-				res_start = end;
-			if (res_end > end)
-				res_end = end;
-			if (res_start != start)
-				free_area_high(start, res_start);
-			start = res_end;
-			if (start == end)
-				break;
-		}
-
-		/* And now free anything which remains */
-		if (start < end)
-			free_area_high(start, end);
+		for (; start < end; start++)
+			free_highmem_page(pfn_to_page(start));
 	}
 #endif
 }
diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index a05b306cf371..ad9d59d93f39 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -79,67 +79,32 @@ void __init zones_init(void)
 	free_area_init(max_zone_pfn);
 }
 
-#ifdef CONFIG_HIGHMEM
-static void __init free_area_high(unsigned long pfn, unsigned long end)
-{
-	for (; pfn < end; pfn++)
-		free_highmem_page(pfn_to_page(pfn));
-}
-
 static void __init free_highpages(void)
 {
+#ifdef CONFIG_HIGHMEM
 	unsigned long max_low = max_low_pfn;
-	struct memblock_region *mem, *res;
+	phys_addr_t range_start, range_end;
+	u64 i;
 
-	reset_all_zones_managed_pages();
 	/* set highmem page free */
-	for_each_memblock(memory, mem) {
-		unsigned long start = memblock_region_memory_base_pfn(mem);
-		unsigned long end = memblock_region_memory_end_pfn(mem);
+	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE,
+				&range_start, &range_end, NULL) {
+		unsigned long start = PHYS_PFN(range_start);
+		unsigned long end = PHYS_PFN(range_end);
 
 		/* Ignore complete lowmem entries */
 		if (end <= max_low)
 			continue;
 
-		if (memblock_is_nomap(mem))
-			continue;
-
 		/* Truncate partial highmem entries */
 		if (start < max_low)
 			start = max_low;
 
-		/* Find and exclude any reserved regions */
-		for_each_memblock(reserved, res) {
-			unsigned long res_start, res_end;
-
-			res_start = memblock_region_reserved_base_pfn(res);
-			res_end = memblock_region_reserved_end_pfn(res);
-
-			if (res_end < start)
-				continue;
-			if (res_start < start)
-				res_start = start;
-			if (res_start > end)
-				res_start = end;
-			if (res_end > end)
-				res_end = end;
-			if (res_start != start)
-				free_area_high(start, res_start);
-			start = res_end;
-			if (start == end)
-				break;
-		}
-
-		/* And now free anything which remains */
-		if (start < end)
-			free_area_high(start, end);
+		for (; start < end; start++)
+			free_highmem_page(pfn_to_page(start));
 	}
-}
-#else
-static void __init free_highpages(void)
-{
-}
 #endif
+}
 
 /*
  * Initialize memory pages.
-- 
2.26.2

