Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B1569963F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 14:48:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHbrc1dKwz3chr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 00:48:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=UAyzBffj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=UAyzBffj;
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHbjt0B5nz3f4n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 00:42:57 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id DB58220007;
	Thu, 16 Feb 2023 13:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676554975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGbw5VWb9pOUdXidnuoej79Y2m/jWTBSJO90kAAnSTI=;
	b=UAyzBffjxlqpWDR+2vQN6cVVImIanR16Dd7vH+9IyHAm73omGxzXM0bfPN4T/ELabaNNun
	7b5kUOtlvG+VlYiXXskfIDyyMtpQlL32u7uLgEAHNhD0yv6dM6jNBTJnvwYXeIHF2HICqj
	JYFyDw7ZevW0yotLwKVGAvghvFcGm8NBjm3cxHklJIgG3pWfx9WKJzcet9XZSA9JKxZ4mA
	rP0eAPIWdsRHjjHCFwHlozOnqCrdr4Z3vVK84XD+n7joVoTI+8xaDbmjaZ1mwQ7gie80Ys
	8HeOzZaP968RTl0QzOj7geQQwUYztceGHPEvgxAMD00MCa6PhjMMP5mdszalJA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v5 06/10] soc: fsl: cpm1: Add support for QMC
Date: Thu, 16 Feb 2023 14:42:22 +0100
Message-Id: <20230216134226.1692107-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216134226.1692107-1-herve.codina@bootlin.com>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The QMC (QUICC Multichannel Controller) emulates up to 64
channels within one serial controller using the same TDM
physical interface routed from the TSA.

It is available in some	PowerQUICC SoC such as the
MPC885 or MPC866.

It is also available on some Quicc Engine SoCs.
This current version support CPM1 SoCs only and some
enhancement are needed to support Quicc Engine SoCs.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/soc/fsl/qe/Kconfig  |   12 +
 drivers/soc/fsl/qe/Makefile |    1 +
 drivers/soc/fsl/qe/qmc.c    | 1533 +++++++++++++++++++++++++++++++++++
 include/soc/fsl/qe/qmc.h    |   71 ++
 4 files changed, 1617 insertions(+)
 create mode 100644 drivers/soc/fsl/qe/qmc.c
 create mode 100644 include/soc/fsl/qe/qmc.h

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index b0088495c323..f90cfdf0c763 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -44,6 +44,18 @@ config CPM_TSA
 	  This option enables support for this
 	  controller
 
+config CPM_QMC
+	tristate "CPM QMC support"
+	depends on OF && HAS_IOMEM
+	depends on CPM1 || (SOC_FSL && COMPILE_TEST)
+	depends on CPM_TSA
+	help
+	  Freescale CPM QUICC Multichannel Controller
+	  (QMC)
+
+	  This option enables support for this
+	  controller
+
 config QE_TDM
 	bool
 	default y if FSL_UCC_HDLC
diff --git a/drivers/soc/fsl/qe/Makefile b/drivers/soc/fsl/qe/Makefile
index 45c961acc81b..ec8506e13113 100644
--- a/drivers/soc/fsl/qe/Makefile
+++ b/drivers/soc/fsl/qe/Makefile
@@ -5,6 +5,7 @@
 obj-$(CONFIG_QUICC_ENGINE)+= qe.o qe_common.o qe_ic.o qe_io.o
 obj-$(CONFIG_CPM)	+= qe_common.o
 obj-$(CONFIG_CPM_TSA)	+= tsa.o
+obj-$(CONFIG_CPM_QMC)	+= qmc.o
 obj-$(CONFIG_UCC)	+= ucc.o
 obj-$(CONFIG_UCC_SLOW)	+= ucc_slow.o
 obj-$(CONFIG_UCC_FAST)	+= ucc_fast.o
diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
new file mode 100644
index 000000000000..cfa7207353e0
--- /dev/null
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -0,0 +1,1533 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * QMC driver
+ *
+ * Copyright 2022 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <soc/fsl/qe/qmc.h>
+#include <linux/dma-mapping.h>
+#include <linux/hdlc.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <soc/fsl/cpm.h>
+#include <sysdev/fsl_soc.h>
+#include "tsa.h"
+
+/* SCC general mode register high (32 bits) */
+#define SCC_GSMRL	0x00
+#define SCC_GSMRL_ENR		(1 << 5)
+#define SCC_GSMRL_ENT		(1 << 4)
+#define SCC_GSMRL_MODE_QMC	(0x0A << 0)
+
+/* SCC general mode register low (32 bits) */
+#define SCC_GSMRH	0x04
+#define   SCC_GSMRH_CTSS	(1 << 7)
+#define   SCC_GSMRH_CDS		(1 << 8)
+#define   SCC_GSMRH_CTSP	(1 << 9)
+#define   SCC_GSMRH_CDP		(1 << 10)
+
+/* SCC event register (16 bits) */
+#define SCC_SCCE	0x10
+#define   SCC_SCCE_IQOV		(1 << 3)
+#define   SCC_SCCE_GINT		(1 << 2)
+#define   SCC_SCCE_GUN		(1 << 1)
+#define   SCC_SCCE_GOV		(1 << 0)
+
+/* SCC mask register (16 bits) */
+#define SCC_SCCM	0x14
+/* Multichannel base pointer (32 bits) */
+#define QMC_GBL_MCBASE		0x00
+/* Multichannel controller state (16 bits) */
+#define QMC_GBL_QMCSTATE	0x04
+/* Maximum receive buffer length (16 bits) */
+#define QMC_GBL_MRBLR		0x06
+/* Tx time-slot assignment table pointer (16 bits) */
+#define QMC_GBL_TX_S_PTR	0x08
+/* Rx pointer (16 bits) */
+#define QMC_GBL_RXPTR		0x0A
+/* Global receive frame threshold (16 bits) */
+#define QMC_GBL_GRFTHR		0x0C
+/* Global receive frame count (16 bits) */
+#define QMC_GBL_GRFCNT		0x0E
+/* Multichannel interrupt base address (32 bits) */
+#define QMC_GBL_INTBASE		0x10
+/* Multichannel interrupt pointer (32 bits) */
+#define QMC_GBL_INTPTR		0x14
+/* Rx time-slot assignment table pointer (16 bits) */
+#define QMC_GBL_RX_S_PTR	0x18
+/* Tx pointer (16 bits) */
+#define QMC_GBL_TXPTR		0x1A
+/* CRC constant (32 bits) */
+#define QMC_GBL_C_MASK32	0x1C
+/* Time slot assignment table Rx (32 x 16 bits) */
+#define QMC_GBL_TSATRX		0x20
+/* Time slot assignment table Tx (32 x 16 bits) */
+#define QMC_GBL_TSATTX		0x60
+/* CRC constant (16 bits) */
+#define QMC_GBL_C_MASK16	0xA0
+
+/* TSA entry (16bit entry in TSATRX and TSATTX) */
+#define QMC_TSA_VALID		(1 << 15)
+#define QMC_TSA_WRAP		(1 << 14)
+#define QMC_TSA_MASK		(0x303F)
+#define QMC_TSA_CHANNEL(x)	((x) << 6)
+
+/* Tx buffer descriptor base address (16 bits, offset from MCBASE) */
+#define QMC_SPE_TBASE	0x00
+
+/* Channel mode register (16 bits) */
+#define QMC_SPE_CHAMR	0x02
+#define   QMC_SPE_CHAMR_MODE_HDLC	(1 << 15)
+#define   QMC_SPE_CHAMR_MODE_TRANSP	((0 << 15) | (1 << 13))
+#define   QMC_SPE_CHAMR_ENT		(1 << 12)
+#define   QMC_SPE_CHAMR_POL		(1 << 8)
+#define   QMC_SPE_CHAMR_HDLC_IDLM	(1 << 13)
+#define   QMC_SPE_CHAMR_HDLC_CRC	(1 << 7)
+#define   QMC_SPE_CHAMR_HDLC_NOF	(0x0f << 0)
+#define   QMC_SPE_CHAMR_TRANSP_RD	(1 << 14)
+#define   QMC_SPE_CHAMR_TRANSP_SYNC	(1 << 10)
+
+/* Tx internal state (32 bits) */
+#define QMC_SPE_TSTATE	0x04
+/* Tx buffer descriptor pointer (16 bits) */
+#define QMC_SPE_TBPTR	0x0C
+/* Zero-insertion state (32 bits) */
+#define QMC_SPE_ZISTATE	0x14
+/* Channel’s interrupt mask flags (16 bits) */
+#define QMC_SPE_INTMSK	0x1C
+/* Rx buffer descriptor base address (16 bits, offset from MCBASE) */
+#define QMC_SPE_RBASE	0x20
+/* HDLC: Maximum frame length register (16 bits) */
+#define QMC_SPE_MFLR	0x22
+/* TRANSPARENT: Transparent maximum receive length (16 bits) */
+#define QMC_SPE_TMRBLR	0x22
+/* Rx internal state (32 bits) */
+#define QMC_SPE_RSTATE	0x24
+/* Rx buffer descriptor pointer (16 bits) */
+#define QMC_SPE_RBPTR	0x2C
+/* Packs 4 bytes to 1 long word before writing to buffer (32 bits) */
+#define QMC_SPE_RPACK	0x30
+/* Zero deletion state (32 bits) */
+#define QMC_SPE_ZDSTATE	0x34
+
+/* Transparent synchronization (16 bits) */
+#define QMC_SPE_TRNSYNC 0x3C
+#define   QMC_SPE_TRNSYNC_RX(x)	((x) << 8)
+#define   QMC_SPE_TRNSYNC_TX(x)	((x) << 0)
+
+/* Interrupt related registers bits */
+#define QMC_INT_V		(1 << 15)
+#define QMC_INT_W		(1 << 14)
+#define QMC_INT_NID		(1 << 13)
+#define QMC_INT_IDL		(1 << 12)
+#define QMC_INT_GET_CHANNEL(x)	(((x) & 0x0FC0) >> 6)
+#define QMC_INT_MRF		(1 << 5)
+#define QMC_INT_UN		(1 << 4)
+#define QMC_INT_RXF		(1 << 3)
+#define QMC_INT_BSY		(1 << 2)
+#define QMC_INT_TXB		(1 << 1)
+#define QMC_INT_RXB		(1 << 0)
+
+/* BD related registers bits */
+#define QMC_BD_RX_E	(1 << 15)
+#define QMC_BD_RX_W	(1 << 13)
+#define QMC_BD_RX_I	(1 << 12)
+#define QMC_BD_RX_L	(1 << 11)
+#define QMC_BD_RX_F	(1 << 10)
+#define QMC_BD_RX_CM	(1 << 9)
+#define QMC_BD_RX_UB	(1 << 7)
+#define QMC_BD_RX_LG	(1 << 5)
+#define QMC_BD_RX_NO	(1 << 4)
+#define QMC_BD_RX_AB	(1 << 3)
+#define QMC_BD_RX_CR	(1 << 2)
+
+#define QMC_BD_TX_R	(1 << 15)
+#define QMC_BD_TX_W	(1 << 13)
+#define QMC_BD_TX_I	(1 << 12)
+#define QMC_BD_TX_L	(1 << 11)
+#define QMC_BD_TX_TC	(1 << 10)
+#define QMC_BD_TX_CM	(1 << 9)
+#define QMC_BD_TX_UB	(1 << 7)
+#define QMC_BD_TX_PAD	(0x0f << 0)
+
+/* Numbers of BDs and interrupt items */
+#define QMC_NB_TXBDS	8
+#define QMC_NB_RXBDS	8
+#define QMC_NB_INTS	128
+
+struct qmc_xfer_desc {
+	union {
+		void (*tx_complete)(void *context);
+		void (*rx_complete)(void *context, size_t length);
+	};
+	void *context;
+};
+
+struct qmc_chan {
+	struct list_head list;
+	unsigned int id;
+	struct qmc *qmc;
+	void *__iomem s_param;
+	enum qmc_mode mode;
+	u64	tx_ts_mask;
+	u64	rx_ts_mask;
+	bool is_reverse_data;
+
+	spinlock_t	tx_lock;
+	cbd_t __iomem *txbds;
+	cbd_t __iomem *txbd_free;
+	cbd_t __iomem *txbd_done;
+	struct qmc_xfer_desc tx_desc[QMC_NB_TXBDS];
+	u64	nb_tx_underrun;
+	bool	is_tx_stopped;
+
+	spinlock_t	rx_lock;
+	cbd_t __iomem *rxbds;
+	cbd_t __iomem *rxbd_free;
+	cbd_t __iomem *rxbd_done;
+	struct qmc_xfer_desc rx_desc[QMC_NB_RXBDS];
+	u64	nb_rx_busy;
+	int	rx_pending;
+	bool	is_rx_halted;
+	bool	is_rx_stopped;
+};
+
+struct qmc {
+	struct device *dev;
+	struct tsa_serial *tsa_serial;
+	void *__iomem scc_regs;
+	void *__iomem scc_pram;
+	void *__iomem dpram;
+	u16 scc_pram_offset;
+	cbd_t __iomem *bd_table;
+	dma_addr_t bd_dma_addr;
+	size_t bd_size;
+	u16 __iomem *int_table;
+	u16 __iomem *int_curr;
+	dma_addr_t int_dma_addr;
+	size_t int_size;
+	struct list_head chan_head;
+	struct qmc_chan *chans[64];
+};
+
+static inline void qmc_write16(void *__iomem addr, u16 val)
+{
+	iowrite16be(val, addr);
+}
+
+static inline u16 qmc_read16(void *__iomem addr)
+{
+	return ioread16be(addr);
+}
+
+static inline void qmc_setbits16(void *__iomem addr, u16 set)
+{
+	qmc_write16(addr, qmc_read16(addr) | set);
+}
+
+static inline void qmc_clrbits16(void *__iomem addr, u16 clr)
+{
+	qmc_write16(addr, qmc_read16(addr) & ~clr);
+}
+
+static inline void qmc_write32(void *__iomem addr, u32 val)
+{
+	iowrite32be(val, addr);
+}
+
+static inline u32 qmc_read32(void *__iomem addr)
+{
+	return ioread32be(addr);
+}
+
+static inline void qmc_setbits32(void *__iomem addr, u32 set)
+{
+	qmc_write32(addr, qmc_read32(addr) | set);
+}
+
+
+int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
+{
+	struct tsa_serial_info tsa_info;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &tsa_info);
+	if (ret)
+		return ret;
+
+	info->mode = chan->mode;
+	info->rx_fs_rate = tsa_info.rx_fs_rate;
+	info->rx_bit_rate = tsa_info.rx_bit_rate;
+	info->nb_tx_ts = hweight64(chan->tx_ts_mask);
+	info->tx_fs_rate = tsa_info.tx_fs_rate;
+	info->tx_bit_rate = tsa_info.tx_bit_rate;
+	info->nb_rx_ts = hweight64(chan->rx_ts_mask);
+
+	return 0;
+}
+EXPORT_SYMBOL(qmc_chan_get_info);
+
+int qmc_chan_set_param(struct qmc_chan *chan, const struct qmc_chan_param *param)
+{
+	if (param->mode != chan->mode)
+		return -EINVAL;
+
+	switch (param->mode) {
+	case QMC_HDLC:
+		if ((param->hdlc.max_rx_buf_size % 4) ||
+		    (param->hdlc.max_rx_buf_size < 8))
+			return -EINVAL;
+
+		qmc_write16(chan->qmc->scc_pram + QMC_GBL_MRBLR,
+			    param->hdlc.max_rx_buf_size - 8);
+		qmc_write16(chan->s_param + QMC_SPE_MFLR,
+			    param->hdlc.max_rx_frame_size);
+		if (param->hdlc.is_crc32) {
+			qmc_setbits16(chan->s_param + QMC_SPE_CHAMR,
+				      QMC_SPE_CHAMR_HDLC_CRC);
+		} else {
+			qmc_clrbits16(chan->s_param + QMC_SPE_CHAMR,
+				      QMC_SPE_CHAMR_HDLC_CRC);
+		}
+		break;
+
+	case QMC_TRANSPARENT:
+		qmc_write16(chan->s_param + QMC_SPE_TMRBLR,
+			    param->transp.max_rx_buf_size);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(qmc_chan_set_param);
+
+int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
+			  void (*complete)(void *context), void *context)
+{
+	struct qmc_xfer_desc *xfer_desc;
+	unsigned long flags;
+	cbd_t *__iomem bd;
+	u16 ctrl;
+	int ret;
+
+	/*
+	 * R bit  UB bit
+	 *   0       0  : The BD is free
+	 *   1       1  : The BD is in used, waiting for transfer
+	 *   0       1  : The BD is in used, waiting for completion
+	 *   1       0  : Should not append
+	 */
+
+	spin_lock_irqsave(&chan->tx_lock, flags);
+	bd = chan->txbd_free;
+
+	ctrl = qmc_read16(&bd->cbd_sc);
+	if (ctrl & (QMC_BD_TX_R | QMC_BD_TX_UB)) {
+		/* We are full ... */
+		ret = -EBUSY;
+		goto end;
+	}
+
+	qmc_write16(&bd->cbd_datlen, length);
+	qmc_write32(&bd->cbd_bufaddr, addr);
+
+	xfer_desc = &chan->tx_desc[bd - chan->txbds];
+	xfer_desc->tx_complete = complete;
+	xfer_desc->context = context;
+
+	/* Activate the descriptor */
+	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
+	wmb(); /* Be sure to flush the descriptor before control update */
+	qmc_write16(&bd->cbd_sc, ctrl);
+
+	if (!chan->is_tx_stopped)
+		qmc_setbits16(chan->s_param + QMC_SPE_CHAMR, QMC_SPE_CHAMR_POL);
+
+	if (ctrl & QMC_BD_TX_W)
+		chan->txbd_free = chan->txbds;
+	else
+		chan->txbd_free++;
+
+	ret = 0;
+
+end:
+	spin_unlock_irqrestore(&chan->tx_lock, flags);
+	return ret;
+}
+EXPORT_SYMBOL(qmc_chan_write_submit);
+
+static void qmc_chan_write_done(struct qmc_chan *chan)
+{
+	struct qmc_xfer_desc *xfer_desc;
+	void (*complete)(void *context);
+	unsigned long flags;
+	void *context;
+	cbd_t *__iomem bd;
+	u16 ctrl;
+
+	/*
+	 * R bit  UB bit
+	 *   0       0  : The BD is free
+	 *   1       1  : The BD is in used, waiting for transfer
+	 *   0       1  : The BD is in used, waiting for completion
+	 *   1       0  : Should not append
+	 */
+
+	spin_lock_irqsave(&chan->tx_lock, flags);
+	bd = chan->txbd_done;
+
+	ctrl = qmc_read16(&bd->cbd_sc);
+	while (!(ctrl & QMC_BD_TX_R)) {
+		if (!(ctrl & QMC_BD_TX_UB))
+			goto end;
+
+		xfer_desc = &chan->tx_desc[bd - chan->txbds];
+		complete = xfer_desc->tx_complete;
+		context = xfer_desc->context;
+		xfer_desc->tx_complete = NULL;
+		xfer_desc->context = NULL;
+
+		qmc_write16(&bd->cbd_sc, ctrl & ~QMC_BD_TX_UB);
+
+		if (ctrl & QMC_BD_TX_W)
+			chan->txbd_done = chan->txbds;
+		else
+			chan->txbd_done++;
+
+		if (complete) {
+			spin_unlock_irqrestore(&chan->tx_lock, flags);
+			complete(context);
+			spin_lock_irqsave(&chan->tx_lock, flags);
+		}
+
+		bd = chan->txbd_done;
+		ctrl = qmc_read16(&bd->cbd_sc);
+	}
+
+end:
+	spin_unlock_irqrestore(&chan->tx_lock, flags);
+}
+
+int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
+			 void (*complete)(void *context, size_t length), void *context)
+{
+	struct qmc_xfer_desc *xfer_desc;
+	unsigned long flags;
+	cbd_t *__iomem bd;
+	u16 ctrl;
+	int ret;
+
+	/*
+	 * E bit  UB bit
+	 *   0       0  : The BD is free
+	 *   1       1  : The BD is in used, waiting for transfer
+	 *   0       1  : The BD is in used, waiting for completion
+	 *   1       0  : Should not append
+	 */
+
+	spin_lock_irqsave(&chan->rx_lock, flags);
+	bd = chan->rxbd_free;
+
+	ctrl = qmc_read16(&bd->cbd_sc);
+	if (ctrl & (QMC_BD_RX_E | QMC_BD_RX_UB)) {
+		/* We are full ... */
+		ret = -EBUSY;
+		goto end;
+	}
+
+	qmc_write16(&bd->cbd_datlen, 0); /* data length is updated by the QMC */
+	qmc_write32(&bd->cbd_bufaddr, addr);
+
+	xfer_desc = &chan->rx_desc[bd - chan->rxbds];
+	xfer_desc->rx_complete = complete;
+	xfer_desc->context = context;
+
+	/* Activate the descriptor */
+	ctrl |= (QMC_BD_RX_E | QMC_BD_RX_UB);
+	wmb(); /* Be sure to flush data before descriptor activation */
+	qmc_write16(&bd->cbd_sc, ctrl);
+
+	/* Restart receiver if needed */
+	if (chan->is_rx_halted && !chan->is_rx_stopped) {
+		/* Restart receiver */
+		if (chan->mode == QMC_TRANSPARENT)
+			qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
+		else
+			qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x00000080);
+		qmc_write32(chan->s_param + QMC_SPE_RSTATE, 0x31000000);
+		chan->is_rx_halted = false;
+	}
+	chan->rx_pending++;
+
+	if (ctrl & QMC_BD_RX_W)
+		chan->rxbd_free = chan->rxbds;
+	else
+		chan->rxbd_free++;
+
+	ret = 0;
+end:
+	spin_unlock_irqrestore(&chan->rx_lock, flags);
+	return ret;
+}
+EXPORT_SYMBOL(qmc_chan_read_submit);
+
+static void qmc_chan_read_done(struct qmc_chan *chan)
+{
+	void (*complete)(void *context, size_t size);
+	struct qmc_xfer_desc *xfer_desc;
+	unsigned long flags;
+	cbd_t *__iomem bd;
+	void *context;
+	u16 datalen;
+	u16 ctrl;
+
+	/*
+	 * E bit  UB bit
+	 *   0       0  : The BD is free
+	 *   1       1  : The BD is in used, waiting for transfer
+	 *   0       1  : The BD is in used, waiting for completion
+	 *   1       0  : Should not append
+	 */
+
+	spin_lock_irqsave(&chan->rx_lock, flags);
+	bd = chan->rxbd_done;
+
+	ctrl = qmc_read16(&bd->cbd_sc);
+	while (!(ctrl & QMC_BD_RX_E)) {
+		if (!(ctrl & QMC_BD_RX_UB))
+			goto end;
+
+		xfer_desc = &chan->rx_desc[bd - chan->rxbds];
+		complete = xfer_desc->rx_complete;
+		context = xfer_desc->context;
+		xfer_desc->rx_complete = NULL;
+		xfer_desc->context = NULL;
+
+		datalen = qmc_read16(&bd->cbd_datlen);
+		qmc_write16(&bd->cbd_sc, ctrl & ~QMC_BD_RX_UB);
+
+		if (ctrl & QMC_BD_RX_W)
+			chan->rxbd_done = chan->rxbds;
+		else
+			chan->rxbd_done++;
+
+		chan->rx_pending--;
+
+		if (complete) {
+			spin_unlock_irqrestore(&chan->rx_lock, flags);
+			complete(context, datalen);
+			spin_lock_irqsave(&chan->rx_lock, flags);
+		}
+
+		bd = chan->rxbd_done;
+		ctrl = qmc_read16(&bd->cbd_sc);
+	}
+
+end:
+	spin_unlock_irqrestore(&chan->rx_lock, flags);
+}
+
+static int qmc_chan_command(struct qmc_chan *chan, u8 qmc_opcode)
+{
+	return cpm_command(chan->id << 2, (qmc_opcode << 4) | 0x0E);
+}
+
+static int qmc_chan_stop_rx(struct qmc_chan *chan)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&chan->rx_lock, flags);
+
+	/* Send STOP RECEIVE command */
+	ret = qmc_chan_command(chan, 0x0);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: Send STOP RECEIVE failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
+	chan->is_rx_stopped = true;
+
+end:
+	spin_unlock_irqrestore(&chan->rx_lock, flags);
+	return ret;
+}
+
+static int qmc_chan_stop_tx(struct qmc_chan *chan)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&chan->tx_lock, flags);
+
+	/* Send STOP TRANSMIT command */
+	ret = qmc_chan_command(chan, 0x1);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: Send STOP TRANSMIT failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
+	chan->is_tx_stopped = true;
+
+end:
+	spin_unlock_irqrestore(&chan->tx_lock, flags);
+	return ret;
+}
+
+int qmc_chan_stop(struct qmc_chan *chan, int direction)
+{
+	int ret;
+
+	if (direction & QMC_CHAN_READ) {
+		ret = qmc_chan_stop_rx(chan);
+		if (ret)
+			return ret;
+	}
+
+	if (direction & QMC_CHAN_WRITE) {
+		ret = qmc_chan_stop_tx(chan);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(qmc_chan_stop);
+
+static void qmc_chan_start_rx(struct qmc_chan *chan)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&chan->rx_lock, flags);
+
+	/* Restart the receiver */
+	if (chan->mode == QMC_TRANSPARENT)
+		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
+	else
+		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x00000080);
+	qmc_write32(chan->s_param + QMC_SPE_RSTATE, 0x31000000);
+	chan->is_rx_halted = false;
+
+	chan->is_rx_stopped = false;
+
+	spin_unlock_irqrestore(&chan->rx_lock, flags);
+}
+
+static void qmc_chan_start_tx(struct qmc_chan *chan)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&chan->tx_lock, flags);
+
+	/*
+	 * Enable channel transmitter as it could be disabled if
+	 * qmc_chan_reset() was called.
+	 */
+	qmc_setbits16(chan->s_param + QMC_SPE_CHAMR, QMC_SPE_CHAMR_ENT);
+
+	/* Set the POL bit in the channel mode register */
+	qmc_setbits16(chan->s_param + QMC_SPE_CHAMR, QMC_SPE_CHAMR_POL);
+
+	chan->is_tx_stopped = false;
+
+	spin_unlock_irqrestore(&chan->tx_lock, flags);
+}
+
+int qmc_chan_start(struct qmc_chan *chan, int direction)
+{
+	if (direction & QMC_CHAN_READ)
+		qmc_chan_start_rx(chan);
+
+	if (direction & QMC_CHAN_WRITE)
+		qmc_chan_start_tx(chan);
+
+	return 0;
+}
+EXPORT_SYMBOL(qmc_chan_start);
+
+static void qmc_chan_reset_rx(struct qmc_chan *chan)
+{
+	struct qmc_xfer_desc *xfer_desc;
+	unsigned long flags;
+	cbd_t *__iomem bd;
+	u16 ctrl;
+
+	spin_lock_irqsave(&chan->rx_lock, flags);
+	bd = chan->rxbds;
+	do {
+		ctrl = qmc_read16(&bd->cbd_sc);
+		qmc_write16(&bd->cbd_sc, ctrl & ~(QMC_BD_RX_UB | QMC_BD_RX_E));
+
+		xfer_desc = &chan->rx_desc[bd - chan->rxbds];
+		xfer_desc->rx_complete = NULL;
+		xfer_desc->context = NULL;
+
+		bd++;
+	} while (!(ctrl & QMC_BD_RX_W));
+
+	chan->rxbd_free = chan->rxbds;
+	chan->rxbd_done = chan->rxbds;
+	qmc_write16(chan->s_param + QMC_SPE_RBPTR,
+		    qmc_read16(chan->s_param + QMC_SPE_RBASE));
+
+	chan->rx_pending = 0;
+	chan->is_rx_stopped = false;
+
+	spin_unlock_irqrestore(&chan->rx_lock, flags);
+}
+
+static void qmc_chan_reset_tx(struct qmc_chan *chan)
+{
+	struct qmc_xfer_desc *xfer_desc;
+	unsigned long flags;
+	cbd_t *__iomem bd;
+	u16 ctrl;
+
+	spin_lock_irqsave(&chan->tx_lock, flags);
+
+	/* Disable transmitter. It will be re-enable on qmc_chan_start() */
+	qmc_clrbits16(chan->s_param + QMC_SPE_CHAMR, QMC_SPE_CHAMR_ENT);
+
+	bd = chan->txbds;
+	do {
+		ctrl = qmc_read16(&bd->cbd_sc);
+		qmc_write16(&bd->cbd_sc, ctrl & ~(QMC_BD_TX_UB | QMC_BD_TX_R));
+
+		xfer_desc = &chan->tx_desc[bd - chan->txbds];
+		xfer_desc->tx_complete = NULL;
+		xfer_desc->context = NULL;
+
+		bd++;
+	} while (!(ctrl & QMC_BD_TX_W));
+
+	chan->txbd_free = chan->txbds;
+	chan->txbd_done = chan->txbds;
+	qmc_write16(chan->s_param + QMC_SPE_TBPTR,
+		    qmc_read16(chan->s_param + QMC_SPE_TBASE));
+
+	/* Reset TSTATE and ZISTATE to their initial value */
+	qmc_write32(chan->s_param + QMC_SPE_TSTATE, 0x30000000);
+	qmc_write32(chan->s_param + QMC_SPE_ZISTATE, 0x00000100);
+
+	spin_unlock_irqrestore(&chan->tx_lock, flags);
+}
+
+int qmc_chan_reset(struct qmc_chan *chan, int direction)
+{
+	if (direction & QMC_CHAN_READ)
+		qmc_chan_reset_rx(chan);
+
+	if (direction & QMC_CHAN_WRITE)
+		qmc_chan_reset_tx(chan);
+
+	return 0;
+}
+EXPORT_SYMBOL(qmc_chan_reset);
+
+static int qmc_check_chans(struct qmc *qmc)
+{
+	struct tsa_serial_info info;
+	bool is_one_table = false;
+	struct qmc_chan *chan;
+	u64 tx_ts_mask = 0;
+	u64 rx_ts_mask = 0;
+	u64 tx_ts_assigned_mask;
+	u64 rx_ts_assigned_mask;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(qmc->tsa_serial, &info);
+	if (ret)
+		return ret;
+
+	/*
+	 * If more than 32 TS are assigned to this serial, one common table is
+	 * used for Tx and Rx and so masks must be equal for all channels.
+	 */
+	if ((info.nb_tx_ts > 32) || (info.nb_rx_ts > 32)) {
+		if (info.nb_tx_ts != info.nb_rx_ts) {
+			dev_err(qmc->dev, "Number of TSA Tx/Rx TS assigned are not equal\n");
+			return -EINVAL;
+		}
+		is_one_table = true;
+	}
+
+
+	tx_ts_assigned_mask = (((u64)1) << info.nb_tx_ts) - 1;
+	rx_ts_assigned_mask = (((u64)1) << info.nb_rx_ts) - 1;
+
+	list_for_each_entry(chan, &qmc->chan_head, list) {
+		if (chan->tx_ts_mask > tx_ts_assigned_mask) {
+			dev_err(qmc->dev, "chan %u uses TSA unassigned Tx TS\n", chan->id);
+			return -EINVAL;
+		}
+		if (tx_ts_mask & chan->tx_ts_mask) {
+			dev_err(qmc->dev, "chan %u uses an already used Tx TS\n", chan->id);
+			return -EINVAL;
+		}
+
+		if (chan->rx_ts_mask > rx_ts_assigned_mask) {
+			dev_err(qmc->dev, "chan %u uses TSA unassigned Rx TS\n", chan->id);
+			return -EINVAL;
+		}
+		if (rx_ts_mask & chan->rx_ts_mask) {
+			dev_err(qmc->dev, "chan %u uses an already used Rx TS\n", chan->id);
+			return -EINVAL;
+		}
+
+		if (is_one_table && (chan->tx_ts_mask != chan->rx_ts_mask)) {
+			dev_err(qmc->dev, "chan %u uses different Rx and Tx TS\n", chan->id);
+			return -EINVAL;
+		}
+
+		tx_ts_mask |= chan->tx_ts_mask;
+		rx_ts_mask |= chan->rx_ts_mask;
+	}
+
+	return 0;
+}
+
+static unsigned int qmc_nb_chans(struct qmc *qmc)
+{
+	unsigned int count = 0;
+	struct qmc_chan *chan;
+
+	list_for_each_entry(chan, &qmc->chan_head, list)
+		count++;
+
+	return count;
+}
+
+static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
+{
+	struct device_node *chan_np;
+	struct qmc_chan *chan;
+	const char *mode;
+	u32 chan_id;
+	u64 ts_mask;
+	int ret;
+
+	for_each_available_child_of_node(np, chan_np) {
+		ret = of_property_read_u32(chan_np, "reg", &chan_id);
+		if (ret) {
+			dev_err(qmc->dev, "%pOF: failed to read reg\n", chan_np);
+			of_node_put(chan_np);
+			return ret;
+		}
+		if (chan_id > 63) {
+			dev_err(qmc->dev, "%pOF: Invalid chan_id\n", chan_np);
+			of_node_put(chan_np);
+			return -EINVAL;
+		}
+
+		chan = devm_kzalloc(qmc->dev, sizeof(*chan), GFP_KERNEL);
+		if (!chan) {
+			of_node_put(chan_np);
+			return -ENOMEM;
+		}
+
+		chan->id = chan_id;
+		spin_lock_init(&chan->rx_lock);
+		spin_lock_init(&chan->tx_lock);
+
+		ret = of_property_read_u64(chan_np, "fsl,tx-ts-mask", &ts_mask);
+		if (ret) {
+			dev_err(qmc->dev, "%pOF: failed to read fsl,tx-ts-mask\n",
+				chan_np);
+			of_node_put(chan_np);
+			return ret;
+		}
+		chan->tx_ts_mask = ts_mask;
+
+		ret = of_property_read_u64(chan_np, "fsl,rx-ts-mask", &ts_mask);
+		if (ret) {
+			dev_err(qmc->dev, "%pOF: failed to read fsl,rx-ts-mask\n",
+				chan_np);
+			of_node_put(chan_np);
+			return ret;
+		}
+		chan->rx_ts_mask = ts_mask;
+
+		mode = "transparent";
+		ret = of_property_read_string(chan_np, "fsl,operational-mode", &mode);
+		if (ret && ret != -EINVAL) {
+			dev_err(qmc->dev, "%pOF: failed to read fsl,operational-mode\n",
+				chan_np);
+			of_node_put(chan_np);
+			return ret;
+		}
+		if (!strcmp(mode, "transparent")) {
+			chan->mode = QMC_TRANSPARENT;
+		} else if (!strcmp(mode, "hdlc")) {
+			chan->mode = QMC_HDLC;
+		} else {
+			dev_err(qmc->dev, "%pOF: Invalid fsl,operational-mode (%s)\n",
+				chan_np, mode);
+			of_node_put(chan_np);
+			return -EINVAL;
+		}
+
+		chan->is_reverse_data = of_property_read_bool(chan_np,
+							      "fsl,reverse-data");
+
+		list_add_tail(&chan->list, &qmc->chan_head);
+		qmc->chans[chan->id] = chan;
+	}
+
+	return qmc_check_chans(qmc);
+}
+
+static int qmc_setup_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *info)
+{
+	struct qmc_chan *chan;
+	unsigned int i;
+	u16 val;
+
+	/*
+	 * Use a common Tx/Rx 64 entries table.
+	 * Everything was previously checked, Tx and Rx related stuffs are
+	 * identical -> Used Rx related stuff to build the table
+	 */
+
+	/* Invalidate all entries */
+	for (i = 0; i < 64; i++)
+		qmc_write16(qmc->scc_pram + QMC_GBL_TSATRX + (i * 2), 0x0000);
+
+	/* Set entries based on Rx stuff*/
+	list_for_each_entry(chan, &qmc->chan_head, list) {
+		for (i = 0; i < info->nb_rx_ts; i++) {
+			if (!(chan->rx_ts_mask & (((u64)1) << i)))
+				continue;
+
+			val = QMC_TSA_VALID | QMC_TSA_MASK |
+			      QMC_TSA_CHANNEL(chan->id);
+			qmc_write16(qmc->scc_pram + QMC_GBL_TSATRX + (i * 2), val);
+		}
+	}
+
+	/* Set Wrap bit on last entry */
+	qmc_setbits16(qmc->scc_pram + QMC_GBL_TSATRX + ((info->nb_rx_ts - 1) * 2),
+		      QMC_TSA_WRAP);
+
+	/* Init pointers to the table */
+	val = qmc->scc_pram_offset + QMC_GBL_TSATRX;
+	qmc_write16(qmc->scc_pram + QMC_GBL_RX_S_PTR, val);
+	qmc_write16(qmc->scc_pram + QMC_GBL_RXPTR, val);
+	qmc_write16(qmc->scc_pram + QMC_GBL_TX_S_PTR, val);
+	qmc_write16(qmc->scc_pram + QMC_GBL_TXPTR, val);
+
+	return 0;
+}
+
+static int qmc_setup_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info *info)
+{
+	struct qmc_chan *chan;
+	unsigned int i;
+	u16 val;
+
+	/*
+	 * Use a Tx 32 entries table and a Rx 32 entries table.
+	 * Everything was previously checked.
+	 */
+
+	/* Invalidate all entries */
+	for (i = 0; i < 32; i++) {
+		qmc_write16(qmc->scc_pram + QMC_GBL_TSATRX + (i * 2), 0x0000);
+		qmc_write16(qmc->scc_pram + QMC_GBL_TSATTX + (i * 2), 0x0000);
+	}
+
+	/* Set entries based on Rx and Tx stuff*/
+	list_for_each_entry(chan, &qmc->chan_head, list) {
+		/* Rx part */
+		for (i = 0; i < info->nb_rx_ts; i++) {
+			if (!(chan->rx_ts_mask & (((u64)1) << i)))
+				continue;
+
+			val = QMC_TSA_VALID | QMC_TSA_MASK |
+			      QMC_TSA_CHANNEL(chan->id);
+			qmc_write16(qmc->scc_pram + QMC_GBL_TSATRX + (i * 2), val);
+		}
+		/* Tx part */
+		for (i = 0; i < info->nb_tx_ts; i++) {
+			if (!(chan->tx_ts_mask & (((u64)1) << i)))
+				continue;
+
+			val = QMC_TSA_VALID | QMC_TSA_MASK |
+			      QMC_TSA_CHANNEL(chan->id);
+			qmc_write16(qmc->scc_pram + QMC_GBL_TSATTX + (i * 2), val);
+		}
+	}
+
+	/* Set Wrap bit on last entries */
+	qmc_setbits16(qmc->scc_pram + QMC_GBL_TSATRX + ((info->nb_rx_ts - 1) * 2),
+		      QMC_TSA_WRAP);
+	qmc_setbits16(qmc->scc_pram + QMC_GBL_TSATTX + ((info->nb_tx_ts - 1) * 2),
+		      QMC_TSA_WRAP);
+
+	/* Init Rx pointers ...*/
+	val = qmc->scc_pram_offset + QMC_GBL_TSATRX;
+	qmc_write16(qmc->scc_pram + QMC_GBL_RX_S_PTR, val);
+	qmc_write16(qmc->scc_pram + QMC_GBL_RXPTR, val);
+
+	/* ... and Tx pointers */
+	val = qmc->scc_pram_offset + QMC_GBL_TSATTX;
+	qmc_write16(qmc->scc_pram + QMC_GBL_TX_S_PTR, val);
+	qmc_write16(qmc->scc_pram + QMC_GBL_TXPTR, val);
+
+	return 0;
+}
+
+static int qmc_setup_tsa(struct qmc *qmc)
+{
+	struct tsa_serial_info info;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(qmc->tsa_serial, &info);
+	if (ret)
+		return ret;
+
+	/*
+	 * Setup one common 64 entries table or two 32 entries (one for Tx and
+	 * one for Tx) according to assigned TS numbers.
+	 */
+	return ((info.nb_tx_ts > 32) || (info.nb_rx_ts > 32)) ?
+		qmc_setup_tsa_64rxtx(qmc, &info) :
+		qmc_setup_tsa_32rx_32tx(qmc, &info);
+}
+
+static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan)
+{
+	struct tsa_serial_info info;
+	u16 first_rx, last_tx;
+	u16 trnsync;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &info);
+	if (ret)
+		return ret;
+
+	/* Find the first Rx TS allocated to the channel */
+	first_rx = chan->rx_ts_mask ? __ffs64(chan->rx_ts_mask) + 1 : 0;
+
+	/* Find the last Tx TS allocated to the channel */
+	last_tx = fls64(chan->tx_ts_mask);
+
+	trnsync = 0;
+	if (info.nb_rx_ts)
+		trnsync |= QMC_SPE_TRNSYNC_RX((first_rx % info.nb_rx_ts) * 2);
+	if (info.nb_tx_ts)
+		trnsync |= QMC_SPE_TRNSYNC_TX((last_tx % info.nb_tx_ts) * 2);
+
+	qmc_write16(chan->s_param + QMC_SPE_TRNSYNC, trnsync);
+
+	dev_dbg(qmc->dev, "chan %u: trnsync=0x%04x, rx %u/%u 0x%llx, tx %u/%u 0x%llx\n",
+		chan->id, trnsync,
+		first_rx, info.nb_rx_ts, chan->rx_ts_mask,
+		last_tx, info.nb_tx_ts, chan->tx_ts_mask);
+
+	return 0;
+}
+
+static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
+{
+	unsigned int i;
+	cbd_t __iomem *bd;
+	int ret;
+	u16 val;
+
+	chan->qmc = qmc;
+
+	/* Set channel specific parameter base address */
+	chan->s_param = qmc->dpram + (chan->id * 64);
+	/* 16 bd per channel (8 rx and 8 tx) */
+	chan->txbds = qmc->bd_table + (chan->id * (QMC_NB_TXBDS + QMC_NB_RXBDS));
+	chan->rxbds = qmc->bd_table + (chan->id * (QMC_NB_TXBDS + QMC_NB_RXBDS)) + QMC_NB_TXBDS;
+
+	chan->txbd_free = chan->txbds;
+	chan->txbd_done = chan->txbds;
+	chan->rxbd_free = chan->rxbds;
+	chan->rxbd_done = chan->rxbds;
+
+	/* TBASE and TBPTR*/
+	val = chan->id * (QMC_NB_TXBDS + QMC_NB_RXBDS) * sizeof(cbd_t);
+	qmc_write16(chan->s_param + QMC_SPE_TBASE, val);
+	qmc_write16(chan->s_param + QMC_SPE_TBPTR, val);
+
+	/* RBASE and RBPTR*/
+	val = ((chan->id * (QMC_NB_TXBDS + QMC_NB_RXBDS)) + QMC_NB_TXBDS) * sizeof(cbd_t);
+	qmc_write16(chan->s_param + QMC_SPE_RBASE, val);
+	qmc_write16(chan->s_param + QMC_SPE_RBPTR, val);
+	qmc_write32(chan->s_param + QMC_SPE_TSTATE, 0x30000000);
+	qmc_write32(chan->s_param + QMC_SPE_RSTATE, 0x31000000);
+	qmc_write32(chan->s_param + QMC_SPE_ZISTATE, 0x00000100);
+	if (chan->mode == QMC_TRANSPARENT) {
+		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
+		qmc_write16(chan->s_param + QMC_SPE_TMRBLR, 60);
+		val = QMC_SPE_CHAMR_MODE_TRANSP | QMC_SPE_CHAMR_TRANSP_SYNC;
+		if (chan->is_reverse_data)
+			val |= QMC_SPE_CHAMR_TRANSP_RD;
+		qmc_write16(chan->s_param + QMC_SPE_CHAMR, val);
+		ret = qmc_setup_chan_trnsync(qmc, chan);
+		if (ret)
+			return ret;
+	} else {
+		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x00000080);
+		qmc_write16(chan->s_param + QMC_SPE_MFLR, 60);
+		qmc_write16(chan->s_param + QMC_SPE_CHAMR,
+			QMC_SPE_CHAMR_MODE_HDLC | QMC_SPE_CHAMR_HDLC_IDLM);
+	}
+
+	/* Do not enable interrupts now. They will be enabled later */
+	qmc_write16(chan->s_param + QMC_SPE_INTMSK, 0x0000);
+
+	/* Init Rx BDs and set Wrap bit on last descriptor */
+	BUILD_BUG_ON(QMC_NB_RXBDS == 0);
+	val = QMC_BD_RX_I;
+	for (i = 0; i < QMC_NB_RXBDS; i++) {
+		bd = chan->rxbds + i;
+		qmc_write16(&bd->cbd_sc, val);
+	}
+	bd = chan->rxbds + QMC_NB_RXBDS - 1;
+	qmc_write16(&bd->cbd_sc, val | QMC_BD_RX_W);
+
+	/* Init Tx BDs and set Wrap bit on last descriptor */
+	BUILD_BUG_ON(QMC_NB_TXBDS == 0);
+	val = QMC_BD_TX_I;
+	if (chan->mode == QMC_HDLC)
+		val |= QMC_BD_TX_L | QMC_BD_TX_TC;
+	for (i = 0; i < QMC_NB_TXBDS; i++) {
+		bd = chan->txbds + i;
+		qmc_write16(&bd->cbd_sc, val);
+	}
+	bd = chan->txbds + QMC_NB_TXBDS - 1;
+	qmc_write16(&bd->cbd_sc, val | QMC_BD_TX_W);
+
+	return 0;
+}
+
+static int qmc_setup_chans(struct qmc *qmc)
+{
+	struct qmc_chan *chan;
+	int ret;
+
+	list_for_each_entry(chan, &qmc->chan_head, list) {
+		ret = qmc_setup_chan(qmc, chan);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int qmc_finalize_chans(struct qmc *qmc)
+{
+	struct qmc_chan *chan;
+	int ret;
+
+	list_for_each_entry(chan, &qmc->chan_head, list) {
+		/* Unmask channel interrupts */
+		if (chan->mode == QMC_HDLC) {
+			qmc_write16(chan->s_param + QMC_SPE_INTMSK,
+				    QMC_INT_NID | QMC_INT_IDL | QMC_INT_MRF |
+				    QMC_INT_UN | QMC_INT_RXF | QMC_INT_BSY |
+				    QMC_INT_TXB | QMC_INT_RXB);
+		} else {
+			qmc_write16(chan->s_param + QMC_SPE_INTMSK,
+				    QMC_INT_UN | QMC_INT_BSY |
+				    QMC_INT_TXB | QMC_INT_RXB);
+		}
+
+		/* Forced stop the channel */
+		ret = qmc_chan_stop(chan, QMC_CHAN_ALL);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int qmc_setup_ints(struct qmc *qmc)
+{
+	unsigned int i;
+	u16 __iomem *last;
+
+	/* Raz all entries */
+	for (i = 0; i < (qmc->int_size / sizeof(u16)); i++)
+		qmc_write16(qmc->int_table + i, 0x0000);
+
+	/* Set Wrap bit on last entry */
+	if (qmc->int_size >= sizeof(u16)) {
+		last = qmc->int_table + (qmc->int_size / sizeof(u16)) - 1;
+		qmc_write16(last, QMC_INT_W);
+	}
+
+	return 0;
+}
+
+static void qmc_irq_gint(struct qmc *qmc)
+{
+	struct qmc_chan *chan;
+	unsigned int chan_id;
+	unsigned long flags;
+	u16 int_entry;
+
+	int_entry = qmc_read16(qmc->int_curr);
+	while (int_entry & QMC_INT_V) {
+		/* Clear all but the Wrap bit */
+		qmc_write16(qmc->int_curr, int_entry & QMC_INT_W);
+
+		chan_id = QMC_INT_GET_CHANNEL(int_entry);
+		chan = qmc->chans[chan_id];
+		if (!chan) {
+			dev_err(qmc->dev, "interrupt on invalid chan %u\n", chan_id);
+			goto int_next;
+		}
+
+		if (int_entry & QMC_INT_TXB)
+			qmc_chan_write_done(chan);
+
+		if (int_entry & QMC_INT_UN) {
+			dev_info(qmc->dev, "intr chan %u, 0x%04x (UN)\n", chan_id,
+				 int_entry);
+			chan->nb_tx_underrun++;
+		}
+
+		if (int_entry & QMC_INT_BSY) {
+			dev_info(qmc->dev, "intr chan %u, 0x%04x (BSY)\n", chan_id,
+				 int_entry);
+			chan->nb_rx_busy++;
+			/* Restart the receiver if needed */
+			spin_lock_irqsave(&chan->rx_lock, flags);
+			if (chan->rx_pending && !chan->is_rx_stopped) {
+				if (chan->mode == QMC_TRANSPARENT)
+					qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
+				else
+					qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x00000080);
+				qmc_write32(chan->s_param + QMC_SPE_RSTATE, 0x31000000);
+				chan->is_rx_halted = false;
+			} else {
+				chan->is_rx_halted = true;
+			}
+			spin_unlock_irqrestore(&chan->rx_lock, flags);
+		}
+
+		if (int_entry & QMC_INT_RXB)
+			qmc_chan_read_done(chan);
+
+int_next:
+		if (int_entry & QMC_INT_W)
+			qmc->int_curr = qmc->int_table;
+		else
+			qmc->int_curr++;
+		int_entry = qmc_read16(qmc->int_curr);
+	}
+}
+
+static irqreturn_t qmc_irq_handler(int irq, void *priv)
+{
+	struct qmc *qmc = (struct qmc *)priv;
+	u16 scce;
+
+	scce = qmc_read16(qmc->scc_regs + SCC_SCCE);
+	qmc_write16(qmc->scc_regs + SCC_SCCE, scce);
+
+	if (unlikely(scce & SCC_SCCE_IQOV))
+		dev_info(qmc->dev, "IRQ queue overflow\n");
+
+	if (unlikely(scce & SCC_SCCE_GUN))
+		dev_err(qmc->dev, "Global transmitter underrun\n");
+
+	if (unlikely(scce & SCC_SCCE_GOV))
+		dev_err(qmc->dev, "Global receiver overrun\n");
+
+	/* normal interrupt */
+	if (likely(scce & SCC_SCCE_GINT))
+		qmc_irq_gint(qmc);
+
+	return IRQ_HANDLED;
+}
+
+static int qmc_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	unsigned int nb_chans;
+	struct resource *res;
+	struct qmc *qmc;
+	int irq;
+	int ret;
+
+	qmc = devm_kzalloc(&pdev->dev, sizeof(*qmc), GFP_KERNEL);
+	if (!qmc)
+		return -ENOMEM;
+
+	qmc->dev = &pdev->dev;
+	INIT_LIST_HEAD(&qmc->chan_head);
+
+	qmc->scc_regs = devm_platform_ioremap_resource_byname(pdev, "scc_regs");
+	if (IS_ERR(qmc->scc_regs))
+		return PTR_ERR(qmc->scc_regs);
+
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "scc_pram");
+	if (!res)
+		return -EINVAL;
+	qmc->scc_pram_offset = res->start - get_immrbase();
+	qmc->scc_pram = devm_ioremap_resource(qmc->dev, res);
+	if (IS_ERR(qmc->scc_pram))
+		return PTR_ERR(qmc->scc_pram);
+
+	qmc->dpram  = devm_platform_ioremap_resource_byname(pdev, "dpram");
+	if (IS_ERR(qmc->dpram))
+		return PTR_ERR(qmc->dpram);
+
+	qmc->tsa_serial = devm_tsa_serial_get_byphandle(qmc->dev, np, "fsl,tsa-serial");
+	if (IS_ERR(qmc->tsa_serial)) {
+		return dev_err_probe(qmc->dev, PTR_ERR(qmc->tsa_serial),
+				     "Failed to get TSA serial\n");
+	}
+
+	/* Connect the serial (SCC) to TSA */
+	ret = tsa_serial_connect(qmc->tsa_serial);
+	if (ret) {
+		dev_err(qmc->dev, "Failed to connect TSA serial\n");
+		return ret;
+	}
+
+	/* Parse channels informationss */
+	ret = qmc_of_parse_chans(qmc, np);
+	if (ret)
+		goto err_tsa_serial_disconnect;
+
+	nb_chans = qmc_nb_chans(qmc);
+
+	/* Init GMSR_H and GMSR_L registers */
+	qmc_write32(qmc->scc_regs + SCC_GSMRH,
+		    SCC_GSMRH_CDS | SCC_GSMRH_CTSS | SCC_GSMRH_CDP | SCC_GSMRH_CTSP);
+
+	/* enable QMC mode */
+	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
+
+	/*
+	 * Allocate the buffer descriptor table
+	 * 8 rx and 8 tx descriptors per channel
+	 */
+	qmc->bd_size = (nb_chans * (QMC_NB_TXBDS + QMC_NB_RXBDS)) * sizeof(cbd_t);
+	qmc->bd_table = dmam_alloc_coherent(qmc->dev, qmc->bd_size,
+		&qmc->bd_dma_addr, GFP_KERNEL);
+	if (!qmc->bd_table) {
+		dev_err(qmc->dev, "Failed to allocate bd table\n");
+		ret = -ENOMEM;
+		goto err_tsa_serial_disconnect;
+	}
+	memset(qmc->bd_table, 0, qmc->bd_size);
+
+	qmc_write32(qmc->scc_pram + QMC_GBL_MCBASE, qmc->bd_dma_addr);
+
+	/* Allocate the interrupt table */
+	qmc->int_size = QMC_NB_INTS * sizeof(u16);
+	qmc->int_table = dmam_alloc_coherent(qmc->dev, qmc->int_size,
+		&qmc->int_dma_addr, GFP_KERNEL);
+	if (!qmc->int_table) {
+		dev_err(qmc->dev, "Failed to allocate interrupt table\n");
+		ret = -ENOMEM;
+		goto err_tsa_serial_disconnect;
+	}
+	memset(qmc->int_table, 0, qmc->int_size);
+
+	qmc->int_curr = qmc->int_table;
+	qmc_write32(qmc->scc_pram + QMC_GBL_INTBASE, qmc->int_dma_addr);
+	qmc_write32(qmc->scc_pram + QMC_GBL_INTPTR, qmc->int_dma_addr);
+
+	/* Set MRBLR (valid for HDLC only) max MRU + max CRC */
+	qmc_write16(qmc->scc_pram + QMC_GBL_MRBLR, HDLC_MAX_MRU + 4);
+
+	qmc_write16(qmc->scc_pram + QMC_GBL_GRFTHR, 1);
+	qmc_write16(qmc->scc_pram + QMC_GBL_GRFCNT, 1);
+
+	qmc_write32(qmc->scc_pram + QMC_GBL_C_MASK32, 0xDEBB20E3);
+	qmc_write16(qmc->scc_pram + QMC_GBL_C_MASK16, 0xF0B8);
+
+	ret = qmc_setup_tsa(qmc);
+	if (ret)
+		goto err_tsa_serial_disconnect;
+
+	qmc_write16(qmc->scc_pram + QMC_GBL_QMCSTATE, 0x8000);
+
+	ret = qmc_setup_chans(qmc);
+	if (ret)
+		goto err_tsa_serial_disconnect;
+
+	/* Init interrupts table */
+	ret = qmc_setup_ints(qmc);
+	if (ret)
+		goto err_tsa_serial_disconnect;
+
+	/* Disable and clear interrupts,  set the irq handler */
+	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);
+	qmc_write16(qmc->scc_regs + SCC_SCCE, 0x000F);
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		goto err_tsa_serial_disconnect;
+	ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
+	if (ret < 0)
+		goto err_tsa_serial_disconnect;
+
+	/* Enable interrupts */
+	qmc_write16(qmc->scc_regs + SCC_SCCM,
+		SCC_SCCE_IQOV | SCC_SCCE_GINT | SCC_SCCE_GUN | SCC_SCCE_GOV);
+
+	ret = qmc_finalize_chans(qmc);
+	if (ret < 0)
+		goto err_disable_intr;
+
+	/* Enable transmiter and receiver */
+	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_ENR | SCC_GSMRL_ENT);
+
+	platform_set_drvdata(pdev, qmc);
+
+	return 0;
+
+err_disable_intr:
+	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
+
+err_tsa_serial_disconnect:
+	tsa_serial_disconnect(qmc->tsa_serial);
+	return ret;
+}
+
+static int qmc_remove(struct platform_device *pdev)
+{
+	struct qmc *qmc = platform_get_drvdata(pdev);
+
+	/* Disable transmiter and receiver */
+	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, 0);
+
+	/* Disable interrupts */
+	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
+
+	/* Disconnect the serial from TSA */
+	tsa_serial_disconnect(qmc->tsa_serial);
+
+	return 0;
+}
+
+static const struct of_device_id qmc_id_table[] = {
+	{ .compatible = "fsl,cpm1-scc-qmc" },
+	{} /* sentinel */
+};
+MODULE_DEVICE_TABLE(of, qmc_id_table);
+
+static struct platform_driver qmc_driver = {
+	.driver = {
+		.name = "fsl-qmc",
+		.of_match_table = of_match_ptr(qmc_id_table),
+	},
+	.probe = qmc_probe,
+	.remove = qmc_remove,
+};
+module_platform_driver(qmc_driver);
+
+struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name)
+{
+	struct of_phandle_args out_args;
+	struct platform_device *pdev;
+	struct qmc_chan *qmc_chan;
+	struct qmc *qmc;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(np, phandle_name, 1, 0,
+					       &out_args);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	if (!of_match_node(qmc_driver.driver.of_match_table, out_args.np)) {
+		of_node_put(out_args.np);
+		return ERR_PTR(-EINVAL);
+	}
+
+	pdev = of_find_device_by_node(out_args.np);
+	of_node_put(out_args.np);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
+
+	qmc = platform_get_drvdata(pdev);
+	if (!qmc) {
+		platform_device_put(pdev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	if (out_args.args_count != 1) {
+		platform_device_put(pdev);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (out_args.args[0] >= ARRAY_SIZE(qmc->chans)) {
+		platform_device_put(pdev);
+		return ERR_PTR(-EINVAL);
+	}
+
+	qmc_chan = qmc->chans[out_args.args[0]];
+	if (!qmc_chan) {
+		platform_device_put(pdev);
+		return ERR_PTR(-ENOENT);
+	}
+
+	return qmc_chan;
+}
+EXPORT_SYMBOL(qmc_chan_get_byphandle);
+
+void qmc_chan_put(struct qmc_chan *chan)
+{
+	put_device(chan->qmc->dev);
+}
+EXPORT_SYMBOL(qmc_chan_put);
+
+static void devm_qmc_chan_release(struct device *dev, void *res)
+{
+	struct qmc_chan **qmc_chan = res;
+
+	qmc_chan_put(*qmc_chan);
+}
+
+struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev,
+					     struct device_node *np,
+					     const char *phandle_name)
+{
+	struct qmc_chan *qmc_chan;
+	struct qmc_chan **dr;
+
+	dr = devres_alloc(devm_qmc_chan_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return ERR_PTR(-ENOMEM);
+
+	qmc_chan = qmc_chan_get_byphandle(np, phandle_name);
+	if (!IS_ERR(qmc_chan)) {
+		*dr = qmc_chan;
+		devres_add(dev, dr);
+	} else {
+		devres_free(dr);
+	}
+
+	return qmc_chan;
+}
+EXPORT_SYMBOL(devm_qmc_chan_get_byphandle);
+
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
+MODULE_DESCRIPTION("CPM QMC driver");
+MODULE_LICENSE("GPL");
diff --git a/include/soc/fsl/qe/qmc.h b/include/soc/fsl/qe/qmc.h
new file mode 100644
index 000000000000..3c61a50d2ae2
--- /dev/null
+++ b/include/soc/fsl/qe/qmc.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QMC management
+ *
+ * Copyright 2022 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+#ifndef __SOC_FSL_QMC_H__
+#define __SOC_FSL_QMC_H__
+
+#include <linux/types.h>
+
+struct device_node;
+struct device;
+struct qmc_chan;
+
+struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name);
+void qmc_chan_put(struct qmc_chan *chan);
+struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev, struct device_node *np,
+					     const char *phandle_name);
+
+enum qmc_mode {
+	QMC_TRANSPARENT,
+	QMC_HDLC,
+};
+
+struct qmc_chan_info {
+	enum qmc_mode mode;
+	unsigned long rx_fs_rate;
+	unsigned long rx_bit_rate;
+	u8 nb_rx_ts;
+	unsigned long tx_fs_rate;
+	unsigned long tx_bit_rate;
+	u8 nb_tx_ts;
+};
+
+int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info);
+
+struct qmc_chan_param {
+	enum qmc_mode mode;
+	union {
+		struct {
+			u16 max_rx_buf_size;
+			u16 max_rx_frame_size;
+			bool is_crc32;
+		} hdlc;
+		struct {
+			u16 max_rx_buf_size;
+		} transp;
+	};
+};
+
+int qmc_chan_set_param(struct qmc_chan *chan, const struct qmc_chan_param *param);
+
+int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
+			  void (*complete)(void *context), void *context);
+
+int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
+			 void (*complete)(void *context, size_t length),
+			 void *context);
+
+#define QMC_CHAN_READ  (1<<0)
+#define QMC_CHAN_WRITE (1<<1)
+#define QMC_CHAN_ALL   (QMC_CHAN_READ | QMC_CHAN_WRITE)
+
+int qmc_chan_start(struct qmc_chan *chan, int direction);
+int qmc_chan_stop(struct qmc_chan *chan, int direction);
+int qmc_chan_reset(struct qmc_chan *chan, int direction);
+
+#endif /* __SOC_FSL_QMC_H__ */
-- 
2.39.1

