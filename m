Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB4B1007
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 15:33:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tfpz4fZDzF4Jw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 23:33:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="AlE91qUL"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TfkJ37FqzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 23:29:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46TfkB4RrNz9txvH;
 Thu, 12 Sep 2019 15:29:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AlE91qUL; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id CS_Eux0cFFP1; Thu, 12 Sep 2019 15:29:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46TfkB3PHMz9txv9;
 Thu, 12 Sep 2019 15:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568294946; bh=8YKLm3BM8Fxy2PQQ/azbBDLOKtUwGMrFARZT5pRecvA=;
 h=From:Subject:To:Cc:Date:From;
 b=AlE91qUL1IErytQqrdVZaNb9DzquT4c1DDMHzdBMvDQPPhBo32PH9smETuDiHEmDM
 VhhMwPC/3jHELmOlEDYDvNJcOof5G74/RIP+uh59HYEPZHXxKgIyDK2IFWOnFck8fs
 6YGJfcZvPw8X9qe0HOoAGCsjkgP/t+e84XZFSC0E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D128C8B933;
 Thu, 12 Sep 2019 15:29:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MahlDDjqoM9y; Thu, 12 Sep 2019 15:29:07 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A0258B934;
 Thu, 12 Sep 2019 15:29:07 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3B00F6B736; Thu, 12 Sep 2019 13:29:07 +0000 (UTC)
Message-Id: <f816ccdbd15b97cf43c5a8c7cc8dfa8db58ff036.1568294935.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/8xx: use the fixmapped IMMR in cpm_reset()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 12 Sep 2019 13:29:07 +0000 (UTC)
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

Since commit f86ef74ed919 ("powerpc/8xx: Fix vaddr for IMMR early
remap"), the IMMR area has been mapped at startup with fixmap.

Use that fixmap directly instead of calling ioremap(), this
avoids calling ioremap() early before the slab is available.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/8xx/cpm1.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index 5a47b3ead01a..d4648cc468dc 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -51,7 +51,7 @@
 #define CPM_MAP_SIZE    (0x4000)
 
 cpm8xx_t __iomem *cpmp;  /* Pointer to comm processor space */
-immap_t __iomem *mpc8xx_immr;
+immap_t __iomem *mpc8xx_immr = (void __iomem *)VIRT_IMMR_BASE;
 static cpic8xx_t __iomem *cpic_reg;
 
 static struct irq_domain *cpm_pic_host;
@@ -205,12 +205,6 @@ void __init cpm_reset(void)
 	int len;
 #endif
 
-	mpc8xx_immr = ioremap(get_immrbase(), 0x4000);
-	if (!mpc8xx_immr) {
-		printk(KERN_CRIT "Could not map IMMR\n");
-		return;
-	}
-
 	cpmp = &mpc8xx_immr->im_cpm;
 
 #ifndef CONFIG_PPC_EARLY_DEBUG_CPM
-- 
2.13.3

