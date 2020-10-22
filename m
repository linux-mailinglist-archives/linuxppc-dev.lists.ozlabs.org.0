Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE12958C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 09:03:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGyyK0My4zDqfr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 18:03:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGyC0318szDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 17:29:48 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CGyBw3Hd0zB09ZR;
 Thu, 22 Oct 2020 08:29:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id baFs2-vCBFyf; Thu, 22 Oct 2020 08:29:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CGyBw2S6Xz9vCy4;
 Thu, 22 Oct 2020 08:29:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4BD908B805;
 Thu, 22 Oct 2020 08:29:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id k91w7Nxx59aD; Thu, 22 Oct 2020 08:29:45 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 059328B769;
 Thu, 22 Oct 2020 08:29:45 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DDA46667EF; Thu, 22 Oct 2020 06:29:44 +0000 (UTC)
Message-Id: <8dde0cdb629a71abc29b0d85a52a86e920376cb6.1603348103.git.christophe.leroy@csgroup.eu>
In-Reply-To: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
References: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 19/20] powerpc/32s: Make support for 603 and 604+ selectable
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Oct 2020 06:29:44 +0000 (UTC)
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

book3s/32 has two main families:
- CPU with 603 cores that don't have HASH PTE table and
perform SW TLB loading.
- Other CPUs based on 604+ cores that have HASH PTE table.

This leads to some complex logic and additionnal code to
support both. This makes sense for distribution kernels
that aim at running on any CPU, but when you are fine
tuning a kernel for an embedded 603 based board you
don't need all the HASH logic.

Allow selection of support for each family, in order to opt
out unneeded parts of code. At least one must be selected.

Note that some of the CPU supporting HASH also support SW TLB
loading, however it is not supported by Linux kernel at the
time being, because they do not have alternate registers in
the TLB miss exception handlers.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/cputable.h    |  8 ++++++--
 arch/powerpc/include/asm/mmu.h         |  5 ++++-
 arch/powerpc/kernel/cputable.c         |  6 ++++++
 arch/powerpc/platforms/Kconfig.cputype | 16 ++++++++++++++++
 4 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 89f2d6b68cd7..72214635d79a 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -509,7 +509,7 @@ static inline void cpu_feature_keys_init(void) { }
 #else
 enum {
 	CPU_FTRS_POSSIBLE =
-#ifdef CONFIG_PPC_BOOK3S_32
+#ifdef CONFIG_PPC_BOOK3S_604
 	    CPU_FTRS_604 | CPU_FTRS_740_NOTAU |
 	    CPU_FTRS_740 | CPU_FTRS_750 | CPU_FTRS_750FX1 |
 	    CPU_FTRS_750FX2 | CPU_FTRS_750FX | CPU_FTRS_750GX |
@@ -518,6 +518,8 @@ enum {
 	    CPU_FTRS_7455_20 | CPU_FTRS_7455 | CPU_FTRS_7447_10 |
 	    CPU_FTRS_7447 | CPU_FTRS_7447A |
 	    CPU_FTRS_CLASSIC32 |
+#endif
+#ifdef CONFIG_PPC_BOOK3S_603
 	    CPU_FTRS_603 | CPU_FTRS_82XX |
 	    CPU_FTRS_G2_LE | CPU_FTRS_E300 | CPU_FTRS_E300C2 |
 #endif
@@ -584,7 +586,7 @@ enum {
 #else
 enum {
 	CPU_FTRS_ALWAYS =
-#ifdef CONFIG_PPC_BOOK3S_32
+#ifdef CONFIG_PPC_BOOK3S_604
 	    CPU_FTRS_604 & CPU_FTRS_740_NOTAU &
 	    CPU_FTRS_740 & CPU_FTRS_750 & CPU_FTRS_750FX1 &
 	    CPU_FTRS_750FX2 & CPU_FTRS_750FX & CPU_FTRS_750GX &
@@ -593,6 +595,8 @@ enum {
 	    CPU_FTRS_7455_20 & CPU_FTRS_7455 & CPU_FTRS_7447_10 &
 	    CPU_FTRS_7447 & CPU_FTRS_7447A &
 	    CPU_FTRS_CLASSIC32 &
+#endif
+#ifdef CONFIG_PPC_BOOK3S_603
 	    CPU_FTRS_603 & CPU_FTRS_82XX &
 	    CPU_FTRS_G2_LE & CPU_FTRS_E300 & CPU_FTRS_E300C2 &
 #endif
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 7f57a9f7999f..85e050dd3673 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -154,7 +154,7 @@ DECLARE_PER_CPU(int, next_tlbcam_idx);
 
 enum {
 	MMU_FTRS_POSSIBLE =
-#ifdef CONFIG_PPC_BOOK3S
+#if defined(CONFIG_PPC_BOOK3S_64) || defined(CONFIG_PPC_BOOK3S_604)
 		MMU_FTR_HPTE_TABLE |
 #endif
 #ifdef CONFIG_PPC_8xx
@@ -201,6 +201,9 @@ enum {
 		0,
 };
 
+#if defined(CONFIG_PPC_BOOK3S_604) && !defined(CONFIG_PPC_BOOK3S_603)
+#define MMU_FTRS_ALWAYS		MMU_FTR_HPTE_TABLE
+#endif
 #ifdef CONFIG_PPC_8xx
 #define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_8xx
 #endif
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index ba96127d2e8c..84840575e639 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -610,6 +610,7 @@ static struct cpu_spec __initdata cpu_specs[] = {
 
 #ifdef CONFIG_PPC32
 #ifdef CONFIG_PPC_BOOK3S_32
+#ifdef CONFIG_PPC_BOOK3S_604
 	{	/* 604 */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x00040000,
@@ -1099,6 +1100,8 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
+#endif /* CONFIG_PPC_BOOK3S_604 */
+#ifdef CONFIG_PPC_BOOK3S_603
 	{	/* 603 */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x00030000,
@@ -1227,6 +1230,8 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.platform		= "ppc603",
 	},
 #endif
+#endif /* CONFIG_PPC_BOOK3S_603 */
+#ifdef CONFIG_PPC_BOOK3S_604
 	{	/* default match, we assume split I/D cache & TB (non-601)... */
 		.pvr_mask		= 0x00000000,
 		.pvr_value		= 0x00000000,
@@ -1239,6 +1244,7 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc603",
 	},
+#endif /* CONFIG_PPC_BOOK3S_604 */
 #endif /* CONFIG_PPC_BOOK3S_32 */
 #ifdef CONFIG_PPC_8xx
 	{	/* 8xx */
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 818a41c9e274..12ad1dedc678 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -67,6 +67,22 @@ config E200
 
 endchoice
 
+config PPC_BOOK3S_603
+	bool "Support for 603 SW loaded TLB"
+	depends on PPC_BOOK3S_32
+	default y
+	help
+	  Provide support for processors based on the 603 cores. Those
+	  processors don't have a HASH MMU and provide SW TLB loading.
+
+config PPC_BOOK3S_604
+	bool "Support for 604+ HASH MMU" if PPC_BOOK3S_603
+	depends on PPC_BOOK3S_32
+	default y
+	help
+	  Provide support for processors not based on the 603 cores.
+	  Those processors have a HASH MMU.
+
 choice
 	prompt "Processor Type"
 	depends on PPC64
-- 
2.25.0

