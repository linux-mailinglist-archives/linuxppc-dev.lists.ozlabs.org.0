Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C39539F21B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 11:16:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzl396PGDz3cTV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 19:16:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A74kBHmj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A74kBHmj; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzl0r2zfLz3bvc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 19:14:04 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CB486128B;
 Tue,  8 Jun 2021 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623143641;
 bh=rI0xYiMnDrzDAgM7h0ohNEFuNmcVgzHV+X7+LYyQKq4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A74kBHmjt9QMuRE5MccK5xBvhfnTSNpVDnT822mxkUnu7voOkbwG9bqVJZMCn23pN
 4NfY3pS6opxMj9oloSgtNiesLRHP7wPaKLZf0zMufPnhsZX+bbixub7nLkVtH+afB5
 /ZebOEkreKnuy1SfBNtmIzrv8detTvJAp8+/SMq0WkF199BArG98SukgiTZfsZdbax
 aDngU3R8r5Dxto7NmNBZJjXTy0FluOGY4EJ4ewBM00fY5zbhKYcn06Muq1fv5UVySc
 q8jmo1ncKTdWenyv1hDPdPkVJPBS4L9idyX+wjuNaBkRUaJBxK12hW2O3dBbE6SXYB
 PXmRgj5M53s+A==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 5/9] mm: remove CONFIG_DISCONTIGMEM
Date: Tue,  8 Jun 2021 12:13:12 +0300
Message-Id: <20210608091316.3622-6-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210608091316.3622-1-rppt@kernel.org>
References: <20210608091316.3622-1-rppt@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

There are no architectures that support DISCONTIGMEM left.

Remove the configuration option and the dead code it was guarding in the
generic memory management code.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/asm-generic/memory_model.h | 37 ++++--------------------------
 include/linux/mmzone.h             |  8 ++++---
 mm/Kconfig                         | 25 +++-----------------
 mm/page_alloc.c                    | 13 -----------
 4 files changed, 12 insertions(+), 71 deletions(-)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index 7637fb46ba4f..a2c8ed60233a 100644
--- a/include/asm-generic/memory_model.h
+++ b/include/asm-generic/memory_model.h
@@ -6,47 +6,18 @@
 
 #ifndef __ASSEMBLY__
 
+/*
+ * supports 3 memory models.
+ */
 #if defined(CONFIG_FLATMEM)
 
 #ifndef ARCH_PFN_OFFSET
 #define ARCH_PFN_OFFSET		(0UL)
 #endif
 
-#elif defined(CONFIG_DISCONTIGMEM)
-
-#ifndef arch_pfn_to_nid
-#define arch_pfn_to_nid(pfn)	pfn_to_nid(pfn)
-#endif
-
-#ifndef arch_local_page_offset
-#define arch_local_page_offset(pfn, nid)	\
-	((pfn) - NODE_DATA(nid)->node_start_pfn)
-#endif
-
-#endif /* CONFIG_DISCONTIGMEM */
-
-/*
- * supports 3 memory models.
- */
-#if defined(CONFIG_FLATMEM)
-
 #define __pfn_to_page(pfn)	(mem_map + ((pfn) - ARCH_PFN_OFFSET))
 #define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
 				 ARCH_PFN_OFFSET)
-#elif defined(CONFIG_DISCONTIGMEM)
-
-#define __pfn_to_page(pfn)			\
-({	unsigned long __pfn = (pfn);		\
-	unsigned long __nid = arch_pfn_to_nid(__pfn);  \
-	NODE_DATA(__nid)->node_mem_map + arch_local_page_offset(__pfn, __nid);\
-})
-
-#define __page_to_pfn(pg)						\
-({	const struct page *__pg = (pg);					\
-	struct pglist_data *__pgdat = NODE_DATA(page_to_nid(__pg));	\
-	(unsigned long)(__pg - __pgdat->node_mem_map) +			\
-	 __pgdat->node_start_pfn;					\
-})
 
 #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
 
@@ -70,7 +41,7 @@
 	struct mem_section *__sec = __pfn_to_section(__pfn);	\
 	__section_mem_map_addr(__sec) + __pfn;		\
 })
-#endif /* CONFIG_FLATMEM/DISCONTIGMEM/SPARSEMEM */
+#endif /* CONFIG_FLATMEM/SPARSEMEM */
 
 /*
  * Convert a physical address to a Page Frame Number and back
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 0d53eba1c383..700032e99419 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -738,10 +738,12 @@ struct zonelist {
 	struct zoneref _zonerefs[MAX_ZONES_PER_ZONELIST + 1];
 };
 
-#ifndef CONFIG_DISCONTIGMEM
-/* The array of struct pages - for discontigmem use pgdat->lmem_map */
+/*
+ * The array of struct pages for flatmem.
+ * It must be declared for SPARSEMEM as well because there are configurations
+ * that rely on that.
+ */
 extern struct page *mem_map;
-#endif
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 struct deferred_split {
diff --git a/mm/Kconfig b/mm/Kconfig
index 02d44e3420f5..218b96ccc84a 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -19,7 +19,7 @@ choice
 
 config FLATMEM_MANUAL
 	bool "Flat Memory"
-	depends on !(ARCH_DISCONTIGMEM_ENABLE || ARCH_SPARSEMEM_ENABLE) || ARCH_FLATMEM_ENABLE
+	depends on !ARCH_SPARSEMEM_ENABLE || ARCH_FLATMEM_ENABLE
 	help
 	  This option is best suited for non-NUMA systems with
 	  flat address space. The FLATMEM is the most efficient
@@ -32,21 +32,6 @@ config FLATMEM_MANUAL
 
 	  If unsure, choose this option (Flat Memory) over any other.
 
-config DISCONTIGMEM_MANUAL
-	bool "Discontiguous Memory"
-	depends on ARCH_DISCONTIGMEM_ENABLE
-	help
-	  This option provides enhanced support for discontiguous
-	  memory systems, over FLATMEM.  These systems have holes
-	  in their physical address spaces, and this option provides
-	  more efficient handling of these holes.
-
-	  Although "Discontiguous Memory" is still used by several
-	  architectures, it is considered deprecated in favor of
-	  "Sparse Memory".
-
-	  If unsure, choose "Sparse Memory" over this option.
-
 config SPARSEMEM_MANUAL
 	bool "Sparse Memory"
 	depends on ARCH_SPARSEMEM_ENABLE
@@ -62,17 +47,13 @@ config SPARSEMEM_MANUAL
 
 endchoice
 
-config DISCONTIGMEM
-	def_bool y
-	depends on (!SELECT_MEMORY_MODEL && ARCH_DISCONTIGMEM_ENABLE) || DISCONTIGMEM_MANUAL
-
 config SPARSEMEM
 	def_bool y
 	depends on (!SELECT_MEMORY_MODEL && ARCH_SPARSEMEM_ENABLE) || SPARSEMEM_MANUAL
 
 config FLATMEM
 	def_bool y
-	depends on (!DISCONTIGMEM && !SPARSEMEM) || FLATMEM_MANUAL
+	depends on !SPARSEMEM || FLATMEM_MANUAL
 
 config FLAT_NODE_MEM_MAP
 	def_bool y
@@ -85,7 +66,7 @@ config FLAT_NODE_MEM_MAP
 #
 config NEED_MULTIPLE_NODES
 	def_bool y
-	depends on DISCONTIGMEM || NUMA
+	depends on NUMA
 
 #
 # SPARSEMEM_EXTREME (which is the default) does some bootmem
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index aaa1655cf682..6fc22482eaa8 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -331,20 +331,7 @@ compound_page_dtor * const compound_page_dtors[NR_COMPOUND_DTORS] = {
 
 int min_free_kbytes = 1024;
 int user_min_free_kbytes = -1;
-#ifdef CONFIG_DISCONTIGMEM
-/*
- * DiscontigMem defines memory ranges as separate pg_data_t even if the ranges
- * are not on separate NUMA nodes. Functionally this works but with
- * watermark_boost_factor, it can reclaim prematurely as the ranges can be
- * quite small. By default, do not boost watermarks on discontigmem as in
- * many cases very high-order allocations like THP are likely to be
- * unsupported and the premature reclaim offsets the advantage of long-term
- * fragmentation avoidance.
- */
-int watermark_boost_factor __read_mostly;
-#else
 int watermark_boost_factor __read_mostly = 15000;
-#endif
 int watermark_scale_factor = 10;
 
 static unsigned long nr_kernel_pages __initdata;
-- 
2.28.0

