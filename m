Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3C0186C6E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 14:47:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gyL01xT4zDqQG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 00:47:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=iSSTETNh; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwl92Pg3zDqJg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwky4rDHz9v02j;
 Mon, 16 Mar 2020 13:35:54 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=iSSTETNh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id A4z25AipUBKg; Mon, 16 Mar 2020 13:35:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwky3rCMz9v02g;
 Mon, 16 Mar 2020 13:35:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362154; bh=OvYSJZYDXUDD3TulXN4Kh1QEXL7hszEQ5ArTg602e9Y=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=iSSTETNhSLwXNxZgE3vdLLkulSGd9ZfyxCf2QDsffKyPOVuiNlKu4dsWWrBpUPIbc
 CAm9+63ly4ucoV47XjK+AlkfoWw/wVmfdozNj0SO5RghnHKOkshdKQSM3Wz1Y7FTQC
 h+GDbeD7ra8FdQ8PkbMollAKm78FZEIGvebmjJwc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8130B8B7D0;
 Mon, 16 Mar 2020 13:35:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RXU0fAePLlBw; Mon, 16 Mar 2020 13:35:59 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 674C68B7CB;
 Mon, 16 Mar 2020 13:35:59 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5EDC665595; Mon, 16 Mar 2020 12:35:59 +0000 (UTC)
Message-Id: <1264b2813ecb073b8a8b0387e6af081d5495410e.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 14/46] powerpc/ptdump: Handle hugepd at PGD level
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:35:59 +0000 (UTC)
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

The 8xx is about to map kernel linear space and IMMR using huge
pages.

In order to display those pages properly, ptdump needs to handle
hugepd tables at PGD level.

For the time being do it only at PGD level. Further patches may
add handling of hugepd tables at lower level for other platforms
when needed in the future.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/ptdump/ptdump.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 64434b66f240..1adaa7e794f3 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -23,6 +23,7 @@
 #include <linux/const.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
+#include <asm/hugetlb.h>
 
 #include <mm/mmu_decl.h>
 
@@ -270,6 +271,26 @@ static void walk_pte(struct pg_state *st, pmd_t *pmd, unsigned long start)
 	}
 }
 
+static void walk_hugepd(struct pg_state *st, hugepd_t *phpd, unsigned long start,
+			int pdshift, int level)
+{
+#ifdef CONFIG_ARCH_HAS_HUGEPD
+	unsigned int i;
+	int shift = hugepd_shift(*phpd);
+	int ptrs_per_hpd = pdshift - shift > 0 ? 1 << (pdshift - shift) : 1;
+
+	if (start & ((1 << shift) - 1))
+		return;
+
+	for (i = 0; i < ptrs_per_hpd; i++) {
+		unsigned long addr = start + (i << shift);
+		pte_t *pte = hugepte_offset(*phpd, addr, pdshift);
+
+		note_page(st, addr, level + 1, pte_val(*pte), shift);
+	}
+#endif
+}
+
 static void walk_pmd(struct pg_state *st, pud_t *pud, unsigned long start)
 {
 	pmd_t *pmd = pmd_offset(pud, 0);
@@ -313,11 +334,13 @@ static void walk_pagetables(struct pg_state *st)
 	 * the hash pagetable.
 	 */
 	for (i = pgd_index(addr); i < PTRS_PER_PGD; i++, pgd++, addr += PGDIR_SIZE) {
-		if (!pgd_none(*pgd) && !pgd_is_leaf(*pgd))
+		if (pgd_none(*pgd) || pgd_is_leaf(*pgd))
+			note_page(st, addr, 1, pgd_val(*pgd), PUD_SHIFT);
+		else if (is_hugepd(__hugepd(pgd_val(*pgd))))
+			walk_hugepd(st, (hugepd_t *)pgd, addr, PGDIR_SHIFT, 1);
+		else
 			/* pgd exists */
 			walk_pud(st, pgd, addr);
-		else
-			note_page(st, addr, 1, pgd_val(*pgd), PUD_SHIFT);
 	}
 }
 
-- 
2.25.0

