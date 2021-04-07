Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1EB357304
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 19:23:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFrnc6KW2z3bwg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 03:23:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFrnH6sK4z2yx3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 03:22:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FFrn75YtczB09ZW;
 Wed,  7 Apr 2021 19:22:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id w9ppHJnEqjCw; Wed,  7 Apr 2021 19:22:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FFrn73Fl2zB09ZS;
 Wed,  7 Apr 2021 19:22:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F6B18B7B6;
 Wed,  7 Apr 2021 19:22:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8sskzgGAfOJD; Wed,  7 Apr 2021 19:22:37 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E9D248B75F;
 Wed,  7 Apr 2021 19:22:36 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C71496799B; Wed,  7 Apr 2021 17:22:36 +0000 (UTC)
Message-Id: <e1cd0925330cb0f263eafb61f7d63853a4b118e6.1617816138.git.christophe.leroy@csgroup.eu>
In-Reply-To: <311235752428dacbee81728767aacc2bf4222384.1617816138.git.christophe.leroy@csgroup.eu>
References: <311235752428dacbee81728767aacc2bf4222384.1617816138.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/8] powerpc/mem: Call flush_coherent_icache() at higher
 level
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  7 Apr 2021 17:22:36 +0000 (UTC)
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

flush_coherent_icache() doesn't need the address anymore,
so it can be called immediately when entering the public
functions and doesn't need to be disseminated among
lower level functions.

And use page_to_phys() instead of open coding the calculation
of phys address to call flush_dcache_icache_phys().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/mem.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 19f807b87697..29ce215e491f 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -491,6 +491,8 @@ static void flush_dcache_icache_hugepage(struct page *page)
 
 void flush_dcache_icache_page(struct page *page)
 {
+	if (flush_coherent_icache())
+		return;
 
 	if (PageCompound(page))
 		return flush_dcache_icache_hugepage(page);
@@ -504,11 +506,7 @@ void flush_dcache_icache_page(struct page *page)
 		__flush_dcache_icache(start);
 		kunmap_atomic(start);
 	} else {
-		unsigned long addr = page_to_pfn(page) << PAGE_SHIFT;
-
-		if (flush_coherent_icache())
-			return;
-		flush_dcache_icache_phys(addr);
+		flush_dcache_icache_phys(page_to_phys(page));
 	}
 #endif
 }
@@ -525,9 +523,6 @@ static void __flush_dcache_icache(void *p)
 {
 	unsigned long addr = (unsigned long)p;
 
-	if (flush_coherent_icache())
-		return;
-
 	clean_dcache_range(addr, addr + PAGE_SIZE);
 
 	/*
-- 
2.25.0

