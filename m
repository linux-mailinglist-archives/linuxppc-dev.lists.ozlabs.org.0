Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D05E35888E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 17:33:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGQJp3Pv9z3ddh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 01:33:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGQFS2cXlz3bs1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 01:30:36 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGQFN2s1tz9txf2;
 Thu,  8 Apr 2021 17:30:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pEdBiU3HbjFY; Thu,  8 Apr 2021 17:30:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGQFN1z0Dz9txfD;
 Thu,  8 Apr 2021 17:30:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A87AB8B7D6;
 Thu,  8 Apr 2021 17:30:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nh5wg_E2XZCY; Thu,  8 Apr 2021 17:30:33 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 67E3F8B7D4;
 Thu,  8 Apr 2021 17:30:33 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 43C03679BA; Thu,  8 Apr 2021 15:30:33 +0000 (UTC)
Message-Id: <b6a880ea0ec7886b51edbb4979c188be549231c0.1617895813.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
References: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 9/9] powerpc/mem: Use kmap_local_page() in flushing
 functions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  8 Apr 2021 15:30:33 +0000 (UTC)
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

Flushing functions don't rely on preemption being disabled, so
use kmap_local_page() instead of kmap_atomic().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/cacheflush.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
index d9eafa077c09..63363787e000 100644
--- a/arch/powerpc/mm/cacheflush.c
+++ b/arch/powerpc/mm/cacheflush.c
@@ -152,16 +152,16 @@ static void flush_dcache_icache_hugepage(struct page *page)
 {
 	int i;
 	int nr = compound_nr(page);
-	void *start;
 
 	if (!PageHighMem(page)) {
 		for (i = 0; i < nr; i++)
 			__flush_dcache_icache(lowmem_page_address(page + i));
 	} else {
 		for (i = 0; i < nr; i++) {
-			start = kmap_atomic(page+i);
+			void *start = kmap_local_page(page + i);
+
 			__flush_dcache_icache(start);
-			kunmap_atomic(start);
+			kunmap_local(start);
 		}
 	}
 }
@@ -177,9 +177,10 @@ void flush_dcache_icache_page(struct page *page)
 	if (!PageHighMem(page)) {
 		__flush_dcache_icache(lowmem_page_address(page));
 	} else if (IS_ENABLED(CONFIG_BOOKE) || sizeof(phys_addr_t) > sizeof(void *)) {
-		void *start = kmap_atomic(page);
+		void *start = kmap_local_page(page);
+
 		__flush_dcache_icache(start);
-		kunmap_atomic(start);
+		kunmap_local(start);
 	} else {
 		flush_dcache_icache_phys(page_to_phys(page));
 	}
@@ -225,9 +226,9 @@ void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
 void flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 			     unsigned long addr, int len)
 {
-	unsigned long maddr;
+	void *maddr;
 
-	maddr = (unsigned long) kmap(page) + (addr & ~PAGE_MASK);
-	flush_icache_range(maddr, maddr + len);
-	kunmap(page);
+	maddr = kmap_local_page(page) + (addr & ~PAGE_MASK);
+	flush_icache_range((unsigned long)maddr, (unsigned long)maddr + len);
+	kunmap_local(maddr);
 }
-- 
2.25.0

