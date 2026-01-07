Return-Path: <linuxppc-dev+bounces-15389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A890CFEFB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 18:02:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmZ8M1LNNz2yGb;
	Thu, 08 Jan 2026 04:02:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767805331;
	cv=none; b=lH64YyqM5OHQEjUfxP+Rw5+Xne/cnOxvaRlLdhg64RzfVukN1/QRC5mF0ZOgsY7g7xV9zIGPoP/5Fo+P3t7CeRJM220JKKUI9N2HmmPQayEoHzFOJiyrGCgLnS3ud/TKMJ8gzTiGikeHArAz1Yrmh3IcSaDVzcw3k9qvJP6/Afxjm/hFLRXow6J8tXv/Vv4KK/1XOeCmpHRqs400ZfOe4agakCw1RsrK+Un3irarxSsMHms3IzLoLUXjtArpjJ1jNTJVyAep3O1kafOH4DJWp9hFPhYkqX6QdPlVqJN6ZduLbwrhmhRbZXaQXQAu3GngGaZcUyQR8/w1JFthYrxkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767805331; c=relaxed/relaxed;
	bh=vgrEnHqzzfakQhmmHFp1B1QvY5RJkQVdELnl1PwxAIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MsMbXmUrAsWO2w0g+bkx3j8gEs639KPUhqsjfP07j6oR7cbsC62hSgUCDbS5zhVb9FWT2vesvfI3PUbTeXSpHztaa6ErkiGaGZjDV9nOvEZh61oNtsp9nRYgmOEwyc2ZuwVqgDUtIgDm+DDbMu7B1R1nGz+Tz0qyLR8t9wfbkBLGTdRgvhMwmNhmaTE+ij8+yUL746h+NgLfXDd817OGTyHjjGEe6Dp4P16s3hT6UiWpMQKe30HLBb91rLniM2VH/+I/T8D3MiIsLkWlPhqQtISGnM9BBxRFrKaQR4CgF708+CixEmuHKxyVY1DOO6fVp8V8H4Uj7Y2djuI8sVLAgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Iw6UZ1+A; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Iw6UZ1+A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmZ8L2FWcz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 04:02:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA6B360052;
	Wed,  7 Jan 2026 17:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A560AC4CEF1;
	Wed,  7 Jan 2026 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767805297;
	bh=vuaqU2+UQa4l4XhYPSEtsdBqZ8uggdOI/bePQ2STgaY=;
	h=From:To:Cc:Subject:Date:From;
	b=Iw6UZ1+AlwPE2wJXj+So//chZoABFSb5yRd/9WbZVA/sRFCFoQMD2M19860rAYM7H
	 hMjQHTYiqYGSjlrfUzvgIABY6IrRC+5qIOKkNL54rRoXVOnwg/g7XpyESJKL5auk5F
	 OajAbL5Qgg0/xhzH3/wmCo74J5BVsE04ycVT7Ek3EA8OlBr0xK6lugLRblKdoGCji/
	 eNfQeOYHNfWBHw3EsTeiBO41ME5AOnucvNX4C6IwCcgWFiY5OlVRvU5SqBRDTBTP1I
	 9P9xZWVpTOK3fCCcJXkZO3sVZ2eBEINu2umEIFnkMRbLnQ9VwOk5TXXdcolxVGc1pr
	 uWVEKZPIEtsOQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Wed,  7 Jan 2026 17:59:09 +0100
Message-ID: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4650; i=chleroy@kernel.org; h=from:subject:message-id; bh=vuaqU2+UQa4l4XhYPSEtsdBqZ8uggdOI/bePQ2STgaY=; b=kA0DAAoW3ZBwJryrz1MByyZiAGlekN2hmvl0ztk5l6yfmzkQAIaMYnQXJOHvwuN12GB/flln2 Ih1BAAWCgAdFiEEx/8LupiK9GVvlbov3ZBwJryrz1MFAmlekN0ACgkQ3ZBwJryrz1N/CgEAgAcp PTV+B0XR6jcVncX1fS3p7ZnbCrVLnZT+QwsvN8oA/itwjwkP30YCZ6zOjJZRVUhs73PAiNQ556g UMG3TJboC
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for it so that those IRQs can then
be linked to the related GPIOs.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 drivers/soc/fsl/qe/Makefile      |   2 +-
 drivers/soc/fsl/qe/qe_ports_ic.c | 142 +++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

diff --git a/drivers/soc/fsl/qe/Makefile b/drivers/soc/fsl/qe/Makefile
index ec8506e131136..901a9c40d5eb7 100644
--- a/drivers/soc/fsl/qe/Makefile
+++ b/drivers/soc/fsl/qe/Makefile
@@ -11,4 +11,4 @@ obj-$(CONFIG_UCC_SLOW)	+= ucc_slow.o
 obj-$(CONFIG_UCC_FAST)	+= ucc_fast.o
 obj-$(CONFIG_QE_TDM)	+= qe_tdm.o
 obj-$(CONFIG_QE_USB)	+= usb.o
-obj-$(CONFIG_QE_GPIO)	+= gpio.o
+obj-$(CONFIG_QE_GPIO)	+= gpio.o qe_ports_ic.o
diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
new file mode 100644
index 0000000000000..61dd09fec6f6e
--- /dev/null
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * QUICC ENGINE I/O Ports Interrupt Controller
+ *
+ * Copyright (c) 2025 Christophe Leroy CS GROUP France (christophe.leroy@csgroup.eu)
+ */
+
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/platform_device.h>
+
+/* QE IC registers offset */
+#define CEPIER		0x0c
+#define CEPIMR		0x10
+#define CEPICR		0x14
+
+struct qepic_data {
+	void __iomem *reg;
+	struct irq_domain *host;
+};
+
+static void qepic_mask(struct irq_data *d)
+{
+	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+
+	clrbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
+}
+
+static void qepic_unmask(struct irq_data *d)
+{
+	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+
+	setbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
+}
+
+static void qepic_end(struct irq_data *d)
+{
+	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+
+	out_be32(data->reg + CEPIER, 1 << (31 - irqd_to_hwirq(d)));
+}
+
+static int qepic_set_type(struct irq_data *d, unsigned int flow_type)
+{
+	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+	unsigned int vec = (unsigned int)irqd_to_hwirq(d);
+
+	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_FALLING:
+		setbits32(data->reg + CEPICR, 1 << (31 - vec));
+		return 0;
+	case IRQ_TYPE_EDGE_BOTH:
+	case IRQ_TYPE_NONE:
+		clrbits32(data->reg + CEPICR, 1 << (31 - vec));
+		return 0;
+	}
+	return -EINVAL;
+}
+
+static struct irq_chip qepic = {
+	.name = "QEPIC",
+	.irq_mask = qepic_mask,
+	.irq_unmask = qepic_unmask,
+	.irq_eoi = qepic_end,
+	.irq_set_type = qepic_set_type,
+};
+
+static int qepic_get_irq(struct irq_desc *desc)
+{
+	struct qepic_data *data = irq_desc_get_handler_data(desc);
+	u32 event = in_be32(data->reg + CEPIER);
+
+	if (!event)
+		return -1;
+
+	return irq_find_mapping(data->host, 32 - ffs(event));
+}
+
+static void qepic_cascade(struct irq_desc *desc)
+{
+	generic_handle_irq(qepic_get_irq(desc));
+}
+
+static int qepic_host_map(struct irq_domain *h, unsigned int virq, irq_hw_number_t hw)
+{
+	irq_set_chip_data(virq, h->host_data);
+	irq_set_chip_and_handler(virq, &qepic, handle_fasteoi_irq);
+	return 0;
+}
+
+static const struct irq_domain_ops qepic_host_ops = {
+	.map = qepic_host_map,
+};
+
+static int qepic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct qepic_data *data;
+	int irq;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->reg))
+		return PTR_ERR(data->reg);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	data->host = irq_domain_add_linear(dev->of_node, 32, &qepic_host_ops, data);
+	if (!data->host)
+		return -ENODEV;
+
+	irq_set_handler_data(irq, data);
+	irq_set_chained_handler(irq, qepic_cascade);
+
+	return 0;
+}
+
+static const struct of_device_id qepic_match[] = {
+	{
+		.compatible = "fsl,mpc8323-qe-ports-ic",
+	},
+	{},
+};
+
+static struct platform_driver qepic_driver = {
+	.driver	= {
+		.name		= "qe_ports_ic",
+		.of_match_table	= qepic_match,
+	},
+	.probe	= qepic_probe,
+};
+
+static int __init qepic_init(void)
+{
+	return platform_driver_register(&qepic_driver);
+}
+arch_initcall(qepic_init);
-- 
2.49.0


