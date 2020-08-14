Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A322444CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 08:04:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSXw117wKzDqgr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 16:04:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSXkR6jxwzDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 15:56:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSXkM4750z9vD37;
 Fri, 14 Aug 2020 07:56:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lBzcTAIqbjXx; Fri, 14 Aug 2020 07:56:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSXkM338qz9vD2y;
 Fri, 14 Aug 2020 07:56:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E3638B775;
 Fri, 14 Aug 2020 07:56:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LuR78-u6rgOW; Fri, 14 Aug 2020 07:56:28 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B6288B767;
 Fri, 14 Aug 2020 07:56:28 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C155965C93; Fri, 14 Aug 2020 05:56:27 +0000 (UTC)
Message-Id: <f989eff8296800c427622c0985384148404e4f0b.1597384512.git.christophe.leroy@csgroup.eu>
In-Reply-To: <50098f49877cea0f46730a9df82dcabf84160e4b.1597384512.git.christophe.leroy@csgroup.eu>
References: <50098f49877cea0f46730a9df82dcabf84160e4b.1597384512.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 4/4] powerpc: Rewrite FSL_BOOKE flush_cache_instruction()
 in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 hch@infradead.org
Date: Fri, 14 Aug 2020 05:56:27 +0000 (UTC)
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

Nothing prevents flush_cache_instruction() from being writen in C.

Do it to improve readability and maintainability.

This function is only use by low level callers, it is not
intended to be used by module. Don't export it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/misc_32.S      | 22 ----------------------
 arch/powerpc/mm/nohash/fsl_booke.c | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index 1bda207459a8..87717966f5cd 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -268,28 +268,6 @@ _ASM_NOKPROBE_SYMBOL(real_writeb)
 
 #endif /* CONFIG_40x */
 
-
-/*
- * Flush instruction cache.
- */
-#ifdef CONFIG_FSL_BOOKE
-_GLOBAL(flush_instruction_cache)
-#ifdef CONFIG_E200
-	mfspr   r3,SPRN_L1CSR0
-	ori     r3,r3,L1CSR0_CFI|L1CSR0_CLFC
-	/* msync; isync recommended here */
-	mtspr   SPRN_L1CSR0,r3
-	isync
-	blr
-#endif
-	mfspr	r3,SPRN_L1CSR1
-	ori	r3,r3,L1CSR1_ICFI|L1CSR1_ICLFR
-	mtspr	SPRN_L1CSR1,r3
-	isync
-	blr
-EXPORT_SYMBOL(flush_instruction_cache)
-#endif
-
 /*
  * Copy a whole page.  We use the dcbz instruction on the destination
  * to reduce memory traffic (it eliminates the unnecessary reads of
diff --git a/arch/powerpc/mm/nohash/fsl_booke.c b/arch/powerpc/mm/nohash/fsl_booke.c
index 0c294827d6e5..36bda962d3b3 100644
--- a/arch/powerpc/mm/nohash/fsl_booke.c
+++ b/arch/powerpc/mm/nohash/fsl_booke.c
@@ -219,6 +219,22 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 	return tlbcam_addrs[tlbcam_index - 1].limit - PAGE_OFFSET + 1;
 }
 
+void flush_instruction_cache(void)
+{
+	unsigned long tmp;
+
+	if (IS_ENABLED(CONFIG_E200)) {
+		tmp = mfspr(SPRN_L1CSR0);
+		tmp |= L1CSR0_CFI | L1CSR0_CLFC;
+		mtspr(SPRN_L1CSR0, tmp);
+	} else {
+		tmp = mfspr(SPRN_L1CSR1);
+		tmp |= L1CSR1_ICFI | L1CSR1_ICLFR;
+		mtspr(SPRN_L1CSR1, tmp);
+	}
+	isync();
+}
+
 /*
  * MMU_init_hw does the chip-specific initialization of the MMU hardware.
  */
-- 
2.25.0

