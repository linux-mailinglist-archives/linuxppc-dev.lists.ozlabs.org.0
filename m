Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C175B24384A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 12:15:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BS2X13hblzDqcw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 20:15:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BS2Rm6mvFzDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 20:12:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BS2Rh1xm4z9vD3p;
 Thu, 13 Aug 2020 12:12:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gfMvwydx9Ufd; Thu, 13 Aug 2020 12:12:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BS2Rh0zcSz9vD3l;
 Thu, 13 Aug 2020 12:12:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 751CB8B78A;
 Thu, 13 Aug 2020 12:12:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5B7LzUwD8WNI; Thu, 13 Aug 2020 12:12:01 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 590D18B783;
 Thu, 13 Aug 2020 12:12:01 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2BA6465C54; Thu, 13 Aug 2020 10:12:01 +0000 (UTC)
Message-Id: <60a152dcbea2a2c48b771aca6698efdc14116c0f.1597313510.git.christophe.leroy@csgroup.eu>
In-Reply-To: <11a330af231af22874c006302a945388846f8112.1597313510.git.christophe.leroy@csgroup.eu>
References: <11a330af231af22874c006302a945388846f8112.1597313510.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/5] powerpc: Untangle flush_instruction_cache()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 13 Aug 2020 10:12:01 +0000 (UTC)
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

flush_instruction_cache() is a mixup of each PPC32 sub-arch.

Untangle it by making one complete function for each sub-arch.

This makes it a lot more readable and maintainable.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/misc_32.S | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index bd870743c06f..a8f6ef513115 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -272,28 +272,31 @@ _ASM_NOKPROBE_SYMBOL(real_writeb)
 /*
  * Flush instruction cache.
  */
-#if !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC_BOOK3S_32)
+#ifdef CONFIG_4xx
 _GLOBAL(flush_instruction_cache)
-#if defined(CONFIG_4xx)
 	lis	r3, KERNELBASE@h
 	iccci	0,r3
-#elif defined(CONFIG_FSL_BOOKE)
+	isync
+	blr
+EXPORT_SYMBOL(flush_instruction_cache)
+#endif
+
+#ifdef CONFIG_FSL_BOOKE
+_GLOBAL(flush_instruction_cache)
 #ifdef CONFIG_E200
 	mfspr   r3,SPRN_L1CSR0
 	ori     r3,r3,L1CSR0_CFI|L1CSR0_CLFC
 	/* msync; isync recommended here */
 	mtspr   SPRN_L1CSR0,r3
-	isync
-	blr
-#endif
+#else
 	mfspr	r3,SPRN_L1CSR1
 	ori	r3,r3,L1CSR1_ICFI|L1CSR1_ICLFR
 	mtspr	SPRN_L1CSR1,r3
-#endif /* CONFIG_4xx */
+#endif
 	isync
 	blr
 EXPORT_SYMBOL(flush_instruction_cache)
-#endif /* CONFIG_PPC_8xx || CONFIG_PPC_BOOK3S_32 */
+#endif
 
 /*
  * Copy a whole page.  We use the dcbz instruction on the destination
-- 
2.25.0

