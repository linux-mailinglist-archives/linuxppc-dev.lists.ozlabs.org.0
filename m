Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 148FE579693
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 11:45:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnDV471xyz3dpd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 19:45:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnDSV08KPz2xmh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 19:44:24 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 37D5A200C05;
	Tue, 19 Jul 2022 11:44:22 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E5949200BFE;
	Tue, 19 Jul 2022 11:44:21 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id AE3401802204;
	Tue, 19 Jul 2022 17:44:20 +0800 (+08)
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
Subject: [PATCH -next 3/5] ASoC: fsl-asoc-card: force cast the asrc_format type
Date: Tue, 19 Jul 2022 17:27:42 +0800
Message-Id: <1658222864-25378-4-git-send-email-shengjiu.wang@nxp.com>
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
sound/soc/fsl/fsl-asoc-card.c:833:45: sparse: warning: incorrect type in argument 3 (different base types)
sound/soc/fsl/fsl-asoc-card.c:833:45: sparse:    expected unsigned int [usertype] *out_value
sound/soc/fsl/fsl-asoc-card.c:833:45: sparse:    got restricted snd_pcm_format_t *

Fixes: 859e364302c5 ("ASoC: fsl-asoc-card: Support new property fsl, asrc-format")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index d9a0d4768c4d..c63f7d6517cf 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -830,7 +830,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		}
 
 		ret = of_property_read_u32(asrc_np, "fsl,asrc-format",
-					   &priv->asrc_format);
+					   (u32 *)&priv->asrc_format);
 		if (ret) {
 			/* Fallback to old binding; translate to asrc_format */
 			ret = of_property_read_u32(asrc_np, "fsl,asrc-width",
-- 
2.34.1

