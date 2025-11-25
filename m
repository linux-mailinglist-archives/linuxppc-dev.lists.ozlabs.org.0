Return-Path: <linuxppc-dev+bounces-14483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D64E8C8468F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 11:16:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFz9m6MWsz30TL;
	Tue, 25 Nov 2025 21:16:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=94.100.134.236 arc.chain=hornetsecurity.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764065772;
	cv=pass; b=Pq4nyXQEDj6NY74Eq2rbsXNM/BZoAJ/eO85sbJ39mwXNaQ7KWPqdBge0NTat7gPIWOTt4HLN1i3XJI2DhCQwP62liRfGEXpQf1+rfN44XNg7ygZEki+sbIyN9kNtXDIPhuegTWklGR6sG5dAN1jqJKXeUuv4Mx+D+yqGNqnOkqFQhB/mWB5l0XPw/Cn3IwEPYJNi5L/BhHEO2gZtCuj0z5kAlBVRwo65venvGn6dXoWUxAlVqp/KAWvKMzJsSFK595LEmhtPV5XDP+ZzcwMRQeKbLSdRYhUWZkH/gyrEw1hzFlrXOAIRXA/MwGP8nd7b3OY6/9eMr492VcbTnx9P+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764065772; c=relaxed/relaxed;
	bh=Rye+dkGKNNQ4N4PbVfKNGd2olFLjRhnboR82n7h1f/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hfdqJE4fVyoQ4vPRODZnsDXdX98ZVAmE6YGMe6x0NYTHVtbyZYLV97oGfpla7RP1+xYW/RpvsURK/EVLRpBAkQ6ZMQf0+/GdvMy5YXix3Kx81M7HnX1jhl2aKFshzEjOK3UtC2SvQsOedxfW5ctPem2hCQ0j+4R9nFwneVBEhtxlZw4yuYRYMiECn84yiRIwqC58wv3Lo7rtxNfqmfSAa599OjJ6BKgmmoFj/nX+d7CkaBYNO52ATpYK7MVnvAHeJVoIsHVQIjp5WtYjHIX2al8vEDCdeEF2bdpx/+UKPGkCVpey6O2iropqHO3hEwra8+PU2XXZmNQRUE9y+EbnrQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=QSghdSUA; dkim-atps=neutral; spf=pass (client-ip=94.100.134.236; helo=mx-relay47-hz3.antispameurope.com; envelope-from=prvs=041735bb26=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org) smtp.mailfrom=ew.tq-group.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=QSghdSUA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=94.100.134.236; helo=mx-relay47-hz3.antispameurope.com; envelope-from=prvs=041735bb26=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 116 seconds by postgrey-1.37 at boromir; Tue, 25 Nov 2025 21:16:06 AEDT
Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFz9f0kHWz30FR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 21:16:05 +1100 (AEDT)
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Rye+dkGKNNQ4N4PbVfKNGd2olFLjRhnboR82n7h1f/0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764065632;
 b=nnanlHSpQSbrTVCfjrKug/SIBZSBmUy5nMz8DzDPNchXE2s3GFPiivZHu9aePjNhGITNbGkY
 8YcdgtcKEAvAnboa4pKeskXPTMWwXRLIErERy6Mm7iMm0MPfhTwNhRy4dQWlVXI/0hVXHs0lEsk
 Ol5OeMJaV7mTsXqmtswm8HaamJHAI8hHslNlddJZY9aFmtBjCsfZoR+kdsdgSMQDPe2oPN4ylcD
 X3poAh9jv03BF5LD/WgswrCp/SZUclFqUcpHxXPXTpoTcM2lP0io7l533Q5NFG5YEuttxuBEzJh
 sioWLswU60YYHiCLTOH7UC8lybUDl6tUQRBBU4olOnrIg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764065632;
 b=qE4JWsSkvAyH4zucA2PhfDQSk82kLa+7geps6/fNFPk1inlqAQQOUMoMZ3AbjxfMjIMEb01k
 4Qb2anFOOgrbA8QzC5QufsTo1Yelep8exxrxeAZlxlEnucPvgT17X7U7KnbEWLlEQk9+Fu7CQdf
 MfDvM15daXYZc9YmWEnAOCXZqTnUc+KP1dwP4CWndz8ZQDzYv2dlczdoU1upW+7xpE977Qam9Qn
 1n93PdkrbyWorHh0X2hIU2reQJESAe4P8jjTnc4gulSoA/Zhww3j5lI1NIvzdmbauK0YRDZTLqp
 ygmVSysTYfr6A8dVTSSYzEQ05GbeSkV5nHRpUvuw/1oUw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Tue, 25 Nov 2025 11:13:51 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1BCAAA41379;
	Tue, 25 Nov 2025 11:13:38 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: fsl_xcvr: use dev_err_probe() replacing dev_err() + return
Date: Tue, 25 Nov 2025 11:13:33 +0100
Message-ID: <20251125101334.1596381-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linuxppc-dev@lists.ozlabs.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dFz6p5fyqz4MYpk
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:b0357d8e99060e6d3d18b33e90b892e4
X-cloud-security:scantime:2.101
DKIM-Signature: a=rsa-sha256;
 bh=Rye+dkGKNNQ4N4PbVfKNGd2olFLjRhnboR82n7h1f/0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764065631; v=1;
 b=QSghdSUAQQ+RhfbZuDqNeGUOF+uxH4evA7B87DWjDC9LMsg8vWnI1OWSLlYCrKi+z8+QhlX9
 zlqtQShQLwUTDVlnlxS/jFroSkD9M6qWdNjWCH+eGtKF1snKx6orMWRoc9HSkI6ni1VMn1ePgc+
 EqNOwvsMP4jY709/a+5SrA9EUWEJKcWQXKOEhI7d/8bSVZUCzBkUM7Sc9jUHdsnnNN55eE4lOxb
 7EC6zgwPIUbLbAcg8UvCGHujW4BaWaibkxifA4N15tawqOLC9HQ+WVKEw6JMCUuX1NdJaj0pGxe
 98pZnEdvtHwvG3LY8Z7GvW2bZUpssGMa2rcqTuZiZMfJQ==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use dev_err_probe() to simplify the code. This also silences -517 errors.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_xcvr.c | 86 ++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 52 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 5d804860f7d8c..07c9fef45b0f0 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1548,28 +1548,24 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	xcvr->soc_data = of_device_get_match_data(&pdev->dev);
 
 	xcvr->ipg_clk = devm_clk_get(dev, "ipg");
-	if (IS_ERR(xcvr->ipg_clk)) {
-		dev_err(dev, "failed to get ipg clock\n");
-		return PTR_ERR(xcvr->ipg_clk);
-	}
+	if (IS_ERR(xcvr->ipg_clk))
+		return dev_err_probe(dev, PTR_ERR(xcvr->ipg_clk),
+				     "failed to get ipg clock\n");
 
 	xcvr->phy_clk = devm_clk_get(dev, "phy");
-	if (IS_ERR(xcvr->phy_clk)) {
-		dev_err(dev, "failed to get phy clock\n");
-		return PTR_ERR(xcvr->phy_clk);
-	}
+	if (IS_ERR(xcvr->phy_clk))
+		return dev_err_probe(dev, PTR_ERR(xcvr->phy_clk),
+				     "failed to get phy clock\n");
 
 	xcvr->spba_clk = devm_clk_get(dev, "spba");
-	if (IS_ERR(xcvr->spba_clk)) {
-		dev_err(dev, "failed to get spba clock\n");
-		return PTR_ERR(xcvr->spba_clk);
-	}
+	if (IS_ERR(xcvr->spba_clk))
+		return dev_err_probe(dev, PTR_ERR(xcvr->spba_clk),
+				     "failed to get spba clock\n");
 
 	xcvr->pll_ipg_clk = devm_clk_get(dev, "pll_ipg");
-	if (IS_ERR(xcvr->pll_ipg_clk)) {
-		dev_err(dev, "failed to get pll_ipg clock\n");
-		return PTR_ERR(xcvr->pll_ipg_clk);
-	}
+	if (IS_ERR(xcvr->pll_ipg_clk))
+		return dev_err_probe(dev, PTR_ERR(xcvr->pll_ipg_clk),
+				     "failed to get pll_ipg clock\n");
 
 	fsl_asoc_get_pll_clocks(dev, &xcvr->pll8k_clk,
 				&xcvr->pll11k_clk);
@@ -1593,51 +1589,42 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 
 	xcvr->regmap = devm_regmap_init_mmio_clk(dev, NULL, regs,
 						 &fsl_xcvr_regmap_cfg);
-	if (IS_ERR(xcvr->regmap)) {
-		dev_err(dev, "failed to init XCVR regmap: %ld\n",
-			PTR_ERR(xcvr->regmap));
-		return PTR_ERR(xcvr->regmap);
-	}
+	if (IS_ERR(xcvr->regmap))
+		return dev_err_probe(dev, PTR_ERR(xcvr->regmap), "failed to init XCVR regmap\n");
 
 	if (xcvr->soc_data->use_phy) {
 		xcvr->regmap_phy = devm_regmap_init(dev, NULL, xcvr,
 						    &fsl_xcvr_regmap_phy_cfg);
-		if (IS_ERR(xcvr->regmap_phy)) {
-			dev_err(dev, "failed to init XCVR PHY regmap: %ld\n",
-				PTR_ERR(xcvr->regmap_phy));
-			return PTR_ERR(xcvr->regmap_phy);
-		}
+		if (IS_ERR(xcvr->regmap_phy))
+			return dev_err_probe(dev, PTR_ERR(xcvr->regmap_phy),
+					     "failed to init XCVR PHY regmap\n");
 
 		switch (xcvr->soc_data->pll_ver) {
 		case PLL_MX8MP:
 			xcvr->regmap_pll = devm_regmap_init(dev, NULL, xcvr,
 							    &fsl_xcvr_regmap_pllv0_cfg);
-			if (IS_ERR(xcvr->regmap_pll)) {
-				dev_err(dev, "failed to init XCVR PLL regmap: %ld\n",
-					PTR_ERR(xcvr->regmap_pll));
-				return PTR_ERR(xcvr->regmap_pll);
-			}
+			if (IS_ERR(xcvr->regmap_pll))
+				return dev_err_probe(dev, PTR_ERR(xcvr->regmap_pll),
+						     "failed to init XCVR PLL regmap\n");
 			break;
 		case PLL_MX95:
 			xcvr->regmap_pll = devm_regmap_init(dev, NULL, xcvr,
 							    &fsl_xcvr_regmap_pllv1_cfg);
-			if (IS_ERR(xcvr->regmap_pll)) {
-				dev_err(dev, "failed to init XCVR PLL regmap: %ld\n",
-					PTR_ERR(xcvr->regmap_pll));
-				return PTR_ERR(xcvr->regmap_pll);
-			}
+			if (IS_ERR(xcvr->regmap_pll))
+				return dev_err_probe(dev, PTR_ERR(xcvr->regmap_pll),
+						     "failed to init XCVR PLL regmap\n");
 			break;
 		default:
-			dev_err(dev, "Error for PLL version %d\n", xcvr->soc_data->pll_ver);
-			return -EINVAL;
+			return dev_err_probe(dev, -EINVAL,
+					     "Error for PLL version %d\n",
+					     xcvr->soc_data->pll_ver);
 		}
 	}
 
 	xcvr->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
-	if (IS_ERR(xcvr->reset)) {
-		dev_err(dev, "failed to get XCVR reset control\n");
-		return PTR_ERR(xcvr->reset);
-	}
+	if (IS_ERR(xcvr->reset))
+		return dev_err_probe(dev, PTR_ERR(xcvr->reset),
+				     "failed to get XCVR reset control\n");
 
 	/* get IRQs */
 	irq = platform_get_irq(pdev, 0);
@@ -1645,17 +1632,13 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 		return irq;
 
 	ret = devm_request_irq(dev, irq, irq0_isr, 0, pdev->name, xcvr);
-	if (ret) {
-		dev_err(dev, "failed to claim IRQ0: %i\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to claim IRQ0\n");
 
 	rx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rxfifo");
 	tx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "txfifo");
-	if (!rx_res || !tx_res) {
-		dev_err(dev, "could not find rxfifo or txfifo resource\n");
-		return -EINVAL;
-	}
+	if (!rx_res || !tx_res)
+		return dev_err_probe(dev, -EINVAL, "could not find rxfifo or txfifo resource\n");
 	xcvr->dma_prms_rx.chan_name = "rx";
 	xcvr->dma_prms_tx.chan_name = "tx";
 	xcvr->dma_prms_rx.addr = rx_res->start;
@@ -1678,8 +1661,7 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
 	if (ret) {
 		pm_runtime_disable(dev);
-		dev_err(dev, "failed to pcm register\n");
-		return ret;
+		return dev_err_probe(dev, ret, "failed to pcm register\n");
 	}
 
 	ret = devm_snd_soc_register_component(dev, &fsl_xcvr_comp,
-- 
2.43.0


