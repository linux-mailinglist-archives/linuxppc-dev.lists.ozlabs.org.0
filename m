Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F278511173
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 04:25:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vfJ73n6bzDqfd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 12:25:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pBr7tviu"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vf8H14GyzDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 12:18:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=s/aeLHmcSaCGZGW2T/ryaeA0ktI3wfHggwlvpiCdiGs=; b=pBr7tviub0M4
 Y7B+GAiIE0/H/6glIphSg1+JN79huRE/j+YTI3NQ8U8Ngjerot3AmpFSTaWjMQnGMlH6D7sZc9AUF
 3KdkDIC/cUuL6ULBrrDQkXR65KG+hNHiJxGyDwLWrIXCheEHEoXTtb4tYDKdoVda2u6WvOL4XHiHy
 b4dDw=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1J8-0005tL-2M; Thu, 02 May 2019 02:18:46 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 03B03441D3B; Thu,  2 May 2019 03:18:43 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Applied "ASoC: fsl_micfil: Remove set but not used variable 'osr'" to
 the asoc tree
In-Reply-To: <20190417150915.37968-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021843.03B03441D3B@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:42 +0100 (BST)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, perex@perex.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: fsl_micfil: Remove set but not used variable 'osr'

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From a0c34c7629bee46ffd8121987d27df25a6433cc7 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 17 Apr 2019 23:09:15 +0800
Subject: [PATCH] ASoC: fsl_micfil: Remove set but not used variable 'osr'

Fixes gcc '-Wunused-but-set-variable' warning:

sound/soc/fsl/fsl_micfil.c: In function 'get_clk_div':
sound/soc/fsl/fsl_micfil.c:154:6: warning: variable 'osr' set but not used [-Wunused-but-set-variable]

It is never used since introduction in
commit 47a70e6fc9a8 ("ASoC: Add MICFIL SoC Digital Audio Interface driver.")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_micfil.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 40c07e756481..f7f2d29f1bfe 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -151,12 +151,9 @@ static inline int get_clk_div(struct fsl_micfil *micfil,
 {
 	u32 ctrl2_reg;
 	long mclk_rate;
-	int osr;
 	int clk_div;
 
 	regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
-	osr = 16 - ((ctrl2_reg & MICFIL_CTRL2_CICOSR_MASK)
-		    >> MICFIL_CTRL2_CICOSR_SHIFT);
 
 	mclk_rate = clk_get_rate(micfil->mclk);
 
-- 
2.20.1

