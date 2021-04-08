Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B074435888C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 17:33:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGQJL343Hz3c2N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 01:33:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGQFR0XnKz3br0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 01:30:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGQFM1B5Gz9txf3;
 Thu,  8 Apr 2021 17:30:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TvbRqcKkh378; Thu,  8 Apr 2021 17:30:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGQFM0PmXz9txf2;
 Thu,  8 Apr 2021 17:30:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 985598B7D4;
 Thu,  8 Apr 2021 17:30:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id irZHRLxwKFz5; Thu,  8 Apr 2021 17:30:32 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D8638B7D1;
 Thu,  8 Apr 2021 17:30:32 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3BEBE679BA; Thu,  8 Apr 2021 15:30:32 +0000 (UTC)
Message-Id: <21c417488b70b7629dae316539fb7bb8bdef4fdd.1617895813.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
References: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 8/9] powerpc/mem: Inline flush_dcache_page()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  8 Apr 2021 15:30:32 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

flush_dcache_page() is only a few lines, it is worth
inlining.

ia64, csky, mips, openrisc and riscv have a similar
flush_dcache_page() and inline it.

On pmac32_defconfig, we get a small size reduction.
On ppc64_defconfig, we get a very small size increase.

In both case that's in the noise (less than 0.1%).

text		data	bss	dec		hex	filename
18991155	5934744	1497624	26423523	19330e3	vmlinux64.before
18994829	5936732	1497624	26429185	1934701	vmlinux64.after
9150963		2467502	 184548	11803013	 b41985	vmlinux32.before
9149689		2467302	 184548	11801539	 b413c3	vmlinux32.after

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/cacheflush.h | 14 +++++++++++++-
 arch/powerpc/mm/cacheflush.c          | 15 ---------------
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index 9110489ea411..7564dd4fd12b 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -30,7 +30,19 @@ static inline void flush_cache_vmap(unsigned long start, unsigned long end)
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
-extern void flush_dcache_page(struct page *page);
+/*
+ * This is called when a page has been modified by the kernel.
+ * It just marks the page as not i-cache clean.  We do the i-cache
+ * flush later when the page is given to a user process, if necessary.
+ */
+static inline void flush_dcache_page(struct page *page)
+{
+	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE))
+		return;
+	/* avoid an atomic op if possible */
+	if (test_bit(PG_dcache_clean, &page->flags))
+		clear_bit(PG_dcache_clean, &page->flags);
+}
 
 void flush_icache_range(unsigned long start, unsigned long stop);
 #define flush_icache_range flush_icache_range
diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
index abeef69ed4e4..d9eafa077c09 100644
--- a/arch/powerpc/mm/cacheflush.c
+++ b/arch/powerpc/mm/cacheflush.c
@@ -121,21 +121,6 @@ static void flush_dcache_icache_phys(unsigned long physaddr)
 }
 #endif
 
-/*
- * This is called when a page has been modified by the kernel.
- * It just marks the page as not i-cache clean.  We do the i-cache
- * flush later when the page is given to a user process, if necessary.
- */
-void flush_dcache_page(struct page *page)
-{
-	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE))
-		return;
-	/* avoid an atomic op if possible */
-	if (test_bit(PG_dcache_clean, &page->flags))
-		clear_bit(PG_dcache_clean, &page->flags);
-}
-EXPORT_SYMBOL(flush_dcache_page);
-
 /**
  * __flush_dcache_icache(): Flush a particular page from the data cache to RAM.
  * Note: this is necessary because the instruction cache does *not*
-- 
2.25.0

