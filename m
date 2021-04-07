Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BCA357316
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 19:24:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFrqQ2Hvdz3clP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 03:24:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFrnL45bLz30GV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 03:22:46 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FFrnD5tF4zB09Zd;
 Wed,  7 Apr 2021 19:22:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ARjndTOPdYxl; Wed,  7 Apr 2021 19:22:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FFrnD530bzB09ZS;
 Wed,  7 Apr 2021 19:22:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 66EE08B7B6;
 Wed,  7 Apr 2021 19:22:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id H3O39hLoOR4i; Wed,  7 Apr 2021 19:22:42 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BC388B75F;
 Wed,  7 Apr 2021 19:22:42 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F062B6799B; Wed,  7 Apr 2021 17:22:41 +0000 (UTC)
Message-Id: <0838c473de92bc87826710cc2a35e0f05c98bbd9.1617816138.git.christophe.leroy@csgroup.eu>
In-Reply-To: <311235752428dacbee81728767aacc2bf4222384.1617816138.git.christophe.leroy@csgroup.eu>
References: <311235752428dacbee81728767aacc2bf4222384.1617816138.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 8/8] powerpc/mem: Use kmap_local_page() in flushing
 functions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  7 Apr 2021 17:22:41 +0000 (UTC)
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
 arch/powerpc/mm/mem.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 65b2205839fe..1895bd64191a 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -464,16 +464,16 @@ static void flush_dcache_icache_hugepage(struct page *page)
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
@@ -489,9 +489,10 @@ void flush_dcache_icache_page(struct page *page)
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
@@ -564,11 +565,11 @@ void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
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
 
 /*
-- 
2.25.0

