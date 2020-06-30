Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75920F714
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 16:26:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x69f20lFzDqc8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 00:26:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x5mL0BCCzDqdg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 00:08:01 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E65DA1A0480;
 Tue, 30 Jun 2020 16:07:56 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 26BAD1A046C;
 Tue, 30 Jun 2020 16:07:52 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 45150402D0;
 Tue, 30 Jun 2020 22:07:46 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3] ASoC: fsl_asrc: Add an option to select internal ratio mode
Date: Tue, 30 Jun 2020 21:56:07 +0800
Message-Id: <1593525367-23221-1-git-send-email-shengjiu.wang@nxp.com>
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

The ASRC not only supports ideal ratio mode, but also supports
internal ratio mode.

For internal rato mode, the rate of clock source should be divided
with no remainder by sample rate, otherwise there is sound
distortion.

Add function fsl_asrc_select_clk() to find proper clock source for
internal ratio mode, if the clock source is available then internal
ratio mode will be selected.

With change, the ideal ratio mode is not the only option for user.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v3
- convert fsl_asrc_select_clk to void type

changes in v2
- update according to Nicolin's comments

 sound/soc/fsl/fsl_asrc.c | 46 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 95f6a9617b0b..462ce9f9ab48 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -582,11 +582,51 @@ static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
 			SNDRV_PCM_HW_PARAM_RATE, &fsl_asrc_rate_constraints);
 }
 
+/* Select proper clock source for internal ratio mode */
+static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
+				struct fsl_asrc_pair *pair,
+				int in_rate,
+				int out_rate)
+{
+	struct fsl_asrc_pair_priv *pair_priv = pair->private;
+	struct asrc_config *config = pair_priv->config;
+	int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
+	int clk_rate, clk_index;
+	int i = 0, j = 0;
+
+	rate[IN] = in_rate;
+	rate[OUT] = out_rate;
+
+	/* Select proper clock source for internal ratio mode */
+	for (j = 0; j < 2; j++) {
+		for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
+			clk_index = asrc_priv->clk_map[j][i];
+			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
+			/* Only match a perfect clock source with no remainder */
+			if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
+			    (clk_rate % rate[j]) == 0)
+				break;
+		}
+
+		select_clk[j] = i;
+	}
+
+	/* Switch to ideal ratio mode if there is no proper clock source */
+	if (select_clk[IN] == ASRC_CLK_MAP_LEN || select_clk[OUT] == ASRC_CLK_MAP_LEN) {
+		select_clk[IN] = INCLK_NONE;
+		select_clk[OUT] = OUTCLK_ASRCK1_CLK;
+	}
+
+	config->inclk = select_clk[IN];
+	config->outclk = select_clk[OUT];
+}
+
 static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params,
 				  struct snd_soc_dai *dai)
 {
 	struct fsl_asrc *asrc = snd_soc_dai_get_drvdata(dai);
+	struct fsl_asrc_priv *asrc_priv = asrc->private;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	struct fsl_asrc_pair_priv *pair_priv = pair->private;
@@ -605,8 +645,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	config.pair = pair->index;
 	config.channel_num = channels;
-	config.inclk = INCLK_NONE;
-	config.outclk = OUTCLK_ASRCK1_CLK;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		config.input_format   = params_format(params);
@@ -620,6 +658,10 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 		config.output_sample_rate = rate;
 	}
 
+	fsl_asrc_select_clk(asrc_priv, pair,
+			    config.input_sample_rate,
+			    config.output_sample_rate);
+
 	ret = fsl_asrc_config_pair(pair, false);
 	if (ret) {
 		dev_err(dai->dev, "fail to config asrc pair\n");
-- 
2.21.0

