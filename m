Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B81BDD26
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 15:07:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BzLw0cbNzDr8R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 23:07:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=wtq87ctx; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ByD265HVzDr5d
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 22:16:18 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E53921973;
 Wed, 29 Apr 2020 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162576;
 bh=khO6M0PCZCvxuChmGRirp+z0yfPDyNK839SI/IM+AUg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wtq87ctxwV4SeKVcZ9rG9Ex1sM4YINHx9CUpXjq9oBJfndQnJL7lbj8MvWisJo7DV
 5PTjjdhP8ALGahsQGnqm6Oxl1erp1GkdhsYhRZ0SpO1zQQW6fHsyga9v6l9epK6ryJ
 fALAKor8AFFj/TKwvhQdLluT1ziB3+45iQVhIUGU=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/20] mm: clean up free_area_init_node() and its helpers
Date: Wed, 29 Apr 2020 15:11:24 +0300
Message-Id: <20200429121126.17989-19-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429121126.17989-1-rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Qian Cai <cai@lca.pw>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Hoan Tran <Hoan@os.amperecomputing.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

The free_area_init_node() now always uses memblock info and the zone PFN
limits so it does not need the backwards compatibility functions to
calculate the zone spanned and absent pages. The removal of the compat_
versions of zone_{abscent,spanned}_pages_in_node() in turn, makes zone_size
and zhole_size parameters unused.

The node_start_pfn is determined by get_pfn_range_for_nid(), so there is no
need to pass it to free_area_init_node().

As the result, the only required parameter to free_area_init_node() is the
node ID, all the rest are removed along with no longer used
compat_zone_{abscent,spanned}_pages_in_node() helpers.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/x86/mm/numa.c |   2 +-
 include/linux/mm.h |   7 +--
 mm/page_alloc.c    | 110 +++++++++------------------------------------
 3 files changed, 24 insertions(+), 95 deletions(-)

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index fe024b2ac796..0e1b99f491e4 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -742,7 +742,7 @@ static void __init init_memory_less_node(int nid)
 
 	/* Allocate and initialize node data. Memory-less node is now online.*/
 	alloc_node_data(nid);
-	free_area_init_node(nid, zones_size, 0, zholes_size);
+	free_area_init_node(nid);
 
 	/*
 	 * All zonelists will be built later in start_kernel() after per cpu
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1c2ecb42e043..2c0d42b11f3c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2272,8 +2272,7 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
 }
 
 extern void __init pagecache_init(void);
-extern void __init free_area_init_node(int nid, unsigned long * zones_size,
-		unsigned long zone_start_pfn, unsigned long *zholes_size);
+extern void __init free_area_init_node(int nid);
 extern void free_initmem(void);
 
 /*
@@ -2346,9 +2345,7 @@ static inline unsigned long get_num_physpages(void)
 /*
  * Using memblock node mappings, an architecture may initialise its
  * zones, allocate the backing mem_map and account for memory holes in a more
- * architecture independent manner. This is a substitute for creating the
- * zone_sizes[] and zholes_size[] arrays and passing them to
- * free_area_init_node()
+ * architecture independent manner.
  *
  * An architecture is expected to register range of page frames backed by
  * physical memory with memblock_add[_node]() before calling
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 98a47f90065a..30d171451d4c 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6420,8 +6420,7 @@ static unsigned long __init zone_spanned_pages_in_node(int nid,
 					unsigned long node_start_pfn,
 					unsigned long node_end_pfn,
 					unsigned long *zone_start_pfn,
-					unsigned long *zone_end_pfn,
-					unsigned long *ignored)
+					unsigned long *zone_end_pfn)
 {
 	unsigned long zone_low = arch_zone_lowest_possible_pfn[zone_type];
 	unsigned long zone_high = arch_zone_highest_possible_pfn[zone_type];
@@ -6485,8 +6484,7 @@ unsigned long __init absent_pages_in_range(unsigned long start_pfn,
 static unsigned long __init zone_absent_pages_in_node(int nid,
 					unsigned long zone_type,
 					unsigned long node_start_pfn,
-					unsigned long node_end_pfn,
-					unsigned long *ignored)
+					unsigned long node_end_pfn)
 {
 	unsigned long zone_low = arch_zone_lowest_possible_pfn[zone_type];
 	unsigned long zone_high = arch_zone_highest_possible_pfn[zone_type];
@@ -6533,43 +6531,9 @@ static unsigned long __init zone_absent_pages_in_node(int nid,
 	return nr_absent;
 }
 
-static inline unsigned long __init compat_zone_spanned_pages_in_node(int nid,
-					unsigned long zone_type,
-					unsigned long node_start_pfn,
-					unsigned long node_end_pfn,
-					unsigned long *zone_start_pfn,
-					unsigned long *zone_end_pfn,
-					unsigned long *zones_size)
-{
-	unsigned int zone;
-
-	*zone_start_pfn = node_start_pfn;
-	for (zone = 0; zone < zone_type; zone++)
-		*zone_start_pfn += zones_size[zone];
-
-	*zone_end_pfn = *zone_start_pfn + zones_size[zone_type];
-
-	return zones_size[zone_type];
-}
-
-static inline unsigned long __init compat_zone_absent_pages_in_node(int nid,
-						unsigned long zone_type,
-						unsigned long node_start_pfn,
-						unsigned long node_end_pfn,
-						unsigned long *zholes_size)
-{
-	if (!zholes_size)
-		return 0;
-
-	return zholes_size[zone_type];
-}
-
 static void __init calculate_node_totalpages(struct pglist_data *pgdat,
 						unsigned long node_start_pfn,
-						unsigned long node_end_pfn,
-						unsigned long *zones_size,
-						unsigned long *zholes_size,
-						bool compat)
+						unsigned long node_end_pfn)
 {
 	unsigned long realtotalpages = 0, totalpages = 0;
 	enum zone_type i;
@@ -6580,31 +6544,14 @@ static void __init calculate_node_totalpages(struct pglist_data *pgdat,
 		unsigned long spanned, absent;
 		unsigned long size, real_size;
 
-		if (compat) {
-			spanned = compat_zone_spanned_pages_in_node(
-						pgdat->node_id, i,
-						node_start_pfn,
-						node_end_pfn,
-						&zone_start_pfn,
-						&zone_end_pfn,
-						zones_size);
-			absent = compat_zone_absent_pages_in_node(
-						pgdat->node_id, i,
-						node_start_pfn,
-						node_end_pfn,
-						zholes_size);
-		} else {
-			spanned = zone_spanned_pages_in_node(pgdat->node_id, i,
-						node_start_pfn,
-						node_end_pfn,
-						&zone_start_pfn,
-						&zone_end_pfn,
-						zones_size);
-			absent = zone_absent_pages_in_node(pgdat->node_id, i,
-						node_start_pfn,
-						node_end_pfn,
-						zholes_size);
-		}
+		spanned = zone_spanned_pages_in_node(pgdat->node_id, i,
+						     node_start_pfn,
+						     node_end_pfn,
+						     &zone_start_pfn,
+						     &zone_end_pfn);
+		absent = zone_absent_pages_in_node(pgdat->node_id, i,
+						   node_start_pfn,
+						   node_end_pfn);
 
 		size = spanned;
 		real_size = size - absent;
@@ -6926,10 +6873,7 @@ static inline void pgdat_set_deferred_range(pg_data_t *pgdat)
 static inline void pgdat_set_deferred_range(pg_data_t *pgdat) {}
 #endif
 
-static void __init __free_area_init_node(int nid, unsigned long *zones_size,
-					 unsigned long node_start_pfn,
-					 unsigned long *zholes_size,
-					 bool compat)
+void __init free_area_init_node(int nid)
 {
 	pg_data_t *pgdat = NODE_DATA(nid);
 	unsigned long start_pfn = 0;
@@ -6938,19 +6882,16 @@ static void __init __free_area_init_node(int nid, unsigned long *zones_size,
 	/* pg_data_t should be reset to zero when it's allocated */
 	WARN_ON(pgdat->nr_zones || pgdat->kswapd_classzone_idx);
 
+	get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
+
 	pgdat->node_id = nid;
-	pgdat->node_start_pfn = node_start_pfn;
+	pgdat->node_start_pfn = start_pfn;
 	pgdat->per_cpu_nodestats = NULL;
-	if (!compat) {
-		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
-		pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
-			(u64)start_pfn << PAGE_SHIFT,
-			end_pfn ? ((u64)end_pfn << PAGE_SHIFT) - 1 : 0);
-	} else {
-		start_pfn = node_start_pfn;
-	}
-	calculate_node_totalpages(pgdat, start_pfn, end_pfn,
-				  zones_size, zholes_size, compat);
+
+	pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
+		(u64)start_pfn << PAGE_SHIFT,
+		end_pfn ? ((u64)end_pfn << PAGE_SHIFT) - 1 : 0);
+	calculate_node_totalpages(pgdat, start_pfn, end_pfn);
 
 	alloc_node_mem_map(pgdat);
 	pgdat_set_deferred_range(pgdat);
@@ -6958,14 +6899,6 @@ static void __init __free_area_init_node(int nid, unsigned long *zones_size,
 	free_area_init_core(pgdat);
 }
 
-void __init free_area_init_node(int nid, unsigned long *zones_size,
-				unsigned long node_start_pfn,
-				unsigned long *zholes_size)
-{
-	__free_area_init_node(nid, zones_size, node_start_pfn, zholes_size,
-			      true);
-}
-
 #if !defined(CONFIG_FLAT_NODE_MEM_MAP)
 /*
  * Initialize all valid struct pages in the range [spfn, epfn) and mark them
@@ -7491,8 +7424,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 	init_unavailable_mem();
 	for_each_online_node(nid) {
 		pg_data_t *pgdat = NODE_DATA(nid);
-		__free_area_init_node(nid, NULL,
-				      find_min_pfn_for_node(nid), NULL, false);
+		free_area_init_node(nid);
 
 		/* Any memory on that node */
 		if (pgdat->node_present_pages)
-- 
2.26.1

