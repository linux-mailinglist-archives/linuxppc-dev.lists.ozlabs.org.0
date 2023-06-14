Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724372FE36
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 14:17:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=NSmlcxPX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh4Dj3kG3z30hJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 22:17:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=NSmlcxPX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=claudiu.beznea@microchip.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 22:16:36 AEST
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh4Cm2R4Nz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 22:16:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686744996; x=1718280996;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P+MmFBvDwsbGKAJINRgeRSJGf75kuY7a6+YGCSbxmxY=;
  b=NSmlcxPX7CbISj9giB6XV1/BjisUYWzIqegCVUMYjdMnfEOrwApZIU6T
   +QKRDTW3kjg9b6ehAvHD5dsqnHFpJ0KN/xOzDeeTeceBl4jc6IsNNTxK5
   /NaamhgFVDNYfYtwVpVBG07ZYsUuO73H5TlIO96YECN5Tz5N+AbsoS3mj
   I8NnO1588cTSOaNRXenj5ZzQfMtU1GofsYH3njyYyvE7no6zhkbwDEg/Q
   fCz4gAtri8cxOX2Vb2PH/DKQW8REe3qmW04uKgS4NoHaypWwFvmFdP8SN
   liAHd5326t3zdWsWhHUjz//340ShyMFhIafP88HtRuJSgjBzM2mfFgYGA
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="217804545"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2023 05:15:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 14 Jun 2023 05:15:27 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 14 Jun 2023 05:15:18 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>, <festevam@gmail.com>,
	<nicoleotsuka@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shawnguo@kernel.org>,
	<s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <linux-imx@nxp.com>,
	<viorel.suman@nxp.com>
Subject: [PATCH] ASoC: imx-audmix: check return value of devm_kasprintf()
Date: Wed, 14 Jun 2023 15:15:09 +0300
Message-ID: <20230614121509.443926-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

devm_kasprintf() returns a pointer to dynamically allocated memory.
Pointer could be NULL in case allocation fails. Check pointer validity.
Identified with coccinelle (kmerr.cocci script).

Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---

Hi,

This has been addressed using kmerr.cocci script proposed for update
at [1].

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20230530074044.1603426-1-claudiu.beznea@microchip.com/

 sound/soc/fsl/imx-audmix.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 2c57fe9d2d08..af06268ee57b 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -228,6 +228,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 
 		dai_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s%s",
 					  fe_name_pref, args.np->full_name + 1);
+		if (!dai_name)
+			return -ENOMEM;
 
 		dev_info(pdev->dev.parent, "DAI FE name:%s\n", dai_name);
 
@@ -236,6 +238,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 			capture_dai_name =
 				devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s %s",
 					       dai_name, "CPU-Capture");
+			if (!capture_dai_name)
+				return -ENOMEM;
 		}
 
 		priv->dai[i].cpus = &dlc[0];
@@ -263,6 +267,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 				       "AUDMIX-Playback-%d", i);
 		be_cp = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 				       "AUDMIX-Capture-%d", i);
+		if (!be_name || !be_pb || !be_cp)
+			return -ENOMEM;
 
 		priv->dai[num_dai + i].cpus = &dlc[2];
 		priv->dai[num_dai + i].codecs = &dlc[3];
@@ -287,6 +293,9 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dapm_routes[i].source =
 			devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s %s",
 				       dai_name, "CPU-Playback");
+		if (!priv->dapm_routes[i].source)
+			return -ENOMEM;
+
 		priv->dapm_routes[i].sink = be_pb;
 		priv->dapm_routes[num_dai + i].source   = be_pb;
 		priv->dapm_routes[num_dai + i].sink     = be_cp;
-- 
2.34.1

