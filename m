Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E268575415F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 19:51:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2fDm5zGXz3cKs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 03:51:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.45; helo=mail-io1-f45.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2fCh4Dr7z3c84
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 03:50:56 +1000 (AEST)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-786bb09e595so75950539f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 10:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357054; x=1691949054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E98a2yvC7PZw9G7VNZ3jl/uWZ6nfMs7tfW0dJG+DL34=;
        b=QLMrg3w8vjKPrPqwZrSLRGqywyjpiBNYXonbLM3Yj4jD5N3IMHYnMsKBRwr+xI1FEe
         FiS8ViAZj/8MGNfpOAkD9RFouW55VuHWwDSgAS7qAPJIIb18MYVNcs6xnrHso9NTWf77
         I9+Eai3FN/47SC9ssNQ4zNhLdk1IhkzRoDzvRvY8f+YI6fwcOlzLRbP05yInKZrtODU4
         rwMP8T14T9UHlw7X7F0iZ9TKEui4EzIsqC0Yu9Oyw4BUY2buGmer1Ce4X8/OVSieih2P
         lrsuxfyKbrtKjUKGh3HHuqQ7I/RPdKv6nQVNV78BsmEcw8/YItVUXa0InLzBvtXTLYTu
         QJuA==
X-Gm-Message-State: ABy/qLYFGRgb/+Byg1PGiU8K1vn/RfTD3ky+8dWLgVw+1pRDNIFryJQP
	F0AALSZF9eWyqnIyUm4hsA==
X-Google-Smtp-Source: APBJJlELJmYKATXYWjd+34RxjaAhxV1/zP4UXsIi932YyZY04Pgdka5T8D6EiuaO06olBAFls8Xh3A==
X-Received: by 2002:a05:6e02:782:b0:346:3b4:8b77 with SMTP id q2-20020a056e02078200b0034603b48b77mr2451139ils.12.1689357053757;
        Fri, 14 Jul 2023 10:50:53 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id w5-20020a92d605000000b00345fcbce508sm2882358ilm.39.2023.07.14.10.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:50:52 -0700 (PDT)
Received: (nullmailer pid 4065261 invoked by uid 1000);
	Fri, 14 Jul 2023 17:50:28 -0000
From: Rob Herring <robh@kernel.org>
To: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Li Yang <leoyang.li@nxp.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Herve Codina <herve.codina@bootlin.com>, Michal Simek <michal.simek@amd.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	Richard Leitner <richard.leitner@linux.dev>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] usb: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:50:23 -0600
Message-Id: <20230714175027.4065135-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/usb/cdns3/cdns3-gadget.c                    | 1 +
 drivers/usb/cdns3/cdns3-plat.c                      | 1 +
 drivers/usb/cdns3/cdns3-ti.c                        | 1 +
 drivers/usb/cdns3/core.c                            | 1 +
 drivers/usb/chipidea/ci_hdrc_imx.c                  | 1 +
 drivers/usb/chipidea/ci_hdrc_tegra.c                | 3 ++-
 drivers/usb/chipidea/usbmisc_imx.c                  | 3 ++-
 drivers/usb/common/common.c                         | 1 +
 drivers/usb/core/message.c                          | 1 +
 drivers/usb/core/of.c                               | 1 -
 drivers/usb/core/usb.c                              | 1 +
 drivers/usb/dwc2/gadget.c                           | 1 -
 drivers/usb/dwc2/platform.c                         | 2 +-
 drivers/usb/dwc3/dwc3-imx8mp.c                      | 1 +
 drivers/usb/dwc3/dwc3-keystone.c                    | 1 +
 drivers/usb/gadget/udc/fsl_udc_core.c               | 1 -
 drivers/usb/gadget/udc/gr_udc.c                     | 5 ++---
 drivers/usb/gadget/udc/max3420_udc.c                | 4 +---
 drivers/usb/gadget/udc/pxa27x_udc.c                 | 2 +-
 drivers/usb/gadget/udc/renesas_usb3.c               | 2 +-
 drivers/usb/gadget/udc/renesas_usbf.c               | 5 ++---
 drivers/usb/gadget/udc/tegra-xudc.c                 | 1 -
 drivers/usb/gadget/udc/udc-xilinx.c                 | 6 ++----
 drivers/usb/host/ehci-fsl.c                         | 2 +-
 drivers/usb/host/ehci-orion.c                       | 2 --
 drivers/usb/host/fhci-hcd.c                         | 3 ++-
 drivers/usb/host/fsl-mph-dr-of.c                    | 4 +++-
 drivers/usb/host/ohci-at91.c                        | 2 +-
 drivers/usb/host/ohci-da8xx.c                       | 1 +
 drivers/usb/host/ohci-ppc-of.c                      | 3 ++-
 drivers/usb/host/xhci-plat.c                        | 1 -
 drivers/usb/host/xhci-rcar.c                        | 1 -
 drivers/usb/host/xhci-tegra.c                       | 2 +-
 drivers/usb/misc/usb251xb.c                         | 2 +-
 drivers/usb/mtu3/mtu3.h                             | 1 +
 drivers/usb/mtu3/mtu3_host.c                        | 1 +
 drivers/usb/musb/jz4740.c                           | 2 +-
 drivers/usb/musb/mediatek.c                         | 1 +
 drivers/usb/musb/mpfs.c                             | 1 +
 drivers/usb/musb/musb_dsps.c                        | 2 --
 drivers/usb/musb/sunxi.c                            | 1 -
 drivers/usb/phy/phy-mxs-usb.c                       | 2 +-
 drivers/usb/phy/phy-tegra-usb.c                     | 2 +-
 drivers/usb/renesas_usbhs/common.c                  | 2 +-
 drivers/usb/renesas_usbhs/rza.c                     | 2 +-
 drivers/usb/renesas_usbhs/rza2.c                    | 1 -
 drivers/usb/typec/tcpm/fusb302.c                    | 2 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c       | 2 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 --
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c  | 1 -
 drivers/usb/typec/ucsi/ucsi_glink.c                 | 1 -
 51 files changed, 47 insertions(+), 48 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index ea19253fd2d0..e6f6aeb7b5bb 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -61,6 +61,7 @@
 #include <linux/module.h>
 #include <linux/dmapool.h>
 #include <linux/iopoll.h>
+#include <linux/property.h>
 
 #include "core.h"
 #include "gadget-export.h"
diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 884e2301237f..b15ff5bd91c2 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index 81b9132e3aaa..5945c4b1e11f 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 
 /* USB Wrapper register offsets */
 #define USBSS_PID		0x0
diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index dbcdf3b24b47..baa154cee352 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -14,6 +14,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 336ef6dd8e7d..aa2aebed8e2d 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index ca36d11a69ea..8e78bf643e25 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -6,7 +6,8 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 9ee9621e2ccc..e8a712e5abad 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -4,10 +4,11 @@
  */
 
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/platform_device.h>
 #include <linux/usb/otg.h>
 
 #include "ci_hdrc_imx.h"
diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index c9bdeb4ddcb5..b84efae26e15 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/of.h>
 #include <linux/usb/otg.h>
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index b5811620f1de..0d2bfc909019 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -9,6 +9,7 @@
 #include <linux/pci.h>	/* for scatterlist macros */
 #include <linux/usb.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
 #include <linux/timer.h>
diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index 617e92569b2c..db4ccf9ce3d9 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -8,7 +8,6 @@
  */
 
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/usb/of.h>
 
 /**
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 901ec732321c..396a338d801e 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -25,6 +25,7 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/of.h>
 #include <linux/string.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 8b15742d9e8a..b517a7216de2 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -22,7 +22,6 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/slab.h>
-#include <linux/of_platform.h>
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 0a806f80217e..b1d48019e944 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -11,7 +11,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 8b9a3bb587bf..4285bde58d2e 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
index 0a09aedc2573..4155e8d5a559 100644
--- a/drivers/usb/dwc3/dwc3-keystone.c
+++ b/drivers/usb/dwc3/dwc3-keystone.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index a67873a074b7..5265ca418cde 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -36,7 +36,6 @@
 #include <linux/platform_device.h>
 #include <linux/fsl_devices.h>
 #include <linux/dmapool.h>
-#include <linux/of_device.h>
 
 #include <asm/byteorder.h>
 #include <asm/io.h>
diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index 09762559912d..0c3969301a53 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -23,6 +23,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/errno.h>
@@ -36,9 +37,7 @@
 #include <linux/dmapool.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
-#include <linux/of_platform.h>
-#include <linux/of_irq.h>
-#include <linux/of_address.h>
+#include <linux/of.h>
 
 #include <asm/byteorder.h>
 
diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
index 12c519f32bf7..2d57786d3db7 100644
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -19,9 +19,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/bitfield.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/prefetch.h>
 #include <linux/usb/ch9.h>
diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index c4e1d957f913..61424cfd2e1c 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -23,7 +23,7 @@
 #include <linux/prefetch.h>
 #include <linux/byteorder/generic.h>
 #include <linux/platform_data/pxa2xx_udc.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 
 #include <linux/usb.h>
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 59bb25de2015..3b01734ce1b7 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -14,7 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
index 6cd0af83e91e..3482b41d0646 100644
--- a/drivers/usb/gadget/udc/renesas_usbf.c
+++ b/drivers/usb/gadget/udc/renesas_usbf.c
@@ -12,10 +12,9 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/kfifo.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
 #include <linux/usb/composite.h>
diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 83eaa65ddde3..065046f1c9cb 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -16,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/tegra/xusb.h>
 #include <linux/pm_domain.h>
diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index a4a7b90a97e7..0a025bf14e06 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -18,10 +18,8 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
-#include <linux/of_irq.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/prefetch.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 81d60a695510..3c776f4de4b8 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -22,7 +22,7 @@
 #include <linux/usb/otg.h>
 #include <linux/platform_device.h>
 #include <linux/fsl_devices.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/io.h>
 
 #include "ehci.h"
diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index 2cfb27dc943a..a5f4e2f98346 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -13,8 +13,6 @@
 #include <linux/platform_data/usb-ehci-orion.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/io.h>
diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 66a045e01dad..9a1b5224f239 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -22,9 +22,10 @@
 #include <linux/io.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/gpio/consumer.h>
 #include <soc/fsl/qe/qe.h>
diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index a9877f2569f4..2574bccc151b 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -10,10 +10,12 @@
 #include <linux/fsl_devices.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/dma-mapping.h>
+#include <linux/of.h>
 
 struct fsl_usb2_dev_data {
 	char *dr_mode;		/* controller mode */
diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
index b9ce8d80f20b..3b023ea71f8d 100644
--- a/drivers/usb/host/ohci-at91.c
+++ b/drivers/usb/host/ohci-at91.c
@@ -17,13 +17,13 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/atmel.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index e4191a868944..9bd6cb9af364 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -15,6 +15,7 @@
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_data/usb-davinci.h>
diff --git a/drivers/usb/host/ohci-ppc-of.c b/drivers/usb/host/ohci-ppc-of.c
index 35a7ad7e2569..f64bfe5f4d4d 100644
--- a/drivers/usb/host/ohci-ppc-of.c
+++ b/drivers/usb/host/ohci-ppc-of.c
@@ -15,9 +15,10 @@
  */
 
 #include <linux/signal.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 static int
 ohci_ppc_of_start(struct usb_hcd *hcd)
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index b26ea7cb4357..28218c8f1837 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/usb/phy.h>
 #include <linux/slab.h>
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index bf5261fed32c..ab9c5969e462 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/usb/phy.h>
 
 #include "xhci.h"
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 6ca8a37e53e1..51e236c1ff71 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -14,7 +14,7 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/tegra/xusb.h>
diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index e4edb486b69e..7da404f55a6d 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -16,7 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/nls.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index b4a7662dded5..c11840b9a6f1 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -16,6 +16,7 @@
 #include <linux/extcon.h>
 #include <linux/interrupt.h>
 #include <linux/list.h>
+#include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb.h>
diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index 177d2caf887c..9f2be22af844 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -11,6 +11,7 @@
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 5aabdd7e2511..b38df9226278 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -10,7 +10,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/usb/role.h>
diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index 598ee5c0bf34..0a35aab3ab81 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/usb/role.h>
diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 24b98716f7fc..f0f56df38835 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/usb/usb_phy_generic.h>
 #include "musb_core.h"
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index 9119b1d51370..98b42dc04dee 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -26,9 +26,7 @@
 #include <linux/sizes.h>
 
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/usb/of.h>
 
 #include <linux/debugfs.h>
diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index c5c6c4e09300..d54283fd026b 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -15,7 +15,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/phy/phy-sun4i-usb.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index e1a2b2ea098b..50cf0003384a 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -14,7 +14,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <linux/iopoll.h>
diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 8b2ff3a8882d..4ea47e6f835b 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -16,7 +16,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/resource.h>
 #include <linux/slab.h>
diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 111b7ee152c4..dd1c17542439 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -11,7 +11,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
diff --git a/drivers/usb/renesas_usbhs/rza.c b/drivers/usb/renesas_usbhs/rza.c
index 2d77edefb4b3..97b5217c5a90 100644
--- a/drivers/usb/renesas_usbhs/rza.c
+++ b/drivers/usb/renesas_usbhs/rza.c
@@ -8,7 +8,7 @@
 
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include "common.h"
 #include "rza.h"
 
diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs/rza2.c
index 3eed3334a17f..f079817250bb 100644
--- a/drivers/usb/renesas_usbhs/rza2.c
+++ b/drivers/usb/renesas_usbhs/rza2.c
@@ -8,7 +8,6 @@
 
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include "common.h"
 #include "rza.h"
diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 7fc1ffa14f76..bc21006e979c 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -15,7 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/proc_fs.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index a905160dd860..f2f3601cbbfb 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -8,7 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 4e1b846627d2..bb0b8479d80f 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -8,8 +8,6 @@
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 94285f64b67d..fdd916292675 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -9,7 +9,6 @@
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 1fe9cb5b6bd9..bb1854b3311d 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -5,7 +5,6 @@
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
-- 
2.40.1

