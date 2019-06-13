Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EA34348D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 11:16:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PdQH1CgWzDr4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 19:16:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="YKx2sI+b"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PdKV4V2GzDrGs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 19:11:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45PdKM4KxkzB09Zd;
 Thu, 13 Jun 2019 11:11:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=YKx2sI+b; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YF0fzJlsmD2m; Thu, 13 Jun 2019 11:11:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45PdKM3BzjzB09ZZ;
 Thu, 13 Jun 2019 11:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560417111; bh=le7ETQf1tFNWmJBmMOIqZiV/Fhd+byRcNdXN7j+yXU8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=YKx2sI+b4Rxjo0Q0Tg3EWrkEcBuUg7eMKlAJ4g1jBuSFiPDOV0ql6GsAxAuQ0Yf4d
 wWSLL6MxN+rQ88fFb5oAu7b5H7QtPSvYapdENOEIW2JInTaR6s1fzaqQbgcbTSYTEz
 LRWDLhwr7nwWxs7UuJxQvZu4hrFICS1ioQTAnvMM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8890A8B8C0;
 Thu, 13 Jun 2019 11:11:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qcCkQcrOUUqn; Thu, 13 Jun 2019 11:11:52 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FDB28B8B9;
 Thu, 13 Jun 2019 11:11:52 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F3F0E68B1D; Thu, 13 Jun 2019 09:11:51 +0000 (UTC)
Message-Id: <dd715639629639505ef4edd36d5a1aa4361e6edf.1557487355.git.christophe.leroy@c-s.fr>
In-Reply-To: <35488171038e3d40e7680b8513dfbd52ff7b6ef2.1557487355.git.christophe.leroy@c-s.fr>
References: <35488171038e3d40e7680b8513dfbd52ff7b6ef2.1557487355.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/2] powerpc/8xx: Add microcode patch to move SMC parameter
 RAM.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Vitaly Bordug <vitb@kernel.crashing.org>, Scott Wood <oss@buserror.net>
Date: Thu, 13 Jun 2019 09:11:51 +0000 (UTC)
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

Some SCC functions like the QMC requires an extended parameter RAM.
On modern 8xx (ie 866 and 885), SPI area can already be relocated,
allowing the use of those functions on SCC2. But SCC3 and SCC4
parameter RAM collide with SMC1 and SMC2 parameter RAMs.

This patch adds microcode to allow the relocation of both SMC1 and
SMC2, and relocate them at offsets 0x1ec0 and 0x1fc0.
Those offsets are by default for the CPM1 DSP1 and DSP2, but there
is no kernel driver using them at the moment so this area can be
reused.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/8xx/Kconfig      |   7 ++
 arch/powerpc/platforms/8xx/micropatch.c | 109 +++++++++++++++++++++++++++++++-
 2 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/Kconfig b/arch/powerpc/platforms/8xx/Kconfig
index d408162d5af4..e0fe670f06f6 100644
--- a/arch/powerpc/platforms/8xx/Kconfig
+++ b/arch/powerpc/platforms/8xx/Kconfig
@@ -157,6 +157,13 @@ config I2C_SPI_SMC1_UCODE_PATCH
 	help
 	  Help not implemented yet, coming soon.
 
+config SMC_UCODE_PATCH
+	bool "SMC relocation patch"
+	help
+	  This microcode relocates SMC1 and SMC2 parameter RAMs at
+	  offset 0x1ec0 and 0x1fc0 to allow extended parameter RAM
+	  for SCC3 and SCC4.
+
 endchoice
 
 config UCODE_PATCH
diff --git a/arch/powerpc/platforms/8xx/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
index 33a9042fca80..dc4423daf7d4 100644
--- a/arch/powerpc/platforms/8xx/micropatch.c
+++ b/arch/powerpc/platforms/8xx/micropatch.c
@@ -622,6 +622,86 @@ static uint patch_2f00[] __initdata = {
 };
 #endif
 
+/*
+ * SMC relocation patch arrays.
+ */
+
+#ifdef CONFIG_SMC_UCODE_PATCH
+
+static uint patch_2000[] __initdata = {
+	0x3fff0000, 0x3ffd0000, 0x3ffb0000, 0x3ff90000,
+	0x5fefeff8, 0x5f91eff8, 0x3ff30000, 0x3ff10000,
+	0x3a11e710, 0xedf0ccb9, 0xf318ed66, 0x7f0e5fe2,
+	0x7fedbb38, 0x3afe7468, 0x7fedf4d8, 0x8ffbb92d,
+	0xb83b77fd, 0xb0bb5eb9, 0xdfda7fed, 0x90bde74d,
+	0x6f0dcbd3, 0xe7decfed, 0xcb50cfed, 0xcfeddf6d,
+	0x914d4f74, 0x5eaedfcb, 0x9ee0e7df, 0xefbb6ffb,
+	0xe7ef7f0e, 0x9ee57fed, 0xebb7effa, 0xeb30affb,
+	0x7fea90b3, 0x7e0cf09f, 0xbffff318, 0x5fffdfff,
+	0xac35efea, 0x7fce1fc1, 0xe2ff5fbd, 0xaffbe2ff,
+	0x5fbfaffb, 0xf9a87d0f, 0xaef8770f, 0x7d0fb0a2,
+	0xeffbbfff, 0xcfef5fba, 0x7d0fbfff, 0x5fba4cf8,
+	0x7fddd09b, 0x49f847fd, 0x7efdf097, 0x7fedfffd,
+	0x7dfdf093, 0xef7e7e1e, 0x5fba7f0e, 0x3a11e710,
+	0xedf0cc87, 0xfb18ad0a, 0x1f85bbb8, 0x74283b7e,
+	0x7375e4bb, 0x2ab64fb8, 0x5c7de4bb, 0x32fdffbf,
+	0x5f0843f8, 0x7ce3e1bb, 0xe74f7ded, 0x6f0f4fe8,
+	0xc7ba32be, 0x73f2efeb, 0x600b4f78, 0xe5bb760b,
+	0x5388aef8, 0x4ef80b6a, 0xcfef9ee5, 0xabf8751f,
+	0xefef5b88, 0x741f4fe8, 0x751e760d, 0x7fdb70dd,
+	0x741cafce, 0xefcc7fce, 0x751e7088, 0x741ce7bb,
+	0x334ecfed, 0xafdbefeb, 0xe5bb760b, 0x53ceaef8,
+	0xafe8e7eb, 0x4bf8771e, 0x7e007fed, 0x4fcbe2cc,
+	0x7fbc3085, 0x7b0f7a0f, 0x34b177fd, 0xb0e75e93,
+	0xdf313e3b, 0xaf78741f, 0x741f30cc, 0xcfef5f08,
+	0x741f3e88, 0xafb8771e, 0x5f437fed, 0x0bafe2cc,
+	0x741ccfec, 0xe5ca53a9, 0x6fcb4f74, 0x5e89df27,
+	0x2a923d14, 0x4b8fdf0c, 0x751f741c, 0x6c1eeffa,
+	0xefea7fce, 0x6ffc309a, 0xefec3fca, 0x308fdf0a,
+	0xadf85e7a, 0xaf7daefd, 0x5e7adf0a, 0x5e7aafdd,
+	0x761f1088, 0x1e7c7efd, 0x3089fffe, 0x4908fb18,
+	0x5fffdfff, 0xafbbf0f7, 0x4ef85f43, 0xadf81489,
+	0x7a0f7089, 0xcfef5089, 0x7a0fdf0c, 0x5e7cafed,
+	0xbc6e780f, 0xefef780f, 0xefef790f, 0xa7f85eeb,
+	0xffef790f, 0xefef790f, 0x1489df0a, 0x5e7aadfd,
+	0x5f09fffb, 0xe79aded9, 0xeff96079, 0x607ae79a,
+	0xded8eff9, 0x60795edb, 0x607acfef, 0xefefefdf,
+	0xefbfef7f, 0xeeffedff, 0xebffe7ff, 0xafefafdf,
+	0xafbfaf7f, 0xaeffadff, 0xabffa7ff, 0x6fef6fdf,
+	0x6fbf6f7f, 0x6eff6dff, 0x6bff67ff, 0x2fef2fdf,
+	0x2fbf2f7f, 0x2eff2dff, 0x2bff27ff, 0x4e08fd1f,
+	0xe5ff6e0f, 0xaff87eef, 0x7e0ffdef, 0xf11f6079,
+	0xabf8f51e, 0x7e0af11c, 0x37cfae16, 0x7fec909a,
+	0xadf8efdc, 0xcfeae52f, 0x7d0fe12b, 0xf11c6079,
+	0x7e0a4df8, 0xcfea5ea0, 0x7d0befec, 0xcfea5ea2,
+	0xe522efdc, 0x5ea2cfda, 0x4e08fd1f, 0x6e0faff8,
+	0x7c1f761f, 0xfdeff91f, 0x6079abf8, 0x761cee00,
+	0xf91f2bfb, 0xefefcfec, 0xf91f6079, 0x761c27fb,
+	0xefdf5e83, 0xcfdc7fdd, 0x50f84bf8, 0x47fd7c1f,
+	0x761ccfcf, 0x7eef7fed, 0x7dfd70ef, 0xef7e7f1e,
+	0x771efb18, 0x6079e722, 0xe6bbe5bb, 0x2e66e5bb,
+	0x600b2ee1, 0xe2bbe2bb, 0xe2bbe2bb, 0x2f5ee2bb,
+	0xe2bb2ff9, 0x6079e2bb,
+};
+
+static uint patch_2f00[] __initdata = {
+	0x30303030, 0x3e3e3030, 0xaf79b9b3, 0xbaa3b979,
+	0x9693369f, 0x79f79777, 0x97333fff, 0xfb3b9e9f,
+	0x79b91d11, 0x9e13f3ff, 0x3f9b6bd9, 0xe173d136,
+	0x695669d1, 0x697b3daf, 0x79b93a3a, 0x3f979f91,
+	0x379ff976, 0xf99777fd, 0x9779737d, 0xe9d6bbf9,
+	0xbfffd9df, 0x97f7fd97, 0x6f7b9bff, 0xf9bd9683,
+	0x397db973, 0xd97b3b9f, 0xd7f9f733, 0x9993bb9e,
+	0xe1f9ef93, 0x73773337, 0xb936917d, 0x11f87379,
+	0xb979d336, 0x8b7ded73, 0x1b7d9337, 0x31f3f22f,
+	0x3f2327ee, 0xeeeeeeee, 0xeeeeeeee, 0xeeeeeeee,
+	0xeeeeee4b, 0xf4fbdbd2, 0x58bb1878, 0x577fdfd2,
+	0xd573b773, 0xf7374b4f, 0xbdbd25b8, 0xb177d2d1,
+	0x7376856b, 0xbfdd687b, 0xdd2fff8f, 0x78ffff8f,
+	0xf22f0000,
+};
+#endif
+
 void __init cpm_load_patch(cpm8xx_t *cp)
 {
 	volatile uint		*dp;		/* Dual-ported RAM. */
@@ -630,9 +710,9 @@ void __init cpm_load_patch(cpm8xx_t *cp)
     defined(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)
 	volatile iic_t		*iip;
 	volatile struct spi_pram *spp;
-#ifdef CONFIG_I2C_SPI_SMC1_UCODE_PATCH
-	volatile smc_uart_t	*smp;
 #endif
+#if defined(CONFIG_I2C_SPI_SMC1_UCODE_PATCH) || defined(CONFIG_SMC_UCODE_PATCH)
+	volatile smc_uart_t	*smp;
 #endif
 	int	i;
 
@@ -706,6 +786,31 @@ void __init cpm_load_patch(cpm8xx_t *cp)
 # endif /* CONFIG_I2C_SPI_SMC1_UCODE_PATCH) */
 
 #endif /* some variation of the I2C/SPI patch was selected */
+
+#if defined(CONFIG_SMC_UCODE_PATCH)
+
+	commproc->cp_rccr = 0;
+
+	dp = (uint *)commproc->cp_dpmem;
+	for (i = 0; i < sizeof(patch_2000) / 4; i++)
+		*dp++ = patch_2000[i];
+
+	dp = (uint *)&commproc->cp_dpmem[0x0f00];
+	for (i = 0; i < sizeof(patch_2f00) / 4; i++)
+		*dp++ = patch_2f00[i];
+
+
+	commproc->cp_cpmcr1 = 0x8080;
+	commproc->cp_cpmcr2 = 0x8088;
+	commproc->cp_rccr = 2;
+
+	smp = (smc_uart_t *)&commproc->cp_dparam[PROFF_SMC1];
+	smp->smc_rpbase = 0x1ec0;
+	smp = (smc_uart_t *)&commproc->cp_dparam[PROFF_SMC2];
+	smp->smc_rpbase = 0x1fc0;
+
+	pr_info("SMC microcode patch installed.\n");
+#endif /* CONFIG_SMC_UCODE_PATCH */
 }
 
 /*
-- 
2.13.3

