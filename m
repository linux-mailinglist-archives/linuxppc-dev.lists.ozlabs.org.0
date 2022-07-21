Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 183DA57C959
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 12:48:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpTmv0Xvpz3fCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 20:47:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpTkN2tGkz3bls
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 20:45:48 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B2615203901;
	Thu, 21 Jul 2022 12:45:45 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7B4C52038FA;
	Thu, 21 Jul 2022 12:45:45 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 090BC1800318;
	Thu, 21 Jul 2022 18:45:43 +0800 (+08)
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
Subject: [PATCH v2 -next 5/5] ASoC: imx-card: use snd_pcm_format_t type for asrc_format
Date: Thu, 21 Jul 2022 18:29:53 +0800
Message-Id: <1658399393-28777-6-git-send-email-shengjiu.wang@nxp.com>
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
sound/soc/fsl/imx-card.c:653:59: sparse: warning: incorrect type in assignment (different base types)
sound/soc/fsl/imx-card.c:653:59: sparse:    expected unsigned int [usertype] asrc_format
sound/soc/fsl/imx-card.c:653:59: sparse:    got restricted snd_pcm_format_t [usertype]
sound/soc/fsl/imx-card.c:655:59: sparse: warning: incorrect type in assignment (different base types)
sound/soc/fsl/imx-card.c:655:59: sparse:    expected unsigned int [usertype] asrc_format
sound/soc/fsl/imx-card.c:655:59: sparse:    got restricted snd_pcm_format_t [usertype]

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index ccc4194dc5e7..14be29530fb5 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -118,7 +118,7 @@ struct imx_card_data {
 	struct snd_soc_card card;
 	int num_dapm_routes;
 	u32 asrc_rate;
-	u32 asrc_format;
+	snd_pcm_format_t asrc_format;
 };
 
 static struct imx_akcodec_fs_mul ak4458_fs_mul[] = {
@@ -474,7 +474,7 @@ static int be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 	mask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	snd_mask_none(mask);
-	snd_mask_set(mask, data->asrc_format);
+	snd_mask_set(mask, (__force unsigned int)data->asrc_format);
 
 	return 0;
 }
@@ -493,6 +493,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	struct dai_link_data *link_data;
 	struct of_phandle_args args;
 	int ret, num_links;
+	u32 asrc_fmt = 0;
 	u32 width;
 
 	ret = snd_soc_of_parse_card_name(card, "model");
@@ -639,7 +640,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 				goto err;
 			}
 
-			ret = of_property_read_u32(args.np, "fsl,asrc-format", &data->asrc_format);
+			ret = of_property_read_u32(args.np, "fsl,asrc-format", &asrc_fmt);
+			data->asrc_format = (__force snd_pcm_format_t)asrc_fmt;
 			if (ret) {
 				/* Fallback to old binding; translate to asrc_format */
 				ret = of_property_read_u32(args.np, "fsl,asrc-width", &width);
-- 
2.34.1

