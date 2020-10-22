Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF522958BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 09:01:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGyvw1kK4zDqwP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 18:01:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGyBz1qgtzDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 17:29:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CGyBv3JCKz9vCyl;
 Thu, 22 Oct 2020 08:29:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id v-s_nQ8aGAjY; Thu, 22 Oct 2020 08:29:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CGyBv1ycvz9vCy4;
 Thu, 22 Oct 2020 08:29:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 443748B805;
 Thu, 22 Oct 2020 08:29:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0t88PuETvecJ; Thu, 22 Oct 2020 08:29:44 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F29298B769;
 Thu, 22 Oct 2020 08:29:43 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D7437667EF; Thu, 22 Oct 2020 06:29:43 +0000 (UTC)
Message-Id: <45065263fdb9f5cc2a2d210ec2a762ac8bf5b2bc.1603348103.git.christophe.leroy@csgroup.eu>
In-Reply-To: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
References: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 18/20] powerpc/32s: Regroup 603 based CPUs in cputable
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Oct 2020 06:29:43 +0000 (UTC)
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

In order to selectively build the kernel for 603 SW TLB handling,
regroup all 603 based CPUs together.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/cputable.h | 14 +++---
 arch/powerpc/kernel/cputable.c      | 78 ++++++++++++++---------------
 2 files changed, 47 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index c596bab134e2..89f2d6b68cd7 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -510,15 +510,16 @@ static inline void cpu_feature_keys_init(void) { }
 enum {
 	CPU_FTRS_POSSIBLE =
 #ifdef CONFIG_PPC_BOOK3S_32
-	    CPU_FTRS_603 | CPU_FTRS_604 | CPU_FTRS_740_NOTAU |
+	    CPU_FTRS_604 | CPU_FTRS_740_NOTAU |
 	    CPU_FTRS_740 | CPU_FTRS_750 | CPU_FTRS_750FX1 |
 	    CPU_FTRS_750FX2 | CPU_FTRS_750FX | CPU_FTRS_750GX |
 	    CPU_FTRS_7400_NOTAU | CPU_FTRS_7400 | CPU_FTRS_7450_20 |
 	    CPU_FTRS_7450_21 | CPU_FTRS_7450_23 | CPU_FTRS_7455_1 |
 	    CPU_FTRS_7455_20 | CPU_FTRS_7455 | CPU_FTRS_7447_10 |
-	    CPU_FTRS_7447 | CPU_FTRS_7447A | CPU_FTRS_82XX |
-	    CPU_FTRS_G2_LE | CPU_FTRS_E300 | CPU_FTRS_E300C2 |
+	    CPU_FTRS_7447 | CPU_FTRS_7447A |
 	    CPU_FTRS_CLASSIC32 |
+	    CPU_FTRS_603 | CPU_FTRS_82XX |
+	    CPU_FTRS_G2_LE | CPU_FTRS_E300 | CPU_FTRS_E300C2 |
 #endif
 #ifdef CONFIG_PPC_8xx
 	    CPU_FTRS_8XX |
@@ -584,15 +585,16 @@ enum {
 enum {
 	CPU_FTRS_ALWAYS =
 #ifdef CONFIG_PPC_BOOK3S_32
-	    CPU_FTRS_603 & CPU_FTRS_604 & CPU_FTRS_740_NOTAU &
+	    CPU_FTRS_604 & CPU_FTRS_740_NOTAU &
 	    CPU_FTRS_740 & CPU_FTRS_750 & CPU_FTRS_750FX1 &
 	    CPU_FTRS_750FX2 & CPU_FTRS_750FX & CPU_FTRS_750GX &
 	    CPU_FTRS_7400_NOTAU & CPU_FTRS_7400 & CPU_FTRS_7450_20 &
 	    CPU_FTRS_7450_21 & CPU_FTRS_7450_23 & CPU_FTRS_7455_1 &
 	    CPU_FTRS_7455_20 & CPU_FTRS_7455 & CPU_FTRS_7447_10 &
-	    CPU_FTRS_7447 & CPU_FTRS_7447A & CPU_FTRS_82XX &
-	    CPU_FTRS_G2_LE & CPU_FTRS_E300 & CPU_FTRS_E300C2 &
+	    CPU_FTRS_7447 & CPU_FTRS_7447A &
 	    CPU_FTRS_CLASSIC32 &
+	    CPU_FTRS_603 & CPU_FTRS_82XX &
+	    CPU_FTRS_G2_LE & CPU_FTRS_E300 & CPU_FTRS_E300C2 &
 #endif
 #ifdef CONFIG_PPC_8xx
 	    CPU_FTRS_8XX &
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 0828a7756595..ba96127d2e8c 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -610,45 +610,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 
 #ifdef CONFIG_PPC32
 #ifdef CONFIG_PPC_BOOK3S_32
-	{	/* 603 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00030000,
-		.cpu_name		= "603",
-		.cpu_features		= CPU_FTRS_603,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= 0,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc603",
-	},
-	{	/* 603e */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00060000,
-		.cpu_name		= "603e",
-		.cpu_features		= CPU_FTRS_603,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= 0,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc603",
-	},
-	{	/* 603ev */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00070000,
-		.cpu_name		= "603ev",
-		.cpu_features		= CPU_FTRS_603,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= 0,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc603",
-	},
 	{	/* 604 */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x00040000,
@@ -1138,6 +1099,45 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
+	{	/* 603 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00030000,
+		.cpu_name		= "603",
+		.cpu_features		= CPU_FTRS_603,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= 0,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_603,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc603",
+	},
+	{	/* 603e */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00060000,
+		.cpu_name		= "603e",
+		.cpu_features		= CPU_FTRS_603,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= 0,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_603,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc603",
+	},
+	{	/* 603ev */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00070000,
+		.cpu_name		= "603ev",
+		.cpu_features		= CPU_FTRS_603,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= 0,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_603,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc603",
+	},
 	{	/* 82xx (8240, 8245, 8260 are all 603e cores) */
 		.pvr_mask		= 0x7fff0000,
 		.pvr_value		= 0x00810000,
-- 
2.25.0

