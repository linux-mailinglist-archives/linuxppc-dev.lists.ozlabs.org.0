Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D842295898
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 08:54:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGyky485DzDqvd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 17:54:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGyBv1ltwzDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 17:29:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CGyBq1xGPz9vBLx;
 Thu, 22 Oct 2020 08:29:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XXCtb1c81R8K; Thu, 22 Oct 2020 08:29:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CGyBq1Bb4z9vBKl;
 Thu, 22 Oct 2020 08:29:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 24E9F8B806;
 Thu, 22 Oct 2020 08:29:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ve5BpVntV12p; Thu, 22 Oct 2020 08:29:40 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D63778B805;
 Thu, 22 Oct 2020 08:29:39 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B20ED667EF; Thu, 22 Oct 2020 06:29:39 +0000 (UTC)
Message-Id: <ebc933d1c530a19ef3cf7983f6ae94814f6e92ac.1603348103.git.christophe.leroy@csgroup.eu>
In-Reply-To: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
References: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 14/20] powerpc/32s: Inline tlb_flush()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Oct 2020 06:29:39 +0000 (UTC)
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

On book3s/32, tlb_flush() does nothing when the CPU has a hash table,
it calls _tlbia() otherwise.

Inline it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h | 11 +++++++++++
 arch/powerpc/mm/book3s32/tlb.c                | 15 ---------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index 42708c1719d6..d941c06d4f2e 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -20,6 +20,17 @@ static inline void _tlbie(unsigned long address)
 #endif
 void _tlbia(void);
 
+/*
+ * Called at the end of a mmu_gather operation to make sure the
+ * TLB flush is completely done.
+ */
+static inline void tlb_flush(struct mmu_gather *tlb)
+{
+	/* 603 needs to flush the whole TLB here since it doesn't use a hash table. */
+	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
+		_tlbia();
+}
+
 static inline void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end)
 {
 	start &= PAGE_MASK;
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index f0edbad5966c..e7865a3f0231 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -43,21 +43,6 @@ void flush_hash_entry(struct mm_struct *mm, pte_t *ptep, unsigned long addr)
 }
 EXPORT_SYMBOL(flush_hash_entry);
 
-/*
- * Called at the end of a mmu_gather operation to make sure the
- * TLB flush is completely done.
- */
-void tlb_flush(struct mmu_gather *tlb)
-{
-	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
-		/*
-		 * 603 needs to flush the whole TLB here since
-		 * it doesn't use a hash table.
-		 */
-		_tlbia();
-	}
-}
-
 /*
  * TLB flushing:
  *
-- 
2.25.0

