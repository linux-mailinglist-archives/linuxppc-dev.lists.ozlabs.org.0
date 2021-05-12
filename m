Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 257DC37B54B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 07:02:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fg2hj0pLjz3c24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 15:02:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fg2gf3rY6z302W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 15:01:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fg2gK2rF4z9sf2;
 Wed, 12 May 2021 07:01:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXoQp0A-XejD; Wed, 12 May 2021 07:01:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fg2gJ3MPKz9sdw;
 Wed, 12 May 2021 07:01:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B9508B7D6;
 Wed, 12 May 2021 07:01:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id aGrEm4CDExDn; Wed, 12 May 2021 07:01:00 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E88BA8B769;
 Wed, 12 May 2021 07:00:59 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C4EAA64164; Wed, 12 May 2021 05:00:59 +0000 (UTC)
Message-Id: <5ac5976419350e8e048d463a64cae449eb3ba4b0.1620795204.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1620795204.git.christophe.leroy@csgroup.eu>
References: <cover.1620795204.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/5] mm/pgtable: Add stubs for {pmd/pub}_{set/clear}_huge
To: Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>
Date: Wed, 12 May 2021 05:00:59 +0000 (UTC)
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

For architectures with no PMD and/or no PUD, add stubs
similar to what we have for architectures without P4D.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/pgtable.h | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 46b13780c2c8..d41474a2d255 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1371,10 +1371,34 @@ static inline int p4d_clear_huge(p4d_t *p4d)
 }
 #endif /* !__PAGETABLE_P4D_FOLDED */
 
+#ifndef __PAGETABLE_PUD_FOLDED
 int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot);
-int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot);
 int pud_clear_huge(pud_t *pud);
+#else
+static inline int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
+{
+	return 0;
+}
+static inline int pud_clear_huge(pud_t *pud)
+{
+	return 0;
+}
+#endif /* !__PAGETABLE_PUD_FOLDED */
+
+#ifndef __PAGETABLE_PMD_FOLDED
+int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot);
 int pmd_clear_huge(pmd_t *pmd);
+#else
+static inline int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
+{
+	return 0;
+}
+static inline int pmd_clear_huge(pmd_t *pmd)
+{
+	return 0;
+}
+#endif /* !__PAGETABLE_PMD_FOLDED */
+
 int p4d_free_pud_page(p4d_t *p4d, unsigned long addr);
 int pud_free_pmd_page(pud_t *pud, unsigned long addr);
 int pmd_free_pte_page(pmd_t *pmd, unsigned long addr);
-- 
2.25.0

