Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2119A87D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:19:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sgd16gyNzDqpM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:19:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sg2s60yjzDqmX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 19:53:25 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 47BAB1A0D50;
 Wed,  1 Apr 2020 10:53:21 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 27CD11A0D44;
 Wed,  1 Apr 2020 10:53:14 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 58100402D0;
 Wed,  1 Apr 2020 16:53:05 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v6 3/7] ASoC: fsl-asoc-card: Support new property fsl,
 asrc-format
Date: Wed,  1 Apr 2020 16:45:36 +0800
Message-Id: <b8d6d9322e865f61f0c9cb17c69a399624e07676.1585726761.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1585726761.git.shengjiu.wang@nxp.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1585726761.git.shengjiu.wang@nxp.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
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

In order to align with new ESARC, we add new property fsl,asrc-format.
The fsl,asrc-format can replace the fsl,asrc-width, driver
can accept format from devicetree, don't need to convert it to
format through width.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index bb33601fab84..a0f5eb27d61a 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -680,17 +680,20 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 			goto asrc_fail;
 		}
 
-		ret = of_property_read_u32(asrc_np, "fsl,asrc-width", &width);
+		ret = of_property_read_u32(asrc_np, "fsl,asrc-format", &priv->asrc_format);
 		if (ret) {
-			dev_err(&pdev->dev, "failed to get output rate\n");
-			ret = -EINVAL;
-			goto asrc_fail;
-		}
+			/* Fallback to old binding; translate to asrc_format */
+			ret = of_property_read_u32(asrc_np, "fsl,asrc-width", &width);
+			if (ret) {
+				dev_err(&pdev->dev, "failed to get output width\n");
+				return ret;
+			}
 
-		if (width == 24)
-			priv->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
-		else
-			priv->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
+			if (width == 24)
+				priv->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
+			else
+				priv->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
+		}
 	}
 
 	/* Finish card registering */
-- 
2.21.0

