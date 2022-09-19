Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B95BD337
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 19:06:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWWKp0K6Wz3fwX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:06:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWWFy5Y00z3f3F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 03:03:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MWWF13DXRz9sky;
	Mon, 19 Sep 2022 19:02:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edQUvTYlZT07; Mon, 19 Sep 2022 19:02:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MWWDr4pKYz9skq;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 92F258B76D;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id PcAXhSHUOAQg; Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.8])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 435D98B764;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28JH1vXI1549600
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 19:01:57 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28JH1vok1549598;
	Mon, 19 Sep 2022 19:01:57 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 06/19] powerpc/cputable: Split cpu_specs[] out of cputable.h
Date: Mon, 19 Sep 2022 19:01:30 +0200
Message-Id: <a44b865e0318286155273b10cdf524ab697928c1.1663606875.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
References: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663606899; l=125620; s=20211009; h=from:subject:message-id; bh=kFMZdiFu7xSRT0bdAV0Yn1N8vyRh59xkIlg4DupYClA=; b=BTF6umDNlpNanyFiabgx1cvm13FmNWjVWiTjL3MptbFTYuQh5aba645ksiEYWb4y7FFhrktKQigl ybT0xCK7DOdsmPNbrx2ISlQclkxJiaNFV5sufjWyqLs+8ovisNRC
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

cpu_specs[] is full of #ifdefs depending on the different
types of CPU.

CPUs are mutually exclusive, it is therefore possible to split
cpu_specs[] into smaller more readable pieces.

Create cpu_specs_XXX.h that will each be dedicated on one
of the following mutually exclusive families:
- 40x
- 44x
- 47x
- 8xx
- e500
- book3s/32
- book3s/64

In book3s/32, the block for 603 has been moved in front in order
to not have two 604 blocks.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/cpu_specs.h           |   27 +
 arch/powerpc/kernel/cpu_specs_40x.h       |  280 +++
 arch/powerpc/kernel/cpu_specs_44x.h       |  304 ++++
 arch/powerpc/kernel/cpu_specs_47x.h       |   78 +
 arch/powerpc/kernel/cpu_specs_8xx.h       |   21 +
 arch/powerpc/kernel/cpu_specs_book3s_32.h |  607 +++++++
 arch/powerpc/kernel/cpu_specs_book3s_64.h |  488 ++++++
 arch/powerpc/kernel/cpu_specs_e500.h      |  135 ++
 arch/powerpc/kernel/cputable.c            | 1877 +--------------------
 9 files changed, 1941 insertions(+), 1876 deletions(-)
 create mode 100644 arch/powerpc/kernel/cpu_specs.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_40x.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_44x.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_47x.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_8xx.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_book3s_32.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_book3s_64.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_e500.h

diff --git a/arch/powerpc/kernel/cpu_specs.h b/arch/powerpc/kernel/cpu_specs.h
new file mode 100644
index 000000000000..3de0b70d7203
--- /dev/null
+++ b/arch/powerpc/kernel/cpu_specs.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifdef CONFIG_40x
+#include "cpu_specs_40x.h"
+#endif
+
+#ifdef CONFIG_47x
+#include "cpu_specs_47x.h"
+#elif defined(CONFIG_44x)
+#include "cpu_specs_44x.h"
+#endif
+
+#ifdef CONFIG_PPC_8xx
+#include "cpu_specs_8xx.h"
+#endif
+
+#ifdef CONFIG_E500
+#include "cpu_specs_e500.h"
+#endif
+
+#ifdef CONFIG_PPC_BOOK3S_32
+#include "cpu_specs_book3s_32.h"
+#endif
+
+#ifdef CONFIG_PPC_BOOK3S_64
+#include "cpu_specs_book3s_64.h"
+#endif
diff --git a/arch/powerpc/kernel/cpu_specs_40x.h b/arch/powerpc/kernel/cpu_specs_40x.h
new file mode 100644
index 000000000000..3dfe6a4df49d
--- /dev/null
+++ b/arch/powerpc/kernel/cpu_specs_40x.h
@@ -0,0 +1,280 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Copyright (C) 2001 Ben. Herrenschmidt (benh@kernel.crashing.org)
+ */
+
+static struct cpu_spec __initdata cpu_specs[] = {
+	{	/* STB 04xxx */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x41810000,
+		.cpu_name		= "STB04xxx",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* NP405L */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x41610000,
+		.cpu_name		= "NP405L",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* NP4GS3 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x40B10000,
+		.cpu_name		= "NP4GS3",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{   /* NP405H */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x41410000,
+		.cpu_name		= "NP405H",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405GPr */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x50910000,
+		.cpu_name		= "405GPr",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{   /* STBx25xx */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x51510000,
+		.cpu_name		= "STBx25xx",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405LP */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x41F10000,
+		.cpu_name		= "405LP",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405EP */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x51210000,
+		.cpu_name		= "405EP",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405EX Rev. A/B with Security */
+		.pvr_mask		= 0xffff000f,
+		.pvr_value		= 0x12910007,
+		.cpu_name		= "405EX Rev. A/B",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405EX Rev. C without Security */
+		.pvr_mask		= 0xffff000f,
+		.pvr_value		= 0x1291000d,
+		.cpu_name		= "405EX Rev. C",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405EX Rev. C with Security */
+		.pvr_mask		= 0xffff000f,
+		.pvr_value		= 0x1291000f,
+		.cpu_name		= "405EX Rev. C",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405EX Rev. D without Security */
+		.pvr_mask		= 0xffff000f,
+		.pvr_value		= 0x12910003,
+		.cpu_name		= "405EX Rev. D",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405EX Rev. D with Security */
+		.pvr_mask		= 0xffff000f,
+		.pvr_value		= 0x12910005,
+		.cpu_name		= "405EX Rev. D",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405EXr Rev. A/B without Security */
+		.pvr_mask		= 0xffff000f,
+		.pvr_value		= 0x12910001,
+		.cpu_name		= "405EXr Rev. A/B",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405EXr Rev. C without Security */
+		.pvr_mask		= 0xffff000f,
+		.pvr_value		= 0x12910009,
+		.cpu_name		= "405EXr Rev. C",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405EXr Rev. C with Security */
+		.pvr_mask		= 0xffff000f,
+		.pvr_value		= 0x1291000b,
+		.cpu_name		= "405EXr Rev. C",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405EXr Rev. D without Security */
+		.pvr_mask		= 0xffff000f,
+		.pvr_value		= 0x12910000,
+		.cpu_name		= "405EXr Rev. D",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* 405EXr Rev. D with Security */
+		.pvr_mask		= 0xffff000f,
+		.pvr_value		= 0x12910002,
+		.cpu_name		= "405EXr Rev. D",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{
+		/* 405EZ */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x41510000,
+		.cpu_name		= "405EZ",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* APM8018X */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x7ff11432,
+		.cpu_name		= "APM8018X",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	},
+	{	/* default match */
+		.pvr_mask		= 0x00000000,
+		.pvr_value		= 0x00000000,
+		.cpu_name		= "(generic 40x PPC)",
+		.cpu_features		= CPU_FTRS_40X,
+		.cpu_user_features	= PPC_FEATURE_32 |
+			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
+		.mmu_features		= MMU_FTR_TYPE_40x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc405",
+	}
+};
diff --git a/arch/powerpc/kernel/cpu_specs_44x.h b/arch/powerpc/kernel/cpu_specs_44x.h
new file mode 100644
index 000000000000..622707af7d37
--- /dev/null
+++ b/arch/powerpc/kernel/cpu_specs_44x.h
@@ -0,0 +1,304 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Copyright (C) 2001 Ben. Herrenschmidt (benh@kernel.crashing.org)
+ */
+
+#define COMMON_USER_BOOKE	(PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU | \
+				 PPC_FEATURE_BOOKE)
+
+static struct cpu_spec __initdata cpu_specs[] = {
+	{
+		.pvr_mask		= 0xf0000fff,
+		.pvr_value		= 0x40000850,
+		.cpu_name		= "440GR Rev. A",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc440",
+	},
+	{ /* Use logical PVR for 440EP (logical pvr = pvr | 0x8) */
+		.pvr_mask		= 0xf0000fff,
+		.pvr_value		= 0x40000858,
+		.cpu_name		= "440EP Rev. A",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_440ep,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc440",
+	},
+	{
+		.pvr_mask		= 0xf0000fff,
+		.pvr_value		= 0x400008d3,
+		.cpu_name		= "440GR Rev. B",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc440",
+	},
+	{ /* Matches both physical and logical PVR for 440EP (logical pvr = pvr | 0x8) */
+		.pvr_mask		= 0xf0000ff7,
+		.pvr_value		= 0x400008d4,
+		.cpu_name		= "440EP Rev. C",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_440ep,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc440",
+	},
+	{ /* Use logical PVR for 440EP (logical pvr = pvr | 0x8) */
+		.pvr_mask		= 0xf0000fff,
+		.pvr_value		= 0x400008db,
+		.cpu_name		= "440EP Rev. B",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_440ep,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc440",
+	},
+	{ /* 440GRX */
+		.pvr_mask		= 0xf0000ffb,
+		.pvr_value		= 0x200008D0,
+		.cpu_name		= "440GRX",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_440grx,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{ /* Use logical PVR for 440EPx (logical pvr = pvr | 0x8) */
+		.pvr_mask		= 0xf0000ffb,
+		.pvr_value		= 0x200008D8,
+		.cpu_name		= "440EPX",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_440epx,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{	/* 440GP Rev. B */
+		.pvr_mask		= 0xf0000fff,
+		.pvr_value		= 0x40000440,
+		.cpu_name		= "440GP Rev. B",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc440gp",
+	},
+	{	/* 440GP Rev. C */
+		.pvr_mask		= 0xf0000fff,
+		.pvr_value		= 0x40000481,
+		.cpu_name		= "440GP Rev. C",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc440gp",
+	},
+	{ /* 440GX Rev. A */
+		.pvr_mask		= 0xf0000fff,
+		.pvr_value		= 0x50000850,
+		.cpu_name		= "440GX Rev. A",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_440gx,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{ /* 440GX Rev. B */
+		.pvr_mask		= 0xf0000fff,
+		.pvr_value		= 0x50000851,
+		.cpu_name		= "440GX Rev. B",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_440gx,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{ /* 440GX Rev. C */
+		.pvr_mask		= 0xf0000fff,
+		.pvr_value		= 0x50000892,
+		.cpu_name		= "440GX Rev. C",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_440gx,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{ /* 440GX Rev. F */
+		.pvr_mask		= 0xf0000fff,
+		.pvr_value		= 0x50000894,
+		.cpu_name		= "440GX Rev. F",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_440gx,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{ /* 440SP Rev. A */
+		.pvr_mask		= 0xfff00fff,
+		.pvr_value		= 0x53200891,
+		.cpu_name		= "440SP Rev. A",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_4xx,
+		.platform		= "ppc440",
+	},
+	{ /* 440SPe Rev. A */
+		.pvr_mask               = 0xfff00fff,
+		.pvr_value              = 0x53400890,
+		.cpu_name               = "440SPe Rev. A",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features      = COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize           = 32,
+		.dcache_bsize           = 32,
+		.cpu_setup		= __setup_cpu_440spe,
+		.machine_check		= machine_check_440A,
+		.platform               = "ppc440",
+	},
+	{ /* 440SPe Rev. B */
+		.pvr_mask		= 0xfff00fff,
+		.pvr_value		= 0x53400891,
+		.cpu_name		= "440SPe Rev. B",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_440spe,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{ /* 460EX */
+		.pvr_mask		= 0xffff0006,
+		.pvr_value		= 0x13020002,
+		.cpu_name		= "460EX",
+		.cpu_features		= CPU_FTRS_440x6,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_460ex,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{ /* 460EX Rev B */
+		.pvr_mask		= 0xffff0007,
+		.pvr_value		= 0x13020004,
+		.cpu_name		= "460EX Rev. B",
+		.cpu_features		= CPU_FTRS_440x6,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_460ex,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{ /* 460GT */
+		.pvr_mask		= 0xffff0006,
+		.pvr_value		= 0x13020000,
+		.cpu_name		= "460GT",
+		.cpu_features		= CPU_FTRS_440x6,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_460gt,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{ /* 460GT Rev B */
+		.pvr_mask		= 0xffff0007,
+		.pvr_value		= 0x13020005,
+		.cpu_name		= "460GT Rev. B",
+		.cpu_features		= CPU_FTRS_440x6,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_460gt,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{ /* 460SX */
+		.pvr_mask		= 0xffffff00,
+		.pvr_value		= 0x13541800,
+		.cpu_name		= "460SX",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_460sx,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
+	{ /* 464 in APM821xx */
+		.pvr_mask		= 0xfffffff0,
+		.pvr_value		= 0x12C41C80,
+		.cpu_name		= "APM821XX",
+		.cpu_features		= CPU_FTRS_44X,
+		.cpu_user_features	= COMMON_USER_BOOKE |
+			PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_44x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_apm821xx,
+		.machine_check		= machine_check_440A,
+		.platform		= "ppc440",
+	},
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
+};
diff --git a/arch/powerpc/kernel/cpu_specs_47x.h b/arch/powerpc/kernel/cpu_specs_47x.h
new file mode 100644
index 000000000000..94e8ff870666
--- /dev/null
+++ b/arch/powerpc/kernel/cpu_specs_47x.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Copyright (C) 2001 Ben. Herrenschmidt (benh@kernel.crashing.org)
+ */
+
+#define COMMON_USER_BOOKE	(PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU | \
+				 PPC_FEATURE_BOOKE)
+
+static struct cpu_spec __initdata cpu_specs[] = {
+	{ /* 476 DD2 core */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x11a52080,
+		.cpu_name		= "476",
+		.cpu_features		= CPU_FTRS_47X | CPU_FTR_476_DD2,
+		.cpu_user_features	= COMMON_USER_BOOKE |
+			PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_47x |
+			MMU_FTR_USE_TLBIVAX_BCAST | MMU_FTR_LOCK_BCAST_INVAL,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 128,
+		.machine_check		= machine_check_47x,
+		.platform		= "ppc470",
+	},
+	{ /* 476fpe */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x7ff50000,
+		.cpu_name		= "476fpe",
+		.cpu_features		= CPU_FTRS_47X | CPU_FTR_476_DD2,
+		.cpu_user_features	= COMMON_USER_BOOKE |
+			PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_47x |
+			MMU_FTR_USE_TLBIVAX_BCAST | MMU_FTR_LOCK_BCAST_INVAL,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 128,
+		.machine_check		= machine_check_47x,
+		.platform		= "ppc470",
+	},
+	{ /* 476 iss */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00050000,
+		.cpu_name		= "476",
+		.cpu_features		= CPU_FTRS_47X,
+		.cpu_user_features	= COMMON_USER_BOOKE |
+			PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_47x |
+			MMU_FTR_USE_TLBIVAX_BCAST | MMU_FTR_LOCK_BCAST_INVAL,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 128,
+		.machine_check		= machine_check_47x,
+		.platform		= "ppc470",
+	},
+	{ /* 476 others */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x11a50000,
+		.cpu_name		= "476",
+		.cpu_features		= CPU_FTRS_47X,
+		.cpu_user_features	= COMMON_USER_BOOKE |
+			PPC_FEATURE_HAS_FPU,
+		.mmu_features		= MMU_FTR_TYPE_47x |
+			MMU_FTR_USE_TLBIVAX_BCAST | MMU_FTR_LOCK_BCAST_INVAL,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 128,
+		.machine_check		= machine_check_47x,
+		.platform		= "ppc470",
+	},
+	{	/* default match */
+		.pvr_mask		= 0x00000000,
+		.pvr_value		= 0x00000000,
+		.cpu_name		= "(generic 47x PPC)",
+		.cpu_features		= CPU_FTRS_47X,
+		.cpu_user_features	= COMMON_USER_BOOKE,
+		.mmu_features		= MMU_FTR_TYPE_47x,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 128,
+		.machine_check		= machine_check_47x,
+		.platform		= "ppc470",
+	}
+};
diff --git a/arch/powerpc/kernel/cpu_specs_8xx.h b/arch/powerpc/kernel/cpu_specs_8xx.h
new file mode 100644
index 000000000000..16a7ee363e2c
--- /dev/null
+++ b/arch/powerpc/kernel/cpu_specs_8xx.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Copyright (C) 2001 Ben. Herrenschmidt (benh@kernel.crashing.org)
+ */
+
+static struct cpu_spec __initdata cpu_specs[] = {
+	{	/* 8xx */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= PVR_8xx,
+		.cpu_name		= "8xx",
+		/* CPU_FTR_MAYBE_CAN_DOZE is possible,
+		 * if the 8xx code is there.... */
+		.cpu_features		= CPU_FTRS_8XX,
+		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
+		.mmu_features		= MMU_FTR_TYPE_8xx,
+		.icache_bsize		= 16,
+		.dcache_bsize		= 16,
+		.machine_check		= machine_check_8xx,
+		.platform		= "ppc823",
+	},
+};
diff --git a/arch/powerpc/kernel/cpu_specs_book3s_32.h b/arch/powerpc/kernel/cpu_specs_book3s_32.h
new file mode 100644
index 000000000000..b491800598cc
--- /dev/null
+++ b/arch/powerpc/kernel/cpu_specs_book3s_32.h
@@ -0,0 +1,607 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Copyright (C) 2001 Ben. Herrenschmidt (benh@kernel.crashing.org)
+ */
+
+#define COMMON_USER		(PPC_FEATURE_32 | PPC_FEATURE_HAS_FPU | \
+				 PPC_FEATURE_HAS_MMU)
+
+static struct cpu_spec __initdata cpu_specs[] = {
+#ifdef CONFIG_PPC_BOOK3S_603
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
+	{	/* 82xx (8240, 8245, 8260 are all 603e cores) */
+		.pvr_mask		= 0x7fff0000,
+		.pvr_value		= 0x00810000,
+		.cpu_name		= "82xx",
+		.cpu_features		= CPU_FTRS_82XX,
+		.cpu_user_features	= COMMON_USER,
+		.mmu_features		= 0,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_603,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc603",
+	},
+	{	/* All G2_LE (603e core, plus some) have the same pvr */
+		.pvr_mask		= 0x7fff0000,
+		.pvr_value		= 0x00820000,
+		.cpu_name		= "G2_LE",
+		.cpu_features		= CPU_FTRS_G2_LE,
+		.cpu_user_features	= COMMON_USER,
+		.mmu_features		= MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_603,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc603",
+	},
+#ifdef CONFIG_PPC_83xx
+	{	/* e300c1 (a 603e core, plus some) on 83xx */
+		.pvr_mask		= 0x7fff0000,
+		.pvr_value		= 0x00830000,
+		.cpu_name		= "e300c1",
+		.cpu_features		= CPU_FTRS_E300,
+		.cpu_user_features	= COMMON_USER,
+		.mmu_features		= MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_603,
+		.machine_check		= machine_check_83xx,
+		.platform		= "ppc603",
+	},
+	{	/* e300c2 (an e300c1 core, plus some, minus FPU) on 83xx */
+		.pvr_mask		= 0x7fff0000,
+		.pvr_value		= 0x00840000,
+		.cpu_name		= "e300c2",
+		.cpu_features		= CPU_FTRS_E300C2,
+		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
+		.mmu_features		= MMU_FTR_USE_HIGH_BATS |
+			MMU_FTR_NEED_DTLB_SW_LRU,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_603,
+		.machine_check		= machine_check_83xx,
+		.platform		= "ppc603",
+	},
+	{	/* e300c3 (e300c1, plus one IU, half cache size) on 83xx */
+		.pvr_mask		= 0x7fff0000,
+		.pvr_value		= 0x00850000,
+		.cpu_name		= "e300c3",
+		.cpu_features		= CPU_FTRS_E300,
+		.cpu_user_features	= COMMON_USER,
+		.mmu_features		= MMU_FTR_USE_HIGH_BATS |
+			MMU_FTR_NEED_DTLB_SW_LRU,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_603,
+		.machine_check		= machine_check_83xx,
+		.num_pmcs		= 4,
+		.platform		= "ppc603",
+	},
+	{	/* e300c4 (e300c1, plus one IU) */
+		.pvr_mask		= 0x7fff0000,
+		.pvr_value		= 0x00860000,
+		.cpu_name		= "e300c4",
+		.cpu_features		= CPU_FTRS_E300,
+		.cpu_user_features	= COMMON_USER,
+		.mmu_features		= MMU_FTR_USE_HIGH_BATS |
+			MMU_FTR_NEED_DTLB_SW_LRU,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.cpu_setup		= __setup_cpu_603,
+		.machine_check		= machine_check_83xx,
+		.num_pmcs		= 4,
+		.platform		= "ppc603",
+	},
+#endif
+#endif /* CONFIG_PPC_BOOK3S_603 */
+#ifdef CONFIG_PPC_BOOK3S_604
+	{	/* 604 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00040000,
+		.cpu_name		= "604",
+		.cpu_features		= CPU_FTRS_604,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 2,
+		.cpu_setup		= __setup_cpu_604,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc604",
+	},
+	{	/* 604e */
+		.pvr_mask		= 0xfffff000,
+		.pvr_value		= 0x00090000,
+		.cpu_name		= "604e",
+		.cpu_features		= CPU_FTRS_604,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.cpu_setup		= __setup_cpu_604,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc604",
+	},
+	{	/* 604r */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00090000,
+		.cpu_name		= "604r",
+		.cpu_features		= CPU_FTRS_604,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.cpu_setup		= __setup_cpu_604,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc604",
+	},
+	{	/* 604ev */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x000a0000,
+		.cpu_name		= "604ev",
+		.cpu_features		= CPU_FTRS_604,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.cpu_setup		= __setup_cpu_604,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc604",
+	},
+	{	/* 740/750 (0x4202, don't support TAU ?) */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x00084202,
+		.cpu_name		= "740/750",
+		.cpu_features		= CPU_FTRS_740_NOTAU,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.cpu_setup		= __setup_cpu_750,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 750CX (80100 and 8010x?) */
+		.pvr_mask		= 0xfffffff0,
+		.pvr_value		= 0x00080100,
+		.cpu_name		= "750CX",
+		.cpu_features		= CPU_FTRS_750,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.cpu_setup		= __setup_cpu_750cx,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 750CX (82201 and 82202) */
+		.pvr_mask		= 0xfffffff0,
+		.pvr_value		= 0x00082200,
+		.cpu_name		= "750CX",
+		.cpu_features		= CPU_FTRS_750,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_750cx,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 750CXe (82214) */
+		.pvr_mask		= 0xfffffff0,
+		.pvr_value		= 0x00082210,
+		.cpu_name		= "750CXe",
+		.cpu_features		= CPU_FTRS_750,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_750cx,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 750CXe "Gekko" (83214) */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x00083214,
+		.cpu_name		= "750CXe",
+		.cpu_features		= CPU_FTRS_750,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_750cx,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 750CL (and "Broadway") */
+		.pvr_mask		= 0xfffff0e0,
+		.pvr_value		= 0x00087000,
+		.cpu_name		= "750CL",
+		.cpu_features		= CPU_FTRS_750CL,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_750,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 745/755 */
+		.pvr_mask		= 0xfffff000,
+		.pvr_value		= 0x00083000,
+		.cpu_name		= "745/755",
+		.cpu_features		= CPU_FTRS_750,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_750,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 750FX rev 1.x */
+		.pvr_mask		= 0xffffff00,
+		.pvr_value		= 0x70000100,
+		.cpu_name		= "750FX",
+		.cpu_features		= CPU_FTRS_750FX1,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_750,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 750FX rev 2.0 must disable HID0[DPM] */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x70000200,
+		.cpu_name		= "750FX",
+		.cpu_features		= CPU_FTRS_750FX2,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_750,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 750FX (All revs except 2.0) */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x70000000,
+		.cpu_name		= "750FX",
+		.cpu_features		= CPU_FTRS_750FX,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_750fx,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 750GX */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x70020000,
+		.cpu_name		= "750GX",
+		.cpu_features		= CPU_FTRS_750GX,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_750fx,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 740/750 (L2CR bit need fixup for 740) */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00080000,
+		.cpu_name		= "740/750",
+		.cpu_features		= CPU_FTRS_740,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_750,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc750",
+	},
+	{	/* 7400 rev 1.1 ? (no TAU) */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x000c1101,
+		.cpu_name		= "7400 (1.1)",
+		.cpu_features		= CPU_FTRS_7400_NOTAU,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_7400,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7400",
+	},
+	{	/* 7400 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x000c0000,
+		.cpu_name		= "7400",
+		.cpu_features		= CPU_FTRS_7400,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_7400,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7400",
+	},
+	{	/* 7410 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x800c0000,
+		.cpu_name		= "7410",
+		.cpu_features		= CPU_FTRS_7400,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_7410,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7400",
+	},
+	{	/* 7450 2.0 - no doze/nap */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x80000200,
+		.cpu_name		= "7450",
+		.cpu_features		= CPU_FTRS_7450_20,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_745x,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7450",
+	},
+	{	/* 7450 2.1 */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x80000201,
+		.cpu_name		= "7450",
+		.cpu_features		= CPU_FTRS_7450_21,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_745x,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7450",
+	},
+	{	/* 7450 2.3 and newer */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x80000000,
+		.cpu_name		= "7450",
+		.cpu_features		= CPU_FTRS_7450_23,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_745x,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7450",
+	},
+	{	/* 7455 rev 1.x */
+		.pvr_mask		= 0xffffff00,
+		.pvr_value		= 0x80010100,
+		.cpu_name		= "7455",
+		.cpu_features		= CPU_FTRS_7455_1,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_745x,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7450",
+	},
+	{	/* 7455 rev 2.0 */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x80010200,
+		.cpu_name		= "7455",
+		.cpu_features		= CPU_FTRS_7455_20,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_745x,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7450",
+	},
+	{	/* 7455 others */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x80010000,
+		.cpu_name		= "7455",
+		.cpu_features		= CPU_FTRS_7455,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_745x,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7450",
+	},
+	{	/* 7447/7457 Rev 1.0 */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x80020100,
+		.cpu_name		= "7447/7457",
+		.cpu_features		= CPU_FTRS_7447_10,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_745x,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7450",
+	},
+	{	/* 7447/7457 Rev 1.1 */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x80020101,
+		.cpu_name		= "7447/7457",
+		.cpu_features		= CPU_FTRS_7447_10,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_745x,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7450",
+	},
+	{	/* 7447/7457 Rev 1.2 and later */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x80020000,
+		.cpu_name		= "7447/7457",
+		.cpu_features		= CPU_FTRS_7447,
+		.cpu_user_features	= COMMON_USER | PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_745x,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7450",
+	},
+	{	/* 7447A */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x80030000,
+		.cpu_name		= "7447A",
+		.cpu_features		= CPU_FTRS_7447A,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_745x,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7450",
+	},
+	{	/* 7448 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x80040000,
+		.cpu_name		= "7448",
+		.cpu_features		= CPU_FTRS_7448,
+		.cpu_user_features	= COMMON_USER |
+			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
+		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_G4,
+		.cpu_setup		= __setup_cpu_745x,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc7450",
+	},
+	{	/* default match, we assume split I/D cache & TB (non-601)... */
+		.pvr_mask		= 0x00000000,
+		.pvr_value		= 0x00000000,
+		.cpu_name		= "(generic PPC)",
+		.cpu_features		= CPU_FTRS_CLASSIC32,
+		.cpu_user_features	= COMMON_USER,
+		.mmu_features		= MMU_FTR_HPTE_TABLE,
+		.icache_bsize		= 32,
+		.dcache_bsize		= 32,
+		.machine_check		= machine_check_generic,
+		.platform		= "ppc603",
+	},
+#endif /* CONFIG_PPC_BOOK3S_604 */
+};
diff --git a/arch/powerpc/kernel/cpu_specs_book3s_64.h b/arch/powerpc/kernel/cpu_specs_book3s_64.h
new file mode 100644
index 000000000000..1d8b6d43d7b4
--- /dev/null
+++ b/arch/powerpc/kernel/cpu_specs_book3s_64.h
@@ -0,0 +1,488 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Copyright (C) 2001 Ben. Herrenschmidt (benh@kernel.crashing.org)
+ *
+ *  Modifications for ppc64:
+ *      Copyright (C) 2003 Dave Engebretsen <engebret@us.ibm.com>
+ */
+
+/* NOTE:
+ * Unlike ppc32, ppc64 will only call this once for the boot CPU, it's
+ * the responsibility of the appropriate CPU save/restore functions to
+ * eventually copy these settings over. Those save/restore aren't yet
+ * part of the cputable though. That has to be fixed for both ppc32
+ * and ppc64
+ */
+#define COMMON_USER_PPC64	(PPC_FEATURE_32 | PPC_FEATURE_HAS_FPU | \
+				 PPC_FEATURE_HAS_MMU | PPC_FEATURE_64)
+#define COMMON_USER_POWER4	(COMMON_USER_PPC64 | PPC_FEATURE_POWER4)
+#define COMMON_USER_POWER5	(COMMON_USER_PPC64 | PPC_FEATURE_POWER5 |\
+				 PPC_FEATURE_SMT | PPC_FEATURE_ICACHE_SNOOP)
+#define COMMON_USER_POWER5_PLUS	(COMMON_USER_PPC64 | PPC_FEATURE_POWER5_PLUS|\
+				 PPC_FEATURE_SMT | PPC_FEATURE_ICACHE_SNOOP)
+#define COMMON_USER_POWER6	(COMMON_USER_PPC64 | PPC_FEATURE_ARCH_2_05 |\
+				 PPC_FEATURE_SMT | PPC_FEATURE_ICACHE_SNOOP | \
+				 PPC_FEATURE_TRUE_LE | \
+				 PPC_FEATURE_PSERIES_PERFMON_COMPAT)
+#define COMMON_USER_POWER7	(COMMON_USER_PPC64 | PPC_FEATURE_ARCH_2_06 |\
+				 PPC_FEATURE_SMT | PPC_FEATURE_ICACHE_SNOOP | \
+				 PPC_FEATURE_TRUE_LE | \
+				 PPC_FEATURE_PSERIES_PERFMON_COMPAT)
+#define COMMON_USER2_POWER7	(PPC_FEATURE2_DSCR)
+#define COMMON_USER_POWER8	(COMMON_USER_PPC64 | PPC_FEATURE_ARCH_2_06 |\
+				 PPC_FEATURE_SMT | PPC_FEATURE_ICACHE_SNOOP | \
+				 PPC_FEATURE_TRUE_LE | \
+				 PPC_FEATURE_PSERIES_PERFMON_COMPAT)
+#define COMMON_USER2_POWER8	(PPC_FEATURE2_ARCH_2_07 | \
+				 PPC_FEATURE2_HTM_COMP | \
+				 PPC_FEATURE2_HTM_NOSC_COMP | \
+				 PPC_FEATURE2_DSCR | \
+				 PPC_FEATURE2_ISEL | PPC_FEATURE2_TAR | \
+				 PPC_FEATURE2_VEC_CRYPTO)
+#define COMMON_USER_PA6T	(COMMON_USER_PPC64 | PPC_FEATURE_PA6T |\
+				 PPC_FEATURE_TRUE_LE | \
+				 PPC_FEATURE_HAS_ALTIVEC_COMP)
+#define COMMON_USER_POWER9	COMMON_USER_POWER8
+#define COMMON_USER2_POWER9	(COMMON_USER2_POWER8 | \
+				 PPC_FEATURE2_ARCH_3_00 | \
+				 PPC_FEATURE2_HAS_IEEE128 | \
+				 PPC_FEATURE2_DARN | \
+				 PPC_FEATURE2_SCV)
+#define COMMON_USER_POWER10	COMMON_USER_POWER9
+#define COMMON_USER2_POWER10	(PPC_FEATURE2_ARCH_3_1 | \
+				 PPC_FEATURE2_MMA | \
+				 PPC_FEATURE2_ARCH_3_00 | \
+				 PPC_FEATURE2_HAS_IEEE128 | \
+				 PPC_FEATURE2_DARN | \
+				 PPC_FEATURE2_SCV | \
+				 PPC_FEATURE2_ARCH_2_07 | \
+				 PPC_FEATURE2_DSCR | \
+				 PPC_FEATURE2_ISEL | PPC_FEATURE2_TAR | \
+				 PPC_FEATURE2_VEC_CRYPTO)
+
+static struct cpu_spec __initdata cpu_specs[] = {
+	{	/* PPC970 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00390000,
+		.cpu_name		= "PPC970",
+		.cpu_features		= CPU_FTRS_PPC970,
+		.cpu_user_features	= COMMON_USER_POWER4 |
+			PPC_FEATURE_HAS_ALTIVEC_COMP,
+		.mmu_features		= MMU_FTRS_PPC970,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 8,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_ppc970,
+		.cpu_restore		= __restore_cpu_ppc970,
+		.platform		= "ppc970",
+	},
+	{	/* PPC970FX */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x003c0000,
+		.cpu_name		= "PPC970FX",
+		.cpu_features		= CPU_FTRS_PPC970,
+		.cpu_user_features	= COMMON_USER_POWER4 |
+			PPC_FEATURE_HAS_ALTIVEC_COMP,
+		.mmu_features		= MMU_FTRS_PPC970,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 8,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_ppc970,
+		.cpu_restore		= __restore_cpu_ppc970,
+		.platform		= "ppc970",
+	},
+	{	/* PPC970MP DD1.0 - no DEEPNAP, use regular 970 init */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x00440100,
+		.cpu_name		= "PPC970MP",
+		.cpu_features		= CPU_FTRS_PPC970,
+		.cpu_user_features	= COMMON_USER_POWER4 |
+			PPC_FEATURE_HAS_ALTIVEC_COMP,
+		.mmu_features		= MMU_FTRS_PPC970,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 8,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_ppc970,
+		.cpu_restore		= __restore_cpu_ppc970,
+		.platform		= "ppc970",
+	},
+	{	/* PPC970MP */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00440000,
+		.cpu_name		= "PPC970MP",
+		.cpu_features		= CPU_FTRS_PPC970,
+		.cpu_user_features	= COMMON_USER_POWER4 |
+			PPC_FEATURE_HAS_ALTIVEC_COMP,
+		.mmu_features		= MMU_FTRS_PPC970,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 8,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_ppc970MP,
+		.cpu_restore		= __restore_cpu_ppc970,
+		.platform		= "ppc970",
+	},
+	{	/* PPC970GX */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00450000,
+		.cpu_name		= "PPC970GX",
+		.cpu_features		= CPU_FTRS_PPC970,
+		.cpu_user_features	= COMMON_USER_POWER4 |
+			PPC_FEATURE_HAS_ALTIVEC_COMP,
+		.mmu_features		= MMU_FTRS_PPC970,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 8,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_ppc970,
+		.platform		= "ppc970",
+	},
+	{	/* Power5 GR */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x003a0000,
+		.cpu_name		= "POWER5 (gr)",
+		.cpu_features		= CPU_FTRS_POWER5,
+		.cpu_user_features	= COMMON_USER_POWER5,
+		.mmu_features		= MMU_FTRS_POWER5,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.platform		= "power5",
+	},
+	{	/* Power5++ */
+		.pvr_mask		= 0xffffff00,
+		.pvr_value		= 0x003b0300,
+		.cpu_name		= "POWER5+ (gs)",
+		.cpu_features		= CPU_FTRS_POWER5,
+		.cpu_user_features	= COMMON_USER_POWER5_PLUS,
+		.mmu_features		= MMU_FTRS_POWER5,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.platform		= "power5+",
+	},
+	{	/* Power5 GS */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x003b0000,
+		.cpu_name		= "POWER5+ (gs)",
+		.cpu_features		= CPU_FTRS_POWER5,
+		.cpu_user_features	= COMMON_USER_POWER5_PLUS,
+		.mmu_features		= MMU_FTRS_POWER5,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.platform		= "power5+",
+	},
+	{	/* POWER6 in P5+ mode; 2.04-compliant processor */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x0f000001,
+		.cpu_name		= "POWER5+",
+		.cpu_features		= CPU_FTRS_POWER5,
+		.cpu_user_features	= COMMON_USER_POWER5_PLUS,
+		.mmu_features		= MMU_FTRS_POWER5,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.platform		= "power5+",
+	},
+	{	/* Power6 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x003e0000,
+		.cpu_name		= "POWER6 (raw)",
+		.cpu_features		= CPU_FTRS_POWER6,
+		.cpu_user_features	= COMMON_USER_POWER6 |
+			PPC_FEATURE_POWER6_EXT,
+		.mmu_features		= MMU_FTRS_POWER6,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.platform		= "power6x",
+	},
+	{	/* 2.05-compliant processor, i.e. Power6 "architected" mode */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x0f000002,
+		.cpu_name		= "POWER6 (architected)",
+		.cpu_features		= CPU_FTRS_POWER6,
+		.cpu_user_features	= COMMON_USER_POWER6,
+		.mmu_features		= MMU_FTRS_POWER6,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.platform		= "power6",
+	},
+	{	/* 2.06-compliant processor, i.e. Power7 "architected" mode */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x0f000003,
+		.cpu_name		= "POWER7 (architected)",
+		.cpu_features		= CPU_FTRS_POWER7,
+		.cpu_user_features	= COMMON_USER_POWER7,
+		.cpu_user_features2	= COMMON_USER2_POWER7,
+		.mmu_features		= MMU_FTRS_POWER7,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.cpu_setup		= __setup_cpu_power7,
+		.cpu_restore		= __restore_cpu_power7,
+		.machine_check_early	= __machine_check_early_realmode_p7,
+		.platform		= "power7",
+	},
+	{	/* 2.07-compliant processor, i.e. Power8 "architected" mode */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x0f000004,
+		.cpu_name		= "POWER8 (architected)",
+		.cpu_features		= CPU_FTRS_POWER8,
+		.cpu_user_features	= COMMON_USER_POWER8,
+		.cpu_user_features2	= COMMON_USER2_POWER8,
+		.mmu_features		= MMU_FTRS_POWER8,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.cpu_setup		= __setup_cpu_power8,
+		.cpu_restore		= __restore_cpu_power8,
+		.machine_check_early	= __machine_check_early_realmode_p8,
+		.platform		= "power8",
+	},
+	{	/* 3.00-compliant processor, i.e. Power9 "architected" mode */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x0f000005,
+		.cpu_name		= "POWER9 (architected)",
+		.cpu_features		= CPU_FTRS_POWER9,
+		.cpu_user_features	= COMMON_USER_POWER9,
+		.cpu_user_features2	= COMMON_USER2_POWER9,
+		.mmu_features		= MMU_FTRS_POWER9,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.cpu_setup		= __setup_cpu_power9,
+		.cpu_restore		= __restore_cpu_power9,
+		.platform		= "power9",
+	},
+	{	/* 3.1-compliant processor, i.e. Power10 "architected" mode */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x0f000006,
+		.cpu_name		= "POWER10 (architected)",
+		.cpu_features		= CPU_FTRS_POWER10,
+		.cpu_user_features	= COMMON_USER_POWER10,
+		.cpu_user_features2	= COMMON_USER2_POWER10,
+		.mmu_features		= MMU_FTRS_POWER10,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.cpu_setup		= __setup_cpu_power10,
+		.cpu_restore		= __restore_cpu_power10,
+		.platform		= "power10",
+	},
+	{	/* Power7 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x003f0000,
+		.cpu_name		= "POWER7 (raw)",
+		.cpu_features		= CPU_FTRS_POWER7,
+		.cpu_user_features	= COMMON_USER_POWER7,
+		.cpu_user_features2	= COMMON_USER2_POWER7,
+		.mmu_features		= MMU_FTRS_POWER7,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power7,
+		.cpu_restore		= __restore_cpu_power7,
+		.machine_check_early	= __machine_check_early_realmode_p7,
+		.platform		= "power7",
+	},
+	{	/* Power7+ */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x004A0000,
+		.cpu_name		= "POWER7+ (raw)",
+		.cpu_features		= CPU_FTRS_POWER7,
+		.cpu_user_features	= COMMON_USER_POWER7,
+		.cpu_user_features2	= COMMON_USER2_POWER7,
+		.mmu_features		= MMU_FTRS_POWER7,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power7,
+		.cpu_restore		= __restore_cpu_power7,
+		.machine_check_early	= __machine_check_early_realmode_p7,
+		.platform		= "power7+",
+	},
+	{	/* Power8E */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x004b0000,
+		.cpu_name		= "POWER8E (raw)",
+		.cpu_features		= CPU_FTRS_POWER8E,
+		.cpu_user_features	= COMMON_USER_POWER8,
+		.cpu_user_features2	= COMMON_USER2_POWER8,
+		.mmu_features		= MMU_FTRS_POWER8,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power8,
+		.cpu_restore		= __restore_cpu_power8,
+		.machine_check_early	= __machine_check_early_realmode_p8,
+		.platform		= "power8",
+	},
+	{	/* Power8NVL */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x004c0000,
+		.cpu_name		= "POWER8NVL (raw)",
+		.cpu_features		= CPU_FTRS_POWER8,
+		.cpu_user_features	= COMMON_USER_POWER8,
+		.cpu_user_features2	= COMMON_USER2_POWER8,
+		.mmu_features		= MMU_FTRS_POWER8,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power8,
+		.cpu_restore		= __restore_cpu_power8,
+		.machine_check_early	= __machine_check_early_realmode_p8,
+		.platform		= "power8",
+	},
+	{	/* Power8 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x004d0000,
+		.cpu_name		= "POWER8 (raw)",
+		.cpu_features		= CPU_FTRS_POWER8,
+		.cpu_user_features	= COMMON_USER_POWER8,
+		.cpu_user_features2	= COMMON_USER2_POWER8,
+		.mmu_features		= MMU_FTRS_POWER8,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power8,
+		.cpu_restore		= __restore_cpu_power8,
+		.machine_check_early	= __machine_check_early_realmode_p8,
+		.platform		= "power8",
+	},
+	{	/* Power9 DD2.0 */
+		.pvr_mask		= 0xffffefff,
+		.pvr_value		= 0x004e0200,
+		.cpu_name		= "POWER9 (raw)",
+		.cpu_features		= CPU_FTRS_POWER9_DD2_0,
+		.cpu_user_features	= COMMON_USER_POWER9,
+		.cpu_user_features2	= COMMON_USER2_POWER9,
+		.mmu_features		= MMU_FTRS_POWER9,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power9,
+		.cpu_restore		= __restore_cpu_power9,
+		.machine_check_early	= __machine_check_early_realmode_p9,
+		.platform		= "power9",
+	},
+	{	/* Power9 DD 2.1 */
+		.pvr_mask		= 0xffffefff,
+		.pvr_value		= 0x004e0201,
+		.cpu_name		= "POWER9 (raw)",
+		.cpu_features		= CPU_FTRS_POWER9_DD2_1,
+		.cpu_user_features	= COMMON_USER_POWER9,
+		.cpu_user_features2	= COMMON_USER2_POWER9,
+		.mmu_features		= MMU_FTRS_POWER9,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power9,
+		.cpu_restore		= __restore_cpu_power9,
+		.machine_check_early	= __machine_check_early_realmode_p9,
+		.platform		= "power9",
+	},
+	{	/* Power9 DD2.2 */
+		.pvr_mask		= 0xffffefff,
+		.pvr_value		= 0x004e0202,
+		.cpu_name		= "POWER9 (raw)",
+		.cpu_features		= CPU_FTRS_POWER9_DD2_2,
+		.cpu_user_features	= COMMON_USER_POWER9,
+		.cpu_user_features2	= COMMON_USER2_POWER9,
+		.mmu_features		= MMU_FTRS_POWER9,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power9,
+		.cpu_restore		= __restore_cpu_power9,
+		.machine_check_early	= __machine_check_early_realmode_p9,
+		.platform		= "power9",
+	},
+	{	/* Power9 DD2.3 or later */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x004e0000,
+		.cpu_name		= "POWER9 (raw)",
+		.cpu_features		= CPU_FTRS_POWER9_DD2_3,
+		.cpu_user_features	= COMMON_USER_POWER9,
+		.cpu_user_features2	= COMMON_USER2_POWER9,
+		.mmu_features		= MMU_FTRS_POWER9,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power9,
+		.cpu_restore		= __restore_cpu_power9,
+		.machine_check_early	= __machine_check_early_realmode_p9,
+		.platform		= "power9",
+	},
+	{	/* Power10 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00800000,
+		.cpu_name		= "POWER10 (raw)",
+		.cpu_features		= CPU_FTRS_POWER10,
+		.cpu_user_features	= COMMON_USER_POWER10,
+		.cpu_user_features2	= COMMON_USER2_POWER10,
+		.mmu_features		= MMU_FTRS_POWER10,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power10,
+		.cpu_restore		= __restore_cpu_power10,
+		.machine_check_early	= __machine_check_early_realmode_p10,
+		.platform		= "power10",
+	},
+	{	/* Cell Broadband Engine */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00700000,
+		.cpu_name		= "Cell Broadband Engine",
+		.cpu_features		= CPU_FTRS_CELL,
+		.cpu_user_features	= COMMON_USER_PPC64 |
+			PPC_FEATURE_CELL | PPC_FEATURE_HAS_ALTIVEC_COMP |
+			PPC_FEATURE_SMT,
+		.mmu_features		= MMU_FTRS_CELL,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 4,
+		.pmc_type		= PPC_PMC_IBM,
+		.platform		= "ppc-cell-be",
+	},
+	{	/* PA Semi PA6T */
+		.pvr_mask		= 0x7fff0000,
+		.pvr_value		= 0x00900000,
+		.cpu_name		= "PA6T",
+		.cpu_features		= CPU_FTRS_PA6T,
+		.cpu_user_features	= COMMON_USER_PA6T,
+		.mmu_features		= MMU_FTRS_PA6T,
+		.icache_bsize		= 64,
+		.dcache_bsize		= 64,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_PA6T,
+		.cpu_setup		= __setup_cpu_pa6t,
+		.cpu_restore		= __restore_cpu_pa6t,
+		.platform		= "pa6t",
+	},
+	{	/* default match */
+		.pvr_mask		= 0x00000000,
+		.pvr_value		= 0x00000000,
+		.cpu_name		= "POWER5 (compatible)",
+		.cpu_features		= CPU_FTRS_COMPATIBLE,
+		.cpu_user_features	= COMMON_USER_PPC64,
+		.mmu_features		= MMU_FTRS_POWER,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.platform		= "power5",
+	}
+};
diff --git a/arch/powerpc/kernel/cpu_specs_e500.h b/arch/powerpc/kernel/cpu_specs_e500.h
new file mode 100644
index 000000000000..92d165741efc
--- /dev/null
+++ b/arch/powerpc/kernel/cpu_specs_e500.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Copyright (C) 2001 Ben. Herrenschmidt (benh@kernel.crashing.org)
+ *
+ *  Modifications for ppc64:
+ *      Copyright (C) 2003 Dave Engebretsen <engebret@us.ibm.com>
+ */
+
+#ifdef CONFIG_PPC64
+#define COMMON_USER_BOOKE	(PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU | \
+				 PPC_FEATURE_HAS_FPU | PPC_FEATURE_64)
+#else
+#define COMMON_USER_BOOKE	(PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU | \
+				 PPC_FEATURE_BOOKE)
+#endif
+
+static struct cpu_spec __initdata cpu_specs[] = {
+#ifdef CONFIG_PPC32
+#ifndef CONFIG_PPC_E500MC
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
+#else
+	{	/* e500mc */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x80230000,
+		.cpu_name		= "e500mc",
+		.cpu_features		= CPU_FTRS_E500MC,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
+		.cpu_user_features2	= PPC_FEATURE2_ISEL,
+		.mmu_features		= MMU_FTR_TYPE_FSL_E | MMU_FTR_BIG_PHYS |
+			MMU_FTR_USE_TLBILX,
+		.icache_bsize		= 64,
+		.dcache_bsize		= 64,
+		.num_pmcs		= 4,
+		.cpu_setup		= __setup_cpu_e500mc,
+		.machine_check		= machine_check_e500mc,
+		.platform		= "ppce500mc",
+		.cpu_down_flush		= cpu_down_flush_e500mc,
+	},
+#endif /* CONFIG_PPC_E500MC */
+#endif /* CONFIG_PPC32 */
+#ifdef CONFIG_PPC_E500MC
+	{	/* e5500 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x80240000,
+		.cpu_name		= "e5500",
+		.cpu_features		= CPU_FTRS_E5500,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
+		.cpu_user_features2	= PPC_FEATURE2_ISEL,
+		.mmu_features		= MMU_FTR_TYPE_FSL_E | MMU_FTR_BIG_PHYS |
+			MMU_FTR_USE_TLBILX,
+		.icache_bsize		= 64,
+		.dcache_bsize		= 64,
+		.num_pmcs		= 4,
+		.cpu_setup		= __setup_cpu_e5500,
+#ifndef CONFIG_PPC32
+		.cpu_restore		= __restore_cpu_e5500,
+#endif
+		.machine_check		= machine_check_e500mc,
+		.platform		= "ppce5500",
+		.cpu_down_flush		= cpu_down_flush_e5500,
+	},
+	{	/* e6500 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x80400000,
+		.cpu_name		= "e6500",
+		.cpu_features		= CPU_FTRS_E6500,
+		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU |
+			PPC_FEATURE_HAS_ALTIVEC_COMP,
+		.cpu_user_features2	= PPC_FEATURE2_ISEL,
+		.mmu_features		= MMU_FTR_TYPE_FSL_E | MMU_FTR_BIG_PHYS |
+			MMU_FTR_USE_TLBILX,
+		.icache_bsize		= 64,
+		.dcache_bsize		= 64,
+		.num_pmcs		= 6,
+		.cpu_setup		= __setup_cpu_e6500,
+#ifndef CONFIG_PPC32
+		.cpu_restore		= __restore_cpu_e6500,
+#endif
+		.machine_check		= machine_check_e500mc,
+		.platform		= "ppce6500",
+		.cpu_down_flush		= cpu_down_flush_e6500,
+	},
+#endif /* CONFIG_PPC_E500MC */
+#ifdef CONFIG_PPC32
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
+#endif /* CONFIG_PPC32 */
+};
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 9229e0930332..8a32bffefa5b 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -28,1882 +28,7 @@ EXPORT_SYMBOL(cur_cpu_spec);
 /* The platform string corresponding to the real PVR */
 const char *powerpc_base_platform;
 
-/* NOTE:
- * Unlike ppc32, ppc64 will only call this once for the boot CPU, it's
- * the responsibility of the appropriate CPU save/restore functions to
- * eventually copy these settings over. Those save/restore aren't yet
- * part of the cputable though. That has to be fixed for both ppc32
- * and ppc64
- */
-
-/* This table only contains "desktop" CPUs, it need to be filled with embedded
- * ones as well...
- */
-#define COMMON_USER		(PPC_FEATURE_32 | PPC_FEATURE_HAS_FPU | \
-				 PPC_FEATURE_HAS_MMU)
-#define COMMON_USER_PPC64	(COMMON_USER | PPC_FEATURE_64)
-#define COMMON_USER_POWER4	(COMMON_USER_PPC64 | PPC_FEATURE_POWER4)
-#define COMMON_USER_POWER5	(COMMON_USER_PPC64 | PPC_FEATURE_POWER5 |\
-				 PPC_FEATURE_SMT | PPC_FEATURE_ICACHE_SNOOP)
-#define COMMON_USER_POWER5_PLUS	(COMMON_USER_PPC64 | PPC_FEATURE_POWER5_PLUS|\
-				 PPC_FEATURE_SMT | PPC_FEATURE_ICACHE_SNOOP)
-#define COMMON_USER_POWER6	(COMMON_USER_PPC64 | PPC_FEATURE_ARCH_2_05 |\
-				 PPC_FEATURE_SMT | PPC_FEATURE_ICACHE_SNOOP | \
-				 PPC_FEATURE_TRUE_LE | \
-				 PPC_FEATURE_PSERIES_PERFMON_COMPAT)
-#define COMMON_USER_POWER7	(COMMON_USER_PPC64 | PPC_FEATURE_ARCH_2_06 |\
-				 PPC_FEATURE_SMT | PPC_FEATURE_ICACHE_SNOOP | \
-				 PPC_FEATURE_TRUE_LE | \
-				 PPC_FEATURE_PSERIES_PERFMON_COMPAT)
-#define COMMON_USER2_POWER7	(PPC_FEATURE2_DSCR)
-#define COMMON_USER_POWER8	(COMMON_USER_PPC64 | PPC_FEATURE_ARCH_2_06 |\
-				 PPC_FEATURE_SMT | PPC_FEATURE_ICACHE_SNOOP | \
-				 PPC_FEATURE_TRUE_LE | \
-				 PPC_FEATURE_PSERIES_PERFMON_COMPAT)
-#define COMMON_USER2_POWER8	(PPC_FEATURE2_ARCH_2_07 | \
-				 PPC_FEATURE2_HTM_COMP | \
-				 PPC_FEATURE2_HTM_NOSC_COMP | \
-				 PPC_FEATURE2_DSCR | \
-				 PPC_FEATURE2_ISEL | PPC_FEATURE2_TAR | \
-				 PPC_FEATURE2_VEC_CRYPTO)
-#define COMMON_USER_PA6T	(COMMON_USER_PPC64 | PPC_FEATURE_PA6T |\
-				 PPC_FEATURE_TRUE_LE | \
-				 PPC_FEATURE_HAS_ALTIVEC_COMP)
-#define COMMON_USER_POWER9	COMMON_USER_POWER8
-#define COMMON_USER2_POWER9	(COMMON_USER2_POWER8 | \
-				 PPC_FEATURE2_ARCH_3_00 | \
-				 PPC_FEATURE2_HAS_IEEE128 | \
-				 PPC_FEATURE2_DARN | \
-				 PPC_FEATURE2_SCV)
-#define COMMON_USER_POWER10	COMMON_USER_POWER9
-#define COMMON_USER2_POWER10	(PPC_FEATURE2_ARCH_3_1 | \
-				 PPC_FEATURE2_MMA | \
-				 PPC_FEATURE2_ARCH_3_00 | \
-				 PPC_FEATURE2_HAS_IEEE128 | \
-				 PPC_FEATURE2_DARN | \
-				 PPC_FEATURE2_SCV | \
-				 PPC_FEATURE2_ARCH_2_07 | \
-				 PPC_FEATURE2_DSCR | \
-				 PPC_FEATURE2_ISEL | PPC_FEATURE2_TAR | \
-				 PPC_FEATURE2_VEC_CRYPTO)
-
-#ifdef CONFIG_PPC_BOOK3E_64
-#define COMMON_USER_BOOKE	(COMMON_USER_PPC64 | PPC_FEATURE_BOOKE)
-#else
-#define COMMON_USER_BOOKE	(PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU | \
-				 PPC_FEATURE_BOOKE)
-#endif
-
-static struct cpu_spec __initdata cpu_specs[] = {
-#ifdef CONFIG_PPC_BOOK3S_64
-	{	/* PPC970 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00390000,
-		.cpu_name		= "PPC970",
-		.cpu_features		= CPU_FTRS_PPC970,
-		.cpu_user_features	= COMMON_USER_POWER4 |
-			PPC_FEATURE_HAS_ALTIVEC_COMP,
-		.mmu_features		= MMU_FTRS_PPC970,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 8,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_ppc970,
-		.cpu_restore		= __restore_cpu_ppc970,
-		.platform		= "ppc970",
-	},
-	{	/* PPC970FX */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x003c0000,
-		.cpu_name		= "PPC970FX",
-		.cpu_features		= CPU_FTRS_PPC970,
-		.cpu_user_features	= COMMON_USER_POWER4 |
-			PPC_FEATURE_HAS_ALTIVEC_COMP,
-		.mmu_features		= MMU_FTRS_PPC970,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 8,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_ppc970,
-		.cpu_restore		= __restore_cpu_ppc970,
-		.platform		= "ppc970",
-	},
-	{	/* PPC970MP DD1.0 - no DEEPNAP, use regular 970 init */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x00440100,
-		.cpu_name		= "PPC970MP",
-		.cpu_features		= CPU_FTRS_PPC970,
-		.cpu_user_features	= COMMON_USER_POWER4 |
-			PPC_FEATURE_HAS_ALTIVEC_COMP,
-		.mmu_features		= MMU_FTRS_PPC970,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 8,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_ppc970,
-		.cpu_restore		= __restore_cpu_ppc970,
-		.platform		= "ppc970",
-	},
-	{	/* PPC970MP */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00440000,
-		.cpu_name		= "PPC970MP",
-		.cpu_features		= CPU_FTRS_PPC970,
-		.cpu_user_features	= COMMON_USER_POWER4 |
-			PPC_FEATURE_HAS_ALTIVEC_COMP,
-		.mmu_features		= MMU_FTRS_PPC970,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 8,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_ppc970MP,
-		.cpu_restore		= __restore_cpu_ppc970,
-		.platform		= "ppc970",
-	},
-	{	/* PPC970GX */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00450000,
-		.cpu_name		= "PPC970GX",
-		.cpu_features		= CPU_FTRS_PPC970,
-		.cpu_user_features	= COMMON_USER_POWER4 |
-			PPC_FEATURE_HAS_ALTIVEC_COMP,
-		.mmu_features		= MMU_FTRS_PPC970,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 8,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_ppc970,
-		.platform		= "ppc970",
-	},
-	{	/* Power5 GR */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x003a0000,
-		.cpu_name		= "POWER5 (gr)",
-		.cpu_features		= CPU_FTRS_POWER5,
-		.cpu_user_features	= COMMON_USER_POWER5,
-		.mmu_features		= MMU_FTRS_POWER5,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.platform		= "power5",
-	},
-	{	/* Power5++ */
-		.pvr_mask		= 0xffffff00,
-		.pvr_value		= 0x003b0300,
-		.cpu_name		= "POWER5+ (gs)",
-		.cpu_features		= CPU_FTRS_POWER5,
-		.cpu_user_features	= COMMON_USER_POWER5_PLUS,
-		.mmu_features		= MMU_FTRS_POWER5,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.platform		= "power5+",
-	},
-	{	/* Power5 GS */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x003b0000,
-		.cpu_name		= "POWER5+ (gs)",
-		.cpu_features		= CPU_FTRS_POWER5,
-		.cpu_user_features	= COMMON_USER_POWER5_PLUS,
-		.mmu_features		= MMU_FTRS_POWER5,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.platform		= "power5+",
-	},
-	{	/* POWER6 in P5+ mode; 2.04-compliant processor */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x0f000001,
-		.cpu_name		= "POWER5+",
-		.cpu_features		= CPU_FTRS_POWER5,
-		.cpu_user_features	= COMMON_USER_POWER5_PLUS,
-		.mmu_features		= MMU_FTRS_POWER5,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.platform		= "power5+",
-	},
-	{	/* Power6 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x003e0000,
-		.cpu_name		= "POWER6 (raw)",
-		.cpu_features		= CPU_FTRS_POWER6,
-		.cpu_user_features	= COMMON_USER_POWER6 |
-			PPC_FEATURE_POWER6_EXT,
-		.mmu_features		= MMU_FTRS_POWER6,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.platform		= "power6x",
-	},
-	{	/* 2.05-compliant processor, i.e. Power6 "architected" mode */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x0f000002,
-		.cpu_name		= "POWER6 (architected)",
-		.cpu_features		= CPU_FTRS_POWER6,
-		.cpu_user_features	= COMMON_USER_POWER6,
-		.mmu_features		= MMU_FTRS_POWER6,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.platform		= "power6",
-	},
-	{	/* 2.06-compliant processor, i.e. Power7 "architected" mode */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x0f000003,
-		.cpu_name		= "POWER7 (architected)",
-		.cpu_features		= CPU_FTRS_POWER7,
-		.cpu_user_features	= COMMON_USER_POWER7,
-		.cpu_user_features2	= COMMON_USER2_POWER7,
-		.mmu_features		= MMU_FTRS_POWER7,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.cpu_setup		= __setup_cpu_power7,
-		.cpu_restore		= __restore_cpu_power7,
-		.machine_check_early	= __machine_check_early_realmode_p7,
-		.platform		= "power7",
-	},
-	{	/* 2.07-compliant processor, i.e. Power8 "architected" mode */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x0f000004,
-		.cpu_name		= "POWER8 (architected)",
-		.cpu_features		= CPU_FTRS_POWER8,
-		.cpu_user_features	= COMMON_USER_POWER8,
-		.cpu_user_features2	= COMMON_USER2_POWER8,
-		.mmu_features		= MMU_FTRS_POWER8,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.cpu_setup		= __setup_cpu_power8,
-		.cpu_restore		= __restore_cpu_power8,
-		.machine_check_early	= __machine_check_early_realmode_p8,
-		.platform		= "power8",
-	},
-	{	/* 3.00-compliant processor, i.e. Power9 "architected" mode */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x0f000005,
-		.cpu_name		= "POWER9 (architected)",
-		.cpu_features		= CPU_FTRS_POWER9,
-		.cpu_user_features	= COMMON_USER_POWER9,
-		.cpu_user_features2	= COMMON_USER2_POWER9,
-		.mmu_features		= MMU_FTRS_POWER9,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.cpu_setup		= __setup_cpu_power9,
-		.cpu_restore		= __restore_cpu_power9,
-		.platform		= "power9",
-	},
-	{	/* 3.1-compliant processor, i.e. Power10 "architected" mode */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x0f000006,
-		.cpu_name		= "POWER10 (architected)",
-		.cpu_features		= CPU_FTRS_POWER10,
-		.cpu_user_features	= COMMON_USER_POWER10,
-		.cpu_user_features2	= COMMON_USER2_POWER10,
-		.mmu_features		= MMU_FTRS_POWER10,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.cpu_setup		= __setup_cpu_power10,
-		.cpu_restore		= __restore_cpu_power10,
-		.platform		= "power10",
-	},
-	{	/* Power7 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x003f0000,
-		.cpu_name		= "POWER7 (raw)",
-		.cpu_features		= CPU_FTRS_POWER7,
-		.cpu_user_features	= COMMON_USER_POWER7,
-		.cpu_user_features2	= COMMON_USER2_POWER7,
-		.mmu_features		= MMU_FTRS_POWER7,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_power7,
-		.cpu_restore		= __restore_cpu_power7,
-		.machine_check_early	= __machine_check_early_realmode_p7,
-		.platform		= "power7",
-	},
-	{	/* Power7+ */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x004A0000,
-		.cpu_name		= "POWER7+ (raw)",
-		.cpu_features		= CPU_FTRS_POWER7,
-		.cpu_user_features	= COMMON_USER_POWER7,
-		.cpu_user_features2	= COMMON_USER2_POWER7,
-		.mmu_features		= MMU_FTRS_POWER7,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_power7,
-		.cpu_restore		= __restore_cpu_power7,
-		.machine_check_early	= __machine_check_early_realmode_p7,
-		.platform		= "power7+",
-	},
-	{	/* Power8E */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x004b0000,
-		.cpu_name		= "POWER8E (raw)",
-		.cpu_features		= CPU_FTRS_POWER8E,
-		.cpu_user_features	= COMMON_USER_POWER8,
-		.cpu_user_features2	= COMMON_USER2_POWER8,
-		.mmu_features		= MMU_FTRS_POWER8,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_power8,
-		.cpu_restore		= __restore_cpu_power8,
-		.machine_check_early	= __machine_check_early_realmode_p8,
-		.platform		= "power8",
-	},
-	{	/* Power8NVL */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x004c0000,
-		.cpu_name		= "POWER8NVL (raw)",
-		.cpu_features		= CPU_FTRS_POWER8,
-		.cpu_user_features	= COMMON_USER_POWER8,
-		.cpu_user_features2	= COMMON_USER2_POWER8,
-		.mmu_features		= MMU_FTRS_POWER8,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_power8,
-		.cpu_restore		= __restore_cpu_power8,
-		.machine_check_early	= __machine_check_early_realmode_p8,
-		.platform		= "power8",
-	},
-	{	/* Power8 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x004d0000,
-		.cpu_name		= "POWER8 (raw)",
-		.cpu_features		= CPU_FTRS_POWER8,
-		.cpu_user_features	= COMMON_USER_POWER8,
-		.cpu_user_features2	= COMMON_USER2_POWER8,
-		.mmu_features		= MMU_FTRS_POWER8,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_power8,
-		.cpu_restore		= __restore_cpu_power8,
-		.machine_check_early	= __machine_check_early_realmode_p8,
-		.platform		= "power8",
-	},
-	{	/* Power9 DD2.0 */
-		.pvr_mask		= 0xffffefff,
-		.pvr_value		= 0x004e0200,
-		.cpu_name		= "POWER9 (raw)",
-		.cpu_features		= CPU_FTRS_POWER9_DD2_0,
-		.cpu_user_features	= COMMON_USER_POWER9,
-		.cpu_user_features2	= COMMON_USER2_POWER9,
-		.mmu_features		= MMU_FTRS_POWER9,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_power9,
-		.cpu_restore		= __restore_cpu_power9,
-		.machine_check_early	= __machine_check_early_realmode_p9,
-		.platform		= "power9",
-	},
-	{	/* Power9 DD 2.1 */
-		.pvr_mask		= 0xffffefff,
-		.pvr_value		= 0x004e0201,
-		.cpu_name		= "POWER9 (raw)",
-		.cpu_features		= CPU_FTRS_POWER9_DD2_1,
-		.cpu_user_features	= COMMON_USER_POWER9,
-		.cpu_user_features2	= COMMON_USER2_POWER9,
-		.mmu_features		= MMU_FTRS_POWER9,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_power9,
-		.cpu_restore		= __restore_cpu_power9,
-		.machine_check_early	= __machine_check_early_realmode_p9,
-		.platform		= "power9",
-	},
-	{	/* Power9 DD2.2 */
-		.pvr_mask		= 0xffffefff,
-		.pvr_value		= 0x004e0202,
-		.cpu_name		= "POWER9 (raw)",
-		.cpu_features		= CPU_FTRS_POWER9_DD2_2,
-		.cpu_user_features	= COMMON_USER_POWER9,
-		.cpu_user_features2	= COMMON_USER2_POWER9,
-		.mmu_features		= MMU_FTRS_POWER9,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_power9,
-		.cpu_restore		= __restore_cpu_power9,
-		.machine_check_early	= __machine_check_early_realmode_p9,
-		.platform		= "power9",
-	},
-	{	/* Power9 DD2.3 or later */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x004e0000,
-		.cpu_name		= "POWER9 (raw)",
-		.cpu_features		= CPU_FTRS_POWER9_DD2_3,
-		.cpu_user_features	= COMMON_USER_POWER9,
-		.cpu_user_features2	= COMMON_USER2_POWER9,
-		.mmu_features		= MMU_FTRS_POWER9,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_power9,
-		.cpu_restore		= __restore_cpu_power9,
-		.machine_check_early	= __machine_check_early_realmode_p9,
-		.platform		= "power9",
-	},
-	{	/* Power10 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00800000,
-		.cpu_name		= "POWER10 (raw)",
-		.cpu_features		= CPU_FTRS_POWER10,
-		.cpu_user_features	= COMMON_USER_POWER10,
-		.cpu_user_features2	= COMMON_USER2_POWER10,
-		.mmu_features		= MMU_FTRS_POWER10,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_power10,
-		.cpu_restore		= __restore_cpu_power10,
-		.machine_check_early	= __machine_check_early_realmode_p10,
-		.platform		= "power10",
-	},
-	{	/* Cell Broadband Engine */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00700000,
-		.cpu_name		= "Cell Broadband Engine",
-		.cpu_features		= CPU_FTRS_CELL,
-		.cpu_user_features	= COMMON_USER_PPC64 |
-			PPC_FEATURE_CELL | PPC_FEATURE_HAS_ALTIVEC_COMP |
-			PPC_FEATURE_SMT,
-		.mmu_features		= MMU_FTRS_CELL,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_IBM,
-		.platform		= "ppc-cell-be",
-	},
-	{	/* PA Semi PA6T */
-		.pvr_mask		= 0x7fff0000,
-		.pvr_value		= 0x00900000,
-		.cpu_name		= "PA6T",
-		.cpu_features		= CPU_FTRS_PA6T,
-		.cpu_user_features	= COMMON_USER_PA6T,
-		.mmu_features		= MMU_FTRS_PA6T,
-		.icache_bsize		= 64,
-		.dcache_bsize		= 64,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_PA6T,
-		.cpu_setup		= __setup_cpu_pa6t,
-		.cpu_restore		= __restore_cpu_pa6t,
-		.platform		= "pa6t",
-	},
-	{	/* default match */
-		.pvr_mask		= 0x00000000,
-		.pvr_value		= 0x00000000,
-		.cpu_name		= "POWER5 (compatible)",
-		.cpu_features		= CPU_FTRS_COMPATIBLE,
-		.cpu_user_features	= COMMON_USER_PPC64,
-		.mmu_features		= MMU_FTRS_POWER,
-		.icache_bsize		= 128,
-		.dcache_bsize		= 128,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_IBM,
-		.platform		= "power5",
-	}
-#endif	/* CONFIG_PPC_BOOK3S_64 */
-
-#ifdef CONFIG_PPC32
-#ifdef CONFIG_PPC_BOOK3S_32
-#ifdef CONFIG_PPC_BOOK3S_604
-	{	/* 604 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00040000,
-		.cpu_name		= "604",
-		.cpu_features		= CPU_FTRS_604,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 2,
-		.cpu_setup		= __setup_cpu_604,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc604",
-	},
-	{	/* 604e */
-		.pvr_mask		= 0xfffff000,
-		.pvr_value		= 0x00090000,
-		.cpu_name		= "604e",
-		.cpu_features		= CPU_FTRS_604,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.cpu_setup		= __setup_cpu_604,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc604",
-	},
-	{	/* 604r */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00090000,
-		.cpu_name		= "604r",
-		.cpu_features		= CPU_FTRS_604,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.cpu_setup		= __setup_cpu_604,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc604",
-	},
-	{	/* 604ev */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x000a0000,
-		.cpu_name		= "604ev",
-		.cpu_features		= CPU_FTRS_604,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.cpu_setup		= __setup_cpu_604,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc604",
-	},
-	{	/* 740/750 (0x4202, don't support TAU ?) */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x00084202,
-		.cpu_name		= "740/750",
-		.cpu_features		= CPU_FTRS_740_NOTAU,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.cpu_setup		= __setup_cpu_750,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 750CX (80100 and 8010x?) */
-		.pvr_mask		= 0xfffffff0,
-		.pvr_value		= 0x00080100,
-		.cpu_name		= "750CX",
-		.cpu_features		= CPU_FTRS_750,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.cpu_setup		= __setup_cpu_750cx,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 750CX (82201 and 82202) */
-		.pvr_mask		= 0xfffffff0,
-		.pvr_value		= 0x00082200,
-		.cpu_name		= "750CX",
-		.cpu_features		= CPU_FTRS_750,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_750cx,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 750CXe (82214) */
-		.pvr_mask		= 0xfffffff0,
-		.pvr_value		= 0x00082210,
-		.cpu_name		= "750CXe",
-		.cpu_features		= CPU_FTRS_750,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_750cx,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 750CXe "Gekko" (83214) */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x00083214,
-		.cpu_name		= "750CXe",
-		.cpu_features		= CPU_FTRS_750,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_750cx,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 750CL (and "Broadway") */
-		.pvr_mask		= 0xfffff0e0,
-		.pvr_value		= 0x00087000,
-		.cpu_name		= "750CL",
-		.cpu_features		= CPU_FTRS_750CL,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_750,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 745/755 */
-		.pvr_mask		= 0xfffff000,
-		.pvr_value		= 0x00083000,
-		.cpu_name		= "745/755",
-		.cpu_features		= CPU_FTRS_750,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_750,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 750FX rev 1.x */
-		.pvr_mask		= 0xffffff00,
-		.pvr_value		= 0x70000100,
-		.cpu_name		= "750FX",
-		.cpu_features		= CPU_FTRS_750FX1,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_750,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 750FX rev 2.0 must disable HID0[DPM] */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x70000200,
-		.cpu_name		= "750FX",
-		.cpu_features		= CPU_FTRS_750FX2,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_750,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 750FX (All revs except 2.0) */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x70000000,
-		.cpu_name		= "750FX",
-		.cpu_features		= CPU_FTRS_750FX,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_750fx,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 750GX */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x70020000,
-		.cpu_name		= "750GX",
-		.cpu_features		= CPU_FTRS_750GX,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_750fx,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 740/750 (L2CR bit need fixup for 740) */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00080000,
-		.cpu_name		= "740/750",
-		.cpu_features		= CPU_FTRS_740,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_IBM,
-		.cpu_setup		= __setup_cpu_750,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc750",
-	},
-	{	/* 7400 rev 1.1 ? (no TAU) */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x000c1101,
-		.cpu_name		= "7400 (1.1)",
-		.cpu_features		= CPU_FTRS_7400_NOTAU,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_7400,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7400",
-	},
-	{	/* 7400 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x000c0000,
-		.cpu_name		= "7400",
-		.cpu_features		= CPU_FTRS_7400,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_7400,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7400",
-	},
-	{	/* 7410 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x800c0000,
-		.cpu_name		= "7410",
-		.cpu_features		= CPU_FTRS_7400,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 4,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_7410,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7400",
-	},
-	{	/* 7450 2.0 - no doze/nap */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x80000200,
-		.cpu_name		= "7450",
-		.cpu_features		= CPU_FTRS_7450_20,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7450",
-	},
-	{	/* 7450 2.1 */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x80000201,
-		.cpu_name		= "7450",
-		.cpu_features		= CPU_FTRS_7450_21,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7450",
-	},
-	{	/* 7450 2.3 and newer */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x80000000,
-		.cpu_name		= "7450",
-		.cpu_features		= CPU_FTRS_7450_23,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7450",
-	},
-	{	/* 7455 rev 1.x */
-		.pvr_mask		= 0xffffff00,
-		.pvr_value		= 0x80010100,
-		.cpu_name		= "7455",
-		.cpu_features		= CPU_FTRS_7455_1,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7450",
-	},
-	{	/* 7455 rev 2.0 */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x80010200,
-		.cpu_name		= "7455",
-		.cpu_features		= CPU_FTRS_7455_20,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7450",
-	},
-	{	/* 7455 others */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x80010000,
-		.cpu_name		= "7455",
-		.cpu_features		= CPU_FTRS_7455,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7450",
-	},
-	{	/* 7447/7457 Rev 1.0 */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x80020100,
-		.cpu_name		= "7447/7457",
-		.cpu_features		= CPU_FTRS_7447_10,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7450",
-	},
-	{	/* 7447/7457 Rev 1.1 */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x80020101,
-		.cpu_name		= "7447/7457",
-		.cpu_features		= CPU_FTRS_7447_10,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7450",
-	},
-	{	/* 7447/7457 Rev 1.2 and later */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x80020000,
-		.cpu_name		= "7447/7457",
-		.cpu_features		= CPU_FTRS_7447,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7450",
-	},
-	{	/* 7447A */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x80030000,
-		.cpu_name		= "7447A",
-		.cpu_features		= CPU_FTRS_7447A,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7450",
-	},
-	{	/* 7448 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x80040000,
-		.cpu_name		= "7448",
-		.cpu_features		= CPU_FTRS_7448,
-		.cpu_user_features	= COMMON_USER |
-			PPC_FEATURE_HAS_ALTIVEC_COMP | PPC_FEATURE_PPC_LE,
-		.mmu_features		= MMU_FTR_HPTE_TABLE | MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.num_pmcs		= 6,
-		.pmc_type		= PPC_PMC_G4,
-		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc7450",
-	},
-#endif /* CONFIG_PPC_BOOK3S_604 */
-#ifdef CONFIG_PPC_BOOK3S_603
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
-	{	/* 82xx (8240, 8245, 8260 are all 603e cores) */
-		.pvr_mask		= 0x7fff0000,
-		.pvr_value		= 0x00810000,
-		.cpu_name		= "82xx",
-		.cpu_features		= CPU_FTRS_82XX,
-		.cpu_user_features	= COMMON_USER,
-		.mmu_features		= 0,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc603",
-	},
-	{	/* All G2_LE (603e core, plus some) have the same pvr */
-		.pvr_mask		= 0x7fff0000,
-		.pvr_value		= 0x00820000,
-		.cpu_name		= "G2_LE",
-		.cpu_features		= CPU_FTRS_G2_LE,
-		.cpu_user_features	= COMMON_USER,
-		.mmu_features		= MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc603",
-	},
-#ifdef CONFIG_PPC_83xx
-	{	/* e300c1 (a 603e core, plus some) on 83xx */
-		.pvr_mask		= 0x7fff0000,
-		.pvr_value		= 0x00830000,
-		.cpu_name		= "e300c1",
-		.cpu_features		= CPU_FTRS_E300,
-		.cpu_user_features	= COMMON_USER,
-		.mmu_features		= MMU_FTR_USE_HIGH_BATS,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_83xx,
-		.platform		= "ppc603",
-	},
-	{	/* e300c2 (an e300c1 core, plus some, minus FPU) on 83xx */
-		.pvr_mask		= 0x7fff0000,
-		.pvr_value		= 0x00840000,
-		.cpu_name		= "e300c2",
-		.cpu_features		= CPU_FTRS_E300C2,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
-		.mmu_features		= MMU_FTR_USE_HIGH_BATS |
-			MMU_FTR_NEED_DTLB_SW_LRU,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_83xx,
-		.platform		= "ppc603",
-	},
-	{	/* e300c3 (e300c1, plus one IU, half cache size) on 83xx */
-		.pvr_mask		= 0x7fff0000,
-		.pvr_value		= 0x00850000,
-		.cpu_name		= "e300c3",
-		.cpu_features		= CPU_FTRS_E300,
-		.cpu_user_features	= COMMON_USER,
-		.mmu_features		= MMU_FTR_USE_HIGH_BATS |
-			MMU_FTR_NEED_DTLB_SW_LRU,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_83xx,
-		.num_pmcs		= 4,
-		.platform		= "ppc603",
-	},
-	{	/* e300c4 (e300c1, plus one IU) */
-		.pvr_mask		= 0x7fff0000,
-		.pvr_value		= 0x00860000,
-		.cpu_name		= "e300c4",
-		.cpu_features		= CPU_FTRS_E300,
-		.cpu_user_features	= COMMON_USER,
-		.mmu_features		= MMU_FTR_USE_HIGH_BATS |
-			MMU_FTR_NEED_DTLB_SW_LRU,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_83xx,
-		.num_pmcs		= 4,
-		.platform		= "ppc603",
-	},
-#endif
-#endif /* CONFIG_PPC_BOOK3S_603 */
-#ifdef CONFIG_PPC_BOOK3S_604
-	{	/* default match, we assume split I/D cache & TB (non-601)... */
-		.pvr_mask		= 0x00000000,
-		.pvr_value		= 0x00000000,
-		.cpu_name		= "(generic PPC)",
-		.cpu_features		= CPU_FTRS_CLASSIC32,
-		.cpu_user_features	= COMMON_USER,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc603",
-	},
-#endif /* CONFIG_PPC_BOOK3S_604 */
-#endif /* CONFIG_PPC_BOOK3S_32 */
-#ifdef CONFIG_PPC_8xx
-	{	/* 8xx */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= PVR_8xx,
-		.cpu_name		= "8xx",
-		/* CPU_FTR_MAYBE_CAN_DOZE is possible,
-		 * if the 8xx code is there.... */
-		.cpu_features		= CPU_FTRS_8XX,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
-		.mmu_features		= MMU_FTR_TYPE_8xx,
-		.icache_bsize		= 16,
-		.dcache_bsize		= 16,
-		.machine_check		= machine_check_8xx,
-		.platform		= "ppc823",
-	},
-#endif /* CONFIG_PPC_8xx */
-#ifdef CONFIG_40x
-	{	/* STB 04xxx */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41810000,
-		.cpu_name		= "STB04xxx",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* NP405L */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41610000,
-		.cpu_name		= "NP405L",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* NP4GS3 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x40B10000,
-		.cpu_name		= "NP4GS3",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{   /* NP405H */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41410000,
-		.cpu_name		= "NP405H",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405GPr */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x50910000,
-		.cpu_name		= "405GPr",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{   /* STBx25xx */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x51510000,
-		.cpu_name		= "STBx25xx",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405LP */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41F10000,
-		.cpu_name		= "405LP",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EP */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x51210000,
-		.cpu_name		= "405EP",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. A/B with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910007,
-		.cpu_name		= "405EX Rev. A/B",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. C without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x1291000d,
-		.cpu_name		= "405EX Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. C with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x1291000f,
-		.cpu_name		= "405EX Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. D without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910003,
-		.cpu_name		= "405EX Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. D with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910005,
-		.cpu_name		= "405EX Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. A/B without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910001,
-		.cpu_name		= "405EXr Rev. A/B",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. C without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910009,
-		.cpu_name		= "405EXr Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. C with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x1291000b,
-		.cpu_name		= "405EXr Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. D without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910000,
-		.cpu_name		= "405EXr Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. D with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910002,
-		.cpu_name		= "405EXr Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{
-		/* 405EZ */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41510000,
-		.cpu_name		= "405EZ",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* APM8018X */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x7ff11432,
-		.cpu_name		= "APM8018X",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* default match */
-		.pvr_mask		= 0x00000000,
-		.pvr_value		= 0x00000000,
-		.cpu_name		= "(generic 40x PPC)",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	}
-
-#endif /* CONFIG_40x */
-#ifdef CONFIG_44x
-#ifndef CONFIG_PPC_47x
-	{
-		.pvr_mask		= 0xf0000fff,
-		.pvr_value		= 0x40000850,
-		.cpu_name		= "440GR Rev. A",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc440",
-	},
-	{ /* Use logical PVR for 440EP (logical pvr = pvr | 0x8) */
-		.pvr_mask		= 0xf0000fff,
-		.pvr_value		= 0x40000858,
-		.cpu_name		= "440EP Rev. A",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_440ep,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc440",
-	},
-	{
-		.pvr_mask		= 0xf0000fff,
-		.pvr_value		= 0x400008d3,
-		.cpu_name		= "440GR Rev. B",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc440",
-	},
-	{ /* Matches both physical and logical PVR for 440EP (logical pvr = pvr | 0x8) */
-		.pvr_mask		= 0xf0000ff7,
-		.pvr_value		= 0x400008d4,
-		.cpu_name		= "440EP Rev. C",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_440ep,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc440",
-	},
-	{ /* Use logical PVR for 440EP (logical pvr = pvr | 0x8) */
-		.pvr_mask		= 0xf0000fff,
-		.pvr_value		= 0x400008db,
-		.cpu_name		= "440EP Rev. B",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_440ep,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc440",
-	},
-	{ /* 440GRX */
-		.pvr_mask		= 0xf0000ffb,
-		.pvr_value		= 0x200008D0,
-		.cpu_name		= "440GRX",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_440grx,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{ /* Use logical PVR for 440EPx (logical pvr = pvr | 0x8) */
-		.pvr_mask		= 0xf0000ffb,
-		.pvr_value		= 0x200008D8,
-		.cpu_name		= "440EPX",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_440epx,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{	/* 440GP Rev. B */
-		.pvr_mask		= 0xf0000fff,
-		.pvr_value		= 0x40000440,
-		.cpu_name		= "440GP Rev. B",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc440gp",
-	},
-	{	/* 440GP Rev. C */
-		.pvr_mask		= 0xf0000fff,
-		.pvr_value		= 0x40000481,
-		.cpu_name		= "440GP Rev. C",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc440gp",
-	},
-	{ /* 440GX Rev. A */
-		.pvr_mask		= 0xf0000fff,
-		.pvr_value		= 0x50000850,
-		.cpu_name		= "440GX Rev. A",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_440gx,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{ /* 440GX Rev. B */
-		.pvr_mask		= 0xf0000fff,
-		.pvr_value		= 0x50000851,
-		.cpu_name		= "440GX Rev. B",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_440gx,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{ /* 440GX Rev. C */
-		.pvr_mask		= 0xf0000fff,
-		.pvr_value		= 0x50000892,
-		.cpu_name		= "440GX Rev. C",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_440gx,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{ /* 440GX Rev. F */
-		.pvr_mask		= 0xf0000fff,
-		.pvr_value		= 0x50000894,
-		.cpu_name		= "440GX Rev. F",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_440gx,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{ /* 440SP Rev. A */
-		.pvr_mask		= 0xfff00fff,
-		.pvr_value		= 0x53200891,
-		.cpu_name		= "440SP Rev. A",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc440",
-	},
-	{ /* 440SPe Rev. A */
-		.pvr_mask               = 0xfff00fff,
-		.pvr_value              = 0x53400890,
-		.cpu_name               = "440SPe Rev. A",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features      = COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize           = 32,
-		.dcache_bsize           = 32,
-		.cpu_setup		= __setup_cpu_440spe,
-		.machine_check		= machine_check_440A,
-		.platform               = "ppc440",
-	},
-	{ /* 440SPe Rev. B */
-		.pvr_mask		= 0xfff00fff,
-		.pvr_value		= 0x53400891,
-		.cpu_name		= "440SPe Rev. B",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_440spe,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{ /* 460EX */
-		.pvr_mask		= 0xffff0006,
-		.pvr_value		= 0x13020002,
-		.cpu_name		= "460EX",
-		.cpu_features		= CPU_FTRS_440x6,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_460ex,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{ /* 460EX Rev B */
-		.pvr_mask		= 0xffff0007,
-		.pvr_value		= 0x13020004,
-		.cpu_name		= "460EX Rev. B",
-		.cpu_features		= CPU_FTRS_440x6,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_460ex,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{ /* 460GT */
-		.pvr_mask		= 0xffff0006,
-		.pvr_value		= 0x13020000,
-		.cpu_name		= "460GT",
-		.cpu_features		= CPU_FTRS_440x6,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_460gt,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{ /* 460GT Rev B */
-		.pvr_mask		= 0xffff0007,
-		.pvr_value		= 0x13020005,
-		.cpu_name		= "460GT Rev. B",
-		.cpu_features		= CPU_FTRS_440x6,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_460gt,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{ /* 460SX */
-		.pvr_mask		= 0xffffff00,
-		.pvr_value		= 0x13541800,
-		.cpu_name		= "460SX",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_460sx,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{ /* 464 in APM821xx */
-		.pvr_mask		= 0xfffffff0,
-		.pvr_value		= 0x12C41C80,
-		.cpu_name		= "APM821XX",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE |
-			PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_apm821xx,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
-	{	/* default match */
-		.pvr_mask		= 0x00000000,
-		.pvr_value		= 0x00000000,
-		.cpu_name		= "(generic 44x PPC)",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc440",
-	}
-#else /* CONFIG_PPC_47x */
-	{ /* 476 DD2 core */
-		.pvr_mask		= 0xffffffff,
-		.pvr_value		= 0x11a52080,
-		.cpu_name		= "476",
-		.cpu_features		= CPU_FTRS_47X | CPU_FTR_476_DD2,
-		.cpu_user_features	= COMMON_USER_BOOKE |
-			PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_47x |
-			MMU_FTR_USE_TLBIVAX_BCAST | MMU_FTR_LOCK_BCAST_INVAL,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 128,
-		.machine_check		= machine_check_47x,
-		.platform		= "ppc470",
-	},
-	{ /* 476fpe */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x7ff50000,
-		.cpu_name		= "476fpe",
-		.cpu_features		= CPU_FTRS_47X | CPU_FTR_476_DD2,
-		.cpu_user_features	= COMMON_USER_BOOKE |
-			PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_47x |
-			MMU_FTR_USE_TLBIVAX_BCAST | MMU_FTR_LOCK_BCAST_INVAL,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 128,
-		.machine_check		= machine_check_47x,
-		.platform		= "ppc470",
-	},
-	{ /* 476 iss */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00050000,
-		.cpu_name		= "476",
-		.cpu_features		= CPU_FTRS_47X,
-		.cpu_user_features	= COMMON_USER_BOOKE |
-			PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_47x |
-			MMU_FTR_USE_TLBIVAX_BCAST | MMU_FTR_LOCK_BCAST_INVAL,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 128,
-		.machine_check		= machine_check_47x,
-		.platform		= "ppc470",
-	},
-	{ /* 476 others */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x11a50000,
-		.cpu_name		= "476",
-		.cpu_features		= CPU_FTRS_47X,
-		.cpu_user_features	= COMMON_USER_BOOKE |
-			PPC_FEATURE_HAS_FPU,
-		.mmu_features		= MMU_FTR_TYPE_47x |
-			MMU_FTR_USE_TLBIVAX_BCAST | MMU_FTR_LOCK_BCAST_INVAL,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 128,
-		.machine_check		= machine_check_47x,
-		.platform		= "ppc470",
-	},
-	{	/* default match */
-		.pvr_mask		= 0x00000000,
-		.pvr_value		= 0x00000000,
-		.cpu_name		= "(generic 47x PPC)",
-		.cpu_features		= CPU_FTRS_47X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_47x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 128,
-		.machine_check		= machine_check_47x,
-		.platform		= "ppc470",
-	}
-#endif /* CONFIG_PPC_47x */
-#endif /* CONFIG_44x */
-#endif /* CONFIG_PPC32 */
-#ifdef CONFIG_E500
-#ifdef CONFIG_PPC32
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
-	{	/* e500mc */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x80230000,
-		.cpu_name		= "e500mc",
-		.cpu_features		= CPU_FTRS_E500MC,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
-		.cpu_user_features2	= PPC_FEATURE2_ISEL,
-		.mmu_features		= MMU_FTR_TYPE_FSL_E | MMU_FTR_BIG_PHYS |
-			MMU_FTR_USE_TLBILX,
-		.icache_bsize		= 64,
-		.dcache_bsize		= 64,
-		.num_pmcs		= 4,
-		.cpu_setup		= __setup_cpu_e500mc,
-		.machine_check		= machine_check_e500mc,
-		.platform		= "ppce500mc",
-		.cpu_down_flush		= cpu_down_flush_e500mc,
-	},
-#endif /* CONFIG_PPC_E500MC */
-#endif /* CONFIG_PPC32 */
-#ifdef CONFIG_PPC_E500MC
-	{	/* e5500 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x80240000,
-		.cpu_name		= "e5500",
-		.cpu_features		= CPU_FTRS_E5500,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU,
-		.cpu_user_features2	= PPC_FEATURE2_ISEL,
-		.mmu_features		= MMU_FTR_TYPE_FSL_E | MMU_FTR_BIG_PHYS |
-			MMU_FTR_USE_TLBILX,
-		.icache_bsize		= 64,
-		.dcache_bsize		= 64,
-		.num_pmcs		= 4,
-		.cpu_setup		= __setup_cpu_e5500,
-#ifndef CONFIG_PPC32
-		.cpu_restore		= __restore_cpu_e5500,
-#endif
-		.machine_check		= machine_check_e500mc,
-		.platform		= "ppce5500",
-		.cpu_down_flush		= cpu_down_flush_e5500,
-	},
-	{	/* e6500 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x80400000,
-		.cpu_name		= "e6500",
-		.cpu_features		= CPU_FTRS_E6500,
-		.cpu_user_features	= COMMON_USER_BOOKE | PPC_FEATURE_HAS_FPU |
-			PPC_FEATURE_HAS_ALTIVEC_COMP,
-		.cpu_user_features2	= PPC_FEATURE2_ISEL,
-		.mmu_features		= MMU_FTR_TYPE_FSL_E | MMU_FTR_BIG_PHYS |
-			MMU_FTR_USE_TLBILX,
-		.icache_bsize		= 64,
-		.dcache_bsize		= 64,
-		.num_pmcs		= 6,
-		.cpu_setup		= __setup_cpu_e6500,
-#ifndef CONFIG_PPC32
-		.cpu_restore		= __restore_cpu_e6500,
-#endif
-		.machine_check		= machine_check_e500mc,
-		.platform		= "ppce6500",
-		.cpu_down_flush		= cpu_down_flush_e6500,
-	},
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
-#endif /* CONFIG_E500 */
-};
+#include "cpu_specs.h"
 
 void __init set_cur_cpu_spec(struct cpu_spec *s)
 {
-- 
2.37.1

