Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F715434A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 11:26:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Pddp3bn4zDrNY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 19:26:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="fLs2ZfwG"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PdKd1XWfzDrGp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 19:12:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45PdKR55ZYzB09Zh;
 Thu, 13 Jun 2019 11:11:55 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fLs2ZfwG; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KwbTwUcpSJJK; Thu, 13 Jun 2019 11:11:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45PdKR42ShzB09Zg;
 Thu, 13 Jun 2019 11:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560417115; bh=mszSrikscbgZHgKNqdr5fBuo6tVQqJ4xBpR0SgppJSM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=fLs2ZfwGEKN5V1bkXywADSLwPWW1smSQKxriBCVJv0Ic2VkMnbAK1dM9OdmjsT/VG
 PzFOzkp5OHDZCbnzQnq7qzVRkCC/iqkgegXgbhZkEo5JHo86Y1slaEAyooqLVYShAs
 GuCLTj9845vkU70KA+ONB+a5mpBRkLmx/V5FRoDs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DD258B8CD;
 Thu, 13 Jun 2019 11:11:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uvKxghtaA0Bn; Thu, 13 Jun 2019 11:11:56 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 605008B8C0;
 Thu, 13 Jun 2019 11:11:56 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1FBFD68B1D; Thu, 13 Jun 2019 09:11:56 +0000 (UTC)
Message-Id: <dc5796d403fc4656dbb21032ec402013e957454d.1560416987.git.christophe.leroy@c-s.fr>
In-Reply-To: <1930b7e67ab361e68f356e7fdeba403e32ce3ad0.1560416986.git.christophe.leroy@c-s.fr>
References: <1930b7e67ab361e68f356e7fdeba403e32ce3ad0.1560416986.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 04/10] powerpc/8xx: refactor writing of CPM microcode arrays
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 oss@buserror.net
Date: Thu, 13 Jun 2019 09:11:56 +0000 (UTC)
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

Create a function to refactor the writing of CPM microcode arrays.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/8xx/micropatch.c | 35 ++++++++++++---------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
index e14b6bcadce3..2abc226d1139 100644
--- a/arch/powerpc/platforms/8xx/micropatch.c
+++ b/arch/powerpc/platforms/8xx/micropatch.c
@@ -203,9 +203,15 @@ static uint patch_2f00[] __initdata = {
 };
 #endif
 
+static void __init cpm_write_patch(cpm8xx_t *cp, int offset, uint *patch, int len)
+{
+	if (!len)
+		return;
+	memcpy_toio(cp->cp_dpmem + offset, patch, len);
+}
+
 void __init cpm_load_patch(cpm8xx_t *cp)
 {
-	volatile uint		*dp;		/* Dual-ported RAM. */
 	volatile cpm8xx_t	*commproc;
 #if defined(CONFIG_I2C_SPI_UCODE_PATCH) || \
     defined(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)
@@ -215,20 +221,13 @@ void __init cpm_load_patch(cpm8xx_t *cp)
 	volatile smc_uart_t	*smp;
 #endif
 #endif
-	int	i;
-
 	commproc = cp;
 
 #ifdef CONFIG_USB_SOF_UCODE_PATCH
 	commproc->cp_rccr = 0;
 
-	dp = (uint *)(commproc->cp_dpmem);
-	for (i=0; i<(sizeof(patch_2000)/4); i++)
-		*dp++ = patch_2000[i];
-
-	dp = (uint *)&(commproc->cp_dpmem[0x0f00]);
-	for (i=0; i<(sizeof(patch_2f00)/4); i++)
-		*dp++ = patch_2f00[i];
+	cpm_write_patch(cp, 0, patch_2000, sizeof(patch_2000));
+	cpm_write_patch(cp, 0xf00, patch_2f00, sizeof(patch_2f00));
 
 	commproc->cp_rccr = 0x0009;
 
@@ -240,13 +239,8 @@ void __init cpm_load_patch(cpm8xx_t *cp)
 
 	commproc->cp_rccr = 0;
 
-	dp = (uint *)(commproc->cp_dpmem);
-	for (i=0; i<(sizeof(patch_2000)/4); i++)
-		*dp++ = patch_2000[i];
-
-	dp = (uint *)&(commproc->cp_dpmem[0x0f00]);
-	for (i=0; i<(sizeof(patch_2f00)/4); i++)
-		*dp++ = patch_2f00[i];
+	cpm_write_patch(cp, 0, patch_2000, sizeof(patch_2000));
+	cpm_write_patch(cp, 0xf00, patch_2f00, sizeof(patch_2f00));
 
 	iip = (iic_t *)&commproc->cp_dparam[PROFF_IIC];
 # define RPBASE 0x0500
@@ -254,9 +248,8 @@ void __init cpm_load_patch(cpm8xx_t *cp)
 
 	/* Put SPI above the IIC, also 32-byte aligned.
 	*/
-	i = (RPBASE + sizeof(iic_t) + 31) & ~31;
 	spp = (struct spi_pram *)&commproc->cp_dparam[PROFF_SPI];
-	spp->rpbase = i;
+	spp->rpbase = (RPBASE + sizeof(iic_t) + 31) & ~31;
 
 # if defined(CONFIG_I2C_SPI_UCODE_PATCH)
 	commproc->cp_cpmcr1 = 0x802a;
@@ -270,9 +263,7 @@ void __init cpm_load_patch(cpm8xx_t *cp)
 
 # if defined(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)
 
-	dp = (uint *)&(commproc->cp_dpmem[0x0e00]);
-	for (i=0; i<(sizeof(patch_2e00)/4); i++)
-		*dp++ = patch_2e00[i];
+	cpm_write_patch(cp, 0xe00, patch_2e00, sizeof(patch_2e00));
 
 	commproc->cp_cpmcr1 = 0x8080;
 	commproc->cp_cpmcr2 = 0x808a;
-- 
2.13.3

