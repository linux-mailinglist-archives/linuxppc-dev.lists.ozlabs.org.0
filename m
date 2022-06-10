Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A56F7545C06
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 08:02:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LK9Mw4HSwz3cgD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 16:02:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LK9M56djlz3bnS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 16:01:18 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3EE3F1A00BF;
	Fri, 10 Jun 2022 08:01:16 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EB9501A005B;
	Fri, 10 Jun 2022 08:01:15 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8217D1802202;
	Fri, 10 Jun 2022 14:01:14 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_mqs: Add support for i.MX93 platform
Date: Fri, 10 Jun 2022 13:47:22 +0800
Message-Id: <1654840042-7069-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654840042-7069-1-git-send-email-shengjiu.wang@nxp.com>
References: <1654840042-7069-1-git-send-email-shengjiu.wang@nxp.com>
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

Add i.MX93 compatible string and specific soc data

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_mqs.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 8a8d727319d6..aefb73cab59c 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -338,9 +338,23 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx6sx_data = {
 	.div_shift = IMX6SX_GPR2_MQS_CLK_DIV_SHIFT,
 };
 
+static const struct fsl_mqs_soc_data fsl_mqs_imx93_data = {
+	.use_gpr = true,
+	.ctrl_off = 0x20,
+	.en_mask  = BIT(1),
+	.en_shift = 1,
+	.rst_mask = BIT(2),
+	.rst_shift = 2,
+	.osr_mask = BIT(3),
+	.osr_shift = 3,
+	.div_mask = GENMASK(15, 8),
+	.div_shift = 8,
+};
+
 static const struct of_device_id fsl_mqs_dt_ids[] = {
 	{ .compatible = "fsl,imx8qm-mqs", .data = &fsl_mqs_imx8qm_data },
 	{ .compatible = "fsl,imx6sx-mqs", .data = &fsl_mqs_imx6sx_data },
+	{ .compatible = "fsl,imx93-mqs", .data = &fsl_mqs_imx93_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_mqs_dt_ids);
-- 
2.17.1

