Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1B37ADF00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:35:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvWlV0v1Wz3ddx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:35:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWgR514Qz3cJR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:32:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWg46c1yz9v7N;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MynVIgsLbxGu; Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg10rYWz9v8B;
	Mon, 25 Sep 2023 20:31:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 17B3D8B78D;
	Mon, 25 Sep 2023 20:31:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id d_s0pC4Zg62D; Mon, 25 Sep 2023 20:31:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 67BC18B794;
	Mon, 25 Sep 2023 20:31:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVY9h1499187
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:34 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVYnC1499186;
	Mon, 25 Sep 2023 20:31:34 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 14/37] powerpc/nohash: Deduplicate _PAGE_CHG_MASK
Date: Mon, 25 Sep 2023 20:31:28 +0200
Message-ID: <c1a1893dbba4afb825bfa78b262f0b0e0fc3b490.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666674; l=2710; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=CEvu7MiVClOPYgfZwMUkviTENwq0dKPuXrMNnmw/pxA=; b=Yv6rctDHHeFUuz9TG3N5YlMk//g1pe07LxDHbQBzhXEMiA6Od9HnSWGIfDSGM49XNjlAZyi1J cWlfgbxiwUtDO6HI2HHCCawEQKGd5h0LXTvaDiTPid5N/bA6NEgWdTn
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

_PAGE_CHG_MASK is identical between nohash/32 and nohash/64,
deduplicate it.

While at it, clean the #ifdef for PTE_RPN_MASK in nohash/32 as
it is already CONFIG_PPC32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 8 +-------
 arch/powerpc/include/asm/nohash/64/pgtable.h | 6 ------
 arch/powerpc/include/asm/nohash/pgtable.h    | 6 ++++++
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index ae7f3c8afd4f..a39ecd498084 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -143,7 +143,7 @@
  * The mask covered by the RPN must be a ULL on 32-bit platforms with
  * 64-bit PTEs.
  */
-#if defined(CONFIG_PPC32) && defined(CONFIG_PTE_64BIT)
+#ifdef CONFIG_PTE_64BIT
 #define PTE_RPN_MASK	(~((1ULL << PTE_RPN_SHIFT) - 1))
 #define MAX_POSSIBLE_PHYSMEM_BITS 36
 #else
@@ -151,12 +151,6 @@
 #define MAX_POSSIBLE_PHYSMEM_BITS 32
 #endif
 
-/*
- * _PAGE_CHG_MASK masks of bits that are to be preserved across
- * pgprot changes.
- */
-#define _PAGE_CHG_MASK	(PTE_RPN_MASK | _PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_SPECIAL)
-
 #ifndef __ASSEMBLY__
 
 #define pte_clear(mm, addr, ptep) \
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index cba08a62c52c..34a518a1c04d 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -75,12 +75,6 @@
 
 #define PTE_RPN_MASK	(~((1UL << PTE_RPN_SHIFT) - 1))
 
-/*
- * _PAGE_CHG_MASK masks of bits that are to be preserved across
- * pgprot changes.
- */
-#define _PAGE_CHG_MASK	(PTE_RPN_MASK | _PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_SPECIAL)
-
 #define H_PAGE_4K_PFN 0
 
 #ifndef __ASSEMBLY__
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 8adaacbbdd1d..c64a040f4a6a 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -13,6 +13,12 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 #include <asm/nohash/32/pgtable.h>
 #endif
 
+/*
+ * _PAGE_CHG_MASK masks of bits that are to be preserved across
+ * pgprot changes.
+ */
+#define _PAGE_CHG_MASK	(PTE_RPN_MASK | _PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_SPECIAL)
+
 /* Permission masks used for kernel mappings */
 #define PAGE_KERNEL	__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW)
 #define PAGE_KERNEL_NC	__pgprot(_PAGE_BASE_NC | _PAGE_KERNEL_RW | _PAGE_NO_CACHE)
-- 
2.41.0

