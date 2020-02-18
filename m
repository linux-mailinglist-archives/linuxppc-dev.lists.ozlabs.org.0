Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA85162129
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 07:53:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MBQ742BtzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 17:53:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MBG541rvzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 17:46:21 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BCF701A3779;
 Tue, 18 Feb 2020 07:46:18 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 45D8C1A375D;
 Tue, 18 Feb 2020 07:46:10 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CCB3F40327;
 Tue, 18 Feb 2020 14:45:29 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and platform
 drivers
Date: Tue, 18 Feb 2020 14:39:37 +0800
Message-Id: <cea88cec3e32759a49d44c41cb615a839f689937.1582007379.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582007379.git.shengjiu.wang@nxp.com>
References: <cover.1582007379.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1582007379.git.shengjiu.wang@nxp.com>
References: <cover.1582007379.git.shengjiu.wang@nxp.com>
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

EASRC (Enhanced Asynchronous Sample Rate Converter) is a new IP module
found on i.MX8MN. It is different with old ASRC module.

The primary features for the EASRC are as follows:
- 4 Contexts - groups of channels with an independent time base
- Fully independent and concurrent context control
- Simultaneous processing of up to 32 audio channels
- Programmable filter charachteristics for each context
- 32, 24, 20, and 16-bit fixed point audio sample support
- 32-bit floating point audio sample support
- 8kHz to 384kHz sample rate
- 1/16 to 8x sample rate conversion ratio

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig           |   10 +
 sound/soc/fsl/Makefile          |    2 +
 sound/soc/fsl/fsl_asrc_common.h |    1 +
 sound/soc/fsl/fsl_easrc.c       | 2265 +++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_easrc.h       |  668 +++++++++
 sound/soc/fsl/fsl_easrc_dma.c   |  440 ++++++
 6 files changed, 3386 insertions(+)
 create mode 100644 sound/soc/fsl/fsl_easrc.c
 create mode 100644 sound/soc/fsl/fsl_easrc.h
 create mode 100644 sound/soc/fsl/fsl_easrc_dma.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 65e8cd4be930..21ba7642b5d0 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -84,6 +84,16 @@ config SND_SOC_FSL_MICFIL
 	  Say Y if you want to add Pulse Density Modulation microphone
 	  interface (MICFIL) support for NXP.
 
+config SND_SOC_FSL_EASRC
+	tristate "Enhanced Asynchronous Sample Rate Converter (EASRC) module support"
+	select REGMAP_MMIO
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  Say Y if you want to add Enhanced ASRC support for NXP. The ASRC is
+	  a digital module that converts audio from a source sample rate to a
+	  destination sample rate. It is a new design module compare with the
+	  old ASRC.
+
 config SND_SOC_FSL_UTILS
 	tristate
 
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 8cde88c72d93..a5a2d08930f4 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -24,6 +24,7 @@ snd-soc-fsl-micfil-objs := fsl_micfil.o
 snd-soc-fsl-utils-objs := fsl_utils.o
 snd-soc-fsl-dma-objs := fsl_dma.o
 snd-soc-fsl-mqs-objs := fsl_mqs.o
+snd-soc-fsl-easrc-objs := fsl_easrc.o fsl_easrc_dma.o
 
 obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
 obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
@@ -35,6 +36,7 @@ obj-$(CONFIG_SND_SOC_FSL_ESAI) += snd-soc-fsl-esai.o
 obj-$(CONFIG_SND_SOC_FSL_MICFIL) += snd-soc-fsl-micfil.o
 obj-$(CONFIG_SND_SOC_FSL_UTILS) += snd-soc-fsl-utils.o
 obj-$(CONFIG_SND_SOC_FSL_MQS) += snd-soc-fsl-mqs.o
+obj-$(CONFIG_SND_SOC_FSL_EASRC) += snd-soc-fsl-easrc.o
 obj-$(CONFIG_SND_SOC_POWERPC_DMA) += snd-soc-fsl-dma.o
 
 # MPC5200 Platform Support
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 8acc55778ff2..c2056b661f15 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -16,6 +16,7 @@ enum asrc_pair_index {
 	ASRC_PAIR_A = 0,
 	ASRC_PAIR_B = 1,
 	ASRC_PAIR_C = 2,
+	ASRC_PAIR_D = 3,
 };
 
 #endif /* _FSL_ASRC_COMMON_H */
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
new file mode 100644
index 000000000000..6fe2953317f2
--- /dev/null
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -0,0 +1,2265 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2019 NXP
+
+#include <linux/atomic.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/kobject.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/miscdevice.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/sched/signal.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/gcd.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include <sound/core.h>
+
+#include "fsl_easrc.h"
+#include "imx-pcm.h"
+
+#define FSL_EASRC_FORMATS       (SNDRV_PCM_FMTBIT_S16_LE | \
+				 SNDRV_PCM_FMTBIT_U16_LE | \
+				 SNDRV_PCM_FMTBIT_S24_LE | \
+				 SNDRV_PCM_FMTBIT_S24_3LE | \
+				 SNDRV_PCM_FMTBIT_U24_LE | \
+				 SNDRV_PCM_FMTBIT_U24_3LE | \
+				 SNDRV_PCM_FMTBIT_S32_LE | \
+				 SNDRV_PCM_FMTBIT_U32_LE | \
+				 SNDRV_PCM_FMTBIT_S20_3LE | \
+				 SNDRV_PCM_FMTBIT_U20_3LE | \
+				 SNDRV_PCM_FMTBIT_FLOAT_LE)
+
+static int fsl_easrc_iec958_put_bits(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct fsl_easrc *easrc = snd_soc_component_get_drvdata(comp);
+	struct soc_mreg_control *mc =
+		(struct soc_mreg_control *)kcontrol->private_value;
+	unsigned int regval = ucontrol->value.integer.value[0];
+
+	easrc->bps_iec958[mc->regbase] = regval;
+
+	return 0;
+}
+
+static int fsl_easrc_iec958_get_bits(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct fsl_easrc *easrc = snd_soc_component_get_drvdata(comp);
+	struct soc_mreg_control *mc =
+		(struct soc_mreg_control *)kcontrol->private_value;
+
+	ucontrol->value.enumerated.item[0] = easrc->bps_iec958[mc->regbase];
+
+	return 0;
+}
+
+int fsl_easrc_get_reg(struct snd_kcontrol *kcontrol,
+		      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_mreg_control *mc =
+		(struct soc_mreg_control *)kcontrol->private_value;
+	unsigned int regval;
+	int ret;
+
+	ret = snd_soc_component_read(component, mc->regbase, &regval);
+	if (ret < 0)
+		return ret;
+
+	ucontrol->value.integer.value[0] = regval;
+
+	return 0;
+}
+
+int fsl_easrc_set_reg(struct snd_kcontrol *kcontrol,
+		      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_mreg_control *mc =
+		(struct soc_mreg_control *)kcontrol->private_value;
+	unsigned int regval = ucontrol->value.integer.value[0];
+	int ret;
+
+	ret = snd_soc_component_write(component, mc->regbase, regval);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+#define SOC_SINGLE_REG_RW(xname, xreg) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_PCM, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.info = snd_soc_info_xr_sx, .get = fsl_easrc_get_reg, \
+	.put = fsl_easrc_set_reg, \
+	.private_value = (unsigned long)&(struct soc_mreg_control) \
+		{ .regbase = xreg, .regcount = 1, .nbits = 32, \
+		  .invert = 0, .min = 0, .max = 0xffffffff, } }
+
+#define SOC_SINGLE_VAL_RW(xname, xreg) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_PCM, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.info = snd_soc_info_xr_sx, .get = fsl_easrc_iec958_get_bits, \
+	.put = fsl_easrc_iec958_put_bits, \
+	.private_value = (unsigned long)&(struct soc_mreg_control) \
+		{ .regbase = xreg, .regcount = 1, .nbits = 32, \
+		  .invert = 0, .min = 0, .max = 2, } }
+
+static const struct snd_kcontrol_new fsl_easrc_snd_controls[] = {
+	SOC_SINGLE("Context 0 Dither Switch", REG_EASRC_COC(0), 0, 1, 0),
+	SOC_SINGLE("Context 1 Dither Switch", REG_EASRC_COC(1), 0, 1, 0),
+	SOC_SINGLE("Context 2 Dither Switch", REG_EASRC_COC(2), 0, 1, 0),
+	SOC_SINGLE("Context 3 Dither Switch", REG_EASRC_COC(3), 0, 1, 0),
+
+	SOC_SINGLE("Context 0 IEC958 Validity", REG_EASRC_COC(0), 2, 1, 0),
+	SOC_SINGLE("Context 1 IEC958 Validity", REG_EASRC_COC(1), 2, 1, 0),
+	SOC_SINGLE("Context 2 IEC958 Validity", REG_EASRC_COC(2), 2, 1, 0),
+	SOC_SINGLE("Context 3 IEC958 Validity", REG_EASRC_COC(3), 2, 1, 0),
+
+	SOC_SINGLE_VAL_RW("Context 0 IEC958 Bits Per Sample", 0),
+	SOC_SINGLE_VAL_RW("Context 1 IEC958 Bits Per Sample", 1),
+	SOC_SINGLE_VAL_RW("Context 2 IEC958 Bits Per Sample", 2),
+	SOC_SINGLE_VAL_RW("Context 3 IEC958 Bits Per Sample", 3),
+
+	SOC_SINGLE_REG_RW("Context 0 IEC958 CS0", REG_EASRC_CS0(0)),
+	SOC_SINGLE_REG_RW("Context 1 IEC958 CS0", REG_EASRC_CS0(1)),
+	SOC_SINGLE_REG_RW("Context 2 IEC958 CS0", REG_EASRC_CS0(2)),
+	SOC_SINGLE_REG_RW("Context 3 IEC958 CS0", REG_EASRC_CS0(3)),
+	SOC_SINGLE_REG_RW("Context 0 IEC958 CS1", REG_EASRC_CS1(0)),
+	SOC_SINGLE_REG_RW("Context 1 IEC958 CS1", REG_EASRC_CS1(1)),
+	SOC_SINGLE_REG_RW("Context 2 IEC958 CS1", REG_EASRC_CS1(2)),
+	SOC_SINGLE_REG_RW("Context 3 IEC958 CS1", REG_EASRC_CS1(3)),
+	SOC_SINGLE_REG_RW("Context 0 IEC958 CS2", REG_EASRC_CS2(0)),
+	SOC_SINGLE_REG_RW("Context 1 IEC958 CS2", REG_EASRC_CS2(1)),
+	SOC_SINGLE_REG_RW("Context 2 IEC958 CS2", REG_EASRC_CS2(2)),
+	SOC_SINGLE_REG_RW("Context 3 IEC958 CS2", REG_EASRC_CS2(3)),
+	SOC_SINGLE_REG_RW("Context 0 IEC958 CS3", REG_EASRC_CS3(0)),
+	SOC_SINGLE_REG_RW("Context 1 IEC958 CS3", REG_EASRC_CS3(1)),
+	SOC_SINGLE_REG_RW("Context 2 IEC958 CS3", REG_EASRC_CS3(2)),
+	SOC_SINGLE_REG_RW("Context 3 IEC958 CS3", REG_EASRC_CS3(3)),
+	SOC_SINGLE_REG_RW("Context 0 IEC958 CS4", REG_EASRC_CS4(0)),
+	SOC_SINGLE_REG_RW("Context 1 IEC958 CS4", REG_EASRC_CS4(1)),
+	SOC_SINGLE_REG_RW("Context 2 IEC958 CS4", REG_EASRC_CS4(2)),
+	SOC_SINGLE_REG_RW("Context 3 IEC958 CS4", REG_EASRC_CS4(3)),
+	SOC_SINGLE_REG_RW("Context 0 IEC958 CS5", REG_EASRC_CS5(0)),
+	SOC_SINGLE_REG_RW("Context 1 IEC958 CS5", REG_EASRC_CS5(1)),
+	SOC_SINGLE_REG_RW("Context 2 IEC958 CS5", REG_EASRC_CS5(2)),
+	SOC_SINGLE_REG_RW("Context 3 IEC958 CS5", REG_EASRC_CS5(3)),
+};
+
+/* set_rs_ratio
+ *
+ * According to the resample taps, calculate the resample ratio
+ */
+static int set_rs_ratio(struct fsl_easrc_context *ctx)
+{
+	struct fsl_easrc *easrc = ctx->easrc;
+	unsigned int in_rate = ctx->in_params.norm_rate;
+	unsigned int out_rate = ctx->out_params.norm_rate;
+	unsigned int int_bits;
+	unsigned int frac_bits;
+	u64 val;
+	u32 *r;
+
+	switch (easrc->rs_num_taps) {
+	case EASRC_RS_32_TAPS:
+		int_bits = 5;
+		frac_bits = 39;
+		break;
+	case EASRC_RS_64_TAPS:
+		int_bits = 6;
+		frac_bits = 38;
+		break;
+	case EASRC_RS_128_TAPS:
+		int_bits = 7;
+		frac_bits = 37;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = (u64)in_rate << frac_bits;
+	do_div(val, out_rate);
+	r = (uint32_t *)&val;
+	regmap_write(easrc->regmap, REG_EASRC_RRL(ctx->index),
+		     EASRC_RRL_RS_RL(r[0]));
+	regmap_write(easrc->regmap, REG_EASRC_RRH(ctx->index),
+		     EASRC_RRH_RS_RH(r[1]));
+
+	return 0;
+}
+
+/* normalize input and output sample rates */
+static void fsl_easrc_normalize_rates(struct fsl_easrc_context *ctx)
+{
+	int a, b;
+
+	if (!ctx)
+		return;
+
+	a = ctx->in_params.sample_rate;
+	b = ctx->out_params.sample_rate;
+
+	a = gcd(a, b);
+
+	/* divide by gcd to normalize the rate */
+	ctx->in_params.norm_rate = ctx->in_params.sample_rate / a;
+	ctx->out_params.norm_rate = ctx->out_params.sample_rate / a;
+}
+
+/* resets the pointer of the coeff memory pointers */
+static int fsl_coeff_mem_ptr_reset(struct fsl_easrc *easrc,
+				   unsigned int ctx_id, int mem_type)
+{
+	struct device *dev;
+	u32 reg, mask, val;
+
+	if (!easrc)
+		return -ENODEV;
+
+	dev = &easrc->pdev->dev;
+
+	switch (mem_type) {
+	case EASRC_PF_COEFF_MEM:
+		/* This resets the prefilter memory pointer addr */
+		if (ctx_id >= EASRC_CTX_MAX_NUM) {
+			dev_err(dev, "Invalid context id[%d]\n", ctx_id);
+			return -EINVAL;
+		}
+
+		reg = REG_EASRC_CCE1(ctx_id);
+		mask = EASRC_CCE1_COEF_MEM_RST_MASK;
+		val = EASRC_CCE1_COEF_MEM_RST;
+		break;
+	case EASRC_RS_COEFF_MEM:
+		/* This resets the resampling memory pointer addr */
+		reg = REG_EASRC_CRCC;
+		mask = EASRC_CRCC_RS_CPR_MASK;
+		val = EASRC_CRCC_RS_CPR;
+		break;
+	default:
+		dev_err(dev, "Unknown memory type\n");
+		return -EINVAL;
+	}
+
+	/*  To reset the write pointer back to zero, the register field
+	 *  ASRC_CTX_CTRL_EXT1x[PF_COEFF_MEM_RST] can be toggled from
+	 *  0x0 to 0x1 to 0x0.
+	 */
+	regmap_update_bits(easrc->regmap, reg, mask, 0);
+	regmap_update_bits(easrc->regmap, reg, mask, val);
+	regmap_update_bits(easrc->regmap, reg, mask, 0);
+
+	return 0;
+}
+
+static inline uint32_t bits_taps_to_val(unsigned int t)
+{
+	switch (t) {
+	case EASRC_RS_32_TAPS:
+		return 32;
+	case EASRC_RS_64_TAPS:
+		return 64;
+	case EASRC_RS_128_TAPS:
+		return 128;
+	}
+
+	return 0;
+}
+
+static int fsl_easrc_resampler_config(struct fsl_easrc *easrc)
+{
+	struct device *dev = &easrc->pdev->dev;
+	struct asrc_firmware_hdr *hdr =  easrc->firmware_hdr;
+	struct interp_params *interp = easrc->interp;
+	struct interp_params *selected_interp = NULL;
+	unsigned int num_coeff;
+	unsigned int i;
+	u64 *arr;
+	u32 *r;
+	int ret;
+
+	if (!hdr) {
+		dev_err(dev, "firmware not loaded!\n");
+		return -ENODEV;
+	}
+
+	for (i = 0; i < hdr->interp_scen; i++) {
+		if ((interp[i].num_taps - 1) ==
+				bits_taps_to_val(easrc->rs_num_taps)) {
+			arr = interp[i].coeff;
+			selected_interp = &interp[i];
+			dev_dbg(dev, "Selected interp_filter: %u taps - %u phases\n",
+				selected_interp->num_taps,
+				selected_interp->num_phases);
+			break;
+		}
+	}
+
+	if (!selected_interp) {
+		dev_err(dev, "failed to get interpreter configuration\n");
+		return -EINVAL;
+	}
+
+	/*
+	 *  RS_LOW - first half of center tap of the sinc function
+	 *  RS_HIGH - second half of center tap of the sinc function
+	 *  This is due to the fact the resampling function must be
+	 *  symetrical - i.e. odd number of taps
+	 */
+	r = (uint32_t *)&selected_interp->center_tap;
+	regmap_write(easrc->regmap, REG_EASRC_RCTCL, EASRC_RCTCL_RS_CL(r[0]));
+	regmap_write(easrc->regmap, REG_EASRC_RCTCH, EASRC_RCTCH_RS_CH(r[1]));
+
+	/* Write Number of Resampling Coefficient Taps
+	 * 00b - 32-Tap Resampling Filter
+	 * 01b - 64-Tap Resampling Filter
+	 * 10b - 128-Tap Resampling Filter
+	 * 11b - N/A
+	 */
+	regmap_update_bits(easrc->regmap, REG_EASRC_CRCC,
+			   EASRC_CRCC_RS_TAPS_MASK,
+			   EASRC_CRCC_RS_TAPS(easrc->rs_num_taps));
+
+	/* Reset prefilter coefficient pointer back to 0 */
+	ret = fsl_coeff_mem_ptr_reset(easrc, 0, EASRC_RS_COEFF_MEM);
+	if (ret)
+		return ret;
+
+	/* When the filter is programmed to run in:
+	 * 32-tap mode, 16-taps, 128-phases 4-coefficients per phase
+	 * 64-tap mode, 32-taps, 64-phases 4-coefficients per phase
+	 * 128-tap mode, 64-taps, 32-phases 4-coefficients per phase
+	 * This means the number of writes is constant no matter
+	 * the mode we are using
+	 */
+	num_coeff = 16 * 128 * 4;
+
+	for (i = 0; i < num_coeff; i++) {
+		r = (uint32_t *)&arr[i];
+		regmap_write(easrc->regmap, REG_EASRC_CRCM,
+			     EASRC_CRCM_RS_CWD(r[0]));
+		regmap_write(easrc->regmap, REG_EASRC_CRCM,
+			     EASRC_CRCM_RS_CWD(r[1]));
+	}
+
+	return 0;
+}
+
+/*****************************************************************************
+ *  Scale filter coefficients (64 bits float)
+ *  For input float32 normalized range (1.0,-1.0) -> output int[16,24,32]:
+ *      scale it by multiplying filter coefficients by 2^31
+ *  For input int[16, 24, 32] -> output float32
+ *      scale it by multiplying filter coefficients by 2^-15, 2^-23, 2^-31
+ *  input:
+ *      easrc:  Structure pointer of fsl_easrc
+ *      infilter : Pointer to non-scaled input filter
+ *      shift:  The multiply factor
+ *  output:
+ *      outfilter: scaled filter
+ *****************************************************************************/
+static int NormalizedFilterForFloat32InIntOut(struct fsl_easrc *easrc,
+					      u64 *infilter,
+					      u64 *outfilter,
+					      int shift)
+{
+	struct device *dev = &easrc->pdev->dev;
+	u64 coef = *infilter;
+	s64 exp  = (coef & 0x7ff0000000000000ll) >> 52;
+	u64 outcoef;
+
+	/*
+	 * If exponent is zero (value == 0), or 7ff (value == NaNs)
+	 * dont touch the content
+	 */
+	if (((coef & 0x7ff0000000000000ll) == 0) ||
+	    ((coef & 0x7ff0000000000000ll) == ((u64)0x7ff << 52))) {
+		*outfilter = coef;
+	} else {
+		if ((shift > 0 && (shift + exp) >= 2047) ||
+		    (shift < 0 && (exp + shift) <= 0)) {
+			dev_err(dev, "coef error\n");
+			return -EINVAL;
+		}
+
+		/* coefficient * 2^shift ==>  coefficient_exp + shift */
+		exp += shift;
+		outcoef = (u64)(coef & 0x800FFFFFFFFFFFFFll) +
+					((u64)exp << 52);
+		*outfilter = outcoef;
+	}
+
+	return 0;
+}
+
+static int write_pf_coeff_mem(struct fsl_easrc *easrc, int ctx_id,
+			      u64 *arr, int n_taps, int shift)
+{
+	struct device *dev = &easrc->pdev->dev;
+	int ret = 0;
+	int i;
+	u32 *r;
+	u64 tmp;
+
+	/* If STx_NUM_TAPS is set to 0x0 then return */
+	if (!n_taps)
+		return 0;
+
+	if (!arr) {
+		dev_err(dev, "NULL buffer\n");
+		return -EINVAL;
+	}
+
+	/* When switching between stages, the address pointer
+	 * should be reset back to 0x0 before performing a write
+	 */
+	ret = fsl_coeff_mem_ptr_reset(easrc, ctx_id, EASRC_PF_COEFF_MEM);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < (n_taps + 1) / 2; i++) {
+		ret = NormalizedFilterForFloat32InIntOut(easrc, &arr[i], &tmp,
+							 shift);
+		if (ret)
+			return ret;
+
+		r = (uint32_t *)&tmp;
+		regmap_write(easrc->regmap, REG_EASRC_PCF(ctx_id),
+			     EASRC_PCF_CD(r[0]));
+		regmap_write(easrc->regmap, REG_EASRC_PCF(ctx_id),
+			     EASRC_PCF_CD(r[1]));
+	}
+
+	return 0;
+}
+
+static int fsl_easrc_prefilter_config(struct fsl_easrc *easrc,
+				      unsigned int ctx_id)
+{
+	struct fsl_easrc_context *ctx;
+	struct asrc_firmware_hdr *hdr;
+	struct prefil_params *prefil, *selected_prefil = NULL;
+	struct device *dev;
+	u32 inrate, outrate, offset = 0;
+	int ret, i;
+
+	/* to modify prefilter coeficients, the user must perform
+	 * a write in ASRC_PRE_COEFF_FIFO[COEFF_DATA] while the
+	 * RUN_EN for that context is set to 0
+	 */
+	if (!easrc)
+		return -ENODEV;
+
+	dev = &easrc->pdev->dev;
+
+	if (ctx_id >= EASRC_CTX_MAX_NUM) {
+		dev_err(dev, "Invalid context id[%d]\n", ctx_id);
+		return -EINVAL;
+	}
+
+	ctx = easrc->ctx[ctx_id];
+
+	ctx->in_filled_sample = bits_taps_to_val(easrc->rs_num_taps) / 2;
+	ctx->out_missed_sample = ctx->in_filled_sample *
+				 ctx->out_params.sample_rate /
+				 ctx->in_params.sample_rate;
+
+	ctx->st1_num_taps = 0;
+	ctx->st2_num_taps = 0;
+
+	regmap_write(easrc->regmap, REG_EASRC_CCE1(ctx_id), 0);
+	regmap_write(easrc->regmap, REG_EASRC_CCE2(ctx_id), 0);
+
+	/* prefilter is enabled only when doing downsampling.
+	 * When out_rate >= in_rate, pf will be in bypass mode
+	 */
+	if (ctx->out_params.sample_rate >= ctx->in_params.sample_rate) {
+		if (ctx->out_params.sample_rate == ctx->in_params.sample_rate)
+			regmap_update_bits(easrc->regmap,
+					   REG_EASRC_CCE1(ctx_id),
+					   EASRC_CCE1_RS_BYPASS_MASK,
+					   EASRC_CCE1_RS_BYPASS);
+
+		if (ctx->in_params.sample_format == SNDRV_PCM_FORMAT_FLOAT_LE &&
+		    ctx->out_params.sample_format != SNDRV_PCM_FORMAT_FLOAT_LE) {
+			ctx->st1_num_taps = 1;
+			ctx->st1_coeff    = &easrc->const_coeff;
+			ctx->st1_num_exp  = 1;
+			ctx->st2_num_taps = 0;
+			ctx->st1_addexp = 31;
+		} else if (ctx->in_params.sample_format != SNDRV_PCM_FORMAT_FLOAT_LE &&
+			   ctx->out_params.sample_format == SNDRV_PCM_FORMAT_FLOAT_LE) {
+			ctx->st1_num_taps = 1;
+			ctx->st1_coeff    = &easrc->const_coeff;
+			ctx->st1_num_exp  = 1;
+			ctx->st2_num_taps = 0;
+			ctx->st1_addexp -= ctx->in_params.fmt.addexp;
+		} else {
+			ctx->st1_num_taps = 1;
+			ctx->st1_coeff    = &easrc->const_coeff;
+			ctx->st1_num_exp  = 1;
+			ctx->st2_num_taps = 0;
+		}
+	} else {
+		inrate = ctx->in_params.norm_rate;
+		outrate = ctx->out_params.norm_rate;
+
+		hdr = easrc->firmware_hdr;
+		prefil = easrc->prefil;
+
+		for (i = 0; i < hdr->prefil_scen; i++) {
+			if (inrate == prefil[i].insr && outrate == prefil[i].outsr) {
+				selected_prefil = &prefil[i];
+				dev_dbg(dev, "Selected prefilter: %u insr, %u outsr, %u st1_taps, %u st2_taps\n",
+					selected_prefil->insr,
+					selected_prefil->outsr,
+					selected_prefil->st1_taps,
+					selected_prefil->st2_taps);
+				break;
+			}
+		}
+
+		if (!selected_prefil) {
+			dev_err(dev, "Conversion from in ratio %u(%u) to out ratio %u(%u) is not supported\n",
+				ctx->in_params.sample_rate,
+				inrate,
+				ctx->out_params.sample_rate, outrate);
+			return -EINVAL;
+		}
+
+		/* in prefilter coeff array, first st1_num_taps represent the
+		 * stage1 prefilter coefficients followed by next st2_num_taps
+		 * representing stage 2 coefficients
+		 */
+		ctx->st1_num_taps = selected_prefil->st1_taps;
+		ctx->st1_coeff    = selected_prefil->coeff;
+		ctx->st1_num_exp  = selected_prefil->st1_exp;
+
+		offset = ((selected_prefil->st1_taps + 1) / 2);
+		ctx->st2_num_taps = selected_prefil->st2_taps;
+		ctx->st2_coeff    = selected_prefil->coeff + offset;
+
+		if (ctx->in_params.sample_format == SNDRV_PCM_FORMAT_FLOAT_LE &&
+		    ctx->out_params.sample_format != SNDRV_PCM_FORMAT_FLOAT_LE) {
+			/* only change stage2 coefficient for 2 stage case */
+			if (ctx->st2_num_taps > 0)
+				ctx->st2_addexp = 31;
+			else
+				ctx->st1_addexp = 31;
+		} else if (ctx->in_params.sample_format != SNDRV_PCM_FORMAT_FLOAT_LE &&
+			   ctx->out_params.sample_format == SNDRV_PCM_FORMAT_FLOAT_LE) {
+			if (ctx->st2_num_taps > 0)
+				ctx->st2_addexp -= ctx->in_params.fmt.addexp;
+			else
+				ctx->st1_addexp -= ctx->in_params.fmt.addexp;
+		}
+	}
+
+	ctx->in_filled_sample += (ctx->st1_num_taps / 2) * ctx->st1_num_exp +
+				  ctx->st2_num_taps / 2;
+	ctx->out_missed_sample = ctx->in_filled_sample *
+				 ctx->out_params.sample_rate /
+				 ctx->in_params.sample_rate;
+
+	if (ctx->in_filled_sample * ctx->out_params.sample_rate %
+				ctx->in_params.sample_rate != 0)
+		ctx->out_missed_sample += 1;
+	/* To modify the value of a prefilter coefficient, the user must
+	 * perform a write to the register ASRC_PRE_COEFF_FIFOn[COEFF_DATA]
+	 * while the respective context RUN_EN bit is set to 0b0
+	 */
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx_id),
+			   EASRC_CC_EN_MASK, 0);
+
+	if (ctx->st1_num_taps > EASRC_MAX_PF_TAPS) {
+		dev_err(dev, "ST1 taps [%d] mus be lower than %d\n",
+			ctx->st1_num_taps, EASRC_MAX_PF_TAPS);
+		ret = -EINVAL;
+		goto ctx_error;
+	}
+
+	/* Update ctx ST1_NUM_TAPS in Context Control Extended 2 register */
+	regmap_update_bits(easrc->regmap, REG_EASRC_CCE2(ctx_id),
+			   EASRC_CCE2_ST1_TAPS_MASK,
+			   EASRC_CCE2_ST1_TAPS(ctx->st1_num_taps - 1));
+
+	/* Prefilter Coefficient Write Select to write in ST1 coeff */
+	regmap_update_bits(easrc->regmap, REG_EASRC_CCE1(ctx_id),
+			   EASRC_CCE1_COEF_WS_MASK,
+			   EASRC_PF_ST1_COEFF_WR << EASRC_CCE1_COEF_WS_SHIFT);
+
+	ret = write_pf_coeff_mem(easrc, ctx_id,
+				 ctx->st1_coeff,
+				 ctx->st1_num_taps,
+				 ctx->st1_addexp);
+	if (ret)
+		goto ctx_error;
+
+	if (ctx->st2_num_taps > 0) {
+		if (ctx->st2_num_taps + ctx->st1_num_taps > EASRC_MAX_PF_TAPS) {
+			dev_err(dev, "ST2 taps [%d] mus be lower than %d\n",
+				ctx->st2_num_taps, EASRC_MAX_PF_TAPS);
+			ret = -EINVAL;
+			goto ctx_error;
+		}
+
+		regmap_update_bits(easrc->regmap, REG_EASRC_CCE1(ctx_id),
+				   EASRC_CCE1_PF_TSEN_MASK,
+				   EASRC_CCE1_PF_TSEN);
+		/*
+		 * Enable prefilter stage1 writeback floating point
+		 * which is used for FLOAT_LE case
+		 */
+		regmap_update_bits(easrc->regmap, REG_EASRC_CCE1(ctx_id),
+				   EASRC_CCE1_PF_ST1_WBFP_MASK,
+				   EASRC_CCE1_PF_ST1_WBFP);
+
+		regmap_update_bits(easrc->regmap, REG_EASRC_CCE1(ctx_id),
+				   EASRC_CCE1_PF_EXP_MASK,
+				   EASRC_CCE1_PF_EXP(ctx->st1_num_exp - 1));
+
+		/* Update ctx ST2_NUM_TAPS in Context Control Extended 2 reg */
+		regmap_update_bits(easrc->regmap, REG_EASRC_CCE2(ctx_id),
+				   EASRC_CCE2_ST2_TAPS_MASK,
+				   EASRC_CCE2_ST2_TAPS(ctx->st2_num_taps - 1));
+
+		/* Prefilter Coefficient Write Select to write in ST2 coeff */
+		regmap_update_bits(easrc->regmap, REG_EASRC_CCE1(ctx_id),
+				   EASRC_CCE1_COEF_WS_MASK,
+				   EASRC_PF_ST2_COEFF_WR << EASRC_CCE1_COEF_WS_SHIFT);
+
+		ret = write_pf_coeff_mem(easrc, ctx_id,
+					 ctx->st2_coeff,
+					 ctx->st2_num_taps,
+					 ctx->st2_addexp);
+		if (ret)
+			goto ctx_error;
+	}
+
+	return 0;
+
+ctx_error:
+	return ret;
+}
+
+static int fsl_easrc_max_ch_for_slot(struct fsl_easrc_context *ctx,
+				     struct fsl_easrc_slot *slot)
+{
+	int st1_mem_alloc = 0, st2_mem_alloc = 0;
+	int pf_mem_alloc = 0;
+	int max_channels = 8 - slot->num_channel;
+	int channels = 0;
+
+	if (ctx->st1_num_taps > 0) {
+		if (ctx->st2_num_taps > 0)
+			st1_mem_alloc =
+				(ctx->st1_num_taps - 1) * ctx->st1_num_exp + 1;
+		else
+			st1_mem_alloc = ctx->st1_num_taps;
+	}
+
+	if (ctx->st2_num_taps > 0)
+		st2_mem_alloc = ctx->st2_num_taps;
+
+	pf_mem_alloc = st1_mem_alloc + st2_mem_alloc;
+
+	if (pf_mem_alloc != 0)
+		channels = (6144 - slot->pf_mem_used) / pf_mem_alloc;
+	else
+		channels = 8;
+
+	if (channels < max_channels)
+		max_channels = channels;
+
+	return max_channels;
+}
+
+static int fsl_easrc_config_one_slot(struct fsl_easrc_context *ctx,
+				     struct fsl_easrc_slot *slot,
+				     unsigned int slot_idx,
+				     unsigned int reg0,
+				     unsigned int reg1,
+				     unsigned int reg2,
+				     unsigned int reg3,
+				     unsigned int *req_channels,
+				     unsigned int *start_channel,
+				     unsigned int *avail_channel)
+{
+	struct fsl_easrc *easrc = ctx->easrc;
+	int st1_chanxexp, st1_mem_alloc = 0, st2_mem_alloc = 0;
+	unsigned int addr;
+
+	if (*req_channels <= *avail_channel) {
+		slot->num_channel = *req_channels;
+		slot->min_channel = *start_channel;
+		slot->max_channel = *start_channel + *req_channels - 1;
+		slot->ctx_index = ctx->index;
+		slot->busy = true;
+		*start_channel += *req_channels;
+		*req_channels = 0;
+	} else {
+		slot->num_channel = *avail_channel;
+		slot->min_channel = *start_channel;
+		slot->max_channel = *start_channel + *avail_channel - 1;
+		slot->ctx_index = ctx->index;
+		slot->busy = true;
+		*start_channel += *avail_channel;
+		*req_channels -= *avail_channel;
+	}
+
+	regmap_update_bits(easrc->regmap, reg0,
+			   EASRC_DPCS0R0_MAXCH_MASK,
+			   EASRC_DPCS0R0_MAXCH(slot->max_channel));
+
+	regmap_update_bits(easrc->regmap, reg0,
+			   EASRC_DPCS0R0_MINCH_MASK,
+			   EASRC_DPCS0R0_MINCH(slot->min_channel));
+
+	regmap_update_bits(easrc->regmap, reg0,
+			   EASRC_DPCS0R0_NUMCH_MASK,
+			   EASRC_DPCS0R0_NUMCH(slot->num_channel - 1));
+
+	regmap_update_bits(easrc->regmap, reg0,
+			   EASRC_DPCS0R0_CTXNUM_MASK,
+			   EASRC_DPCS0R0_CTXNUM(slot->ctx_index));
+
+	if (ctx->st1_num_taps > 0) {
+		if (ctx->st2_num_taps > 0)
+			st1_mem_alloc =
+				(ctx->st1_num_taps - 1) * slot->num_channel *
+				ctx->st1_num_exp + slot->num_channel;
+		else
+			st1_mem_alloc = ctx->st1_num_taps * slot->num_channel;
+
+		slot->pf_mem_used = st1_mem_alloc;
+		regmap_update_bits(easrc->regmap, reg2,
+				   EASRC_DPCS0R2_ST1_MA_MASK,
+				   EASRC_DPCS0R2_ST1_MA(st1_mem_alloc));
+
+		if (slot_idx == 1)
+			addr = 0x1800 - st1_mem_alloc;
+		else
+			addr = 0;
+
+		regmap_update_bits(easrc->regmap, reg2,
+				   EASRC_DPCS0R2_ST1_SA_MASK,
+				   EASRC_DPCS0R2_ST1_SA(addr));
+	}
+
+	if (ctx->st2_num_taps > 0) {
+		st1_chanxexp = slot->num_channel * (ctx->st1_num_exp - 1);
+
+		regmap_update_bits(easrc->regmap, reg1,
+				   EASRC_DPCS0R1_ST1_EXP_MASK,
+				   EASRC_DPCS0R1_ST1_EXP(st1_chanxexp));
+
+		st2_mem_alloc = slot->num_channel * ctx->st2_num_taps;
+		slot->pf_mem_used += st2_mem_alloc;
+		regmap_update_bits(easrc->regmap, reg3,
+				   EASRC_DPCS0R3_ST2_MA_MASK,
+				   EASRC_DPCS0R3_ST2_MA(st2_mem_alloc));
+
+		if (slot_idx == 1)
+			addr = 0x1800 - st1_mem_alloc - st2_mem_alloc;
+		else
+			addr = st1_mem_alloc;
+
+		regmap_update_bits(easrc->regmap, reg3,
+				   EASRC_DPCS0R3_ST2_SA_MASK,
+				   EASRC_DPCS0R3_ST2_SA(addr));
+	}
+
+	regmap_update_bits(easrc->regmap, reg0,
+			   EASRC_DPCS0R0_EN_MASK, EASRC_DPCS0R0_EN);
+
+	return 0;
+}
+
+/* fsl_easrc_config_slot
+ *
+ * A single context can be split amongst any of the 4 context processing pipes
+ * in the design.
+ * The total number of channels consumed within the context processor must be
+ * less than or equal to 8. if a single context is configured to contain more
+ * than 8 channels then it must be distributed across multiple context
+ * processing pipe slots.
+ *
+ */
+static int fsl_easrc_config_slot(struct fsl_easrc *easrc, unsigned int ctx_id)
+{
+	struct fsl_easrc_context *ctx = easrc->ctx[ctx_id];
+	int req_channels = ctx->channels;
+	int start_channel = 0, avail_channel;
+	struct fsl_easrc_slot *slot0, *slot1;
+	int i, ret;
+
+	if (req_channels <= 0)
+		return -EINVAL;
+
+	for (i = 0; i < EASRC_CTX_MAX_NUM; i++) {
+		slot0 = &easrc->slot[i][0];
+		slot1 = &easrc->slot[i][1];
+
+		if (slot0->busy && slot1->busy)
+			continue;
+
+		if (!slot0->busy) {
+			if (slot1->busy && slot1->ctx_index == ctx->index)
+				continue;
+
+			avail_channel = fsl_easrc_max_ch_for_slot(ctx, slot1);
+			if (avail_channel <= 0)
+				continue;
+
+			ret = fsl_easrc_config_one_slot(ctx,
+							slot0, 0,
+							REG_EASRC_DPCS0R0(i),
+							REG_EASRC_DPCS0R1(i),
+							REG_EASRC_DPCS0R2(i),
+							REG_EASRC_DPCS0R3(i),
+							&req_channels,
+							&start_channel,
+							&avail_channel);
+			if (ret)
+				return ret;
+
+			if (req_channels > 0)
+				continue;
+			else
+				break;
+		}
+
+		if (slot0->busy && !slot1->busy) {
+			if (slot0->ctx_index == ctx->index)
+				continue;
+
+			avail_channel = fsl_easrc_max_ch_for_slot(ctx, slot0);
+			if (avail_channel <= 0)
+				continue;
+
+			ret = fsl_easrc_config_one_slot(ctx,
+							slot1, 1,
+							REG_EASRC_DPCS1R0(i),
+							REG_EASRC_DPCS1R1(i),
+							REG_EASRC_DPCS1R2(i),
+							REG_EASRC_DPCS1R3(i),
+							&req_channels,
+							&start_channel,
+							&avail_channel);
+			if (ret)
+				return ret;
+
+			if (req_channels > 0)
+				continue;
+			else
+				break;
+		}
+	}
+
+	if (req_channels > 0) {
+		dev_err(&easrc->pdev->dev, "no avail slot.\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* fsl_easrc_release_slot
+ *
+ * clear the slot configuration
+ */
+static int fsl_easrc_release_slot(struct fsl_easrc *easrc, unsigned int ctx_id)
+{
+	struct fsl_easrc_context *ctx = easrc->ctx[ctx_id];
+	int i;
+
+	for (i = 0; i < EASRC_CTX_MAX_NUM; i++) {
+		if (easrc->slot[i][0].busy &&
+		    easrc->slot[i][0].ctx_index == ctx->index) {
+			easrc->slot[i][0].busy = false;
+			easrc->slot[i][0].num_channel = 0;
+			easrc->slot[i][0].pf_mem_used = 0;
+			/* set registers */
+			regmap_write(easrc->regmap, REG_EASRC_DPCS0R0(i), 0);
+			regmap_write(easrc->regmap, REG_EASRC_DPCS0R1(i), 0);
+			regmap_write(easrc->regmap, REG_EASRC_DPCS0R2(i), 0);
+			regmap_write(easrc->regmap, REG_EASRC_DPCS0R3(i), 0);
+		}
+
+		if (easrc->slot[i][1].busy &&
+		    easrc->slot[i][1].ctx_index == ctx->index) {
+			easrc->slot[i][1].busy = false;
+			easrc->slot[i][1].num_channel = 0;
+			easrc->slot[i][1].pf_mem_used = 0;
+			/* set registers */
+			regmap_write(easrc->regmap, REG_EASRC_DPCS1R0(i), 0);
+			regmap_write(easrc->regmap, REG_EASRC_DPCS1R1(i), 0);
+			regmap_write(easrc->regmap, REG_EASRC_DPCS1R2(i), 0);
+			regmap_write(easrc->regmap, REG_EASRC_DPCS1R3(i), 0);
+		}
+	}
+
+	return 0;
+}
+
+/* fsl_easrc_config_context
+ *
+ * configure the register relate with context.
+ */
+int fsl_easrc_config_context(struct fsl_easrc *easrc, unsigned int ctx_id)
+{
+	struct fsl_easrc_context *ctx;
+	struct device *dev;
+	unsigned long lock_flags;
+	int ret;
+
+	/* to modify prefilter coeficients, the user must perform
+	 * a write in ASRC_PRE_COEFF_FIFO[COEFF_DATA] while the
+	 * RUN_EN for that context is set to 0
+	 */
+	if (!easrc)
+		return -ENODEV;
+
+	dev = &easrc->pdev->dev;
+
+	if (ctx_id >= EASRC_CTX_MAX_NUM) {
+		dev_err(dev, "Invalid context id[%d]\n", ctx_id);
+		return -EINVAL;
+	}
+
+	ctx = easrc->ctx[ctx_id];
+
+	fsl_easrc_normalize_rates(ctx);
+
+	ret = set_rs_ratio(ctx);
+	if (ret)
+		return ret;
+
+	/* initialize the context coeficients */
+	ret = fsl_easrc_prefilter_config(easrc, ctx->index);
+	if (ret)
+		return ret;
+
+	spin_lock_irqsave(&easrc->lock, lock_flags);
+	ret = fsl_easrc_config_slot(easrc, ctx->index);
+	spin_unlock_irqrestore(&easrc->lock, lock_flags);
+	if (ret)
+		return ret;
+
+	/* Both prefilter and resampling filters can use following
+	 * initialization modes:
+	 * 2 - zero-fil mode
+	 * 1 - replication mode
+	 * 0 - software control
+	 */
+	regmap_update_bits(easrc->regmap, REG_EASRC_CCE1(ctx_id),
+			   EASRC_CCE1_RS_INIT_MASK,
+			   EASRC_CCE1_RS_INIT(ctx->rs_init_mode));
+
+	regmap_update_bits(easrc->regmap, REG_EASRC_CCE1(ctx_id),
+			   EASRC_CCE1_PF_INIT_MASK,
+			   EASRC_CCE1_PF_INIT(ctx->pf_init_mode));
+
+	/* Context Input FIFO Watermark */
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx_id),
+			   EASRC_CC_FIFO_WTMK_MASK,
+			   EASRC_CC_FIFO_WTMK(ctx->in_params.fifo_wtmk));
+
+	/* Context Output FIFO Watermark */
+	regmap_update_bits(easrc->regmap, REG_EASRC_COC(ctx_id),
+			   EASRC_COC_FIFO_WTMK_MASK,
+			   EASRC_COC_FIFO_WTMK(ctx->out_params.fifo_wtmk - 1));
+
+	/* number of channels */
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx_id),
+			   EASRC_CC_CHEN_MASK,
+			   EASRC_CC_CHEN(ctx->channels - 1));
+	return 0;
+}
+
+static int fsl_easrc_process_format(struct fsl_easrc_context *ctx,
+				    struct fsl_easrc_data_fmt *fmt,
+				    snd_pcm_format_t raw_fmt)
+{
+	struct fsl_easrc *easrc = ctx->easrc;
+	int ret;
+
+	if (!fmt)
+		return -EINVAL;
+
+	/* Context Input Floating Point Format
+	 * 0 - Integer Format
+	 * 1 - Single Precision FP Format
+	 */
+	fmt->floating_point = !snd_pcm_format_linear(raw_fmt);
+	fmt->sample_pos = 0;
+	fmt->iec958 = 0;
+
+	/* get the data width */
+	switch (snd_pcm_format_width(raw_fmt)) {
+	case 16:
+		fmt->width = EASRC_WIDTH_16_BIT;
+		fmt->addexp = 15;
+		break;
+	case 20:
+		fmt->width = EASRC_WIDTH_20_BIT;
+		fmt->addexp = 19;
+		break;
+	case 24:
+		fmt->width = EASRC_WIDTH_24_BIT;
+		fmt->addexp = 23;
+		break;
+	case 32:
+		fmt->width = EASRC_WIDTH_32_BIT;
+		fmt->addexp = 31;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (raw_fmt) {
+	case SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE:
+		fmt->width = easrc->bps_iec958[ctx->index];
+		fmt->iec958 = 1;
+		fmt->floating_point = 0;
+		if (fmt->width == EASRC_WIDTH_16_BIT) {
+			fmt->sample_pos = 12;
+			fmt->addexp = 15;
+		} else if (fmt->width == EASRC_WIDTH_20_BIT) {
+			fmt->sample_pos = 8;
+			fmt->addexp = 19;
+		} else if (fmt->width == EASRC_WIDTH_24_BIT) {
+			fmt->sample_pos = 4;
+			fmt->addexp = 23;
+		}
+		break;
+	default:
+		break;
+	}
+
+	/* Data Endianness
+	 * 0 - Little-Endian
+	 * 1 - Big-Endian
+	 */
+	ret = snd_pcm_format_big_endian(raw_fmt);
+	if (ret < 0)
+		return ret;
+
+	fmt->endianness = ret;
+	/* Input Data sign
+	 * 0b - Signed Format
+	 * 1b - Unsigned Format
+	 */
+	fmt->unsign = snd_pcm_format_unsigned(raw_fmt) > 0 ? 1 : 0;
+
+	return 0;
+}
+
+int fsl_easrc_set_ctx_format(struct fsl_easrc_context *ctx,
+			     snd_pcm_format_t *in_raw_format,
+			     snd_pcm_format_t *out_raw_format)
+{
+	struct fsl_easrc *easrc = ctx->easrc;
+	struct fsl_easrc_data_fmt *in_fmt = &ctx->in_params.fmt;
+	struct fsl_easrc_data_fmt *out_fmt = &ctx->out_params.fmt;
+	int ret;
+
+	/* get the bitfield values for input data format */
+	if (in_raw_format && out_raw_format) {
+		ret = fsl_easrc_process_format(ctx, in_fmt, *in_raw_format);
+		if (ret)
+			return ret;
+	}
+
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx->index),
+			   EASRC_CC_BPS_MASK,
+			   EASRC_CC_BPS(in_fmt->width));
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx->index),
+			   EASRC_CC_ENDIANNESS_MASK,
+			   in_fmt->endianness << EASRC_CC_ENDIANNESS_SHIFT);
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx->index),
+			   EASRC_CC_FMT_MASK,
+			   in_fmt->floating_point << EASRC_CC_FMT_SHIFT);
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx->index),
+			   EASRC_CC_INSIGN_MASK,
+			   in_fmt->unsign << EASRC_CC_INSIGN_SHIFT);
+
+	/* In Sample Position */
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx->index),
+			   EASRC_CC_SAMPLE_POS_MASK,
+			   EASRC_CC_SAMPLE_POS(in_fmt->sample_pos));
+
+	/* get the bitfield values for input data format */
+	if (in_raw_format && out_raw_format) {
+		ret = fsl_easrc_process_format(ctx, out_fmt, *out_raw_format);
+		if (ret)
+			return ret;
+	}
+
+	regmap_update_bits(easrc->regmap, REG_EASRC_COC(ctx->index),
+			   EASRC_COC_BPS_MASK,
+			   EASRC_COC_BPS(out_fmt->width));
+	regmap_update_bits(easrc->regmap, REG_EASRC_COC(ctx->index),
+			   EASRC_COC_ENDIANNESS_MASK,
+			   out_fmt->endianness << EASRC_COC_ENDIANNESS_SHIFT);
+	regmap_update_bits(easrc->regmap, REG_EASRC_COC(ctx->index),
+			   EASRC_COC_FMT_MASK,
+			   out_fmt->floating_point << EASRC_COC_FMT_SHIFT);
+	regmap_update_bits(easrc->regmap, REG_EASRC_COC(ctx->index),
+			   EASRC_COC_OUTSIGN_MASK,
+			   out_fmt->unsign << EASRC_COC_OUTSIGN_SHIFT);
+
+	/* Out Sample Position */
+	regmap_update_bits(easrc->regmap, REG_EASRC_COC(ctx->index),
+			   EASRC_COC_SAMPLE_POS_MASK,
+			   EASRC_COC_SAMPLE_POS(out_fmt->sample_pos));
+
+	regmap_update_bits(easrc->regmap, REG_EASRC_COC(ctx->index),
+			   EASRC_COC_IEC_EN_MASK,
+			   out_fmt->iec958 << EASRC_COC_IEC_EN_SHIFT);
+
+	return ret;
+}
+
+/* The ASRC provides interleaving support in hardware to ensure that a
+ * variety of sample sources can be internally combined
+ * to conform with this format. Interleaving parameters are accessed
+ * through the ASRC_CTRL_IN_ACCESSa and ASRC_CTRL_OUT_ACCESSa registers
+ */
+int fsl_easrc_set_ctx_organziation(struct fsl_easrc_context *ctx)
+{
+	struct device *dev;
+	struct fsl_easrc *easrc;
+
+	if (!ctx)
+		return -ENODEV;
+
+	easrc = ctx->easrc;
+	dev = &easrc->pdev->dev;
+
+	/* input interleaving parameters */
+	regmap_update_bits(easrc->regmap, REG_EASRC_CIA(ctx->index),
+			   EASRC_CIA_ITER_MASK,
+			   EASRC_CIA_ITER(ctx->in_params.iterations));
+	regmap_update_bits(easrc->regmap, REG_EASRC_CIA(ctx->index),
+			   EASRC_CIA_GRLEN_MASK,
+			   EASRC_CIA_GRLEN(ctx->in_params.group_len));
+	regmap_update_bits(easrc->regmap, REG_EASRC_CIA(ctx->index),
+			   EASRC_CIA_ACCLEN_MASK,
+			   EASRC_CIA_ACCLEN(ctx->in_params.access_len));
+
+	/* output interleaving parameters */
+	regmap_update_bits(easrc->regmap, REG_EASRC_COA(ctx->index),
+			   EASRC_COA_ITER_MASK,
+			   EASRC_COA_ITER(ctx->out_params.iterations));
+	regmap_update_bits(easrc->regmap, REG_EASRC_COA(ctx->index),
+			   EASRC_COA_GRLEN_MASK,
+			   EASRC_COA_GRLEN(ctx->out_params.group_len));
+	regmap_update_bits(easrc->regmap, REG_EASRC_COA(ctx->index),
+			   EASRC_COA_ACCLEN_MASK,
+			   EASRC_COA_ACCLEN(ctx->out_params.access_len));
+
+	return 0;
+}
+
+/* Request one of the available contexts
+ *
+ * Returns a negative number on error and >=0 as context id
+ * on success
+ */
+int fsl_easrc_request_context(struct fsl_easrc_context *ctx,
+			      unsigned int channels)
+{
+	enum asrc_pair_index index = ASRC_INVALID_PAIR;
+	struct fsl_easrc *easrc = ctx->easrc;
+	struct device *dev;
+	unsigned long lock_flags;
+	int ret = 0;
+	int i;
+
+	dev = &easrc->pdev->dev;
+
+	spin_lock_irqsave(&easrc->lock, lock_flags);
+
+	for (i = ASRC_PAIR_A; i < EASRC_CTX_MAX_NUM; i++) {
+		if (easrc->ctx[i])
+			continue;
+
+		index = i;
+		break;
+	}
+
+	if (index == ASRC_INVALID_PAIR) {
+		dev_err(dev, "all contexts are busy\n");
+		ret = -EBUSY;
+	} else if (channels > easrc->chn_avail) {
+		dev_err(dev, "can't give the required channels: %d\n",
+			channels);
+		ret = -EINVAL;
+	} else {
+		ctx->index = index;
+		ctx->channels = channels;
+		easrc->ctx[index] = ctx;
+		easrc->chn_avail -= channels;
+	}
+
+	spin_unlock_irqrestore(&easrc->lock, lock_flags);
+
+	return ret;
+}
+
+/* Release the context
+ *
+ * This funciton is mainly doing the revert thing in request context
+ */
+int fsl_easrc_release_context(struct fsl_easrc_context *ctx)
+{
+	unsigned long lock_flags;
+	struct fsl_easrc *easrc;
+	struct device *dev;
+	int ret;
+
+	if (!ctx)
+		return 0;
+
+	easrc = ctx->easrc;
+	dev = &easrc->pdev->dev;
+
+	spin_lock_irqsave(&easrc->lock, lock_flags);
+
+	ret = fsl_easrc_release_slot(easrc, ctx->index);
+
+	easrc->chn_avail += ctx->channels;
+	easrc->ctx[ctx->index] = NULL;
+
+	spin_unlock_irqrestore(&easrc->lock, lock_flags);
+
+	return ret;
+}
+
+/* Start the context
+ *
+ * Enable the DMA request and context
+ */
+int fsl_easrc_start_context(struct fsl_easrc_context *ctx)
+{
+	struct fsl_easrc *easrc = ctx->easrc;
+
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx->index),
+			   EASRC_CC_FWMDE_MASK,
+			   EASRC_CC_FWMDE);
+	regmap_update_bits(easrc->regmap, REG_EASRC_COC(ctx->index),
+			   EASRC_COC_FWMDE_MASK,
+			   EASRC_COC_FWMDE);
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx->index),
+			   EASRC_CC_EN_MASK,
+			   EASRC_CC_EN);
+	return 0;
+}
+
+/* Stop the context
+ *
+ * Disable the DMA request and context
+ */
+int fsl_easrc_stop_context(struct fsl_easrc_context *ctx)
+{
+	struct fsl_easrc *easrc = ctx->easrc;
+	int val, i;
+	int size = 0;
+	int retry = 200;
+
+	regmap_read(easrc->regmap, REG_EASRC_CC(ctx->index), &val);
+
+	if (val & EASRC_CC_EN_MASK) {
+		regmap_update_bits(easrc->regmap,
+				   REG_EASRC_CC(ctx->index),
+				   EASRC_CC_STOP_MASK, EASRC_CC_STOP);
+		do {
+			regmap_read(easrc->regmap, REG_EASRC_SFS(ctx->index), &val);
+			val &= EASRC_SFS_NSGO_MASK;
+			size = val >> EASRC_SFS_NSGO_SHIFT;
+
+			/* Read FIFO, drop the data */
+			for (i = 0; i < size * ctx->channels; i++)
+				regmap_read(easrc->regmap, REG_EASRC_RDFIFO(ctx->index), &val);
+			/* Check RUN_STOP_DONE */
+			regmap_read(easrc->regmap, REG_EASRC_IRQF, &val);
+			if (val & EASRC_IRQF_RSD(1 << ctx->index)) {
+				/*Clear RUN_STOP_DONE*/
+				regmap_write_bits(easrc->regmap,
+						  REG_EASRC_IRQF,
+						  EASRC_IRQF_RSD(1 << ctx->index),
+						  EASRC_IRQF_RSD(1 << ctx->index));
+				break;
+			}
+			udelay(100);
+		} while (--retry);
+
+		if (retry == 0)
+			dev_warn(&easrc->pdev->dev, "RUN STOP fail\n");
+	}
+
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx->index),
+			   EASRC_CC_EN_MASK | EASRC_CC_STOP_MASK, 0);
+	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx->index),
+			   EASRC_CC_FWMDE_MASK, 0);
+	regmap_update_bits(easrc->regmap, REG_EASRC_COC(ctx->index),
+			   EASRC_COC_FWMDE_MASK, 0);
+	return 0;
+}
+
+struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_easrc_context *ctx,
+					   bool dir)
+{
+	struct fsl_easrc *easrc = ctx->easrc;
+	enum asrc_pair_index index = ctx->index;
+	char name[8];
+
+	/* example of dma name: ctx0_rx */
+	sprintf(name, "ctx%c_%cx", index + '0', dir == IN ? 'r' : 't');
+
+	return dma_request_slave_channel(&easrc->pdev->dev, name);
+};
+EXPORT_SYMBOL_GPL(fsl_easrc_get_dma_channel);
+
+static const unsigned int easrc_rates[] = {
+	8000, 11025, 12000, 16000,
+	22050, 24000, 32000, 44100,
+	48000, 64000, 88200, 96000,
+	128000, 176400, 192000, 256000,
+	352800, 384000, 705600, 768000,
+};
+
+static const struct snd_pcm_hw_constraint_list easrc_rate_constraints = {
+	.count = ARRAY_SIZE(easrc_rates),
+	.list = easrc_rates,
+};
+
+static int fsl_easrc_startup(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_RATE,
+					  &easrc_rate_constraints);
+}
+
+static int fsl_easrc_trigger(struct snd_pcm_substream *substream,
+			     int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct fsl_easrc_context *ctx = runtime->private_data;
+	int ret;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = fsl_easrc_start_context(ctx);
+		if (ret)
+			return ret;
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = fsl_easrc_stop_context(ctx);
+		if (ret)
+			return ret;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int fsl_easrc_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params,
+			       struct snd_soc_dai *dai)
+{
+	struct fsl_easrc *easrc = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct device *dev = &easrc->pdev->dev;
+	struct fsl_easrc_context *ctx = runtime->private_data;
+	unsigned int channels = params_channels(params);
+	unsigned int rate = params_rate(params);
+	snd_pcm_format_t format = params_format(params);
+	int ret;
+
+	ret = fsl_easrc_request_context(ctx, channels);
+	if (ret) {
+		dev_err(dev, "failed to request context\n");
+		return ret;
+	}
+
+	ctx->ctx_streams |= BIT(substream->stream);
+
+	/* set the input and output ratio so we can compute
+	 * the resampling ratio in RS_LOW/HIGH
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ctx->in_params.sample_rate = rate;
+		ctx->in_params.sample_format = format;
+		ctx->out_params.sample_rate = easrc->easrc_rate;
+		ctx->out_params.sample_format = easrc->easrc_format;
+	} else {
+		ctx->out_params.sample_rate = rate;
+		ctx->out_params.sample_format = format;
+		ctx->in_params.sample_rate = easrc->easrc_rate;
+		ctx->in_params.sample_format = easrc->easrc_format;
+	}
+
+	ctx->channels = channels;
+	ctx->in_params.fifo_wtmk  = 0x20;
+	ctx->out_params.fifo_wtmk = 0x20;
+
+	/* do only rate conversion and keep the same format for input
+	 * and output data
+	 */
+	ret = fsl_easrc_set_ctx_format(ctx,
+				       &ctx->in_params.sample_format,
+				       &ctx->out_params.sample_format);
+	if (ret) {
+		dev_err(dev, "failed to set format %d", ret);
+		return ret;
+	}
+
+	ret = fsl_easrc_config_context(easrc, ctx->index);
+	if (ret) {
+		dev_err(dev, "failed to config context\n");
+		return ret;
+	}
+
+	ctx->in_params.iterations = 1;
+	ctx->in_params.group_len = ctx->channels;
+	ctx->in_params.access_len = ctx->channels;
+	ctx->out_params.iterations = 1;
+	ctx->out_params.group_len = ctx->channels;
+	ctx->out_params.access_len = ctx->channels;
+
+	ret = fsl_easrc_set_ctx_organziation(ctx);
+	if (ret) {
+		dev_err(dev, "failed to set fifo organization\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int fsl_easrc_hw_free(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct fsl_easrc_context *ctx = runtime->private_data;
+	int ret;
+
+	if (ctx && (ctx->ctx_streams & BIT(substream->stream))) {
+		ctx->ctx_streams &= ~BIT(substream->stream);
+		ret = fsl_easrc_release_context(ctx);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct snd_soc_dai_ops fsl_easrc_dai_ops = {
+	.startup = fsl_easrc_startup,
+	.trigger = fsl_easrc_trigger,
+	.hw_params = fsl_easrc_hw_params,
+	.hw_free = fsl_easrc_hw_free,
+};
+
+static int fsl_easrc_dai_probe(struct snd_soc_dai *cpu_dai)
+{
+	struct fsl_easrc *easrc = dev_get_drvdata(cpu_dai->dev);
+
+	snd_soc_dai_init_dma_data(cpu_dai,
+				  &easrc->dma_params_tx,
+				  &easrc->dma_params_rx);
+	return 0;
+}
+
+static struct snd_soc_dai_driver fsl_easrc_dai = {
+	.probe = fsl_easrc_dai_probe,
+	.playback = {
+		.stream_name = "ASRC-Playback",
+		.channels_min = 1,
+		.channels_max = 32,
+		.rate_min = 8000,
+		.rate_max = 768000,
+		.rates = SNDRV_PCM_RATE_KNOT,
+		.formats = FSL_EASRC_FORMATS,
+	},
+	.capture = {
+		.stream_name = "ASRC-Capture",
+		.channels_min = 1,
+		.channels_max = 32,
+		.rate_min = 8000,
+		.rate_max = 768000,
+		.rates = SNDRV_PCM_RATE_KNOT,
+		.formats = FSL_EASRC_FORMATS |
+			   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+	},
+	.ops = &fsl_easrc_dai_ops,
+};
+
+static const struct snd_soc_component_driver fsl_easrc_component = {
+	.name		= "fsl-easrc-dai",
+	.controls       = fsl_easrc_snd_controls,
+	.num_controls   = ARRAY_SIZE(fsl_easrc_snd_controls),
+};
+
+static const struct reg_default fsl_easrc_reg_defaults[] = {
+	{REG_EASRC_WRFIFO(0),	0x00000000},
+	{REG_EASRC_WRFIFO(1),	0x00000000},
+	{REG_EASRC_WRFIFO(2),	0x00000000},
+	{REG_EASRC_WRFIFO(3),	0x00000000},
+	{REG_EASRC_RDFIFO(0),	0x00000000},
+	{REG_EASRC_RDFIFO(1),	0x00000000},
+	{REG_EASRC_RDFIFO(2),	0x00000000},
+	{REG_EASRC_RDFIFO(3),	0x00000000},
+	{REG_EASRC_CC(0),	0x00000000},
+	{REG_EASRC_CC(1),	0x00000000},
+	{REG_EASRC_CC(2),	0x00000000},
+	{REG_EASRC_CC(3),	0x00000000},
+	{REG_EASRC_CCE1(0),	0x00000000},
+	{REG_EASRC_CCE1(1),	0x00000000},
+	{REG_EASRC_CCE1(2),	0x00000000},
+	{REG_EASRC_CCE1(3),	0x00000000},
+	{REG_EASRC_CCE2(0),	0x00000000},
+	{REG_EASRC_CCE2(1),	0x00000000},
+	{REG_EASRC_CCE2(2),	0x00000000},
+	{REG_EASRC_CCE2(3),	0x00000000},
+	{REG_EASRC_CIA(0),	0x00000000},
+	{REG_EASRC_CIA(1),	0x00000000},
+	{REG_EASRC_CIA(2),	0x00000000},
+	{REG_EASRC_CIA(3),	0x00000000},
+	{REG_EASRC_DPCS0R0(0),	0x00000000},
+	{REG_EASRC_DPCS0R0(1),	0x00000000},
+	{REG_EASRC_DPCS0R0(2),	0x00000000},
+	{REG_EASRC_DPCS0R0(3),	0x00000000},
+	{REG_EASRC_DPCS0R1(0),	0x00000000},
+	{REG_EASRC_DPCS0R1(1),	0x00000000},
+	{REG_EASRC_DPCS0R1(2),	0x00000000},
+	{REG_EASRC_DPCS0R1(3),	0x00000000},
+	{REG_EASRC_DPCS0R2(0),	0x00000000},
+	{REG_EASRC_DPCS0R2(1),	0x00000000},
+	{REG_EASRC_DPCS0R2(2),	0x00000000},
+	{REG_EASRC_DPCS0R2(3),	0x00000000},
+	{REG_EASRC_DPCS0R3(0),	0x00000000},
+	{REG_EASRC_DPCS0R3(1),	0x00000000},
+	{REG_EASRC_DPCS0R3(2),	0x00000000},
+	{REG_EASRC_DPCS0R3(3),	0x00000000},
+	{REG_EASRC_DPCS1R0(0),	0x00000000},
+	{REG_EASRC_DPCS1R0(1),	0x00000000},
+	{REG_EASRC_DPCS1R0(2),	0x00000000},
+	{REG_EASRC_DPCS1R0(3),	0x00000000},
+	{REG_EASRC_DPCS1R1(0),	0x00000000},
+	{REG_EASRC_DPCS1R1(1),	0x00000000},
+	{REG_EASRC_DPCS1R1(2),	0x00000000},
+	{REG_EASRC_DPCS1R1(3),	0x00000000},
+	{REG_EASRC_DPCS1R2(0),	0x00000000},
+	{REG_EASRC_DPCS1R2(1),	0x00000000},
+	{REG_EASRC_DPCS1R2(2),	0x00000000},
+	{REG_EASRC_DPCS1R2(3),	0x00000000},
+	{REG_EASRC_DPCS1R3(0),	0x00000000},
+	{REG_EASRC_DPCS1R3(1),	0x00000000},
+	{REG_EASRC_DPCS1R3(2),	0x00000000},
+	{REG_EASRC_DPCS1R3(3),	0x00000000},
+	{REG_EASRC_COC(0),	0x00000000},
+	{REG_EASRC_COC(1),	0x00000000},
+	{REG_EASRC_COC(2),	0x00000000},
+	{REG_EASRC_COC(3),	0x00000000},
+	{REG_EASRC_COA(0),	0x00000000},
+	{REG_EASRC_COA(1),	0x00000000},
+	{REG_EASRC_COA(2),	0x00000000},
+	{REG_EASRC_COA(3),	0x00000000},
+	{REG_EASRC_SFS(0),	0x00000000},
+	{REG_EASRC_SFS(1),	0x00000000},
+	{REG_EASRC_SFS(2),	0x00000000},
+	{REG_EASRC_SFS(3),	0x00000000},
+	{REG_EASRC_RRL(0),	0x00000000},
+	{REG_EASRC_RRL(1),	0x00000000},
+	{REG_EASRC_RRL(2),	0x00000000},
+	{REG_EASRC_RRL(3),	0x00000000},
+	{REG_EASRC_RRH(0),	0x00000000},
+	{REG_EASRC_RRH(1),	0x00000000},
+	{REG_EASRC_RRH(2),	0x00000000},
+	{REG_EASRC_RRH(3),	0x00000000},
+	{REG_EASRC_RUC(0),	0x00000000},
+	{REG_EASRC_RUC(1),	0x00000000},
+	{REG_EASRC_RUC(2),	0x00000000},
+	{REG_EASRC_RUC(3),	0x00000000},
+	{REG_EASRC_RUR(0),	0x7FFFFFFF},
+	{REG_EASRC_RUR(1),	0x7FFFFFFF},
+	{REG_EASRC_RUR(2),	0x7FFFFFFF},
+	{REG_EASRC_RUR(3),	0x7FFFFFFF},
+	{REG_EASRC_RCTCL,	0x00000000},
+	{REG_EASRC_RCTCH,	0x00000000},
+	{REG_EASRC_PCF(0),	0x00000000},
+	{REG_EASRC_PCF(1),	0x00000000},
+	{REG_EASRC_PCF(2),	0x00000000},
+	{REG_EASRC_PCF(3),	0x00000000},
+	{REG_EASRC_CRCM,	0x00000000},
+	{REG_EASRC_CRCC,	0x00000000},
+	{REG_EASRC_IRQC,	0x00000FFF},
+	{REG_EASRC_IRQF,	0x00000000},
+	{REG_EASRC_CS0(0),	0x00000000},
+	{REG_EASRC_CS0(1),	0x00000000},
+	{REG_EASRC_CS0(2),	0x00000000},
+	{REG_EASRC_CS0(3),	0x00000000},
+	{REG_EASRC_CS1(0),	0x00000000},
+	{REG_EASRC_CS1(1),	0x00000000},
+	{REG_EASRC_CS1(2),	0x00000000},
+	{REG_EASRC_CS1(3),	0x00000000},
+	{REG_EASRC_CS2(0),	0x00000000},
+	{REG_EASRC_CS2(1),	0x00000000},
+	{REG_EASRC_CS2(2),	0x00000000},
+	{REG_EASRC_CS2(3),	0x00000000},
+	{REG_EASRC_CS3(0),	0x00000000},
+	{REG_EASRC_CS3(1),	0x00000000},
+	{REG_EASRC_CS3(2),	0x00000000},
+	{REG_EASRC_CS3(3),	0x00000000},
+	{REG_EASRC_CS4(0),	0x00000000},
+	{REG_EASRC_CS4(1),	0x00000000},
+	{REG_EASRC_CS4(2),	0x00000000},
+	{REG_EASRC_CS4(3),	0x00000000},
+	{REG_EASRC_CS5(0),	0x00000000},
+	{REG_EASRC_CS5(1),	0x00000000},
+	{REG_EASRC_CS5(2),	0x00000000},
+	{REG_EASRC_CS5(3),	0x00000000},
+	{REG_EASRC_DBGC,	0x00000000},
+	{REG_EASRC_DBGS,	0x00000000},
+};
+
+static bool fsl_easrc_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case REG_EASRC_RDFIFO(0):
+	case REG_EASRC_RDFIFO(1):
+	case REG_EASRC_RDFIFO(2):
+	case REG_EASRC_RDFIFO(3):
+	case REG_EASRC_CC(0):
+	case REG_EASRC_CC(1):
+	case REG_EASRC_CC(2):
+	case REG_EASRC_CC(3):
+	case REG_EASRC_CCE1(0):
+	case REG_EASRC_CCE1(1):
+	case REG_EASRC_CCE1(2):
+	case REG_EASRC_CCE1(3):
+	case REG_EASRC_CCE2(0):
+	case REG_EASRC_CCE2(1):
+	case REG_EASRC_CCE2(2):
+	case REG_EASRC_CCE2(3):
+	case REG_EASRC_CIA(0):
+	case REG_EASRC_CIA(1):
+	case REG_EASRC_CIA(2):
+	case REG_EASRC_CIA(3):
+	case REG_EASRC_DPCS0R0(0):
+	case REG_EASRC_DPCS0R0(1):
+	case REG_EASRC_DPCS0R0(2):
+	case REG_EASRC_DPCS0R0(3):
+	case REG_EASRC_DPCS0R1(0):
+	case REG_EASRC_DPCS0R1(1):
+	case REG_EASRC_DPCS0R1(2):
+	case REG_EASRC_DPCS0R1(3):
+	case REG_EASRC_DPCS0R2(0):
+	case REG_EASRC_DPCS0R2(1):
+	case REG_EASRC_DPCS0R2(2):
+	case REG_EASRC_DPCS0R2(3):
+	case REG_EASRC_DPCS0R3(0):
+	case REG_EASRC_DPCS0R3(1):
+	case REG_EASRC_DPCS0R3(2):
+	case REG_EASRC_DPCS0R3(3):
+	case REG_EASRC_DPCS1R0(0):
+	case REG_EASRC_DPCS1R0(1):
+	case REG_EASRC_DPCS1R0(2):
+	case REG_EASRC_DPCS1R0(3):
+	case REG_EASRC_DPCS1R1(0):
+	case REG_EASRC_DPCS1R1(1):
+	case REG_EASRC_DPCS1R1(2):
+	case REG_EASRC_DPCS1R1(3):
+	case REG_EASRC_DPCS1R2(0):
+	case REG_EASRC_DPCS1R2(1):
+	case REG_EASRC_DPCS1R2(2):
+	case REG_EASRC_DPCS1R2(3):
+	case REG_EASRC_DPCS1R3(0):
+	case REG_EASRC_DPCS1R3(1):
+	case REG_EASRC_DPCS1R3(2):
+	case REG_EASRC_DPCS1R3(3):
+	case REG_EASRC_COC(0):
+	case REG_EASRC_COC(1):
+	case REG_EASRC_COC(2):
+	case REG_EASRC_COC(3):
+	case REG_EASRC_COA(0):
+	case REG_EASRC_COA(1):
+	case REG_EASRC_COA(2):
+	case REG_EASRC_COA(3):
+	case REG_EASRC_SFS(0):
+	case REG_EASRC_SFS(1):
+	case REG_EASRC_SFS(2):
+	case REG_EASRC_SFS(3):
+	case REG_EASRC_RRL(0):
+	case REG_EASRC_RRL(1):
+	case REG_EASRC_RRL(2):
+	case REG_EASRC_RRL(3):
+	case REG_EASRC_RRH(0):
+	case REG_EASRC_RRH(1):
+	case REG_EASRC_RRH(2):
+	case REG_EASRC_RRH(3):
+	case REG_EASRC_RUC(0):
+	case REG_EASRC_RUC(1):
+	case REG_EASRC_RUC(2):
+	case REG_EASRC_RUC(3):
+	case REG_EASRC_RUR(0):
+	case REG_EASRC_RUR(1):
+	case REG_EASRC_RUR(2):
+	case REG_EASRC_RUR(3): /* fallthrough */
+	case REG_EASRC_RCTCL:
+	case REG_EASRC_RCTCH:
+	case REG_EASRC_PCF(0):
+	case REG_EASRC_PCF(1):
+	case REG_EASRC_PCF(2):
+	case REG_EASRC_PCF(3): /* fallthrough */
+	case REG_EASRC_CRCC:
+	case REG_EASRC_IRQC:
+	case REG_EASRC_IRQF:
+	case REG_EASRC_CS0(0):
+	case REG_EASRC_CS0(1):
+	case REG_EASRC_CS0(2):
+	case REG_EASRC_CS0(3):
+	case REG_EASRC_CS1(0):
+	case REG_EASRC_CS1(1):
+	case REG_EASRC_CS1(2):
+	case REG_EASRC_CS1(3):
+	case REG_EASRC_CS2(0):
+	case REG_EASRC_CS2(1):
+	case REG_EASRC_CS2(2):
+	case REG_EASRC_CS2(3):
+	case REG_EASRC_CS3(0):
+	case REG_EASRC_CS3(1):
+	case REG_EASRC_CS3(2):
+	case REG_EASRC_CS3(3):
+	case REG_EASRC_CS4(0):
+	case REG_EASRC_CS4(1):
+	case REG_EASRC_CS4(2):
+	case REG_EASRC_CS4(3):
+	case REG_EASRC_CS5(0):
+	case REG_EASRC_CS5(1):
+	case REG_EASRC_CS5(2):
+	case REG_EASRC_CS5(3): /* fallthrough */
+	case REG_EASRC_DBGC:
+	case REG_EASRC_DBGS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool fsl_easrc_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case REG_EASRC_WRFIFO(0):
+	case REG_EASRC_WRFIFO(1):
+	case REG_EASRC_WRFIFO(2):
+	case REG_EASRC_WRFIFO(3):
+	case REG_EASRC_CC(0):
+	case REG_EASRC_CC(1):
+	case REG_EASRC_CC(2):
+	case REG_EASRC_CC(3):
+	case REG_EASRC_CCE1(0):
+	case REG_EASRC_CCE1(1):
+	case REG_EASRC_CCE1(2):
+	case REG_EASRC_CCE1(3):
+	case REG_EASRC_CCE2(0):
+	case REG_EASRC_CCE2(1):
+	case REG_EASRC_CCE2(2):
+	case REG_EASRC_CCE2(3):
+	case REG_EASRC_CIA(0):
+	case REG_EASRC_CIA(1):
+	case REG_EASRC_CIA(2):
+	case REG_EASRC_CIA(3):
+	case REG_EASRC_DPCS0R0(0):
+	case REG_EASRC_DPCS0R0(1):
+	case REG_EASRC_DPCS0R0(2):
+	case REG_EASRC_DPCS0R0(3):
+	case REG_EASRC_DPCS0R1(0):
+	case REG_EASRC_DPCS0R1(1):
+	case REG_EASRC_DPCS0R1(2):
+	case REG_EASRC_DPCS0R1(3):
+	case REG_EASRC_DPCS0R2(0):
+	case REG_EASRC_DPCS0R2(1):
+	case REG_EASRC_DPCS0R2(2):
+	case REG_EASRC_DPCS0R2(3):
+	case REG_EASRC_DPCS0R3(0):
+	case REG_EASRC_DPCS0R3(1):
+	case REG_EASRC_DPCS0R3(2):
+	case REG_EASRC_DPCS0R3(3):
+	case REG_EASRC_DPCS1R0(0):
+	case REG_EASRC_DPCS1R0(1):
+	case REG_EASRC_DPCS1R0(2):
+	case REG_EASRC_DPCS1R0(3):
+	case REG_EASRC_DPCS1R1(0):
+	case REG_EASRC_DPCS1R1(1):
+	case REG_EASRC_DPCS1R1(2):
+	case REG_EASRC_DPCS1R1(3):
+	case REG_EASRC_DPCS1R2(0):
+	case REG_EASRC_DPCS1R2(1):
+	case REG_EASRC_DPCS1R2(2):
+	case REG_EASRC_DPCS1R2(3):
+	case REG_EASRC_DPCS1R3(0):
+	case REG_EASRC_DPCS1R3(1):
+	case REG_EASRC_DPCS1R3(2):
+	case REG_EASRC_DPCS1R3(3):
+	case REG_EASRC_COC(0):
+	case REG_EASRC_COC(1):
+	case REG_EASRC_COC(2):
+	case REG_EASRC_COC(3):
+	case REG_EASRC_COA(0):
+	case REG_EASRC_COA(1):
+	case REG_EASRC_COA(2):
+	case REG_EASRC_COA(3):
+	case REG_EASRC_RRL(0):
+	case REG_EASRC_RRL(1):
+	case REG_EASRC_RRL(2):
+	case REG_EASRC_RRL(3):
+	case REG_EASRC_RRH(0):
+	case REG_EASRC_RRH(1):
+	case REG_EASRC_RRH(2):
+	case REG_EASRC_RRH(3):
+	case REG_EASRC_RUC(0):
+	case REG_EASRC_RUC(1):
+	case REG_EASRC_RUC(2):
+	case REG_EASRC_RUC(3):
+	case REG_EASRC_RUR(0):
+	case REG_EASRC_RUR(1):
+	case REG_EASRC_RUR(2):
+	case REG_EASRC_RUR(3):  /* fallthrough */
+	case REG_EASRC_RCTCL:
+	case REG_EASRC_RCTCH:
+	case REG_EASRC_PCF(0):
+	case REG_EASRC_PCF(1):
+	case REG_EASRC_PCF(2):
+	case REG_EASRC_PCF(3):  /* fallthrough */
+	case REG_EASRC_CRCM:
+	case REG_EASRC_CRCC:
+	case REG_EASRC_IRQC:
+	case REG_EASRC_IRQF:
+	case REG_EASRC_CS0(0):
+	case REG_EASRC_CS0(1):
+	case REG_EASRC_CS0(2):
+	case REG_EASRC_CS0(3):
+	case REG_EASRC_CS1(0):
+	case REG_EASRC_CS1(1):
+	case REG_EASRC_CS1(2):
+	case REG_EASRC_CS1(3):
+	case REG_EASRC_CS2(0):
+	case REG_EASRC_CS2(1):
+	case REG_EASRC_CS2(2):
+	case REG_EASRC_CS2(3):
+	case REG_EASRC_CS3(0):
+	case REG_EASRC_CS3(1):
+	case REG_EASRC_CS3(2):
+	case REG_EASRC_CS3(3):
+	case REG_EASRC_CS4(0):
+	case REG_EASRC_CS4(1):
+	case REG_EASRC_CS4(2):
+	case REG_EASRC_CS4(3):
+	case REG_EASRC_CS5(0):
+	case REG_EASRC_CS5(1):
+	case REG_EASRC_CS5(2):
+	case REG_EASRC_CS5(3): /* fallthrough */
+	case REG_EASRC_DBGC:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool fsl_easrc_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case REG_EASRC_RDFIFO(0):
+	case REG_EASRC_RDFIFO(1):
+	case REG_EASRC_RDFIFO(2):
+	case REG_EASRC_RDFIFO(3):
+	case REG_EASRC_SFS(0):
+	case REG_EASRC_SFS(1):
+	case REG_EASRC_SFS(2):
+	case REG_EASRC_SFS(3): /* fallthrough */
+	case REG_EASRC_IRQF:
+	case REG_EASRC_DBGS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config fsl_easrc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+
+	.max_register = REG_EASRC_DBGS,
+	.reg_defaults = fsl_easrc_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(fsl_easrc_reg_defaults),
+	.readable_reg = fsl_easrc_readable_reg,
+	.volatile_reg = fsl_easrc_volatile_reg,
+	.writeable_reg = fsl_easrc_writeable_reg,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+void easrc_dump_firmware(struct fsl_easrc *easrc)
+{
+	struct device *dev = &easrc->pdev->dev;
+	struct asrc_firmware_hdr *firm = easrc->firmware_hdr;
+	struct interp_params *interp = easrc->interp;
+	struct prefil_params *prefil = easrc->prefil;
+	int i;
+
+	if (firm->magic != FIRMWARE_MAGIC) {
+		dev_err(dev, "Wrong magic. Something went wrong!");
+		return;
+	}
+
+	dev_dbg(dev, "Firmware v%u dump:\n", firm->firmware_version);
+	pr_debug("Num prefitler scenarios: %u\n", firm->prefil_scen);
+	pr_debug("Num interpolation scenarios: %u\n", firm->interp_scen);
+	pr_debug("\nInterpolation scenarios:\n");
+
+	for (i = 0; i < firm->interp_scen; i++) {
+		if (interp[i].magic != FIRMWARE_MAGIC) {
+			pr_debug("%d. wrong interp magic: %x\n",
+				 i, interp[i].magic);
+			continue;
+		}
+		pr_debug("%d. taps: %u, phases: %u, center: %llu\n", i,
+			 interp[i].num_taps, interp[i].num_phases,
+			 interp[i].center_tap);
+	}
+
+	for (i = 0; i < firm->prefil_scen; i++) {
+		if (prefil[i].magic != FIRMWARE_MAGIC) {
+			pr_debug("%d. wrong prefil magic: %x\n",
+				 i, prefil[i].magic);
+			continue;
+		}
+		pr_debug("%d. insr: %u, outsr: %u, st1: %u, st2: %u\n", i,
+			 prefil[i].insr, prefil[i].outsr,
+			 prefil[i].st1_taps, prefil[i].st2_taps);
+	}
+
+	dev_dbg(dev, "end of firmware dump\n");
+}
+
+int easrc_get_firmware(struct fsl_easrc *easrc)
+{
+	u32 pnum, inum, offset;
+	int ret;
+
+	if (!easrc)
+		return -EINVAL;
+
+	ret = request_firmware(&easrc->fw, easrc->fw_name,
+			       &easrc->pdev->dev);
+	if (ret)
+		return ret;
+
+	easrc->firmware_hdr = (struct asrc_firmware_hdr *)easrc->fw->data;
+	pnum = easrc->firmware_hdr->prefil_scen;
+	inum = easrc->firmware_hdr->interp_scen;
+
+	if (inum) {
+		offset = sizeof(struct asrc_firmware_hdr);
+		easrc->interp =
+			(struct interp_params *)(easrc->fw->data + offset);
+	}
+
+	if (pnum) {
+		offset = sizeof(struct asrc_firmware_hdr) +
+				inum * sizeof(struct interp_params);
+		easrc->prefil =
+			(struct prefil_params *)(easrc->fw->data + offset);
+	}
+
+	return 0;
+}
+
+static irqreturn_t fsl_easrc_isr(int irq, void *dev_id)
+{
+	struct fsl_easrc *easrc = (struct fsl_easrc *)dev_id;
+	struct device *dev = &easrc->pdev->dev;
+	int val;
+
+	regmap_read(easrc->regmap, REG_EASRC_IRQF, &val);
+
+	if (val & EASRC_IRQF_OER_MASK)
+		dev_dbg(dev, "output FIFO underflow\n");
+
+	if (val & EASRC_IRQF_IFO_MASK)
+		dev_dbg(dev, "input FIFO overflow\n");
+
+	return IRQ_HANDLED;
+}
+
+static const struct of_device_id fsl_easrc_dt_ids[] = {
+	{ .compatible = "fsl,imx8mn-easrc",},
+	{}
+};
+MODULE_DEVICE_TABLE(of, fsl_easrc_dt_ids);
+
+static int fsl_easrc_probe(struct platform_device *pdev)
+{
+	struct fsl_easrc *easrc;
+	struct resource *res;
+	struct device_node *np;
+	void __iomem *regs;
+	int ret, irq;
+	u32 width;
+
+	easrc = devm_kzalloc(&pdev->dev, sizeof(*easrc), GFP_KERNEL);
+	if (!easrc)
+		return -ENOMEM;
+
+	easrc->pdev = pdev;
+	np = pdev->dev.of_node;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(regs)) {
+		dev_err(&pdev->dev, "failed ioremap\n");
+		return PTR_ERR(regs);
+	}
+
+	easrc->paddr = res->start;
+
+	easrc->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "mem", regs,
+						  &fsl_easrc_regmap_config);
+	if (IS_ERR(easrc->regmap)) {
+		dev_err(&pdev->dev, "failed to init regmap");
+		return PTR_ERR(easrc->regmap);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "no irq for node %s\n",
+			dev_name(&pdev->dev));
+		return irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, irq, fsl_easrc_isr, 0,
+			       dev_name(&pdev->dev), easrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to claim irq %u: %d\n", irq, ret);
+		return ret;
+	}
+
+	easrc->mem_clk = devm_clk_get(&pdev->dev, "mem");
+	if (IS_ERR(easrc->mem_clk)) {
+		dev_err(&pdev->dev, "failed to get mem clock\n");
+		return PTR_ERR(easrc->mem_clk);
+	}
+
+	/*Set default value*/
+	easrc->chn_avail = 32;
+	easrc->rs_num_taps = EASRC_RS_128_TAPS;
+	easrc->const_coeff = 0x3FF0000000000000;
+
+	ret = of_property_read_u32(np, "fsl,asrc-rate",
+				   &easrc->easrc_rate);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to asrc rate\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(np, "fsl,asrc-width",
+				   &width);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to asrc width\n");
+		return ret;
+	}
+
+	if (width != 16 && width != 24 && width != 32 && width != 20) {
+		dev_warn(&pdev->dev, "unsupported width, switching to 24bit\n");
+		width = 24;
+	}
+
+	if (width == 24)
+		easrc->easrc_format = SNDRV_PCM_FORMAT_S24_LE;
+	else if (width == 16)
+		easrc->easrc_format = SNDRV_PCM_FORMAT_S16_LE;
+	else
+		easrc->easrc_format = SNDRV_PCM_FORMAT_S32_LE;
+
+	platform_set_drvdata(pdev, easrc);
+	pm_runtime_enable(&pdev->dev);
+
+	spin_lock_init(&easrc->lock);
+
+	regcache_cache_only(easrc->regmap, true);
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_easrc_component,
+					      &fsl_easrc_dai, 1);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
+		return ret;
+	}
+
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &fsl_easrc_dma_component,
+					      NULL, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register ASoC platform\n");
+		return ret;
+	}
+
+	ret = of_property_read_string(np,
+				      "fsl,easrc-ram-script-name",
+				      &easrc->fw_name);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get firmware name\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int fsl_easrc_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int fsl_easrc_runtime_suspend(struct device *dev)
+{
+	struct fsl_easrc *easrc = dev_get_drvdata(dev);
+	unsigned long lock_flags;
+
+	regcache_cache_only(easrc->regmap, true);
+
+	clk_disable_unprepare(easrc->mem_clk);
+
+	spin_lock_irqsave(&easrc->lock, lock_flags);
+	easrc->firmware_loaded = 0;
+	spin_unlock_irqrestore(&easrc->lock, lock_flags);
+
+	return 0;
+}
+
+static int fsl_easrc_runtime_resume(struct device *dev)
+{
+	struct fsl_easrc *easrc = dev_get_drvdata(dev);
+	struct fsl_easrc_context *ctx;
+	unsigned long lock_flags;
+	int ret;
+	int i;
+
+	ret = clk_prepare_enable(easrc->mem_clk);
+	if (ret)
+		return ret;
+
+	regcache_cache_only(easrc->regmap, false);
+	regcache_mark_dirty(easrc->regmap);
+	regcache_sync(easrc->regmap);
+
+	spin_lock_irqsave(&easrc->lock, lock_flags);
+	if (easrc->firmware_loaded) {
+		spin_unlock_irqrestore(&easrc->lock, lock_flags);
+		goto skip_load;
+	}
+	easrc->firmware_loaded = 1;
+	spin_unlock_irqrestore(&easrc->lock, lock_flags);
+
+	ret = easrc_get_firmware(easrc);
+	if (ret) {
+		dev_err(dev, "failed to get firmware\n");
+		goto disable_mem_clk;
+	}
+
+	/* Write Resampling Coefficients
+	 * The coefficient RAM must be configured prior to beginning of
+	 * any context processing within the ASRC
+	 */
+	ret = fsl_easrc_resampler_config(easrc);
+	if (ret) {
+		dev_err(dev, "resampler config failed\n");
+		goto disable_mem_clk;
+	}
+
+	for (i = ASRC_PAIR_A; i < EASRC_CTX_MAX_NUM; i++) {
+		ctx = easrc->ctx[i];
+		if (ctx) {
+			set_rs_ratio(ctx);
+			ctx->out_missed_sample = ctx->in_filled_sample *
+						ctx->out_params.sample_rate /
+						ctx->in_params.sample_rate;
+			if (ctx->in_filled_sample * ctx->out_params.sample_rate
+					% ctx->in_params.sample_rate != 0)
+				ctx->out_missed_sample += 1;
+
+			ret = write_pf_coeff_mem(easrc, i,
+						 ctx->st1_coeff,
+						 ctx->st1_num_taps,
+						 ctx->st1_addexp);
+			if (ret)
+				goto disable_mem_clk;
+
+			ret = write_pf_coeff_mem(easrc, i,
+						 ctx->st2_coeff,
+						 ctx->st2_num_taps,
+						 ctx->st2_addexp);
+			if (ret)
+				goto disable_mem_clk;
+		}
+	}
+
+skip_load:
+	return 0;
+
+disable_mem_clk:
+	clk_disable_unprepare(easrc->mem_clk);
+	return ret;
+}
+#endif /*CONFIG_PM*/
+
+static const struct dev_pm_ops fsl_easrc_pm_ops = {
+	SET_RUNTIME_PM_OPS(fsl_easrc_runtime_suspend,
+			   fsl_easrc_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct platform_driver fsl_easrc_driver = {
+	.probe = fsl_easrc_probe,
+	.remove = fsl_easrc_remove,
+	.driver = {
+		.name = "fsl-easrc",
+		.pm = &fsl_easrc_pm_ops,
+		.of_match_table = fsl_easrc_dt_ids,
+	},
+};
+module_platform_driver(fsl_easrc_driver);
+
+MODULE_DESCRIPTION("NXP Enhanced Asynchronous Sample Rate (eASRC) driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
new file mode 100644
index 000000000000..205f6ef3e1e3
--- /dev/null
+++ b/sound/soc/fsl/fsl_easrc.h
@@ -0,0 +1,668 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 NXP
+ */
+
+#ifndef _FSL_EASRC_H
+#define _FSL_EASRC_H
+
+#include <sound/asound.h>
+#include <linux/miscdevice.h>
+#include <linux/platform_data/dma-imx.h>
+
+#include "fsl_asrc_common.h"
+
+/* EASRC Register Map */
+
+/* ASRC Input Write FIFO */
+#define REG_EASRC_WRFIFO(ctx)		(0x000 + 4 * (ctx))
+/* ASRC Output Read FIFO */
+#define REG_EASRC_RDFIFO(ctx)		(0x010 + 4 * (ctx))
+/* ASRC Context Control */
+#define REG_EASRC_CC(ctx)		(0x020 + 4 * (ctx))
+/* ASRC Context Control Extended 1 */
+#define REG_EASRC_CCE1(ctx)		(0x030 + 4 * (ctx))
+/* ASRC Context Control Extended 2 */
+#define REG_EASRC_CCE2(ctx)		(0x040 + 4 * (ctx))
+/* ASRC Control Input Access */
+#define REG_EASRC_CIA(ctx)		(0x050 + 4 * (ctx))
+/* ASRC Datapath Processor Control Slot0 */
+#define REG_EASRC_DPCS0R0(ctx)		(0x060 + 4 * (ctx))
+#define REG_EASRC_DPCS0R1(ctx)		(0x070 + 4 * (ctx))
+#define REG_EASRC_DPCS0R2(ctx)		(0x080 + 4 * (ctx))
+#define REG_EASRC_DPCS0R3(ctx)		(0x090 + 4 * (ctx))
+/* ASRC Datapath Processor Control Slot1 */
+#define REG_EASRC_DPCS1R0(ctx)		(0x0A0 + 4 * (ctx))
+#define REG_EASRC_DPCS1R1(ctx)		(0x0B0 + 4 * (ctx))
+#define REG_EASRC_DPCS1R2(ctx)		(0x0C0 + 4 * (ctx))
+#define REG_EASRC_DPCS1R3(ctx)		(0x0D0 + 4 * (ctx))
+/* ASRC Context Output Control */
+#define REG_EASRC_COC(ctx)		(0x0E0 + 4 * (ctx))
+/* ASRC Control Output Access */
+#define REG_EASRC_COA(ctx)		(0x0F0 + 4 * (ctx))
+/* ASRC Sample FIFO Status */
+#define REG_EASRC_SFS(ctx)		(0x100 + 4 * (ctx))
+/* ASRC Resampling Ratio Low */
+#define REG_EASRC_RRL(ctx)		(0x110 + 8 * (ctx))
+/* ASRC Resampling Ratio High */
+#define REG_EASRC_RRH(ctx)		(0x114 + 8 * (ctx))
+/* ASRC Resampling Ratio Update Control */
+#define REG_EASRC_RUC(ctx)		(0x130 + 4 * (ctx))
+/* ASRC Resampling Ratio Update Rate */
+#define REG_EASRC_RUR(ctx)		(0x140 + 4 * (ctx))
+/* ASRC Resampling Center Tap Coefficient Low */
+#define REG_EASRC_RCTCL			(0x150)
+/* ASRC Resampling Center Tap Coefficient High */
+#define REG_EASRC_RCTCH			(0x154)
+/* ASRC Prefilter Coefficient FIFO */
+#define REG_EASRC_PCF(ctx)		(0x160 + 4 * (ctx))
+/* ASRC Context Resampling Coefficient Memory */
+#define REG_EASRC_CRCM			0x170
+/* ASRC Context Resampling Coefficient Control*/
+#define REG_EASRC_CRCC			0x174
+/* ASRC Interrupt Control */
+#define REG_EASRC_IRQC			0x178
+/* ASRC Interrupt Status Flags */
+#define REG_EASRC_IRQF			0x17C
+/* ASRC Channel Status 0 */
+#define REG_EASRC_CS0(ctx)		(0x180 + 4 * (ctx))
+/* ASRC Channel Status 1 */
+#define REG_EASRC_CS1(ctx)		(0x190 + 4 * (ctx))
+/* ASRC Channel Status 2 */
+#define REG_EASRC_CS2(ctx)		(0x1A0 + 4 * (ctx))
+/* ASRC Channel Status 3 */
+#define REG_EASRC_CS3(ctx)		(0x1B0 + 4 * (ctx))
+/* ASRC Channel Status 4 */
+#define REG_EASRC_CS4(ctx)		(0x1C0 + 4 * (ctx))
+/* ASRC Channel Status 5 */
+#define REG_EASRC_CS5(ctx)		(0x1D0 + 4 * (ctx))
+/* ASRC Debug Control Register */
+#define REG_EASRC_DBGC			0x1E0
+/* ASRC Debug Status Register */
+#define REG_EASRC_DBGS			0x1E4
+
+#define REG_EASRC_FIFO(x, ctx)		(x == IN ? REG_EASRC_WRFIFO(ctx) \
+						: REG_EASRC_RDFIFO(ctx))
+
+/* ASRC Context Control (CC) */
+#define EASRC_CC_EN_SHIFT		31
+#define EASRC_CC_EN_MASK		BIT(EASRC_CC_EN_SHIFT)
+#define EASRC_CC_EN			BIT(EASRC_CC_EN_SHIFT)
+#define EASRC_CC_STOP_SHIFT		29
+#define EASRC_CC_STOP_MASK		BIT(EASRC_CC_STOP_SHIFT)
+#define EASRC_CC_STOP			BIT(EASRC_CC_STOP_SHIFT)
+#define EASRC_CC_FWMDE_SHIFT		28
+#define EASRC_CC_FWMDE_MASK		BIT(EASRC_CC_FWMDE_SHIFT)
+#define EASRC_CC_FWMDE			BIT(EASRC_CC_FWMDE_SHIFT)
+#define EASRC_CC_FIFO_WTMK_SHIFT	16
+#define EASRC_CC_FIFO_WTMK_WIDTH	7
+#define EASRC_CC_FIFO_WTMK_MASK		((BIT(EASRC_CC_FIFO_WTMK_WIDTH) - 1) \
+					 << EASRC_CC_FIFO_WTMK_SHIFT)
+#define EASRC_CC_FIFO_WTMK(v)		(((v) << EASRC_CC_FIFO_WTMK_SHIFT) \
+					 & EASRC_CC_FIFO_WTMK_MASK)
+#define EASRC_CC_SAMPLE_POS_SHIFT	11
+#define EASRC_CC_SAMPLE_POS_WIDTH	5
+#define EASRC_CC_SAMPLE_POS_MASK	((BIT(EASRC_CC_SAMPLE_POS_WIDTH) - 1) \
+					 << EASRC_CC_SAMPLE_POS_SHIFT)
+#define EASRC_CC_SAMPLE_POS(v)		(((v) << EASRC_CC_SAMPLE_POS_SHIFT) \
+					 & EASRC_CC_SAMPLE_POS_MASK)
+#define EASRC_CC_ENDIANNESS_SHIFT	10
+#define EASRC_CC_ENDIANNESS_MASK	BIT(EASRC_CC_ENDIANNESS_SHIFT)
+#define EASRC_CC_ENDIANNESS		BIT(EASRC_CC_ENDIANNESS_SHIFT)
+#define EASRC_CC_BPS_SHIFT		8
+#define EASRC_CC_BPS_WIDTH		2
+#define EASRC_CC_BPS_MASK		((BIT(EASRC_CC_BPS_WIDTH) - 1) \
+					 << EASRC_CC_BPS_SHIFT)
+#define EASRC_CC_BPS(v)			(((v) << EASRC_CC_BPS_SHIFT) \
+					 & EASRC_CC_BPS_MASK)
+#define EASRC_CC_FMT_SHIFT		7
+#define EASRC_CC_FMT_MASK		BIT(EASRC_CC_FMT_SHIFT)
+#define EASRC_CC_FMT			BIT(EASRC_CC_FMT_SHIFT)
+#define EASRC_CC_INSIGN_SHIFT		6
+#define EASRC_CC_INSIGN_MASK		BIT(EASRC_CC_INSIGN_SHIFT)
+#define EASRC_CC_INSIGN			BIT(EASRC_CC_INSIGN_SHIFT)
+#define EASRC_CC_CHEN_SHIFT		0
+#define EASRC_CC_CHEN_WIDTH		5
+#define EASRC_CC_CHEN_MASK		((BIT(EASRC_CC_CHEN_WIDTH) - 1) \
+					 << EASRC_CC_CHEN_SHIFT)
+#define EASRC_CC_CHEN(v)		(((v) << EASRC_CC_CHEN_SHIFT) \
+					 & EASRC_CC_CHEN_MASK)
+
+/* ASRC Context Control Extended 1 (CCE1) */
+#define EASRC_CCE1_COEF_WS_SHIFT	25
+#define EASRC_CCE1_COEF_WS_MASK		BIT(EASRC_CCE1_COEF_WS_SHIFT)
+#define EASRC_CCE1_COEF_WS		BIT(EASRC_CCE1_COEF_WS_SHIFT)
+#define EASRC_CCE1_COEF_MEM_RST_SHIFT	24
+#define EASRC_CCE1_COEF_MEM_RST_MASK	BIT(EASRC_CCE1_COEF_MEM_RST_SHIFT)
+#define EASRC_CCE1_COEF_MEM_RST		BIT(EASRC_CCE1_COEF_MEM_RST_SHIFT)
+#define EASRC_CCE1_PF_EXP_SHIFT		16
+#define EASRC_CCE1_PF_EXP_WIDTH		8
+#define EASRC_CCE1_PF_EXP_MASK		((BIT(EASRC_CCE1_PF_EXP_WIDTH) - 1) \
+					 << EASRC_CCE1_PF_EXP_SHIFT)
+#define EASRC_CCE1_PF_EXP(v)		(((v) << EASRC_CCE1_PF_EXP_SHIFT) \
+					 & EASRC_CCE1_PF_EXP_MASK)
+#define EASRC_CCE1_PF_ST1_WBFP_SHIFT	9
+#define EASRC_CCE1_PF_ST1_WBFP_MASK	BIT(EASRC_CCE1_PF_ST1_WBFP_SHIFT)
+#define EASRC_CCE1_PF_ST1_WBFP		BIT(EASRC_CCE1_PF_ST1_WBFP_SHIFT)
+#define EASRC_CCE1_PF_TSEN_SHIFT	8
+#define EASRC_CCE1_PF_TSEN_MASK		BIT(EASRC_CCE1_PF_TSEN_SHIFT)
+#define EASRC_CCE1_PF_TSEN		BIT(EASRC_CCE1_PF_TSEN_SHIFT)
+#define EASRC_CCE1_RS_BYPASS_SHIFT	7
+#define EASRC_CCE1_RS_BYPASS_MASK	BIT(EASRC_CCE1_RS_BYPASS_SHIFT)
+#define EASRC_CCE1_RS_BYPASS		BIT(EASRC_CCE1_RS_BYPASS_SHIFT)
+#define EASRC_CCE1_PF_BYPASS_SHIFT	6
+#define EASRC_CCE1_PF_BYPASS_MASK	BIT(EASRC_CCE1_PF_BYPASS_SHIFT)
+#define EASRC_CCE1_PF_BYPASS		BIT(EASRC_CCE1_PF_BYPASS_SHIFT)
+#define EASRC_CCE1_RS_STOP_SHIFT	5
+#define EASRC_CCE1_RS_STOP_MASK		BIT(EASRC_CCE1_RS_STOP_SHIFT)
+#define EASRC_CCE1_RS_STOP		BIT(EASRC_CCE1_RS_STOP_SHIFT)
+#define EASRC_CCE1_PF_STOP_SHIFT	4
+#define EASRC_CCE1_PF_STOP_MASK		BIT(EASRC_CCE1_PF_STOP_SHIFT)
+#define EASRC_CCE1_PF_STOP		BIT(EASRC_CCE1_PF_STOP_SHIFT)
+#define EASRC_CCE1_RS_INIT_SHIFT	2
+#define EASRC_CCE1_RS_INIT_WIDTH	2
+#define EASRC_CCE1_RS_INIT_MASK		((BIT(EASRC_CCE1_RS_INIT_WIDTH) - 1) \
+					 << EASRC_CCE1_RS_INIT_SHIFT)
+#define EASRC_CCE1_RS_INIT(v)		(((v) << EASRC_CCE1_RS_INIT_SHIFT) \
+					 & EASRC_CCE1_RS_INIT_MASK)
+#define EASRC_CCE1_PF_INIT_SHIFT	0
+#define EASRC_CCE1_PF_INIT_WIDTH	2
+#define EASRC_CCE1_PF_INIT_MASK		((BIT(EASRC_CCE1_PF_INIT_WIDTH) - 1) \
+					 << EASRC_CCE1_PF_INIT_SHIFT)
+#define EASRC_CCE1_PF_INIT(v)		(((v) << EASRC_CCE1_PF_INIT_SHIFT) \
+					 & EASRC_CCE1_PF_INIT_MASK)
+
+/* ASRC Context Control Extended 2 (CCE2) */
+#define EASRC_CCE2_ST2_TAPS_SHIFT	16
+#define EASRC_CCE2_ST2_TAPS_WIDTH	9
+#define EASRC_CCE2_ST2_TAPS_MASK	((BIT(EASRC_CCE2_ST2_TAPS_WIDTH) - 1) \
+					 << EASRC_CCE2_ST2_TAPS_SHIFT)
+#define EASRC_CCE2_ST2_TAPS(v)		(((v) << EASRC_CCE2_ST2_TAPS_SHIFT) \
+					 & EASRC_CCE2_ST2_TAPS_MASK)
+#define EASRC_CCE2_ST1_TAPS_SHIFT	0
+#define EASRC_CCE2_ST1_TAPS_WIDTH	9
+#define EASRC_CCE2_ST1_TAPS_MASK	((BIT(EASRC_CCE2_ST1_TAPS_WIDTH) - 1) \
+					 << EASRC_CCE2_ST1_TAPS_SHIFT)
+#define EASRC_CCE2_ST1_TAPS(v)		(((v) << EASRC_CCE2_ST1_TAPS_SHIFT) \
+					 & EASRC_CCE2_ST1_TAPS_MASK)
+
+/* ASRC Control Input Access (CIA) */
+#define EASRC_CIA_ITER_SHIFT		16
+#define EASRC_CIA_ITER_WIDTH		6
+#define EASRC_CIA_ITER_MASK		((BIT(EASRC_CIA_ITER_WIDTH) - 1) \
+					 << EASRC_CIA_ITER_SHIFT)
+#define EASRC_CIA_ITER(v)		(((v) << EASRC_CIA_ITER_SHIFT) \
+					 & EASRC_CIA_ITER_MASK)
+#define EASRC_CIA_GRLEN_SHIFT		8
+#define EASRC_CIA_GRLEN_WIDTH		6
+#define EASRC_CIA_GRLEN_MASK		((BIT(EASRC_CIA_GRLEN_WIDTH) - 1) \
+					 << EASRC_CIA_GRLEN_SHIFT)
+#define EASRC_CIA_GRLEN(v)		(((v) << EASRC_CIA_GRLEN_SHIFT) \
+					 & EASRC_CIA_GRLEN_MASK)
+#define EASRC_CIA_ACCLEN_SHIFT		0
+#define EASRC_CIA_ACCLEN_WIDTH		6
+#define EASRC_CIA_ACCLEN_MASK		((BIT(EASRC_CIA_ACCLEN_WIDTH) - 1) \
+					 << EASRC_CIA_ACCLEN_SHIFT)
+#define EASRC_CIA_ACCLEN(v)		(((v) << EASRC_CIA_ACCLEN_SHIFT) \
+					 & EASRC_CIA_ACCLEN_MASK)
+
+/* ASRC Datapath Processor Control Slot0 Register0 (DPCS0R0) */
+#define EASRC_DPCS0R0_MAXCH_SHIFT	24
+#define EASRC_DPCS0R0_MAXCH_WIDTH	5
+#define EASRC_DPCS0R0_MAXCH_MASK	((BIT(EASRC_DPCS0R0_MAXCH_WIDTH) - 1) \
+					 << EASRC_DPCS0R0_MAXCH_SHIFT)
+#define EASRC_DPCS0R0_MAXCH(v)		(((v) << EASRC_DPCS0R0_MAXCH_SHIFT) \
+					 & EASRC_DPCS0R0_MAXCH_MASK)
+#define EASRC_DPCS0R0_MINCH_SHIFT	16
+#define EASRC_DPCS0R0_MINCH_WIDTH	5
+#define EASRC_DPCS0R0_MINCH_MASK	((BIT(EASRC_DPCS0R0_MINCH_WIDTH) - 1) \
+					 << EASRC_DPCS0R0_MINCH_SHIFT)
+#define EASRC_DPCS0R0_MINCH(v)		(((v) << EASRC_DPCS0R0_MINCH_SHIFT) \
+					 & EASRC_DPCS0R0_MINCH_MASK)
+#define EASRC_DPCS0R0_NUMCH_SHIFT	8
+#define EASRC_DPCS0R0_NUMCH_WIDTH	5
+#define EASRC_DPCS0R0_NUMCH_MASK	((BIT(EASRC_DPCS0R0_NUMCH_WIDTH) - 1) \
+					 << EASRC_DPCS0R0_NUMCH_SHIFT)
+#define EASRC_DPCS0R0_NUMCH(v)		(((v) << EASRC_DPCS0R0_NUMCH_SHIFT) \
+					 & EASRC_DPCS0R0_NUMCH_MASK)
+#define EASRC_DPCS0R0_CTXNUM_SHIFT	1
+#define EASRC_DPCS0R0_CTXNUM_WIDTH	2
+#define EASRC_DPCS0R0_CTXNUM_MASK	((BIT(EASRC_DPCS0R0_CTXNUM_WIDTH) - 1) \
+					 << EASRC_DPCS0R0_CTXNUM_SHIFT)
+#define EASRC_DPCS0R0_CTXNUM(v)		(((v) << EASRC_DPCS0R0_CTXNUM_SHIFT) \
+					 & EASRC_DPCS0R0_CTXNUM_MASK)
+#define EASRC_DPCS0R0_EN_SHIFT		0
+#define EASRC_DPCS0R0_EN_MASK		BIT(EASRC_DPCS0R0_EN_SHIFT)
+#define EASRC_DPCS0R0_EN		BIT(EASRC_DPCS0R0_EN_SHIFT)
+
+/* ASRC Datapath Processor Control Slot0 Register1 (DPCS0R1) */
+#define EASRC_DPCS0R1_ST1_EXP_SHIFT	0
+#define EASRC_DPCS0R1_ST1_EXP_WIDTH	13
+#define EASRC_DPCS0R1_ST1_EXP_MASK	((BIT(EASRC_DPCS0R1_ST1_EXP_WIDTH) - 1) \
+					 << EASRC_DPCS0R1_ST1_EXP_SHIFT)
+#define EASRC_DPCS0R1_ST1_EXP(v)	(((v) << EASRC_DPCS0R1_ST1_EXP_SHIFT) \
+					 & EASRC_DPCS0R1_ST1_EXP_MASK)
+
+/* ASRC Datapath Processor Control Slot0 Register2 (DPCS0R2) */
+#define EASRC_DPCS0R2_ST1_MA_SHIFT	16
+#define EASRC_DPCS0R2_ST1_MA_WIDTH	13
+#define EASRC_DPCS0R2_ST1_MA_MASK	((BIT(EASRC_DPCS0R2_ST1_MA_WIDTH) - 1) \
+					 << EASRC_DPCS0R2_ST1_MA_SHIFT)
+#define EASRC_DPCS0R2_ST1_MA(v)		(((v) << EASRC_DPCS0R2_ST1_MA_SHIFT) \
+					 & EASRC_DPCS0R2_ST1_MA_MASK)
+#define EASRC_DPCS0R2_ST1_SA_SHIFT	0
+#define EASRC_DPCS0R2_ST1_SA_WIDTH	13
+#define EASRC_DPCS0R2_ST1_SA_MASK	((BIT(EASRC_DPCS0R2_ST1_SA_WIDTH) - 1) \
+					 << EASRC_DPCS0R2_ST1_SA_SHIFT)
+#define EASRC_DPCS0R2_ST1_SA(v)		(((v) << EASRC_DPCS0R2_ST1_SA_SHIFT) \
+					 & EASRC_DPCS0R2_ST1_SA_MASK)
+
+/* ASRC Datapath Processor Control Slot0 Register3 (DPCS0R3) */
+#define EASRC_DPCS0R3_ST2_MA_SHIFT	16
+#define EASRC_DPCS0R3_ST2_MA_WIDTH	13
+#define EASRC_DPCS0R3_ST2_MA_MASK	((BIT(EASRC_DPCS0R3_ST2_MA_WIDTH) - 1) \
+					 << EASRC_DPCS0R3_ST2_MA_SHIFT)
+#define EASRC_DPCS0R3_ST2_MA(v)		(((v) << EASRC_DPCS0R3_ST2_MA_SHIFT) \
+					 & EASRC_DPCS0R3_ST2_MA_MASK)
+#define EASRC_DPCS0R3_ST2_SA_SHIFT	0
+#define EASRC_DPCS0R3_ST2_SA_WIDTH	13
+#define EASRC_DPCS0R3_ST2_SA_MASK	((BIT(EASRC_DPCS0R3_ST2_SA_WIDTH) - 1) \
+					 << EASRC_DPCS0R3_ST2_SA_SHIFT)
+#define EASRC_DPCS0R3_ST2_SA(v)		(((v) << EASRC_DPCS0R3_ST2_SA_SHIFT) \
+						 & EASRC_DPCS0R3_ST2_SA_MASK)
+
+/* ASRC Context Output Control (COC) */
+#define EASRC_COC_FWMDE_SHIFT		28
+#define EASRC_COC_FWMDE_MASK		BIT(EASRC_COC_FWMDE_SHIFT)
+#define EASRC_COC_FWMDE			BIT(EASRC_COC_FWMDE_SHIFT)
+#define EASRC_COC_FIFO_WTMK_SHIFT	16
+#define EASRC_COC_FIFO_WTMK_WIDTH	7
+#define EASRC_COC_FIFO_WTMK_MASK	((BIT(EASRC_COC_FIFO_WTMK_WIDTH) - 1) \
+					 << EASRC_COC_FIFO_WTMK_SHIFT)
+#define EASRC_COC_FIFO_WTMK(v)		(((v) << EASRC_COC_FIFO_WTMK_SHIFT) \
+					 & EASRC_COC_FIFO_WTMK_MASK)
+#define EASRC_COC_SAMPLE_POS_SHIFT	11
+#define EASRC_COC_SAMPLE_POS_WIDTH	5
+#define EASRC_COC_SAMPLE_POS_MASK	((BIT(EASRC_COC_SAMPLE_POS_WIDTH) - 1) \
+					 << EASRC_COC_SAMPLE_POS_SHIFT)
+#define EASRC_COC_SAMPLE_POS(v)		(((v) << EASRC_COC_SAMPLE_POS_SHIFT) \
+					 & EASRC_COC_SAMPLE_POS_MASK)
+#define EASRC_COC_ENDIANNESS_SHIFT	10
+#define EASRC_COC_ENDIANNESS_MASK	BIT(EASRC_COC_ENDIANNESS_SHIFT)
+#define EASRC_COC_ENDIANNESS		BIT(EASRC_COC_ENDIANNESS_SHIFT)
+#define EASRC_COC_BPS_SHIFT		8
+#define EASRC_COC_BPS_WIDTH		2
+#define EASRC_COC_BPS_MASK		((BIT(EASRC_COC_BPS_WIDTH) - 1) \
+					 << EASRC_COC_BPS_SHIFT)
+#define EASRC_COC_BPS(v)		(((v) << EASRC_COC_BPS_SHIFT) \
+					 & EASRC_COC_BPS_MASK)
+#define EASRC_COC_FMT_SHIFT		7
+#define EASRC_COC_FMT_MASK		BIT(EASRC_COC_FMT_SHIFT)
+#define EASRC_COC_FMT			BIT(EASRC_COC_FMT_SHIFT)
+#define EASRC_COC_OUTSIGN_SHIFT		6
+#define EASRC_COC_OUTSIGN_MASK		BIT(EASRC_COC_OUTSIGN_SHIFT)
+#define EASRC_COC_OUTSIGN_OUT		BIT(EASRC_COC_OUTSIGN_SHIFT)
+#define EASRC_COC_IEC_VDATA_SHIFT	2
+#define EASRC_COC_IEC_VDATA_MASK	BIT(EASRC_COC_IEC_VDATA_SHIFT)
+#define EASRC_COC_IEC_VDATA		BIT(EASRC_COC_IEC_VDATA_SHIFT)
+#define EASRC_COC_IEC_EN_SHIFT		1
+#define EASRC_COC_IEC_EN_MASK		BIT(EASRC_COC_IEC_EN_SHIFT)
+#define EASRC_COC_IEC_EN		BIT(EASRC_COC_IEC_EN_SHIFT)
+#define EASRC_COC_DITHER_EN_SHIFT	0
+#define EASRC_COC_DITHER_EN_MASK	BIT(EASRC_COC_DITHER_EN_SHIFT)
+#define EASRC_COC_DITHER_EN		BIT(EASRC_COC_DITHER_EN_SHIFT)
+
+/* ASRC Control Output Access (COA) */
+#define EASRC_COA_ITER_SHIFT		16
+#define EASRC_COA_ITER_WIDTH		6
+#define EASRC_COA_ITER_MASK		((BIT(EASRC_COA_ITER_WIDTH) - 1) \
+					 << EASRC_COA_ITER_SHIFT)
+#define EASRC_COA_ITER(v)		(((v) << EASRC_COA_ITER_SHIFT) \
+					 & EASRC_COA_ITER_MASK)
+#define EASRC_COA_GRLEN_SHIFT		8
+#define EASRC_COA_GRLEN_WIDTH		6
+#define EASRC_COA_GRLEN_MASK		((BIT(EASRC_COA_GRLEN_WIDTH) - 1) \
+					 << EASRC_COA_GRLEN_SHIFT)
+#define EASRC_COA_GRLEN(v)		(((v) << EASRC_COA_GRLEN_SHIFT) \
+					 & EASRC_COA_GRLEN_MASK)
+#define EASRC_COA_ACCLEN_SHIFT		0
+#define EASRC_COA_ACCLEN_WIDTH		6
+#define EASRC_COA_ACCLEN_MASK		((BIT(EASRC_COA_ACCLEN_WIDTH) - 1) \
+					 << EASRC_COA_ACCLEN_SHIFT)
+#define EASRC_COA_ACCLEN(v)		(((v) << EASRC_COA_ACCLEN_SHIFT) \
+					 & EASRC_COA_ACCLEN_MASK)
+
+/* ASRC Sample FIFO Status (SFS) */
+#define EASRC_SFS_IWTMK_SHIFT		23
+#define EASRC_SFS_IWTMK_MASK		BIT(EASRC_SFS_IWTMK_SHIFT)
+#define EASRC_SFS_IWTMK			BIT(EASRC_SFS_IWTMK_SHIFT)
+#define EASRC_SFS_NSGI_SHIFT		16
+#define EASRC_SFS_NSGI_WIDTH		7
+#define EASRC_SFS_NSGI_MASK		((BIT(EASRC_SFS_NSGI_WIDTH) - 1) \
+					 << EASRC_SFS_NSGI_SHIFT)
+#define EASRC_SFS_NSGI(v)		(((v) << EASRC_SFS_NSGI_SHIFT) \
+					 & EASRC_SFS_NSGI_MASK)
+#define EASRC_SFS_OWTMK_SHIFT		7
+#define EASRC_SFS_OWTMK_MASK		BIT(EASRC_SFS_OWTMK_SHIFT)
+#define EASRC_SFS_OWTMK			BIT(EASRC_SFS_OWTMK_SHIFT)
+#define EASRC_SFS_NSGO_SHIFT		0
+#define EASRC_SFS_NSGO_WIDTH		7
+#define EASRC_SFS_NSGO_MASK		((BIT(EASRC_SFS_NSGO_WIDTH) - 1) \
+					 << EASRC_SFS_NSGO_SHIFT)
+#define EASRC_SFS_NSGO(v)		(((v) << EASRC_SFS_NSGO_SHIFT) \
+					 & EASRC_SFS_NSGO_MASK)
+
+/* ASRC Resampling Ratio Low (RRL) */
+#define EASRC_RRL_RS_RL_SHIFT		0
+#define EASRC_RRL_RS_RL_WIDTH		32
+#define EASRC_RRL_RS_RL(v)		((v) << EASRC_RRL_RS_RL_SHIFT)
+
+/* ASRC Resampling Ratio High (RRH) */
+#define EASRC_RRH_RS_VLD_SHIFT		31
+#define EASRC_RRH_RS_VLD_MASK		BIT(EASRC_RRH_RS_VLD_SHIFT)
+#define EASRC_RRH_RS_VLD		BIT(EASRC_RRH_RS_VLD_SHIFT)
+#define EASRC_RRH_RS_RH_SHIFT		0
+#define EASRC_RRH_RS_RH_WIDTH		12
+#define EASRC_RRH_RS_RH_MASK		((BIT(EASRC_RRH_RS_RH_WIDTH) - 1) \
+					 << EASRC_RRH_RS_RH_SHIFT)
+#define EASRC_RRH_RS_RH(v)		(((v) << EASRC_RRH_RS_RH_SHIFT) \
+					 & EASRC_RRH_RS_RH_MASK)
+
+/* ASRC Resampling Ratio Update Control (RSUC) */
+#define EASRC_RSUC_RS_RM_SHIFT		0
+#define EASRC_RSUC_RS_RM_WIDTH		32
+#define EASRC_RSUC_RS_RM(v)		((v) << EASRC_RSUC_RS_RM_SHIFT)
+
+/* ASRC Resampling Ratio Update Rate (RRUR) */
+#define EASRC_RRUR_RRR_SHIFT		0
+#define EASRC_RRUR_RRR_WIDTH		31
+#define EASRC_RRUR_RRR_MASK		((BIT(EASRC_RRUR_RRR_WIDTH) - 1) \
+					 << EASRC_RRUR_RRR_SHIFT)
+#define EASRC_RRUR_RRR(v)		(((v) << EASRC_RRUR_RRR_SHIFT) \
+					 & EASRC_RRUR_RRR_MASK)
+
+/* ASRC Resampling Center Tap Coefficient Low (RCTCL) */
+#define EASRC_RCTCL_RS_CL_SHIFT		0
+#define EASRC_RCTCL_RS_CL_WIDTH		32
+#define EASRC_RCTCL_RS_CL(v)		((v) << EASRC_RCTCL_RS_CL_SHIFT)
+
+/* ASRC Resampling Center Tap Coefficient High (RCTCH) */
+#define EASRC_RCTCH_RS_CH_SHIFT		0
+#define EASRC_RCTCH_RS_CH_WIDTH		32
+#define EASRC_RCTCH_RS_CH(v)		((v) << EASRC_RCTCH_RS_CH_SHIFT)
+
+/* ASRC Prefilter Coefficient FIFO (PCF) */
+#define EASRC_PCF_CD_SHIFT		0
+#define EASRC_PCF_CD_WIDTH		32
+#define EASRC_PCF_CD(v)			((v) << EASRC_PCF_CD_SHIFT)
+
+/* ASRC Context Resampling Coefficient Memory (CRCM) */
+#define EASRC_CRCM_RS_CWD_SHIFT		0
+#define EASRC_CRCM_RS_CWD_WIDTH		32
+#define EASRC_CRCM_RS_CWD(v)		((v) << EASRC_CRCM_RS_CWD_SHIFT)
+
+/* ASRC Context Resampling Coefficient Control (CRCC) */
+#define EASRC_CRCC_RS_CA_SHIFT		16
+#define EASRC_CRCC_RS_CA_WIDTH		11
+#define EASRC_CRCC_RS_CA_MASK		((BIT(EASRC_CRCC_RS_CA_WIDTH) - 1) \
+					 << EASRC_CRCC_RS_CA_SHIFT)
+#define EASRC_CRCC_RS_CA(v)		(((v) << EASRC_CRCC_RS_CA_SHIFT) \
+					 & EASRC_CRCC_RS_CA_MASK)
+#define EASRC_CRCC_RS_TAPS_SHIFT	1
+#define EASRC_CRCC_RS_TAPS_WIDTH	2
+#define EASRC_CRCC_RS_TAPS_MASK		((BIT(EASRC_CRCC_RS_TAPS_WIDTH) - 1) \
+					 << EASRC_CRCC_RS_TAPS_SHIFT)
+#define EASRC_CRCC_RS_TAPS(v)		(((v) << EASRC_CRCC_RS_TAPS_SHIFT) \
+					 & EASRC_CRCC_RS_TAPS_MASK)
+#define EASRC_CRCC_RS_CPR_SHIFT		0
+#define EASRC_CRCC_RS_CPR_MASK		BIT(EASRC_CRCC_RS_CPR_SHIFT)
+#define EASRC_CRCC_RS_CPR		BIT(EASRC_CRCC_RS_CPR_SHIFT)
+
+/* ASRC Interrupt_Control (IC) */
+#define EASRC_IRQC_RSDM_SHIFT		8
+#define EASRC_IRQC_RSDM_WIDTH		4
+#define EASRC_IRQC_RSDM_MASK		((BIT(EASRC_IRQC_RSDM_WIDTH) - 1) \
+					 << EASRC_IRQC_RSDM_SHIFT)
+#define EASRC_IRQC_RSDM(v)		(((v) << EASRC_IRQC_RSDM_SHIFT) \
+					 & EASRC_IRQC_RSDM_MASK)
+#define EASRC_IRQC_OERM_SHIFT		4
+#define EASRC_IRQC_OERM_WIDTH		4
+#define EASRC_IRQC_OERM_MASK		((BIT(EASRC_IRQC_OERM_WIDTH) - 1) \
+					 << EASRC_IRQC_OERM_SHIFT)
+#define EASRC_IRQC_OERM(v)		(((v) << EASRC_IRQC_OERM_SHIFT) \
+					 & EASRC_IEQC_OERM_MASK)
+#define EASRC_IRQC_IOM_SHIFT		0
+#define EASRC_IRQC_IOM_WIDTH		4
+#define EASRC_IRQC_IOM_MASK		((BIT(EASRC_IRQC_IOM_WIDTH) - 1) \
+					 << EASRC_IRQC_IOM_SHIFT)
+#define EASRC_IRQC_IOM(v)		(((v) << EASRC_IRQC_IOM_SHIFT) \
+					 & EASRC_IRQC_IOM_MASK)
+
+/* ASRC Interrupt Status Flags (ISF) */
+#define EASRC_IRQF_RSD_SHIFT		8
+#define EASRC_IRQF_RSD_WIDTH		4
+#define EASRC_IRQF_RSD_MASK		((BIT(EASRC_IRQF_RSD_WIDTH) - 1) \
+					 << EASRC_IRQF_RSD_SHIFT)
+#define EASRC_IRQF_RSD(v)		(((v) << EASRC_IRQF_RSD_SHIFT) \
+					 & EASRC_IRQF_RSD_MASK)
+#define EASRC_IRQF_OER_SHIFT		4
+#define EASRC_IRQF_OER_WIDTH		4
+#define EASRC_IRQF_OER_MASK		((BIT(EASRC_IRQF_OER_WIDTH) - 1) \
+					 << EASRC_IRQF_OER_SHIFT)
+#define EASRC_IRQF_OER(v)		(((v) << EASRC_IRQF_OER_SHIFT) \
+					 & EASRC_IRQF_OER_MASK)
+#define EASRC_IRQF_IFO_SHIFT		0
+#define EASRC_IRQF_IFO_WIDTH		4
+#define EASRC_IRQF_IFO_MASK		((BIT(EASRC_IRQF_IFO_WIDTH) - 1) \
+					 << EASRC_IRQF_IFO_SHIFT)
+#define EASRC_IRQF_IFO(v)		(((v) << EASRC_IRQF_IFO_SHIFT) \
+					 & EASRC_IRQF_IFO_MASK)
+
+/* ASRC Context Channel STAT */
+#define EASRC_CSx_CSx_SHIFT		0
+#define EASRC_CSx_CSx_WIDTH		32
+#define EASRC_CSx_CSx(v)		((v) << EASRC_CSx_CSx_SHIFT)
+
+/* ASRC Debug Control Register */
+#define EASRC_DBGC_DMS_SHIFT		0
+#define EASRC_DBGC_DMS_WIDTH		6
+#define EASRC_DBGC_DMS_MASK		((BIT(EASRC_DBGC_DMS_WIDTH) - 1) \
+					 << EASRC_DBGC_DMS_SHIFT)
+#define EASRC_DBGC_DMS(v)		(((v) << EASRC_DBGC_DMS_SHIFT) \
+					 & EASRC_DBGC_DMS_MASK)
+
+/* ASRC Debug Status Register */
+#define EASRC_DBGS_DS_SHIFT		0
+#define EASRC_DBGS_DS_WIDTH		32
+#define EASRC_DBGS_DS(v)		((v) << EASRC_DBGS_DS_SHIFT)
+
+/* General Constants */
+#define EASRC_CTX_MAX_NUM		4
+#define EASRC_RS_COEFF_MEM		0
+#define EASRC_PF_COEFF_MEM		1
+
+/* Prefilter constants */
+#define EASRC_PF_ST1_ONLY		0
+#define EASRC_PF_TWO_STAGE_MODE		1
+#define EASRC_PF_ST1_COEFF_WR		0
+#define EASRC_PF_ST2_COEFF_WR		1
+#define EASRC_MAX_PF_TAPS		384
+
+/* Resampling constants */
+#define EASRC_RS_32_TAPS		0
+#define EASRC_RS_64_TAPS		1
+#define EASRC_RS_128_TAPS		2
+
+/* Initialization mode */
+#define EASRC_INIT_MODE_SW_CONTROL	0
+#define EASRC_INIT_MODE_REPLICATE	1
+#define EASRC_INIT_MODE_ZERO_FILL	2
+
+/* FIFO watermarks */
+#define FSL_EASRC_INPUTFIFO_WML		0x4
+#define FSL_EASRC_OUTPUTFIFO_WML	0x1
+
+#define EASRC_INPUTFIFO_THRESHOLD_MIN	0
+#define EASRC_INPUTFIFO_THRESHOLD_MAX	127
+#define EASRC_OUTPUTFIFO_THRESHOLD_MIN	0
+#define EASRC_OUTPUTFIFO_THRESHOLD_MAX	63
+
+#define EASRC_DMA_BUFFER_SIZE		(1024 * 48 * 9)
+#define EASRC_MAX_BUFFER_SIZE		(1024 * 48)
+
+#define FIRMWARE_MAGIC			0xDEAD
+#define FIRMWARE_VERSION		1
+
+enum easrc_word_width {
+	EASRC_WIDTH_16_BIT = 0,
+	EASRC_WIDTH_20_BIT = 1,
+	EASRC_WIDTH_24_BIT = 2,
+	EASRC_WIDTH_32_BIT = 3,
+};
+
+struct __attribute__((__packed__))  asrc_firmware_hdr {
+	u32 magic;
+	u32 interp_scen;
+	u32 prefil_scen;
+	u32 firmware_version;
+};
+
+struct __attribute__((__packed__)) interp_params {
+	u32 magic;
+	u32 num_taps;
+	u32 num_phases;
+	u64 center_tap;
+	u64 coeff[8192];
+};
+
+struct __attribute__((__packed__)) prefil_params {
+	u32 magic;
+	u32 insr;
+	u32 outsr;
+	u32 st1_taps;
+	u32 st2_taps;
+	u32 st1_exp;
+	u64 coeff[256];
+};
+
+struct dma_block {
+	void *dma_vaddr;
+	unsigned int length;
+	unsigned int max_buf_size;
+};
+
+struct fsl_easrc_data_fmt {
+	unsigned int width : 2;
+	unsigned int endianness : 1;
+	unsigned int unsign : 1;
+	unsigned int floating_point : 1;
+	unsigned int iec958: 1;
+	unsigned int sample_pos: 5;
+	unsigned int addexp;
+};
+
+struct fsl_easrc_io_params {
+	struct fsl_easrc_data_fmt fmt;
+	unsigned int group_len;
+	unsigned int iterations;
+	unsigned int access_len;
+	unsigned int fifo_wtmk;
+	unsigned int sample_rate;
+	unsigned int sample_format;
+	unsigned int norm_rate;
+};
+
+struct fsl_easrc_slot {
+	bool busy;
+	int ctx_index;
+	int num_channel;  /*maximum is 8*/
+	int min_channel;
+	int max_channel;
+	int pf_mem_used;
+};
+
+struct fsl_easrc_context {
+	enum asrc_pair_index index;
+	struct fsl_easrc *easrc;
+	struct dma_chan *dma_chan[2];
+	struct dma_async_tx_descriptor *desc[2];
+	struct fsl_easrc_io_params in_params;
+	struct fsl_easrc_io_params out_params;
+	struct imx_dma_data dma_data;
+	unsigned int channels;
+	unsigned int st1_num_taps;
+	unsigned int st2_num_taps;
+	unsigned int st1_num_exp;
+	unsigned int pf_init_mode;
+	unsigned int rs_init_mode;
+	unsigned int ctx_streams;
+	unsigned int pos;
+	u64 rs_ratio;
+	u64 *st1_coeff;
+	u64 *st2_coeff;
+	int in_filled_sample;
+	int out_missed_sample;
+	int st1_addexp;
+	int st2_addexp;
+	void *private_data;
+};
+
+/**
+ * fsl_easrc: EASRC private data
+ *
+ * @pdev: platform device pointer
+ * @regmap: regmap handler
+ * @dma_params_rx: DMA parameters for receive channel
+ * @dma_params_tx: DMA parameters for transmit channel
+ * @ctx:  context pointer
+ * @slot: slot setting
+ * @mem_clk: clock source to access register
+ * @firmware_hdr:  the header of firmware
+ * @interp: pointer to interpolation filter coeff
+ * @prefil: pointer to prefilter coeff
+ * @fw: firmware of coeff table
+ * @fw_name: firmware name
+ * @paddr: physical address to the base address of registers
+ * @rs_num_taps:  resample filter taps, 32, 64, or 128
+ * @bps_i2c958: bits per sample of iec958
+ * @chn_avail: available channels, maximum 32
+ * @lock: spin lock for resource protection
+ * @easrc_rate: default sample rate for ASoC Back-Ends
+ * @easrc_format: default sample format for ASoC Back-Ends
+ */
+
+struct fsl_easrc {
+	struct platform_device *pdev;
+	struct regmap *regmap;
+	struct miscdevice easrc_miscdev;
+	struct snd_dmaengine_dai_dma_data dma_params_rx;
+	struct snd_dmaengine_dai_dma_data dma_params_tx;
+	struct fsl_easrc_context *ctx[EASRC_CTX_MAX_NUM];
+	struct fsl_easrc_slot slot[EASRC_CTX_MAX_NUM][2];
+	struct clk *mem_clk;
+	struct asrc_firmware_hdr *firmware_hdr;
+	struct interp_params *interp;
+	struct prefil_params *prefil;
+	const struct firmware *fw;
+	const char *fw_name;
+	unsigned long paddr;
+	unsigned int rs_num_taps;
+	unsigned int bps_iec958[EASRC_CTX_MAX_NUM];
+	unsigned int chn_avail;
+	u64 *rs_coeff;
+	u64 const_coeff;
+	int firmware_loaded;
+	spinlock_t lock;  /* spin lock for resource protection */
+	int easrc_rate;
+	int easrc_format;
+};
+
+extern const struct snd_soc_component_driver fsl_easrc_dma_component;
+struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_easrc_context *ctx,
+					   bool dir);
+int fsl_easrc_request_context(struct fsl_easrc_context *ctx,
+			      unsigned int channels);
+int fsl_easrc_release_context(struct fsl_easrc_context *ctx);
+
+#define DRV_NAME "fsl-easrc-dma"
+#endif /* _FSL_EASRC_H */
diff --git a/sound/soc/fsl/fsl_easrc_dma.c b/sound/soc/fsl/fsl_easrc_dma.c
new file mode 100644
index 000000000000..1f5a89053412
--- /dev/null
+++ b/sound/soc/fsl/fsl_easrc_dma.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2019 NXP
+
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/platform_data/dma-imx.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm_params.h>
+
+#include "fsl_easrc.h"
+
+#define FSL_ASRC_DMABUF_SIZE	(256 * 1024)
+
+static struct snd_pcm_hardware snd_imx_hardware = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID,
+	.buffer_bytes_max = FSL_ASRC_DMABUF_SIZE,
+	.period_bytes_min = 128,
+	.period_bytes_max = 65532, /* Limited by SDMA engine */
+	.periods_min = 2,
+	.periods_max = 255,
+	.fifo_size = 0,
+};
+
+static bool filter(struct dma_chan *chan, void *param)
+{
+	if (!imx_dma_is_general_purpose(chan))
+		return false;
+
+	chan->private = param;
+
+	return true;
+}
+
+static void fsl_easrc_dma_complete(void *arg)
+{
+	struct snd_pcm_substream *substream = arg;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct fsl_easrc_context *ctx = runtime->private_data;
+
+	ctx->pos += snd_pcm_lib_period_bytes(substream);
+	if (ctx->pos >= snd_pcm_lib_buffer_bytes(substream))
+		ctx->pos = 0;
+
+	snd_pcm_period_elapsed(substream);
+}
+
+static int fsl_easrc_dma_prepare_and_submit(struct snd_pcm_substream *substream,
+					    struct snd_soc_component *component)
+{
+	u8 dir = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? OUT : IN;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct fsl_easrc_context *ctx = runtime->private_data;
+	struct device *dev = component->dev;
+	unsigned long flags = DMA_CTRL_ACK;
+
+	/* Prepare and submit Front-End DMA channel */
+	if (!substream->runtime->no_period_wakeup)
+		flags |= DMA_PREP_INTERRUPT;
+
+	ctx->pos = 0;
+	ctx->desc[!dir] = dmaengine_prep_dma_cyclic(ctx->dma_chan[!dir],
+						    runtime->dma_addr,
+						    snd_pcm_lib_buffer_bytes(substream),
+						    snd_pcm_lib_period_bytes(substream),
+						    dir == OUT ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM,
+						    flags);
+	if (!ctx->desc[!dir]) {
+		dev_err(dev, "failed to prepare slave DMA for Front-End\n");
+		return -ENOMEM;
+	}
+
+	ctx->desc[!dir]->callback = fsl_easrc_dma_complete;
+	ctx->desc[!dir]->callback_param = substream;
+
+	dmaengine_submit(ctx->desc[!dir]);
+
+	/* Prepare and submit Back-End DMA channel */
+	ctx->desc[dir] = dmaengine_prep_dma_cyclic(ctx->dma_chan[dir],
+						   0xffff, 64, 64,
+						   DMA_DEV_TO_DEV, 0);
+	if (!ctx->desc[dir]) {
+		dev_err(dev, "failed to prepare slave DMA for Back-End\n");
+		return -ENOMEM;
+	}
+
+	dmaengine_submit(ctx->desc[dir]);
+
+	return 0;
+}
+
+static int fsl_easrc_dma_trigger(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct fsl_easrc_context *ctx = runtime->private_data;
+	int ret;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = fsl_easrc_dma_prepare_and_submit(substream, component);
+		if (ret)
+			return ret;
+		dma_async_issue_pending(ctx->dma_chan[IN]);
+		dma_async_issue_pending(ctx->dma_chan[OUT]);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		dmaengine_terminate_all(ctx->dma_chan[OUT]);
+		dmaengine_terminate_all(ctx->dma_chan[IN]);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int fsl_easrc_dma_hw_params(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	enum dma_slave_buswidth buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	struct snd_dmaengine_dai_dma_data *dma_params_fe = NULL;
+	struct snd_dmaengine_dai_dma_data *dma_params_be = NULL;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct fsl_easrc_context *ctx = runtime->private_data;
+	struct fsl_easrc *easrc = ctx->easrc;
+	struct dma_slave_config config_fe, config_be;
+	enum asrc_pair_index index = ctx->index;
+	struct device *dev = component->dev;
+	int stream = substream->stream;
+	struct imx_dma_data *tmp_data;
+	struct snd_soc_dpcm *dpcm;
+	struct dma_chan *tmp_chan;
+	struct device *dev_be;
+	u8 dir = tx ? OUT : IN;
+	dma_cap_mask_t mask;
+	int ret;
+
+	/* Fetch the Back-End dma_data from DPCM */
+	list_for_each_entry(dpcm, &rtd->dpcm[stream].be_clients, list_be) {
+		struct snd_soc_pcm_runtime *be = dpcm->be;
+		struct snd_pcm_substream *substream_be;
+		struct snd_soc_dai *dai = be->cpu_dai;
+
+		if (dpcm->fe != rtd)
+			continue;
+
+		substream_be = snd_soc_dpcm_get_substream(be, stream);
+		dma_params_be = snd_soc_dai_get_dma_data(dai, substream_be);
+		dev_be = dai->dev;
+		break;
+	}
+
+	if (!dma_params_be) {
+		dev_err(dev, "failed to get the substream of Back-End\n");
+		return -EINVAL;
+	}
+
+	/* Override dma_data of the Front-End and config its dmaengine */
+	dma_params_fe = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	dma_params_fe->addr = easrc->paddr + REG_EASRC_FIFO(!dir, index);
+	dma_params_fe->maxburst = dma_params_be->maxburst;
+
+	ctx->dma_chan[!dir] = fsl_easrc_get_dma_channel(ctx, !dir);
+	if (!ctx->dma_chan[!dir]) {
+		dev_err(dev, "failed to request DMA channel\n");
+		return -EINVAL;
+	}
+
+	memset(&config_fe, 0, sizeof(config_fe));
+	ret = snd_dmaengine_pcm_prepare_slave_config(substream,
+						     params, &config_fe);
+	if (ret) {
+		dev_err(dev, "failed to prepare DMA config for Front-End\n");
+		return ret;
+	}
+
+	ret = dmaengine_slave_config(ctx->dma_chan[!dir], &config_fe);
+	if (ret) {
+		dev_err(dev, "failed to config DMA channel for Front-End\n");
+		return ret;
+	}
+
+	/* Request and config DMA channel for Back-End */
+	dma_cap_zero(mask);
+	dma_cap_set(DMA_SLAVE, mask);
+	dma_cap_set(DMA_CYCLIC, mask);
+
+	/* Get DMA request of Back-End */
+	tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
+	tmp_data = tmp_chan->private;
+	ctx->dma_data.dma_request = tmp_data->dma_request;
+	dma_release_channel(tmp_chan);
+
+	/* Get DMA request of Front-End */
+	tmp_chan = fsl_easrc_get_dma_channel(ctx, dir);
+	tmp_data = tmp_chan->private;
+	ctx->dma_data.dma_request2 = tmp_data->dma_request;
+	ctx->dma_data.peripheral_type = tmp_data->peripheral_type;
+	ctx->dma_data.priority = tmp_data->priority;
+	dma_release_channel(tmp_chan);
+
+	ctx->dma_chan[dir] = dma_request_channel(mask, filter, &ctx->dma_data);
+	if (!ctx->dma_chan[dir]) {
+		dev_err(dev, "failed to request DMA channel for Back-End\n");
+		return -EINVAL;
+	}
+
+	if (easrc->easrc_format == SNDRV_PCM_FORMAT_S16_LE)
+		buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
+	else
+		buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
+
+	memset(&config_be, 0, sizeof(config_be));
+
+	config_be.direction = DMA_DEV_TO_DEV;
+	config_be.src_addr_width = buswidth;
+	config_be.src_maxburst = dma_params_be->maxburst;
+	config_be.dst_addr_width = buswidth;
+	config_be.dst_maxburst = dma_params_be->maxburst;
+
+	if (tx) {
+		config_be.src_addr = easrc->paddr + REG_EASRC_RDFIFO(index);
+		config_be.dst_addr = dma_params_be->addr;
+	} else {
+		config_be.dst_addr = easrc->paddr + REG_EASRC_WRFIFO(index);
+		config_be.src_addr = dma_params_be->addr;
+	}
+
+	ret = dmaengine_slave_config(ctx->dma_chan[dir], &config_be);
+	if (ret) {
+		dev_err(dev, "failed to config DMA channel for Back-End\n");
+		return ret;
+	}
+
+	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+
+	return 0;
+}
+
+static int fsl_easrc_dma_hw_free(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct fsl_easrc_context *ctx = runtime->private_data;
+
+	snd_pcm_set_runtime_buffer(substream, NULL);
+
+	if (ctx->dma_chan[IN])
+		dma_release_channel(ctx->dma_chan[IN]);
+
+	if (ctx->dma_chan[OUT])
+		dma_release_channel(ctx->dma_chan[OUT]);
+
+	ctx->dma_chan[IN] = NULL;
+	ctx->dma_chan[OUT] = NULL;
+
+	return 0;
+}
+
+static int fsl_easrc_dma_startup(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream)
+{
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_dmaengine_dai_dma_data *dma_data;
+	struct device *dev = component->dev;
+	struct fsl_easrc *easrc = dev_get_drvdata(dev);
+	struct fsl_easrc_context *ctx;
+	struct dma_chan *tmp_chan = NULL;
+	u8 dir = tx ? OUT : IN;
+	bool release_pair = true;
+	int ret = 0;
+
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(dev, "failed to set pcm hw params periods\n");
+		return ret;
+	}
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->easrc = easrc;
+
+	runtime->private_data = ctx;
+
+	/* Request a dummy pair, which will be released later.
+	 * Request pair function needs channel num as input, for this
+	 * dummy pair, we just request "1" channel temporarily.
+	 */
+	fsl_easrc_request_context(ctx, 1);
+	if (ret < 0) {
+		dev_err(dev, "failed to request asrc pair\n");
+		goto req_pair_err;
+	}
+
+	/* Request a dummy dma channel, which will be released later. */
+	tmp_chan = fsl_easrc_get_dma_channel(ctx, dir);
+	if (!tmp_chan) {
+		dev_err(dev, "failed to get dma channel\n");
+		ret = -EINVAL;
+		goto dma_chan_err;
+	}
+
+	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+
+	/* Refine the snd_imx_hardware according to caps of DMA. */
+	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
+							dma_data,
+							&snd_imx_hardware,
+							tmp_chan);
+	if (ret < 0) {
+		dev_err(dev, "failed to refine runtime hwparams\n");
+		goto out;
+	}
+
+	release_pair = false;
+	snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
+
+out:
+	dma_release_channel(tmp_chan);
+
+dma_chan_err:
+	fsl_easrc_release_context(ctx);
+
+req_pair_err:
+	if (release_pair)
+		kfree(ctx);
+
+	return ret;
+}
+
+static int fsl_easrc_dma_shutdown(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct fsl_easrc_context *ctx = runtime->private_data;
+	struct fsl_easrc *easrc;
+
+	if (!ctx)
+		return 0;
+
+	easrc = ctx->easrc;
+
+	if (easrc->ctx[ctx->index] == ctx)
+		easrc->ctx[ctx->index] = NULL;
+
+	kfree(ctx);
+
+	return 0;
+}
+
+static snd_pcm_uframes_t fsl_easrc_dma_pcm_pointer(struct snd_soc_component *component,
+						   struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct fsl_easrc_context *ctx = runtime->private_data;
+
+	return bytes_to_frames(substream->runtime, ctx->pos);
+}
+
+static int fsl_easrc_dma_pcm_new(struct snd_soc_component *component,
+				 struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_card *card = rtd->card->snd_card;
+	struct snd_pcm_substream *substream;
+	struct snd_pcm *pcm = rtd->pcm;
+	int ret, i;
+
+	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(card->dev, "failed to set DMA mask\n");
+		return ret;
+	}
+
+	for (i = SNDRV_PCM_STREAM_PLAYBACK; i <= SNDRV_PCM_STREAM_LAST; i++) {
+		substream = pcm->streams[i].substream;
+		if (!substream)
+			continue;
+
+		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, pcm->card->dev,
+					  FSL_ASRC_DMABUF_SIZE,
+					  &substream->dma_buffer);
+		if (ret) {
+			dev_err(card->dev, "failed to allocate DMA buffer\n");
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	if (--i == 0 && pcm->streams[i].substream)
+		snd_dma_free_pages(&pcm->streams[i].substream->dma_buffer);
+
+	return ret;
+}
+
+static void fsl_easrc_dma_pcm_free(struct snd_soc_component *component,
+				   struct snd_pcm *pcm)
+{
+	struct snd_pcm_substream *substream;
+	int i;
+
+	for (i = SNDRV_PCM_STREAM_PLAYBACK; i <= SNDRV_PCM_STREAM_LAST; i++) {
+		substream = pcm->streams[i].substream;
+		if (!substream)
+			continue;
+
+		snd_dma_free_pages(&substream->dma_buffer);
+		substream->dma_buffer.area = NULL;
+		substream->dma_buffer.addr = 0;
+	}
+}
+
+const struct snd_soc_component_driver fsl_easrc_dma_component = {
+	.name		= DRV_NAME,
+	.hw_params	= fsl_easrc_dma_hw_params,
+	.hw_free	= fsl_easrc_dma_hw_free,
+	.trigger	= fsl_easrc_dma_trigger,
+	.open		= fsl_easrc_dma_startup,
+	.close		= fsl_easrc_dma_shutdown,
+	.pointer	= fsl_easrc_dma_pcm_pointer,
+	.pcm_construct	= fsl_easrc_dma_pcm_new,
+	.pcm_destruct	= fsl_easrc_dma_pcm_free,
+};
+EXPORT_SYMBOL_GPL(fsl_easrc_dma_component);
-- 
2.21.0

