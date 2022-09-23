Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C05E7879
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 12:35:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYpSc24r9z3cBK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 20:35:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYpS8677cz3c6R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 20:34:47 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B12451B7BF5;
	Fri, 23 Sep 2022 12:34:44 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6605C1A0F3B;
	Fri, 23 Sep 2022 12:34:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 978121820F5A;
	Fri, 23 Sep 2022 18:34:42 +0800 (+08)
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
Subject: [RESEND PATCH] ASoC: fsl_asrc_dma: fully initialize structs
Date: Fri, 23 Sep 2022 18:15:47 +0800
Message-Id: <1663928147-10106-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sascha Hauer <s.hauer@pengutronix.de>

The driver uses two statically ininitialized struct dma_slave_config,
but only one of them is initialized to zero. Initialize config_be to
zero as well to make sure that no fields are filled with random values.
Let the compiler do this instead of explicitly calling memset() which
makes it easier to read.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 12ddf2320f2d..3b81a465814a 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -139,7 +139,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	struct dma_chan *tmp_chan = NULL, *be_chan = NULL;
 	struct snd_soc_component *component_be = NULL;
 	struct fsl_asrc *asrc = pair->asrc;
-	struct dma_slave_config config_fe, config_be;
+	struct dma_slave_config config_fe = {}, config_be = {};
 	struct sdma_peripheral_config audio_config;
 	enum asrc_pair_index index = pair->index;
 	struct device *dev = component->dev;
@@ -183,7 +183,6 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	memset(&config_fe, 0, sizeof(config_fe));
 	ret = snd_dmaengine_pcm_prepare_slave_config(substream, params, &config_fe);
 	if (ret) {
 		dev_err(dev, "failed to prepare DMA config for Front-End\n");
-- 
2.34.1

