Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2DC2168C6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 11:06:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Gl13TCtzDqlB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 19:06:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1GZK4PjlzDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 18:58:49 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B08D22015DF;
 Tue,  7 Jul 2020 10:58:46 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6068E2015EC;
 Tue,  7 Jul 2020 10:58:42 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C7669402F7;
 Tue,  7 Jul 2020 16:58:36 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: fsl_spdif: Add kctl for configuring TX validity bit
Date: Tue,  7 Jul 2020 16:54:26 +0800
Message-Id: <1594112066-31297-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594112066-31297-1-git-send-email-shengjiu.wang@nxp.com>
References: <1594112066-31297-1-git-send-email-shengjiu.wang@nxp.com>
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

Add one kctl for configuring TX validity bit from user
space.

The type of this kctl is boolean:
on - Outgoing validity always set
off - Outgoing validity always clear

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 47 +++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 576370dc6e70..37053e8f29d0 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -776,8 +776,8 @@ static int fsl_spdif_vbit_info(struct snd_kcontrol *kcontrol,
 }
 
 /* Get valid good bit from interrupt status register */
-static int fsl_spdif_vbit_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
+static int fsl_spdif_rx_vbit_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
@@ -791,6 +791,35 @@ static int fsl_spdif_vbit_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int fsl_spdif_tx_vbit_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
+	struct regmap *regmap = spdif_priv->regmap;
+	u32 val;
+
+	regmap_read(regmap, REG_SPDIF_SCR, &val);
+	val = (val & SCR_VAL_MASK) >> SCR_VAL_OFFSET;
+	val = 1 - val;
+	ucontrol->value.integer.value[0] = val;
+
+	return 0;
+}
+
+static int fsl_spdif_tx_vbit_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
+	struct regmap *regmap = spdif_priv->regmap;
+	u32 val = (1 - ucontrol->value.integer.value[0]) << SCR_VAL_OFFSET;
+
+	regmap_update_bits(regmap, REG_SPDIF_SCR, SCR_VAL_MASK, val);
+
+	return 0;
+}
+
 /* DPLL lock information */
 static int fsl_spdif_rxrate_info(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_info *uinfo)
@@ -948,11 +977,21 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 	/* Valid bit error controller */
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
-		.name = "IEC958 V-Bit Errors",
+		.name = "IEC958 RX V-Bit Errors",
 		.access = SNDRV_CTL_ELEM_ACCESS_READ |
 			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
 		.info = fsl_spdif_vbit_info,
-		.get = fsl_spdif_vbit_get,
+		.get = fsl_spdif_rx_vbit_get,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = "IEC958 TX V-Bit",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_WRITE |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = fsl_spdif_vbit_info,
+		.get = fsl_spdif_tx_vbit_get,
+		.put = fsl_spdif_tx_vbit_put,
 	},
 	/* DPLL lock info get controller */
 	{
-- 
2.21.0

