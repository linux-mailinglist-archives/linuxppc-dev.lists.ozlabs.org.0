Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D8632491A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:06:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmHkm3QJpz3dHH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:06:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmHj43ZJ0z3cFx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:05:28 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 374EF1A05D3;
 Thu, 25 Feb 2021 04:05:26 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5EE241A0628;
 Thu, 25 Feb 2021 04:05:19 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 26AEE4032B;
 Thu, 25 Feb 2021 04:05:11 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 4/7] ASoC: imx-audio-rpmsg: Add rpmsg_driver for audio
 channel
Date: Thu, 25 Feb 2021 10:52:40 +0800
Message-Id: <1614221563-26822-5-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614221563-26822-1-git-send-email-shengjiu.wang@nxp.com>
References: <1614221563-26822-1-git-send-email-shengjiu.wang@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver is used to accept the message from rpmsg audio
channel, and if this driver is probed, it will help to register
the platform driver, the platform driver will use this
audio channel to send and receive message to and from Cortex-M
core.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig           |   4 +
 sound/soc/fsl/Makefile          |   1 +
 sound/soc/fsl/imx-audio-rpmsg.c | 151 ++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 sound/soc/fsl/imx-audio-rpmsg.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index a688c3c2efbc..84d9f0f1f75b 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -126,6 +126,10 @@ config SND_SOC_IMX_PCM_DMA
 	tristate
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 
+config SND_SOC_IMX_AUDIO_RPMSG
+	tristate
+	depends on RPMSG
+
 config SND_SOC_IMX_AUDMUX
 	tristate "Digital Audio Mux module support"
 	help
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index b63802f345cc..f08f3cd07ff5 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_SND_SOC_IMX_AUDMUX) += snd-soc-imx-audmux.o
 
 obj-$(CONFIG_SND_SOC_IMX_PCM_FIQ) += imx-pcm-fiq.o
 obj-$(CONFIG_SND_SOC_IMX_PCM_DMA) += imx-pcm-dma.o
+obj-$(CONFIG_SND_SOC_IMX_AUDIO_RPMSG) += imx-audio-rpmsg.o
 
 # i.MX Machine Support
 snd-soc-eukrea-tlv320-objs := eukrea-tlv320.o
diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
new file mode 100644
index 000000000000..145edb1492b4
--- /dev/null
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2017-2020 NXP
+
+#include <linux/module.h>
+#include <linux/rpmsg.h>
+#include "imx-pcm-rpmsg.h"
+
+/*
+ * struct imx_audio_rpmsg: private data
+ *
+ * @rpmsg_pdev: pointer of platform device
+ */
+struct imx_audio_rpmsg {
+	struct platform_device *rpmsg_pdev;
+};
+
+static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
+			      void *priv, u32 src)
+{
+	struct imx_audio_rpmsg *rpmsg = dev_get_drvdata(&rpdev->dev);
+	struct rpmsg_info *info = platform_get_drvdata(rpmsg->rpmsg_pdev);
+	struct rpmsg_r_msg *r_msg = (struct rpmsg_r_msg *)data;
+	struct rpmsg_msg *msg;
+	unsigned long flags;
+
+	dev_dbg(&rpdev->dev, "get from%d: cmd:%d. %d\n",
+		src, r_msg->header.cmd, r_msg->param.resp);
+
+	switch (r_msg->header.type) {
+	case MSG_TYPE_C:
+		/* TYPE C is notification from M core */
+		switch (r_msg->header.cmd) {
+		case TX_PERIOD_DONE:
+			spin_lock_irqsave(&info->lock[TX], flags);
+			msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
+
+			/*
+			 * Low power mode: get the buffer pointer from
+			 * receive msg.
+			 */
+			if (r_msg->header.major == 1 &&
+			    r_msg->header.minor == 2)
+				msg->r_msg.param.buffer_tail =
+						r_msg->param.buffer_tail;
+			else
+				msg->r_msg.param.buffer_tail++;
+
+			msg->r_msg.param.buffer_tail %= info->num_period[TX];
+			spin_unlock_irqrestore(&info->lock[TX], flags);
+			info->callback[TX](info->callback_param[TX]);
+			break;
+		case RX_PERIOD_DONE:
+			spin_lock_irqsave(&info->lock[RX], flags);
+			msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
+
+			if (r_msg->header.major == 1 &&
+			    r_msg->header.minor == 2)
+				msg->r_msg.param.buffer_tail =
+						r_msg->param.buffer_tail;
+			else
+				msg->r_msg.param.buffer_tail++;
+
+			msg->r_msg.param.buffer_tail %= info->num_period[1];
+			spin_unlock_irqrestore(&info->lock[RX], flags);
+			info->callback[RX](info->callback_param[RX]);
+			break;
+		default:
+			dev_warn(&rpdev->dev, "unknown msg command\n");
+			break;
+		}
+		break;
+	case MSG_TYPE_B:
+		/* TYPE B is response msg */
+		memcpy(&info->r_msg, r_msg, sizeof(struct rpmsg_r_msg));
+		complete(&info->cmd_complete);
+		break;
+	default:
+		dev_warn(&rpdev->dev, "unknown msg type\n");
+		break;
+	}
+
+	return 0;
+}
+
+static int imx_audio_rpmsg_probe(struct rpmsg_device *rpdev)
+{
+	struct imx_audio_rpmsg *data;
+	int ret = 0;
+
+	dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
+		 rpdev->src, rpdev->dst);
+
+	data = devm_kzalloc(&rpdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	dev_set_drvdata(&rpdev->dev, data);
+
+	/* Register platform driver for rpmsg routine */
+	data->rpmsg_pdev = platform_device_register_data(&rpdev->dev,
+							 IMX_PCM_DRV_NAME,
+							 PLATFORM_DEVID_NONE,
+							 NULL, 0);
+	if (IS_ERR(data->rpmsg_pdev)) {
+		dev_err(&rpdev->dev, "failed to register rpmsg platform.\n");
+		ret = PTR_ERR(data->rpmsg_pdev);
+	}
+
+	return ret;
+}
+
+static void imx_audio_rpmsg_remove(struct rpmsg_device *rpdev)
+{
+	struct imx_audio_rpmsg *data = dev_get_drvdata(&rpdev->dev);
+
+	if (data->rpmsg_pdev)
+		platform_device_unregister(data->rpmsg_pdev);
+
+	dev_info(&rpdev->dev, "audio rpmsg driver is removed\n");
+}
+
+static struct rpmsg_device_id imx_audio_rpmsg_id_table[] = {
+	{ .name	= "rpmsg-audio-channel" },
+	{ },
+};
+
+static struct rpmsg_driver imx_audio_rpmsg_driver = {
+	.drv.name	= "imx_audio_rpmsg",
+	.drv.owner	= THIS_MODULE,
+	.id_table	= imx_audio_rpmsg_id_table,
+	.probe		= imx_audio_rpmsg_probe,
+	.callback	= imx_audio_rpmsg_cb,
+	.remove		= imx_audio_rpmsg_remove,
+};
+
+static int __init imx_audio_rpmsg_init(void)
+{
+	return register_rpmsg_driver(&imx_audio_rpmsg_driver);
+}
+
+static void __exit imx_audio_rpmsg_exit(void)
+{
+	unregister_rpmsg_driver(&imx_audio_rpmsg_driver);
+}
+module_init(imx_audio_rpmsg_init);
+module_exit(imx_audio_rpmsg_exit);
+
+MODULE_DESCRIPTION("Freescale SoC Audio RPMSG interface");
+MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
+MODULE_ALIAS("platform:imx_audio_rpmsg");
+MODULE_LICENSE("GPL v2");
-- 
2.27.0

