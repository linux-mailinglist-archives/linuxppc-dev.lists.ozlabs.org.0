Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F9920E61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 20:05:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454fVN6sc5zDqYq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 04:05:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="QvubYhE2"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454fRM5DZQzDq8X
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 04:03:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8bZja2xkVqlKe9Ee36ywIzxXtmLn67PxOoUS8NcSf8U=; b=QvubYhE2Lk8n
 SagD9Sc5z3FsyW4VJjfM5XnXOGeOgDXnpgHFGTsX/dSvZ6/nzECisUCScJ/bH5xY4cW3SVlWZSQMl
 BfHSND6EUoWYSC6KDeXTSUHhyRyb3ZEJO8n/2ICrP/Vk7Li+bu+XrELoSSdIXDqYsDBwEMkpVq9g2
 F6qLg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hRKiZ-00085Q-U6; Thu, 16 May 2019 18:02:59 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 768C1112929E; Thu, 16 May 2019 19:02:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: S.j. Wang <shengjiu.wang@nxp.com>
Subject: Applied "ASoC: fsl_asrc: replace the process_option table with
 function" to the asoc tree
In-Reply-To: <7d683186c3de9314e361fd4ead42f9691968e65c.1557901312.git.shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190516180259.768C1112929E@debutante.sirena.org.uk>
Date: Thu, 16 May 2019 19:02:59 +0100 (BST)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: fsl_asrc: replace the process_option table with function

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 4aecaa0a82b3142fb2f2862b3f25ecc96dc06d8c Mon Sep 17 00:00:00 2001
From: "S.j. Wang" <shengjiu.wang@nxp.com>
Date: Wed, 15 May 2019 06:42:22 +0000
Subject: [PATCH] ASoC: fsl_asrc: replace the process_option table with
 function

When we want to support more sample rate, for example 12kHz/24kHz
we need update the process_option table, if we want to support more
sample rate next time, the table need to be updated again. which
is not flexible.

We got a function fsl_asrc_sel_proc to replace the table, which can
give the pre-processing and post-processing options according to
the sample rate.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_asrc.c | 71 +++++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 0b937924d2e4..71793d3dc75c 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -26,24 +26,6 @@
 #define pair_dbg(fmt, ...) \
 	dev_dbg(&asrc_priv->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
 
-/* Sample rates are aligned with that defined in pcm.h file */
-static const u8 process_option[][12][2] = {
-	/* 8kHz 11.025kHz 16kHz 22.05kHz 32kHz 44.1kHz 48kHz   64kHz   88.2kHz 96kHz   176kHz  192kHz */
-	{{0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},},	/* 5512Hz */
-	{{0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},},	/* 8kHz */
-	{{0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},},	/* 11025Hz */
-	{{1, 2}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},},	/* 16kHz */
-	{{1, 2}, {1, 2}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},},	/* 22050Hz */
-	{{1, 2}, {2, 1}, {2, 1}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0},},	/* 32kHz */
-	{{2, 2}, {2, 2}, {2, 1}, {2, 1}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0},},	/* 44.1kHz */
-	{{2, 2}, {2, 2}, {2, 1}, {2, 1}, {0, 2}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0},},	/* 48kHz */
-	{{2, 2}, {2, 2}, {2, 2}, {2, 1}, {1, 2}, {0, 2}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0},},	/* 64kHz */
-	{{2, 2}, {2, 2}, {2, 2}, {2, 2}, {1, 2}, {1, 2}, {1, 2}, {1, 1}, {1, 1}, {1, 1}, {1, 1}, {1, 1},},	/* 88.2kHz */
-	{{2, 2}, {2, 2}, {2, 2}, {2, 2}, {1, 2}, {1, 2}, {1, 2}, {1, 1}, {1, 1}, {1, 1}, {1, 1}, {1, 1},},	/* 96kHz */
-	{{2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 1}, {2, 1}, {2, 1}, {2, 1}, {2, 1},},	/* 176kHz */
-	{{2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 1}, {2, 1}, {2, 1}, {2, 1}, {2, 1},},	/* 192kHz */
-};
-
 /* Corresponding to process_option */
 static int supported_input_rate[] = {
 	5512, 8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200,
@@ -79,6 +61,52 @@ static unsigned char output_clk_map_imx53[] = {
 
 static unsigned char *clk_map[2];
 
+/**
+ * Select the pre-processing and post-processing options
+ * Make sure to exclude following unsupported cases before
+ * calling this function:
+ * 1) inrate > 8.125 * outrate
+ * 2) inrate > 16.125 * outrate
+ *
+ * inrate: input sample rate
+ * outrate: output sample rate
+ * pre_proc: return value for pre-processing option
+ * post_proc: return value for post-processing option
+ */
+static void fsl_asrc_sel_proc(int inrate, int outrate,
+			     int *pre_proc, int *post_proc)
+{
+	bool post_proc_cond2;
+	bool post_proc_cond0;
+
+	/* select pre_proc between [0, 2] */
+	if (inrate * 8 > 33 * outrate)
+		*pre_proc = 2;
+	else if (inrate * 8 > 15 * outrate) {
+		if (inrate > 152000)
+			*pre_proc = 2;
+		else
+			*pre_proc = 1;
+	} else if (inrate < 76000)
+		*pre_proc = 0;
+	else if (inrate > 152000)
+		*pre_proc = 2;
+	else
+		*pre_proc = 1;
+
+	/* Condition for selection of post-processing */
+	post_proc_cond2 = (inrate * 15 > outrate * 16 && outrate < 56000) ||
+			  (inrate > 56000 && outrate < 56000);
+	post_proc_cond0 = inrate * 23 < outrate * 8;
+
+	if (post_proc_cond2)
+		*post_proc = 2;
+	else if (post_proc_cond0)
+		*post_proc = 0;
+	else
+		*post_proc = 1;
+}
+
 /**
  * Request ASRC pair
  *
@@ -239,6 +267,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	u32 inrate, outrate, indiv, outdiv;
 	u32 clk_index[2], div[2];
 	int in, out, channels;
+	int pre_proc, post_proc;
 	struct clk *clk;
 	bool ideal;
 
@@ -377,11 +406,13 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 			   ASRCTR_IDRi_MASK(index) | ASRCTR_USRi_MASK(index),
 			   ASRCTR_IDR(index) | ASRCTR_USR(index));
 
+	fsl_asrc_sel_proc(inrate, outrate, &pre_proc, &post_proc);
+
 	/* Apply configurations for pre- and post-processing */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRCFG,
 			   ASRCFG_PREMODi_MASK(index) |	ASRCFG_POSTMODi_MASK(index),
-			   ASRCFG_PREMOD(index, process_option[in][out][0]) |
-			   ASRCFG_POSTMOD(index, process_option[in][out][1]));
+			   ASRCFG_PREMOD(index, pre_proc) |
+			   ASRCFG_POSTMOD(index, post_proc));
 
 	return fsl_asrc_set_ideal_ratio(pair, inrate, outrate);
 }
-- 
2.20.1

