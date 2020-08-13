Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 197A0243860
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 12:20:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BS2cw4fcszDqbl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 20:20:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BS2Rp6M6xzDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 20:12:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BS2Rk48prz9vD3n;
 Thu, 13 Aug 2020 12:12:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ylr619tKhbQO; Thu, 13 Aug 2020 12:12:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BS2Rk3QNFz9vD3q;
 Thu, 13 Aug 2020 12:12:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B02FB8B788;
 Thu, 13 Aug 2020 12:12:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dcKYEE7OyoXn; Thu, 13 Aug 2020 12:12:03 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 671E88B783;
 Thu, 13 Aug 2020 12:12:03 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3A13A65C54; Thu, 13 Aug 2020 10:12:03 +0000 (UTC)
Message-Id: <daa24ca138ee05c2c577e12f1ff48326f47c3de7.1597313510.git.christophe.leroy@csgroup.eu>
In-Reply-To: <11a330af231af22874c006302a945388846f8112.1597313510.git.christophe.leroy@csgroup.eu>
References: <11a330af231af22874c006302a945388846f8112.1597313510.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 4/5] powerpc: Rewrite FSL_BOOKE flush_cache_instruction() in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 13 Aug 2020 10:12:03 +0000 (UTC)
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

Nothing prevent flush_cache_instruction() from behing writen in C.

Do it to improve readability and maintainability.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/misc_32.S      | 17 -----------------
 arch/powerpc/mm/nohash/fsl_booke.c | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index a8f6ef513115..4f4a31d9fdd0 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -281,23 +281,6 @@ _GLOBAL(flush_instruction_cache)
 EXPORT_SYMBOL(flush_instruction_cache)
 #endif
 
-#ifdef CONFIG_FSL_BOOKE
-_GLOBAL(flush_instruction_cache)
-#ifdef CONFIG_E200
-	mfspr   r3,SPRN_L1CSR0
-	ori     r3,r3,L1CSR0_CFI|L1CSR0_CLFC
-	/* msync; isync recommended here */
-	mtspr   SPRN_L1CSR0,r3
-#else
-	mfspr	r3,SPRN_L1CSR1
-	ori	r3,r3,L1CSR1_ICFI|L1CSR1_ICLFR
-	mtspr	SPRN_L1CSR1,r3
-#endif
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

