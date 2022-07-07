Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA556A596
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 16:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdzXm01Z1z3c58
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 00:38:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdzXL1twZz2xmy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 00:37:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LdzXF3FXLz9tGv;
	Thu,  7 Jul 2022 16:37:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJ6FvwFZK3aL; Thu,  7 Jul 2022 16:37:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LdzXC0r97z9tGm;
	Thu,  7 Jul 2022 16:37:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B44A8B79F;
	Thu,  7 Jul 2022 16:37:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Qo8hBSmdXVji; Thu,  7 Jul 2022 16:37:30 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.174])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 971128B768;
	Thu,  7 Jul 2022 16:37:30 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 267EbKLf538802
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 7 Jul 2022 16:37:20 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 267EbK5R538801;
	Thu, 7 Jul 2022 16:37:20 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 2/2] powerpc: Remove remaining parts of oprofile
Date: Thu,  7 Jul 2022 16:37:18 +0200
Message-Id: <298432fe1a14c0a415760011d72c3f0999efd5e2.1657204631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20c0ee7f99dbf0dbf8658df6b39f84753e6db1ef.1657204631.git.christophe.leroy@csgroup.eu>
References: <20c0ee7f99dbf0dbf8658df6b39f84753e6db1ef.1657204631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657204637; l=19575; s=20211009; h=from:subject:message-id; bh=8dsuXKsr+EcAYiJoq6Rw/QJc5SSX4Q6267Nj3A9IGjo=; b=IN4VJxnS2jFgiGRIgyGwRZsrgGnrL+Zgdz3zUixl4ZWk5wBj6xiS0F1J1r5Wg5URS7cCMtELM1al GARXKt3DBoVVhtsFRHsrB30pUdhk7UWHQOte5kEnPMcx171/y2YI
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 9850b6c69356 ("arch: powerpc: Remove oprofile") removed
oprofile.

Remove all remaining parts of it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/powerpc/include/asm/cputable.h       |  3 -
 arch/powerpc/kernel/cputable.c            | 67 +----------------------
 arch/powerpc/kernel/dt_cpu_ftrs.c         |  4 --
 arch/powerpc/platforms/cell/spufs/spufs.h |  2 +-
 arch/powerpc/platforms/ps3/Kconfig        |  2 +-
 5 files changed, 4 insertions(+), 74 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 549eb6dd146f..ae8c3e13cfce 100644
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
index a5dbfccd2047..d8e42ef750f1 100644
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
-		.oprofile_cpu_type	= "ppc64/power9",
 		.cpu_setup		= __setup_cpu_power9,
 		.cpu_restore		= __restore_cpu_power9,
 		.machine_check_early	= __machine_check_early_realmode_p9,
@@ -535,7 +511,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/power10",
 		.cpu_setup		= __setup_cpu_power10,
 		.cpu_restore		= __restore_cpu_power10,
 		.machine_check_early	= __machine_check_early_realmode_p10,
@@ -554,7 +529,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 4,
 		.pmc_type		= PPC_PMC_IBM,
-		.oprofile_cpu_type	= "ppc64/cell-be",
 		.platform		= "ppc-cell-be",
 	},
 	{	/* PA Semi PA6T */
@@ -570,7 +544,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_PA6T,
 		.cpu_setup		= __setup_cpu_pa6t,
 		.cpu_restore		= __restore_cpu_pa6t,
-		.oprofile_cpu_type	= "ppc64/pa6t",
 		.platform		= "pa6t",
 	},
 	{	/* default match */
@@ -734,7 +707,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_750,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
-		.oprofile_cpu_type      = "ppc/750",
 	},
 	{	/* 745/755 */
 		.pvr_mask		= 0xfffff000,
@@ -765,7 +737,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_750,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
-		.oprofile_cpu_type      = "ppc/750",
 	},
 	{	/* 750FX rev 2.0 must disable HID0[DPM] */
 		.pvr_mask		= 0xffffffff,
@@ -781,7 +752,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_750,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
-		.oprofile_cpu_type      = "ppc/750",
 	},
 	{	/* 750FX (All revs except 2.0) */
 		.pvr_mask		= 0xffff0000,
@@ -797,7 +767,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_750fx,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
-		.oprofile_cpu_type      = "ppc/750",
 	},
 	{	/* 750GX */
 		.pvr_mask		= 0xffff0000,
@@ -813,7 +782,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_750fx,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
-		.oprofile_cpu_type      = "ppc/750",
 	},
 	{	/* 740/750 (L2CR bit need fixup for 740) */
 		.pvr_mask		= 0xffff0000,
@@ -891,7 +859,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -908,7 +875,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -925,7 +891,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -942,7 +907,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -959,7 +923,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -976,7 +939,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -993,7 +955,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1010,7 +971,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1026,7 +986,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1043,7 +1002,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1060,7 +1018,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.oprofile_cpu_type      = "ppc/7450",
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1172,7 +1129,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_603,
 		.machine_check		= machine_check_83xx,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e300",
 		.platform		= "ppc603",
 	},
 	{	/* e300c4 (e300c1, plus one IU) */
@@ -1188,7 +1144,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_603,
 		.machine_check		= machine_check_83xx,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e300",
 		.platform		= "ppc603",
 	},
 #endif
@@ -1884,7 +1839,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 32,
 		.dcache_bsize		= 32,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e500",
 		.cpu_setup		= __setup_cpu_e500v1,
 		.machine_check		= machine_check_e500,
 		.platform		= "ppc8540",
@@ -1903,7 +1857,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 32,
 		.dcache_bsize		= 32,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e500",
 		.cpu_setup		= __setup_cpu_e500v2,
 		.machine_check		= machine_check_e500,
 		.platform		= "ppc8548",
@@ -1922,7 +1875,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 64,
 		.dcache_bsize		= 64,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e500mc",
 		.cpu_setup		= __setup_cpu_e500mc,
 		.machine_check		= machine_check_e500mc,
 		.platform		= "ppce500mc",
@@ -1943,7 +1895,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 64,
 		.dcache_bsize		= 64,
 		.num_pmcs		= 4,
-		.oprofile_cpu_type	= "ppc/e500mc",
 		.cpu_setup		= __setup_cpu_e5500,
 #ifndef CONFIG_PPC32
 		.cpu_restore		= __restore_cpu_e5500,
@@ -1965,7 +1916,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 64,
 		.dcache_bsize		= 64,
 		.num_pmcs		= 6,
-		.oprofile_cpu_type	= "ppc/e6500",
 		.cpu_setup		= __setup_cpu_e6500,
 #ifndef CONFIG_PPC32
 		.cpu_restore		= __restore_cpu_e6500,
@@ -2033,23 +1983,10 @@ static struct cpu_spec * __init setup_cpu_spec(unsigned long offset,
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
-		 * oprofile_cpu_type. Furthermore, let's ensure that the
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
index 2ad365c21afa..fc800a9fb2c4 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -102,7 +102,6 @@ static struct cpu_spec __initdata base_cpu_spec = {
 	.dcache_bsize		= 32, /* cache info init.             */
 	.num_pmcs		= 0,
 	.pmc_type		= PPC_PMC_DEFAULT,
-	.oprofile_cpu_type	= NULL,
 	.cpu_setup		= NULL,
 	.cpu_restore		= __restore_cpu_cpufeatures,
 	.machine_check_early	= NULL,
@@ -387,7 +386,6 @@ static int __init feat_enable_pmu_power8(struct dt_cpu_feature *f)
 
 	cur_cpu_spec->num_pmcs		= 6;
 	cur_cpu_spec->pmc_type		= PPC_PMC_IBM;
-	cur_cpu_spec->oprofile_cpu_type	= "ppc64/power8";
 
 	return 1;
 }
@@ -423,7 +421,6 @@ static int __init feat_enable_pmu_power9(struct dt_cpu_feature *f)
 
 	cur_cpu_spec->num_pmcs		= 6;
 	cur_cpu_spec->pmc_type		= PPC_PMC_IBM;
-	cur_cpu_spec->oprofile_cpu_type	= "ppc64/power9";
 
 	return 1;
 }
@@ -449,7 +446,6 @@ static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
 
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
diff --git a/arch/powerpc/platforms/ps3/Kconfig b/arch/powerpc/platforms/ps3/Kconfig
index 610682caabc4..a44869e5ea70 100644
--- a/arch/powerpc/platforms/ps3/Kconfig
+++ b/arch/powerpc/platforms/ps3/Kconfig
@@ -165,7 +165,7 @@ config PS3_LPM
 
 	  If you intend to use the advanced performance monitoring and
 	  profiling support of the Cell processor with programs like
-	  oprofile and perfmon2, then say Y or M, otherwise say N.
+	  perfmon2, then say Y or M, otherwise say N.
 
 config PS3GELIC_UDBG
 	bool "PS3 udbg output via UDP broadcasts on Ethernet"
-- 
2.36.1

