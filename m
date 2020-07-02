Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFAB212FA3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 00:42:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yY4f0JwLzDqZn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:42:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 helo=bhuna.collabora.co.uk; envelope-from=arnaud.ferraris@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yL0x5Pz3zDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 00:23:13 +1000 (AEST)
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:315a:ecf0:6250:a3ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 34A3E2A5EC7;
 Thu,  2 Jul 2020 15:23:10 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: 
Subject: [PATCH 4/4] ASoC: fsl_asrc: swap input and output clocks in capture
 mode
Date: Thu,  2 Jul 2020 16:22:35 +0200
Message-Id: <20200702142235.235869-5-arnaud.ferraris@collabora.com>
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

The input clock is the reference clock we need to convert the stream to,
which therefore has to be the clock of the origin stream/device.

When the stream is bi-directional and we want ASRC to act on both
directions, we need to swap the input and output clocks between the
playback and capture streams.

As some of the clocks have different ID's depending on whether they are
used as input or output, this requires adding a new function to find the
output clock ID corresponding to a given input clock.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 sound/soc/fsl/fsl_asrc.c | 50 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 65e7307a3df0..5aeab1fbcdd9 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -506,6 +506,50 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	return fsl_asrc_set_ideal_ratio(pair, inrate, outrate);
 }
 
+/**
+ * Select the output clock corresponding to a given input clock (and vice-versa)
+ *
+ * If we want to setup a capture channel, the input and output clocks have to
+ * be swapped.
+ * However, even if most of the clocks have the same index when used as input
+ * or output, some of them (ESAI, SSI* and SPDIF) are different:
+ * - the TX output clock has the index of the corresponding RX input clock
+ * - the RX output clock has the index of the corresponding TX input clock
+ *
+ * This function makes sure that we use the proper clock index when swapping
+ * the input and output clocks.
+ */
+static enum asrc_outclk fsl_asrc_get_capture_clock(enum asrc_inclk inclk)
+{
+	enum asrc_outclk outclk;
+
+	switch (inclk) {
+	case INCLK_ESAI_RX:
+	case INCLK_SSI1_RX:
+	case INCLK_SSI2_RX:
+	case INCLK_SPDIF_RX:
+		outclk = inclk + 0x8;
+		break;
+	case INCLK_SSI3_RX:
+		outclk = OUTCLK_SSI3_RX;
+		break;
+	case INCLK_ESAI_TX:
+	case INCLK_SSI1_TX:
+	case INCLK_SSI2_TX:
+	case INCLK_SPDIF_TX:
+		outclk = inclk - 0x8;
+		break;
+	case INCLK_SSI3_TX:
+		outclk = OUTCLK_SSI3_TX;
+		break;
+	default:
+		outclk = inclk;
+		break;
+	}
+
+	return outclk;
+}
+
 /**
  * Start the assigned ASRC pair
  *
@@ -604,15 +648,17 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	config.pair = pair->index;
 	config.channel_num = channels;
-	config.inclk = asrc->inclk;
-	config.outclk = asrc->outclk;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		config.inclk = asrc->inclk;
+		config.outclk = asrc->outclk;
 		config.input_format   = params_format(params);
 		config.output_format  = asrc->asrc_format;
 		config.input_sample_rate  = rate;
 		config.output_sample_rate = asrc->asrc_rate;
 	} else {
+		config.inclk = fsl_asrc_get_capture_clock(asrc->outclk);
+		config.outclk = fsl_asrc_get_capture_clock(asrc->inclk);
 		config.input_format   = asrc->asrc_format;
 		config.output_format  = params_format(params);
 		config.input_sample_rate  = asrc->asrc_rate;
-- 
2.27.0

