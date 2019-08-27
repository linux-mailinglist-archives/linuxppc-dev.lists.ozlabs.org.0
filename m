Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 614759F3C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 22:08:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46J0L15D56zDqvV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 06:08:09 +1000 (AEST)
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
 header.b="vpg+xa0B"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46J06r2JhFzDqgk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 05:58:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mLwhdc61f1fsTUMVyTfwingh4QR4ollQQm6O+N5/vGA=; b=vpg+xa0BPq5J
 iUlAqSGQ2EZIXLO0NI2f0EOA7ejYzzsbW5ZQ2xC9nrSEAElRAfrqJS5TleLvriYDYXZiRomc3lvvR
 B+1tBbnr4/qx99Y4T3B5sxbytLm3Aaka2wL10WZ9u055PN2rQz9RmEdtRGh5JLUYG4WHNC+mSfhgx
 39zGA=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2hbb-0001Cr-QO; Tue, 27 Aug 2019 19:58:15 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 8D170D02CE8; Tue, 27 Aug 2019 20:58:14 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Applied "ASoC: imx-audmix: register the card on a proper dev" to the
 asoc tree
In-Reply-To: <1566921315-23402-1-git-send-email-shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190827195814.8D170D02CE8@fitzroy.sirena.org.uk>
Date: Tue, 27 Aug 2019 20:58:14 +0100 (BST)
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
Cc: alsa-devel@alsa-project.org, Viorel Suman <viorel.suman@nxp.com>,
 timur@kernel.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org,
 s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, perex@perex.cz, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: imx-audmix: register the card on a proper dev

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 9573820eb1951e0cb0f329886abcb4153f2ea798 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Tue, 27 Aug 2019 11:55:15 -0400
Subject: [PATCH] ASoC: imx-audmix: register the card on a proper dev

This platform device is registered from "fsl_audmix", which is
its parent device. If use pdev->dev.parent for the priv->card.dev,
the value set by dev_set_drvdata in parent device will be covered
by the value in child device.

Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/1566921315-23402-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-audmix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 9e1cb18859ce..71590ca6394b 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -325,14 +325,14 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	priv->card.num_configs = priv->num_dai_conf;
 	priv->card.dapm_routes = priv->dapm_routes;
 	priv->card.num_dapm_routes = priv->num_dapm_routes;
-	priv->card.dev = pdev->dev.parent;
+	priv->card.dev = &pdev->dev;
 	priv->card.owner = THIS_MODULE;
 	priv->card.name = "imx-audmix";
 
 	platform_set_drvdata(pdev, &priv->card);
 	snd_soc_card_set_drvdata(&priv->card, priv);
 
-	ret = devm_snd_soc_register_card(pdev->dev.parent, &priv->card);
+	ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed\n");
 		return ret;
-- 
2.20.1

