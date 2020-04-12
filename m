Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED41A604D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 21:53:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490j9n02WLzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 05:53:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=f8MaQrCm; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490j500g4gzDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 05:49:40 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2318520732;
 Sun, 12 Apr 2020 19:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586720978;
 bh=8bF1Pu75QmsOVjbaACX4VAU2zf9BLYADPXDD4519geE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f8MaQrCm0Hl80hu0++ZqU6IDqmN39vSrVOUXSCBiboiDATjuq8zWxXcrhx4reOEFz
 UnT1krn6SVH56kSVAhVqWmi/pqLue6tstokqSoGOhWphOTRTHFT8vEnlL0hd8L/AKu
 f0ajTvRbQbvN/SZEolDhT+HF7ng0L1Xb7dYMxDI0=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/21] mm: memblock: replace dereferences of
 memblock_region.nid with API calls
Date: Sun, 12 Apr 2020 22:48:39 +0300
Message-Id: <20200412194859.12663-2-rppt@kernel.org>
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

There are several places in the code that directly dereference
memblock_region.nid despite this field being defined only when
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y.

Replace these with calls to memblock_get_region_nid() to improve code
robustness and to avoid possible breakage when
CONFIG_HAVE_MEMBLOCK_NODE_MAP will be removed.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arm64/mm/numa.c | 9 ++++++---
 arch/x86/mm/numa.c   | 6 ++++--
 mm/memblock.c        | 8 +++++---
 mm/page_alloc.c      | 4 ++--
 4 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 4decf1659700..aafcee3e3f7e 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -350,13 +350,16 @@ static int __init numa_register_nodes(void)
 	struct memblock_region *mblk;
 
 	/* Check that valid nid is set to memblks */
-	for_each_memblock(memory, mblk)
-		if (mblk->nid == NUMA_NO_NODE || mblk->nid >= MAX_NUMNODES) {
+	for_each_memblock(memory, mblk) {
+		int mblk_nid = memblock_get_region_node(mblk);
+
+		if (mblk_nid == NUMA_NO_NODE || mblk_nid >= MAX_NUMNODES) {
 			pr_warn("Warning: invalid memblk node %d [mem %#010Lx-%#010Lx]\n",
-				mblk->nid, mblk->base,
+				mblk_nid, mblk->base,
 				mblk->base + mblk->size - 1);
 			return -EINVAL;
 		}
+	}
 
 	/* Finally register nodes. */
 	for_each_node_mask(nid, numa_nodes_parsed) {
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 59ba008504dc..fe024b2ac796 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -517,8 +517,10 @@ static void __init numa_clear_kernel_node_hotplug(void)
 	 *   reserve specific pages for Sandy Bridge graphics. ]
 	 */
 	for_each_memblock(reserved, mb_region) {
-		if (mb_region->nid != MAX_NUMNODES)
-			node_set(mb_region->nid, reserved_nodemask);
+		int nid = memblock_get_region_node(mb_region);
+
+		if (nid != MAX_NUMNODES)
+			node_set(nid, reserved_nodemask);
 	}
 
 	/*
diff --git a/mm/memblock.c b/mm/memblock.c
index c79ba6f9920c..43e2fd3006c1 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1207,13 +1207,15 @@ void __init_memblock __next_mem_pfn_range(int *idx, int nid,
 {
 	struct memblock_type *type = &memblock.memory;
 	struct memblock_region *r;
+	int r_nid;
 
 	while (++*idx < type->cnt) {
 		r = &type->regions[*idx];
+		r_nid = memblock_get_region_node(r);
 
 		if (PFN_UP(r->base) >= PFN_DOWN(r->base + r->size))
 			continue;
-		if (nid == MAX_NUMNODES || nid == r->nid)
+		if (nid == MAX_NUMNODES || nid == r_nid)
 			break;
 	}
 	if (*idx >= type->cnt) {
@@ -1226,7 +1228,7 @@ void __init_memblock __next_mem_pfn_range(int *idx, int nid,
 	if (out_end_pfn)
 		*out_end_pfn = PFN_DOWN(r->base + r->size);
 	if (out_nid)
-		*out_nid = r->nid;
+		*out_nid = r_nid;
 }
 
 /**
@@ -1810,7 +1812,7 @@ int __init_memblock memblock_search_pfn_nid(unsigned long pfn,
 	*start_pfn = PFN_DOWN(type->regions[mid].base);
 	*end_pfn = PFN_DOWN(type->regions[mid].base + type->regions[mid].size);
 
-	return type->regions[mid].nid;
+	return memblock_get_region_node(&type->regions[mid]);
 }
 #endif
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 69827d4fa052..0d012eda1694 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7208,7 +7208,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 			if (!memblock_is_hotpluggable(r))
 				continue;
 
-			nid = r->nid;
+			nid = memblock_get_region_node(r);
 
 			usable_startpfn = PFN_DOWN(r->base);
 			zone_movable_pfn[nid] = zone_movable_pfn[nid] ?
@@ -7229,7 +7229,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 			if (memblock_is_mirror(r))
 				continue;
 
-			nid = r->nid;
+			nid = memblock_get_region_node(r);
 
 			usable_startpfn = memblock_region_memory_base_pfn(r);
 
-- 
2.25.1

