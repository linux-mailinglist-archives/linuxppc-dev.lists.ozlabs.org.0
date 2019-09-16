Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB4B34CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 08:45:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WxZ757JtzDrWX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 16:45:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="XWXYRC5Z"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WxWs2PxSzDqMC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 16:43:02 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46WxWc29kNz9ttmj;
 Mon, 16 Sep 2019 08:42:52 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XWXYRC5Z; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dbspjtamatqG; Mon, 16 Sep 2019 08:42:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46WxWc13hZz9ttgK;
 Mon, 16 Sep 2019 08:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568616172; bh=iy5pWcaxPfj+RFVUzMwPR2y2giOotlzyIsxHa+QXuoE=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=XWXYRC5Z26xvcIVt4llblpG3rJJHthVQpI+evksAXJ7+3bzafo4dV3xi409I5F3o/
 sVCIAlJmARSPvFUiofSSp48KkM7KkSPy+ygHfRIaNg5vxj/k0Ki1XVo35UL9m2p5R8
 teZavv5jhsNNmFU8Ew06CARExKEprDybHK1wxon4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BD0188B7CA;
 Mon, 16 Sep 2019 08:42:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3LJc_fR88cfm; Mon, 16 Sep 2019 08:42:56 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 899098B752;
 Mon, 16 Sep 2019 08:42:56 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 510736B763; Mon, 16 Sep 2019 06:42:56 +0000 (UTC)
Message-Id: <7f8f9747ef1ab2e1261cf83b03c1da321d47f7b7.1568616151.git.christophe.leroy@c-s.fr>
In-Reply-To: <966e6d6a226f9786098d296239a6c65064e73a41.1568616151.git.christophe.leroy@c-s.fr>
References: <966e6d6a226f9786098d296239a6c65064e73a41.1568616151.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 2/2] powerpc/83xx: map IMMR with a BAT.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 oss@buserror.net, galak@kernel.crashing.org
Date: Mon, 16 Sep 2019 06:42:56 +0000 (UTC)
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

On mpc83xx with a QE, IMMR is 2Mbytes and aligned on 2Mbytes boundarie.
On mpc83xx without a QE, IMMR is 1Mbyte and 1Mbyte aligned.

Each driver will map a part of it to access the registers it needs.
Some drivers will map the same part of IMMR as other drivers.

In order to reduce TLB misses, map the full IMMR with a BAT. If it is
2Mbytes aligned, map 2Mbytes. If there is no QE, the upper part will
remain unused, but it doesn't harm as it is mapped as guarded memory.

When the IMMR is not aligned on a 2Mbytes boundarie, only map 1Mbyte.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v2:
- use a fixmap area instead of playing with ioremap_bot
- always map 2M unless IMMRBAR is only 1M aligned
---
 arch/powerpc/include/asm/fixmap.h  |  8 ++++++++
 arch/powerpc/platforms/83xx/misc.c | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
index 0cfc365d814b..79c3aa55f43d 100644
--- a/arch/powerpc/include/asm/fixmap.h
+++ b/arch/powerpc/include/asm/fixmap.h
@@ -15,6 +15,7 @@
 #define _ASM_FIXMAP_H
 
 #ifndef __ASSEMBLY__
+#include <linux/sizes.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
 #ifdef CONFIG_HIGHMEM
@@ -63,6 +64,13 @@ enum fixed_addresses {
 	FIX_IMMR_BASE = __ALIGN_MASK(FIX_IMMR_START, FIX_IMMR_SIZE - 1) - 1 +
 		       FIX_IMMR_SIZE,
 #endif
+#ifdef CONFIG_PPC_83xx
+	/* For IMMR we need an aligned 2M area */
+#define FIX_IMMR_SIZE	(SZ_2M / PAGE_SIZE)
+	FIX_IMMR_START,
+	FIX_IMMR_BASE = __ALIGN_MASK(FIX_IMMR_START, FIX_IMMR_SIZE - 1) - 1 +
+		       FIX_IMMR_SIZE,
+#endif
 	/* FIX_PCIE_MCFG, */
 	__end_of_fixed_addresses
 };
diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index f46d7bf3b140..d08216e2002d 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -18,6 +18,8 @@
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
 
+#include <mm/mmu_decl.h>
+
 #include "mpc83xx.h"
 
 static __be32 __iomem *restart_reg_base;
@@ -145,6 +147,15 @@ void __init mpc83xx_setup_arch(void)
 	if (ppc_md.progress)
 		ppc_md.progress("mpc83xx_setup_arch()", 0);
 
+	if (!__map_without_bats) {
+		phys_addr_t immrbase = get_immrbase();
+		int immrsize = IS_ALIGNED(immrbase, SZ_2M) ? SZ_2M : SZ_1M;
+		unsigned long va = __fix_to_virt(FIX_IMMR_BASE);
+
+		setbat(-1, va, immrbase, immrsize, PAGE_KERNEL_NCG);
+		update_bats();
+	}
+
 	mpc83xx_setup_pci();
 }
 
-- 
2.13.3

