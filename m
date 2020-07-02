Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED47E212D25
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 21:32:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ySsX118gzDqN8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 05:32:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ySdp1ZfmzDqQt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 05:22:06 +1000 (AEST)
IronPort-SDR: xFvnzmJxeMu3y8P6qSfgGKRmEJ/a7hkLq43HtSbh09NEJEr8bwSHX+AH4mbHX1xqKZj5SQtW01
 To/Xkx1/CAog==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="147015769"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="147015769"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:22:04 -0700
IronPort-SDR: RTZSIGG3RcfVFOGwPmrE/3GFiGylgY/qObQYSPNhRs+TrbIui73N0dDMyIFhuHJuYCmCsnLJBb
 0HBNGGNmZU5Q==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="304345336"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:22:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 6/6] ASoC: fsl: fsl_esai: fix kernel-doc
Date: Thu,  2 Jul 2020 14:21:41 -0500
Message-Id: <20200702192141.168018-7-pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings. Fix kernel-doc syntax and add missing parameters.

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_esai.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index cbcb70d6f8c8..b8fbd7ba94af 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -22,8 +22,7 @@
 				SNDRV_PCM_FMTBIT_S24_LE)
 
 /**
- * fsl_esai_soc_data: soc specific data
- *
+ * struct fsl_esai_soc_data - soc specific data
  * @imx: for imx platform
  * @reset_at_xrun: flags for enable reset operaton
  */
@@ -33,8 +32,7 @@ struct fsl_esai_soc_data {
 };
 
 /**
- * fsl_esai: ESAI private data
- *
+ * struct fsl_esai - ESAI private data
  * @dma_params_rx: DMA parameters for receive channel
  * @dma_params_tx: DMA parameters for transmit channel
  * @pdev: platform device pointer
@@ -49,6 +47,8 @@ struct fsl_esai_soc_data {
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
  * @slots: number of slots
+ * @tx_mask: slot mask for TX
+ * @rx_mask: slot mask for RX
  * @channels: channel num for tx or rx
  * @hck_rate: clock rate of desired HCKx clock
  * @sck_rate: clock rate of desired SCKx clock
@@ -157,13 +157,15 @@ static irqreturn_t esai_isr(int irq, void *devid)
 }
 
 /**
- * This function is used to calculate the divisors of psr, pm, fp and it is
- * supposed to be called in set_dai_sysclk() and set_bclk().
+ * fsl_esai_divisor_cal - This function is used to calculate the
+ * divisors of psr, pm, fp and it is supposed to be called in
+ * set_dai_sysclk() and set_bclk().
  *
+ * @dai: pointer to DAI
+ * @tx: current setting is for playback or capture
  * @ratio: desired overall ratio for the paticipating dividers
  * @usefp: for HCK setting, there is no need to set fp divider
  * @fp: bypass other dividers by setting fp directly if fp != 0
- * @tx: current setting is for playback or capture
  */
 static int fsl_esai_divisor_cal(struct snd_soc_dai *dai, bool tx, u32 ratio,
 				bool usefp, u32 fp)
@@ -250,13 +252,12 @@ static int fsl_esai_divisor_cal(struct snd_soc_dai *dai, bool tx, u32 ratio,
 }
 
 /**
- * This function mainly configures the clock frequency of MCLK (HCKT/HCKR)
- *
- * @Parameters:
- * clk_id: The clock source of HCKT/HCKR
+ * fsl_esai_set_dai_sysclk - configure the clock frequency of MCLK (HCKT/HCKR)
+ * @dai: pointer to DAI
+ * @clk_id: The clock source of HCKT/HCKR
  *	  (Input from outside; output from inside, FSYS or EXTAL)
- * freq: The required clock rate of HCKT/HCKR
- * dir: The clock direction of HCKT/HCKR
+ * @freq: The required clock rate of HCKT/HCKR
+ * @dir: The clock direction of HCKT/HCKR
  *
  * Note: If the direction is input, we do not care about clk_id.
  */
@@ -358,7 +359,10 @@ static int fsl_esai_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 }
 
 /**
- * This function configures the related dividers according to the bclk rate
+ * fsl_esai_set_bclk - configure the related dividers according to the bclk rate
+ * @dai: pointer to DAI
+ * @tx: direction boolean
+ * @freq: bclk freq
  */
 static int fsl_esai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 {
-- 
2.25.1

