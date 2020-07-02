Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B323F212B2F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 19:25:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yQ3c6CTJzDqyg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 03:25:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=pierre-louis.bossart@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yQ1X56jTzDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 03:24:00 +1000 (AEST)
IronPort-SDR: 9Lk/unAu5bYQ6/EM+0Y1LcsgKBOR3NdrplYZSRN/NefGjmL/vk6yqjPypwZsd8TpICQi5glpMs
 vR4gVxdv6pUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="126590470"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="126590470"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:47 -0700
IronPort-SDR: TywODd3A6Rbbvxw++ov1zfM57qFI8aQMZrbQOuZd9wNRE8HMu86fVVAwz+U7TqWN7OS6u1kmTQ
 QuCUZtgfcKEw==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="356521247"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/6] ASoC: fsl: fsl_ssi: fix kernel-doc
Date: Thu,  2 Jul 2020 12:22:23 -0500
Message-Id: <20200702172227.164474-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings. The kernel-doc support is partial, add more
descriptions and follow proper syntax

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_ssi.c | 70 ++++++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 1a2fa7f18142..7ec80b240563 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -203,12 +203,10 @@ struct fsl_ssi_soc_data {
 };
 
 /**
- * fsl_ssi: per-SSI private data
- *
+ * struct fsl_ssi - per-SSI private data
  * @regs: Pointer to the regmap registers
  * @irq: IRQ of this SSI
  * @cpu_dai_drv: CPU DAI driver for this device
- *
  * @dai_fmt: DAI configuration this device is currently used with
  * @streams: Mask of current active streams: BIT(TX) and BIT(RX)
  * @i2s_net: I2S and Network mode configurations of SCR register
@@ -221,38 +219,29 @@ struct fsl_ssi_soc_data {
  * @slot_width: Width of each DAI slot
  * @slots: Number of slots
  * @regvals: Specific RX/TX register settings
- *
  * @clk: Clock source to access register
  * @baudclk: Clock source to generate bit and frame-sync clocks
  * @baudclk_streams: Active streams that are using baudclk
- *
  * @regcache_sfcsr: Cache sfcsr register value during suspend and resume
  * @regcache_sacnt: Cache sacnt register value during suspend and resume
- *
  * @dma_params_tx: DMA transmit parameters
  * @dma_params_rx: DMA receive parameters
  * @ssi_phys: physical address of the SSI registers
- *
  * @fiq_params: FIQ stream filtering parameters
- *
  * @card_pdev: Platform_device pointer to register a sound card for PowerPC or
  *             to register a CODEC platform device for AC97
  * @card_name: Platform_device name to register a sound card for PowerPC or
  *             to register a CODEC platform device for AC97
  * @card_idx: The index of SSI to register a sound card for PowerPC or
  *            to register a CODEC platform device for AC97
- *
  * @dbg_stats: Debugging statistics
- *
  * @soc: SoC specific data
  * @dev: Pointer to &pdev->dev
- *
  * @fifo_watermark: The FIFO watermark setting. Notifies DMA when there are
  *                  @fifo_watermark or fewer words in TX fifo or
  *                  @fifo_watermark or more empty words in RX fifo.
  * @dma_maxburst: Max number of words to transfer in one go. So far,
  *                this is always the same as fifo_watermark.
- *
  * @ac97_reg_lock: Mutex lock to serialize AC97 register access operations
  */
 struct fsl_ssi {
@@ -374,7 +363,9 @@ static bool fsl_ssi_is_i2s_cbm_cfs(struct fsl_ssi *ssi)
 }
 
 /**
- * Interrupt handler to gather states
+ * fsl_ssi_irq - Interrupt handler to gather states
+ * @irq: irq number
+ * @dev_id: context
  */
 static irqreturn_t fsl_ssi_isr(int irq, void *dev_id)
 {
@@ -395,7 +386,10 @@ static irqreturn_t fsl_ssi_isr(int irq, void *dev_id)
 }
 
 /**
- * Set SCR, SIER, STCR and SRCR registers with cached values in regvals
+ * fsl_ssi_config_enable - Set SCR, SIER, STCR and SRCR registers with
+ * cached values in regvals
+ * @ssi: SSI context
+ * @tx: direction
  *
  * Notes:
  * 1) For offline_config SoCs, enable all necessary bits of both streams
@@ -474,7 +468,7 @@ static void fsl_ssi_config_enable(struct fsl_ssi *ssi, bool tx)
 	ssi->streams |= BIT(dir);
 }
 
-/**
+/*
  * Exclude bits that are used by the opposite stream
  *
  * When both streams are active, disabling some bits for the current stream
@@ -495,7 +489,10 @@ static void fsl_ssi_config_enable(struct fsl_ssi *ssi, bool tx)
 	((vals) & _ssi_xor_shared_bits(vals, avals, aactive))
 
 /**
- * Unset SCR, SIER, STCR and SRCR registers with cached values in regvals
+ * fsl_ssi_config_disable - Unset SCR, SIER, STCR and SRCR registers
+ * with cached values in regvals
+ * @ssi: SSI context
+ * @tx: direction
  *
  * Notes:
  * 1) For offline_config SoCs, to avoid online reconfigurations, disable all
@@ -577,7 +574,9 @@ static void fsl_ssi_tx_ac97_saccst_setup(struct fsl_ssi *ssi)
 }
 
 /**
- * Cache critical bits of SIER, SRCR, STCR and SCR to later set them safely
+ * fsl_ssi_setup_regvals - Cache critical bits of SIER, SRCR, STCR and
+ * SCR to later set them safely
+ * @ssi: SSI context
  */
 static void fsl_ssi_setup_regvals(struct fsl_ssi *ssi)
 {
@@ -661,9 +660,12 @@ static void fsl_ssi_shutdown(struct snd_pcm_substream *substream,
 }
 
 /**
- * Configure Digital Audio Interface bit clock
+ * fsl_ssi_set_bclk - Configure Digital Audio Interface bit clock
+ * @substream: ASoC substream
+ * @dai: pointer to DAI
+ * @hw_params: pointers to hw_params
  *
- * Note: This function can be only called when using SSI as DAI master
+ * Notes: This function can be only called when using SSI as DAI master
  *
  * Quick instruction for parameters:
  * freq: Output BCLK frequency = samplerate * slots * slot_width
@@ -782,7 +784,10 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 }
 
 /**
- * Configure SSI based on PCM hardware parameters
+ * fsl_ssi_hw_params - Configure SSI based on PCM hardware parameters
+ * @substream: ASoC substream
+ * @hw_params: pointers to hw_params
+ * @dai: pointer to DAI
  *
  * Notes:
  * 1) SxCCR.WL bits are critical bits that require SSI to be temporarily
@@ -997,7 +1002,9 @@ static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 }
 
 /**
- * Configure Digital Audio Interface (DAI) Format
+ * fsl_ssi_set_dai_fmt - Configure Digital Audio Interface (DAI) Format
+ * @dai: pointer to DAI
+ * @fmt: format mask
  */
 static int fsl_ssi_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
@@ -1011,7 +1018,12 @@ static int fsl_ssi_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 /**
- * Set TDM slot number and slot width
+ * fsl_ssi_set_dai_tdm_slot - Set TDM slot number and slot width
+ * @dai: pointer to DAI
+ * @tx_mask: mask for TX
+ * @rx_mask: mask for RX
+ * @slots: number of slots
+ * @slot_width: number of bits per slot
  */
 static int fsl_ssi_set_dai_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask,
 				    u32 rx_mask, int slots, int slot_width)
@@ -1055,7 +1067,10 @@ static int fsl_ssi_set_dai_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask,
 }
 
 /**
- * Start or stop SSI and corresponding DMA transaction.
+ * fsl_ssi_trigger - Start or stop SSI and corresponding DMA transaction.
+ * @substream: ASoC substream
+ * @cmd: trigger command
+ * @dai: pointer to DAI
  *
  * The DMA channel is in external master start and pause mode, which
  * means the SSI completely controls the flow of data.
@@ -1239,7 +1254,8 @@ static struct snd_ac97_bus_ops fsl_ssi_ac97_ops = {
 };
 
 /**
- * Initialize SSI registers
+ * fsl_ssi_hw_init - Initialize SSI registers
+ * @ssi: SSI context
  */
 static int fsl_ssi_hw_init(struct fsl_ssi *ssi)
 {
@@ -1268,7 +1284,8 @@ static int fsl_ssi_hw_init(struct fsl_ssi *ssi)
 }
 
 /**
- * Clear SSI registers
+ * fsl_ssi_hw_clean - Clear SSI registers
+ * @ssi: SSI context
  */
 static void fsl_ssi_hw_clean(struct fsl_ssi *ssi)
 {
@@ -1285,7 +1302,8 @@ static void fsl_ssi_hw_clean(struct fsl_ssi *ssi)
 		regmap_update_bits(ssi->regs, REG_SSI_SCR, SSI_SCR_SSIEN, 0);
 	}
 }
-/**
+
+/*
  * Make every character in a string lower-case
  */
 static void make_lowercase(char *s)
-- 
2.25.1

