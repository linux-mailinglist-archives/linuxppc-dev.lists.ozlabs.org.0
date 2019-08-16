Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B47D390131
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 14:17:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4692Q217ZRzDrVN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 22:17:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=209.85.128.97; helo=mail-wm1-f97.google.com;
 envelope-from=postmaster@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com
 [209.85.128.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4692M915zKzDrTf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 22:14:57 +1000 (AEST)
Received: by mail-wm1-f97.google.com with SMTP id v19so3906878wmj.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 05:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=pLS4DxT1dPkt+ilKsw/CiwD4KIIKskFjBYK+1KbWdsE=;
 b=bOqtVqqoM24KRFCjIqhqjulnqJy+mV/o3H4J/YGAhO0YGAVP9VPdZPoBuFa6F5BVTZ
 VsPZlDTftC92jApwQQvJmawD8eC7Pvuw4lJ45gsbenaKOZcfz0kd/XeYH8DMkdfL2k+A
 O3ULSwlMPnfdOWEmi56ESGhaUFVe0uGGRX/1kL7uvJuXaKC0anpZazC71pBOhfapem3i
 wglul3lqR8wJOd5z38X/eSiRahr45E51jShSnA+ALZfyHJpJugQ7Vt7uIcO0fnfPYiga
 mZn5ejPfm31apTWRzwcdoAHMw5jfjYsV4XNYpSZ67uetAqsHf1Op2xeQo2d2Bx9pl48q
 eUgA==
X-Gm-Message-State: APjAAAW08fVjMsA+kRj6lRSl9HV59apc4TQwrHX82p+1YxhpsNbWDy8I
 TvNZL/7xbBN4aIyBGW704vqJxpidf5VwIWMlop2SVFl3gYmPUwTpHAhUe8sZcAFxvg==
X-Google-Smtp-Source: APXvYqySVq6C/xknyvsxzKlqH7UE+qi1NJxPkT+wedb/ovVs8FyUI5SRHDjge/ud7Koip4TsqGPgyJPtw6LB
X-Received: by 2002:a1c:cfc6:: with SMTP id f189mr6938434wmg.18.1565957694085; 
 Fri, 16 Aug 2019 05:14:54 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id d8sm90830wro.28.2019.08.16.05.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:14:54 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyb89-0003L6-Nv; Fri, 16 Aug 2019 12:14:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 184B12743134; Fri, 16 Aug 2019 13:14:53 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Applied "ASoC: imx-audmux: Add driver suspend and resume to support
 MEGA Fast" to the asoc tree
In-Reply-To: <1565931794-7218-1-git-send-email-shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190816121453.184B12743134@ypsilon.sirena.org.uk>
Date: Fri, 16 Aug 2019 13:14:53 +0100 (BST)
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
 linuxppc-dev@lists.ozlabs.org, s.hauer@pengutronix.de, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, perex@perex.cz, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: imx-audmux: Add driver suspend and resume to support MEGA Fast

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 8661ab5b23d6d30d8687fc05bc1dba8f9a64b444 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Fri, 16 Aug 2019 01:03:14 -0400
Subject: [PATCH] ASoC: imx-audmux: Add driver suspend and resume to support
 MEGA Fast

For i.MX6 SoloX, there is a mode of the SoC to shutdown all power
source of modules during system suspend and resume procedure.
Thus, AUDMUX needs to save all the values of registers before the
system suspend and restore them after the system resume.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://lore.kernel.org/r/1565931794-7218-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-audmux.c | 54 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index b2351cd33b0f..16ede3b5cb32 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -23,6 +23,8 @@
 
 static struct clk *audmux_clk;
 static void __iomem *audmux_base;
+static u32 *regcache;
+static u32 reg_max;
 
 #define IMX_AUDMUX_V2_PTCR(x)		((x) * 8)
 #define IMX_AUDMUX_V2_PDCR(x)		((x) * 8 + 4)
@@ -317,8 +319,23 @@ static int imx_audmux_probe(struct platform_device *pdev)
 	if (of_id)
 		pdev->id_entry = of_id->data;
 	audmux_type = pdev->id_entry->driver_data;
-	if (audmux_type == IMX31_AUDMUX)
+
+	switch (audmux_type) {
+	case IMX31_AUDMUX:
 		audmux_debugfs_init();
+		reg_max = 14;
+		break;
+	case IMX21_AUDMUX:
+		reg_max = 6;
+		break;
+	default:
+		dev_err(&pdev->dev, "unsupported version!\n");
+		return -EINVAL;
+	}
+
+	regcache = devm_kzalloc(&pdev->dev, sizeof(u32) * reg_max, GFP_KERNEL);
+	if (!regcache)
+		return -ENOMEM;
 
 	if (of_id)
 		imx_audmux_parse_dt_defaults(pdev, pdev->dev.of_node);
@@ -334,12 +351,47 @@ static int imx_audmux_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int imx_audmux_suspend(struct device *dev)
+{
+	int i;
+
+	clk_prepare_enable(audmux_clk);
+
+	for (i = 0; i < reg_max; i++)
+		regcache[i] = readl(audmux_base + i * 4);
+
+	clk_disable_unprepare(audmux_clk);
+
+	return 0;
+}
+
+static int imx_audmux_resume(struct device *dev)
+{
+	int i;
+
+	clk_prepare_enable(audmux_clk);
+
+	for (i = 0; i < reg_max; i++)
+		writel(regcache[i], audmux_base + i * 4);
+
+	clk_disable_unprepare(audmux_clk);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static const struct dev_pm_ops imx_audmux_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(imx_audmux_suspend, imx_audmux_resume)
+};
+
 static struct platform_driver imx_audmux_driver = {
 	.probe		= imx_audmux_probe,
 	.remove		= imx_audmux_remove,
 	.id_table	= imx_audmux_ids,
 	.driver	= {
 		.name	= DRIVER_NAME,
+		.pm = &imx_audmux_pm,
 		.of_match_table = imx_audmux_dt_ids,
 	}
 };
-- 
2.20.1

