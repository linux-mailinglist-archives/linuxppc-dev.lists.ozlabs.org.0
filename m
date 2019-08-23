Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A08B9AFF7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 14:54:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FLvM4JlwzDrVT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 22:54:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="LAoNsyoT"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FLpm2N7CzDrYy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 22:50:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46FLpd4cyxz9txM0;
 Fri, 23 Aug 2019 14:50:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LAoNsyoT; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SfhwT4Mbyq1G; Fri, 23 Aug 2019 14:50:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46FLpd3bh2z9txLw;
 Fri, 23 Aug 2019 14:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566564617; bh=4cukybuxYzyKh4osdIe5zLMQPeJ6BNChd4Ex1TqwbvQ=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=LAoNsyoTy/Uy/TxiLZs39kyssTYThEDlkklrbs8dyKpjOEBfYoGCIa57RhK1nAicq
 0t7DH2XkOxAmEsWyrGNJdU7vfSM/HHBbVZdn7ffytF2jdWJ7K6QohNrWzAjJn+q7Mq
 9ym0Zv7t3Jsn72G5EuwnnBwy8U5Zeqd64JdjrKx8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E53A38B87B;
 Fri, 23 Aug 2019 14:50:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7gNk9FgxzWR6; Fri, 23 Aug 2019 14:50:18 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C8D298B866;
 Fri, 23 Aug 2019 14:50:18 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B688B639BC; Fri, 23 Aug 2019 12:50:18 +0000 (UTC)
Message-Id: <331759c1bcba5797d30f8eace74afb16ac5f3c36.1566564560.git.christophe.leroy@c-s.fr>
In-Reply-To: <b51b96090138aba1920d2cf7c0e0e348667f9a69.1566564560.git.christophe.leroy@c-s.fr>
References: <b51b96090138aba1920d2cf7c0e0e348667f9a69.1566564560.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/2] powerpc/83xx: map IMMR with a BAT.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 oss@buserror.net, galak@kernel.crashing.org
Date: Fri, 23 Aug 2019 12:50:18 +0000 (UTC)
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

On mpc83xx with a QE, IMMR is 2Mbytes.
On mpc83xx without a QE, IMMR is 1Mbytes.
Each driver will map a part of it to access the registers it needs.
Some driver will map the same part of IMMR as other drivers.

In order to reduce TLB misses, map the full IMMR with a BAT.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/83xx/misc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index f46d7bf3b140..1e395b01c535 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -18,6 +18,8 @@
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
 
+#include <mm/mmu_decl.h>
+
 #include "mpc83xx.h"
 
 static __be32 __iomem *restart_reg_base;
@@ -145,6 +147,14 @@ void __init mpc83xx_setup_arch(void)
 	if (ppc_md.progress)
 		ppc_md.progress("mpc83xx_setup_arch()", 0);
 
+	if (!__map_without_bats) {
+		int immrsize = IS_ENABLED(CONFIG_QUICC_ENGINE) ? SZ_2M : SZ_1M;
+
+		ioremap_bot = ALIGN_DOWN(ioremap_bot - immrsize, immrsize);
+		setbat(-1, ioremap_bot, get_immrbase(), immrsize, PAGE_KERNEL_NCG);
+		update_bats();
+	}
+
 	mpc83xx_setup_pci();
 }
 
-- 
2.13.3

