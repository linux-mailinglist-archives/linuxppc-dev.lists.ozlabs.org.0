Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D564728AFF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 10:18:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8s5D6KdXzDqQR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 19:18:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8rrh5tcqzDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 19:07:48 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C8rrX1C9zz9typT;
 Mon, 12 Oct 2020 10:07:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ot1FmGUkMhuK; Mon, 12 Oct 2020 10:07:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C8rrW6DKKz9typR;
 Mon, 12 Oct 2020 10:07:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F1C6E8B788;
 Mon, 12 Oct 2020 10:07:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G2uxDPjYNPCb; Mon, 12 Oct 2020 10:07:44 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C4B068B783;
 Mon, 12 Oct 2020 10:07:44 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9197266441; Mon, 12 Oct 2020 08:07:44 +0000 (UTC)
Message-Id: <181da5d3c4f07dca6662cdc7c72d81297eef5f1e.1602490050.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/2] powerpc/44x: Don't support 440 when CONFIG_PPC_47x is set
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 12 Oct 2020 08:07:44 +0000 (UTC)
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

As stated in platform/44x/Kconfig, CONFIG_PPC_47x is not
compatible with 440 and 460 variants.

This is confirmed in asm/cache.h as L1_CACHE_SHIFT is different
for 47x, meaning a kernel built for 47x will not run correctly
on a 440.

In cputable, opt out all 440 and 460 variants when CONFIG_PPC_47x
is set. Also add a default match dedicated to 470.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/cputable.h |  9 +++++----
 arch/powerpc/include/asm/mmu.h      |  7 +++----
 arch/powerpc/kernel/cputable.c      | 29 +++++++++++++++++++++--------
 3 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index d88bcb79f16d..4a0ddf66bd4a 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -523,11 +523,10 @@ enum {
 #ifdef CONFIG_40x
 	    CPU_FTRS_40X |
 #endif
-#ifdef CONFIG_44x
-	    CPU_FTRS_44X | CPU_FTRS_440x6 |
-#endif
 #ifdef CONFIG_PPC_47x
 	    CPU_FTRS_47X | CPU_FTR_476_DD2 |
+#elif defined(CONFIG_44x)
+	    CPU_FTRS_44X | CPU_FTRS_440x6 |
 #endif
 #ifdef CONFIG_E200
 	    CPU_FTRS_E200 |
@@ -596,7 +595,9 @@ enum {
 #ifdef CONFIG_40x
 	    CPU_FTRS_40X &
 #endif
-#ifdef CONFIG_44x
+#ifdef CONFIG_PPC_47x
+	    CPU_FTRS_47X &
+#elif defined(CONFIG_44x)
 	    CPU_FTRS_44X & CPU_FTRS_440x6 &
 #endif
 #ifdef CONFIG_E200
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 097f23c28c68..49d2c09b7175 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -162,15 +162,14 @@ enum {
 #ifdef CONFIG_40x
 		MMU_FTR_TYPE_40x |
 #endif
-#ifdef CONFIG_44x
+#ifdef CONFIG_PPC_47x
+		MMU_FTR_TYPE_47x | MMU_FTR_USE_TLBIVAX_BCAST | MMU_FTR_LOCK_BCAST_INVAL |
+#elif defined(CONFIG_44x)
 		MMU_FTR_TYPE_44x |
 #endif
 #if defined(CONFIG_E200) || defined(CONFIG_E500)
 		MMU_FTR_TYPE_FSL_E | MMU_FTR_BIG_PHYS | MMU_FTR_USE_TLBILX |
 #endif
-#ifdef CONFIG_PPC_47x
-		MMU_FTR_TYPE_47x | MMU_FTR_USE_TLBIVAX_BCAST | MMU_FTR_LOCK_BCAST_INVAL |
-#endif
 #ifdef CONFIG_PPC_BOOK3S_32
 		MMU_FTR_USE_HIGH_BATS |
 #endif
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 492c0b36aff6..cf80e6c8ed5e 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -1533,6 +1533,7 @@ static struct cpu_spec __initdata cpu_specs[] = {
 
 #endif /* CONFIG_40x */
 #ifdef CONFIG_44x
+#ifndef CONFIG_PPC_47x
 	{
 		.pvr_mask		= 0xf0000fff,
 		.pvr_value		= 0x40000850,
@@ -1815,7 +1816,19 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_440A,
 		.platform		= "ppc440",
 	},
-#ifdef CONFIG_PPC_47x
+	{	/* default match */
+		.pvr_mask		= 0x00000000,
+		.pvr_value		= 0x00000000,
+		.cpu_name		= "(generic 44x PPC)",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc440",
+	}
+#else /* CONFIG_PPC_47x */
 	{ /* 476 DD2 core */
 		.pvr_mask		= 0xffffffff,
 		.pvr_value		= 0x11a52080,
@@ -1872,19 +1885,19 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_47x,
 		.platform		= "ppc470",
 	},
-#endif /* CONFIG_PPC_47x */
 	{	/* default match */
 		.pvr_mask		= 0x00000000,
 		.pvr_value		= 0x00000000,
-		.cpu_name		= "(generic 44x PPC)",
-		.cpu_features		= CPU_FTRS_44X,
+		.cpu_name		= "(generic 47x PPC)",
+		.cpu_features		= CPU_FTRS_47X,
 		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
+		.mmu_features		= MMU_FTR_TYPE_47x,
 		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc440",
+		.dcache_bsize		= 128,
+		.machine_check		= machine_check_47x,
+		.platform		= "ppc470",
 	}
+#endif /* CONFIG_PPC_47x */
 #endif /* CONFIG_44x */
 #ifdef CONFIG_E200
 	{	/* e200z5 */
-- 
2.25.0

