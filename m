Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 548667AAC1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:12:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dMG1fgeA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsQ4H1dThz3hp1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:12:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dMG1fgeA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsPnX4Q6Mz3fcB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:00:00 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id C549D1BF212;
	Fri, 22 Sep 2023 07:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695369598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k9NqSOYILPZgbeylDC10IPY//ple7zsTiiFeeN2By68=;
	b=dMG1fgeAmmkBF6eU9Md+NUXL3Y9QGRqy0PZuej7AmvuyiLxzz3gi3ouM4rT4aBicra/jXK
	pkmWkvwbiy+Y9rm4OXXTfHm2n0ZXEHcyg/hAsaChxuqEPcricULKz2hhLAGrFumgWB844G
	B5NqDiQyYzlvFzV5OSLlKGsnKdsDe/s35RliCsFO14aAwe84Exas7MREuRg0IwgeY5NOWw
	KOXnpboqH54pBDmyQXlo/IH+XB03H22UdFOgClyxJjONtpvN3zPT2HYtDv3ekBHP8zHBOE
	IDsVVgZe08Oky5xKJD0iT9nMY5Th95CYD7SSiO/Y9x0TvfxxX6HdDLOcKfnrPw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v6 10/30] net: wan: Add support for QMC HDLC
Date: Fri, 22 Sep 2023 09:58:45 +0200
Message-ID: <20230922075913.422435-11-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922075913.422435-1-herve.codina@bootlin.com>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The QMC HDLC driver provides support for HDLC using the QMC (QUICC
Multichannel Controller) to transfer the HDLC data.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/net/wan/Kconfig        |  12 +
 drivers/net/wan/Makefile       |   1 +
 drivers/net/wan/fsl_qmc_hdlc.c | 422 +++++++++++++++++++++++++++++++++
 3 files changed, 435 insertions(+)
 create mode 100644 drivers/net/wan/fsl_qmc_hdlc.c

diff --git a/drivers/net/wan/Kconfig b/drivers/net/wan/Kconfig
index dcb069dde66b..8de99f4b647b 100644
--- a/drivers/net/wan/Kconfig
+++ b/drivers/net/wan/Kconfig
@@ -195,6 +195,18 @@ config FARSYNC
 	  To compile this driver as a module, choose M here: the
 	  module will be called farsync.
 
+config FSL_QMC_HDLC
+	tristate "Freescale QMC HDLC support"
+	depends on HDLC
+	depends on CPM_QMC
+	help
+	  HDLC support using the Freescale QUICC Multichannel Controller (QMC).
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called fsl_qmc_hdlc.
+
+	  If unsure, say N.
+
 config FSL_UCC_HDLC
 	tristate "Freescale QUICC Engine HDLC support"
 	depends on HDLC
diff --git a/drivers/net/wan/Makefile b/drivers/net/wan/Makefile
index 5bec8fae47f8..f338f4830626 100644
--- a/drivers/net/wan/Makefile
+++ b/drivers/net/wan/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_WANXL)		+= wanxl.o
 obj-$(CONFIG_PCI200SYN)		+= pci200syn.o
 obj-$(CONFIG_PC300TOO)		+= pc300too.o
 obj-$(CONFIG_IXP4XX_HSS)	+= ixp4xx_hss.o
+obj-$(CONFIG_FSL_QMC_HDLC)	+= fsl_qmc_hdlc.o
 obj-$(CONFIG_FSL_UCC_HDLC)	+= fsl_ucc_hdlc.o
 obj-$(CONFIG_SLIC_DS26522)	+= slic_ds26522.o
 
diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
new file mode 100644
index 000000000000..15e102547ff2
--- /dev/null
+++ b/drivers/net/wan/fsl_qmc_hdlc.c
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Freescale QMC HDLC Device Driver
+ *
+ * Copyright 2023 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/hdlc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <soc/fsl/qe/qmc.h>
+
+struct qmc_hdlc_desc {
+	struct net_device *netdev;
+	struct sk_buff *skb; /* NULL if the descriptor is not in use */
+	dma_addr_t dma_addr;
+	size_t dma_size;
+};
+
+struct qmc_hdlc {
+	struct device *dev;
+	struct qmc_chan *qmc_chan;
+	struct net_device *netdev;
+	bool is_crc32;
+	spinlock_t tx_lock; /* Protect tx descriptors */
+	struct qmc_hdlc_desc tx_descs[8];
+	unsigned int tx_out;
+	struct qmc_hdlc_desc rx_descs[4];
+};
+
+static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
+{
+	return dev_to_hdlc(netdev)->priv;
+}
+
+static int qmc_hdlc_recv_queue(struct qmc_hdlc *qmc_hdlc, struct qmc_hdlc_desc *desc, size_t size);
+
+#define QMC_HDLC_RX_ERROR_FLAGS (QMC_RX_FLAG_HDLC_OVF | \
+				 QMC_RX_FLAG_HDLC_UNA | \
+				 QMC_RX_FLAG_HDLC_ABORT | \
+				 QMC_RX_FLAG_HDLC_CRC)
+
+static void qmc_hcld_recv_complete(void *context, size_t length, unsigned int flags)
+{
+	struct qmc_hdlc_desc *desc = context;
+	struct net_device *netdev = desc->netdev;
+	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(desc->netdev);
+	int ret;
+
+	dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size, DMA_FROM_DEVICE);
+
+	if (flags & QMC_HDLC_RX_ERROR_FLAGS) {
+		netdev->stats.rx_errors++;
+		if (flags & QMC_RX_FLAG_HDLC_OVF) /* Data overflow */
+			netdev->stats.rx_over_errors++;
+		if (flags & QMC_RX_FLAG_HDLC_UNA) /* bits received not multiple of 8 */
+			netdev->stats.rx_frame_errors++;
+		if (flags & QMC_RX_FLAG_HDLC_ABORT) /* Received an abort sequence */
+			netdev->stats.rx_frame_errors++;
+		if (flags & QMC_RX_FLAG_HDLC_CRC) /* CRC error */
+			netdev->stats.rx_crc_errors++;
+		kfree_skb(desc->skb);
+	} else {
+		netdev->stats.rx_packets++;
+		netdev->stats.rx_bytes += length;
+
+		skb_put(desc->skb, length);
+		desc->skb->protocol = hdlc_type_trans(desc->skb, netdev);
+		netif_rx(desc->skb);
+	}
+
+	/* Re-queue a transfer using the same descriptor */
+	ret = qmc_hdlc_recv_queue(qmc_hdlc, desc, desc->dma_size);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "queue recv desc failed (%d)\n", ret);
+		netdev->stats.rx_errors++;
+	}
+}
+
+static int qmc_hdlc_recv_queue(struct qmc_hdlc *qmc_hdlc, struct qmc_hdlc_desc *desc, size_t size)
+{
+	int ret;
+
+	desc->skb = dev_alloc_skb(size);
+	if (!desc->skb)
+		return -ENOMEM;
+
+	desc->dma_size = size;
+	desc->dma_addr = dma_map_single(qmc_hdlc->dev, desc->skb->data,
+					desc->dma_size, DMA_FROM_DEVICE);
+	ret = dma_mapping_error(qmc_hdlc->dev, desc->dma_addr);
+	if (ret)
+		goto free_skb;
+
+	ret = qmc_chan_read_submit(qmc_hdlc->qmc_chan, desc->dma_addr, desc->dma_size,
+				   qmc_hcld_recv_complete, desc);
+	if (ret)
+		goto dma_unmap;
+
+	return 0;
+
+dma_unmap:
+	dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size, DMA_FROM_DEVICE);
+free_skb:
+	kfree_skb(desc->skb);
+	desc->skb = NULL;
+	return ret;
+}
+
+static void qmc_hdlc_xmit_complete(void *context)
+{
+	struct qmc_hdlc_desc *desc = context;
+	struct net_device *netdev = desc->netdev;
+	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
+	struct sk_buff *skb;
+	unsigned long flags;
+
+	spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);
+	dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size, DMA_TO_DEVICE);
+	skb = desc->skb;
+	desc->skb = NULL; /* Release the descriptor */
+	if (netif_queue_stopped(netdev))
+		netif_wake_queue(netdev);
+	spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
+
+	netdev->stats.tx_packets++;
+	netdev->stats.tx_bytes += skb->len;
+
+	dev_consume_skb_any(skb);
+}
+
+static int qmc_hdlc_xmit_queue(struct qmc_hdlc *qmc_hdlc, struct qmc_hdlc_desc *desc)
+{
+	int ret;
+
+	desc->dma_addr = dma_map_single(qmc_hdlc->dev, desc->skb->data,
+					desc->dma_size, DMA_TO_DEVICE);
+	ret = dma_mapping_error(qmc_hdlc->dev, desc->dma_addr);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "failed to map skb\n");
+		return ret;
+	}
+
+	ret = qmc_chan_write_submit(qmc_hdlc->qmc_chan, desc->dma_addr, desc->dma_size,
+				    qmc_hdlc_xmit_complete, desc);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "qmc chan write returns %d\n", ret);
+		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size, DMA_TO_DEVICE);
+		return ret;
+	}
+
+	return 0;
+}
+
+static netdev_tx_t qmc_hdlc_xmit(struct sk_buff *skb, struct net_device *netdev)
+{
+	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
+	struct qmc_hdlc_desc *desc;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);
+	desc = &qmc_hdlc->tx_descs[qmc_hdlc->tx_out];
+	if (desc->skb) {
+		/* Should never happen.
+		 * Previous xmit should have already stopped the queue.
+		 */
+		netif_stop_queue(netdev);
+		spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
+		return NETDEV_TX_BUSY;
+	}
+	spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
+
+	desc->netdev = netdev;
+	desc->dma_size = skb->len;
+	desc->skb = skb;
+	ret = qmc_hdlc_xmit_queue(qmc_hdlc, desc);
+	if (ret) {
+		desc->skb = NULL; /* Release the descriptor */
+		if (ret == -EBUSY) {
+			netif_stop_queue(netdev);
+			return NETDEV_TX_BUSY;
+		}
+		dev_kfree_skb(skb);
+		netdev->stats.tx_dropped++;
+		return NETDEV_TX_OK;
+	}
+
+	qmc_hdlc->tx_out = (qmc_hdlc->tx_out + 1) % ARRAY_SIZE(qmc_hdlc->tx_descs);
+
+	spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);
+	if (qmc_hdlc->tx_descs[qmc_hdlc->tx_out].skb)
+		netif_stop_queue(netdev);
+	spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
+
+	return NETDEV_TX_OK;
+}
+
+static int qmc_hdlc_open(struct net_device *netdev)
+{
+	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
+	struct qmc_chan_param chan_param;
+	struct qmc_hdlc_desc *desc;
+	int ret;
+	int i;
+
+	ret = hdlc_open(netdev);
+	if (ret)
+		return ret;
+
+	chan_param.mode = QMC_HDLC;
+	/* HDLC_MAX_MRU + 4 for the CRC
+	 * HDLC_MAX_MRU + 4 + 8 for the CRC and some extraspace needed by the QMC
+	 */
+	chan_param.hdlc.max_rx_buf_size = HDLC_MAX_MRU + 4 + 8;
+	chan_param.hdlc.max_rx_frame_size = HDLC_MAX_MRU + 4;
+	chan_param.hdlc.is_crc32 = qmc_hdlc->is_crc32;
+	ret = qmc_chan_set_param(qmc_hdlc->qmc_chan, &chan_param);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "failed to set param (%d)\n", ret);
+		goto hdlc_close;
+	}
+
+	/* Queue as many recv descriptors as possible */
+	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->rx_descs); i++) {
+		desc = &qmc_hdlc->rx_descs[i];
+
+		desc->netdev = netdev;
+		ret = qmc_hdlc_recv_queue(qmc_hdlc, desc, chan_param.hdlc.max_rx_buf_size);
+		if (ret) {
+			if (ret == -EBUSY && i != 0)
+				break; /* We use all the QMC chan capability */
+			goto free_desc;
+		}
+	}
+
+	ret = qmc_chan_start(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "qmc chan start failed (%d)\n", ret);
+		goto free_desc;
+	}
+
+	netif_start_queue(netdev);
+
+	return 0;
+
+free_desc:
+	qmc_chan_reset(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);
+	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->rx_descs); i++) {
+		desc = &qmc_hdlc->rx_descs[i];
+		if (!desc->skb)
+			continue;
+		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
+				 DMA_FROM_DEVICE);
+		kfree_skb(desc->skb);
+		desc->skb = NULL;
+	}
+hdlc_close:
+	hdlc_close(netdev);
+	return ret;
+}
+
+static int qmc_hdlc_close(struct net_device *netdev)
+{
+	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
+	struct qmc_hdlc_desc *desc;
+	int i;
+
+	netif_stop_queue(netdev);
+
+	qmc_chan_stop(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);
+	qmc_chan_reset(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);
+
+	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->tx_descs); i++) {
+		desc = &qmc_hdlc->tx_descs[i];
+		if (!desc->skb)
+			continue;
+		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
+				 DMA_TO_DEVICE);
+		kfree_skb(desc->skb);
+		desc->skb = NULL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->rx_descs); i++) {
+		desc = &qmc_hdlc->rx_descs[i];
+		if (!desc->skb)
+			continue;
+		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
+				 DMA_FROM_DEVICE);
+		kfree_skb(desc->skb);
+		desc->skb = NULL;
+	}
+
+	hdlc_close(netdev);
+	return 0;
+}
+
+static int qmc_hdlc_attach(struct net_device *netdev, unsigned short encoding,
+			   unsigned short parity)
+{
+	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
+
+	if (encoding != ENCODING_NRZ)
+		return -EINVAL;
+
+	switch (parity) {
+	case PARITY_CRC16_PR1_CCITT:
+		qmc_hdlc->is_crc32 = false;
+		break;
+	case PARITY_CRC32_PR1_CCITT:
+		qmc_hdlc->is_crc32 = true;
+		break;
+	default:
+		dev_err(qmc_hdlc->dev, "unsupported parity %u\n", parity);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct net_device_ops qmc_hdlc_netdev_ops = {
+	.ndo_open       = qmc_hdlc_open,
+	.ndo_stop       = qmc_hdlc_close,
+	.ndo_start_xmit = hdlc_start_xmit,
+	.ndo_siocwandev	= hdlc_ioctl,
+};
+
+static int qmc_hdlc_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct qmc_hdlc *qmc_hdlc;
+	struct qmc_chan_info info;
+	hdlc_device *hdlc;
+	int ret;
+
+	qmc_hdlc = devm_kzalloc(&pdev->dev, sizeof(*qmc_hdlc), GFP_KERNEL);
+	if (!qmc_hdlc)
+		return -ENOMEM;
+
+	qmc_hdlc->dev = &pdev->dev;
+	spin_lock_init(&qmc_hdlc->tx_lock);
+
+	qmc_hdlc->qmc_chan = devm_qmc_chan_get_bychild(qmc_hdlc->dev, np);
+	if (IS_ERR(qmc_hdlc->qmc_chan)) {
+		ret = PTR_ERR(qmc_hdlc->qmc_chan);
+		return dev_err_probe(qmc_hdlc->dev, ret, "get QMC channel failed\n");
+	}
+
+	ret = qmc_chan_get_info(qmc_hdlc->qmc_chan, &info);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "get QMC channel info failed %d\n", ret);
+		return ret;
+	}
+
+	if (info.mode != QMC_HDLC) {
+		dev_err(qmc_hdlc->dev, "QMC chan mode %d is not QMC_HDLC\n",
+			info.mode);
+		return -EINVAL;
+	}
+
+	qmc_hdlc->netdev = alloc_hdlcdev(qmc_hdlc);
+	if (!qmc_hdlc->netdev) {
+		dev_err(qmc_hdlc->dev, "failed to alloc hdlc dev\n");
+		return -ENOMEM;
+	}
+
+	hdlc = dev_to_hdlc(qmc_hdlc->netdev);
+	hdlc->attach = qmc_hdlc_attach;
+	hdlc->xmit = qmc_hdlc_xmit;
+	SET_NETDEV_DEV(qmc_hdlc->netdev, qmc_hdlc->dev);
+	qmc_hdlc->netdev->tx_queue_len = ARRAY_SIZE(qmc_hdlc->tx_descs);
+	qmc_hdlc->netdev->netdev_ops = &qmc_hdlc_netdev_ops;
+	ret = register_hdlc_device(qmc_hdlc->netdev);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "failed to register hdlc device (%d)\n", ret);
+		goto free_netdev;
+	}
+
+	platform_set_drvdata(pdev, qmc_hdlc);
+
+	return 0;
+
+free_netdev:
+	free_netdev(qmc_hdlc->netdev);
+	return ret;
+}
+
+static int qmc_hdlc_remove(struct platform_device *pdev)
+{
+	struct qmc_hdlc *qmc_hdlc = platform_get_drvdata(pdev);
+
+	unregister_hdlc_device(qmc_hdlc->netdev);
+	free_netdev(qmc_hdlc->netdev);
+
+	return 0;
+}
+
+static const struct of_device_id qmc_hdlc_id_table[] = {
+	{ .compatible = "fsl,qmc-hdlc" },
+	{} /* sentinel */
+};
+MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);
+
+static struct platform_driver qmc_hdlc_driver = {
+	.driver = {
+		.name = "fsl-qmc-hdlc",
+		.of_match_table = qmc_hdlc_id_table,
+	},
+	.probe = qmc_hdlc_probe,
+	.remove = qmc_hdlc_remove,
+};
+module_platform_driver(qmc_hdlc_driver);
+
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
+MODULE_DESCRIPTION("QMC HDLC driver");
+MODULE_LICENSE("GPL");
-- 
2.41.0

