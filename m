Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A355E1A606A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 22:10:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490jYH5VfkzDqGc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 06:10:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ptZzn70q; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490j7V0KwkzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 05:51:50 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44E992072D;
 Sun, 12 Apr 2020 19:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721108;
 bh=Ok7w8UnbHiLu4xbocwMzpfIo9IGcAlK4aLbtvivoSXs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ptZzn70qaRDHuusIJQ2kDW2vKURV7ng1OZjSC8cxSZf5ErovTSNi7d+/WVAi1Pja2
 9Kam6N7RP258+GtMjN+nQBN9jYnUFSrZz0m7UZbW0YwZPo21AuMw5ljsFdZ6JfoMgj
 cJW86dlpE9XFsX7XBXUlQo6J1HaNWpDnYXUk2ugQ=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/21] m68k: mm: simplify detection of memory zone boundaries
Date: Sun, 12 Apr 2020 22:48:48 +0300
Message-Id: <20200412194859.12663-11-rppt@kernel.org>
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

The free_area_init() function only requires the definition of maximal PFN
for each of the supported zone rater than calculation of actual zone sizes
and the sizes of the holes between the zones.

After removal of CONFIG_HAVE_MEMBLOCK_NODE_MAP the free_area_init() is
available to all architectures.

Using this function instead of free_area_init_node() simplifies the zone
detection.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/m68k/mm/motorola.c | 11 +++++------
 arch/m68k/mm/sun3mmu.c  | 10 +++-------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 84ab5963cabb..904c2a663977 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -365,7 +365,7 @@ static void __init map_node(int node)
  */
 void __init paging_init(void)
 {
-	unsigned long zones_size[MAX_NR_ZONES] = { 0, };
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
 	unsigned long min_addr, max_addr;
 	unsigned long addr;
 	int i;
@@ -448,11 +448,10 @@ void __init paging_init(void)
 #ifdef DEBUG
 	printk ("before free_area_init\n");
 #endif
-	for (i = 0; i < m68k_num_memory; i++) {
-		zones_size[ZONE_DMA] = m68k_memory[i].size >> PAGE_SHIFT;
-		free_area_init_node(i, zones_size,
-				    m68k_memory[i].addr >> PAGE_SHIFT, NULL);
+	for (i = 0; i < m68k_num_memory; i++)
 		if (node_present_pages(i))
 			node_set_state(i, N_NORMAL_MEMORY);
-	}
+
+	max_zone_pfn[ZONE_DMA] = memblock_end_of_DRAM();
+	free_area_init(max_zone_pfn);
 }
diff --git a/arch/m68k/mm/sun3mmu.c b/arch/m68k/mm/sun3mmu.c
index eca1c46bb90a..5d8d956d9329 100644
--- a/arch/m68k/mm/sun3mmu.c
+++ b/arch/m68k/mm/sun3mmu.c
@@ -42,7 +42,7 @@ void __init paging_init(void)
 	unsigned long address;
 	unsigned long next_pgtable;
 	unsigned long bootmem_end;
-	unsigned long zones_size[MAX_NR_ZONES] = { 0, };
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
 	unsigned long size;
 
 	empty_zero_page = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
@@ -89,14 +89,10 @@ void __init paging_init(void)
 	current->mm = NULL;
 
 	/* memory sizing is a hack stolen from motorola.c..  hope it works for us */
-	zones_size[ZONE_DMA] = ((unsigned long)high_memory - PAGE_OFFSET) >> PAGE_SHIFT;
+	max_zone_pfn[ZONE_DMA] = ((unsigned long)high_memory) >> PAGE_SHIFT;
 
 	/* I really wish I knew why the following change made things better...  -- Sam */
-/*	free_area_init(zones_size); */
-	free_area_init_node(0, zones_size,
-			    (__pa(PAGE_OFFSET) >> PAGE_SHIFT) + 1, NULL);
+	free_area_init(max_zone_pfn);
 
 
 }
-
-
-- 
2.25.1

