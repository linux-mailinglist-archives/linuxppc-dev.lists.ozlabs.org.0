Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AB951F817
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 11:26:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxbR5030bz3cJg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 19:26:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxbQd2F38z2yp5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 19:26:30 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3248F200E75;
 Mon,  9 May 2022 11:26:27 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F09C3200E74;
 Mon,  9 May 2022 11:26:26 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 510B9180031C;
 Mon,  9 May 2022 17:26:25 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl_micfil: Add support for i.MX8MPlus
Date: Mon,  9 May 2022 17:14:22 +0800
Message-Id: <1652087663-1908-1-git-send-email-shengjiu.wang@nxp.com>
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

On i.MX8Plus there are two updates for micfil module.

One is that the output format is S32_LE, only the 24 more
significative bits have information, the other bits are always
zero. Add 'formats' variable in soc data to distinguish the
format on different platform.
Another is that the fifo depth is 32 entries.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index e4d1da55293e..25c647ae080a 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -55,6 +55,7 @@ struct fsl_micfil_soc_data {
 	unsigned int fifo_depth;
 	unsigned int dataline;
 	bool imx;
+	u64  formats;
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx8mm = {
@@ -62,10 +63,20 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mm = {
 	.fifos = 8,
 	.fifo_depth = 8,
 	.dataline =  0xf,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+};
+
+static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
+	.imx = true,
+	.fifos = 8,
+	.fifo_depth = 32,
+	.dataline =  0xf,
+	.formats = SNDRV_PCM_FMTBIT_S32_LE,
 };
 
 static const struct of_device_id fsl_micfil_dt_ids[] = {
 	{ .compatible = "fsl,imx8mm-micfil", .data = &fsl_micfil_imx8mm },
+	{ .compatible = "fsl,imx8mp-micfil", .data = &fsl_micfil_imx8mp },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_micfil_dt_ids);
@@ -659,6 +670,8 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	fsl_micfil_dai.capture.formats = micfil->soc->formats;
+
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_micfil_component,
 					      &fsl_micfil_dai, 1);
 	if (ret) {
-- 
2.17.1

