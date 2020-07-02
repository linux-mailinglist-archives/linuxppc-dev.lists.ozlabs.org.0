Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C305212D22
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 21:30:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ySqL3nqqzDqPk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 05:30:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=pierre-louis.bossart@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ySdm622rzDqLj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 05:22:04 +1000 (AEST)
IronPort-SDR: 8jjw1+uwdxTrK+gSbS1AA5ZPZdYVE6QWNiL0fx8tz7iJL0qtoQ/F0clPLFnWpznulBxUAUiHq4
 qBUtpxlYkjRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="147015755"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="147015755"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:22:02 -0700
IronPort-SDR: VC72ixVpyhh/fzeRMmVEKwl5TjkPN9T8Gz6Ihijn5Ym4BmvGMVKt/JyIvDAMZIjI26KDBZluLx
 TXWvphkw/aQQ==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="304345329"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:22:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 5/6] ASoC: fsl: fsl_asrc: fix kernel-doc
Date: Thu,  2 Jul 2020 14:21:40 -0500
Message-Id: <20200702192141.168018-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702192141.168018-1-pierre-louis.bossart@linux.intel.com>
References: <20200702192141.168018-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 tiwai@suse.de,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 broonie@kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Fabio Estevam <festevam@gmail.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix W=1 warnings. fix kernel doc and describe arguments.

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_asrc.c | 57 +++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 18 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 462ce9f9ab48..02c81d2e34ad 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -37,7 +37,7 @@ static struct snd_pcm_hw_constraint_list fsl_asrc_rate_constraints = {
 	.list = supported_asrc_rate,
 };
 
-/**
+/*
  * The following tables map the relationship between asrc_inclk/asrc_outclk in
  * fsl_asrc.h and the registers of ASRCSR
  */
@@ -68,7 +68,7 @@ static unsigned char output_clk_map_imx53[ASRC_CLK_MAP_LEN] = {
 	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
 };
 
-/**
+/*
  * i.MX8QM/i.MX8QXP uses the same map for input and output.
  * clk_map_imx8qm[0] is for i.MX8QM asrc0
  * clk_map_imx8qm[1] is for i.MX8QM asrc1
@@ -102,16 +102,17 @@ static unsigned char clk_map_imx8qxp[2][ASRC_CLK_MAP_LEN] = {
 };
 
 /**
- * Select the pre-processing and post-processing options
+ * fsl_asrc_sel_proc - Select the pre-processing and post-processing options
+ * @inrate: input sample rate
+ * @outrate: output sample rate
+ * @pre_proc: return value for pre-processing option
+ * @post_proc: return value for post-processing option
+ *
  * Make sure to exclude following unsupported cases before
  * calling this function:
  * 1) inrate > 8.125 * outrate
  * 2) inrate > 16.125 * outrate
  *
- * inrate: input sample rate
- * outrate: output sample rate
- * pre_proc: return value for pre-processing option
- * post_proc: return value for post-processing option
  */
 static void fsl_asrc_sel_proc(int inrate, int outrate,
 			     int *pre_proc, int *post_proc)
@@ -148,7 +149,9 @@ static void fsl_asrc_sel_proc(int inrate, int outrate,
 }
 
 /**
- * Request ASRC pair
+ * fsl_asrc_request_pair - Request ASRC pair
+ * @channels: number of channels
+ * @pair: pointer to pair
  *
  * It assigns pair by the order of A->C->B because allocation of pair B,
  * within range [ANCA, ANCA+ANCB-1], depends on the channels of pair A
@@ -193,7 +196,8 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 }
 
 /**
- * Release ASRC pair
+ * fsl_asrc_release_pair - Release ASRC pair
+ * @pair: pair to release
  *
  * It clears the resource from asrc and releases the occupied channels.
  */
@@ -217,7 +221,10 @@ static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 }
 
 /**
- * Configure input and output thresholds
+ * fsl_asrc_set_watermarks- configure input and output thresholds
+ * @pair: pointer to pair
+ * @in: input threshold
+ * @out: output threshold
  */
 static void fsl_asrc_set_watermarks(struct fsl_asrc_pair *pair, u32 in, u32 out)
 {
@@ -234,7 +241,9 @@ static void fsl_asrc_set_watermarks(struct fsl_asrc_pair *pair, u32 in, u32 out)
 }
 
 /**
- * Calculate the total divisor between asrck clock rate and sample rate
+ * fsl_asrc_cal_asrck_divisor - Calculate the total divisor between asrck clock rate and sample rate
+ * @pair: pointer to pair
+ * @div: divider
  *
  * It follows the formula clk_rate = samplerate * (2 ^ prescaler) * divider
  */
@@ -250,7 +259,10 @@ static u32 fsl_asrc_cal_asrck_divisor(struct fsl_asrc_pair *pair, u32 div)
 }
 
 /**
- * Calculate and set the ratio for Ideal Ratio mode only
+ * fsl_asrc_set_ideal_ratio - Calculate and set the ratio for Ideal Ratio mode only
+ * @pair: pointer to pair
+ * @inrate: input rate
+ * @outrate: output rate
  *
  * The ratio is a 32-bit fixed point value with 26 fractional bits.
  */
@@ -293,7 +305,9 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
 }
 
 /**
- * Configure the assigned ASRC pair
+ * fsl_asrc_config_pair - Configure the assigned ASRC pair
+ * @pair: pointer to pair
+ * @use_ideal_rate: boolean configuration
  *
  * It configures those ASRC registers according to a configuration instance
  * of struct asrc_config which includes in/output sample rate, width, channel
@@ -508,7 +522,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 }
 
 /**
- * Start the assigned ASRC pair
+ * fsl_asrc_start_pair - Start the assigned ASRC pair
+ * @pair: pointer to pair
  *
  * It enables the assigned pair and makes it stopped at the stall level.
  */
@@ -539,7 +554,8 @@ static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
 }
 
 /**
- * Stop the assigned ASRC pair
+ * fsl_asrc_stop_pair - Stop the assigned ASRC pair
+ * @pair: pointer to pair
  */
 static void fsl_asrc_stop_pair(struct fsl_asrc_pair *pair)
 {
@@ -552,7 +568,9 @@ static void fsl_asrc_stop_pair(struct fsl_asrc_pair *pair)
 }
 
 /**
- * Get DMA channel according to the pair and direction.
+ * fsl_asrc_get_dma_channel- Get DMA channel according to the pair and direction.
+ * @pair: pointer to pair
+ * @dir: DMA direction
  */
 static struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair,
 						 bool dir)
@@ -896,7 +914,8 @@ static const struct regmap_config fsl_asrc_regmap_config = {
 };
 
 /**
- * Initialize ASRC registers with a default configurations
+ * fsl_asrc_init - Initialize ASRC registers with a default configuration
+ * @asrc: ASRC context
  */
 static int fsl_asrc_init(struct fsl_asrc *asrc)
 {
@@ -930,7 +949,9 @@ static int fsl_asrc_init(struct fsl_asrc *asrc)
 }
 
 /**
- * Interrupt handler for ASRC
+ * fsl_asrc_isr- Interrupt handler for ASRC
+ * @irq: irq number
+ * @dev_id: ASRC context
  */
 static irqreturn_t fsl_asrc_isr(int irq, void *dev_id)
 {
-- 
2.25.1

