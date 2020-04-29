Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 388E01BDCF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 15:02:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BzF86xZCzDqp5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 23:02:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=t6mTPm7t; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ByCn3tB6zDqkT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 22:16:05 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9398D21974;
 Wed, 29 Apr 2020 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162563;
 bh=ctUIy/YXeb4o7EetKtzPouPDDIiPmPpivi+QjUKxJWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t6mTPm7tDf6A7Fs1DPVRRbHW9NSUsNbUTBbTB5Mt5W0CY60/S3DgGMfp7O1x4H3dF
 UQWqU+tdAZsr0ftTrK6xUyuXzR3WiWfBGDM0zN31grCnE9SDwBEA4eeBZHjjz7WsYP
 EgqQnBLprJoYDC61AEWwct3Qxl5ChjhVms6vDhQM=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/20] mm: free_area_init: allow defining max_zone_pfn in
 descending order
Date: Wed, 29 Apr 2020 15:11:23 +0300
Message-Id: <20200429121126.17989-18-rppt@kernel.org>
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

Some architectures (e.g. ARC) have the ZONE_HIGHMEM zone below the
ZONE_NORMAL. Allowing free_area_init() parse max_zone_pfn array even it is
sorted in descending order allows using free_area_init() on such
architectures.

Add top -> down traversal of max_zone_pfn array in free_area_init() and use
the latter in ARC node/zone initialization.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arc/mm/init.c | 36 +++++++-----------------------------
 mm/page_alloc.c    | 24 +++++++++++++++++++-----
 2 files changed, 26 insertions(+), 34 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 0920c969c466..41eb9be1653c 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -63,11 +63,13 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 
 		low_mem_sz = size;
 		in_use = 1;
+		memblock_add_node(base, size, 0);
 	} else {
 #ifdef CONFIG_HIGHMEM
 		high_mem_start = base;
 		high_mem_sz = size;
 		in_use = 1;
+		memblock_add_node(base, size, 1);
 #endif
 	}
 
@@ -83,8 +85,7 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
  */
 void __init setup_arch_memory(void)
 {
-	unsigned long zones_size[MAX_NR_ZONES];
-	unsigned long zones_holes[MAX_NR_ZONES];
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
 
 	init_mm.start_code = (unsigned long)_text;
 	init_mm.end_code = (unsigned long)_etext;
@@ -115,7 +116,6 @@ void __init setup_arch_memory(void)
 	 * the crash
 	 */
 
-	memblock_add_node(low_mem_start, low_mem_sz, 0);
 	memblock_reserve(CONFIG_LINUX_LINK_BASE,
 			 __pa(_end) - CONFIG_LINUX_LINK_BASE);
 
@@ -133,22 +133,7 @@ void __init setup_arch_memory(void)
 	memblock_dump_all();
 
 	/*----------------- node/zones setup --------------------------*/
-	memset(zones_size, 0, sizeof(zones_size));
-	memset(zones_holes, 0, sizeof(zones_holes));
-
-	zones_size[ZONE_NORMAL] = max_low_pfn - min_low_pfn;
-	zones_holes[ZONE_NORMAL] = 0;
-
-	/*
-	 * We can't use the helper free_area_init(zones[]) because it uses
-	 * PAGE_OFFSET to compute the @min_low_pfn which would be wrong
-	 * when our kernel doesn't start at PAGE_OFFSET, i.e.
-	 * PAGE_OFFSET != CONFIG_LINUX_RAM_BASE
-	 */
-	free_area_init_node(0,			/* node-id */
-			    zones_size,		/* num pages per zone */
-			    min_low_pfn,	/* first pfn of node */
-			    zones_holes);	/* holes */
+	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
 
 #ifdef CONFIG_HIGHMEM
 	/*
@@ -168,20 +153,13 @@ void __init setup_arch_memory(void)
 	min_high_pfn = PFN_DOWN(high_mem_start);
 	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
 
-	zones_size[ZONE_NORMAL] = 0;
-	zones_holes[ZONE_NORMAL] = 0;
-
-	zones_size[ZONE_HIGHMEM] = max_high_pfn - min_high_pfn;
-	zones_holes[ZONE_HIGHMEM] = 0;
-
-	free_area_init_node(1,			/* node-id */
-			    zones_size,		/* num pages per zone */
-			    min_high_pfn,	/* first pfn of node */
-			    zones_holes);	/* holes */
+	max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
 
 	high_memory = (void *)(min_high_pfn << PAGE_SHIFT);
 	kmap_init();
 #endif
+
+	free_area_init(max_zone_pfn);
 }
 
 /*
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d35ca0996a09..98a47f90065a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7408,7 +7408,8 @@ static void check_for_memory(pg_data_t *pgdat, int nid)
 void __init free_area_init(unsigned long *max_zone_pfn)
 {
 	unsigned long start_pfn, end_pfn;
-	int i, nid;
+	int i, nid, zone;
+	bool descending = false;
 
 	/* Record where the zone boundaries are */
 	memset(arch_zone_lowest_possible_pfn, 0,
@@ -7418,13 +7419,26 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 
 	start_pfn = find_min_pfn_with_active_regions();
 
+	/*
+	 * Some architecturs, e.g. ARC may have ZONE_HIGHMEM below
+	 * ZONE_NORMAL. For such cases we allow max_zone_pfn sorted in the
+	 * descending order
+	 */
+	if (MAX_NR_ZONES > 1 && max_zone_pfn[0] > max_zone_pfn[1])
+		descending = true;
+
 	for (i = 0; i < MAX_NR_ZONES; i++) {
-		if (i == ZONE_MOVABLE)
+		if (descending)
+			zone = MAX_NR_ZONES - i - 1;
+		else
+			zone = i;
+
+		if (zone == ZONE_MOVABLE)
 			continue;
 
-		end_pfn = max(max_zone_pfn[i], start_pfn);
-		arch_zone_lowest_possible_pfn[i] = start_pfn;
-		arch_zone_highest_possible_pfn[i] = end_pfn;
+		end_pfn = max(max_zone_pfn[zone], start_pfn);
+		arch_zone_lowest_possible_pfn[zone] = start_pfn;
+		arch_zone_highest_possible_pfn[zone] = end_pfn;
 
 		start_pfn = end_pfn;
 	}
-- 
2.26.1

