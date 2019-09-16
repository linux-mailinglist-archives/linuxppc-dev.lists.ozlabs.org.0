Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2818B41DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 22:30:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XHtX11RtzF3WQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 06:30:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="GeOASGPe"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XHn64t0VzF3N6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 06:25:46 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46XHn30mqMz9v0sm;
 Mon, 16 Sep 2019 22:25:43 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=GeOASGPe; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id caM0nXs_la48; Mon, 16 Sep 2019 22:25:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46XHn26pQMz9v0sn;
 Mon, 16 Sep 2019 22:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568665542; bh=ReKMsxaHbWDh83WstmbL6OR0Dxw309zsyYpUY0QqQDw=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=GeOASGPeskq2BaIMfsha+TKj7cqHYUDyf0RK3dDXJ2rWcqvpf4CV1Uobufr+YRNto
 Ct+4lzQAotHjmkDiyD8Q7C+PaFijq9h6m5b6GvRMLgw8UFtL89SLJy2+1GuUYxJReV
 7YErUG4p8848fyTNzIA173Thqf1RvTITa/Z7gaPM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F0248B841;
 Mon, 16 Sep 2019 22:25:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id b4B1RfBIUNYT; Mon, 16 Sep 2019 22:25:42 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B69D28B847;
 Mon, 16 Sep 2019 22:25:42 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id A4CDA696E0; Mon, 16 Sep 2019 20:25:41 +0000 (UTC)
Message-Id: <269a00951328fb6fa1be2fa3cbc76c19745019b7.1568665466.git.christophe.leroy@c-s.fr>
In-Reply-To: <a212bd36fbd6179e0929b6c727febc35132ac25c.1568665466.git.christophe.leroy@c-s.fr>
References: <a212bd36fbd6179e0929b6c727febc35132ac25c.1568665466.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 2/2] powerpc/83xx: map IMMR with a BAT.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 oss@buserror.net, galak@kernel.crashing.org
Date: Mon, 16 Sep 2019 20:25:41 +0000 (UTC)
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

v3:
- replaced __fix_to_virt() by fix_to_virt()
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
index f46d7bf3b140..6399865a625e 100644
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
+		unsigned long va = fix_to_virt(FIX_IMMR_BASE);
+
+		setbat(-1, va, immrbase, immrsize, PAGE_KERNEL_NCG);
+		update_bats();
+	}
+
 	mpc83xx_setup_pci();
 }
 
-- 
2.13.3

