Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 954933A3C10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 08:37:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1WNT0y72z3c1P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 16:37:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector3 header.b=dV2As57f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=nselector3 header.b=dV2As57f; 
 dkim-atps=neutral
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1WN10ck9z3018
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 16:36:47 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 40D111A08FB;
 Fri, 11 Jun 2021 08:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com 40D111A08FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
 s=nselector3; t=1623393403;
 bh=x9r3mjo9myPoai+Ewzu7TLgGVipVL1jSKJszV5CRyXE=;
 h=From:To:Cc:Subject:Date:From;
 b=dV2As57fc9O82/cEtKmI6HJk0DPljB4jatogj/86XEAebYqRX/4RKpBOA9BePqIU5
 UIQgPE7SYQk9WQOueK2IzlTuiB7RxU0+8EEIRibVeDTKY3XU6MtbsBF04LVDA/otdn
 ihRvBSGAYbNbFYVGEfBtc6aFX5xeCLY/E3l5KyEaWFlq5ZOPJc+p+umtrWthrJK7Dv
 X4aKXtpPJNLGOrDWskniLL2Fp2Oxu4lpx1v69XtnAmLAihrFlHMNCgn+JIy3YOL3ik
 IZpRcSpHoaZiqjweEX1wi/MBJh//GC5T2rzSPlyotSY53hY+tdmuOX2VsjJ6awor90
 n/YZAd4UepYiQ==
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1DD841A0903;
 Fri, 11 Jun 2021 08:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com 1DD841A0903
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 48C2740130;
 Fri, 11 Jun 2021 14:36:33 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_spdif: Fix error handler with pm_runtime_enable
Date: Fri, 11 Jun 2021 14:18:38 +0800
Message-Id: <1623392318-26304-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

There is error message when defer probe happens:

fsl-spdif-dai 2dab0000.spdif: Unbalanced pm_runtime_enable!

Fix the error handler with pm_runtime_enable and add
fsl_spdif_remove() for pm_runtime_disable.

Fixes: 9cb2b3796e08 ("ASoC: fsl_spdif: Add pm runtime function")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 2a76714eb8e6..76a7c9581333 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1441,16 +1441,29 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 					      &spdif_priv->cpu_dai_drv, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register DAI: %d\n", ret);
-		return ret;
+		goto err_pm_disable;
 	}
 
 	ret = imx_pcm_dma_init(pdev, IMX_SPDIF_DMABUF_SIZE);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(&pdev->dev, "imx_pcm_dma_init failed: %d\n", ret);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "imx_pcm_dma_init failed\n");
+		goto err_pm_disable;
+	}
+
+	return ret;
 
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
 	return ret;
 }
 
+static int fsl_spdif_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
 #ifdef CONFIG_PM
 static int fsl_spdif_runtime_suspend(struct device *dev)
 {
@@ -1554,6 +1567,7 @@ static struct platform_driver fsl_spdif_driver = {
 		.pm = &fsl_spdif_pm,
 	},
 	.probe = fsl_spdif_probe,
+	.remove = fsl_spdif_remove,
 };
 
 module_platform_driver(fsl_spdif_driver);
-- 
2.27.0

