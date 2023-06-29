Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44097741E2F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 04:20:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qs2Gt1W5vz3cHc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 12:20:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qs2FH4B6hz2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 12:18:59 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D340B200D46;
	Thu, 29 Jun 2023 04:10:38 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9C585200D3F;
	Thu, 29 Jun 2023 04:10:38 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D7DBF181D0E3;
	Thu, 29 Jun 2023 10:10:36 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] ASoC: fsl_asrc: enable memory to memory function
Date: Thu, 29 Jun 2023 09:37:52 +0800
Message-Id: <1688002673-28493-6-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Intergrate memory to memory feature to ASRC driver,
call m2m probe(), remove(), suspend() and resume()
in different callback.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 30190ccb74e7..bd5f134e3473 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -17,6 +17,7 @@
 #include <sound/pcm_params.h>
 
 #include "fsl_asrc.h"
+#include "fsl_asrc_m2m.h"
 
 #define IDEAL_RATIO_DECIMAL_DEPTH 26
 #define DIVIDER_NUM  64
@@ -1380,6 +1381,13 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		goto err_pm_get_sync;
 	}
 
+	/* probe m2m feature */
+	ret = fsl_asrc_m2m_probe(asrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
+		goto err_pm_get_sync;
+	}
+
 	return 0;
 
 err_pm_get_sync:
@@ -1392,6 +1400,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 static void fsl_asrc_remove(struct platform_device *pdev)
 {
+	/* remove m2m feature */
+	fsl_asrc_m2m_remove(pdev);
+
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		fsl_asrc_runtime_suspend(&pdev->dev);
@@ -1493,10 +1504,32 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused fsl_asrc_suspend(struct device *dev)
+{
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+
+	/* suspend asrc m2m */
+	fsl_asrc_m2m_suspend(asrc);
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int __maybe_unused fsl_asrc_resume(struct device *dev)
+{
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+
+	/* resume asrc m2m */
+	fsl_asrc_m2m_resume(asrc);
+
+	return ret;
+}
+
 static const struct dev_pm_ops fsl_asrc_pm = {
 	SET_RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
 };
 
 static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
-- 
2.34.1

