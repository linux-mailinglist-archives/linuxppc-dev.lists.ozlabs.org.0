Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E2E1A6078
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 22:25:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490jsy0KctzDqGp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 06:25:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=mqfR2DMw; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490j9k0rBnzDqSH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 05:53:46 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 023F32078B;
 Sun, 12 Apr 2020 19:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721224;
 bh=sN78lZotguCKrttDOIWOXxlcWe+0MryDvjqyKOvrJC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mqfR2DMwYn+chyzSwl2PMMuM6ya1F6cOxPQ66C/OorDG9P01ERaxgUj4H7lJsHBl1
 W2m2rygfbnMWfD3CAJC6UfVy/F6xLgPaslZv1hk7hAlQ7H9VTsVKCl5jX69EwuPblu
 SAkziTW6zISS6COGyW6ck4eOZRdPQ0kPXFj7r2/M=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 18/21] mm: rename free_area_init_node() to
 free_area_init_memoryless_node()
Date: Sun, 12 Apr 2020 22:48:56 +0300
Message-Id: <20200412194859.12663-19-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
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
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

The free_area_init_node() is only used by x86 to initialize a memory-less
nodes.
Make its name reflect this and drop all the function parameters except node
ID as they are anyway zero.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/x86/mm/numa.c | 5 +----
 include/linux/mm.h | 9 +++------
 mm/page_alloc.c    | 7 ++-----
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index fe024b2ac796..8ee952038c80 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -737,12 +737,9 @@ void __init x86_numa_init(void)
 
 static void __init init_memory_less_node(int nid)
 {
-	unsigned long zones_size[MAX_NR_ZONES] = {0};
-	unsigned long zholes_size[MAX_NR_ZONES] = {0};
-
 	/* Allocate and initialize node data. Memory-less node is now online.*/
 	alloc_node_data(nid);
-	free_area_init_node(nid, zones_size, 0, zholes_size);
+	free_area_init_memoryless_node(nid);
 
 	/*
 	 * All zonelists will be built later in start_kernel() after per cpu
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1c2ecb42e043..27660f6cf26e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2272,8 +2272,7 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
 }
 
 extern void __init pagecache_init(void);
-extern void __init free_area_init_node(int nid, unsigned long * zones_size,
-		unsigned long zone_start_pfn, unsigned long *zholes_size);
+extern void __init free_area_init_memoryless_node(int nid);
 extern void free_initmem(void);
 
 /*
@@ -2345,10 +2344,8 @@ static inline unsigned long get_num_physpages(void)
 
 /*
  * Using memblock node mappings, an architecture may initialise its
- * zones, allocate the backing mem_map and account for memory holes in a more
- * architecture independent manner. This is a substitute for creating the
- * zone_sizes[] and zholes_size[] arrays and passing them to
- * free_area_init_node()
+ * zones, allocate the backing mem_map and account for memory holes in an
+ * architecture independent manner.
  *
  * An architecture is expected to register range of page frames backed by
  * physical memory with memblock_add[_node]() before calling
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 376434c7a78b..e46232ec4849 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6979,12 +6979,9 @@ static void __init __free_area_init_node(int nid, unsigned long *zones_size,
 	free_area_init_core(pgdat);
 }
 
-void __init free_area_init_node(int nid, unsigned long *zones_size,
-				unsigned long node_start_pfn,
-				unsigned long *zholes_size)
+void __init free_area_init_memoryless_node(int nid)
 {
-	__free_area_init_node(nid, zones_size, node_start_pfn, zholes_size,
-			      true);
+	__free_area_init_node(nid, NULL, 0, NULL, false);
 }
 
 #if !defined(CONFIG_FLAT_NODE_MEM_MAP)
-- 
2.25.1

