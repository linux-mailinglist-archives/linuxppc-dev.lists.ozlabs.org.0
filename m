Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F035ED4E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 08:30:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McmnY1pHFz3bbP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 16:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mcmn20mHTz3c7l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 16:29:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Mcmmy3BMGz9smH;
	Wed, 28 Sep 2022 08:29:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DB3Kn1yo_E4X; Wed, 28 Sep 2022 08:29:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Mcmmy2V9Pz9sm8;
	Wed, 28 Sep 2022 08:29:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 46B598B776;
	Wed, 28 Sep 2022 08:29:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id axZ4ohyAlod8; Wed, 28 Sep 2022 08:29:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.79])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 13CB18B763;
	Wed, 28 Sep 2022 08:29:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28S6TSBQ420597
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 08:29:28 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28S6TSjm420589;
	Wed, 28 Sep 2022 08:29:28 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/8xx: Reverse order entries are written by __set_pte_at()
Date: Wed, 28 Sep 2022 08:29:22 +0200
Message-Id: <67c3b5d44edfec054234ea9b4d05fc4b4f7f8a0e.1664346554.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1664346561; l=1335; s=20211009; h=from:subject:message-id; bh=9jZTVJ2VbndZFa3uCBcaKraZQEZwRNNQzKTSqN0XjYs=; b=x3aiEwbdWETYXnoMgSUQ4vScKUXvO35e+NmF2BGUCWwaaLzYkERsDDpQPqYI7Tm7eMvgSzdg81aX Nx7w8fJEDYcLFfdoMM/2J+u0xx5e55g6Te9cFVsEH0NrEfGTYuOM
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the time being, with 16k pages __set_pte_at() writes table entries
in reverse order:

 294:	91 49 00 0c 	stw     r10,12(r9)
 298:	91 49 00 08 	stw     r10,8(r9)
 29c:	91 49 00 04 	stw     r10,4(r9)
 2a0:	91 49 00 00 	stw     r10,0(r9)

Allthough there should be no impact at all as it stays in a single
cacheline, reverse the writing in a more natural order.

 288:	91 49 00 0c 	stw     r10,0(r9)
 28c:	91 49 00 08 	stw     r10,4(r9)
 290:	91 49 00 04 	stw     r10,8(r9)
 294:	91 49 00 00 	stw     r10,12(r9)

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 4fd73c7412d0..d2e39823af09 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -183,7 +183,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 	 * cases, and 32-bit non-hash with 32-bit PTEs.
 	 */
 #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
-	ptep->pte = ptep->pte1 = ptep->pte2 = ptep->pte3 = pte_val(pte);
+	ptep->pte3 = ptep->pte2 = ptep->pte1 = ptep->pte = pte_val(pte);
 #else
 	*ptep = pte;
 #endif
-- 
2.37.1

