Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 189A067C5E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 09:35:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2YtK72fYz3fJy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 19:35:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ShewfOTF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ShewfOTF;
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2YqY2SYNz3ch8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 19:32:40 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 0D12DE0007;
	Thu, 26 Jan 2023 08:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674721956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBcCqctyHjhftm4ieqe3fe8tpEwT19EWefZgPJekuzA=;
	b=ShewfOTFKLdr+Fuf0tYA84oQcl+jph3VKt2EsbaDmRV8EXZX9JefBIMeG50uL2wyEo8yJo
	IL4V4swfEEHUwYmSd+RI8QFv+Y3037Z1aMK0ieYQXIASA5tagKJv2sFJNUYrWqngPHzK69
	lxdVGLjqz2G4XFq+YUndwn3MXXerbmCapeEKcpaO8a02UvqItMkHWULcfuWQAij5/C0+Z/
	L0QLCERHUm15VbMHQUjiRY05+bizUt39pz9EER7Jd32nbmzYQxQOJCrXaHGgQpXZ5zYkNG
	8jnsKve9BVcrSM226zwMplFnXQ7wrLBw7kFG2Z9hZHZFwr4zLjaGCu5llk/fBA==
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
Subject: [PATCH v4 02/10] soc: fsl: cpm1: Add support for TSA
Date: Thu, 26 Jan 2023 09:32:14 +0100
Message-Id: <20230126083222.374243-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126083222.374243-1-herve.codina@bootlin.com>
References: <20230126083222.374243-1-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The TSA (Time Slot Assigner) purpose is to route some
TDM time-slots to other internal serial controllers.

It is available in some PowerQUICC SoC such as the
MPC885 or MPC866.

It is also available on some Quicc Engine SoCs.
This current version support CPM1 SoCs only and some
enhancement are needed to support Quicc Engine SoCs.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/Kconfig  |  11 +
 drivers/soc/fsl/qe/Makefile |   1 +
 drivers/soc/fsl/qe/tsa.c    | 864 ++++++++++++++++++++++++++++++++++++
 drivers/soc/fsl/qe/tsa.h    |  42 ++
 4 files changed, 918 insertions(+)
 create mode 100644 drivers/soc/fsl/qe/tsa.c
 create mode 100644 drivers/soc/fsl/qe/tsa.h

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index 357c5800b112..60ec11c9f4d9 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -33,6 +33,17 @@ config UCC
 	bool
 	default y if UCC_FAST || UCC_SLOW
 
+config CPM_TSA
+	tristate "CPM TSA support"
+	depends on OF && HAS_IOMEM
+	depends on CPM1 || (PPC && COMPILE_TEST)
+	help
+	  Freescale CPM Time Slot Assigner (TSA)
+	  controller.
+
+	  This option enables support for this
+	  controller
+
 config QE_TDM
 	bool
 	default y if FSL_UCC_HDLC
diff --git a/drivers/soc/fsl/qe/Makefile b/drivers/soc/fsl/qe/Makefile
index 55a555304f3a..45c961acc81b 100644
--- a/drivers/soc/fsl/qe/Makefile
+++ b/drivers/soc/fsl/qe/Makefile
@@ -4,6 +4,7 @@
 #
 obj-$(CONFIG_QUICC_ENGINE)+= qe.o qe_common.o qe_ic.o qe_io.o
 obj-$(CONFIG_CPM)	+= qe_common.o
+obj-$(CONFIG_CPM_TSA)	+= tsa.o
 obj-$(CONFIG_UCC)	+= ucc.o
 obj-$(CONFIG_UCC_SLOW)	+= ucc_slow.o
 obj-$(CONFIG_UCC_FAST)	+= ucc_fast.o
diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
new file mode 100644
index 000000000000..91b4c89fa5b3
--- /dev/null
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -0,0 +1,864 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TSA driver
+ *
+ * Copyright 2022 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include "tsa.h"
+#include <dt-bindings/soc/fsl,tsa.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+
+/* TSA SI RAM routing tables entry */
+#define TSA_SIRAM_ENTRY_LAST		(1 << 16)
+#define TSA_SIRAM_ENTRY_BYTE		(1 << 17)
+#define TSA_SIRAM_ENTRY_CNT(x)		(((x) & 0x0f) << 18)
+#define TSA_SIRAM_ENTRY_CSEL_MASK	(0x7 << 22)
+#define TSA_SIRAM_ENTRY_CSEL_NU		(0x0 << 22)
+#define TSA_SIRAM_ENTRY_CSEL_SCC2	(0x2 << 22)
+#define TSA_SIRAM_ENTRY_CSEL_SCC3	(0x3 << 22)
+#define TSA_SIRAM_ENTRY_CSEL_SCC4	(0x4 << 22)
+#define TSA_SIRAM_ENTRY_CSEL_SMC1	(0x5 << 22)
+#define TSA_SIRAM_ENTRY_CSEL_SMC2	(0x6 << 22)
+
+/* SI mode register (32 bits) */
+#define TSA_SIMODE	0x00
+#define   TSA_SIMODE_SMC2			0x80000000
+#define   TSA_SIMODE_SMC1			0x00008000
+#define   TSA_SIMODE_TDMA(x)			((x) << 0)
+#define   TSA_SIMODE_TDMB(x)			((x) << 16)
+#define     TSA_SIMODE_TDM_MASK			0x0fff
+#define     TSA_SIMODE_TDM_SDM_MASK		0x0c00
+#define       TSA_SIMODE_TDM_SDM_NORM		0x0000
+#define       TSA_SIMODE_TDM_SDM_ECHO		0x0400
+#define       TSA_SIMODE_TDM_SDM_INTL_LOOP	0x0800
+#define       TSA_SIMODE_TDM_SDM_LOOP_CTRL	0x0c00
+#define     TSA_SIMODE_TDM_RFSD(x)		((x) << 8)
+#define     TSA_SIMODE_TDM_DSC			0x0080
+#define     TSA_SIMODE_TDM_CRT			0x0040
+#define     TSA_SIMODE_TDM_STZ			0x0020
+#define     TSA_SIMODE_TDM_CE			0x0010
+#define     TSA_SIMODE_TDM_FE			0x0008
+#define     TSA_SIMODE_TDM_GM			0x0004
+#define     TSA_SIMODE_TDM_TFSD(x)		((x) << 0)
+
+/* SI global mode register (8 bits) */
+#define TSA_SIGMR	0x04
+#define TSA_SIGMR_ENB			(1<<3)
+#define TSA_SIGMR_ENA			(1<<2)
+#define TSA_SIGMR_RDM_MASK		0x03
+#define   TSA_SIGMR_RDM_STATIC_TDMA	0x00
+#define   TSA_SIGMR_RDM_DYN_TDMA	0x01
+#define   TSA_SIGMR_RDM_STATIC_TDMAB	0x02
+#define   TSA_SIGMR_RDM_DYN_TDMAB	0x03
+
+/* SI status register (8 bits) */
+#define TSA_SISTR	0x06
+
+/* SI command register (8 bits) */
+#define TSA_SICMR	0x07
+
+/* SI clock route register (32 bits) */
+#define TSA_SICR	0x0C
+#define   TSA_SICR_SCC2(x)		((x) << 8)
+#define   TSA_SICR_SCC3(x)		((x) << 16)
+#define   TSA_SICR_SCC4(x)		((x) << 24)
+#define     TSA_SICR_SCC_MASK		0x0ff
+#define     TSA_SICR_SCC_GRX		(1 << 7)
+#define     TSA_SICR_SCC_SCX_TSA	(1 << 6)
+#define     TSA_SICR_SCC_RXCS_MASK	(0x7 << 3)
+#define       TSA_SICR_SCC_RXCS_BRG1	(0x0 << 3)
+#define       TSA_SICR_SCC_RXCS_BRG2	(0x1 << 3)
+#define       TSA_SICR_SCC_RXCS_BRG3	(0x2 << 3)
+#define       TSA_SICR_SCC_RXCS_BRG4	(0x3 << 3)
+#define       TSA_SICR_SCC_RXCS_CLK15	(0x4 << 3)
+#define       TSA_SICR_SCC_RXCS_CLK26	(0x5 << 3)
+#define       TSA_SICR_SCC_RXCS_CLK37	(0x6 << 3)
+#define       TSA_SICR_SCC_RXCS_CLK48	(0x7 << 3)
+#define     TSA_SICR_SCC_TXCS_MASK	(0x7 << 0)
+#define       TSA_SICR_SCC_TXCS_BRG1	(0x0 << 0)
+#define       TSA_SICR_SCC_TXCS_BRG2	(0x1 << 0)
+#define       TSA_SICR_SCC_TXCS_BRG3	(0x2 << 0)
+#define       TSA_SICR_SCC_TXCS_BRG4	(0x3 << 0)
+#define       TSA_SICR_SCC_TXCS_CLK15	(0x4 << 0)
+#define       TSA_SICR_SCC_TXCS_CLK26	(0x5 << 0)
+#define       TSA_SICR_SCC_TXCS_CLK37	(0x6 << 0)
+#define       TSA_SICR_SCC_TXCS_CLK48	(0x7 << 0)
+
+/* Serial interface RAM pointer register (32 bits) */
+#define TSA_SIRP	0x10
+
+struct tsa_entries_area {
+	void *__iomem entries_start;
+	void *__iomem entries_next;
+	void *__iomem last_entry;
+};
+
+struct tsa_tdm {
+	bool is_enable;
+	struct clk *l1rclk_clk;
+	struct clk *l1rsync_clk;
+	struct clk *l1tclk_clk;
+	struct clk *l1tsync_clk;
+	u32 simode_tdm;
+};
+
+#define TSA_TDMA	0
+#define TSA_TDMB	1
+
+struct tsa {
+	struct device *dev;
+	void *__iomem si_regs;
+	void *__iomem si_ram;
+	resource_size_t si_ram_sz;
+	spinlock_t	lock;
+	int tdms; /* TSA_TDMx ORed */
+	struct tsa_tdm tdm[2]; /* TDMa and TDMb */
+	struct tsa_serial {
+		unsigned int id;
+		struct tsa_serial_info info;
+	} serials[6];
+};
+
+static inline struct tsa *tsa_serial_get_tsa(struct tsa_serial *tsa_serial)
+{
+	/* The serials table is indexed by the serial id */
+	return container_of(tsa_serial, struct tsa, serials[tsa_serial->id]);
+}
+
+static inline void tsa_write32(void *__iomem addr, u32 val)
+{
+	iowrite32be(val, addr);
+}
+
+static inline u32 tsa_read32(void *__iomem addr)
+{
+	return ioread32be(addr);
+}
+
+static inline void tsa_clrbits32(void *__iomem addr, u32 clr)
+{
+	tsa_write32(addr, tsa_read32(addr) & ~clr);
+}
+
+static inline void tsa_clrsetbits32(void *__iomem addr, u32 clr, u32 set)
+{
+	tsa_write32(addr, (tsa_read32(addr) & ~clr) | set);
+}
+
+int tsa_serial_connect(struct tsa_serial *tsa_serial)
+{
+	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
+	unsigned long flags;
+	u32 clear;
+	u32 set;
+
+	switch (tsa_serial->id) {
+	case FSL_CPM_TSA_SCC2:
+		clear = TSA_SICR_SCC2(TSA_SICR_SCC_MASK);
+		set = TSA_SICR_SCC2(TSA_SICR_SCC_SCX_TSA);
+		break;
+	case FSL_CPM_TSA_SCC3:
+		clear = TSA_SICR_SCC3(TSA_SICR_SCC_MASK);
+		set = TSA_SICR_SCC3(TSA_SICR_SCC_SCX_TSA);
+		break;
+	case FSL_CPM_TSA_SCC4:
+		clear = TSA_SICR_SCC4(TSA_SICR_SCC_MASK);
+		set = TSA_SICR_SCC4(TSA_SICR_SCC_SCX_TSA);
+		break;
+	default:
+		dev_err(tsa->dev, "Unsupported serial id %u\n", tsa_serial->id);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&tsa->lock, flags);
+	tsa_clrsetbits32(tsa->si_regs + TSA_SICR, clear, set);
+	spin_unlock_irqrestore(&tsa->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL(tsa_serial_connect);
+
+int tsa_serial_disconnect(struct tsa_serial *tsa_serial)
+{
+	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
+	unsigned long flags;
+	u32 clear;
+
+	switch (tsa_serial->id) {
+	case FSL_CPM_TSA_SCC2:
+		clear = TSA_SICR_SCC2(TSA_SICR_SCC_MASK);
+		break;
+	case FSL_CPM_TSA_SCC3:
+		clear = TSA_SICR_SCC3(TSA_SICR_SCC_MASK);
+		break;
+	case FSL_CPM_TSA_SCC4:
+		clear = TSA_SICR_SCC4(TSA_SICR_SCC_MASK);
+		break;
+	default:
+		dev_err(tsa->dev, "Unsupported serial id %u\n", tsa_serial->id);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&tsa->lock, flags);
+	tsa_clrsetbits32(tsa->si_regs + TSA_SICR, clear, 0);
+	spin_unlock_irqrestore(&tsa->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL(tsa_serial_disconnect);
+
+int tsa_serial_get_info(struct tsa_serial *tsa_serial, struct tsa_serial_info *info)
+{
+	memcpy(info, &tsa_serial->info, sizeof(*info));
+	return 0;
+}
+EXPORT_SYMBOL(tsa_serial_get_info);
+
+static void tsa_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area,
+				  u32 tdms, u32 tdm_id, bool is_rx)
+{
+	resource_size_t quarter;
+	resource_size_t half;
+
+	quarter = tsa->si_ram_sz/4;
+	half = tsa->si_ram_sz/2;
+
+	if (tdms == BIT(TSA_TDMA)) {
+		/* Only TDMA */
+		if (is_rx) {
+			/* First half of si_ram */
+			area->entries_start = tsa->si_ram;
+			area->entries_next = area->entries_start + half;
+			area->last_entry = NULL;
+		} else {
+			/* Second half of si_ram */
+			area->entries_start = tsa->si_ram + half;
+			area->entries_next = area->entries_start + half;
+			area->last_entry = NULL;
+		}
+	} else {
+		/* Only TDMB or both TDMs */
+		if (tdm_id == TSA_TDMA) {
+			if (is_rx) {
+				/* First half of first half of si_ram */
+				area->entries_start = tsa->si_ram;
+				area->entries_next = area->entries_start + quarter;
+				area->last_entry = NULL;
+			} else {
+				/* First half of second half of si_ram */
+				area->entries_start = tsa->si_ram + (2 * quarter);
+				area->entries_next = area->entries_start + quarter;
+				area->last_entry = NULL;
+			}
+		} else {
+			if (is_rx) {
+				/* Second half of first half of si_ram */
+				area->entries_start = tsa->si_ram + quarter;
+				area->entries_next = area->entries_start + quarter;
+				area->last_entry = NULL;
+			} else {
+				/* Second half of second half of si_ram */
+				area->entries_start = tsa->si_ram + (3 * quarter);
+				area->entries_next = area->entries_start + quarter;
+				area->last_entry = NULL;
+			}
+		}
+	}
+}
+
+static const char *tsa_serial_id2name(struct tsa *tsa, u32 serial_id)
+{
+	switch (serial_id) {
+	case FSL_CPM_TSA_NU:	return "Not used";
+	case FSL_CPM_TSA_SCC2:	return "SCC2";
+	case FSL_CPM_TSA_SCC3:	return "SCC3";
+	case FSL_CPM_TSA_SCC4:	return "SCC4";
+	case FSL_CPM_TSA_SMC1:	return "SMC1";
+	case FSL_CPM_TSA_SMC2:	return "SMC2";
+	default:
+		break;
+	}
+	return NULL;
+}
+
+static u32 tsa_serial_id2csel(struct tsa *tsa, u32 serial_id)
+{
+	switch (serial_id) {
+	case FSL_CPM_TSA_SCC2:	return TSA_SIRAM_ENTRY_CSEL_SCC2;
+	case FSL_CPM_TSA_SCC3:	return TSA_SIRAM_ENTRY_CSEL_SCC3;
+	case FSL_CPM_TSA_SCC4:	return TSA_SIRAM_ENTRY_CSEL_SCC4;
+	case FSL_CPM_TSA_SMC1:	return TSA_SIRAM_ENTRY_CSEL_SMC1;
+	case FSL_CPM_TSA_SMC2:	return TSA_SIRAM_ENTRY_CSEL_SMC2;
+	default:
+		break;
+	}
+	return TSA_SIRAM_ENTRY_CSEL_NU;
+}
+
+static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
+			 u32 count, u32 serial_id)
+{
+	void *__iomem addr;
+	u32 left;
+	u32 val;
+	u32 cnt;
+	u32 nb;
+
+	addr = area->last_entry ? area->last_entry + 4 : area->entries_start;
+
+	nb = DIV_ROUND_UP(count, 8);
+	if ((addr + (nb * 4)) > area->entries_next) {
+		dev_err(tsa->dev, "si ram area full\n");
+		return -ENOSPC;
+	}
+
+	if (area->last_entry) {
+		/* Clear last flag */
+		tsa_clrbits32(area->last_entry, TSA_SIRAM_ENTRY_LAST);
+	}
+
+	left = count;
+	while (left) {
+		val = TSA_SIRAM_ENTRY_BYTE | tsa_serial_id2csel(tsa, serial_id);
+
+		if (left > 16) {
+			cnt = 16;
+		} else {
+			cnt = left;
+			val |= TSA_SIRAM_ENTRY_LAST;
+			area->last_entry = addr;
+		}
+		val |= TSA_SIRAM_ENTRY_CNT(cnt - 1);
+
+		tsa_write32(addr, val);
+		addr += 4;
+		left -= cnt;
+	}
+
+	return 0;
+}
+
+static int tsa_of_parse_tdm_route(struct tsa *tsa, struct device_node *tdm_np,
+				  u32 tdms, u32 tdm_id, bool is_rx)
+{
+	struct tsa_entries_area area;
+	const char *route_name;
+	u32 serial_id;
+	int len, i;
+	u32 count;
+	const char *serial_name;
+	struct tsa_serial_info *serial_info;
+	struct tsa_tdm *tdm;
+	int ret;
+	u32 ts;
+
+	route_name = is_rx ? "fsl,rx-ts-routes" : "fsl,tx-ts-routes";
+
+	len = of_property_count_u32_elems(tdm_np,  route_name);
+	if (len < 0) {
+		dev_err(tsa->dev, "%pOF: failed to read %s\n", tdm_np, route_name);
+		return len;
+	}
+	if (len % 2 != 0) {
+		dev_err(tsa->dev, "%pOF: wrong %s format\n", tdm_np, route_name);
+		return -EINVAL;
+	}
+
+	tsa_init_entries_area(tsa, &area, tdms, tdm_id, is_rx);
+	ts = 0;
+	for (i = 0; i < len; i += 2) {
+		of_property_read_u32_index(tdm_np, route_name, i, &count);
+		of_property_read_u32_index(tdm_np, route_name, i + 1, &serial_id);
+
+		if (serial_id >= ARRAY_SIZE(tsa->serials)) {
+			dev_err(tsa->dev, "%pOF: invalid serial id (%u)\n",
+				tdm_np, serial_id);
+			return -EINVAL;
+		}
+
+		serial_name = tsa_serial_id2name(tsa, serial_id);
+		if (!serial_name) {
+			dev_err(tsa->dev, "%pOF: unsupported serial id (%u)\n",
+				tdm_np, serial_id);
+			return -EINVAL;
+		}
+
+		dev_dbg(tsa->dev, "tdm_id=%u, %s ts %u..%u -> %s\n",
+			tdm_id, route_name, ts, ts+count-1, serial_name);
+		ts += count;
+
+		ret = tsa_add_entry(tsa, &area, count, serial_id);
+		if (ret)
+			return ret;
+
+		serial_info = &tsa->serials[serial_id].info;
+		tdm = &tsa->tdm[tdm_id];
+		if (is_rx) {
+			serial_info->rx_fs_rate = clk_get_rate(tdm->l1rsync_clk);
+			serial_info->rx_bit_rate = clk_get_rate(tdm->l1rclk_clk);
+			serial_info->nb_rx_ts += count;
+		} else {
+			serial_info->tx_fs_rate = tdm->l1tsync_clk ?
+				clk_get_rate(tdm->l1tsync_clk) :
+				clk_get_rate(tdm->l1rsync_clk);
+			serial_info->tx_bit_rate = tdm->l1tclk_clk ?
+				clk_get_rate(tdm->l1tclk_clk) :
+				clk_get_rate(tdm->l1rclk_clk);
+			serial_info->nb_tx_ts += count;
+		}
+	}
+	return 0;
+}
+
+static inline int tsa_of_parse_tdm_rx_route(struct tsa *tsa,
+					    struct device_node *tdm_np,
+					    u32 tdms, u32 tdm_id)
+{
+	return tsa_of_parse_tdm_route(tsa, tdm_np, tdms, tdm_id, true);
+}
+
+static inline int tsa_of_parse_tdm_tx_route(struct tsa *tsa,
+					    struct device_node *tdm_np,
+					    u32 tdms, u32 tdm_id)
+{
+	return tsa_of_parse_tdm_route(tsa, tdm_np, tdms, tdm_id, false);
+}
+
+static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
+{
+	struct device_node *tdm_np;
+	struct tsa_tdm *tdm;
+	struct clk *clk;
+	const char *mode;
+	u32 tdm_id, val;
+	int ret;
+	int i;
+
+	tsa->tdms = 0;
+	tsa->tdm[0].is_enable = false;
+	tsa->tdm[1].is_enable = false;
+
+	for_each_available_child_of_node(np, tdm_np) {
+		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
+		if (ret) {
+			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
+			of_node_put(tdm_np);
+			return ret;
+		}
+		switch (tdm_id) {
+		case 0:
+			tsa->tdms |= BIT(TSA_TDMA);
+			break;
+		case 1:
+			tsa->tdms |= BIT(TSA_TDMB);
+			break;
+		default:
+			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n", tdm_np,
+				tdm_id);
+			of_node_put(tdm_np);
+			return -EINVAL;
+		}
+	}
+
+	for_each_available_child_of_node(np, tdm_np) {
+		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
+		if (ret) {
+			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
+			of_node_put(tdm_np);
+			return ret;
+		}
+
+		tdm = &tsa->tdm[tdm_id];
+
+		mode = "disabled";
+		ret = of_property_read_string(tdm_np, "fsl,diagnostic-mode", &mode);
+		if (ret && ret != -EINVAL) {
+			dev_err(tsa->dev, "%pOF: failed to read fsl,diagnostic-mode\n",
+				tdm_np);
+			of_node_put(tdm_np);
+			return ret;
+		}
+		if (!strcmp(mode, "disabled")) {
+			tdm->simode_tdm |= TSA_SIMODE_TDM_SDM_NORM;
+		} else if (!strcmp(mode, "echo")) {
+			tdm->simode_tdm |= TSA_SIMODE_TDM_SDM_ECHO;
+		} else if (!strcmp(mode, "internal-loopback")) {
+			tdm->simode_tdm |= TSA_SIMODE_TDM_SDM_INTL_LOOP;
+		} else if (!strcmp(mode, "control-loopback")) {
+			tdm->simode_tdm |= TSA_SIMODE_TDM_SDM_LOOP_CTRL;
+		} else {
+			dev_err(tsa->dev, "%pOF: Invalid fsl,diagnostic-mode (%s)\n",
+				tdm_np, mode);
+			of_node_put(tdm_np);
+			return -EINVAL;
+		}
+
+		val = 0;
+		ret = of_property_read_u32(tdm_np, "fsl,rx-frame-sync-delay-bits",
+					   &val);
+		if (ret && ret != -EINVAL) {
+			dev_err(tsa->dev,
+				"%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
+				tdm_np);
+			of_node_put(tdm_np);
+			return ret;
+		}
+		if (val > 3) {
+			dev_err(tsa->dev,
+				"%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
+				tdm_np, val);
+			of_node_put(tdm_np);
+			return -EINVAL;
+		}
+		tdm->simode_tdm |= TSA_SIMODE_TDM_RFSD(val);
+
+		val = 0;
+		ret = of_property_read_u32(tdm_np, "fsl,tx-frame-sync-delay-bits",
+					   &val);
+		if (ret && ret != -EINVAL) {
+			dev_err(tsa->dev,
+				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n",
+				tdm_np);
+			of_node_put(tdm_np);
+			return ret;
+		}
+		if (val > 3) {
+			dev_err(tsa->dev,
+				"%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
+				tdm_np, val);
+			of_node_put(tdm_np);
+			return -EINVAL;
+		}
+		tdm->simode_tdm |= TSA_SIMODE_TDM_TFSD(val);
+
+		if (of_property_read_bool(tdm_np, "fsl,common-rxtx-pins"))
+			tdm->simode_tdm |= TSA_SIMODE_TDM_CRT;
+
+		if (of_property_read_bool(tdm_np, "fsl,clock-falling-edge"))
+			tdm->simode_tdm |= TSA_SIMODE_TDM_CE;
+
+		if (of_property_read_bool(tdm_np, "fsl,fsync-rising-edge"))
+			tdm->simode_tdm |= TSA_SIMODE_TDM_FE;
+
+		if (of_property_read_bool(tdm_np, "fsl,double-speed-clock"))
+			tdm->simode_tdm |= TSA_SIMODE_TDM_DSC;
+
+		clk = of_clk_get_by_name(tdm_np, "l1rsync");
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			of_node_put(tdm_np);
+			goto err;
+		}
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			clk_put(clk);
+			of_node_put(tdm_np);
+			goto err;
+		}
+		tdm->l1rsync_clk = clk;
+
+		clk = of_clk_get_by_name(tdm_np, "l1rclk");
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			of_node_put(tdm_np);
+			goto err;
+		}
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			clk_put(clk);
+			of_node_put(tdm_np);
+			goto err;
+		}
+		tdm->l1rclk_clk = clk;
+
+		if (!(tdm->simode_tdm & TSA_SIMODE_TDM_CRT)) {
+			clk = of_clk_get_by_name(tdm_np, "l1tsync");
+			if (IS_ERR(clk)) {
+				ret = PTR_ERR(clk);
+				of_node_put(tdm_np);
+				goto err;
+			}
+			ret = clk_prepare_enable(clk);
+			if (ret) {
+				clk_put(clk);
+				of_node_put(tdm_np);
+				goto err;
+			}
+			tdm->l1tsync_clk = clk;
+
+			clk = of_clk_get_by_name(tdm_np, "l1tclk");
+			if (IS_ERR(clk)) {
+				ret = PTR_ERR(clk);
+				of_node_put(tdm_np);
+				goto err;
+			}
+			ret = clk_prepare_enable(clk);
+			if (ret) {
+				clk_put(clk);
+				of_node_put(tdm_np);
+				goto err;
+			}
+			tdm->l1tclk_clk = clk;
+		}
+
+		ret = tsa_of_parse_tdm_rx_route(tsa, tdm_np, tsa->tdms, tdm_id);
+		if (ret) {
+			of_node_put(tdm_np);
+			goto err;
+		}
+
+		ret = tsa_of_parse_tdm_tx_route(tsa, tdm_np, tsa->tdms, tdm_id);
+		if (ret) {
+			of_node_put(tdm_np);
+			goto err;
+		}
+
+		tdm->is_enable = true;
+	}
+	return 0;
+
+err:
+	for (i = 0; i < 2; i++) {
+		if (tsa->tdm[i].l1rsync_clk) {
+			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
+			clk_put(tsa->tdm[i].l1rsync_clk);
+		}
+		if (tsa->tdm[i].l1rclk_clk) {
+			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
+			clk_put(tsa->tdm[i].l1rclk_clk);
+		}
+		if (tsa->tdm[i].l1tsync_clk) {
+			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
+			clk_put(tsa->tdm[i].l1rsync_clk);
+		}
+		if (tsa->tdm[i].l1tclk_clk) {
+			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
+			clk_put(tsa->tdm[i].l1rclk_clk);
+		}
+	}
+	return ret;
+}
+
+static void tsa_init_si_ram(struct tsa *tsa)
+{
+	resource_size_t i;
+
+	/* Fill all entries as the last one */
+	for (i = 0; i < tsa->si_ram_sz; i += 4)
+		tsa_write32(tsa->si_ram + i, TSA_SIRAM_ENTRY_LAST);
+}
+
+static int tsa_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct resource *res;
+	struct tsa *tsa;
+	unsigned int i;
+	u32 val;
+	int ret;
+
+	tsa = devm_kzalloc(&pdev->dev, sizeof(*tsa), GFP_KERNEL);
+	if (!tsa)
+		return -ENOMEM;
+
+	tsa->dev = &pdev->dev;
+
+	for (i = 0; i < ARRAY_SIZE(tsa->serials); i++)
+		tsa->serials[i].id = i;
+
+	spin_lock_init(&tsa->lock);
+
+	tsa->si_regs = devm_platform_ioremap_resource_byname(pdev, "si_regs");
+	if (IS_ERR(tsa->si_regs))
+		return PTR_ERR(tsa->si_regs);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "si_ram");
+	if (!res) {
+		dev_err(tsa->dev, "si_ram resource missing\n");
+		return -EINVAL;
+	}
+	tsa->si_ram_sz = resource_size(res);
+	tsa->si_ram = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(tsa->si_ram))
+		return PTR_ERR(tsa->si_ram);
+
+	tsa_init_si_ram(tsa);
+
+	ret = tsa_of_parse_tdms(tsa, np);
+	if (ret)
+		return ret;
+
+	/* Set SIMODE */
+	val = 0;
+	if (tsa->tdm[0].is_enable)
+		val |= TSA_SIMODE_TDMA(tsa->tdm[0].simode_tdm);
+	if (tsa->tdm[1].is_enable)
+		val |= TSA_SIMODE_TDMB(tsa->tdm[1].simode_tdm);
+
+	tsa_clrsetbits32(tsa->si_regs + TSA_SIMODE,
+			 TSA_SIMODE_TDMA(TSA_SIMODE_TDM_MASK) |
+			 TSA_SIMODE_TDMB(TSA_SIMODE_TDM_MASK),
+			 val);
+
+	/* Set SIGMR */
+	val = (tsa->tdms == BIT(TSA_TDMA)) ?
+		TSA_SIGMR_RDM_STATIC_TDMA : TSA_SIGMR_RDM_STATIC_TDMAB;
+	if (tsa->tdms & BIT(TSA_TDMA))
+		val |= TSA_SIGMR_ENA;
+	if (tsa->tdms & BIT(TSA_TDMB))
+		val |= TSA_SIGMR_ENB;
+	out_8(tsa->si_regs + TSA_SIGMR, val);
+
+	platform_set_drvdata(pdev, tsa);
+
+	return 0;
+}
+
+static int tsa_remove(struct platform_device *pdev)
+{
+	struct tsa *tsa = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		if (tsa->tdm[i].l1rsync_clk) {
+			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
+			clk_put(tsa->tdm[i].l1rsync_clk);
+		}
+		if (tsa->tdm[i].l1rclk_clk) {
+			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
+			clk_put(tsa->tdm[i].l1rclk_clk);
+		}
+		if (tsa->tdm[i].l1tsync_clk) {
+			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
+			clk_put(tsa->tdm[i].l1rsync_clk);
+		}
+		if (tsa->tdm[i].l1tclk_clk) {
+			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
+			clk_put(tsa->tdm[i].l1rclk_clk);
+		}
+	}
+	return 0;
+}
+
+static const struct of_device_id tsa_id_table[] = {
+	{ .compatible = "fsl,cpm1-tsa" },
+	{} /* sentinel */
+};
+MODULE_DEVICE_TABLE(of, tsa_id_table);
+
+static struct platform_driver tsa_driver = {
+	.driver = {
+		.name = "fsl-tsa",
+		.of_match_table = of_match_ptr(tsa_id_table),
+	},
+	.probe = tsa_probe,
+	.remove = tsa_remove,
+};
+module_platform_driver(tsa_driver);
+
+struct tsa_serial *tsa_serial_get_byphandle(struct device_node *np,
+					    const char *phandle_name)
+{
+	struct of_phandle_args out_args;
+	struct platform_device *pdev;
+	struct tsa_serial *tsa_serial;
+	struct tsa *tsa;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(np, phandle_name, 1, 0, &out_args);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	if (!of_match_node(tsa_driver.driver.of_match_table, out_args.np)) {
+		of_node_put(out_args.np);
+		return ERR_PTR(-EINVAL);
+	}
+
+	pdev = of_find_device_by_node(out_args.np);
+	of_node_put(out_args.np);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
+
+	tsa = platform_get_drvdata(pdev);
+	if (!tsa) {
+		platform_device_put(pdev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	if (out_args.args_count != 1) {
+		platform_device_put(pdev);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (out_args.args[0] >= ARRAY_SIZE(tsa->serials)) {
+		platform_device_put(pdev);
+		return ERR_PTR(-EINVAL);
+	}
+
+	tsa_serial = &tsa->serials[out_args.args[0]];
+
+	/*
+	 * Be sure that the serial id matches the phandle arg.
+	 * The tsa_serials table is indexed by serial ids. The serial id is set
+	 * during the probe() call and needs to be coherent.
+	 */
+	if (WARN_ON(tsa_serial->id != out_args.args[0])) {
+		platform_device_put(pdev);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return tsa_serial;
+}
+EXPORT_SYMBOL(tsa_serial_get_byphandle);
+
+void tsa_serial_put(struct tsa_serial *tsa_serial)
+{
+	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
+
+	put_device(tsa->dev);
+}
+EXPORT_SYMBOL(tsa_serial_put);
+
+static void devm_tsa_serial_release(struct device *dev, void *res)
+{
+	struct tsa_serial **tsa_serial = res;
+
+	tsa_serial_put(*tsa_serial);
+}
+
+struct tsa_serial *devm_tsa_serial_get_byphandle(struct device *dev,
+						 struct device_node *np,
+						 const char *phandle_name)
+{
+	struct tsa_serial *tsa_serial;
+	struct tsa_serial **dr;
+
+	dr = devres_alloc(devm_tsa_serial_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return ERR_PTR(-ENOMEM);
+
+	tsa_serial = tsa_serial_get_byphandle(np, phandle_name);
+	if (!IS_ERR(tsa_serial)) {
+		*dr = tsa_serial;
+		devres_add(dev, dr);
+	} else {
+		devres_free(dr);
+	}
+
+	return tsa_serial;
+}
+EXPORT_SYMBOL(devm_tsa_serial_get_byphandle);
+
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
+MODULE_DESCRIPTION("CPM TSA driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/fsl/qe/tsa.h b/drivers/soc/fsl/qe/tsa.h
new file mode 100644
index 000000000000..030e79bb978a
--- /dev/null
+++ b/drivers/soc/fsl/qe/tsa.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TSA management
+ *
+ * Copyright 2022 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+#ifndef __SOC_FSL_TSA_H__
+#define __SOC_FSL_TSA_H__
+
+#include <linux/types.h>
+
+struct device_node;
+struct device;
+struct tsa_serial;
+
+struct tsa_serial *tsa_serial_get_byphandle(struct device_node *np,
+					    const char *phandle_name);
+void tsa_serial_tsa_put(struct tsa_serial *tsa_serial);
+struct tsa_serial *devm_tsa_serial_get_byphandle(struct device *dev,
+						 struct device_node *np,
+						 const char *phandle_name);
+
+/* Connect and disconnect the TSA serial */
+int tsa_serial_connect(struct tsa_serial *tsa_serial);
+int tsa_serial_disconnect(struct tsa_serial *tsa_serial);
+
+/* Cell information */
+struct tsa_serial_info {
+	unsigned long rx_fs_rate;
+	unsigned long rx_bit_rate;
+	u8 nb_rx_ts;
+	unsigned long tx_fs_rate;
+	unsigned long tx_bit_rate;
+	u8 nb_tx_ts;
+};
+
+/* Get information */
+int tsa_serial_get_info(struct tsa_serial *tsa_serial, struct tsa_serial_info *info);
+
+#endif /* __SOC_FSL_TSA_H__ */
-- 
2.39.0

