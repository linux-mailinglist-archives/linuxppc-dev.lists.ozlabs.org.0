Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F3879CE48
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 12:28:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=K/Nt+F/4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlKYv5x3Nz3dXN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 20:28:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=K/Nt+F/4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlKG70rznz3cSY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 20:15:10 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1ECA1E0005;
	Tue, 12 Sep 2023 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694513708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R5Vmkg+olMOjRIcjNkZoANn2I+50eI7k2pmguIMEeh8=;
	b=K/Nt+F/4m9aYpqPiy2Si6hjNXvj8ALPjvCRl4ednRgFkjG2Xdt8B1tht1grsoyTtXSSttR
	aMB/Oelh+vaZuBbO7a4RdYzNNoVw2ftVcBleU7yUaQlEPULWZDii7jxkN+NYeIZfWjvvil
	fL9OCVEzcGX3qUz8aGwklcOq5hQrPzE18R1PEuU5lpTnxsUQsKdpWwapnh3VphdOggcGb1
	gyoKAebxZEws5O5tHXBZRmAY5cvwTfNTvWHek1Gsu59QeE5IyXqvXUkAlEoSpnzfdEzC4i
	8oXrot9pyRg4SwSKyZS2NV9z8TOi+W6SLmEAgw21rYnw6iir31OnnCLSb4AxbQ==
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
Subject: [PATCH v5 28/31] pinctrl: Add support for the Lantic PEF2256 pinmux
Date: Tue, 12 Sep 2023 12:15:05 +0200
Message-ID: <20230912101505.225899-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912081527.208499-1-herve.codina@bootlin.com>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
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

The Lantiq PEF2256 is a framer and line interface component designed to
fulfill all required interfacing between an analog E1/T1/J1 line and the
digital PCM system highway/H.100 bus.

This kind of component can be found in old telecommunication system.
It was used to digital transmission of many simultaneous telephone calls
by time-division multiplexing. Also using HDLC protocol, WAN networks
can be reached through the framer.

This pinmux support handles the pin muxing part (pins RP(A..D) and pins
XP(A..D)) of the PEF2256.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/pinctrl/Kconfig                |  14 ++
 drivers/pinctrl/Makefile               |   1 +
 drivers/pinctrl/pinctrl-pef2256-regs.h |  65 ++++++
 drivers/pinctrl/pinctrl-pef2256.c      | 308 +++++++++++++++++++++++++
 4 files changed, 388 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-pef2256-regs.h
 create mode 100644 drivers/pinctrl/pinctrl-pef2256.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 7dfb7190580e..2e8687310c61 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -366,6 +366,20 @@ config PINCTRL_PALMAS
 	  open drain configuration for the Palmas series devices like
 	  TPS65913, TPS80036 etc.
 
+config PINCTRL_PEF2256
+	tristate "Lantiq PEF2256 (FALC56) pin controller driver"
+	depends on OF && FRAMER_PEF2256
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+	  This option enables the pin controller support for the Lantiq PEF2256
+	  framer, also known as FALC56.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called pinctrl-pef2256.
+
 config PINCTRL_PIC32
 	bool "Microchip PIC32 pin controller driver"
 	depends on OF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index dd6cda270294..800c4219fcc1 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_PINCTRL_MICROCHIP_SGPIO)	+= pinctrl-microchip-sgpio.o
 obj-$(CONFIG_PINCTRL_MLXBF3)	+= pinctrl-mlxbf3.o
 obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
+obj-$(CONFIG_PINCTRL_PEF2256)	+= pinctrl-pef2256.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
diff --git a/drivers/pinctrl/pinctrl-pef2256-regs.h b/drivers/pinctrl/pinctrl-pef2256-regs.h
new file mode 100644
index 000000000000..cacc492a1623
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-pef2256-regs.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * PEF2256 pinctrl registers definition
+ *
+ * Copyright 2023 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+#ifndef __PEF2256_PINCTRL_REGS_H__
+#define __PEF2256_PINCTRL_REGS_H__
+
+#include <linux/bitfield.h>
+
+/* Port Configuration 1..4 */
+#define PEF2256_PC1		  0x80
+#define PEF2256_PC2		  0x81
+#define PEF2256_PC3		  0x82
+#define PEF2256_PC4		  0x83
+#define PEF2256_12_PC_RPC_MASK	  GENMASK(6, 4)
+#define PEF2256_12_PC_RPC_SYPR	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x0)
+#define PEF2256_12_PC_RPC_RFM	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x1)
+#define PEF2256_12_PC_RPC_RFMB	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x2)
+#define PEF2256_12_PC_RPC_RSIGM	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x3)
+#define PEF2256_12_PC_RPC_RSIG	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x4)
+#define PEF2256_12_PC_RPC_DLR	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x5)
+#define PEF2256_12_PC_RPC_FREEZE  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x6)
+#define PEF2256_12_PC_RPC_RFSP	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x7)
+#define PEF2256_12_PC_XPC_MASK    GENMASK(4, 0)
+#define PEF2256_12_PC_XPC_SYPX	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x0)
+#define PEF2256_12_PC_XPC_XFMS	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x1)
+#define PEF2256_12_PC_XPC_XSIG	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x2)
+#define PEF2256_12_PC_XPC_TCLK	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x3)
+#define PEF2256_12_PC_XPC_XMFB	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x4)
+#define PEF2256_12_PC_XPC_XSIGM	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x5)
+#define PEF2256_12_PC_XPC_DLX	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x6)
+#define PEF2256_12_PC_XPC_XCLK	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x7)
+#define PEF2256_12_PC_XPC_XLT	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x8)
+#define PEF2256_2X_PC_RPC_MASK	  GENMASK(7, 4)
+#define PEF2256_2X_PC_RPC_SYPR	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x0)
+#define PEF2256_2X_PC_RPC_RFM	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x1)
+#define PEF2256_2X_PC_RPC_RFMB	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x2)
+#define PEF2256_2X_PC_RPC_RSIGM	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x3)
+#define PEF2256_2X_PC_RPC_RSIG	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x4)
+#define PEF2256_2X_PC_RPC_DLR	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x5)
+#define PEF2256_2X_PC_RPC_FREEZE  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x6)
+#define PEF2256_2X_PC_RPC_RFSP	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x7)
+#define PEF2256_2X_PC_RPC_GPI	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x9)
+#define PEF2256_2X_PC_RPC_GPOH	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0xa)
+#define PEF2256_2X_PC_RPC_GPOL	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0xb)
+#define PEF2256_2X_PC_RPC_LOS	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0xc)
+#define PEF2256_2X_PC_XPC_MASK	  GENMASK(3, 0)
+#define PEF2256_2X_PC_XPC_SYPX	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x0)
+#define PEF2256_2X_PC_XPC_XFMS	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x1)
+#define PEF2256_2X_PC_XPC_XSIG	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x2)
+#define PEF2256_2X_PC_XPC_TCLK	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x3)
+#define PEF2256_2X_PC_XPC_XMFB	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x4)
+#define PEF2256_2X_PC_XPC_XSIGM	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x5)
+#define PEF2256_2X_PC_XPC_DLX	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x6)
+#define PEF2256_2X_PC_XPC_XCLK	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x7)
+#define PEF2256_2X_PC_XPC_XLT	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x8)
+#define PEF2256_2X_PC_XPC_GPI	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x9)
+#define PEF2256_2X_PC_XPC_GPOH	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0xa)
+#define PEF2256_2X_PC_XPC_GPOL	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0xb)
+
+#endif /* __PEF2256_PINCTRL_REGS_H__ */
diff --git a/drivers/pinctrl/pinctrl-pef2256.c b/drivers/pinctrl/pinctrl-pef2256.c
new file mode 100644
index 000000000000..773f701ecf23
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-pef2256.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PEF2256 also known as FALC56 driver
+ *
+ * Copyright 2023 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/framer/pef2256.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include "pinctrl-pef2256-regs.h"
+
+struct pef2256_pinreg_desc {
+	int offset;
+	u8 mask;
+};
+
+struct pef2256_function_desc {
+	const char *name;
+	const char * const*groups;
+	unsigned int ngroups;
+	u8 func_val;
+};
+
+struct pef2256_pinctrl {
+	struct device *dev;
+	struct regmap *regmap;
+	enum pef2256_version version;
+	struct pinctrl_desc pctrl_desc;
+	const struct pef2256_function_desc *functions;
+	unsigned int nfunctions;
+};
+
+static int pef2256_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	/* We map 1 group <-> 1 pin */
+	return pef2256->pctrl_desc.npins;
+}
+
+static const char *pef2256_get_group_name(struct pinctrl_dev *pctldev,
+					  unsigned int selector)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	/* We map 1 group <-> 1 pin */
+	return pef2256->pctrl_desc.pins[selector].name;
+}
+
+static int pef2256_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
+				  const unsigned int **pins,
+				  unsigned int *num_pins)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	/* We map 1 group <-> 1 pin */
+	*pins = &pef2256->pctrl_desc.pins[selector].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static const struct pinctrl_ops pef2256_pctlops = {
+	.get_groups_count	= pef2256_get_groups_count,
+	.get_group_name		= pef2256_get_group_name,
+	.get_group_pins		= pef2256_get_group_pins,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map		= pinconf_generic_dt_free_map,
+};
+
+static int pef2256_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	return pef2256->nfunctions;
+}
+
+static const char *pef2256_get_function_name(struct pinctrl_dev *pctldev,
+					     unsigned int selector)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	return pef2256->functions[selector].name;
+}
+
+static int pef2256_get_function_groups(struct pinctrl_dev *pctldev, unsigned int selector,
+				       const char * const **groups,
+				       unsigned * const num_groups)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = pef2256->functions[selector].groups;
+	*num_groups = pef2256->functions[selector].ngroups;
+	return 0;
+}
+
+static int pef2256_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+			   unsigned int group_selector)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+	const struct pef2256_pinreg_desc *pinreg_desc;
+	u8 func_val;
+
+	/* We map 1 group <-> 1 pin */
+	pinreg_desc = pef2256->pctrl_desc.pins[group_selector].drv_data;
+	func_val = pef2256->functions[func_selector].func_val;
+
+	return regmap_update_bits(pef2256->regmap, pinreg_desc->offset,
+				  pinreg_desc->mask, func_val);
+}
+
+static const struct pinmux_ops pef2256_pmxops = {
+	.get_functions_count	= pef2256_get_functions_count,
+	.get_function_name	= pef2256_get_function_name,
+	.get_function_groups	= pef2256_get_function_groups,
+	.set_mux		= pef2256_set_mux,
+};
+
+#define PEF2256_PINCTRL_PIN(_number, _name, _offset, _mask) { \
+	.number = _number, \
+	.name = _name, \
+	.drv_data = &(struct pef2256_pinreg_desc) { \
+		.offset = _offset, \
+		.mask = _mask, \
+	}, \
+}
+
+static const struct pinctrl_pin_desc pef2256_v12_pins[] = {
+	PEF2256_PINCTRL_PIN(0, "RPA", PEF2256_PC1, PEF2256_12_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(1, "RPB", PEF2256_PC2, PEF2256_12_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(2, "RPC", PEF2256_PC3, PEF2256_12_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(3, "RPD", PEF2256_PC4, PEF2256_12_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(4, "XPA", PEF2256_PC1, PEF2256_12_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(5, "XPB", PEF2256_PC2, PEF2256_12_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(6, "XPC", PEF2256_PC3, PEF2256_12_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(7, "XPD", PEF2256_PC4, PEF2256_12_PC_XPC_MASK),
+};
+
+static const struct pinctrl_pin_desc pef2256_v2x_pins[] = {
+	PEF2256_PINCTRL_PIN(0, "RPA", PEF2256_PC1, PEF2256_2X_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(1, "RPB", PEF2256_PC2, PEF2256_2X_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(2, "RPC", PEF2256_PC3, PEF2256_2X_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(3, "RPD", PEF2256_PC4, PEF2256_2X_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(4, "XPA", PEF2256_PC1, PEF2256_2X_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(5, "XPB", PEF2256_PC2, PEF2256_2X_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(6, "XPC", PEF2256_PC3, PEF2256_2X_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(7, "XPD", PEF2256_PC4, PEF2256_2X_PC_XPC_MASK),
+};
+
+static const char *const pef2256_rp_groups[] = { "RPA", "RPB", "RPC", "RPD" };
+static const char *const pef2256_xp_groups[] = { "XPA", "XPB", "XPC", "XPD" };
+static const char *const pef2256_all_groups[] = { "RPA", "RPB", "RPC", "RPD",
+						  "XPA", "XPB", "XPC", "XPD" };
+
+#define PEF2256_FUNCTION(_name, _func_val, _groups) { \
+	.name = _name, \
+	.groups = _groups, \
+	.ngroups = ARRAY_SIZE(_groups), \
+	.func_val = _func_val, \
+}
+
+static const struct pef2256_function_desc pef2256_v2x_functions[] = {
+	PEF2256_FUNCTION("SYPR",   PEF2256_2X_PC_RPC_SYPR,   pef2256_rp_groups),
+	PEF2256_FUNCTION("RFM",    PEF2256_2X_PC_RPC_RFM,    pef2256_rp_groups),
+	PEF2256_FUNCTION("RFMB",   PEF2256_2X_PC_RPC_RFMB,   pef2256_rp_groups),
+	PEF2256_FUNCTION("RSIGM",  PEF2256_2X_PC_RPC_RSIGM,  pef2256_rp_groups),
+	PEF2256_FUNCTION("RSIG",   PEF2256_2X_PC_RPC_RSIG,   pef2256_rp_groups),
+	PEF2256_FUNCTION("DLR",    PEF2256_2X_PC_RPC_DLR,    pef2256_rp_groups),
+	PEF2256_FUNCTION("FREEZE", PEF2256_2X_PC_RPC_FREEZE, pef2256_rp_groups),
+	PEF2256_FUNCTION("RFSP",   PEF2256_2X_PC_RPC_RFSP,   pef2256_rp_groups),
+	PEF2256_FUNCTION("LOS",    PEF2256_2X_PC_RPC_LOS,    pef2256_rp_groups),
+
+	PEF2256_FUNCTION("SYPX",  PEF2256_2X_PC_XPC_SYPX,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XFMS",  PEF2256_2X_PC_XPC_XFMS,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XSIG",  PEF2256_2X_PC_XPC_XSIG,  pef2256_xp_groups),
+	PEF2256_FUNCTION("TCLK",  PEF2256_2X_PC_XPC_TCLK,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XMFB",  PEF2256_2X_PC_XPC_XMFB,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XSIGM", PEF2256_2X_PC_XPC_XSIGM, pef2256_xp_groups),
+	PEF2256_FUNCTION("DLX",   PEF2256_2X_PC_XPC_DLX,   pef2256_xp_groups),
+	PEF2256_FUNCTION("XCLK",  PEF2256_2X_PC_XPC_XCLK,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XLT",   PEF2256_2X_PC_XPC_XLT,   pef2256_xp_groups),
+
+	PEF2256_FUNCTION("GPI",  PEF2256_2X_PC_RPC_GPI | PEF2256_2X_PC_XPC_GPI,
+			 pef2256_all_groups),
+	PEF2256_FUNCTION("GPOH", PEF2256_2X_PC_RPC_GPOH | PEF2256_2X_PC_XPC_GPOH,
+			 pef2256_all_groups),
+	PEF2256_FUNCTION("GPOL", PEF2256_2X_PC_RPC_GPOL | PEF2256_2X_PC_XPC_GPOL,
+			 pef2256_all_groups),
+};
+
+static const struct pef2256_function_desc pef2256_v12_functions[] = {
+	PEF2256_FUNCTION("SYPR",   PEF2256_12_PC_RPC_SYPR,   pef2256_rp_groups),
+	PEF2256_FUNCTION("RFM",    PEF2256_12_PC_RPC_RFM,    pef2256_rp_groups),
+	PEF2256_FUNCTION("RFMB",   PEF2256_12_PC_RPC_RFMB,   pef2256_rp_groups),
+	PEF2256_FUNCTION("RSIGM",  PEF2256_12_PC_RPC_RSIGM,  pef2256_rp_groups),
+	PEF2256_FUNCTION("RSIG",   PEF2256_12_PC_RPC_RSIG,   pef2256_rp_groups),
+	PEF2256_FUNCTION("DLR",    PEF2256_12_PC_RPC_DLR,    pef2256_rp_groups),
+	PEF2256_FUNCTION("FREEZE", PEF2256_12_PC_RPC_FREEZE, pef2256_rp_groups),
+	PEF2256_FUNCTION("RFSP",   PEF2256_12_PC_RPC_RFSP,   pef2256_rp_groups),
+
+	PEF2256_FUNCTION("SYPX",  PEF2256_12_PC_XPC_SYPX,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XFMS",  PEF2256_12_PC_XPC_XFMS,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XSIG",  PEF2256_12_PC_XPC_XSIG,  pef2256_xp_groups),
+	PEF2256_FUNCTION("TCLK",  PEF2256_12_PC_XPC_TCLK,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XMFB",  PEF2256_12_PC_XPC_XMFB,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XSIGM", PEF2256_12_PC_XPC_XSIGM, pef2256_xp_groups),
+	PEF2256_FUNCTION("DLX",   PEF2256_12_PC_XPC_DLX,   pef2256_xp_groups),
+	PEF2256_FUNCTION("XCLK",  PEF2256_12_PC_XPC_XCLK,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XLT",   PEF2256_12_PC_XPC_XLT,   pef2256_xp_groups),
+};
+
+static int pef2256_register_pinctrl(struct pef2256_pinctrl *pef2256)
+{
+	struct pinctrl_dev	*pctrl;
+
+	pef2256->pctrl_desc.name    = dev_name(pef2256->dev);
+	pef2256->pctrl_desc.owner   = THIS_MODULE;
+	pef2256->pctrl_desc.pctlops = &pef2256_pctlops;
+	pef2256->pctrl_desc.pmxops  = &pef2256_pmxops;
+	if (pef2256->version == PEF2256_VERSION_1_2) {
+		pef2256->pctrl_desc.pins  = pef2256_v12_pins;
+		pef2256->pctrl_desc.npins = ARRAY_SIZE(pef2256_v12_pins);
+		pef2256->functions  = pef2256_v12_functions;
+		pef2256->nfunctions = ARRAY_SIZE(pef2256_v12_functions);
+	} else {
+		pef2256->pctrl_desc.pins  = pef2256_v2x_pins;
+		pef2256->pctrl_desc.npins = ARRAY_SIZE(pef2256_v2x_pins);
+		pef2256->functions  = pef2256_v2x_functions;
+		pef2256->nfunctions = ARRAY_SIZE(pef2256_v2x_functions);
+	}
+
+	pctrl = devm_pinctrl_register(pef2256->dev, &pef2256->pctrl_desc, pef2256);
+	if (IS_ERR(pctrl)) {
+		dev_err(pef2256->dev, "pinctrl driver registration failed\n");
+		return PTR_ERR(pctrl);
+	}
+
+	return 0;
+}
+
+static void pef2256_reset_pinmux(struct pef2256_pinctrl *pef2256)
+{
+	u8 val;
+	/*
+	 * Reset values cannot be used.
+	 * They define the SYPR/SYPX pin mux for all the RPx and XPx pins and
+	 * Only one pin can be muxed to SYPR and one pin can be muxed to SYPX.
+	 * Choose here an other reset value.
+	 */
+	if (pef2256->version == PEF2256_VERSION_1_2)
+		val = PEF2256_12_PC_XPC_XCLK | PEF2256_12_PC_RPC_RFSP;
+	else
+		val = PEF2256_2X_PC_XPC_GPI | PEF2256_2X_PC_RPC_GPI;
+
+	regmap_write(pef2256->regmap, PEF2256_PC1, val);
+	regmap_write(pef2256->regmap, PEF2256_PC2, val);
+	regmap_write(pef2256->regmap, PEF2256_PC3, val);
+	regmap_write(pef2256->regmap, PEF2256_PC4, val);
+}
+
+static int pef2256_pinctrl_probe(struct platform_device *pdev)
+{
+	struct pef2256_pinctrl *pef2256_pinctrl;
+	struct pef2256 *pef2256;
+	int ret;
+
+	pef2256_pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pef2256_pinctrl), GFP_KERNEL);
+	if (!pef2256_pinctrl)
+		return -ENOMEM;
+
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
+	pef2256 = dev_get_drvdata(pdev->dev.parent);
+
+	pef2256_pinctrl->dev = &pdev->dev;
+	pef2256_pinctrl->regmap = pef2256_get_regmap(pef2256);
+	pef2256_pinctrl->version = pef2256_get_version(pef2256);
+
+	platform_set_drvdata(pdev, pef2256_pinctrl);
+
+	pef2256_reset_pinmux(pef2256_pinctrl);
+	ret = pef2256_register_pinctrl(pef2256_pinctrl);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static struct platform_driver pef2256_pinctrl_driver = {
+	.driver = {
+		.name = "lantiq-pef2256-pinctrl",
+	},
+	.probe = pef2256_pinctrl_probe,
+};
+module_platform_driver(pef2256_pinctrl_driver);
+
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
+MODULE_DESCRIPTION("PEF2256 pin controller driver");
+MODULE_LICENSE("GPL");
-- 
2.41.0

