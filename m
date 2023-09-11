Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB979AB03
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 21:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkx9G48hgz3fjG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 05:09:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkx381XMbz3dFN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 05:04:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Rkx2P1Yp2z9vRr;
	Mon, 11 Sep 2023 21:03:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4_YtRLFqnOI; Mon, 11 Sep 2023 21:03:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Rkx280MPCz9vQY;
	Mon, 11 Sep 2023 21:03:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E24648B799;
	Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id P0fbq-12fl3E; Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.38])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 480CC8B7AB;
	Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38BJ3Ib23544225
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 21:03:18 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38BJ3Ird3544224;
	Mon, 11 Sep 2023 21:03:18 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 10/19] powerpc/nohash: Move 8xx version of pte_update() into pte-8xx.h
Date: Mon, 11 Sep 2023 21:03:16 +0200
Message-ID: <c1192dc8c3645ba837b3420c85a9217f14cb20b9.1694443576.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694443576.git.christophe.leroy@csgroup.eu>
References: <cover.1694443576.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694458986; l=4703; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=gGdJxbS7NuYkRUxSOAqhQx3iMd76U1gfrF0BtB2dZMI=; b=TzI/sq7rHBJFyDj52m8+2gxP6Mn+h/M0ByTDCr426CA3pHq1IRdk8nIX4sO5LfcpksxIlkDLm sjkr+g7vC+TBG/OVHEodo9e46gIF+2pxmM9WR923To7vQ+XtJE0HWoe
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

No point in having 8xx special pte_update() in common header,
move it into pte-8xx.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 57 +-------------------
 arch/powerpc/include/asm/nohash/32/pte-8xx.h | 57 ++++++++++++++++++++
 2 files changed, 58 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 26289e4e767c..be8bca42bdce 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -219,63 +219,8 @@ static inline void pmd_clear(pmd_t *pmdp)
  * that an executable user mapping was modified, which is needed
  * to properly flush the virtually tagged instruction cache of
  * those implementations.
- *
- * On the 8xx, the page tables are a bit special. For 16k pages, we have
- * 4 identical entries. For 512k pages, we have 128 entries as if it was
- * 4k pages, but they are flagged as 512k pages for the hardware.
- * For other page sizes, we have a single entry in the table.
  */
-#ifdef CONFIG_PPC_8xx
-static pmd_t *pmd_off(struct mm_struct *mm, unsigned long addr);
-static int hugepd_ok(hugepd_t hpd);
-
-static int number_of_cells_per_pte(pmd_t *pmd, pte_basic_t val, int huge)
-{
-	if (!huge)
-		return PAGE_SIZE / SZ_4K;
-	else if (hugepd_ok(*((hugepd_t *)pmd)))
-		return 1;
-	else if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && !(val & _PAGE_HUGE))
-		return SZ_16K / SZ_4K;
-	else
-		return SZ_512K / SZ_4K;
-}
-
-static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
-				     unsigned long clr, unsigned long set, int huge)
-{
-	pte_basic_t *entry = (pte_basic_t *)p;
-	pte_basic_t old = pte_val(*p);
-	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
-	int num, i;
-	pmd_t *pmd = pmd_off(mm, addr);
-
-	num = number_of_cells_per_pte(pmd, new, huge);
-
-	for (i = 0; i < num; i += PAGE_SIZE / SZ_4K, new += PAGE_SIZE) {
-		*entry++ = new;
-		if (IS_ENABLED(CONFIG_PPC_16K_PAGES) && num != 1) {
-			*entry++ = new;
-			*entry++ = new;
-			*entry++ = new;
-		}
-	}
-
-	return old;
-}
-
-#ifdef CONFIG_PPC_16K_PAGES
-#define ptep_get ptep_get
-static inline pte_t ptep_get(pte_t *ptep)
-{
-	pte_basic_t val = READ_ONCE(ptep->pte);
-	pte_t pte = {val, val, val, val};
-
-	return pte;
-}
-#endif /* CONFIG_PPC_16K_PAGES */
-
-#else
+#ifndef pte_update
 static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
 				     unsigned long clr, unsigned long set, int huge)
 {
diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index e6fe1d5731f2..52395a5ecd70 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -187,6 +187,63 @@ static inline unsigned long pte_leaf_size(pte_t pte)
 
 #define pte_leaf_size pte_leaf_size
 
+/*
+ * On the 8xx, the page tables are a bit special. For 16k pages, we have
+ * 4 identical entries. For 512k pages, we have 128 entries as if it was
+ * 4k pages, but they are flagged as 512k pages for the hardware.
+ * For other page sizes, we have a single entry in the table.
+ */
+static pmd_t *pmd_off(struct mm_struct *mm, unsigned long addr);
+static int hugepd_ok(hugepd_t hpd);
+
+static inline int number_of_cells_per_pte(pmd_t *pmd, pte_basic_t val, int huge)
+{
+	if (!huge)
+		return PAGE_SIZE / SZ_4K;
+	else if (hugepd_ok(*((hugepd_t *)pmd)))
+		return 1;
+	else if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && !(val & _PAGE_HUGE))
+		return SZ_16K / SZ_4K;
+	else
+		return SZ_512K / SZ_4K;
+}
+
+static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
+				     unsigned long clr, unsigned long set, int huge)
+{
+	pte_basic_t *entry = (pte_basic_t *)p;
+	pte_basic_t old = pte_val(*p);
+	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
+	int num, i;
+	pmd_t *pmd = pmd_off(mm, addr);
+
+	num = number_of_cells_per_pte(pmd, new, huge);
+
+	for (i = 0; i < num; i += PAGE_SIZE / SZ_4K, new += PAGE_SIZE) {
+		*entry++ = new;
+		if (IS_ENABLED(CONFIG_PPC_16K_PAGES) && num != 1) {
+			*entry++ = new;
+			*entry++ = new;
+			*entry++ = new;
+		}
+	}
+
+	return old;
+}
+
+#define pte_update pte_update
+
+#ifdef CONFIG_PPC_16K_PAGES
+#define ptep_get ptep_get
+static inline pte_t ptep_get(pte_t *ptep)
+{
+	pte_basic_t val = READ_ONCE(ptep->pte);
+	pte_t pte = {val, val, val, val};
+
+	return pte;
+}
+#endif /* CONFIG_PPC_16K_PAGES */
+
 #endif
 
 #endif /* __KERNEL__ */
-- 
2.41.0

