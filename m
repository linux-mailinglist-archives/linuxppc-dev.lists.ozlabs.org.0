Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7844439B34E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 08:54:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxD5F41tHz3dMG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 16:54:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FFzVOjIJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FFzVOjIJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxD146GMxz3bwq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 16:50:32 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3515A61415;
 Fri,  4 Jun 2021 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622789430;
 bh=lDEh/GlZ6IHzCVgoifZXFj4eSjBGzRR223ZmBbEbu7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FFzVOjIJiCWzdDVdPOERBe+6WCuPkRQX7QoI7Waosxm/3cjzgDaj7FR4VcbvtndpF
 I7LnDiGmeXg+T//F9l1eT/bfu4LdtRglAhKPnEwGrSICHYLC4d4iqYRIWVGsjPrQsY
 SQlmy4lnuYwfWGbNxIBov1kbm+UssQAoftJ4Ihv9dOUOh1TNLPmsA6Wada1KVNha4R
 YBsOMw5ijOD+d9Ylug1CBP0Znxweh4IQwpiLtVrygr6/BGOPGwyD6kk/2+T/pQHvGJ
 3yA2ewQe15ITdLRhwcIMW7tJYcTEAOpVVnMo+uilV6cGq6XyCS25HnxLbvk3H/+VDA
 5UTnsjhL588eg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 9/9] mm: replace CONFIG_FLAT_NODE_MEM_MAP with
 CONFIG_FLATMEM
Date: Fri,  4 Jun 2021 09:49:16 +0300
Message-Id: <20210604064916.26580-10-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210604064916.26580-1-rppt@kernel.org>
References: <20210604064916.26580-1-rppt@kernel.org>
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

After removal of the DISCONTIGMEM memory model the FLAT_NODE_MEM_MAP
configuration option is equivalent to FLATMEM.

Drop CONFIG_FLAT_NODE_MEM_MAP and use CONFIG_FLATMEM instead.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/linux/mmzone.h | 4 ++--
 kernel/crash_core.c    | 2 +-
 mm/Kconfig             | 4 ----
 mm/page_alloc.c        | 6 +++---
 mm/page_ext.c          | 2 +-
 5 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index acdc51c7b259..1d5cafe5ccc3 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -777,7 +777,7 @@ typedef struct pglist_data {
 	struct zonelist node_zonelists[MAX_ZONELISTS];
 
 	int nr_zones; /* number of populated zones in this node */
-#ifdef CONFIG_FLAT_NODE_MEM_MAP	/* means !SPARSEMEM */
+#ifdef CONFIG_FLATMEM	/* means !SPARSEMEM */
 	struct page *node_mem_map;
 #ifdef CONFIG_PAGE_EXTENSION
 	struct page_ext *node_page_ext;
@@ -867,7 +867,7 @@ typedef struct pglist_data {
 
 #define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
 #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
-#ifdef CONFIG_FLAT_NODE_MEM_MAP
+#ifdef CONFIG_FLATMEM
 #define pgdat_page_nr(pgdat, pagenr)	((pgdat)->node_mem_map + (pagenr))
 #else
 #define pgdat_page_nr(pgdat, pagenr)	pfn_to_page((pgdat)->node_start_pfn + (pagenr))
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 53eb8bc6026d..2b8446ea7105 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -483,7 +483,7 @@ static int __init crash_save_vmcoreinfo_init(void)
 	VMCOREINFO_OFFSET(page, compound_head);
 	VMCOREINFO_OFFSET(pglist_data, node_zones);
 	VMCOREINFO_OFFSET(pglist_data, nr_zones);
-#ifdef CONFIG_FLAT_NODE_MEM_MAP
+#ifdef CONFIG_FLATMEM
 	VMCOREINFO_OFFSET(pglist_data, node_mem_map);
 #endif
 	VMCOREINFO_OFFSET(pglist_data, node_start_pfn);
diff --git a/mm/Kconfig b/mm/Kconfig
index bffe4bd859f3..ded98fb859ab 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -55,10 +55,6 @@ config FLATMEM
 	def_bool y
 	depends on !SPARSEMEM || FLATMEM_MANUAL
 
-config FLAT_NODE_MEM_MAP
-	def_bool y
-	depends on !SPARSEMEM
-
 #
 # SPARSEMEM_EXTREME (which is the default) does some bootmem
 # allocations when sparse_init() is called.  If this cannot
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 8f08135d3eb4..f039736541eb 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6444,7 +6444,7 @@ static void __meminit zone_init_free_lists(struct zone *zone)
 	}
 }
 
-#if !defined(CONFIG_FLAT_NODE_MEM_MAP)
+#if !defined(CONFIG_FLATMEM)
 /*
  * Only struct pages that correspond to ranges defined by memblock.memory
  * are zeroed and initialized by going through __init_single_page() during
@@ -7241,7 +7241,7 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
 	}
 }
 
-#ifdef CONFIG_FLAT_NODE_MEM_MAP
+#ifdef CONFIG_FLATMEM
 static void __ref alloc_node_mem_map(struct pglist_data *pgdat)
 {
 	unsigned long __maybe_unused start = 0;
@@ -7289,7 +7289,7 @@ static void __ref alloc_node_mem_map(struct pglist_data *pgdat)
 }
 #else
 static void __ref alloc_node_mem_map(struct pglist_data *pgdat) { }
-#endif /* CONFIG_FLAT_NODE_MEM_MAP */
+#endif /* CONFIG_FLATMEM */
 
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
 static inline void pgdat_set_deferred_range(pg_data_t *pgdat)
diff --git a/mm/page_ext.c b/mm/page_ext.c
index df6f74aac8e1..293b2685fc48 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -191,7 +191,7 @@ void __init page_ext_init_flatmem(void)
 	panic("Out of memory");
 }
 
-#else /* CONFIG_FLAT_NODE_MEM_MAP */
+#else /* CONFIG_FLATMEM */
 
 struct page_ext *lookup_page_ext(const struct page *page)
 {
-- 
2.28.0

