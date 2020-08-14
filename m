Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F9A2444BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 08:01:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSXqk3YvPzDqkC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 16:01:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSXkR0yxwzDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 15:56:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSXkJ3g73z9vD32;
 Fri, 14 Aug 2020 07:56:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id szKN8eGNPEEV; Fri, 14 Aug 2020 07:56:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSXkJ2kZ3z9vD2y;
 Fri, 14 Aug 2020 07:56:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 50F8E8B775;
 Fri, 14 Aug 2020 07:56:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id njb_um4ELroi; Fri, 14 Aug 2020 07:56:25 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 159598B767;
 Fri, 14 Aug 2020 07:56:25 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AD45465C93; Fri, 14 Aug 2020 05:56:24 +0000 (UTC)
Message-Id: <50098f49877cea0f46730a9df82dcabf84160e4b.1597384512.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/4] powerpc: Remove flush_instruction_cache for book3s/32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 hch@infradead.org
Date: Fri, 14 Aug 2020 05:56:24 +0000 (UTC)
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

The only callers of flush_instruction_cache() are:

arch/powerpc/kernel/swsusp_booke.S:	bl flush_instruction_cache
arch/powerpc/mm/nohash/40x.c:	flush_instruction_cache();
arch/powerpc/mm/nohash/44x.c:	flush_instruction_cache();
arch/powerpc/mm/nohash/fsl_booke.c:	flush_instruction_cache();
arch/powerpc/platforms/44x/machine_check.c:			flush_instruction_cache();
arch/powerpc/platforms/44x/machine_check.c:		flush_instruction_cache();

This function is not used by book3s/32, drop it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/misc_32.S | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index b24f866fef81..5c074c2ff5b5 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -271,9 +271,8 @@ _ASM_NOKPROBE_SYMBOL(real_writeb)
 
 /*
  * Flush instruction cache.
- * This is a no-op on the 601.
  */
-#ifndef CONFIG_PPC_8xx
+#if !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC_BOOK3S_32)
 _GLOBAL(flush_instruction_cache)
 #if defined(CONFIG_4xx)
 	lis	r3, KERNELBASE@h
@@ -290,18 +289,11 @@ _GLOBAL(flush_instruction_cache)
 	mfspr	r3,SPRN_L1CSR1
 	ori	r3,r3,L1CSR1_ICFI|L1CSR1_ICLFR
 	mtspr	SPRN_L1CSR1,r3
-#elif defined(CONFIG_PPC_BOOK3S_601)
-	blr			/* for 601, do nothing */
-#else
-	/* 603/604 processor - use invalidate-all bit in HID0 */
-	mfspr	r3,SPRN_HID0
-	ori	r3,r3,HID0_ICFI
-	mtspr	SPRN_HID0,r3
 #endif /* CONFIG_4xx */
 	isync
 	blr
 EXPORT_SYMBOL(flush_instruction_cache)
-#endif /* CONFIG_PPC_8xx */
+#endif
 
 /*
  * Copy a whole page.  We use the dcbz instruction on the destination
-- 
2.25.0

