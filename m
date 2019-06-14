Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 059274551A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 08:55:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QBFy4Q9gzDrTM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 16:55:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="aGiXkX4n"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Q9xn1JN8zDrFm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 16:41:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Q9xj1Rltz9v16w;
 Fri, 14 Jun 2019 08:41:45 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=aGiXkX4n; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0O2602rZybOP; Fri, 14 Jun 2019 08:41:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Q9xj0RWMz9v16l;
 Fri, 14 Jun 2019 08:41:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560494505; bh=mqHvMNCVo1J8F/0+o546XcKtxPNuB5rRLMclAu10TBw=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=aGiXkX4nZZbbuyKVNY191oLSgXjsghr6jYgT5Odsab8Q4wuMz8xAzz0Q0pv+z2Hnu
 +HTsq9uiDEYIl6C0P1nj8B83UC2FSi3ChzebKvwD8KKjSGXeT/r+ywfEATxRC72s4U
 ATFKz3ThgJuA7AqTyXbBQkgQ6CaWjZjq2Sn2iyos=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F3E9B8B77C;
 Fri, 14 Jun 2019 08:41:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id V917vI46jsYd; Fri, 14 Jun 2019 08:41:45 +0200 (CEST)
Received: from PO15451.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D76D78B77A;
 Fri, 14 Jun 2019 08:41:45 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C8D5768D77; Fri, 14 Jun 2019 06:41:45 +0000 (UTC)
Message-Id: <4537c9b06cec9599ba2c3162ed7fbb6ce085d04b.1560494349.git.christophe.leroy@c-s.fr>
In-Reply-To: <04852442b540e73be0a20e13f69ab8427fd102e0.1560494348.git.christophe.leroy@c-s.fr>
References: <04852442b540e73be0a20e13f69ab8427fd102e0.1560494348.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 08/10] powerpc/8xx: replace #ifdefs by IS_ENABLED() in
 microcode.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 oss@buserror.net
Date: Fri, 14 Jun 2019 06:41:45 +0000 (UTC)
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

Reduce #ifdef mess by using IS_ENABLED() instead.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/8xx/micropatch.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
index 02490c54ebac..252db7c90599 100644
--- a/arch/powerpc/platforms/8xx/micropatch.c
+++ b/arch/powerpc/platforms/8xx/micropatch.c
@@ -243,14 +243,9 @@ static void __init cpm_write_patch(cpm8xx_t *cp, int offset, uint *patch, int le
 void __init cpm_load_patch(cpm8xx_t *cp)
 {
 	volatile cpm8xx_t	*commproc;
-#if defined(CONFIG_I2C_SPI_UCODE_PATCH) || \
-    defined(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)
 	volatile iic_t		*iip;
 	volatile struct spi_pram *spp;
-#ifdef CONFIG_I2C_SPI_SMC1_UCODE_PATCH
 	volatile smc_uart_t	*smp;
-#endif
-#endif
 	commproc = cp;
 
 	commproc->cp_rccr = 0;
@@ -259,24 +254,22 @@ void __init cpm_load_patch(cpm8xx_t *cp)
 	cpm_write_patch(cp, 0xf00, patch_2f00, sizeof(patch_2f00));
 	cpm_write_patch(cp, 0xe00, patch_2e00, sizeof(patch_2e00));
 
-#if defined(CONFIG_I2C_SPI_UCODE_PATCH) || \
-    defined(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)
-
-	iip = (iic_t *)&commproc->cp_dparam[PROFF_IIC];
-# define RPBASE 0x0500
-	iip->iic_rpbase = RPBASE;
+	if (IS_ENABLED(CONFIG_I2C_SPI_UCODE_PATCH) ||
+	    IS_ENABLED(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)) {
+		u16 rpbase = 0x500;
 
-	/* Put SPI above the IIC, also 32-byte aligned.
-	*/
-	spp = (struct spi_pram *)&commproc->cp_dparam[PROFF_SPI];
-	spp->rpbase = (RPBASE + sizeof(iic_t) + 31) & ~31;
+		iip = (iic_t *)&commproc->cp_dparam[PROFF_IIC];
+		iip->iic_rpbase = rpbase;
 
-# if defined(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)
-	smp = (smc_uart_t *)&commproc->cp_dparam[PROFF_SMC1];
-	smp->smc_rpbase = 0x1FC0;
-# endif /* CONFIG_I2C_SPI_SMC1_UCODE_PATCH) */
+		/* Put SPI above the IIC, also 32-byte aligned. */
+		spp = (struct spi_pram *)&commproc->cp_dparam[PROFF_SPI];
+		spp->rpbase = (rpbase + sizeof(iic_t) + 31) & ~31;
 
-#endif /* some variation of the I2C/SPI patch was selected */
+		if (IS_ENABLED(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)) {
+			smp = (smc_uart_t *)&commproc->cp_dparam[PROFF_SMC1];
+			smp->smc_rpbase = 0x1FC0;
+		}
+	}
 
 	commproc->cp_cpmcr1 = patch_params.cpmcr1;
 	commproc->cp_cpmcr2 = patch_params.cpmcr2;
-- 
2.13.3

