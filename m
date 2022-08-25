Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD355A10E6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 14:45:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD2kq4T2Wz3bY3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 22:45:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD2k44BFNz3bd4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 22:45:16 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 841371A1835;
	Thu, 25 Aug 2022 14:45:13 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4D94C1A1833;
	Thu, 25 Aug 2022 14:45:13 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id C44C21820F5D;
	Thu, 25 Aug 2022 20:45:11 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: fsl_aud2htx: Add error handler for pm_runtime_enable
Date: Thu, 25 Aug 2022 20:27:40 +0800
Message-Id: <1661430460-5234-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1661430460-5234-1-git-send-email-shengjiu.wang@nxp.com>
References: <1661430460-5234-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Call pm_runtime_disable() when error happens in probe()

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_aud2htx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index bc1b9c6df95c..1e421d9a03fb 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -241,6 +241,7 @@ static int fsl_aud2htx_probe(struct platform_device *pdev)
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to pcm register\n");
+		pm_runtime_disable(&pdev->dev);
 		return ret;
 	}
 
@@ -249,6 +250,7 @@ static int fsl_aud2htx_probe(struct platform_device *pdev)
 					      &fsl_aud2htx_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
+		pm_runtime_disable(&pdev->dev);
 		return ret;
 	}
 
-- 
2.34.1

