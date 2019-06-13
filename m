Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C13434B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 11:34:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Pdpv6xh7zDr5N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 19:33:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="sjMYA3Q7"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PdKf0nXnzDrHm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 19:12:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45PdKW6XMlzB09Zq;
 Thu, 13 Jun 2019 11:11:59 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=sjMYA3Q7; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZVuszKe76_fZ; Thu, 13 Jun 2019 11:11:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45PdKW5VLhzB09Zg;
 Thu, 13 Jun 2019 11:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560417119; bh=mqHvMNCVo1J8F/0+o546XcKtxPNuB5rRLMclAu10TBw=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=sjMYA3Q70EyzBqP9X7rFgnKphniWcmh5J7A1+eDIphhqIg99FrLEz/FsIOqxpujPJ
 deHosTzsF3S/IekJUb9/XjNwsb9adITrCG/IL9BbFeaZeqax7CFlAY/q/GFuZeq0il
 4vk9dyLi7WolJ9TN/JxTbKmbBE6P6xYBFIHhSRU4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D86818B8C0;
 Thu, 13 Jun 2019 11:12:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PUiRkJUwmOiS; Thu, 13 Jun 2019 11:12:00 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 95A498B8B9;
 Thu, 13 Jun 2019 11:12:00 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 487D968B1D; Thu, 13 Jun 2019 09:12:00 +0000 (UTC)
Message-Id: <e637bd2d3884c8be1067bf382c71b2b0b7ffc370.1560416987.git.christophe.leroy@c-s.fr>
In-Reply-To: <1930b7e67ab361e68f356e7fdeba403e32ce3ad0.1560416986.git.christophe.leroy@c-s.fr>
References: <1930b7e67ab361e68f356e7fdeba403e32ce3ad0.1560416986.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 08/10] powerpc/8xx: replace #ifdefs by IS_ENABLED() in
 microcode.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 oss@buserror.net
Date: Thu, 13 Jun 2019 09:12:00 +0000 (UTC)
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

