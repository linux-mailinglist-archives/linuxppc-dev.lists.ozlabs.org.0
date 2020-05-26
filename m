Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2803D1BDC9F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 14:48:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bywr0ZhDzDqD5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 22:48:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ty0Ezl2g; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ByBj3VKFzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 22:15:09 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE7A12184D;
 Wed, 29 Apr 2020 12:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162507;
 bh=wSiCtht7XGk0G5xXo1EFLkbEsxIE900LvsbYCn6Fzv0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ty0Ezl2gwznQdHX/QjiKXUjVaUpaBjDw0d0R4fHNz9rFZfs92Jr0GLqFRn/SFE4B+
 sfXFVBXVsiMlbTQ50baltSPOWN5UJEyf7Lwwa3iCKJ4HhksnoH4xoKURE8roUYESqq
 i7MwEHqmOm4Ft3dxu0NpJmgq3kWsOGXxx8BgGNLY=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/20] unicore32: simplify detection of memory zone
 boundaries
Date: Wed, 29 Apr 2020 15:11:19 +0300
Message-Id: <20200429121126.17989-14-rppt@kernel.org>
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

The free_area_init() function only requires the definition of maximal PFN
for each of the supported zone rater than calculation of actual zone sizes
and the sizes of the holes between the zones.

After removal of CONFIG_HAVE_MEMBLOCK_NODE_MAP the free_area_init() is
available to all architectures.

Using this function instead of free_area_init_node() simplifies the zone
detection.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/unicore32/include/asm/memory.h  |  2 +-
 arch/unicore32/include/mach/memory.h |  6 ++--
 arch/unicore32/kernel/pci.c          | 14 ++-------
 arch/unicore32/mm/init.c             | 43 ++++++----------------------
 4 files changed, 15 insertions(+), 50 deletions(-)

diff --git a/arch/unicore32/include/asm/memory.h b/arch/unicore32/include/asm/memory.h
index 23c93105f98f..66285178dd9b 100644
--- a/arch/unicore32/include/asm/memory.h
+++ b/arch/unicore32/include/asm/memory.h
@@ -60,7 +60,7 @@
 #ifndef __ASSEMBLY__
 
 #ifndef arch_adjust_zones
-#define arch_adjust_zones(size, holes) do { } while (0)
+#define arch_adjust_zones(max_zone_pfn) do { } while (0)
 #endif
 
 /*
diff --git a/arch/unicore32/include/mach/memory.h b/arch/unicore32/include/mach/memory.h
index 2b527cedd03d..b4e6035cb9a3 100644
--- a/arch/unicore32/include/mach/memory.h
+++ b/arch/unicore32/include/mach/memory.h
@@ -25,10 +25,10 @@
 
 #if !defined(__ASSEMBLY__) && defined(CONFIG_PCI)
 
-void puv3_pci_adjust_zones(unsigned long *size, unsigned long *holes);
+void puv3_pci_adjust_zones(unsigned long *max_zone_pfn);
 
-#define arch_adjust_zones(size, holes) \
-	puv3_pci_adjust_zones(size, holes)
+#define arch_adjust_zones(max_zone_pfn) \
+	puv3_pci_adjust_zones(max_zone_pfn)
 
 #endif
 
diff --git a/arch/unicore32/kernel/pci.c b/arch/unicore32/kernel/pci.c
index efa04a94dcdb..0d098aa05b47 100644
--- a/arch/unicore32/kernel/pci.c
+++ b/arch/unicore32/kernel/pci.c
@@ -133,21 +133,11 @@ static int pci_puv3_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
  * This is really ugly and we need a better way of specifying
  * DMA-capable regions of memory.
  */
-void __init puv3_pci_adjust_zones(unsigned long *zone_size,
-	unsigned long *zhole_size)
+void __init puv3_pci_adjust_zones(unsigned long max_zone_pfn)
 {
 	unsigned int sz = SZ_128M >> PAGE_SHIFT;
 
-	/*
-	 * Only adjust if > 128M on current system
-	 */
-	if (zone_size[0] <= sz)
-		return;
-
-	zone_size[1] = zone_size[0] - sz;
-	zone_size[0] = sz;
-	zhole_size[1] = zhole_size[0];
-	zhole_size[0] = 0;
+	max_zone_pfn[ZONE_DMA] = sz;
 }
 
 /*
diff --git a/arch/unicore32/mm/init.c b/arch/unicore32/mm/init.c
index 6cf010fadc7a..52425d383cea 100644
--- a/arch/unicore32/mm/init.c
+++ b/arch/unicore32/mm/init.c
@@ -61,46 +61,21 @@ static void __init find_limits(unsigned long *min, unsigned long *max_low,
 	}
 }
 
-static void __init uc32_bootmem_free(unsigned long min, unsigned long max_low,
-	unsigned long max_high)
+static void __init uc32_bootmem_free(unsigned long max_low)
 {
-	unsigned long zone_size[MAX_NR_ZONES], zhole_size[MAX_NR_ZONES];
-	struct memblock_region *reg;
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
 
-	/*
-	 * initialise the zones.
-	 */
-	memset(zone_size, 0, sizeof(zone_size));
-
-	/*
-	 * The memory size has already been determined.  If we need
-	 * to do anything fancy with the allocation of this memory
-	 * to the zones, now is the time to do it.
-	 */
-	zone_size[0] = max_low - min;
-
-	/*
-	 * Calculate the size of the holes.
-	 *  holes = node_size - sum(bank_sizes)
-	 */
-	memcpy(zhole_size, zone_size, sizeof(zhole_size));
-	for_each_memblock(memory, reg) {
-		unsigned long start = memblock_region_memory_base_pfn(reg);
-		unsigned long end = memblock_region_memory_end_pfn(reg);
-
-		if (start < max_low) {
-			unsigned long low_end = min(end, max_low);
-			zhole_size[0] -= low_end - start;
-		}
-	}
+	max_zone_pfn[ZONE_DMA] = max_low;
+	max_zone_pfn[ZONE_NORMAL] = max_low;
 
 	/*
 	 * Adjust the sizes according to any special requirements for
 	 * this machine type.
+	 * This might lower ZONE_DMA limit.
 	 */
-	arch_adjust_zones(zone_size, zhole_size);
+	arch_adjust_zones(max_zone_pfn);
 
-	free_area_init_node(0, zone_size, min, zhole_size);
+	free_area_init(max_zone_pfn);
 }
 
 int pfn_valid(unsigned long pfn)
@@ -176,11 +151,11 @@ void __init bootmem_init(void)
 	sparse_init();
 
 	/*
-	 * Now free the memory - free_area_init_node needs
+	 * Now free the memory - free_area_init needs
 	 * the sparse mem_map arrays initialized by sparse_init()
 	 * for memmap_init_zone(), otherwise all PFNs are invalid.
 	 */
-	uc32_bootmem_free(min, max_low, max_high);
+	uc32_bootmem_free(max_low);
 
 	high_memory = __va((max_low << PAGE_SHIFT) - 1) + 1;
 
-- 
2.26.1

