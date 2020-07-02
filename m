Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C278212F95
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 00:38:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yY0c3ztCzDqbW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:38:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=arnaud.ferraris@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yL0t4bM2zDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 00:23:10 +1000 (AEST)
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:315a:ecf0:6250:a3ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3489A2A5C36;
 Thu,  2 Jul 2020 15:23:07 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: 
Subject: [PATCH 2/4] ASoC: fsl_asrc: allow using arbitrary input and output
 clocks
Date: Thu,  2 Jul 2020 16:22:33 +0200
Message-Id: <20200702142235.235869-3-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:28:34 +1000
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
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, linuxppc-dev@lists.ozlabs.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fsl_asrc currently uses hardcoded input and output clocks, preventing
its use for anything other than S/PDIF output.

This patch adds the ability to select any clock as input or output (by
using new DT properties), making it possible to use this peripheral in a
more advanced way.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 sound/soc/fsl/fsl_asrc.c        | 18 ++++++++++++++++--
 sound/soc/fsl/fsl_asrc_common.h |  3 +++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 95f6a9617b0b..75df220e4b51 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -605,8 +605,8 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	config.pair = pair->index;
 	config.channel_num = channels;
-	config.inclk = INCLK_NONE;
-	config.outclk = OUTCLK_ASRCK1_CLK;
+	config.inclk = asrc->inclk;
+	config.outclk = asrc->outclk;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		config.input_format   = params_format(params);
@@ -1067,6 +1067,20 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	asrc->channel_avail = 10;
 
+	ret = of_property_read_u32(np, "fsl,asrc-input-clock",
+				   &asrc->inclk);
+	if (ret) {
+		dev_info(&pdev->dev, "no input clock specified, using none\n");
+		asrc->inclk = INCLK_NONE;
+	}
+
+	ret = of_property_read_u32(np, "fsl,asrc-output-clock",
+				   &asrc->outclk);
+	if (ret) {
+		dev_info(&pdev->dev, "no output clock specified, using default\n");
+		asrc->outclk = OUTCLK_ASRCK1_CLK;
+	}
+
 	ret = of_property_read_u32(np, "fsl,asrc-rate",
 				   &asrc->asrc_rate);
 	if (ret) {
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 7e1c13ca37f1..1468878fbaca 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -89,6 +89,9 @@ struct fsl_asrc {
 	struct fsl_asrc_pair *pair[PAIR_CTX_NUM];
 	unsigned int channel_avail;
 
+	enum asrc_inclk inclk;
+	enum asrc_outclk outclk;
+
 	int asrc_rate;
 	snd_pcm_format_t asrc_format;
 	bool use_edma;
-- 
2.27.0

