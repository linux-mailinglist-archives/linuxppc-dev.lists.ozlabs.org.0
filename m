Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 98ABA8CF328
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 11:37:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnD2H1lHhz89Jc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 19:27:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnCyF2r6sz87Rs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2024 19:23:49 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4VnCwt3PJbz9t0b;
	Sun, 26 May 2024 11:22:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFDz7JuFCePh; Sun, 26 May 2024 11:22:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4VnCwn6T8vz9tHF;
	Sun, 26 May 2024 11:22:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D867D8B773;
	Sun, 26 May 2024 11:22:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CA2oBDYLj0zg; Sun, 26 May 2024 11:22:33 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.45])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E2D68B764;
	Sun, 26 May 2024 11:22:33 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH v3 11/16] powerpc/e500: Switch to 64 bits PGD on 85xx (32 bits)
Date: Sun, 26 May 2024 11:22:31 +0200
Message-ID: <35168a76c011ee9bf1a86d67e04d0a04eb6b1df5.1716714720.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1716714720.git.christophe.leroy@csgroup.eu>
References: <cover.1716714720.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716715344; l=2287; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=s4/AO36tt/CSDTJwqMkp0Ne29mDvmColJNi/FwYddUk=; b=p17SdvRCCZ/qVZRALoCx/U4AFn6zApoVFY6TKJR8dw5A3LKR5Ec49NHqY3/Iy0X9tMj3pVyt2 x0GXrO10KYXA0P4ttvrgwBfX8X2sK/2tM+qR1H9MAKBseTavRwt+MKu
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

At the time being when CONFIG_PTE_64BIT is selected, PTE entries are
64 bits but PGD entries are still 32 bits.

In order to allow leaf PMD entries, switch the PGD to 64 bits entries.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/pgtable-types.h |  4 ++++
 arch/powerpc/kernel/head_85xx.S          | 10 ++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable-types.h b/arch/powerpc/include/asm/pgtable-types.h
index 082c85cc09b1..db965d98e0ae 100644
--- a/arch/powerpc/include/asm/pgtable-types.h
+++ b/arch/powerpc/include/asm/pgtable-types.h
@@ -49,7 +49,11 @@ static inline unsigned long pud_val(pud_t x)
 #endif /* CONFIG_PPC64 */
 
 /* PGD level */
+#if defined(CONFIG_PPC_E500) && defined(CONFIG_PTE_64BIT)
+typedef struct { unsigned long long pgd; } pgd_t;
+#else
 typedef struct { unsigned long pgd; } pgd_t;
+#endif
 #define __pgd(x)	((pgd_t) { (x) })
 static inline unsigned long pgd_val(pgd_t x)
 {
diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index 39724ff5ae1f..a305244afc9f 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -307,8 +307,9 @@ set_ivor:
 #ifdef CONFIG_PTE_64BIT
 #ifdef CONFIG_HUGETLB_PAGE
 #define FIND_PTE	\
-	rlwinm	r12, r10, 13, 19, 29;	/* Compute pgdir/pmd offset */	\
-	lwzx	r11, r12, r11;		/* Get pgd/pmd entry */		\
+	rlwinm	r12, r10, 14, 18, 28;	/* Compute pgdir/pmd offset */	\
+	add	r12, r11, r12;						\
+	lwz	r11, 4(r12);		/* Get pgd/pmd entry */		\
 	rlwinm.	r12, r11, 0, 0, 20;	/* Extract pt base address */	\
 	blt	1000f;			/* Normal non-huge page */	\
 	beq	2f;			/* Bail if no table */		\
@@ -321,8 +322,9 @@ set_ivor:
 1001:	lwz	r11, 4(r12);		/* Get pte entry */
 #else
 #define FIND_PTE	\
-	rlwinm	r12, r10, 13, 19, 29;	/* Compute pgdir/pmd offset */	\
-	lwzx	r11, r12, r11;		/* Get pgd/pmd entry */		\
+	rlwinm	r12, r10, 14, 18, 28;	/* Compute pgdir/pmd offset */	\
+	add	r12, r11, r12;						\
+	lwz	r11, 4(r12);		/* Get pgd/pmd entry */		\
 	rlwinm.	r12, r11, 0, 0, 20;	/* Extract pt base address */	\
 	beq	2f;			/* Bail if no table */		\
 	rlwimi	r12, r10, 23, 20, 28;	/* Compute pte address */	\
-- 
2.44.0

