Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B41B434B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 11:32:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Pdml40SZzDr5Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 19:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="G97jcTi5"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PdKd64FLzDrHb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 19:12:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45PdKY08BCzB09Zf;
 Thu, 13 Jun 2019 11:12:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=G97jcTi5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SM35TuE8RJM1; Thu, 13 Jun 2019 11:12:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45PdKX6BbvzB09Zg;
 Thu, 13 Jun 2019 11:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560417120; bh=GCEo/uOPUf7AFi3q5LEhtty7Gw7phT08oQfisQVPP5A=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=G97jcTi5fgvDr/8YkjvwlR8drwHhzao7PqB7azCS1ZPbu3XePsok/cmX4rWZoklU4
 SHYQakYCs2yBRZ/gbQtqz8QAkyfhx4uPbfm5rMcsblTcN9f3HAcCF/tq4OzFmkuVZK
 OwrUiuSH0saBayQhUrMz11CwROs2VWPPEZ99YQgA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DEF838B8C0;
 Thu, 13 Jun 2019 11:12:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BL2brYRxFJ1h; Thu, 13 Jun 2019 11:12:01 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 90A208B8B9;
 Thu, 13 Jun 2019 11:12:01 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4E16768B1D; Thu, 13 Jun 2019 09:12:01 +0000 (UTC)
Message-Id: <7369ec8ca28b7e0307821f76085ef5cdb72a4543.1560416987.git.christophe.leroy@c-s.fr>
In-Reply-To: <1930b7e67ab361e68f356e7fdeba403e32ce3ad0.1560416986.git.christophe.leroy@c-s.fr>
References: <1930b7e67ab361e68f356e7fdeba403e32ce3ad0.1560416986.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 09/10] powerpc/8xx: Use IO accessors in microcode
 programming.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 oss@buserror.net
Date: Thu, 13 Jun 2019 09:12:01 +0000 (UTC)
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

Change microcode functions to use IO accessors and get rid
of volatile attributes.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/8xx/micropatch.c | 34 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
index 252db7c90599..986aa6978ab7 100644
--- a/arch/powerpc/platforms/8xx/micropatch.c
+++ b/arch/powerpc/platforms/8xx/micropatch.c
@@ -242,13 +242,7 @@ static void __init cpm_write_patch(cpm8xx_t *cp, int offset, uint *patch, int le
 
 void __init cpm_load_patch(cpm8xx_t *cp)
 {
-	volatile cpm8xx_t	*commproc;
-	volatile iic_t		*iip;
-	volatile struct spi_pram *spp;
-	volatile smc_uart_t	*smp;
-	commproc = cp;
-
-	commproc->cp_rccr = 0;
+	out_be16(&cp->cp_rccr, 0);
 
 	cpm_write_patch(cp, 0, patch_2000, sizeof(patch_2000));
 	cpm_write_patch(cp, 0xf00, patch_2f00, sizeof(patch_2f00));
@@ -257,26 +251,30 @@ void __init cpm_load_patch(cpm8xx_t *cp)
 	if (IS_ENABLED(CONFIG_I2C_SPI_UCODE_PATCH) ||
 	    IS_ENABLED(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)) {
 		u16 rpbase = 0x500;
+		iic_t *iip;
+		struct spi_pram *spp;
 
-		iip = (iic_t *)&commproc->cp_dparam[PROFF_IIC];
-		iip->iic_rpbase = rpbase;
+		iip = (iic_t *)&cp->cp_dparam[PROFF_IIC];
+		out_be16(&iip->iic_rpbase, rpbase);
 
 		/* Put SPI above the IIC, also 32-byte aligned. */
-		spp = (struct spi_pram *)&commproc->cp_dparam[PROFF_SPI];
-		spp->rpbase = (rpbase + sizeof(iic_t) + 31) & ~31;
+		spp = (struct spi_pram *)&cp->cp_dparam[PROFF_SPI];
+		out_be16(&spp->rpbase, (rpbase + sizeof(iic_t) + 31) & ~31);
 
 		if (IS_ENABLED(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)) {
-			smp = (smc_uart_t *)&commproc->cp_dparam[PROFF_SMC1];
-			smp->smc_rpbase = 0x1FC0;
+			smc_uart_t *smp;
+
+			smp = (smc_uart_t *)&cp->cp_dparam[PROFF_SMC1];
+			out_be16(&smp->smc_rpbase, 0x1FC0);
 		}
 	}
 
-	commproc->cp_cpmcr1 = patch_params.cpmcr1;
-	commproc->cp_cpmcr2 = patch_params.cpmcr2;
-	commproc->cp_cpmcr3 = patch_params.cpmcr3;
-	commproc->cp_cpmcr4 = patch_params.cpmcr4;
+	out_be16(&cp->cp_cpmcr1, patch_params.cpmcr1);
+	out_be16(&cp->cp_cpmcr2, patch_params.cpmcr2);
+	out_be16(&cp->cp_cpmcr3, patch_params.cpmcr3);
+	out_be16(&cp->cp_cpmcr4, patch_params.cpmcr4);
 
-	commproc->cp_rccr = patch_params.rccr;
+	out_be16(&cp->cp_rccr, patch_params.rccr);
 
 	pr_info("%s microcode patch installed\n", patch_name);
 }
-- 
2.13.3

