Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED06F358884
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 17:32:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGQHH6bRPz3bvg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 01:32:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGQFN06vTz3bT9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 01:30:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGQFJ0V0Wz9txf8;
 Thu,  8 Apr 2021 17:30:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NSCVrtUycyuL; Thu,  8 Apr 2021 17:30:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGQFH6pCXz9txf2;
 Thu,  8 Apr 2021 17:30:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 82E198B7D4;
 Thu,  8 Apr 2021 17:30:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lQM7cJNku8cq; Thu,  8 Apr 2021 17:30:29 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B97C8B7D1;
 Thu,  8 Apr 2021 17:30:29 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 27544679BA; Thu,  8 Apr 2021 15:30:29 +0000 (UTC)
Message-Id: <ab03712b70105fccfceef095aa03007de9295a40.1617895813.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
References: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 5/9] powerpc/mem: Optimise flush_dcache_icache_hugepage()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  8 Apr 2021 15:30:29 +0000 (UTC)
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

flush_dcache_icache_hugepage() is a static function, with
only one caller. That caller calls it when PageCompound() is true,
so bugging on !PageCompound() is useless if we can trust the
compiler a little. Remove the BUG_ON(!PageCompound()).

The number of elements of a page won't change over time, but
GCC doesn't know about it, so it gets the value at every iteration.

To avoid that, call compound_nr() outside the loop and save it in
a local variable.

Whether the page is a HIGHMEM page or not doesn't change over time.

But GCC doesn't know it so it does the test on every iteration.

Do the test outside the loop.

When the page is not a HIGHMEM page, page_address() will fallback on
lowmem_page_address(), so call lowmem_page_address() directly and
don't suffer the call to page_address() on every iteration.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/cacheflush.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
index 811045c50d82..3268a3e55c3f 100644
--- a/arch/powerpc/mm/cacheflush.c
+++ b/arch/powerpc/mm/cacheflush.c
@@ -162,14 +162,14 @@ static void __flush_dcache_icache(void *p)
 static void flush_dcache_icache_hugepage(struct page *page)
 {
 	int i;
+	int nr = compound_nr(page);
 	void *start;
 
-	BUG_ON(!PageCompound(page));
-
-	for (i = 0; i < compound_nr(page); i++) {
-		if (!PageHighMem(page)) {
-			__flush_dcache_icache(page_address(page+i));
-		} else {
+	if (!PageHighMem(page)) {
+		for (i = 0; i < nr; i++)
+			__flush_dcache_icache(lowmem_page_address(page + i));
+	} else {
+		for (i = 0; i < nr; i++) {
 			start = kmap_atomic(page+i);
 			__flush_dcache_icache(start);
 			kunmap_atomic(start);
-- 
2.25.0

