Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCA337FD42
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 20:28:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fh0X250XLz306s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 04:28:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fh0Wd2Y4vz2ym5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 04:27:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fh0WV5zxjz9sbr;
 Thu, 13 May 2021 20:27:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LL05n4DFH1gO; Thu, 13 May 2021 20:27:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fh0WV4zx3z9sbW;
 Thu, 13 May 2021 20:27:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 734808B7F5;
 Thu, 13 May 2021 20:27:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 64lJF8fVAvhj; Thu, 13 May 2021 20:27:34 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 306B48B76C;
 Thu, 13 May 2021 20:27:34 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EB777641B5; Thu, 13 May 2021 18:27:33 +0000 (UTC)
Message-Id: <7fbf1b6bc3e15c07c24fa45278d57064f14c896b.1620930415.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] x86: Define only {pud/pmd}_{set/clear}_huge when usefull
To: Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>,
 rdunlap@infradead.org
Date: Thu, 13 May 2021 18:27:33 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When PUD and/or PMD are folded, those functions are useless
and we have a stub in linux/pgtable.h

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/x86/mm/pgtable.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index d27cf69e811d..1303ff6ef7be 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -682,6 +682,7 @@ int p4d_clear_huge(p4d_t *p4d)
 }
 #endif
 
+#if CONFIG_PGTABLE_LEVELS > 3
 /**
  * pud_set_huge - setup kernel PUD mapping
  *
@@ -720,6 +721,23 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 	return 1;
 }
 
+/**
+ * pud_clear_huge - clear kernel PUD mapping when it is set
+ *
+ * Returns 1 on success and 0 on failure (no PUD map is found).
+ */
+int pud_clear_huge(pud_t *pud)
+{
+	if (pud_large(*pud)) {
+		pud_clear(pud);
+		return 1;
+	}
+
+	return 0;
+}
+#endif
+
+#if CONFIG_PGTABLE_LEVELS > 2
 /**
  * pmd_set_huge - setup kernel PMD mapping
  *
@@ -750,21 +768,6 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 	return 1;
 }
 
-/**
- * pud_clear_huge - clear kernel PUD mapping when it is set
- *
- * Returns 1 on success and 0 on failure (no PUD map is found).
- */
-int pud_clear_huge(pud_t *pud)
-{
-	if (pud_large(*pud)) {
-		pud_clear(pud);
-		return 1;
-	}
-
-	return 0;
-}
-
 /**
  * pmd_clear_huge - clear kernel PMD mapping when it is set
  *
@@ -779,6 +782,7 @@ int pmd_clear_huge(pmd_t *pmd)
 
 	return 0;
 }
+#endif
 
 #ifdef CONFIG_X86_64
 /**
-- 
2.25.0

