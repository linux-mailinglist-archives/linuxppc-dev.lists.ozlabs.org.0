Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E360358876
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 17:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGQG33sNBz3c3y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 01:31:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGQFK1j6Nz2yQv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 01:30:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGQFF0xmkz9txf4;
 Thu,  8 Apr 2021 17:30:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YW0x8LnnTY2Y; Thu,  8 Apr 2021 17:30:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGQFF0BY1z9txf2;
 Thu,  8 Apr 2021 17:30:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8761C8B7D1;
 Thu,  8 Apr 2021 17:30:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xe3z9x8d8du6; Thu,  8 Apr 2021 17:30:26 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3272F8B7D4;
 Thu,  8 Apr 2021 17:30:26 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0EDC7679BA; Thu,  8 Apr 2021 15:30:26 +0000 (UTC)
Message-Id: <3fa903eb5a10b2bc7d99a8c559ffdaa05452d8e0.1617895813.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
References: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/9] powerpc/mem: Declare __flush_dcache_icache() static
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  8 Apr 2021 15:30:26 +0000 (UTC)
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

__flush_dcache_icache() is only used in mem.c.

Move it before the functions that use it and declare it static.

And also fix the name of the parameter in the comment.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/cacheflush.h |  1 -
 arch/powerpc/mm/cacheflush.c          | 60 +++++++++++++--------------
 2 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index f63495109f63..9110489ea411 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -40,7 +40,6 @@ void flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 #define flush_icache_user_page flush_icache_user_page
 
 void flush_dcache_icache_page(struct page *page);
-void __flush_dcache_icache(void *page);
 
 /**
  * flush_dcache_range(): Write any modified data cache blocks out to memory and
diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
index 40613d2fda37..742d3e0fb12f 100644
--- a/arch/powerpc/mm/cacheflush.c
+++ b/arch/powerpc/mm/cacheflush.c
@@ -135,6 +135,36 @@ void flush_dcache_page(struct page *page)
 }
 EXPORT_SYMBOL(flush_dcache_page);
 
+/**
+ * __flush_dcache_icache(): Flush a particular page from the data cache to RAM.
+ * Note: this is necessary because the instruction cache does *not*
+ * snoop from the data cache.
+ *
+ * @p: the address of the page to flush
+ */
+static void __flush_dcache_icache(void *p)
+{
+	unsigned long addr = (unsigned long)p;
+
+	if (flush_coherent_icache(addr))
+		return;
+
+	clean_dcache_range(addr, addr + PAGE_SIZE);
+
+	/*
+	 * We don't flush the icache on 44x. Those have a virtual icache and we
+	 * don't have access to the virtual address here (it's not the page
+	 * vaddr but where it's mapped in user space). The flushing of the
+	 * icache on these is handled elsewhere, when a change in the address
+	 * space occurs, before returning to user space.
+	 */
+
+	if (mmu_has_feature(MMU_FTR_TYPE_44x))
+		return;
+
+	invalidate_icache_range(addr, addr + PAGE_SIZE);
+}
+
 static void flush_dcache_icache_hugepage(struct page *page)
 {
 	int i;
@@ -178,36 +208,6 @@ void flush_dcache_icache_page(struct page *page)
 }
 EXPORT_SYMBOL(flush_dcache_icache_page);
 
-/**
- * __flush_dcache_icache(): Flush a particular page from the data cache to RAM.
- * Note: this is necessary because the instruction cache does *not*
- * snoop from the data cache.
- *
- * @page: the address of the page to flush
- */
-void __flush_dcache_icache(void *p)
-{
-	unsigned long addr = (unsigned long)p;
-
-	if (flush_coherent_icache(addr))
-		return;
-
-	clean_dcache_range(addr, addr + PAGE_SIZE);
-
-	/*
-	 * We don't flush the icache on 44x. Those have a virtual icache and we
-	 * don't have access to the virtual address here (it's not the page
-	 * vaddr but where it's mapped in user space). The flushing of the
-	 * icache on these is handled elsewhere, when a change in the address
-	 * space occurs, before returning to user space.
-	 */
-
-	if (mmu_has_feature(MMU_FTR_TYPE_44x))
-		return;
-
-	invalidate_icache_range(addr, addr + PAGE_SIZE);
-}
-
 void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
 {
 	clear_page(page);
-- 
2.25.0

