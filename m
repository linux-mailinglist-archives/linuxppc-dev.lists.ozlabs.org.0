Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2000728CE44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 14:23:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9ZTl0K3nzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 23:23:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.20.87;
 helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=K027DmKB;
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9ZLn27XgzDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 23:17:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qm1vc7UGhAu2MaqC/jZ3Fp6Yk35ZRjqJV8ysCxyWTY+5PHxfKPqVCAcFSxnwOgZZJJcxFPEHZzzkulpnBNwB+q5MBCBBpuXKxOzjMVfUn7MSrf4EvTivvNSf8s33ATzFelg9Dz/LbEK00RUOxzlBFzQ6bfqGI7FxiHdG5V1hMJwFowoGMlu86EGQUgYIfhXqfzbhmNds3C5tmfDmlSQO9Fq8ijTkE8ZdLAXhBpAWIsBMBMR2NVM6Atgsta0+05aLsdj8zNkOzalDGDrOrhesOyE6ks6VB1SCYL8RwPSo11brSw5JbZvPmDLHvcxDkgFthNv2hAYW4QctLJw97I0z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJeuD69+L6BcJ0shUvUE3oh0SqhmWoagMK8aPttHPqM=;
 b=eAWMXMC46inepi9g/C9DecTRr9M/S9iChDxaVm8WjLIXXo1EFAfj1Xj9yyY81kXpKUC8t1xWF21PJVgmri8rtxUozBZAWkpH2yKxo5pSY6wt+Z2HOxyZHGfY3yDkYk1llUE31F+7hYhxgAknVrgeCAMmUOg6XW87a8ae/GmWAFFiQk7fyYk+OYhW1HMDU/VWoQOGB/VxgJ3+oOi0nRokvcbccrXndcCUmJQmo/Y2auUnOtlVtJ6NuZYY+BzdCXUlBvQcTWUwlgtwhK+9zdt1k8eWRYsfhrefF0tDf/XVIBv9hqlajP39o8rgpnUNCqolxdavqoPAtw0XiIIR9mPVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJeuD69+L6BcJ0shUvUE3oh0SqhmWoagMK8aPttHPqM=;
 b=K027DmKBiY55CZi3+T/3pGR0+s36xEoqz3biYUqKb8XdItgq7v2RTkQPgGAHTo+yVCuiFdUuqvYjnPlNyz5z5LEq0fMyqTAJPAMUHMZpjW2M0dLEaoBJcSGA6tzYgQBHzCQVOIVJ9yLMsXrFC5J2owtGRm9r9LBWfQVTCqV23xg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB5198.eurprd04.prod.outlook.com
 (2603:10a6:803:56::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 12:17:44 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 12:17:44 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Viorel Suman <viorel.suman@nxp.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Date: Tue, 13 Oct 2020 15:17:32 +0300
Message-Id: <20201013121733.83684-2-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
References: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.127.156.60]
X-ClientProxiedBy: VI1PR0602CA0007.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::17) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.127.156.60) by
 VI1PR0602CA0007.eurprd06.prod.outlook.com (2603:10a6:800:bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Tue, 13 Oct 2020 12:17:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1fa85e7d-ebd3-4ccc-1c5e-08d86f71fd18
X-MS-TrafficTypeDiagnostic: VI1PR04MB5198:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB519803C86C88C51FB0350212D3040@VI1PR04MB5198.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HCGQNXIgJ9AVG4p0IT0VqTY5TZb3CU2MyYkq3HsIMuM1Dx2tSWFZnMb3+9LsqxhFi6eQtX3KhFSnNgdLKQjGZQYqRfenbyUBRPyOeFETyUKAxJ3a1xxUQjrE6vaeP8MEe7bAxBR9UFWOM1RPDqjvP1rMNX8lF1p79B+rFpCg0pkE3HzJkesHQwmWLdI40zXVmUqFkuHZDMeN7XHFB9PLZkUnqdSOfvLMEL8grvVDTma1NvmjZmRkh2It8i4zAENOWYH64Di9gRnjmIKb0URIaj/U++Wy+ISWoqHJCHdAJff3OUryHivd9yh6wMCAzuWSerXLQRvvDYDfu26Gp460LiFllYzgPspx6+db65D6pyngSENS9iKxBvXttfOgoaDIoez1mlkhKj/8eXfKVBQRcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(186003)(8676002)(30864003)(8936002)(5660300002)(66476007)(6506007)(7416002)(498600001)(66556008)(16526019)(66946007)(1076003)(69590400008)(956004)(2616005)(6512007)(6486002)(26005)(6666004)(52116002)(110136005)(2906002)(83380400001)(921003)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Tgno2quSM/iW/jL55YF0WbUebsHlDIVx7Hh8DT/+6f6w37dU/60GtboxH76Utw6Ki68d1PLfjVyCC/KHdYuPM0oXhfqjtiFdMrqIbzUyrLjH89AsnIJdbbeSSdBlIYU7YtzlS0xzVejmkthmfcboQEwy84SkaAluD4oR7GEJAycN6LT4ufHocTxKT78VuhkGlFTn6S/dzLDHRAgtBMnMpfSZIxRG1/ijj3yN7g6RDhHscM5+v6YlAz9GNJKtYL4hb0hAuZ+WeTn18gx9QReaIT4yzDaP/znq6DjnrmpdFbbyt+0M0V8NdZwRz1Pd0JoWJVHUklcPnIJ7rgrcQytX5FUYgMYRMCIynnqqYS5mEj6o0seOMYYU+bROcOF+z2rmaYFqm8YLNyeYKOxSW/m/8SlBxQRJ8WX/xluChqcPWi23XkUgXzP3FEec8sg2qdMhVuE3TbDUVL2doQemgVXudvULJqa9L4dvjtW+gM0fnk9U+X6/tp2kGt6g32sft3YUnyCnkpviVPttd5NirF+mce48J+zC2N+g7gw1mwNYwQNtAzTxnB+PYikq5rKmXJLXAtU2n0bAfRzBK+fDR0VZTYmIH8r5pbsxTZyU0Lr1fJMn1t23dV/v28KHLewJRxJJijYSEdgYmZkkg0/ofE3PbQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa85e7d-ebd3-4ccc-1c5e-08d86f71fd18
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 12:17:44.6386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+jZZ2YjFTv0rfIPxkp+gvP2Sezws0D1ijupQvmja7To59IxW/eONtLIYnUxVqOMBTguoshrN09i+kzZW8q9LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5198
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Viorel Suman <viorel.suman@nxp.com>

XCVR (Audio Transceiver) is a on-chip functional module found
on i.MX8MP. It support HDMI2.1 eARC, HDMI1.4 ARC and SPDIF.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/fsl/Kconfig    |   10 +
 sound/soc/fsl/Makefile   |    2 +
 sound/soc/fsl/fsl_xcvr.c | 1359 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h |  266 ++++++++
 4 files changed, 1637 insertions(+)
 create mode 100644 sound/soc/fsl/fsl_xcvr.c
 create mode 100644 sound/soc/fsl/fsl_xcvr.h

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 3f76ff71ea47..d04b64d32dc1 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -95,6 +95,16 @@ config SND_SOC_FSL_EASRC
 	  destination sample rate. It is a new design module compare with the
 	  old ASRC.
 
+config SND_SOC_FSL_XCVR
+	tristate "NXP Audio Transceiver (XCVR) module support"
+	select REGMAP_MMIO
+	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  Say Y if you want to add Audio Transceiver (XCVR) support for NXP
+	  iMX CPUs. XCVR is a digital module that supports HDMI2.1 eARC,
+	  HDMI1.4 ARC and SPDIF.
+
 config SND_SOC_FSL_UTILS
 	tristate
 
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index b835eebf8825..1d2231f9cc47 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -25,6 +25,7 @@ snd-soc-fsl-utils-objs := fsl_utils.o
 snd-soc-fsl-dma-objs := fsl_dma.o
 snd-soc-fsl-mqs-objs := fsl_mqs.o
 snd-soc-fsl-easrc-objs := fsl_easrc.o
+snd-soc-fsl-xcvr-objs := fsl_xcvr.o
 
 obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
 obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
@@ -38,6 +39,7 @@ obj-$(CONFIG_SND_SOC_FSL_UTILS) += snd-soc-fsl-utils.o
 obj-$(CONFIG_SND_SOC_FSL_MQS) += snd-soc-fsl-mqs.o
 obj-$(CONFIG_SND_SOC_FSL_EASRC) += snd-soc-fsl-easrc.o
 obj-$(CONFIG_SND_SOC_POWERPC_DMA) += snd-soc-fsl-dma.o
+obj-$(CONFIG_SND_SOC_FSL_XCVR) += snd-soc-fsl-xcvr.o
 
 # MPC5200 Platform Support
 obj-$(CONFIG_SND_MPC52xx_DMA) += mpc5200_dma.o
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
new file mode 100644
index 000000000000..c055179e6d11
--- /dev/null
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -0,0 +1,1359 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2019 NXP
+
+#include <linux/bitrev.h>
+#include <linux/clk.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm_iec958.h>
+#include <sound/pcm_params.h>
+
+#include "fsl_xcvr.h"
+#include "imx-pcm.h"
+
+#define FSL_XCVR_CAPDS_SIZE	256
+
+struct fsl_xcvr_soc_data {
+	const char *fw_name;
+};
+
+struct fsl_xcvr {
+	const struct fsl_xcvr_soc_data *soc_data;
+	struct platform_device *pdev;
+	struct regmap *regmap;
+	struct clk *ipg_clk;
+	struct clk *pll_ipg_clk;
+	struct clk *phy_clk;
+	struct clk *spba_clk;
+	struct reset_control *reset;
+	u8 streams;
+	u32 mode;
+	u32 arc_mode;
+	void __iomem *ram_addr;
+	struct snd_dmaengine_dai_dma_data dma_prms_rx;
+	struct snd_dmaengine_dai_dma_data dma_prms_tx;
+	struct snd_aes_iec958 rx_iec958;
+	struct snd_aes_iec958 tx_iec958;
+	u8 cap_ds[FSL_XCVR_CAPDS_SIZE];
+};
+
+static const struct fsl_xcvr_pll_conf {
+	u8 mfi;   /* min=0x18, max=0x38 */
+	u32 mfn;  /* signed int, 2's compl., min=0x3FFF0000, max=0x00010000 */
+	u32 mfd;  /* unsigned int */
+	u32 fout; /* Fout = Fref*(MFI + MFN/MFD), Fref is 24MHz */
+} fsl_xcvr_pll_cfg[] = {
+	{ .mfi = 54, .mfn = 1,  .mfd = 6,   .fout = 1300000000, }, /* 1.3 GHz */
+	{ .mfi = 32, .mfn = 96, .mfd = 125, .fout = 786432000, },  /* 8000 Hz */
+	{ .mfi = 30, .mfn = 66, .mfd = 625, .fout = 722534400, },  /* 11025 Hz */
+	{ .mfi = 29, .mfn = 1,  .mfd = 6,   .fout = 700000000, },  /* 700 MHz */
+};
+
+/*
+ * HDMI2.1 spec defines 6- and 12-channels layout for one bit audio
+ * stream. Todo: to check how this case can be considered below
+ */
+static const u32 fsl_xcvr_earc_channels[] = { 1, 2, 8, 16, 32, };
+static const struct snd_pcm_hw_constraint_list fsl_xcvr_earc_channels_constr = {
+	.count = ARRAY_SIZE(fsl_xcvr_earc_channels),
+	.list = fsl_xcvr_earc_channels,
+};
+
+static const u32 fsl_xcvr_earc_rates[] = {
+	32000, 44100, 48000, 64000, 88200, 96000,
+	128000, 176400, 192000, 256000, 352800, 384000,
+	512000, 705600, 768000, 1024000, 1411200, 1536000,
+};
+static const struct snd_pcm_hw_constraint_list fsl_xcvr_earc_rates_constr = {
+	.count = ARRAY_SIZE(fsl_xcvr_earc_rates),
+	.list = fsl_xcvr_earc_rates,
+};
+
+static const u32 fsl_xcvr_spdif_channels[] = { 2, };
+static const struct snd_pcm_hw_constraint_list fsl_xcvr_spdif_channels_constr = {
+	.count = ARRAY_SIZE(fsl_xcvr_spdif_channels),
+	.list = fsl_xcvr_spdif_channels,
+};
+
+static const u32 fsl_xcvr_spdif_rates[] = {
+	32000, 44100, 48000, 88200, 96000, 176400, 192000,
+};
+static const struct snd_pcm_hw_constraint_list fsl_xcvr_spdif_rates_constr = {
+	.count = ARRAY_SIZE(fsl_xcvr_spdif_rates),
+	.list = fsl_xcvr_spdif_rates,
+};
+
+static int fsl_xcvr_arc_mode_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+
+	xcvr->arc_mode = snd_soc_enum_item_to_val(e, item[0]);
+
+	return 0;
+}
+
+static int fsl_xcvr_arc_mode_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	ucontrol->value.enumerated.item[0] = xcvr->arc_mode;
+
+	return 0;
+}
+
+static const u32 fsl_xcvr_phy_arc_cfg[] = {
+	FSL_XCVR_PHY_CTRL_ARC_MODE_SE_EN, FSL_XCVR_PHY_CTRL_ARC_MODE_CM_EN,
+};
+
+static const char * const fsl_xcvr_arc_mode[] = { "Single Ended", "Common", };
+static const struct soc_enum fsl_xcvr_arc_mode_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(fsl_xcvr_arc_mode), fsl_xcvr_arc_mode);
+static struct snd_kcontrol_new fsl_xcvr_arc_mode_kctl =
+	SOC_ENUM_EXT("ARC Mode", fsl_xcvr_arc_mode_enum,
+		     fsl_xcvr_arc_mode_get, fsl_xcvr_arc_mode_put);
+
+/* Capabilities data structure, bytes */
+static int fsl_xcvr_type_capds_bytes_info(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
+	uinfo->count = FSL_XCVR_CAPDS_SIZE;
+
+	return 0;
+}
+
+static int fsl_xcvr_capds_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	memcpy(ucontrol->value.bytes.data, xcvr->cap_ds, FSL_XCVR_CAPDS_SIZE);
+
+	return 0;
+}
+
+static int fsl_xcvr_capds_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	memcpy(xcvr->cap_ds, ucontrol->value.bytes.data, FSL_XCVR_CAPDS_SIZE);
+
+	return 0;
+}
+
+static struct snd_kcontrol_new fsl_xcvr_earc_capds_kctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+	.name = "Capabilities Data Structure",
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.info = fsl_xcvr_type_capds_bytes_info,
+	.get = fsl_xcvr_capds_get,
+	.put = fsl_xcvr_capds_put,
+};
+
+static int fsl_xcvr_activate_ctl(struct snd_soc_dai *dai, const char *name,
+				 bool active)
+{
+	struct snd_soc_card *card = dai->component->card;
+	struct snd_kcontrol *kctl;
+	bool enabled;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+	if (kctl == NULL)
+		return -ENOENT;
+
+	enabled = ((kctl->vd[0].access & SNDRV_CTL_ELEM_ACCESS_WRITE) != 0);
+	if (active == enabled)
+		return 0; /* nothing to do */
+
+	if (active)
+		kctl->vd[0].access |=  SNDRV_CTL_ELEM_ACCESS_WRITE;
+	else
+		kctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_WRITE;
+
+	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_INFO, &kctl->id);
+
+	return 1;
+}
+
+static int fsl_xcvr_mode_put(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	struct snd_soc_card *card = dai->component->card;
+	struct snd_soc_pcm_runtime *rtd;
+
+	xcvr->mode = snd_soc_enum_item_to_val(e, item[0]);
+
+	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
+			      (xcvr->mode == FSL_XCVR_MODE_ARC));
+	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
+			      (xcvr->mode == FSL_XCVR_MODE_EARC));
+	/* Allow playback for SPDIF only */
+	rtd = snd_soc_get_pcm_runtime(card, card->dai_link);
+	rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream_count =
+		(xcvr->mode == FSL_XCVR_MODE_SPDIF ? 1 : 0);
+	return 0;
+}
+
+static int fsl_xcvr_mode_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	ucontrol->value.enumerated.item[0] = xcvr->mode;
+
+	return 0;
+}
+
+static const char * const fsl_xcvr_mode[] = { "SPDIF", "ARC RX", "eARC", };
+static const struct soc_enum fsl_xcvr_mode_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(fsl_xcvr_mode), fsl_xcvr_mode);
+static struct snd_kcontrol_new fsl_xcvr_mode_kctl =
+	SOC_ENUM_EXT("XCVR Mode", fsl_xcvr_mode_enum,
+		     fsl_xcvr_mode_get, fsl_xcvr_mode_put);
+
+/** phy: true => phy, false => pll */
+static int fsl_xcvr_ai_write(struct fsl_xcvr *xcvr, u8 reg, u32 data, bool phy)
+{
+	struct device *dev = &xcvr->pdev->dev;
+	u32 val, idx, tidx;
+	int ret;
+
+	idx  = BIT(phy ? 26 : 24);
+	tidx = BIT(phy ? 27 : 25);
+
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_CLR, 0xFF);
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET, reg);
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_WDATA, data);
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_TOG, idx);
+
+	ret = regmap_read_poll_timeout(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL, val,
+				       (val & idx) != ((val & tidx) >> 1),
+				       10, 10000);
+	if (ret)
+		dev_err(dev, "AI timeout: failed to set %s reg 0x%02x=0x%08x\n",
+			phy ? "PHY" : "PLL", reg, data);
+	return ret;
+}
+
+static int fsl_xcvr_en_phy_pll(struct fsl_xcvr *xcvr, u32 freq, bool tx)
+{
+	struct device *dev = &xcvr->pdev->dev;
+	u32 i, div = 0, log2;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(fsl_xcvr_pll_cfg); i++) {
+		if (fsl_xcvr_pll_cfg[i].fout % freq == 0) {
+			div = fsl_xcvr_pll_cfg[i].fout / freq;
+			break;
+		}
+	}
+
+	if (!div || i >= ARRAY_SIZE(fsl_xcvr_pll_cfg))
+		return -EINVAL;
+
+	log2 = ilog2(div);
+
+	/* Release AI interface from reset */
+	ret = regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET,
+			   FSL_XCVR_PHY_AI_CTRL_AI_RESETN);
+	if (ret < 0) {
+		dev_err(dev, "Error while setting IER0: %d\n", ret);
+		return ret;
+	}
+
+	/* PLL: BANDGAP_SET: EN_VBG (enable bandgap) */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_BANDGAP_SET,
+			  FSL_XCVR_PLL_BANDGAP_EN_VBG, 0);
+
+	/* PLL: CTRL0: DIV_INTEGER */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0, fsl_xcvr_pll_cfg[i].mfi, 0);
+	/* PLL: NUMERATOR: MFN */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_NUM, fsl_xcvr_pll_cfg[i].mfn, 0);
+	/* PLL: DENOMINATOR: MFD */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_DEN, fsl_xcvr_pll_cfg[i].mfd, 0);
+	/* PLL: CTRL0_SET: HOLD_RING_OFF, POWER_UP */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
+			  FSL_XCVR_PLL_CTRL0_HROFF | FSL_XCVR_PLL_CTRL0_PWP, 0);
+	udelay(25);
+	/* PLL: CTRL0: Clear Hold Ring Off */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_CLR,
+			  FSL_XCVR_PLL_CTRL0_HROFF, 0);
+	udelay(100);
+	if (tx) { /* TX is enabled for SPDIF only */
+		/* PLL: POSTDIV: PDIV0 */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
+				  FSL_XCVR_PLL_PDIVx(log2, 0), 0);
+		/* PLL: CTRL_SET: CLKMUX0_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
+				  FSL_XCVR_PLL_CTRL0_CM0_EN, 0);
+	} else if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC RX */
+		/* PLL: POSTDIV: PDIV1 */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
+				  FSL_XCVR_PLL_PDIVx(log2, 1), 0);
+		/* PLL: CTRL_SET: CLKMUX1_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
+				  FSL_XCVR_PLL_CTRL0_CM1_EN, 0);
+	} else { /* SPDIF / ARC RX */
+		/* PLL: POSTDIV: PDIV2 */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
+				  FSL_XCVR_PLL_PDIVx(log2, 2), 0);
+		/* PLL: CTRL_SET: CLKMUX2_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
+				  FSL_XCVR_PLL_CTRL0_CM2_EN, 0);
+	}
+
+	if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC mode */
+		/* PHY: CTRL_SET: TX_DIFF_OE, PHY_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
+				  FSL_XCVR_PHY_CTRL_TSDIFF_OE |
+				  FSL_XCVR_PHY_CTRL_PHY_EN, 1);
+		/* PHY: CTRL2_SET: EARC_TX_MODE */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL2_SET,
+				  FSL_XCVR_PHY_CTRL2_EARC_TXMS, 1);
+	} else if (!tx) { /* SPDIF / ARC RX mode */
+		if (xcvr->mode == FSL_XCVR_MODE_SPDIF)
+			/* PHY: CTRL_SET: SPDIF_EN */
+			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
+					  FSL_XCVR_PHY_CTRL_SPDIF_EN, 1);
+		else	/* PHY: CTRL_SET: ARC RX setup */
+			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
+					  FSL_XCVR_PHY_CTRL_PHY_EN |
+					  FSL_XCVR_PHY_CTRL_RX_CM_EN |
+					  fsl_xcvr_phy_arc_cfg[xcvr->arc_mode], 1);
+	}
+
+	dev_dbg(dev, "PLL Fexp: %u, Fout: %u, mfi: %u, mfn: %u, mfd: %d, div: %u, pdiv0: %u\n",
+		freq, fsl_xcvr_pll_cfg[i].fout, fsl_xcvr_pll_cfg[i].mfi,
+		fsl_xcvr_pll_cfg[i].mfn, fsl_xcvr_pll_cfg[i].mfd, div, log2);
+	return 0;
+}
+
+static int fsl_xcvr_en_aud_pll(struct fsl_xcvr *xcvr, u32 freq)
+{
+	struct device *dev = &xcvr->pdev->dev;
+	int ret;
+
+	clk_disable_unprepare(xcvr->phy_clk);
+	ret = clk_set_rate(xcvr->phy_clk, freq);
+	if (ret < 0) {
+		dev_err(dev, "Error while setting AUD PLL rate: %d\n", ret);
+		return ret;
+	}
+	ret = clk_prepare_enable(xcvr->phy_clk);
+	if (ret) {
+		dev_err(dev, "failed to start PHY clock: %d\n", ret);
+		return ret;
+	}
+
+	/* Release AI interface from reset */
+	ret = regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET,
+			   FSL_XCVR_PHY_AI_CTRL_AI_RESETN);
+	if (ret < 0) {
+		dev_err(dev, "Error while setting IER0: %d\n", ret);
+		return ret;
+	}
+
+	if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC mode */
+		/* PHY: CTRL_SET: TX_DIFF_OE, PHY_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
+				  FSL_XCVR_PHY_CTRL_TSDIFF_OE |
+				  FSL_XCVR_PHY_CTRL_PHY_EN, 1);
+		/* PHY: CTRL2_SET: EARC_TX_MODE */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL2_SET,
+				  FSL_XCVR_PHY_CTRL2_EARC_TXMS, 1);
+	} else { /* SPDIF mode */
+		/* PHY: CTRL_SET: TX_CLK_AUD_SS | SPDIF_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
+				  FSL_XCVR_PHY_CTRL_TX_CLK_AUD_SS |
+				  FSL_XCVR_PHY_CTRL_SPDIF_EN, 1);
+	}
+
+	dev_dbg(dev, "PLL Fexp: %u\n", freq);
+
+	return 0;
+}
+
+#define FSL_XCVR_SPDIF_RX_FREQ	175000000
+static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
+			    struct snd_soc_dai *dai)
+{
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	u32 m_ctl = 0, v_ctl = 0;
+	u32 r = substream->runtime->rate, ch = substream->runtime->channels;
+	u32 fout = 32 * r * ch * 10 * 2;
+	int ret = 0;
+
+	switch (xcvr->mode) {
+	case FSL_XCVR_MODE_SPDIF:
+	case FSL_XCVR_MODE_ARC:
+		if (tx) {
+			ret = fsl_xcvr_en_aud_pll(xcvr, fout);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to set TX freq %u: %d\n",
+					fout, ret);
+				return ret;
+			}
+
+			ret = regmap_write(xcvr->regmap, FSL_XCVR_TX_DPTH_CTRL_SET,
+					   FSL_XCVR_TX_DPTH_CTRL_FRM_FMT);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to set TX_DPTH: %d\n", ret);
+				return ret;
+			}
+
+			/**
+			 * set SPDIF MODE - this flag is used to gate
+			 * SPDIF output, useless for SPDIF RX
+			 */
+			m_ctl |= FSL_XCVR_EXT_CTRL_SPDIF_MODE;
+			v_ctl |= FSL_XCVR_EXT_CTRL_SPDIF_MODE;
+		} else {
+			/**
+			 * Clear RX FIFO, flip RX FIFO bits,
+			 * disable eARC related HW mode detects
+			 */
+			ret = regmap_write(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL_SET,
+					   FSL_XCVR_RX_DPTH_CTRL_STORE_FMT |
+					   FSL_XCVR_RX_DPTH_CTRL_CLR_RX_FIFO |
+					   FSL_XCVR_RX_DPTH_CTRL_COMP |
+					   FSL_XCVR_RX_DPTH_CTRL_LAYB_CTRL);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to set RX_DPTH: %d\n", ret);
+				return ret;
+			}
+
+			ret = fsl_xcvr_en_phy_pll(xcvr, FSL_XCVR_SPDIF_RX_FREQ, tx);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to set RX freq %u: %d\n",
+					FSL_XCVR_SPDIF_RX_FREQ, ret);
+				return ret;
+			}
+		}
+		break;
+	case FSL_XCVR_MODE_EARC:
+		if (!tx) {
+			/** Clear RX FIFO, flip RX FIFO bits */
+			ret = regmap_write(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL_SET,
+					   FSL_XCVR_RX_DPTH_CTRL_STORE_FMT |
+					   FSL_XCVR_RX_DPTH_CTRL_CLR_RX_FIFO);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to set RX_DPTH: %d\n", ret);
+				return ret;
+			}
+
+			/** Enable eARC related HW mode detects */
+			ret = regmap_write(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL_CLR,
+					   FSL_XCVR_RX_DPTH_CTRL_COMP |
+					   FSL_XCVR_RX_DPTH_CTRL_LAYB_CTRL);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to clr TX_DPTH: %d\n", ret);
+				return ret;
+			}
+		}
+
+		/* clear CMDC RESET */
+		m_ctl |= FSL_XCVR_EXT_CTRL_CMDC_RESET(tx);
+		/* set TX_RX_MODE */
+		m_ctl |= FSL_XCVR_EXT_CTRL_TX_RX_MODE;
+		v_ctl |= (tx ? FSL_XCVR_EXT_CTRL_TX_RX_MODE : 0);
+		break;
+	}
+
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
+				 FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_IRQ_EARC_ALL);
+	if (ret < 0) {
+		dev_err(dai->dev, "Error while setting IER0: %d\n", ret);
+		return ret;
+	}
+
+	/* clear DPATH RESET */
+	m_ctl |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, m_ctl, v_ctl);
+	if (ret < 0) {
+		dev_err(dai->dev, "Error while setting EXT_CTRL: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int fsl_xcvr_constr(const struct snd_pcm_substream *substream,
+			   const struct snd_pcm_hw_constraint_list *channels,
+			   const struct snd_pcm_hw_constraint_list *rates)
+{
+	struct snd_pcm_runtime *rt = substream->runtime;
+	int ret;
+
+	ret = snd_pcm_hw_constraint_list(rt, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+					 channels);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_pcm_hw_constraint_list(rt, 0, SNDRV_PCM_HW_PARAM_RATE,
+					 rates);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int fsl_xcvr_startup(struct snd_pcm_substream *substream,
+			    struct snd_soc_dai *dai)
+{
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	int ret = 0;
+
+	if (xcvr->streams & BIT(substream->stream)) {
+		dev_err(dai->dev, "%sX busy\n", tx ? "T" : "R");
+		return -EBUSY;
+	}
+
+	switch (xcvr->mode) {
+	case FSL_XCVR_MODE_SPDIF:
+	case FSL_XCVR_MODE_ARC:
+		ret = fsl_xcvr_constr(substream, &fsl_xcvr_spdif_channels_constr,
+				      &fsl_xcvr_spdif_rates_constr);
+		break;
+	case FSL_XCVR_MODE_EARC:
+		ret = fsl_xcvr_constr(substream, &fsl_xcvr_earc_channels_constr,
+				      &fsl_xcvr_earc_rates_constr);
+		break;
+	}
+	if (ret < 0)
+		return ret;
+
+	xcvr->streams |= BIT(substream->stream);
+
+	/* Disable XCVR controls if there is stream started */
+	fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name, false);
+	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name, false);
+	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name, false);
+
+	return 0;
+}
+
+static void fsl_xcvr_shutdown(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	u32 mask = 0, val = 0;
+	int ret;
+
+	xcvr->streams &= ~BIT(substream->stream);
+
+	/* Enable XCVR controls if there is no stream started */
+	if (!xcvr->streams) {
+		fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name, true);
+		fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
+				      (xcvr->mode == FSL_XCVR_MODE_ARC));
+		fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
+				      (xcvr->mode == FSL_XCVR_MODE_EARC));
+
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
+					 FSL_XCVR_IRQ_EARC_ALL, 0);
+		if (ret < 0) {
+			dev_err(dai->dev, "Failed to set IER0: %d\n", ret);
+			return;
+		}
+
+		/* clear SPDIF MODE */
+		if (xcvr->mode == FSL_XCVR_MODE_SPDIF)
+			mask |= FSL_XCVR_EXT_CTRL_SPDIF_MODE;
+	}
+
+	if (xcvr->mode == FSL_XCVR_MODE_EARC) {
+		/* set CMDC RESET */
+		mask |= FSL_XCVR_EXT_CTRL_CMDC_RESET(tx);
+		val  |= FSL_XCVR_EXT_CTRL_CMDC_RESET(tx);
+	}
+
+	/* set DPATH RESET */
+	mask |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
+	val  |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
+
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, mask, val);
+	if (ret < 0) {
+		dev_err(dai->dev, "Err setting DPATH RESET: %d\n", ret);
+		return;
+	}
+}
+
+static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
+			    struct snd_soc_dai *dai)
+{
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	int ret;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (tx) {
+			switch (xcvr->mode) {
+			case FSL_XCVR_MODE_EARC:
+				/* set isr_cmdc_tx_en, w1c */
+				ret = regmap_write(xcvr->regmap,
+						   FSL_XCVR_ISR_SET,
+						   FSL_XCVR_ISR_CMDC_TX_EN);
+				if (ret < 0) {
+					dev_err(dai->dev, "err updating isr %d\n", ret);
+					return ret;
+				}
+				fallthrough;
+			case FSL_XCVR_MODE_SPDIF:
+				ret = regmap_write(xcvr->regmap,
+					 FSL_XCVR_TX_DPTH_CTRL_SET,
+					 FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
+				if (ret < 0) {
+					dev_err(dai->dev, "Failed to start DATA_TX: %d\n", ret);
+					return ret;
+				}
+				break;
+			}
+		}
+
+		/* enable DMA RD/WR */
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx), 0);
+		if (ret < 0) {
+			dev_err(dai->dev, "Failed to enable DMA: %d\n", ret);
+			return ret;
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		/* disable DMA RD/WR */
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx),
+					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx));
+		if (ret < 0) {
+			dev_err(dai->dev, "Failed to disable DMA: %d\n", ret);
+			return ret;
+		}
+
+		if (tx) {
+			switch (xcvr->mode) {
+			case FSL_XCVR_MODE_SPDIF:
+				ret = regmap_write(xcvr->regmap,
+					 FSL_XCVR_TX_DPTH_CTRL_CLR,
+					 FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
+				if (ret < 0) {
+					dev_err(dai->dev, "Failed to stop DATA_TX: %d\n", ret);
+					return ret;
+				}
+				fallthrough;
+			case FSL_XCVR_MODE_EARC:
+				/* clear ISR_CMDC_TX_EN, W1C */
+				ret = regmap_write(xcvr->regmap,
+						   FSL_XCVR_ISR_CLR,
+						   FSL_XCVR_ISR_CMDC_TX_EN);
+				if (ret < 0) {
+					dev_err(dai->dev,
+						"Err updating ISR %d\n", ret);
+					return ret;
+				}
+				break;
+			}
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
+{
+	struct device *dev = &xcvr->pdev->dev;
+	const struct firmware *fw;
+	int ret = 0, rem, off, out, page = 0, size = FSL_XCVR_REG_OFFSET;
+	u32 mask, val;
+
+	ret = request_firmware(&fw, xcvr->soc_data->fw_name, dev);
+	if (ret) {
+		dev_err(dev, "failed to request firmware.\n");
+		return ret;
+	}
+
+	rem = fw->size;
+
+	/* RAM is 20KiB = 16KiB code + 4KiB data => max 10 pages 2KiB each */
+	if (rem > 16384) {
+		dev_err(dev, "FW size %d is bigger than 16KiB.\n", rem);
+		return -ENOMEM;
+	}
+
+	for (page = 0; page < 10; page++) {
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+					 FSL_XCVR_EXT_CTRL_PAGE_MASK,
+					 FSL_XCVR_EXT_CTRL_PAGE(page));
+		if (ret < 0) {
+			dev_err(dev, "FW: failed to set page %d, err=%d\n",
+				page, ret);
+			goto err_firmware;
+		}
+
+		off = page * size;
+		out = min(rem, size);
+		/* IPG clock is assumed to be running, otherwise it will hang */
+		if (out > 0) {
+			/* write firmware into code memory */
+			memcpy_toio(xcvr->ram_addr, fw->data + off, out);
+			rem -= out;
+			if (rem == 0) {
+				/* last part of firmware written */
+				/* clean remaining part of code memory page */
+				memset_io(xcvr->ram_addr + out, 0, size - out);
+			}
+		} else {
+			/* clean current page, including data memory */
+			memset_io(xcvr->ram_addr, 0, size);
+		}
+	};
+
+err_firmware:
+	release_firmware(fw);
+	if (ret < 0)
+		return ret;
+
+	/* configure watermarks */
+	mask = FSL_XCVR_EXT_CTRL_RX_FWM_MASK | FSL_XCVR_EXT_CTRL_TX_FWM_MASK;
+	val  = FSL_XCVR_EXT_CTRL_RX_FWM(FSL_XCVR_FIFO_WMK_RX);
+	val |= FSL_XCVR_EXT_CTRL_TX_FWM(FSL_XCVR_FIFO_WMK_TX);
+	/* disable DMA RD/WR */
+	mask |= FSL_XCVR_EXT_CTRL_DMA_RD_DIS | FSL_XCVR_EXT_CTRL_DMA_WR_DIS;
+	val  |= FSL_XCVR_EXT_CTRL_DMA_RD_DIS | FSL_XCVR_EXT_CTRL_DMA_WR_DIS;
+	/* Data RAM is 4KiB, last two pages: 8 and 9. Select page 8. */
+	mask |= FSL_XCVR_EXT_CTRL_PAGE_MASK;
+	val  |= FSL_XCVR_EXT_CTRL_PAGE(8);
+
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, mask, val);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set watermarks: %d\n", ret);
+		return ret;
+	}
+
+	/* Store Capabilities Data Structure into Data RAM */
+	memcpy_toio(xcvr->ram_addr + FSL_XCVR_CAP_DATA_STR, xcvr->cap_ds,
+		    FSL_XCVR_CAPDS_SIZE);
+	return 0;
+}
+
+static int fsl_xcvr_type_iec958_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
+	uinfo->count = 1;
+
+	return 0;
+}
+
+static int fsl_xcvr_type_iec958_bytes_info(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
+	uinfo->count = sizeof_field(struct snd_aes_iec958, status);
+
+	return 0;
+}
+
+static int fsl_xcvr_rx_cs_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	memcpy(ucontrol->value.iec958.status, xcvr->rx_iec958.status, 24);
+
+	return 0;
+}
+
+static int fsl_xcvr_tx_cs_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	memcpy(ucontrol->value.iec958.status, xcvr->tx_iec958.status, 24);
+
+	return 0;
+}
+
+static int fsl_xcvr_tx_cs_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	memcpy(xcvr->tx_iec958.status, ucontrol->value.iec958.status, 24);
+
+	return 0;
+}
+
+static struct snd_kcontrol_new fsl_xcvr_rx_ctls[] = {
+	/* Channel status controller */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, DEFAULT),
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.info = fsl_xcvr_type_iec958_info,
+		.get = fsl_xcvr_rx_cs_get,
+	},
+	/* Capture channel status, bytes */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = "Capture Channel Status",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.info = fsl_xcvr_type_iec958_bytes_info,
+		.get = fsl_xcvr_rx_cs_get,
+	},
+};
+
+static struct snd_kcontrol_new fsl_xcvr_tx_ctls[] = {
+	/* Channel status controller */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, DEFAULT),
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.info = fsl_xcvr_type_iec958_info,
+		.get = fsl_xcvr_tx_cs_get,
+		.put = fsl_xcvr_tx_cs_put,
+	},
+	/* Playback channel status, bytes */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = "Playback Channel Status",
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.info = fsl_xcvr_type_iec958_bytes_info,
+		.get = fsl_xcvr_tx_cs_get,
+		.put = fsl_xcvr_tx_cs_put,
+	},
+};
+
+static struct snd_soc_dai_ops fsl_xcvr_dai_ops = {
+	.prepare = fsl_xcvr_prepare,
+	.startup = fsl_xcvr_startup,
+	.shutdown = fsl_xcvr_shutdown,
+	.trigger = fsl_xcvr_trigger,
+};
+
+static int fsl_xcvr_dai_probe(struct snd_soc_dai *dai)
+{
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &xcvr->dma_prms_tx, &xcvr->dma_prms_rx);
+	snd_soc_dai_set_drvdata(dai, xcvr);
+
+	snd_soc_add_dai_controls(dai, &fsl_xcvr_mode_kctl, 1);
+	snd_soc_add_dai_controls(dai, &fsl_xcvr_arc_mode_kctl, 1);
+	snd_soc_add_dai_controls(dai, &fsl_xcvr_earc_capds_kctl, 1);
+	snd_soc_add_dai_controls(dai, fsl_xcvr_tx_ctls,
+				 ARRAY_SIZE(fsl_xcvr_tx_ctls));
+	snd_soc_add_dai_controls(dai, fsl_xcvr_rx_ctls,
+				 ARRAY_SIZE(fsl_xcvr_rx_ctls));
+	return 0;
+}
+
+static struct snd_soc_dai_driver fsl_xcvr_dai = {
+	.probe  = fsl_xcvr_dai_probe,
+	.ops = &fsl_xcvr_dai_ops,
+	.playback = {
+		.stream_name = "CPU-Playback",
+		.channels_min = 1,
+		.channels_max = 32,
+		.rate_min = 32000,
+		.rate_max = 1536000,
+		.rates = SNDRV_PCM_RATE_KNOT,
+		.formats = SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+	},
+	.capture = {
+		.stream_name = "CPU-Capture",
+		.channels_min = 1,
+		.channels_max = 32,
+		.rate_min = 32000,
+		.rate_max = 1536000,
+		.rates = SNDRV_PCM_RATE_KNOT,
+		.formats = SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+	},
+};
+
+static const struct snd_soc_component_driver fsl_xcvr_comp = {
+	.name = "fsl-xcvr-dai",
+};
+
+static const struct reg_default fsl_xcvr_reg_defaults[] = {
+	{ FSL_XCVR_VERSION,	0x00000000 },
+	{ FSL_XCVR_EXT_CTRL,	0xF8204040 },
+	{ FSL_XCVR_EXT_STATUS,	0x00000000 },
+	{ FSL_XCVR_EXT_IER0,	0x00000000 },
+	{ FSL_XCVR_EXT_IER1,	0x00000000 },
+	{ FSL_XCVR_EXT_ISR,	0x00000000 },
+	{ FSL_XCVR_EXT_ISR_SET,	0x00000000 },
+	{ FSL_XCVR_EXT_ISR_CLR,	0x00000000 },
+	{ FSL_XCVR_EXT_ISR_TOG,	0x00000000 },
+	{ FSL_XCVR_IER,		0x00000000 },
+	{ FSL_XCVR_ISR,		0x00000000 },
+	{ FSL_XCVR_ISR_SET,	0x00000000 },
+	{ FSL_XCVR_ISR_CLR,	0x00000000 },
+	{ FSL_XCVR_ISR_TOG,	0x00000000 },
+	{ FSL_XCVR_RX_DPTH_CTRL,	0x00002C89 },
+	{ FSL_XCVR_RX_DPTH_CTRL_SET,	0x00002C89 },
+	{ FSL_XCVR_RX_DPTH_CTRL_CLR,	0x00002C89 },
+	{ FSL_XCVR_RX_DPTH_CTRL_TOG,	0x00002C89 },
+	{ FSL_XCVR_TX_DPTH_CTRL,	0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CTRL_SET,	0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CTRL_CLR,	0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CTRL_TOG,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_0,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_1,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_2,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_3,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_4,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_5,	0x00000000 },
+	{ FSL_XCVR_DEBUG_REG_0,		0x00000000 },
+	{ FSL_XCVR_DEBUG_REG_1,		0x00000000 },
+};
+
+static bool fsl_xcvr_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case FSL_XCVR_VERSION:
+	case FSL_XCVR_EXT_CTRL:
+	case FSL_XCVR_EXT_STATUS:
+	case FSL_XCVR_EXT_IER0:
+	case FSL_XCVR_EXT_IER1:
+	case FSL_XCVR_EXT_ISR:
+	case FSL_XCVR_EXT_ISR_SET:
+	case FSL_XCVR_EXT_ISR_CLR:
+	case FSL_XCVR_EXT_ISR_TOG:
+	case FSL_XCVR_IER:
+	case FSL_XCVR_ISR:
+	case FSL_XCVR_ISR_SET:
+	case FSL_XCVR_ISR_CLR:
+	case FSL_XCVR_ISR_TOG:
+	case FSL_XCVR_PHY_AI_CTRL:
+	case FSL_XCVR_PHY_AI_CTRL_SET:
+	case FSL_XCVR_PHY_AI_CTRL_CLR:
+	case FSL_XCVR_PHY_AI_CTRL_TOG:
+	case FSL_XCVR_PHY_AI_RDATA:
+	case FSL_XCVR_CLK_CTRL:
+	case FSL_XCVR_RX_DPTH_CTRL:
+	case FSL_XCVR_RX_DPTH_CTRL_SET:
+	case FSL_XCVR_RX_DPTH_CTRL_CLR:
+	case FSL_XCVR_RX_DPTH_CTRL_TOG:
+	case FSL_XCVR_TX_DPTH_CTRL:
+	case FSL_XCVR_TX_DPTH_CTRL_SET:
+	case FSL_XCVR_TX_DPTH_CTRL_CLR:
+	case FSL_XCVR_TX_DPTH_CTRL_TOG:
+	case FSL_XCVR_TX_CS_DATA_0:
+	case FSL_XCVR_TX_CS_DATA_1:
+	case FSL_XCVR_TX_CS_DATA_2:
+	case FSL_XCVR_TX_CS_DATA_3:
+	case FSL_XCVR_TX_CS_DATA_4:
+	case FSL_XCVR_TX_CS_DATA_5:
+	case FSL_XCVR_DEBUG_REG_0:
+	case FSL_XCVR_DEBUG_REG_1:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool fsl_xcvr_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case FSL_XCVR_EXT_CTRL:
+	case FSL_XCVR_EXT_IER0:
+	case FSL_XCVR_EXT_IER1:
+	case FSL_XCVR_EXT_ISR:
+	case FSL_XCVR_EXT_ISR_SET:
+	case FSL_XCVR_EXT_ISR_CLR:
+	case FSL_XCVR_EXT_ISR_TOG:
+	case FSL_XCVR_IER:
+	case FSL_XCVR_ISR_SET:
+	case FSL_XCVR_ISR_CLR:
+	case FSL_XCVR_ISR_TOG:
+	case FSL_XCVR_PHY_AI_CTRL:
+	case FSL_XCVR_PHY_AI_CTRL_SET:
+	case FSL_XCVR_PHY_AI_CTRL_CLR:
+	case FSL_XCVR_PHY_AI_CTRL_TOG:
+	case FSL_XCVR_PHY_AI_WDATA:
+	case FSL_XCVR_CLK_CTRL:
+	case FSL_XCVR_RX_DPTH_CTRL:
+	case FSL_XCVR_RX_DPTH_CTRL_SET:
+	case FSL_XCVR_RX_DPTH_CTRL_CLR:
+	case FSL_XCVR_RX_DPTH_CTRL_TOG:
+	case FSL_XCVR_TX_DPTH_CTRL_SET:
+	case FSL_XCVR_TX_DPTH_CTRL_CLR:
+	case FSL_XCVR_TX_DPTH_CTRL_TOG:
+	case FSL_XCVR_TX_CS_DATA_0:
+	case FSL_XCVR_TX_CS_DATA_1:
+	case FSL_XCVR_TX_CS_DATA_2:
+	case FSL_XCVR_TX_CS_DATA_3:
+	case FSL_XCVR_TX_CS_DATA_4:
+	case FSL_XCVR_TX_CS_DATA_5:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool fsl_xcvr_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return fsl_xcvr_readable_reg(dev, reg);
+}
+
+static const struct regmap_config fsl_xcvr_regmap_cfg = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = FSL_XCVR_MAX_REG,
+	.reg_defaults = fsl_xcvr_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(fsl_xcvr_reg_defaults),
+	.readable_reg = fsl_xcvr_readable_reg,
+	.volatile_reg = fsl_xcvr_volatile_reg,
+	.writeable_reg = fsl_xcvr_writeable_reg,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static irqreturn_t irq0_isr(int irq, void *devid)
+{
+	struct fsl_xcvr *xcvr = (struct fsl_xcvr *)devid;
+	struct device *dev = &xcvr->pdev->dev;
+	struct regmap *regmap = xcvr->regmap;
+	void __iomem *reg_ctrl, *reg_buff;
+	u32 isr, isr_clr = 0, val, i;
+
+	regmap_read(regmap, FSL_XCVR_EXT_ISR, &isr);
+
+	if (isr & FSL_XCVR_IRQ_NEW_CS) {
+		dev_dbg(dev, "Received new CS block\n");
+		isr_clr |= FSL_XCVR_IRQ_NEW_CS;
+		/* Data RAM is 4KiB, last two pages: 8 and 9. Select page 8. */
+		regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+				   FSL_XCVR_EXT_CTRL_PAGE_MASK,
+				   FSL_XCVR_EXT_CTRL_PAGE(8));
+
+		/* Find updated CS buffer */
+		reg_ctrl = xcvr->ram_addr + FSL_XCVR_RX_CS_CTRL_0;
+		reg_buff = xcvr->ram_addr + FSL_XCVR_RX_CS_BUFF_0;
+		memcpy_fromio(&val, reg_ctrl, sizeof(val));
+		if (!val) {
+			reg_ctrl = xcvr->ram_addr + FSL_XCVR_RX_CS_CTRL_1;
+			reg_buff = xcvr->ram_addr + FSL_XCVR_RX_CS_BUFF_1;
+			memcpy_fromio(&val, reg_ctrl, sizeof(val));
+		}
+
+		if (val) {
+			/* copy CS buffer */
+			memcpy_fromio(&xcvr->rx_iec958.status, reg_buff,
+				      sizeof(xcvr->rx_iec958.status));
+			for (i = 0; i < 6; i++) {
+				val = *(u32 *)(xcvr->rx_iec958.status + i*4);
+				*(u32 *)(xcvr->rx_iec958.status + i*4) =
+					bitrev32(val);
+			}
+			/* clear CS control register */
+			memset_io(reg_ctrl, 0, sizeof(val));
+		}
+	}
+	if (isr & FSL_XCVR_IRQ_NEW_UD) {
+		dev_dbg(dev, "Received new UD block\n");
+		isr_clr |= FSL_XCVR_IRQ_NEW_UD;
+	}
+	if (isr & FSL_XCVR_IRQ_MUTE) {
+		dev_dbg(dev, "HW mute bit detected\n");
+		isr_clr |= FSL_XCVR_IRQ_MUTE;
+	}
+	if (isr & FSL_XCVR_IRQ_FIFO_UOFL_ERR) {
+		dev_dbg(dev, "RX/TX FIFO full/empty\n");
+		isr_clr |= FSL_XCVR_IRQ_FIFO_UOFL_ERR;
+	}
+	if (isr & FSL_XCVR_IRQ_ARC_MODE) {
+		dev_dbg(dev, "CMDC SM falls out of eARC mode\n");
+		isr_clr |= FSL_XCVR_IRQ_ARC_MODE;
+	}
+	if (isr & FSL_XCVR_IRQ_DMA_RD_REQ) {
+		dev_dbg(dev, "DMA read request\n");
+		isr_clr |= FSL_XCVR_IRQ_DMA_RD_REQ;
+	}
+	if (isr & FSL_XCVR_IRQ_DMA_WR_REQ) {
+		dev_dbg(dev, "DMA write request\n");
+		isr_clr |= FSL_XCVR_IRQ_DMA_WR_REQ;
+	}
+
+	if (isr_clr) {
+		regmap_write(regmap, FSL_XCVR_EXT_ISR_CLR, isr_clr);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static const struct fsl_xcvr_soc_data fsl_xcvr_imx8mp_data = {
+	.fw_name = "imx/xcvr/xcvr-imx8mp.bin",
+};
+
+static const struct of_device_id fsl_xcvr_dt_ids[] = {
+	{ .compatible = "fsl,imx8mp-xcvr", .data = &fsl_xcvr_imx8mp_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, fsl_xcvr_dt_ids);
+
+static int fsl_xcvr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct of_device_id *of_id;
+	struct fsl_xcvr *xcvr;
+	struct resource *ram_res, *regs_res, *rx_res, *tx_res;
+	void __iomem *regs;
+	int ret, irq;
+
+	of_id = of_match_device(fsl_xcvr_dt_ids, dev);
+	if (!of_id)
+		return -EINVAL;
+
+	xcvr = devm_kzalloc(dev, sizeof(*xcvr), GFP_KERNEL);
+	if (!xcvr)
+		return -ENOMEM;
+
+	xcvr->pdev = pdev;
+	xcvr->soc_data = of_device_get_match_data(&pdev->dev);
+
+	xcvr->ipg_clk = devm_clk_get(dev, "ipg");
+	if (IS_ERR(xcvr->ipg_clk)) {
+		dev_err(dev, "failed to get ipg clock\n");
+		return PTR_ERR(xcvr->ipg_clk);
+	}
+
+	xcvr->phy_clk = devm_clk_get(dev, "phy");
+	if (IS_ERR(xcvr->phy_clk)) {
+		dev_err(dev, "failed to get phy clock\n");
+		return PTR_ERR(xcvr->phy_clk);
+	}
+
+	xcvr->spba_clk = devm_clk_get(dev, "spba");
+	if (IS_ERR(xcvr->spba_clk)) {
+		dev_err(dev, "failed to get spba clock\n");
+		return PTR_ERR(xcvr->spba_clk);
+	}
+
+	xcvr->pll_ipg_clk = devm_clk_get(dev, "pll_ipg");
+	if (IS_ERR(xcvr->pll_ipg_clk)) {
+		dev_err(dev, "failed to get pll_ipg clock\n");
+		return PTR_ERR(xcvr->pll_ipg_clk);
+	}
+
+	ram_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ram");
+	xcvr->ram_addr = devm_ioremap_resource(dev, ram_res);
+	if (IS_ERR(xcvr->ram_addr))
+		return PTR_ERR(xcvr->ram_addr);
+
+	regs_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
+	regs = devm_ioremap_resource(dev, regs_res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	xcvr->regmap = devm_regmap_init_mmio_clk(dev, NULL, regs,
+						 &fsl_xcvr_regmap_cfg);
+	if (IS_ERR(xcvr->regmap)) {
+		dev_err(dev, "failed to init XCVR regmap: %ld\n",
+			PTR_ERR(xcvr->regmap));
+		return PTR_ERR(xcvr->regmap);
+	}
+
+	xcvr->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(xcvr->reset)) {
+		dev_err(dev, "failed to get XCVR reset control\n");
+		return PTR_ERR(xcvr->reset);
+	}
+
+	/* get IRQs */
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "no irq[0]: %d\n", irq);
+		return irq;
+	}
+
+	ret = devm_request_irq(dev, irq, irq0_isr, 0, pdev->name, xcvr);
+	if (ret) {
+		dev_err(dev, "failed to claim IRQ0: %i\n", ret);
+		return ret;
+	}
+
+	rx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rxfifo");
+	tx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "txfifo");
+	xcvr->dma_prms_rx.chan_name = "rx";
+	xcvr->dma_prms_tx.chan_name = "tx";
+	xcvr->dma_prms_rx.addr = rx_res->start;
+	xcvr->dma_prms_tx.addr = tx_res->start;
+	xcvr->dma_prms_rx.maxburst = FSL_XCVR_MAXBURST_RX;
+	xcvr->dma_prms_tx.maxburst = FSL_XCVR_MAXBURST_TX;
+
+	platform_set_drvdata(pdev, xcvr);
+	pm_runtime_enable(dev);
+	regcache_cache_only(xcvr->regmap, true);
+
+	ret = devm_snd_soc_register_component(dev, &fsl_xcvr_comp,
+					      &fsl_xcvr_dai, 1);
+	if (ret) {
+		dev_err(dev, "failed to register component %s\n",
+			fsl_xcvr_comp.name);
+		return ret;
+	}
+
+	ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
+	if (ret)
+		dev_err(dev, "failed to pcm register\n");
+
+	return ret;
+}
+
+static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
+{
+	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
+	int ret;
+
+	/* Assert M0+ reset */
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+				 FSL_XCVR_EXT_CTRL_CORE_RESET,
+				 FSL_XCVR_EXT_CTRL_CORE_RESET);
+	if (ret < 0)
+		dev_err(dev, "Failed to assert M0+ core: %d\n", ret);
+
+	ret = reset_control_assert(xcvr->reset);
+	if (ret < 0)
+		dev_err(dev, "Failed to assert M0+ reset: %d\n", ret);
+
+	regcache_cache_only(xcvr->regmap, true);
+
+	clk_disable_unprepare(xcvr->spba_clk);
+	clk_disable_unprepare(xcvr->phy_clk);
+	clk_disable_unprepare(xcvr->pll_ipg_clk);
+	clk_disable_unprepare(xcvr->ipg_clk);
+
+	return 0;
+}
+
+static __maybe_unused int fsl_xcvr_runtime_resume(struct device *dev)
+{
+	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(xcvr->ipg_clk);
+	if (ret) {
+		dev_err(dev, "failed to start IPG clock.\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(xcvr->pll_ipg_clk);
+	if (ret) {
+		dev_err(dev, "failed to start PLL IPG clock.\n");
+		goto stop_ipg_clk;
+	}
+
+	ret = clk_prepare_enable(xcvr->phy_clk);
+	if (ret) {
+		dev_err(dev, "failed to start PHY clock: %d\n", ret);
+		goto stop_pll_ipg_clk;
+	}
+
+	ret = clk_prepare_enable(xcvr->spba_clk);
+	if (ret) {
+		dev_err(dev, "failed to start SPBA clock.\n");
+		goto stop_phy_clk;
+	}
+
+	regcache_cache_only(xcvr->regmap, false);
+	regcache_mark_dirty(xcvr->regmap);
+	ret = regcache_sync(xcvr->regmap);
+
+	if (ret) {
+		dev_err(dev, "failed to sync regcache.\n");
+		goto stop_spba_clk;
+	}
+
+	ret = reset_control_deassert(xcvr->reset);
+	if (ret) {
+		dev_err(dev, "failed to deassert M0+ reset.\n");
+		goto stop_spba_clk;
+	}
+
+	ret = fsl_xcvr_load_firmware(xcvr);
+	if (ret) {
+		dev_err(dev, "failed to load firmware.\n");
+		goto stop_spba_clk;
+	}
+
+	/* Release M0+ reset */
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+				 FSL_XCVR_EXT_CTRL_CORE_RESET, 0);
+	if (ret < 0) {
+		dev_err(dev, "M0+ core release failed: %d\n", ret);
+		goto stop_spba_clk;
+	}
+
+	/* Let M0+ core complete firmware initialization */
+	msleep(50);
+
+	return 0;
+
+stop_spba_clk:
+	clk_disable_unprepare(xcvr->spba_clk);
+stop_phy_clk:
+	clk_disable_unprepare(xcvr->phy_clk);
+stop_pll_ipg_clk:
+	clk_disable_unprepare(xcvr->pll_ipg_clk);
+stop_ipg_clk:
+	clk_disable_unprepare(xcvr->ipg_clk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops fsl_xcvr_pm_ops = {
+	SET_RUNTIME_PM_OPS(fsl_xcvr_runtime_suspend,
+			   fsl_xcvr_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct platform_driver fsl_xcvr_driver = {
+	.probe = fsl_xcvr_probe,
+	.driver = {
+		.name = "fsl,imx8mp-audio-xcvr",
+		.pm = &fsl_xcvr_pm_ops,
+		.of_match_table = fsl_xcvr_dt_ids,
+	},
+};
+module_platform_driver(fsl_xcvr_driver);
+
+MODULE_AUTHOR("Viorel Suman <viorel.suman@nxp.com>");
+MODULE_DESCRIPTION("NXP Audio Transceiver (XCVR) driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
new file mode 100644
index 000000000000..7f2853c60085
--- /dev/null
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -0,0 +1,266 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * NXP XCVR ALSA SoC Digital Audio Interface (DAI) driver
+ *
+ * Copyright 2019 NXP
+ */
+
+#ifndef __FSL_XCVR_H
+#define __FSL_XCVR_H
+
+#define FSL_XCVR_MODE_SPDIF	0
+#define FSL_XCVR_MODE_ARC	1
+#define FSL_XCVR_MODE_EARC	2
+
+/* XCVR Registers */
+#define FSL_XCVR_REG_OFFSET		0x800 /* regs offset */
+#define FSL_XCVR_FIFO_SIZE		0x80  /* 128 */
+#define FSL_XCVR_FIFO_WMK_RX		(FSL_XCVR_FIFO_SIZE >> 1)   /* 64 */
+#define FSL_XCVR_FIFO_WMK_TX		(FSL_XCVR_FIFO_SIZE >> 1)   /* 64 */
+#define FSL_XCVR_MAXBURST_RX		(FSL_XCVR_FIFO_WMK_RX >> 2) /* 16 */
+#define FSL_XCVR_MAXBURST_TX		(FSL_XCVR_FIFO_WMK_TX >> 2) /* 16 */
+
+#define FSL_XCVR_RX_FIFO_ADDR		0x0C00
+#define FSL_XCVR_TX_FIFO_ADDR		0x0E00
+
+#define FSL_XCVR_VERSION		0x00  /* Version */
+#define FSL_XCVR_EXT_CTRL		0x10  /* Control */
+#define FSL_XCVR_EXT_STATUS		0x20  /* Status */
+#define FSL_XCVR_EXT_IER0		0x30  /* Interrupt en 0 */
+#define FSL_XCVR_EXT_IER1		0x40  /* Interrupt en 1 */
+#define FSL_XCVR_EXT_ISR		0x50  /* Interrupt status */
+#define FSL_XCVR_EXT_ISR_SET		0x54  /* Interrupt status */
+#define FSL_XCVR_EXT_ISR_CLR		0x58  /* Interrupt status */
+#define FSL_XCVR_EXT_ISR_TOG		0x5C  /* Interrupt status */
+#define FSL_XCVR_IER			0x70  /* Interrupt en for M0+ */
+#define FSL_XCVR_ISR			0x80  /* Interrupt status */
+#define FSL_XCVR_ISR_SET		0x84  /* Interrupt status set */
+#define FSL_XCVR_ISR_CLR		0x88  /* Interrupt status clear */
+#define FSL_XCVR_ISR_TOG		0x8C  /* Interrupt status toggle */
+#define FSL_XCVR_PHY_AI_CTRL		0x90
+#define FSL_XCVR_PHY_AI_CTRL_SET	0x94
+#define FSL_XCVR_PHY_AI_CTRL_CLR	0x98
+#define FSL_XCVR_PHY_AI_CTRL_TOG	0x9C
+#define FSL_XCVR_PHY_AI_WDATA		0xA0
+#define FSL_XCVR_PHY_AI_RDATA		0xA4
+#define FSL_XCVR_CLK_CTRL		0xB0
+#define FSL_XCVR_RX_DPTH_CTRL		0x180 /* RX datapath ctrl reg */
+#define FSL_XCVR_RX_DPTH_CTRL_SET	0x184
+#define FSL_XCVR_RX_DPTH_CTRL_CLR	0x188
+#define FSL_XCVR_RX_DPTH_CTRL_TOG	0x18c
+
+#define FSL_XCVR_TX_DPTH_CTRL		0x220 /* TX datapath ctrl reg */
+#define FSL_XCVR_TX_DPTH_CTRL_SET	0x224
+#define FSL_XCVR_TX_DPTH_CTRL_CLR	0x228
+#define FSL_XCVR_TX_DPTH_CTRL_TOG	0x22C
+#define FSL_XCVR_TX_CS_DATA_0		0x230 /* TX channel status bits regs */
+#define FSL_XCVR_TX_CS_DATA_1		0x234
+#define FSL_XCVR_TX_CS_DATA_2		0x238
+#define FSL_XCVR_TX_CS_DATA_3		0x23C
+#define FSL_XCVR_TX_CS_DATA_4		0x240
+#define FSL_XCVR_TX_CS_DATA_5		0x244
+#define FSL_XCVR_DEBUG_REG_0		0x2E0
+#define FSL_XCVR_DEBUG_REG_1		0x2F0
+
+#define FSL_XCVR_MAX_REG		FSL_XCVR_DEBUG_REG_1
+
+#define FSL_XCVR_EXT_CTRL_CORE_RESET	BIT(31)
+
+#define FSL_XCVR_EXT_CTRL_RX_CMDC_RESET	BIT(30)
+#define FSL_XCVR_EXT_CTRL_TX_CMDC_RESET	BIT(29)
+#define FSL_XCVR_EXT_CTRL_CMDC_RESET(t) (t ? BIT(29) : BIT(30))
+
+#define FSL_XCVR_EXT_CTRL_RX_DPTH_RESET	BIT(28)
+#define FSL_XCVR_EXT_CTRL_TX_DPTH_RESET	BIT(27)
+#define FSL_XCVR_EXT_CTRL_DPTH_RESET(t) (t ? BIT(27) : BIT(28))
+
+#define FSL_XCVR_EXT_CTRL_TX_RX_MODE	BIT(26)
+#define FSL_XCVR_EXT_CTRL_DMA_RD_DIS	BIT(25)
+#define FSL_XCVR_EXT_CTRL_DMA_WR_DIS	BIT(24)
+#define FSL_XCVR_EXT_CTRL_DMA_DIS(t)	(t ? BIT(24) : BIT(25))
+#define FSL_XCVR_EXT_CTRL_SPDIF_MODE	BIT(23)
+#define FSL_XCVR_EXT_CTRL_SLEEP_MODE	BIT(21)
+
+#define FSL_XCVR_EXT_CTRL_TX_FWM_SHFT	0
+#define FSL_XCVR_EXT_CTRL_TX_FWM_MASK	GENMASK(6, 0)
+#define FSL_XCVR_EXT_CTRL_TX_FWM(i)	(((i) << FSL_XCVR_EXT_CTRL_TX_FWM_SHFT) \
+					  & FSL_XCVR_EXT_CTRL_TX_FWM_MASK)
+#define FSL_XCVR_EXT_CTRL_RX_FWM_SHFT	8
+#define FSL_XCVR_EXT_CTRL_RX_FWM_MASK	GENMASK(14, 8)
+#define FSL_XCVR_EXT_CTRL_RX_FWM(i)	(((i) << FSL_XCVR_EXT_CTRL_RX_FWM_SHFT) \
+					  & FSL_XCVR_EXT_CTRL_RX_FWM_MASK)
+#define FSL_XCVR_EXT_CTRL_PAGE_SHFT	16
+#define FSL_XCVR_EXT_CTRL_PAGE_MASK	GENMASK(19, 16)
+#define FSL_XCVR_EXT_CTRL_PAGE(i)	(((i) << FSL_XCVR_EXT_CTRL_PAGE_SHFT) \
+					  & FSL_XCVR_EXT_CTRL_PAGE_MASK)
+
+#define FSL_XCVR_EXT_STUS_NT_FIFO_ENTR	GENMASK(7, 0)
+#define FSL_XCVR_EXT_STUS_NR_FIFO_ENTR	GENMASK(15, 8)
+#define FSL_XCVR_EXT_STUS_CM0_SLEEPING	BIT(16)
+#define FSL_XCVR_EXT_STUS_CM0_DEEP_SLP	BIT(17)
+#define FSL_XCVR_EXT_STUS_CM0_SLP_HACK	BIT(18)
+#define FSL_XCVR_EXT_STUS_RX_CMDC_RSTO	BIT(23)
+#define FSL_XCVR_EXT_STUS_TX_CMDC_RSTO	BIT(24)
+#define FSL_XCVR_EXT_STUS_RX_CMDC_COTO	BIT(25)
+#define FSL_XCVR_EXT_STUS_TX_CMDC_COTO	BIT(26)
+#define FSL_XCVR_EXT_STUS_HB_STATUS	BIT(27)
+#define FSL_XCVR_EXT_STUS_NEW_UD4_REC	BIT(28)
+#define FSL_XCVR_EXT_STUS_NEW_UD5_REC	BIT(29)
+#define FSL_XCVR_EXT_STUS_NEW_UD6_REC	BIT(30)
+#define FSL_XCVR_EXT_STUS_HPD_INPUT	BIT(31)
+
+#define FSL_XCVR_IRQ_NEW_CS		BIT(0)
+#define FSL_XCVR_IRQ_NEW_UD		BIT(1)
+#define FSL_XCVR_IRQ_MUTE		BIT(2)
+#define FSL_XCVR_IRQ_CMDC_RESP_TO	BIT(3)
+#define FSL_XCVR_IRQ_ECC_ERR		BIT(4)
+#define FSL_XCVR_IRQ_PREAMBLE_MISMATCH	BIT(5)
+#define FSL_XCVR_IRQ_FIFO_UOFL_ERR	BIT(6)
+#define FSL_XCVR_IRQ_HOST_WAKEUP	BIT(7)
+#define FSL_XCVR_IRQ_HOST_OHPD		BIT(8)
+#define FSL_XCVR_IRQ_DMAC_NO_DATA_REC	BIT(9)
+#define FSL_XCVR_IRQ_DMAC_FMT_CHG_DET	BIT(10)
+#define FSL_XCVR_IRQ_HB_STATE_CHG	BIT(11)
+#define FSL_XCVR_IRQ_CMDC_STATUS_UPD	BIT(12)
+#define FSL_XCVR_IRQ_TEMP_UPD		BIT(13)
+#define FSL_XCVR_IRQ_DMA_RD_REQ		BIT(14)
+#define FSL_XCVR_IRQ_DMA_WR_REQ		BIT(15)
+#define FSL_XCVR_IRQ_DMAC_BME_BIT_ERR	BIT(16)
+#define FSL_XCVR_IRQ_PREAMBLE_MATCH	BIT(17)
+#define FSL_XCVR_IRQ_M_W_PRE_MISMATCH	BIT(18)
+#define FSL_XCVR_IRQ_B_PRE_MISMATCH	BIT(19)
+#define FSL_XCVR_IRQ_UNEXP_PRE_REC	BIT(20)
+#define FSL_XCVR_IRQ_ARC_MODE		BIT(21)
+#define FSL_XCVR_IRQ_CH_UD_OFLOW	BIT(22)
+#define FSL_XCVR_IRQ_EARC_ALL		(FSL_XCVR_IRQ_NEW_CS | \
+					 FSL_XCVR_IRQ_NEW_UD | \
+					 FSL_XCVR_IRQ_MUTE | \
+					 FSL_XCVR_IRQ_FIFO_UOFL_ERR | \
+					 FSL_XCVR_IRQ_HOST_WAKEUP | \
+					 FSL_XCVR_IRQ_ARC_MODE)
+
+#define FSL_XCVR_ISR_CMDC_TX_EN		BIT(3)
+#define FSL_XCVR_ISR_HPD_TGL		BIT(15)
+#define FSL_XCVR_ISR_DMAC_SPARE_INT	BIT(19)
+#define FSL_XCVR_ISR_SET_SPDIF_RX_INT	BIT(20)
+#define FSL_XCVR_ISR_SET_SPDIF_TX_INT	BIT(21)
+#define FSL_XCVR_ISR_SET_SPDIF_MODE(t)	(t ? BIT(21) : BIT(20))
+#define FSL_XCVR_ISR_SET_ARC_CM_INT	BIT(22)
+#define FSL_XCVR_ISR_SET_ARC_SE_INT	BIT(23)
+
+#define FSL_XCVR_PHY_AI_ADDR_MASK	GENMASK(7, 0)
+#define FSL_XCVR_PHY_AI_RESETN		BIT(15)
+#define FSL_XCVR_PHY_AI_TOG_PLL		BIT(24)
+#define FSL_XCVR_PHY_AI_TOG_DONE_PLL	BIT(25)
+#define FSL_XCVR_PHY_AI_TOG_PHY		BIT(26)
+#define FSL_XCVR_PHY_AI_TOG_DONE_PHY	BIT(27)
+#define FSL_XCVR_PHY_AI_RW_MASK		BIT(31)
+
+#define FSL_XCVR_RX_DPTH_CTRL_PAPB_FIFO_STATUS	BIT(0)
+#define FSL_XCVR_RX_DPTH_CTRL_DIS_PRE_ERR_CHK	BIT(1)
+#define FSL_XCVR_RX_DPTH_CTRL_DIS_NOD_REC_CHK	BIT(2)
+#define FSL_XCVR_RX_DPTH_CTRL_ECC_VUC_BIT_CHK	BIT(3)
+#define FSL_XCVR_RX_DPTH_CTRL_EN_CMP_PAR_CALC	BIT(4)
+#define FSL_XCVR_RX_DPTH_CTRL_RST_PKT_CNT_FIFO	BIT(5)
+#define FSL_XCVR_RX_DPTH_CTRL_STORE_FMT		BIT(6)
+#define FSL_XCVR_RX_DPTH_CTRL_EN_PAR_CALC	BIT(7)
+#define FSL_XCVR_RX_DPTH_CTRL_UDR		BIT(8)
+#define FSL_XCVR_RX_DPTH_CTRL_CSR		BIT(9)
+#define FSL_XCVR_RX_DPTH_CTRL_UDA		BIT(10)
+#define FSL_XCVR_RX_DPTH_CTRL_CSA		BIT(11)
+#define FSL_XCVR_RX_DPTH_CTRL_CLR_RX_FIFO	BIT(12)
+#define FSL_XCVR_RX_DPTH_CTRL_DIS_B_PRE_ERR_CHK	BIT(13)
+#define FSL_XCVR_RX_DPTH_CTRL_PABS		BIT(19)
+#define FSL_XCVR_RX_DPTH_CTRL_DTS_CDS		BIT(20)
+#define FSL_XCVR_RX_DPTH_CTRL_BLKC		BIT(21)
+#define FSL_XCVR_RX_DPTH_CTRL_MUTE_CTRL		BIT(22)
+#define FSL_XCVR_RX_DPTH_CTRL_MUTE_MODE		BIT(23)
+#define FSL_XCVR_RX_DPTH_CTRL_FMT_CHG_CTRL	BIT(24)
+#define FSL_XCVR_RX_DPTH_CTRL_FMT_CHG_MODE	BIT(25)
+#define FSL_XCVR_RX_DPTH_CTRL_LAYB_CTRL		BIT(26)
+#define FSL_XCVR_RX_DPTH_CTRL_LAYB_MODE		BIT(27)
+#define FSL_XCVR_RX_DPTH_CTRL_PRC		BIT(28)
+#define FSL_XCVR_RX_DPTH_CTRL_COMP		BIT(29)
+#define FSL_XCVR_RX_DPTH_CTRL_FSM		GENMASK(31, 30)
+
+#define FSL_XCVR_TX_DPTH_CTRL_CS_ACK		BIT(0)
+#define FSL_XCVR_TX_DPTH_CTRL_UD_ACK		BIT(1)
+#define FSL_XCVR_TX_DPTH_CTRL_CS_MOD		BIT(2)
+#define FSL_XCVR_TX_DPTH_CTRL_UD_MOD		BIT(3)
+#define FSL_XCVR_TX_DPTH_CTRL_VLD_MOD		BIT(4)
+#define FSL_XCVR_TX_DPTH_CTRL_FRM_VLD		BIT(5)
+#define FSL_XCVR_TX_DPTH_CTRL_EN_PARITY		BIT(6)
+#define FSL_XCVR_TX_DPTH_CTRL_EN_PREAMBLE	BIT(7)
+#define FSL_XCVR_TX_DPTH_CTRL_EN_ECC_INTER	BIT(8)
+#define FSL_XCVR_TX_DPTH_CTRL_BYPASS_FEM	BIT(10)
+#define FSL_XCVR_TX_DPTH_CTRL_FRM_FMT		BIT(11)
+#define FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX	BIT(14)
+#define FSL_XCVR_TX_DPTH_CTRL_ADD_CYC_TX_OE_STR	BIT(15)
+#define FSL_XCVR_TX_DPTH_CTRL_ADD_CYC_TX_OE_END	BIT(16)
+#define FSL_XCVR_TX_DPTH_CTRL_CLK_RATIO		BIT(29)
+#define FSL_XCVR_TX_DPTH_CTRL_TM_NO_PRE_BME	GENMASK(31, 30)
+
+#define FSL_XCVR_PHY_AI_CTRL_AI_RESETN		BIT(15)
+
+#define FSL_XCVR_PLL_CTRL0			0x00
+#define FSL_XCVR_PLL_CTRL0_SET			0x04
+#define FSL_XCVR_PLL_CTRL0_CLR			0x08
+#define FSL_XCVR_PLL_NUM			0x20
+#define FSL_XCVR_PLL_DEN			0x30
+#define FSL_XCVR_PLL_PDIV			0x40
+#define FSL_XCVR_PLL_BANDGAP_SET		0x54
+#define FSL_XCVR_PHY_CTRL			0x00
+#define FSL_XCVR_PHY_CTRL_SET			0x04
+#define FSL_XCVR_PHY_CTRL_CLR			0x08
+#define FSL_XCVR_PHY_CTRL2			0x70
+#define FSL_XCVR_PHY_CTRL2_SET			0x74
+#define FSL_XCVR_PHY_CTRL2_CLR			0x78
+
+#define FSL_XCVR_PLL_BANDGAP_EN_VBG		BIT(0)
+#define FSL_XCVR_PLL_CTRL0_HROFF		BIT(13)
+#define FSL_XCVR_PLL_CTRL0_PWP			BIT(14)
+#define FSL_XCVR_PLL_CTRL0_CM0_EN		BIT(24)
+#define FSL_XCVR_PLL_CTRL0_CM1_EN		BIT(25)
+#define FSL_XCVR_PLL_CTRL0_CM2_EN		BIT(26)
+#define FSL_XCVR_PLL_PDIVx(v, i)		((v & 0x7) << (4 * i))
+
+#define FSL_XCVR_PHY_CTRL_PHY_EN		BIT(0)
+#define FSL_XCVR_PHY_CTRL_RX_CM_EN		BIT(1)
+#define FSL_XCVR_PHY_CTRL_TSDIFF_OE		BIT(5)
+#define FSL_XCVR_PHY_CTRL_SPDIF_EN		BIT(8)
+#define FSL_XCVR_PHY_CTRL_ARC_MODE_SE_EN	BIT(9)
+#define FSL_XCVR_PHY_CTRL_ARC_MODE_CM_EN	BIT(10)
+#define FSL_XCVR_PHY_CTRL_TX_CLK_MASK		GENMASK(26, 25)
+#define FSL_XCVR_PHY_CTRL_TX_CLK_HDMI_SS	BIT(25)
+#define FSL_XCVR_PHY_CTRL_TX_CLK_AUD_SS		BIT(26)
+#define FSL_XCVR_PHY_CTRL2_EARC_TXMS		BIT(14)
+
+#define FSL_XCVR_CS_DATA_0_FS_MASK		GENMASK(31, 24)
+#define FSL_XCVR_CS_DATA_0_FS_32000		0x3000000
+#define FSL_XCVR_CS_DATA_0_FS_44100		0x0000000
+#define FSL_XCVR_CS_DATA_0_FS_48000		0x2000000
+#define FSL_XCVR_CS_DATA_0_FS_64000		0xB000000
+#define FSL_XCVR_CS_DATA_0_FS_88200		0x8000000
+#define FSL_XCVR_CS_DATA_0_FS_96000		0xA000000
+#define FSL_XCVR_CS_DATA_0_FS_176400		0xC000000
+#define FSL_XCVR_CS_DATA_0_FS_192000		0xE000000
+
+#define FSL_XCVR_CS_DATA_0_CH_MASK		0x3A
+#define FSL_XCVR_CS_DATA_0_CH_U2LPCM		0x00
+#define FSL_XCVR_CS_DATA_0_CH_UMLPCM		0x20
+#define FSL_XCVR_CS_DATA_0_CH_U1BAUD		0x30
+
+#define FSL_XCVR_CS_DATA_1_CH_MASK		0xF000
+#define FSL_XCVR_CS_DATA_1_CH_2			0x0000
+#define FSL_XCVR_CS_DATA_1_CH_8			0x7000
+#define FSL_XCVR_CS_DATA_1_CH_16		0xB000
+#define FSL_XCVR_CS_DATA_1_CH_32		0x3000
+
+/* Data memory structures */
+#define FSL_XCVR_RX_CS_CTRL_0		0x20 /* First  RX CS control register */
+#define FSL_XCVR_RX_CS_CTRL_1		0x24 /* Second RX CS control register */
+#define FSL_XCVR_RX_CS_BUFF_0		0x80 /* First  RX CS buffer */
+#define FSL_XCVR_RX_CS_BUFF_1		0xA0 /* Second RX CS buffer */
+#define FSL_XCVR_CAP_DATA_STR		0x300 /* Capabilities data structure */
+
+#endif /* __FSL_XCVR_H */
-- 
2.26.2

