Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C13BC1BDBE3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 14:20:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ByJG69plzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 22:19:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=FM7izhFQ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49By7m5jszzDr5V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 22:12:36 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B48072137B;
 Wed, 29 Apr 2020 12:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162354;
 bh=pGmPDgM6K7/iwWSDa31GpOgfyYSqxlM/17DqmtP9T0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FM7izhFQvoPq0QV3Pi1A8eDpHVFq9Zp0cT3C5CzjDm8JdAvrc+wZZGVUYm4qetES/
 V/SQO20yZf4dsZBiR67nDQgHKFAgAH6vg5Vup2Bajexd1btsNN20RlbFBplIFJDWlk
 t5cPlwxaffucDNFeNut+PgXi8W966/qE54hcqprM=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/20] mm: make early_pfn_to_nid() and related defintions
 close to each other
Date: Wed, 29 Apr 2020 15:11:08 +0300
Message-Id: <20200429121126.17989-3-rppt@kernel.org>
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

The early_pfn_to_nid() and it's helper __early_pfn_to_nid() are spread
around include/linux/mm.h, include/linux/mmzone.h and mm/page_alloc.c.

Drop unused stub for __early_pfn_to_nid() and move its actual generic
implementation close to its users.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/linux/mm.h     |  4 ++--
 include/linux/mmzone.h |  9 --------
 mm/page_alloc.c        | 49 +++++++++++++++++++++---------------------
 3 files changed, 27 insertions(+), 35 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5a323422d783..a404026d14d4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2388,9 +2388,9 @@ extern void sparse_memory_present_with_active_regions(int nid);
 
 #if !defined(CONFIG_HAVE_MEMBLOCK_NODE_MAP) && \
     !defined(CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID)
-static inline int __early_pfn_to_nid(unsigned long pfn,
-					struct mminit_pfnnid_cache *state)
+static inline int early_pfn_to_nid(unsigned long pfn)
 {
+	BUILD_BUG_ON(IS_ENABLED(CONFIG_NUMA));
 	return 0;
 }
 #else
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 1b9de7d220fb..7b5b6eba402f 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1078,15 +1078,6 @@ static inline struct zoneref *first_zones_zonelist(struct zonelist *zonelist,
 #include <asm/sparsemem.h>
 #endif
 
-#if !defined(CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID) && \
-	!defined(CONFIG_HAVE_MEMBLOCK_NODE_MAP)
-static inline unsigned long early_pfn_to_nid(unsigned long pfn)
-{
-	BUILD_BUG_ON(IS_ENABLED(CONFIG_NUMA));
-	return 0;
-}
-#endif
-
 #ifdef CONFIG_FLATMEM
 #define pfn_to_nid(pfn)		(0)
 #endif
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0d012eda1694..a802ee47e715 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1504,6 +1504,31 @@ void __free_pages_core(struct page *page, unsigned int order)
 
 static struct mminit_pfnnid_cache early_pfnnid_cache __meminitdata;
 
+#ifndef CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID
+
+/*
+ * Required by SPARSEMEM. Given a PFN, return what node the PFN is on.
+ */
+int __meminit __early_pfn_to_nid(unsigned long pfn,
+					struct mminit_pfnnid_cache *state)
+{
+	unsigned long start_pfn, end_pfn;
+	int nid;
+
+	if (state->last_start <= pfn && pfn < state->last_end)
+		return state->last_nid;
+
+	nid = memblock_search_pfn_nid(pfn, &start_pfn, &end_pfn);
+	if (nid != NUMA_NO_NODE) {
+		state->last_start = start_pfn;
+		state->last_end = end_pfn;
+		state->last_nid = nid;
+	}
+
+	return nid;
+}
+#endif /* CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID */
+
 int __meminit early_pfn_to_nid(unsigned long pfn)
 {
 	static DEFINE_SPINLOCK(early_pfn_lock);
@@ -6299,30 +6324,6 @@ void __meminit init_currently_empty_zone(struct zone *zone,
 }
 
 #ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
-#ifndef CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID
-
-/*
- * Required by SPARSEMEM. Given a PFN, return what node the PFN is on.
- */
-int __meminit __early_pfn_to_nid(unsigned long pfn,
-					struct mminit_pfnnid_cache *state)
-{
-	unsigned long start_pfn, end_pfn;
-	int nid;
-
-	if (state->last_start <= pfn && pfn < state->last_end)
-		return state->last_nid;
-
-	nid = memblock_search_pfn_nid(pfn, &start_pfn, &end_pfn);
-	if (nid != NUMA_NO_NODE) {
-		state->last_start = start_pfn;
-		state->last_end = end_pfn;
-		state->last_nid = nid;
-	}
-
-	return nid;
-}
-#endif /* CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID */
 
 /**
  * free_bootmem_with_active_regions - Call memblock_free_early_nid for each active range
-- 
2.26.1

