Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC692CEBED
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 11:13:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnT720pTjzDrVx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 21:13:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnT5D2Fh9zDqwF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 21:11:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CnT524VMDz9v9xH;
 Fri,  4 Dec 2020 11:11:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Q1aCUZxw5Ing; Fri,  4 Dec 2020 11:11:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CnT523dhPz9v9xF;
 Fri,  4 Dec 2020 11:11:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B11C18B7FF;
 Fri,  4 Dec 2020 11:11:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DMQ1PCotY_Z6; Fri,  4 Dec 2020 11:11:35 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6B4188B75E;
 Fri,  4 Dec 2020 11:11:35 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DB8A866914; Fri,  4 Dec 2020 10:11:34 +0000 (UTC)
Message-Id: <b2f71f39eca543f1e4ec06596f09a8b12235c701.1607076683.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/8xx: Fix early debug when SMC1 is relocated
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  4 Dec 2020 10:11:34 +0000 (UTC)
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

When SMC1 is relocated and early debug is selected, the
board hangs is ppc_md.setup_arch(). This is because ones
the microcode has been loaded and SMC1 relocated, early
debug writes in the weed.

To allow smooth continuation, the SMC1 parameter RAM set up
by the bootloader have to be copied into the new location.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: 43db76f41824 ("powerpc/8xx: Add microcode patch to move SMC parameter RAM.")
Cc: stable@vger.kernel.org
---
 arch/powerpc/include/asm/cpm1.h         |  1 +
 arch/powerpc/platforms/8xx/micropatch.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/powerpc/include/asm/cpm1.h b/arch/powerpc/include/asm/cpm1.h
index a116fe931789..3bdd74739cb8 100644
--- a/arch/powerpc/include/asm/cpm1.h
+++ b/arch/powerpc/include/asm/cpm1.h
@@ -68,6 +68,7 @@ extern void cpm_reset(void);
 #define PROFF_SPI	((uint)0x0180)
 #define PROFF_SCC3	((uint)0x0200)
 #define PROFF_SMC1	((uint)0x0280)
+#define PROFF_DSP1	((uint)0x02c0)
 #define PROFF_SCC4	((uint)0x0300)
 #define PROFF_SMC2	((uint)0x0380)
 
diff --git a/arch/powerpc/platforms/8xx/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
index aed4bc75f352..aef179fcbd4f 100644
--- a/arch/powerpc/platforms/8xx/micropatch.c
+++ b/arch/powerpc/platforms/8xx/micropatch.c
@@ -360,6 +360,17 @@ void __init cpm_load_patch(cpm8xx_t *cp)
 	if (IS_ENABLED(CONFIG_SMC_UCODE_PATCH)) {
 		smc_uart_t *smp;
 
+		if (IS_ENABLED(CONFIG_PPC_EARLY_DEBUG_CPM)) {
+			int i;
+
+			for (i = 0; i < sizeof(*smp); i += 4) {
+				u32 __iomem *src = (u32 __iomem *)&cp->cp_dparam[PROFF_SMC1 + i];
+				u32 __iomem *dst = (u32 __iomem *)&cp->cp_dparam[PROFF_DSP1 + i];
+
+				out_be32(dst, in_be32(src));
+			}
+		}
+
 		smp = (smc_uart_t *)&cp->cp_dparam[PROFF_SMC1];
 		out_be16(&smp->smc_rpbase, 0x1ec0);
 		smp = (smc_uart_t *)&cp->cp_dparam[PROFF_SMC2];
-- 
2.25.0

