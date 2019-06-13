Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 336DF43492
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 11:18:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PdSP4QXkzDrJJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 19:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="rkViw+3w"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PdKV4JyszDrGp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 19:11:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45PdKP4R07zB09Zb;
 Thu, 13 Jun 2019 11:11:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=rkViw+3w; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WrNDjzbjcOT1; Thu, 13 Jun 2019 11:11:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45PdKP3P8bzB09ZZ;
 Thu, 13 Jun 2019 11:11:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560417113; bh=FrwEFL562hO53reJv49dWHRcAR33QjLuPY2auIynv5Y=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=rkViw+3wJS3ttg2O6k2EH3MrosXEES9oukmaA/ID9xKqrex9EJpyfrVio69UEQ2hU
 TsKuUoJVSfKSjDs2J5HCvgqUMnZHQmIOlxjzCF9HoWgbMdwkGw6vjuUZtDeyGsvdEf
 iFIzeIIFh556BcNJO/lhgFgnWPqTUo3Jh4/rtoiY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 874BD8B8C3;
 Thu, 13 Jun 2019 11:11:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id No50a5lVEQ5N; Thu, 13 Jun 2019 11:11:54 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 463158B8C0;
 Thu, 13 Jun 2019 11:11:54 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0C3C268B1D; Thu, 13 Jun 2019 09:11:54 +0000 (UTC)
Message-Id: <3cdd2fdf053e3b6d96e5bfb099ce33b9d2a75dbe.1560416986.git.christophe.leroy@c-s.fr>
In-Reply-To: <1930b7e67ab361e68f356e7fdeba403e32ce3ad0.1560416986.git.christophe.leroy@c-s.fr>
References: <1930b7e67ab361e68f356e7fdeba403e32ce3ad0.1560416986.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 02/10] powerpc/8xx: drop verify_patch()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 oss@buserror.net
Date: Thu, 13 Jun 2019 09:11:54 +0000 (UTC)
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

verify_patch() has been opted out since many years, and
the comment suggests it doesn't work. So drop it.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/8xx/micropatch.c | 40 ---------------------------------
 1 file changed, 40 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
index 33a9042fca80..7bbaf9914f32 100644
--- a/arch/powerpc/platforms/8xx/micropatch.c
+++ b/arch/powerpc/platforms/8xx/micropatch.c
@@ -707,43 +707,3 @@ void __init cpm_load_patch(cpm8xx_t *cp)
 
 #endif /* some variation of the I2C/SPI patch was selected */
 }
-
-/*
- *  Take this entire routine out, since no one calls it and its
- * logic is suspect.
- */
-
-#if 0
-void
-verify_patch(volatile immap_t *immr)
-{
-	volatile uint		*dp;
-	volatile cpm8xx_t	*commproc;
-	int i;
-
-	commproc = (cpm8xx_t *)&immr->im_cpm;
-
-	printk("cp_rccr %x\n", commproc->cp_rccr);
-	commproc->cp_rccr = 0;
-
-	dp = (uint *)(commproc->cp_dpmem);
-	for (i=0; i<(sizeof(patch_2000)/4); i++)
-		if (*dp++ != patch_2000[i]) {
-			printk("patch_2000 bad at %d\n", i);
-			dp--;
-			printk("found 0x%X, wanted 0x%X\n", *dp, patch_2000[i]);
-			break;
-		}
-
-	dp = (uint *)&(commproc->cp_dpmem[0x0f00]);
-	for (i=0; i<(sizeof(patch_2f00)/4); i++)
-		if (*dp++ != patch_2f00[i]) {
-			printk("patch_2f00 bad at %d\n", i);
-			dp--;
-			printk("found 0x%X, wanted 0x%X\n", *dp, patch_2f00[i]);
-			break;
-		}
-
-	commproc->cp_rccr = 0x0009;
-}
-#endif
-- 
2.13.3

