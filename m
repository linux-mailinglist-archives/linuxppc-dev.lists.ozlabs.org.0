Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7485B2516
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 19:44:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNmjH25LBz3fv5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 03:44:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNmb73TFlz3dxR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 03:39:31 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MNmYy52pZz9smB;
	Thu,  8 Sep 2022 19:38:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AlIMKHDCdfjC; Thu,  8 Sep 2022 19:38:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MNmYj4NSqz9sm0;
	Thu,  8 Sep 2022 19:38:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 72BEF8B796;
	Thu,  8 Sep 2022 19:38:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CCZyiX9iFcaX; Thu,  8 Sep 2022 19:38:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.247])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 329BD8B792;
	Thu,  8 Sep 2022 19:38:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 288HcEmW3449217
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 8 Sep 2022 19:38:14 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 288HcEOo3449216;
	Thu, 8 Sep 2022 19:38:14 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 19/19] powerpc: Remove impossible mmu_psize_defs[] on nohash
Date: Thu,  8 Sep 2022 19:37:52 +0200
Message-Id: <304d1442c5caa276c87c2caa615fcb6eed96c30c.1662658653.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
References: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662658668; l=2151; s=20211009; h=from:subject:message-id; bh=j8azHjofkuYixsiTQvFKUdmtPY4LHQTkbNda+ZC/IJw=; b=4H5dawuJqsIQbWEqe4om4Y8VB2J6AFQ1R7f87DwBIt5kiih26rq/05O+mVnGWUFKuCzE2scHjO2i wboqC9dODSepZxF6qtBHjzZFq2AJd+g4Y9+NqNRFwqgiiFcaw+Cj
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

Today there is:

  if e500 or 8xx
    if e500
      mmu_psize_defs[] =
    else if 8xx
      mmu_psize_defs[] =
    else
      mmu_psize_defs[] =
    endif
  endif

The else leg is dead definition.

Drop that else leg and rewrite as:

  if e500
    mmu_psize_defs[] =
  endif
  if 8xx
    mmu_psize_defs[] =
  endif

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/tlb.c | 41 ++++--------------------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index fac59fbd475a..bf9093575d9d 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -49,7 +49,6 @@
  * other sizes not listed here.   The .ind field is only used on MMUs that have
  * indirect page table entries.
  */
-#if defined(CONFIG_PPC_E500) || defined(CONFIG_PPC_8xx)
 #ifdef CONFIG_PPC_E500
 struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 	[MMU_PAGE_4K] = {
@@ -81,7 +80,9 @@ struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 		.enc	= BOOK3E_PAGESZ_1GB,
 	},
 };
-#elif defined(CONFIG_PPC_8xx)
+#endif
+
+#ifdef CONFIG_PPC_8xx
 struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 	[MMU_PAGE_4K] = {
 		.shift	= 12,
@@ -96,41 +97,7 @@ struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 		.shift	= 23,
 	},
 };
-#else
-struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
-	[MMU_PAGE_4K] = {
-		.shift	= 12,
-		.ind	= 20,
-		.enc	= BOOK3E_PAGESZ_4K,
-	},
-	[MMU_PAGE_16K] = {
-		.shift	= 14,
-		.enc	= BOOK3E_PAGESZ_16K,
-	},
-	[MMU_PAGE_64K] = {
-		.shift	= 16,
-		.ind	= 28,
-		.enc	= BOOK3E_PAGESZ_64K,
-	},
-	[MMU_PAGE_1M] = {
-		.shift	= 20,
-		.enc	= BOOK3E_PAGESZ_1M,
-	},
-	[MMU_PAGE_16M] = {
-		.shift	= 24,
-		.ind	= 36,
-		.enc	= BOOK3E_PAGESZ_16M,
-	},
-	[MMU_PAGE_256M] = {
-		.shift	= 28,
-		.enc	= BOOK3E_PAGESZ_256M,
-	},
-	[MMU_PAGE_1G] = {
-		.shift	= 30,
-		.enc	= BOOK3E_PAGESZ_1GB,
-	},
-};
-#endif /* CONFIG_PPC_85xx */
+#endif
 
 static inline int mmu_get_tsize(int psize)
 {
-- 
2.37.1

