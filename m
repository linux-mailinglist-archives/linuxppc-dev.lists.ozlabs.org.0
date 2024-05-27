Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 8260A8D0207
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 15:42:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnxQx6KSsz88Km
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 23:32:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnxP141MHz79Bq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2024 23:31:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4VnxNT6zt4z9tCl;
	Mon, 27 May 2024 15:30:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnRJFRISjg-U; Mon, 27 May 2024 15:30:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4VnxNT69BJz9sqS;
	Mon, 27 May 2024 15:30:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CED8E8B773;
	Mon, 27 May 2024 15:30:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nNWVwUBAoKxI; Mon, 27 May 2024 15:30:33 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.49])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4EAC88B764;
	Mon, 27 May 2024 15:30:32 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH v4 05/16] powerpc/mm: Fix __find_linux_pte() on 32 bits with PMD leaf entries
Date: Mon, 27 May 2024 15:30:03 +0200
Message-ID: <d27becf9f8d9bbe6d89bd9aca7fdd2fbc6c39080.1716815901.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1716815901.git.christophe.leroy@csgroup.eu>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716816600; l=2268; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=CgsurgT/HBdZ/v9IT1Gnjjxrc//xCkwC6Uo2ZbsMc0U=; b=IfJ51RBuoaijjVJUpXSYAenvJ2xeDUJnOsadh4SsDBYVzR3VhIS7lTxdFZA6qrF8yyk96WhQi Uy+dEMH3SUzA4HGrpgq60Nk62vjH7QKtycWTD5UA/ytzt+kydidbAMU
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building on 32 bits with pmd_leaf() not returning always false leads
to the following error:

  CC      arch/powerpc/mm/pgtable.o
arch/powerpc/mm/pgtable.c: In function '__find_linux_pte':
arch/powerpc/mm/pgtable.c:506:1: error: function may return address of local variable [-Werror=return-local-addr]
  506 | }
      | ^
arch/powerpc/mm/pgtable.c:394:15: note: declared here
  394 |         pud_t pud, *pudp;
      |               ^~~
arch/powerpc/mm/pgtable.c:394:15: note: declared here

This is due to pmd_offset() being a no-op in that case.

So rework it for powerpc/32 so that pXd_offset() are used on real
pointers and not on on-stack copies.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
v3: Removed p4dp and pudp locals for PPC32 and add a comment.
v4: Properly set pdshift on PPC32 case
---
 arch/powerpc/mm/pgtable.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 9e7ba9c3851f..bce8a8619589 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -382,8 +382,10 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 			bool *is_thp, unsigned *hpage_shift)
 {
 	pgd_t *pgdp;
+#ifdef CONFIG_PPC64
 	p4d_t p4d, *p4dp;
 	pud_t pud, *pudp;
+#endif
 	pmd_t pmd, *pmdp;
 	pte_t *ret_pte;
 	hugepd_t *hpdp = NULL;
@@ -401,8 +403,12 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	 * page fault or a page unmap. The return pte_t * is still not
 	 * stable. So should be checked there for above conditions.
 	 * Top level is an exception because it is folded into p4d.
+	 *
+	 * On PPC32, P4D/PUD/PMD are folded into PGD so go straight to
+	 * PMD level.
 	 */
 	pgdp = pgdir + pgd_index(ea);
+#ifdef CONFIG_PPC64
 	p4dp = p4d_offset(pgdp, ea);
 	p4d  = READ_ONCE(*p4dp);
 	pdshift = P4D_SHIFT;
@@ -442,8 +448,11 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 		goto out_huge;
 	}
 
-	pdshift = PMD_SHIFT;
 	pmdp = pmd_offset(&pud, ea);
+#else
+	pmdp = pmd_offset(pud_offset(p4d_offset(pgdp, ea), ea), ea);
+#endif
+	pdshift = PMD_SHIFT;
 	pmd  = READ_ONCE(*pmdp);
 
 	/*
-- 
2.44.0

