Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F421957C94C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 12:46:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpTlB5vJGz3dwH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 20:46:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpTkL2SN4z2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 20:45:45 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B83611A0BE4;
	Thu, 21 Jul 2022 12:45:42 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 811F21A362D;
	Thu, 21 Jul 2022 12:45:42 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0EE7C180222A;
	Thu, 21 Jul 2022 18:45:40 +0800 (+08)
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
Subject: [PATCH v2 -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
Date: Thu, 21 Jul 2022 18:29:50 +0800
Message-Id: <1658399393-28777-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1658399393-28777-1-git-send-email-shengjiu.wang@nxp.com>
References: <1658399393-28777-1-git-send-email-shengjiu.wang@nxp.com>
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

Fix sparse warning:
sound/soc/fsl/fsl_asrc.c:1177:60: sparse: warning: incorrect type in argument 3 (different base types)
sound/soc/fsl/fsl_asrc.c:1177:60: sparse:    expected unsigned int [usertype] *out_value
sound/soc/fsl/fsl_asrc.c:1177:60: sparse:    got restricted snd_pcm_format_t *
sound/soc/fsl/fsl_asrc.c:1200:47: sparse: warning: restricted snd_pcm_format_t degrades to integer

Fixes: 4520af41fd21 ("ASoC: fsl_asrc: Support new property fsl,asrc-format")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 20a9f8e924b3..aa5edf32d988 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1066,6 +1066,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *regs;
 	int irq, ret, i;
+	u32 asrc_fmt = 0;
 	u32 map_idx;
 	char tmp[16];
 	u32 width;
@@ -1174,7 +1175,8 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc->asrc_format);
+	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc_fmt);
+	asrc->asrc_format = (__force snd_pcm_format_t)asrc_fmt;
 	if (ret) {
 		ret = of_property_read_u32(np, "fsl,asrc-width", &width);
 		if (ret) {
@@ -1197,7 +1199,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (!(FSL_ASRC_FORMATS & (1ULL << asrc->asrc_format))) {
+	if (!(FSL_ASRC_FORMATS & pcm_format_to_bits(asrc->asrc_format))) {
 		dev_warn(&pdev->dev, "unsupported width, use default S24_LE\n");
 		asrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
 	}
-- 
2.34.1

