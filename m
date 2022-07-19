Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 592B357968A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 11:45:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnDTf21bFz3dyL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 19:45:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnDST6mqwz2xjy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 19:44:24 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A247E200C11;
	Tue, 19 Jul 2022 11:44:21 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5BAA1200C05;
	Tue, 19 Jul 2022 11:44:21 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id AFE23181D0CA;
	Tue, 19 Jul 2022 17:44:19 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
Date: Tue, 19 Jul 2022 17:27:41 +0800
Message-Id: <1658222864-25378-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
References: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
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

Fix sparse warning:
sound/soc/fsl/fsl_asrc.c:1177:60: sparse: warning: incorrect type in argument 3 (different base types)
sound/soc/fsl/fsl_asrc.c:1177:60: sparse:    expected unsigned int [usertype] *out_value
sound/soc/fsl/fsl_asrc.c:1177:60: sparse:    got restricted snd_pcm_format_t *
sound/soc/fsl/fsl_asrc.c:1200:47: sparse: warning: restricted snd_pcm_format_t degrades to integer

Fixes: 4520af41fd21 ("ASoC: fsl_asrc: Support new property fsl,asrc-format")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 20a9f8e924b3..544395efd605 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1174,7 +1174,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc->asrc_format);
+	ret = of_property_read_u32(np, "fsl,asrc-format", (u32 *)&asrc->asrc_format);
 	if (ret) {
 		ret = of_property_read_u32(np, "fsl,asrc-width", &width);
 		if (ret) {
@@ -1197,7 +1197,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (!(FSL_ASRC_FORMATS & (1ULL << asrc->asrc_format))) {
+	if (!(FSL_ASRC_FORMATS & (1ULL << (__force u32)asrc->asrc_format))) {
 		dev_warn(&pdev->dev, "unsupported width, use default S24_LE\n");
 		asrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
 	}
-- 
2.34.1

