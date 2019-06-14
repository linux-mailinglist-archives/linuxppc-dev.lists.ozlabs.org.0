Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C9145513
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 08:54:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QBCs2PWszDrTL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 16:54:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="EqiASUxV"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Q9xm75f4zDrFb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 16:41:48 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Q9xh1ZSbz9v16t;
 Fri, 14 Jun 2019 08:41:44 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EqiASUxV; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ck1ca0EJ4Fa3; Fri, 14 Jun 2019 08:41:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Q9xh0Y8Nz9v16l;
 Fri, 14 Jun 2019 08:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560494504; bh=c1fjFHYo4plvZKawyOgV7g7CcRgoXZx1Z5piZT8xc9k=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=EqiASUxVF28rqSAbQ03YmmGbLYZpiJsvDVsuUnWvgk++Ib/N3iXsmhWrMLLL4WXFM
 ruVna0XumBruSs+JsdGVCXu635LZbG3AERoDpu+KY1P6O/srA9qYy4HLrIVxPN2PPI
 apJhlcJBG4BCjRJUrHMsHmxPJpEM1M9MWJ8VbWZo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 044B08B77C;
 Fri, 14 Jun 2019 08:41:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XYzf5l_CfAvn; Fri, 14 Jun 2019 08:41:44 +0200 (CEST)
Received: from PO15451.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D134C8B77A;
 Fri, 14 Jun 2019 08:41:44 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C229D68D77; Fri, 14 Jun 2019 06:41:44 +0000 (UTC)
Message-Id: <e9091dc0cfedf4cd49b46f0dbf44bff31518be9d.1560494349.git.christophe.leroy@c-s.fr>
In-Reply-To: <04852442b540e73be0a20e13f69ab8427fd102e0.1560494348.git.christophe.leroy@c-s.fr>
References: <04852442b540e73be0a20e13f69ab8427fd102e0.1560494348.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 07/10] powerpc/8xx: refactor programming of microcode CPM
 params.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 oss@buserror.net
Date: Fri, 14 Jun 2019 06:41:44 +0000 (UTC)
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

The CPM registers RCCR and CPMCR1..4 registers has to be set in
accordance with the microcode patch beeing programmed. Lets
define them as part of the patch set and refactor their
programming from that definition.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/8xx/micropatch.c | 45 ++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
index 5e5ac2378d3f..02490c54ebac 100644
--- a/arch/powerpc/platforms/8xx/micropatch.c
+++ b/arch/powerpc/platforms/8xx/micropatch.c
@@ -20,6 +20,14 @@
 #include <asm/cpm.h>
 #include <asm/cpm1.h>
 
+struct patch_params {
+	ushort rccr;
+	ushort cpmcr1;
+	ushort cpmcr2;
+	ushort cpmcr3;
+	ushort cpmcr4;
+};
+
 /*
  * I2C/SPI relocation patch arrays.
  */
@@ -28,6 +36,10 @@
 
 static char patch_name[] __initdata = "I2C/SPI";
 
+static struct patch_params patch_params __initdata = {
+	1, 0x802a, 0x8028, 0x802e, 0x802c,
+};
+
 static uint patch_2000[] __initdata = {
 	0x7FFFEFD9, 0x3FFD0000, 0x7FFB49F7, 0x7FF90000,
 	0x5FEFADF7, 0x5F89ADF7, 0x5FEFAFF7, 0x5F89AFF7,
@@ -82,6 +94,10 @@ static uint patch_2e00[] __initdata = {};
 
 static char patch_name[] __initdata = "I2C/SPI/SMC1";
 
+static struct patch_params patch_params __initdata = {
+	3, 0x8080, 0x808a, 0x8028, 0x802a,
+};
+
 static uint patch_2000[] __initdata = {
 	0x3fff0000, 0x3ffd0000, 0x3ffb0000, 0x3ff90000,
 	0x5f13eff8, 0x5eb5eff8, 0x5f88adf7, 0x5fefadf7,
@@ -200,6 +216,10 @@ static uint patch_2e00[] __initdata = {
 
 static char patch_name[] __initdata = "USB SOF";
 
+static struct patch_params patch_params __initdata = {
+	9,
+};
+
 static uint patch_2000[] __initdata = {
 	0x7fff0000, 0x7ffd0000, 0x7ffb0000, 0x49f7ba5b,
 	0xba383ffb, 0xf9b8b46d, 0xe5ab4e07, 0xaf77bffe,
@@ -239,10 +259,6 @@ void __init cpm_load_patch(cpm8xx_t *cp)
 	cpm_write_patch(cp, 0xf00, patch_2f00, sizeof(patch_2f00));
 	cpm_write_patch(cp, 0xe00, patch_2e00, sizeof(patch_2e00));
 
-#ifdef CONFIG_USB_SOF_UCODE_PATCH
-	commproc->cp_rccr = 0x0009;
-#endif /* CONFIG_USB_SOF_UCODE_PATCH */
-
 #if defined(CONFIG_I2C_SPI_UCODE_PATCH) || \
     defined(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)
 
@@ -255,26 +271,19 @@ void __init cpm_load_patch(cpm8xx_t *cp)
 	spp = (struct spi_pram *)&commproc->cp_dparam[PROFF_SPI];
 	spp->rpbase = (RPBASE + sizeof(iic_t) + 31) & ~31;
 
-# if defined(CONFIG_I2C_SPI_UCODE_PATCH)
-	commproc->cp_cpmcr1 = 0x802a;
-	commproc->cp_cpmcr2 = 0x8028;
-	commproc->cp_cpmcr3 = 0x802e;
-	commproc->cp_cpmcr4 = 0x802c;
-	commproc->cp_rccr = 1;
-# endif /* CONFIG_I2C_SPI_UCODE_PATCH */
-
 # if defined(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)
-	commproc->cp_cpmcr1 = 0x8080;
-	commproc->cp_cpmcr2 = 0x808a;
-	commproc->cp_cpmcr3 = 0x8028;
-	commproc->cp_cpmcr4 = 0x802a;
-	commproc->cp_rccr = 3;
-
 	smp = (smc_uart_t *)&commproc->cp_dparam[PROFF_SMC1];
 	smp->smc_rpbase = 0x1FC0;
 # endif /* CONFIG_I2C_SPI_SMC1_UCODE_PATCH) */
 
 #endif /* some variation of the I2C/SPI patch was selected */
 
+	commproc->cp_cpmcr1 = patch_params.cpmcr1;
+	commproc->cp_cpmcr2 = patch_params.cpmcr2;
+	commproc->cp_cpmcr3 = patch_params.cpmcr3;
+	commproc->cp_cpmcr4 = patch_params.cpmcr4;
+
+	commproc->cp_rccr = patch_params.rccr;
+
 	pr_info("%s microcode patch installed\n", patch_name);
 }
-- 
2.13.3

