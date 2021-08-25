Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBE53F709D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 09:45:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvdL36gpNz2yPs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 17:44:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvdKG49ZQz2yMN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 17:44:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GvdK76RQ8z9sV9;
 Wed, 25 Aug 2021 09:44:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYKjK29SAHjb; Wed, 25 Aug 2021 09:44:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GvdK65ZHsz9sTL;
 Wed, 25 Aug 2021 09:44:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F24A8B83B;
 Wed, 25 Aug 2021 09:44:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zg26FGoTMAqv; Wed, 25 Aug 2021 09:44:10 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E9A78B76A;
 Wed, 25 Aug 2021 09:44:10 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0B1C76BC7B; Wed, 25 Aug 2021 07:44:10 +0000 (UTC)
Message-Id: <c52963b674d5bf11e6aa5b91a48f8e85c58ff409.1629877436.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8ea2d4065ec5a0137e5ad9b75773ed27c03bfc91.1629877436.git.christophe.leroy@csgroup.eu>
References: <8ea2d4065ec5a0137e5ad9b75773ed27c03bfc91.1629877436.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 2/2] powerpc: Remove remaining parts of oprofile
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 25 Aug 2021 07:44:10 +0000 (UTC)
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

Commit 9850b6c69356 ("arch: powerpc: Remove oprofile") removed
oprofile.

Remove all remaining parts of it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/powerpc/include/asm/cputable.h       |  3 --
 arch/powerpc/kernel/cputable.c            | 66 +----------------------
 arch/powerpc/kernel/dt_cpu_ftrs.c         |  4 --
 arch/powerpc/platforms/cell/spufs/spufs.h |  2 +-
 4 files changed, 3 insertions(+), 72 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index e85c849214a2..850129d13d46 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -70,9 +70,6 @@ struct cpu_spec {
 	/* Used to restore cpu setup on secondary processors and at resume */
 	cpu_restore_t	cpu_restore;
 
-	/* Used by oprofile userspace to select the right counters */
-	char		*oprofile_cpu_type;
-
 	/* Name of processor class, for the ELF AT_PLATFORM entry */
 	char		*platform;
 
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index ae0fdef0ac11..0fc812ac7519 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -149,7 +149,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_IBM,
 		.cpu_setup		= __setup_cpu_ppc970,
 		.cpu_restore		= __restore_cpu_ppc970,
-		.oprofile_cpu_type	= "ppc64/970",
 		.platform		= "ppc970",
 	},
 	{	/* PPC970FX */
@@ -166,7 +165,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_IBM,
 		.cpu_setup		= __setup_cpu_ppc970,
 		.cpu_restore		= __restore_cpu_ppc970,
-		.oprofile_cpu_type	= "ppc64/970",
 		.platform		= "ppc970",
 	},
 	{	/* PPC970MP DD1.0 - no DEEPNAP, use regular 970 init */
@@ -183,7 +181,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_IBM,
 		.cpu_setup		= __setup_cpu_ppc970,
 		.cpu_restore		= __restore_cpu_ppc970,
-		.oprofile_cpu_type	= "ppc64/970MP",
 		.platform		= "ppc970",
 	},
 	{	/* PPC970MP */
@@ -200,7 +197,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_IBM,
 		.cpu_setup		= __setup_cpu_ppc970MP,
 		.cpu_restore		= __restore_cpu_ppc970,
-		.oprofile_cpu_type	= "ppc64/970MP",
 		.platform		= "ppc970",
 	},
 	{	/* PPC970GX */
@@ -216,7 +212,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 8,
 		.pmc_type		= PPC_PMC_IBM,
 		.cpu_setup		= __setup_cpu_ppc970,
-		.oprofile_cpu_type	= "ppc64/970",
 		.platform		= "ppc970",
 	},
 	{	/* Power5 GR */
@@ -230,7 +225,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power5",
 		.platform		= "power5",
 	},
 	{	/* Power5++ */
@@ -243,7 +237,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
-		.oprofile_cpu_type	= "ppc64/power5++",
 		.platform		= "power5+",
 	},
 	{	/* Power5 GS */
@@ -257,7 +250,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power5+",
 		.platform		= "power5+",
 	},
 	{	/* POWER6 in P5+ mode; 2.04-compliant processor */
@@ -269,7 +261,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.mmu_features		= MMU_FTRS_POWER5,
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
-		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
 		.platform		= "power5+",
 	},
 	{	/* Power6 */
@@ -284,7 +275,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power6",
 		.platform		= "power6x",
 	},
 	{	/* 2.05-compliant processor, i.e. Power6 "architected" mode */
@@ -296,7 +286,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.mmu_features		= MMU_FTRS_POWER6,
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
-		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
 		.platform		= "power6",
 	},
 	{	/* 2.06-compliant processor, i.e. Power7 "architected" mode */
@@ -309,7 +298,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.mmu_features		= MMU_FTRS_POWER7,
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
-		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
 		.cpu_setup		= __setup_cpu_power7,
 		.cpu_restore		= __restore_cpu_power7,
 		.machine_check_early	= __machine_check_early_realmode_p7,
@@ -325,7 +313,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.mmu_features		= MMU_FTRS_POWER8,
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
-		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
 		.cpu_setup		= __setup_cpu_power8,
 		.cpu_restore		= __restore_cpu_power8,
 		.machine_check_early	= __machine_check_early_realmode_p8,
@@ -341,7 +328,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.mmu_features		= MMU_FTRS_POWER9,
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
-		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
 		.cpu_setup		= __setup_cpu_power9,
 		.cpu_restore		= __restore_cpu_power9,
 		.platform		= "power9",
@@ -356,7 +342,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.mmu_features		= MMU_FTRS_POWER10,
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
-		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
 		.cpu_setup		= __setup_cpu_power10,
 		.cpu_restore		= __restore_cpu_power10,
 		.platform		= "power10",
@@ -373,7 +358,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power7",
 		.cpu_setup		= __setup_cpu_power7,
 		.cpu_restore		= __restore_cpu_power7,
 		.machine_check_early	= __machine_check_early_realmode_p7,
@@ -391,7 +375,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power7",
 		.cpu_setup		= __setup_cpu_power7,
 		.cpu_restore		= __restore_cpu_power7,
 		.machine_check_early	= __machine_check_early_realmode_p7,
@@ -409,7 +392,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power8",
 		.cpu_setup		= __setup_cpu_power8,
 		.cpu_restore		= __restore_cpu_power8,
 		.machine_check_early	= __machine_check_early_realmode_p8,
@@ -427,7 +409,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power8",
 		.cpu_setup		= __setup_cpu_power8,
 		.cpu_restore		= __restore_cpu_power8,
 		.machine_check_early	= __machine_check_early_realmode_p8,
@@ -445,7 +426,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power8",
 		.cpu_setup		= __setup_cpu_power8,
 		.cpu_restore		= __restore_cpu_power8,
 		.machine_check_early	= __machine_check_early_realmode_p8,
@@ -463,7 +443,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power9",
 		.cpu_setup		= __setup_cpu_power9,
 		.cpu_restore		= __restore_cpu_power9,
 		.machine_check_early	= __machine_check_early_realmode_p9,
@@ -481,7 +460,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power9",
 		.cpu_setup		= __setup_cpu_power9,
 		.cpu_restore		= __restore_cpu_power9,
 		.machine_check_early	= __machine_check_early_realmode_p9,
@@ -499,7 +477,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power9",
 		.cpu_setup		= __setup_cpu_power9,
 		.cpu_restore		= __restore_cpu_power9,
 		.machine_check_early	= __machine_check_early_realmode_p9,
@@ -517,7 +494,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power10",
 		.cpu_setup		= __setup_cpu_power10,
 		.cpu_restore		= __restore_cpu_power10,
 		.machine_check_early	= __machine_check_early_realmode_p10,
@@ -536,7 +512,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 4,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/cell-be",
 		.platform		= "ppc-cell-be",
 	},
 	{	/* PA Semi PA6T */
@@ -552,7 +527,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_PA6T,
 		.cpu_setup		= __setup_cpu_pa6t,
 		.cpu_restore		= __restore_cpu_pa6t,
-		.oprofile_cpu_type	= "ppc64/pa6t",
 		.platform		= "pa6t",
 	},
 	{	/* default match */
@@ -716,7 +690,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_750,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
-		.oprofile_cpu_type      = "ppc/750",
 	},
 	{	/* 745/755 */
 		.pvr_mask		= 0xfffff000,
@@ -747,7 +720,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_750,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
-		.oprofile_cpu_type      = "ppc/750",
 	},
 	{	/* 750FX rev 2.0 must disable HID0[DPM] */
 		.pvr_mask		= 0xffffffff,
@@ -763,7 +735,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_750,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
-		.oprofile_cpu_type      = "ppc/750",
 	},
 	{	/* 750FX (All revs except 2.0) */
 		.pvr_mask		= 0xffff0000,
@@ -779,7 +750,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_750fx,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
-		.oprofile_cpu_type      = "ppc/750",
 	},
 	{	/* 750GX */
 		.pvr_mask		= 0xffff0000,
@@ -795,7 +765,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_750fx,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
-		.oprofile_cpu_type      = "ppc/750",
 	},
 	{	/* 740/750 (L2CR bit need fixup for 740) */
 		.pvr_mask		= 0xffff0000,
@@ -873,7 +842,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -890,7 +858,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -907,7 +874,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -924,7 +890,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -941,7 +906,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -958,7 +922,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -975,7 +938,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -992,7 +954,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1008,7 +969,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1025,7 +985,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1042,7 +1001,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1154,7 +1112,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_603,
 		.machine_check		= machine_check_83xx,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e300",
 		.platform		= "ppc603",
 	},
 	{	/* e300c4 (e300c1, plus one IU) */
@@ -1170,7 +1127,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_603,
 		.machine_check		= machine_check_83xx,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e300",
 		.platform		= "ppc603",
 	},
 #endif
@@ -1866,7 +1822,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 32,
 		.dcache_bsize		= 32,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e500",
 		.cpu_setup		= __setup_cpu_e500v1,
 		.machine_check		= machine_check_e500,
 		.platform		= "ppc8540",
@@ -1885,7 +1840,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 32,
 		.dcache_bsize		= 32,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e500",
 		.cpu_setup		= __setup_cpu_e500v2,
 		.machine_check		= machine_check_e500,
 		.platform		= "ppc8548",
@@ -1904,7 +1858,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 64,
 		.dcache_bsize		= 64,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e500mc",
 		.cpu_setup		= __setup_cpu_e500mc,
 		.machine_check		= machine_check_e500mc,
 		.platform		= "ppce500mc",
@@ -1925,7 +1878,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 64,
 		.dcache_bsize		= 64,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e500mc",
 		.cpu_setup		= __setup_cpu_e5500,
 #ifndef CONFIG_PPC32
 		.cpu_restore		= __restore_cpu_e5500,
@@ -1947,7 +1899,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 64,
 		.dcache_bsize		= 64,
 		.num_pmcs		= 6,
-		.oprofile_cpu_type	= "ppc/e6500",
 		.cpu_setup		= __setup_cpu_e6500,
 #ifndef CONFIG_PPC32
 		.cpu_restore		= __restore_cpu_e6500,
@@ -2015,23 +1966,10 @@ static struct cpu_spec * __init setup_cpu_spec(unsigned long offset,
 		t->pmc_type = old.pmc_type;
 
 		/*
-		 * If we have passed through this logic once before and
-		 * have pulled the default case because the real PVR was
-		 * not found inside cpu_specs[], then we are possibly
-		 * running in compatibility mode. In that case, let the
-		 * oprofiler know which set of compatibility counters to
-		 * pull from by making sure the oprofile_cpu_type string
-		 * is set to that of compatibility mode. If the
-		 * oprofile_cpu_type already has a value, then we are
-		 * possibly overriding a real PVR with a logical one,
-		 * and, in that case, keep the current value for
-		 * oprofile_cpu_type. Futhermore, let's ensure that the
+		 * Let's ensure that the
 		 * fix for the PMAO bug is enabled on compatibility mode.
 		 */
-		if (old.oprofile_cpu_type != NULL) {
-			t->oprofile_cpu_type = old.oprofile_cpu_type;
-			t->cpu_features |= old.cpu_features & CPU_FTR_PMAO_BUG;
-		}
+		t->cpu_features |= old.cpu_features & CPU_FTR_PMAO_BUG;
 	}
 
 	*PTRRELOC(&cur_cpu_spec) = &the_cpu_spec;
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 358aee7c2d79..2bb1a5ca2cff 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -101,7 +101,6 @@ static struct cpu_spec __initdata base_cpu_spec = {
 	.dcache_bsize		= 32, /* cache info init.             */
 	.num_pmcs		= 0,
 	.pmc_type		= PPC_PMC_DEFAULT,
-	.oprofile_cpu_type	= NULL,
 	.cpu_setup		= NULL,
 	.cpu_restore		= __restore_cpu_cpufeatures,
 	.machine_check_early	= NULL,
@@ -379,7 +378,6 @@ static int __init feat_enable_pmu_power8(struct dt_cpu_feature *f)
 
 	cur_cpu_spec->num_pmcs		= 6;
 	cur_cpu_spec->pmc_type		= PPC_PMC_IBM;
-	cur_cpu_spec->oprofile_cpu_type	= "ppc64/power8";
 
 	return 1;
 }
@@ -415,7 +413,6 @@ static int __init feat_enable_pmu_power9(struct dt_cpu_feature *f)
 
 	cur_cpu_spec->num_pmcs		= 6;
 	cur_cpu_spec->pmc_type		= PPC_PMC_IBM;
-	cur_cpu_spec->oprofile_cpu_type	= "ppc64/power9";
 
 	return 1;
 }
@@ -441,7 +438,6 @@ static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
 
 	cur_cpu_spec->num_pmcs          = 6;
 	cur_cpu_spec->pmc_type          = PPC_PMC_IBM;
-	cur_cpu_spec->oprofile_cpu_type = "ppc64/power10";
 
 	return 1;
 }
diff --git a/arch/powerpc/platforms/cell/spufs/spufs.h b/arch/powerpc/platforms/cell/spufs/spufs.h
index afc1d6604d12..23c6799cfa5a 100644
--- a/arch/powerpc/platforms/cell/spufs/spufs.h
+++ b/arch/powerpc/platforms/cell/spufs/spufs.h
@@ -76,7 +76,7 @@ struct spu_context {
 	struct address_space *mss;	   /* 'mss' area mappings. */
 	struct address_space *psmap;	   /* 'psmap' area mappings. */
 	struct mutex mapping_lock;
-	u64 object_id;		   /* user space pointer for oprofile */
+	u64 object_id;		   /* user space pointer for GNU Debugger */
 
 	enum { SPU_STATE_RUNNABLE, SPU_STATE_SAVED } state;
 	struct mutex state_mutex;
-- 
2.25.0

