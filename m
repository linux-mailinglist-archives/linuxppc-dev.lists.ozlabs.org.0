Return-Path: <linuxppc-dev+bounces-335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A895AFC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:58:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqFvW01NFz2yks;
	Thu, 22 Aug 2024 17:58:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqFvV4kSdz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:58:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqFvR3X7Yz9sSK;
	Thu, 22 Aug 2024 09:58:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NlYp6PfhUgnd; Thu, 22 Aug 2024 09:58:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqFvR2NW0z9sSH;
	Thu, 22 Aug 2024 09:58:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 40C628B77D;
	Thu, 22 Aug 2024 09:58:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 2HbrGellHzJ0; Thu, 22 Aug 2024 09:58:43 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO16920.IDSI0.si.c-s.fr [192.168.232.181])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E12898B763;
	Thu, 22 Aug 2024 09:58:42 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/mm: Fix return type of pgd_val()
Date: Thu, 22 Aug 2024 09:58:42 +0200
Message-ID: <45f8fdf298ec3df7573b66d21b03a5cda92e2cb1.1724313510.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724313522; l=2891; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=JVqiB4HY2Y491GrobmVbch4xQAY4hzCA5VcgYB4HTrA=; b=hD17Uy0LwJi8VLADyyur24FjIkg6yV8fFc4Cr9B7HXs8MxCTDoNx4jIieQX1i6j4K91CL2OmE A4Y9nqhccpLACv1qIC2wC1OoMusPAJf2yBtH/bGQalYqrwYl513/ZQp
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Commit 6b0e82791bd0 ("powerpc/e500: switch to 64 bits PGD on 85xx
(32 bits)") switched PGD entries to 64 bits, but pgd_val() returns
an unsigned long which is 32 bits on PPC32. This is not a problem
for regular PMD entries because the upper part is always NULL, but
when PMD entries are leaf they contain 64 bits values, so pgd_val()
must return an unsigned long long instead of an unsigned long.

Also change the condition to CONFIG_PPC_85xx instead of CONFIG_PPC_E500
as the change was meant for 32 bits only. Allthough this should be
harmless on PPC64, it generates a warning with pgd_ERROR print.

Fixes: 6b0e82791bd0 ("powerpc/e500: switch to 64 bits PGD on 85xx (32 bits)")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Limit it to CONFIG_PPC_85xx and use a cast instead of duplicating pgd_ERROR
---
 arch/powerpc/include/asm/nohash/32/pgtable.h |  4 ++--
 arch/powerpc/include/asm/pgtable-types.h     | 12 +++++++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 9508399dd036..b481738c4bb5 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -52,7 +52,7 @@
 #define USER_PTRS_PER_PGD	(TASK_SIZE / PGDIR_SIZE)
 
 #define pgd_ERROR(e) \
-	pr_err("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
+	pr_err("%s:%d: bad pgd %08llx.\n", __FILE__, __LINE__, (unsigned long long)pgd_val(e))
 
 /*
  * This is the bottom of the PKMAP area with HIGHMEM or an arbitrary
@@ -170,7 +170,7 @@ static inline void pmd_clear(pmd_t *pmdp)
 #define pmd_pfn(pmd)		(pmd_val(pmd) >> PAGE_SHIFT)
 #else
 #define pmd_page_vaddr(pmd)	\
-	((const void *)(pmd_val(pmd) & ~(PTE_TABLE_SIZE - 1)))
+	((const void *)((unsigned long)pmd_val(pmd) & ~(PTE_TABLE_SIZE - 1)))
 #define pmd_pfn(pmd)		(__pa(pmd_val(pmd)) >> PAGE_SHIFT)
 #endif
 
diff --git a/arch/powerpc/include/asm/pgtable-types.h b/arch/powerpc/include/asm/pgtable-types.h
index 7b3d4c592a10..f3086e39e7d2 100644
--- a/arch/powerpc/include/asm/pgtable-types.h
+++ b/arch/powerpc/include/asm/pgtable-types.h
@@ -49,16 +49,22 @@ static inline unsigned long pud_val(pud_t x)
 #endif /* CONFIG_PPC64 */
 
 /* PGD level */
-#if defined(CONFIG_PPC_E500) && defined(CONFIG_PTE_64BIT)
+#if defined(CONFIG_PPC_85xx) && defined(CONFIG_PTE_64BIT)
 typedef struct { unsigned long long pgd; } pgd_t;
+
+static inline unsigned long long pgd_val(pgd_t x)
+{
+	return x.pgd;
+}
 #else
 typedef struct { unsigned long pgd; } pgd_t;
-#endif
-#define __pgd(x)	((pgd_t) { (x) })
+
 static inline unsigned long pgd_val(pgd_t x)
 {
 	return x.pgd;
 }
+#endif
+#define __pgd(x)	((pgd_t) { (x) })
 
 /* Page protection bits */
 typedef struct { unsigned long pgprot; } pgprot_t;
-- 
2.44.0


