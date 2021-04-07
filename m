Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE17357315
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 19:24:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFrq324Zrz3cYY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 03:24:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFrnJ04nPz302x
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 03:22:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FFrn969YQzB09ZZ;
 Wed,  7 Apr 2021 19:22:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PikW_eHcrmVD; Wed,  7 Apr 2021 19:22:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FFrn954HBzB09ZS;
 Wed,  7 Apr 2021 19:22:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 586778B7B6;
 Wed,  7 Apr 2021 19:22:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AqWa6-IJJund; Wed,  7 Apr 2021 19:22:39 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DF428B75F;
 Wed,  7 Apr 2021 19:22:39 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D370D6799B; Wed,  7 Apr 2021 17:22:38 +0000 (UTC)
Message-Id: <fa3c3301ea0545028eef50270d00490aafab54bd.1617816138.git.christophe.leroy@csgroup.eu>
In-Reply-To: <311235752428dacbee81728767aacc2bf4222384.1617816138.git.christophe.leroy@csgroup.eu>
References: <311235752428dacbee81728767aacc2bf4222384.1617816138.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 5/8] powerpc/mem: flush_dcache_icache_phys() is for HIGHMEM
 pages only
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  7 Apr 2021 17:22:38 +0000 (UTC)
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

__flush_dcache_icache() is usable for non HIGHMEM pages on
every platform.

It is only for HIGHMEM pages that BOOKE needs kmap() and
BOOK3S needs flush_dcache_icache_phys().

So make flush_dcache_icache_phys() dependent on CONFIG_HIGHMEM and
call it only when it is a HIGHMEM page.

We could make flush_dcache_icache_phys() available at all time,
but as it is declared NOKPROBE_SYMBOL(), GCC doesn't optimise
it out when it is not used.

So define a stub for !CONFIG_HIGHMEM in order to remove the #ifdef in
flush_dcache_icache_page() and use IS_ENABLED() instead.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/mem.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index d2c66827d9fd..9a5542f4de92 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -413,7 +413,7 @@ void flush_icache_range(unsigned long start, unsigned long stop)
 }
 EXPORT_SYMBOL(flush_icache_range);
 
-#if !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC64)
+#ifdef CONFIG_HIGHMEM
 /**
  * flush_dcache_icache_phys() - Flush a page by it's physical address
  * @physaddr: the physical address of the page
@@ -452,7 +452,11 @@ static void flush_dcache_icache_phys(unsigned long physaddr)
 		: "ctr", "memory");
 }
 NOKPROBE_SYMBOL(flush_dcache_icache_phys)
-#endif // !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC64)
+#else
+static void flush_dcache_icache_phys(unsigned long physaddr)
+{
+}
+#endif
 
 /*
  * This is called when a page has been modified by the kernel.
@@ -497,18 +501,15 @@ void flush_dcache_icache_page(struct page *page)
 	if (PageCompound(page))
 		return flush_dcache_icache_hugepage(page);
 
-#if defined(CONFIG_PPC_8xx) || defined(CONFIG_PPC64)
-	/* On 8xx there is no need to kmap since highmem is not supported */
-	__flush_dcache_icache(page_address(page));
-#else
-	if (IS_ENABLED(CONFIG_BOOKE) || sizeof(phys_addr_t) > sizeof(void *)) {
+	if (!PageHighMem(page)) {
+		__flush_dcache_icache(lowmem_page_address(page));
+	} else if (IS_ENABLED(CONFIG_BOOKE) || sizeof(phys_addr_t) > sizeof(void *)) {
 		void *start = kmap_atomic(page);
 		__flush_dcache_icache(start);
 		kunmap_atomic(start);
 	} else {
 		flush_dcache_icache_phys(page_to_phys(page));
 	}
-#endif
 }
 EXPORT_SYMBOL(flush_dcache_icache_page);
 
-- 
2.25.0

