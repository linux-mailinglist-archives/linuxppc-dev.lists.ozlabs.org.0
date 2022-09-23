Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 376155E77A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 11:51:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYnTZ6xtlz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 19:50:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYnT52ShGz3c6R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 19:50:31 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 79B7D216CD3;
	Fri, 23 Sep 2022 11:50:27 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EF382216CD0;
	Fri, 23 Sep 2022 11:50:26 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 23E18180031F;
	Fri, 23 Sep 2022 17:50:23 +0800 (+08)
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
Subject: [PATCH] ASoC: fsl_micfil: Add Hardware Voice Activity Detector support
Date: Fri, 23 Sep 2022 17:31:34 +0800
Message-Id: <1663925494-9941-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Hardware Voice Activity Detector (HWVAD) is a block
responsible for detect voice activity in a channel selected
by the user. It can be configured in Envelope-based or
Energy-based mode.

There are additional two interrupts for HWVAD, one is event
interrupt, another is error interrupt.

Enable hwvad in parallel with recording.
when voice activity detected, HWVAD will be disabled and
alsa control notification is triggerred.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 434 +++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_micfil.h |   6 +-
 2 files changed, 439 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 79ef4e269bc9..eeaa75fb9196 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -47,11 +47,15 @@ struct fsl_micfil {
 	struct clk *pll11k_clk;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
 	struct sdma_peripheral_config sdmacfg;
+	struct snd_soc_card *card;
 	unsigned int dataline;
 	char name[32];
 	int irq[MICFIL_IRQ_LINES];
 	enum quality quality;
 	int dc_remover;
+	int vad_init_mode;
+	int vad_enabled;
+	int vad_detected;
 };
 
 struct fsl_micfil_soc_data {
@@ -152,6 +156,152 @@ static int micfil_quality_set(struct snd_kcontrol *kcontrol,
 	return micfil_set_quality(micfil);
 }
 
+static const char * const micfil_hwvad_enable[] = {
+	"Disable (Record only)",
+	"Enable (Record with Vad)",
+};
+
+static const char * const micfil_hwvad_init_mode[] = {
+	"Envelope mode", "Energy mode",
+};
+
+static const char * const micfil_hwvad_hpf_texts[] = {
+	"Filter bypass",
+	"Cut-off @1750Hz",
+	"Cut-off @215Hz",
+	"Cut-off @102Hz",
+};
+
+/*
+ * DC Remover Control
+ * Filter Bypassed	1 1
+ * Cut-off @21Hz	0 0
+ * Cut-off @83Hz	0 1
+ * Cut-off @152HZ	1 0
+ */
+static const char * const micfil_dc_remover_texts[] = {
+	"Cut-off @21Hz", "Cut-off @83Hz",
+	"Cut-off @152Hz", "Bypass",
+};
+
+static const struct soc_enum hwvad_enable_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(micfil_hwvad_enable),
+			    micfil_hwvad_enable);
+static const struct soc_enum hwvad_init_mode_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(micfil_hwvad_init_mode),
+			    micfil_hwvad_init_mode);
+static const struct soc_enum hwvad_hpf_enum =
+	SOC_ENUM_SINGLE(REG_MICFIL_VAD0_CTRL2, 0,
+			ARRAY_SIZE(micfil_hwvad_hpf_texts),
+			micfil_hwvad_hpf_texts);
+static const struct soc_enum fsl_micfil_dc_remover_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(micfil_dc_remover_texts),
+			    micfil_dc_remover_texts);
+
+static int micfil_put_dc_remover_state(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
+	unsigned int *item = ucontrol->value.enumerated.item;
+	int val = snd_soc_enum_item_to_val(e, item[0]);
+	int i = 0, ret = 0;
+	u32 reg_val = 0;
+
+	if (val < 0 || val > 3)
+		return -EINVAL;
+
+	micfil->dc_remover = val;
+
+	/* Calculate total value for all channels */
+	for (i = 0; i < MICFIL_OUTPUT_CHANNELS; i++)
+		reg_val |= val << MICFIL_DC_CHX_SHIFT(i);
+
+	/* Update DC Remover mode for all channels */
+	ret = snd_soc_component_update_bits(comp, REG_MICFIL_DC_CTRL,
+					    MICFIL_DC_CTRL_CONFIG, reg_val);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int micfil_get_dc_remover_state(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
+
+	ucontrol->value.enumerated.item[0] = micfil->dc_remover;
+
+	return 0;
+}
+
+static int hwvad_put_enable(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
+	int val = snd_soc_enum_item_to_val(e, item[0]);
+
+	micfil->vad_enabled = val;
+
+	return 0;
+}
+
+static int hwvad_get_enable(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
+
+	ucontrol->value.enumerated.item[0] = micfil->vad_enabled;
+
+	return 0;
+}
+
+static int hwvad_put_init_mode(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
+	int val = snd_soc_enum_item_to_val(e, item[0]);
+
+	/* 0 - Envelope-based Mode
+	 * 1 - Energy-based Mode
+	 */
+	micfil->vad_init_mode = val;
+
+	return 0;
+}
+
+static int hwvad_get_init_mode(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
+
+	ucontrol->value.enumerated.item[0] = micfil->vad_init_mode;
+
+	return 0;
+}
+
+static int hwvad_detected(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
+
+	ucontrol->value.enumerated.item[0] = micfil->vad_detected;
+
+	return 0;
+}
+
 static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 	SOC_SINGLE_SX_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
 			  MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0x7, gain_tlv),
@@ -172,6 +322,27 @@ static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 	SOC_ENUM_EXT("MICFIL Quality Select",
 		     fsl_micfil_quality_enum,
 		     micfil_quality_get, micfil_quality_set),
+	SOC_ENUM_EXT("HWVAD Enablement Switch", hwvad_enable_enum,
+		     hwvad_get_enable, hwvad_put_enable),
+	SOC_ENUM_EXT("HWVAD Initialization Mode", hwvad_init_mode_enum,
+		     hwvad_get_init_mode, hwvad_put_init_mode),
+	SOC_ENUM("HWVAD High-Pass Filter", hwvad_hpf_enum),
+	SOC_SINGLE("HWVAD ZCD Switch", REG_MICFIL_VAD0_ZCD, 0, 1, 0),
+	SOC_SINGLE("HWVAD ZCD Auto Threshold Switch",
+		   REG_MICFIL_VAD0_ZCD, 2, 1, 0),
+	SOC_ENUM_EXT("MICFIL DC Remover Control", fsl_micfil_dc_remover_enum,
+		     micfil_get_dc_remover_state, micfil_put_dc_remover_state),
+	SOC_SINGLE("HWVAD Input Gain", REG_MICFIL_VAD0_CTRL2, 8, 15, 0),
+	SOC_SINGLE("HWVAD Sound Gain", REG_MICFIL_VAD0_SCONFIG, 0, 15, 0),
+	SOC_SINGLE("HWVAD Noise Gain", REG_MICFIL_VAD0_NCONFIG, 0, 15, 0),
+	SOC_SINGLE_RANGE("HWVAD Detector Frame Time", REG_MICFIL_VAD0_CTRL2, 16, 0, 63, 0),
+	SOC_SINGLE("HWVAD Detector Initialization Time", REG_MICFIL_VAD0_CTRL1, 8, 31, 0),
+	SOC_SINGLE("HWVAD Noise Filter Adjustment", REG_MICFIL_VAD0_NCONFIG, 8, 31, 0),
+	SOC_SINGLE("HWVAD ZCD Threshold", REG_MICFIL_VAD0_ZCD, 16, 1023, 0),
+	SOC_SINGLE("HWVAD ZCD Adjustment", REG_MICFIL_VAD0_ZCD, 8, 15, 0),
+	SOC_SINGLE("HWVAD ZCD And Behavior Switch",
+		   REG_MICFIL_VAD0_ZCD, 4, 1, 0),
+	SOC_SINGLE_BOOL_EXT("VAD Detected", 0, hwvad_detected, NULL),
 };
 
 /* The SRES is a self-negated bit which provides the CPU with the
@@ -210,6 +381,167 @@ static int fsl_micfil_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/* Enable/disable hwvad interrupts */
+static int fsl_micfil_configure_hwvad_interrupts(struct fsl_micfil *micfil, int enable)
+{
+	u32 vadie_reg = enable ? MICFIL_VAD0_CTRL1_IE : 0;
+	u32 vaderie_reg = enable ? MICFIL_VAD0_CTRL1_ERIE : 0;
+
+	/* Voice Activity Detector Error Interruption */
+	regmap_update_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL1,
+			   MICFIL_VAD0_CTRL1_ERIE, vaderie_reg);
+
+	/* Voice Activity Detector Interruption */
+	regmap_update_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL1,
+			   MICFIL_VAD0_CTRL1_IE, vadie_reg);
+
+	return 0;
+}
+
+/* Configuration done only in energy-based initialization mode */
+static int fsl_micfil_init_hwvad_energy_mode(struct fsl_micfil *micfil)
+{
+	/* Keep the VADFRENDIS bitfield cleared. */
+	regmap_clear_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL2,
+			  MICFIL_VAD0_CTRL2_FRENDIS);
+
+	/* Keep the VADPREFEN bitfield cleared. */
+	regmap_clear_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL2,
+			  MICFIL_VAD0_CTRL2_PREFEN);
+
+	/* Keep the VADSFILEN bitfield cleared. */
+	regmap_clear_bits(micfil->regmap, REG_MICFIL_VAD0_SCONFIG,
+			  MICFIL_VAD0_SCONFIG_SFILEN);
+
+	/* Keep the VADSMAXEN bitfield cleared. */
+	regmap_clear_bits(micfil->regmap, REG_MICFIL_VAD0_SCONFIG,
+			  MICFIL_VAD0_SCONFIG_SMAXEN);
+
+	/* Keep the VADNFILAUTO bitfield asserted. */
+	regmap_set_bits(micfil->regmap, REG_MICFIL_VAD0_NCONFIG,
+			MICFIL_VAD0_NCONFIG_NFILAUT);
+
+	/* Keep the VADNMINEN bitfield cleared. */
+	regmap_clear_bits(micfil->regmap, REG_MICFIL_VAD0_NCONFIG,
+			  MICFIL_VAD0_NCONFIG_NMINEN);
+
+	/* Keep the VADNDECEN bitfield cleared. */
+	regmap_clear_bits(micfil->regmap, REG_MICFIL_VAD0_NCONFIG,
+			  MICFIL_VAD0_NCONFIG_NDECEN);
+
+	/* Keep the VADNOREN bitfield cleared. */
+	regmap_clear_bits(micfil->regmap, REG_MICFIL_VAD0_NCONFIG,
+			  MICFIL_VAD0_NCONFIG_NOREN);
+
+	return 0;
+}
+
+/* Configuration done only in envelope-based initialization mode */
+static int fsl_micfil_init_hwvad_envelope_mode(struct fsl_micfil *micfil)
+{
+	/* Assert the VADFRENDIS bitfield */
+	regmap_set_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL2,
+			MICFIL_VAD0_CTRL2_FRENDIS);
+
+	/* Assert the VADPREFEN bitfield. */
+	regmap_set_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL2,
+			MICFIL_VAD0_CTRL2_PREFEN);
+
+	/* Assert the VADSFILEN bitfield. */
+	regmap_set_bits(micfil->regmap, REG_MICFIL_VAD0_SCONFIG,
+			MICFIL_VAD0_SCONFIG_SFILEN);
+
+	/* Assert the VADSMAXEN bitfield. */
+	regmap_set_bits(micfil->regmap, REG_MICFIL_VAD0_SCONFIG,
+			MICFIL_VAD0_SCONFIG_SMAXEN);
+
+	/* Clear the VADNFILAUTO bitfield */
+	regmap_clear_bits(micfil->regmap, REG_MICFIL_VAD0_NCONFIG,
+			  MICFIL_VAD0_NCONFIG_NFILAUT);
+
+	/* Assert the VADNMINEN bitfield. */
+	regmap_set_bits(micfil->regmap, REG_MICFIL_VAD0_NCONFIG,
+			MICFIL_VAD0_NCONFIG_NMINEN);
+
+	/* Assert the VADNDECEN bitfield. */
+	regmap_set_bits(micfil->regmap, REG_MICFIL_VAD0_NCONFIG,
+			MICFIL_VAD0_NCONFIG_NDECEN);
+
+	/* Assert VADNOREN bitfield. */
+	regmap_set_bits(micfil->regmap, REG_MICFIL_VAD0_NCONFIG,
+			MICFIL_VAD0_NCONFIG_NOREN);
+
+	return 0;
+}
+
+/*
+ * Hardware Voice Active Detection: The HWVAD takes data from the input
+ * of a selected PDM microphone to detect if there is any
+ * voice activity. When a voice activity is detected, an interrupt could
+ * be delivered to the system. Initialization in section 8.4:
+ * Can work in two modes:
+ *  -> Eneveope-based mode (section 8.4.1)
+ *  -> Energy-based mode (section 8.4.2)
+ *
+ * It is important to remark that the HWVAD detector could be enabled
+ * or reset only when the MICFIL isn't running i.e. when the BSY_FIL
+ * bit in STAT register is cleared
+ */
+static int fsl_micfil_hwvad_enable(struct fsl_micfil *micfil)
+{
+	int ret;
+
+	micfil->vad_detected = 0;
+
+	/* envelope-based specific initialization */
+	if (micfil->vad_init_mode == MICFIL_HWVAD_ENVELOPE_MODE)
+		ret = fsl_micfil_init_hwvad_envelope_mode(micfil);
+	else
+		ret = fsl_micfil_init_hwvad_energy_mode(micfil);
+	if (ret)
+		return ret;
+
+	/* Voice Activity Detector Internal Filters Initialization*/
+	regmap_set_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL1,
+			MICFIL_VAD0_CTRL1_ST10);
+
+	/* Voice Activity Detector Internal Filter */
+	regmap_clear_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL1,
+			  MICFIL_VAD0_CTRL1_ST10);
+
+	/* Enable Interrupts */
+	ret = fsl_micfil_configure_hwvad_interrupts(micfil, 1);
+	if (ret)
+		return ret;
+
+	/* Voice Activity Detector Reset */
+	regmap_set_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL1,
+			MICFIL_VAD0_CTRL1_RST);
+
+	/* Voice Activity Detector Enabled */
+	regmap_set_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL1,
+			MICFIL_VAD0_CTRL1_EN);
+
+	return 0;
+}
+
+static int fsl_micfil_hwvad_disable(struct fsl_micfil *micfil)
+{
+	struct device *dev = &micfil->pdev->dev;
+	int ret = 0;
+
+	/* Disable HWVAD */
+	regmap_clear_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL1,
+			  MICFIL_VAD0_CTRL1_EN);
+
+	/* Disable hwvad interrupts */
+	ret = fsl_micfil_configure_hwvad_interrupts(micfil, 0);
+	if (ret)
+		dev_err(dev, "Failed to disable interrupts\n");
+
+	return ret;
+}
+
 static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 			      struct snd_soc_dai *dai)
 {
@@ -245,10 +577,16 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ret)
 			return ret;
 
+		if (micfil->vad_enabled)
+			fsl_micfil_hwvad_enable(micfil);
+
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (micfil->vad_enabled)
+			fsl_micfil_hwvad_disable(micfil);
+
 		/* Disable the module */
 		ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
 					MICFIL_CTRL1_PDMIEN);
@@ -328,6 +666,16 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 				 FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div) |
 				 FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 - osr));
 
+	/* Configure CIC OSR in VADCICOSR */
+	regmap_update_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL1,
+			   MICFIL_VAD0_CTRL1_CICOSR,
+			   FIELD_PREP(MICFIL_VAD0_CTRL1_CICOSR, 16 - osr));
+
+	/* Configure source channel in VADCHSEL */
+	regmap_update_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL1,
+			   MICFIL_VAD0_CTRL1_CHSEL,
+			   FIELD_PREP(MICFIL_VAD0_CTRL1_CHSEL, (channels - 1)));
+
 	micfil->dma_params_rx.peripheral_config = &micfil->sdmacfg;
 	micfil->dma_params_rx.peripheral_size = sizeof(micfil->sdmacfg);
 	micfil->sdmacfg.n_fifos_src = channels;
@@ -351,6 +699,7 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 	int ret, i;
 
 	micfil->quality = QUALITY_VLOW0;
+	micfil->card = cpu_dai->component->card;
 
 	/* set default gain to 2 */
 	regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x22222222);
@@ -585,6 +934,71 @@ static irqreturn_t micfil_err_isr(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t voice_detected_fn(int irq, void *devid)
+{
+	struct fsl_micfil *micfil = (struct fsl_micfil *)devid;
+	struct snd_kcontrol *kctl;
+
+	if (!micfil->card)
+		return IRQ_HANDLED;
+
+	kctl = snd_soc_card_get_kcontrol(micfil->card, "VAD Detected");
+	if (!kctl)
+		return IRQ_HANDLED;
+
+	if (micfil->vad_detected)
+		snd_ctl_notify(micfil->card->snd_card,
+			       SNDRV_CTL_EVENT_MASK_VALUE,
+			       &kctl->id);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t hwvad_isr(int irq, void *devid)
+{
+	struct fsl_micfil *micfil = (struct fsl_micfil *)devid;
+	struct device *dev = &micfil->pdev->dev;
+	u32 vad0_reg;
+	int ret;
+
+	regmap_read(micfil->regmap, REG_MICFIL_VAD0_STAT, &vad0_reg);
+
+	/*
+	 * The only difference between MICFIL_VAD0_STAT_EF and
+	 * MICFIL_VAD0_STAT_IF is that the former requires Write
+	 * 1 to Clear. Since both flags are set, it is enough
+	 * to only read one of them
+	 */
+	if (vad0_reg & MICFIL_VAD0_STAT_IF) {
+		/* Write 1 to clear */
+		regmap_write_bits(micfil->regmap, REG_MICFIL_VAD0_STAT,
+				  MICFIL_VAD0_STAT_IF,
+				  MICFIL_VAD0_STAT_IF);
+
+		micfil->vad_detected = 1;
+	}
+
+	ret = fsl_micfil_hwvad_disable(micfil);
+	if (ret)
+		dev_err(dev, "Failed to disable hwvad\n");
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t hwvad_err_isr(int irq, void *devid)
+{
+	struct fsl_micfil *micfil = (struct fsl_micfil *)devid;
+	struct device *dev = &micfil->pdev->dev;
+	u32 vad0_reg;
+
+	regmap_read(micfil->regmap, REG_MICFIL_VAD0_STAT, &vad0_reg);
+
+	if (vad0_reg & MICFIL_VAD0_STAT_INSATF)
+		dev_dbg(dev, "voice activity input overflow/underflow detected\n");
+
+	return IRQ_HANDLED;
+}
+
 static int fsl_micfil_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -677,6 +1091,26 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Digital Microphone interface voice activity detector event */
+	ret = devm_request_threaded_irq(&pdev->dev, micfil->irq[2],
+					hwvad_isr, voice_detected_fn,
+					IRQF_SHARED, micfil->name, micfil);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to claim hwvad event irq %u\n",
+			micfil->irq[0]);
+		return ret;
+	}
+
+	/* Digital Microphone interface voice activity detector error */
+	ret = devm_request_irq(&pdev->dev, micfil->irq[3],
+			       hwvad_err_isr, IRQF_SHARED,
+			       micfil->name, micfil);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to claim hwvad error irq %u\n",
+			micfil->irq[1]);
+		return ret;
+	}
+
 	micfil->dma_params_rx.chan_name = "rx";
 	micfil->dma_params_rx.addr = res->start + REG_MICFIL_DATACH0;
 	micfil->dma_params_rx.maxburst = MICFIL_DMA_MAXBURST_RX;
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index d60285dd07bc..9237a1c4cb8f 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -136,10 +136,14 @@
 #define FIFO_PTRWID			3
 #define FIFO_LEN			BIT(FIFO_PTRWID)
 
-#define MICFIL_IRQ_LINES		2
+#define MICFIL_IRQ_LINES		4
 #define MICFIL_MAX_RETRY		25
 #define MICFIL_SLEEP_MIN		90000 /* in us */
 #define MICFIL_SLEEP_MAX		100000 /* in us */
 #define MICFIL_DMA_MAXBURST_RX		6
 
+/* HWVAD Constants */
+#define MICFIL_HWVAD_ENVELOPE_MODE	0
+#define MICFIL_HWVAD_ENERGY_MODE	1
+
 #endif /* _FSL_MICFIL_H */
-- 
2.34.1

