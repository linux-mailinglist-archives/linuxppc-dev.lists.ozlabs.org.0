Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B206C57C955
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 12:47:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpTmS4wqmz3f8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 20:47:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpTkM4Kw7z3bls
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 20:45:47 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DE5571A362E;
	Thu, 21 Jul 2022 12:45:44 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7D3351A362D;
	Thu, 21 Jul 2022 12:45:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0ACC5180222A;
	Thu, 21 Jul 2022 18:45:42 +0800 (+08)
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
Subject: [PATCH v2 -next 4/5] ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
Date: Thu, 21 Jul 2022 18:29:52 +0800
Message-Id: <1658399393-28777-5-git-send-email-shengjiu.wang@nxp.com>
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
sound/soc/fsl/fsl_easrc.c:562:33: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:563:34: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:565:38: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:566:39: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:608:33: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:609:34: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:615:40: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:616:41: sparse: warning: restricted snd_pcm_format_t degrades to integer

sound/soc/fsl/fsl_easrc.c:1465:51: sparse: warning: incorrect type in assignment (different base types)
sound/soc/fsl/fsl_easrc.c:1465:51: sparse:    expected unsigned int sample_format
sound/soc/fsl/fsl_easrc.c:1465:51: sparse:    got restricted snd_pcm_format_t [usertype] format
sound/soc/fsl/fsl_easrc.c:1467:52: sparse: warning: incorrect type in assignment (different base types)
sound/soc/fsl/fsl_easrc.c:1467:52: sparse:    expected unsigned int sample_format
sound/soc/fsl/fsl_easrc.c:1467:52: sparse:    got restricted snd_pcm_format_t [usertype] asrc_format
sound/soc/fsl/fsl_easrc.c:1470:52: sparse: warning: incorrect type in assignment (different base types)
sound/soc/fsl/fsl_easrc.c:1470:52: sparse:    expected unsigned int sample_format
sound/soc/fsl/fsl_easrc.c:1470:52: sparse:    got restricted snd_pcm_format_t [usertype] format
sound/soc/fsl/fsl_easrc.c:1472:51: sparse: warning: incorrect type in assignment (different base types)
sound/soc/fsl/fsl_easrc.c:1472:51: sparse:    expected unsigned int sample_format
sound/soc/fsl/fsl_easrc.c:1472:51: sparse:    got restricted snd_pcm_format_t [usertype] asrc_format
sound/soc/fsl/fsl_easrc.c:1484:41: sparse: warning: incorrect type in argument 2 (different base types)
sound/soc/fsl/fsl_easrc.c:1484:41: sparse:    expected restricted snd_pcm_format_t [usertype] *in_raw_format
sound/soc/fsl/fsl_easrc.c:1484:41: sparse:    got unsigned int *
sound/soc/fsl/fsl_easrc.c:1485:41: sparse: warning: incorrect type in argument 3 (different base types)
sound/soc/fsl/fsl_easrc.c:1485:41: sparse:    expected restricted snd_pcm_format_t [usertype] *out_raw_format
sound/soc/fsl/fsl_easrc.c:1485:41: sparse:    got unsigned int *
sound/soc/fsl/fsl_easrc.c:1937:60: sparse: warning: incorrect type in argument 3 (different base types)
sound/soc/fsl/fsl_easrc.c:1937:60: sparse:    expected unsigned int [usertype] *out_value
sound/soc/fsl/fsl_easrc.c:1937:60: sparse:    got restricted snd_pcm_format_t *
sound/soc/fsl/fsl_easrc.c:1943:49: sparse: warning: restricted snd_pcm_format_t degrades to integer

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_easrc.c | 9 ++++++---
 sound/soc/fsl/fsl_easrc.h | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index ea96b0fb6b20..3153d19136b2 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -476,7 +476,8 @@ static int fsl_easrc_prefilter_config(struct fsl_asrc *easrc,
 	struct fsl_asrc_pair *ctx;
 	struct device *dev;
 	u32 inrate, outrate, offset = 0;
-	u32 in_s_rate, out_s_rate, in_s_fmt, out_s_fmt;
+	u32 in_s_rate, out_s_rate;
+	snd_pcm_format_t in_s_fmt, out_s_fmt;
 	int ret, i;
 
 	if (!easrc)
@@ -1874,6 +1875,7 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device_node *np;
 	void __iomem *regs;
+	u32 asrc_fmt = 0;
 	int ret, irq;
 
 	easrc = devm_kzalloc(dev, sizeof(*easrc), GFP_KERNEL);
@@ -1934,13 +1936,14 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_property_read_u32(np, "fsl,asrc-format", &easrc->asrc_format);
+	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc_fmt);
+	easrc->asrc_format = (__force snd_pcm_format_t)asrc_fmt;
 	if (ret) {
 		dev_err(dev, "failed to asrc format\n");
 		return ret;
 	}
 
-	if (!(FSL_EASRC_FORMATS & (1ULL << easrc->asrc_format))) {
+	if (!(FSL_EASRC_FORMATS & (pcm_format_to_bits(easrc->asrc_format)))) {
 		dev_warn(dev, "unsupported format, switching to S24_LE\n");
 		easrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
 	}
diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
index 86d5c360d4f5..7c70dac52713 100644
--- a/sound/soc/fsl/fsl_easrc.h
+++ b/sound/soc/fsl/fsl_easrc.h
@@ -569,7 +569,7 @@ struct fsl_easrc_io_params {
 	unsigned int access_len;
 	unsigned int fifo_wtmk;
 	unsigned int sample_rate;
-	unsigned int sample_format;
+	snd_pcm_format_t sample_format;
 	unsigned int norm_rate;
 };
 
-- 
2.34.1

