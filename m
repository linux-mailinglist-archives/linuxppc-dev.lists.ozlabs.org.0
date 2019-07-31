Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BCF7C0F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 14:16:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zC8B58wyzDqYP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 22:16:26 +1000 (AEST)
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
 header.b="wYgUZSRI"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zB6k6c5dzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 21:30:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=H/kG5zveA/jnIRdFNFW7HC5Y8I2561aVM6OnMW2Mlrk=; b=wYgUZSRIUHxL
 UEkJHHCV6TAGe5sXe566IqTC6/tKD2urVO+Mb0An9KN9juunp2dpD8nUw0LzG4IK7Zuf0TZxuCJuA
 ufqLTNfgsd70PAyr9xmM0E439pDUPX7j2KaU5kBoRR5a6YzEi5fRr1HEVCSK7yAvetPC/Oif7ldvp
 m9qOc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmnc-0001lA-Vh; Wed, 31 Jul 2019 11:29:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 61CCD2742C99; Wed, 31 Jul 2019 12:29:40 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Applied "ASoC: uniphier: evea: use devm_platform_ioremap_resource()
 to simplify code" to the asoc tree
In-Reply-To: <20190727150738.54764-22-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190731112940.61CCD2742C99@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:40 +0100 (BST)
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
Cc: mripard@kernel.org, alsa-devel@alsa-project.org, olivier.moysan@st.com,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, paul@crapouillou.net,
 jcmvbkbc@gmail.com, thierry.reding@gmail.com, shawnguo@kernel.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, f.fainelli@gmail.com, khilman@baylibre.com,
 tiwai@suse.com, michal.simek@xilinx.com, jonathanh@nvidia.com,
 Hulk Robot <hulkci@huawei.com>, wens@csie.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 s.hauer@pengutronix.de, matthias.bgg@gmail.com, linux-xtensa@linux-xtensa.org,
 alexandre.torgue@st.com, yamada.masahiro@socionext.com, rjui@broadcom.com,
 robert.jarzmik@free.fr, haojian.zhuang@gmail.com, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, perex@perex.cz,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 baohua@kernel.org, timur@kernel.org, sbranden@broadcom.com, eric@anholt.net,
 gregkh@linuxfoundation.org, arnaud.pouliquen@st.com, lgirdwood@gmail.com,
 wahrenst@gmx.net, kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
 daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: uniphier: evea: use devm_platform_ioremap_resource() to simplify code

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

From 4e5bc35988af2483138feb3c5c3bf5fb0cae4228 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 27 Jul 2019 23:07:25 +0800
Subject: [PATCH] ASoC: uniphier: evea: use devm_platform_ioremap_resource() to
 simplify code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190727150738.54764-22-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/uniphier/evea.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/uniphier/evea.c b/sound/soc/uniphier/evea.c
index f9c10165fbc1..d27e9ca07856 100644
--- a/sound/soc/uniphier/evea.c
+++ b/sound/soc/uniphier/evea.c
@@ -451,7 +451,6 @@ static const struct regmap_config evea_regmap_config = {
 static int evea_probe(struct platform_device *pdev)
 {
 	struct evea_priv *evea;
-	struct resource *res;
 	void __iomem *preg;
 	int ret;
 
@@ -475,8 +474,7 @@ static int evea_probe(struct platform_device *pdev)
 	if (IS_ERR(evea->rst_exiv))
 		return PTR_ERR(evea->rst_exiv);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	preg = devm_ioremap_resource(&pdev->dev, res);
+	preg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(preg))
 		return PTR_ERR(preg);
 
-- 
2.20.1

