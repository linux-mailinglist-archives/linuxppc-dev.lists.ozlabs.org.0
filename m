Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D161398768
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 12:57:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw5ZN4v10z303g
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 20:57:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XGTCrtl7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XGTCrtl7; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw5Wj4GLZz3033
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 20:54:41 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18C4F613D2;
 Wed,  2 Jun 2021 10:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622631279;
 bh=qtLyGf4vOvwEQ4V6NpeybsroEnpC9HLrj/S5SXiLLF8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XGTCrtl72DxQNjMfUptZN20o65/I5/0M1iOFnuAmOeEF1SEzpfdscZVp+KHM34pDG
 odAmU83IosYyQ6A8n/YSpLo8oQB6VZHjMR2FcFn7mvZNqjsOa6CV5TXGZao77PTin+
 UI8kYltUfP+V3O9U8hmu00edpJC5kuUTXos62Hqf3Hcap6w8ii/eQGlCM8Oyl/Oy/O
 /LXEHnEaN9jvVKkRs0py4jWksoKpkY6Kf2QtndwQGmBOl4hEs+hd26OKo3NKU3GevB
 UXSfBa/zVl3r42Xjx7uWEBIh71qn4wE2uZXOZAnUryv1NyWLLiA2WWhulyN1Z9Uv7P
 gfSU0GIggJELw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 6/9] arch, mm: remove stale mentions of DISCONIGMEM
Date: Wed,  2 Jun 2021 13:53:45 +0300
Message-Id: <20210602105348.13387-7-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210602105348.13387-1-rppt@kernel.org>
References: <20210602105348.13387-1-rppt@kernel.org>
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

There are several places that mention DISCONIGMEM in comments or have stale
code guarded by CONFIG_DISCONTIGMEM.

Remove the dead code and update the comments.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/ia64/kernel/topology.c     | 5 ++---
 arch/ia64/mm/numa.c             | 5 ++---
 arch/mips/include/asm/mmzone.h  | 6 ------
 arch/mips/mm/init.c             | 3 ---
 arch/nds32/include/asm/memory.h | 6 ------
 arch/xtensa/include/asm/page.h  | 4 ----
 include/linux/gfp.h             | 4 ++--
 7 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/arch/ia64/kernel/topology.c b/arch/ia64/kernel/topology.c
index 09fc385c2acd..3639e0a7cb3b 100644
--- a/arch/ia64/kernel/topology.c
+++ b/arch/ia64/kernel/topology.c
@@ -3,9 +3,8 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  *
- * This file contains NUMA specific variables and functions which can
- * be split away from DISCONTIGMEM and are used on NUMA machines with
- * contiguous memory.
+ * This file contains NUMA specific variables and functions which are used on
+ * NUMA machines with contiguous memory.
  * 		2002/08/07 Erich Focht <efocht@ess.nec.de>
  * Populate cpu entries in sysfs for non-numa systems as well
  *  	Intel Corporation - Ashok Raj
diff --git a/arch/ia64/mm/numa.c b/arch/ia64/mm/numa.c
index 46b6e5f3a40f..d6579ec3ea32 100644
--- a/arch/ia64/mm/numa.c
+++ b/arch/ia64/mm/numa.c
@@ -3,9 +3,8 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  *
- * This file contains NUMA specific variables and functions which can
- * be split away from DISCONTIGMEM and are used on NUMA machines with
- * contiguous memory.
+ * This file contains NUMA specific variables and functions which are used on
+ * NUMA machines with contiguous memory.
  * 
  *                         2002/08/07 Erich Focht <efocht@ess.nec.de>
  */
diff --git a/arch/mips/include/asm/mmzone.h b/arch/mips/include/asm/mmzone.h
index b826b8473e95..7649ab45e80c 100644
--- a/arch/mips/include/asm/mmzone.h
+++ b/arch/mips/include/asm/mmzone.h
@@ -20,10 +20,4 @@
 #define nid_to_addrbase(nid) 0
 #endif
 
-#ifdef CONFIG_DISCONTIGMEM
-
-#define pfn_to_nid(pfn)		pa_to_nid((pfn) << PAGE_SHIFT)
-
-#endif /* CONFIG_DISCONTIGMEM */
-
 #endif /* _ASM_MMZONE_H_ */
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index c36358758969..97f6ca341448 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -454,9 +454,6 @@ void __init mem_init(void)
 	BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
 
 #ifdef CONFIG_HIGHMEM
-#ifdef CONFIG_DISCONTIGMEM
-#error "CONFIG_HIGHMEM and CONFIG_DISCONTIGMEM dont work together yet"
-#endif
 	max_mapnr = highend_pfn ? highend_pfn : max_low_pfn;
 #else
 	max_mapnr = max_low_pfn;
diff --git a/arch/nds32/include/asm/memory.h b/arch/nds32/include/asm/memory.h
index 940d32842793..62faafbc28e4 100644
--- a/arch/nds32/include/asm/memory.h
+++ b/arch/nds32/include/asm/memory.h
@@ -76,18 +76,12 @@
  *  virt_to_page(k)	convert a _valid_ virtual address to struct page *
  *  virt_addr_valid(k)	indicates whether a virtual address is valid
  */
-#ifndef CONFIG_DISCONTIGMEM
-
 #define ARCH_PFN_OFFSET		PHYS_PFN_OFFSET
 #define pfn_valid(pfn)		((pfn) >= PHYS_PFN_OFFSET && (pfn) < (PHYS_PFN_OFFSET + max_mapnr))
 
 #define virt_to_page(kaddr)	(pfn_to_page(__pa(kaddr) >> PAGE_SHIFT))
 #define virt_addr_valid(kaddr)	((unsigned long)(kaddr) >= PAGE_OFFSET && (unsigned long)(kaddr) < (unsigned long)high_memory)
 
-#else /* CONFIG_DISCONTIGMEM */
-#error CONFIG_DISCONTIGMEM is not supported yet.
-#endif /* !CONFIG_DISCONTIGMEM */
-
 #define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
 
 #endif
diff --git a/arch/xtensa/include/asm/page.h b/arch/xtensa/include/asm/page.h
index 37ce25ef92d6..493eb7083b1a 100644
--- a/arch/xtensa/include/asm/page.h
+++ b/arch/xtensa/include/asm/page.h
@@ -192,10 +192,6 @@ static inline unsigned long ___pa(unsigned long va)
 #define pfn_valid(pfn) \
 	((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
 
-#ifdef CONFIG_DISCONTIGMEM
-# error CONFIG_DISCONTIGMEM not supported
-#endif
-
 #define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
 #define page_to_virt(page)	__va(page_to_pfn(page) << PAGE_SHIFT)
 #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 11da8af06704..dbe1f5fc901d 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -494,8 +494,8 @@ static inline int gfp_zonelist(gfp_t flags)
  * There are two zonelists per node, one for all zones with memory and
  * one containing just zones from the node the zonelist belongs to.
  *
- * For the normal case of non-DISCONTIGMEM systems the NODE_DATA() gets
- * optimized to &contig_page_data at compile-time.
+ * For the case of non-NUMA systems the NODE_DATA() gets optimized to
+ * &contig_page_data at compile-time.
  */
 static inline struct zonelist *node_zonelist(int nid, gfp_t flags)
 {
-- 
2.28.0

