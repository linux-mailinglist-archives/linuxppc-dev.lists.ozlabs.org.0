Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC15BD31D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 19:04:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWWHW0h8Kz3fQW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:04:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWWFV2JGwz3cdt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 03:02:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MWWDv22wGz9skp;
	Mon, 19 Sep 2022 19:02:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPzSCjPdf6h8; Mon, 19 Sep 2022 19:02:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MWWDr4sbvz9sks;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 94A188B776;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aTKaUoMnajSY; Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.8])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5364D8B775;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28JH1wU31549608
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 19:01:58 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28JH1w5v1549607;
	Mon, 19 Sep 2022 19:01:58 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 08/19] powerpc/cputable: Split cpu_specs[] for mpc85xx and e500mc
Date: Mon, 19 Sep 2022 19:01:32 +0200
Message-Id: <553b901ea91e393df231103da4b018e9b251b0e9.1663606876.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
References: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663606899; l=5912; s=20211009; h=from:subject:message-id; bh=TXQtVvws+HY+umocoHqdiBq24MPM+oo8JUUPWa19ei8=; b=KrGW80qn7ZWOt7Faxdubnjw8oiMFvKF8msAGcBCmtXiUc1tJUgBPfN5okMfvBy2BxlZHDyONfTAQ RDn+/7HxD9+uo3ELnyO/Ez07kPzpgwdeEdtsNZ2hvYbrcTqpuwig
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

e500v1/v2 and e500mc are said to be mutually exclusive in Kconfig.

Split e500 cpu_specs[] and then restrict the non e500mc to PPC32
which is then 85xx.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/cpu_specs.h               |  6 +-
 arch/powerpc/kernel/cpu_specs_85xx.h          | 60 +++++++++++++++++++
 .../{cpu_specs_e500.h => cpu_specs_e500mc.h}  | 57 ------------------
 3 files changed, 64 insertions(+), 59 deletions(-)
 create mode 100644 arch/powerpc/kernel/cpu_specs_85xx.h
 rename arch/powerpc/kernel/{cpu_specs_e500.h => cpu_specs_e500mc.h} (58%)

diff --git a/arch/powerpc/kernel/cpu_specs.h b/arch/powerpc/kernel/cpu_specs.h
index 3de0b70d7203..2f5168c09be1 100644
--- a/arch/powerpc/kernel/cpu_specs.h
+++ b/arch/powerpc/kernel/cpu_specs.h
@@ -14,8 +14,10 @@
 #include "cpu_specs_8xx.h"
 #endif
 
-#ifdef CONFIG_E500
-#include "cpu_specs_e500.h"
+#ifdef CONFIG_PPC_E500MC
+#include "cpu_specs_e500mc.h"
+#elif defined(CONFIG_PPC_85xx)
+#include "cpu_specs_85xx.h"
 #endif
 
 #ifdef CONFIG_PPC_BOOK3S_32
diff --git a/arch/powerpc/kernel/cpu_specs_85xx.h b/arch/powerpc/kernel/cpu_specs_85xx.h
new file mode 100644
index 000000000000..f5534311cfc0
--- /dev/null
+++ b/arch/powerpc/kernel/cpu_specs_85xx.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Copyright (C) 2001 Ben. Herrenschmidt (benh@kernel.crashing.org)
+ */
+
+#define COMMON_USER_BOOKE	(PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU | \
+				 PPC_FEATURE_BOOKE)
+
+static struct cpu_spec __initdata cpu_specs[] = {
+	{	/* e500 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x80200000,
+		.cpu_name		= "e500",
+		.cpu_features		= CPU_FTRS_E500,
+		.cpu_user_features	= COMMON_USER_BOOKE |
+			PPC_FEATURE_HAS_SPE_COMP |
+			PPC_FEATURE_HAS_EFP_SINGLE_COMP,
+		.cpu_user_features2	= PPC_FEATURE2_ISEL,
+		.mmu_features		= MMU_FTR_TYPE_FSL_E,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.cpu_setup		= __setup_cpu_e500v1,
+		.machine_check		= machine_check_e500,
+		.platform		= "ppc8540",
+	},
+	{	/* e500v2 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x80210000,
+		.cpu_name		= "e500v2",
+		.cpu_features		= CPU_FTRS_E500_2,
+		.cpu_user_features	= COMMON_USER_BOOKE |
+			PPC_FEATURE_HAS_SPE_COMP |
+			PPC_FEATURE_HAS_EFP_SINGLE_COMP |
+			PPC_FEATURE_HAS_EFP_DOUBLE_COMP,
+		.cpu_user_features2	= PPC_FEATURE2_ISEL,
+		.mmu_features		= MMU_FTR_TYPE_FSL_E | MMU_FTR_BIG_PHYS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.cpu_setup		= __setup_cpu_e500v2,
+		.machine_check		= machine_check_e500,
+		.platform		= "ppc8548",
+		.cpu_down_flush		= cpu_down_flush_e500v2,
+	},
+	{	/* default match */
+		.pvr_mask		= 0x00000000,
+		.pvr_value		= 0x00000000,
+		.cpu_name		= "(generic E500 PPC)",
+		.cpu_features		= CPU_FTRS_E500,
+		.cpu_user_features	= COMMON_USER_BOOKE |
+			PPC_FEATURE_HAS_SPE_COMP |
+			PPC_FEATURE_HAS_EFP_SINGLE_COMP,
+		.mmu_features		= MMU_FTR_TYPE_FSL_E,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_e500,
+		.platform		= "powerpc",
+	}
+};
diff --git a/arch/powerpc/kernel/cpu_specs_e500.h b/arch/powerpc/kernel/cpu_specs_e500mc.h
similarity index 58%
rename from arch/powerpc/kernel/cpu_specs_e500.h
rename to arch/powerpc/kernel/cpu_specs_e500mc.h
index 92d165741efc..2f6586f04cef 100644
--- a/arch/powerpc/kernel/cpu_specs_e500.h
+++ b/arch/powerpc/kernel/cpu_specs_e500mc.h
@@ -16,44 +16,6 @@
 
 static struct cpu_spec __initdata cpu_specs[] = {
 #ifdef CONFIG_PPC32
-#ifndef CONFIG_PPC_E500MC
-	{	/* e500 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x80200000,
-		.cpu_name		= "e500",
-		.cpu_features		= CPU_FTRS_E500,
-		.cpu_user_features	= COMMON_USER_BOOKE |
-			PPC_FEATURE_HAS_SPE_COMP |
-			PPC_FEATURE_HAS_EFP_SINGLE_COMP,
-		.cpu_user_features2	= PPC_FEATURE2_ISEL,
-		.mmu_features		= MMU_FTR_TYPE_FSL_E,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.cpu_setup		= __setup_cpu_e500v1,
-		.machine_check		= machine_check_e500,
-		.platform		= "ppc8540",
-	},
-	{	/* e500v2 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x80210000,
-		.cpu_name		= "e500v2",
-		.cpu_features		= CPU_FTRS_E500_2,
-		.cpu_user_features	= COMMON_USER_BOOKE |
-			PPC_FEATURE_HAS_SPE_COMP |
-			PPC_FEATURE_HAS_EFP_SINGLE_COMP |
-			PPC_FEATURE_HAS_EFP_DOUBLE_COMP,
-		.cpu_user_features2	= PPC_FEATURE2_ISEL,
-		.mmu_features		= MMU_FTR_TYPE_FSL_E | MMU_FTR_BIG_PHYS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.cpu_setup		= __setup_cpu_e500v2,
-		.machine_check		= machine_check_e500,
-		.platform		= "ppc8548",
-		.cpu_down_flush		= cpu_down_flush_e500v2,
-	},
-#else
 	{	/* e500mc */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x80230000,
@@ -71,9 +33,7 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.platform		= "ppce500mc",
 		.cpu_down_flush		= cpu_down_flush_e500mc,
 	},
-#endif /* CONFIG_PPC_E500MC */
 #endif /* CONFIG_PPC32 */
-#ifdef CONFIG_PPC_E500MC
 	{	/* e5500 */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x80240000,
@@ -115,21 +75,4 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.platform		= "ppce6500",
 		.cpu_down_flush		= cpu_down_flush_e6500,
 	},
-#endif /* CONFIG_PPC_E500MC */
-#ifdef CONFIG_PPC32
-	{	/* default match */
-		.pvr_mask		= 0x00000000,
-		.pvr_value		= 0x00000000,
-		.cpu_name		= "(generic E500 PPC)",
-		.cpu_features		= CPU_FTRS_E500,
-		.cpu_user_features	= COMMON_USER_BOOKE |
-			PPC_FEATURE_HAS_SPE_COMP |
-			PPC_FEATURE_HAS_EFP_SINGLE_COMP,
-		.mmu_features		= MMU_FTR_TYPE_FSL_E,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_e500,
-		.platform		= "powerpc",
-	}
-#endif /* CONFIG_PPC32 */
 };
-- 
2.37.1

