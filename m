Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 531FC75415B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 19:51:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2fD51yylz3cND
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 03:51:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.173; helo=mail-il1-f173.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2fCb124vz3c3k
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 03:50:51 +1000 (AEST)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3464c774f23so9782575ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 10:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357049; x=1691949049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaw00yMxGJGRJdIygNJuXQl3uxTjHBXTV1DPEy5+uDw=;
        b=PNE1ugHZAVqwToC4/Xg2XkJpYm15yyvvlDBaphxWdExSZ88SDkGeD8kmY82nrZBw7I
         WGqwUWPhCW4aDO/DSo56EulGGnBdh+7zZgWy68dw8JXRmArPgdsQHdVoJoHg2agpfApk
         4XEn2jc8u6PSvuKKMJLuwQjG8kpdUugkKqVqEOmYPEpqvhjLB82Nmw8VbVbasL3+/hoZ
         NwJJWSOPoi2gQimytPOd/1hBjAUYN6TxPb3ZidbpbvtfccdZ86RRNdhhzQVyRT9yhVsT
         rJB2rmIiw77QRqsdvIJImjDM7YysxzQZ4X07puBMqgYmwLIJZDxFeN2bTL4XyIMQcIUT
         zHjg==
X-Gm-Message-State: ABy/qLaXCUmUdRa2bHXrH6NNgVCj7XJKh42rj+ONZ380QTzM0eL2/dNB
	aYJnstQqsb9GVL5ysnRe9g==
X-Google-Smtp-Source: APBJJlEhNUc2vuMNMCUh8zw4wj/1hFpPNMRrjB7AN15Zunw1zSYsxrlp1muY9M9wVP9ot13KbIk8Jw==
X-Received: by 2002:a92:ce0d:0:b0:342:512a:ccec with SMTP id b13-20020a92ce0d000000b00342512accecmr4305890ilo.31.1689357048989;
        Fri, 14 Jul 2023 10:50:48 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id e7-20020a056638020700b0042b03d40279sm2814768jaq.80.2023.07.14.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:50:48 -0700 (PDT)
Received: (nullmailer pid 4064914 invoked by uid 1000);
	Fri, 14 Jul 2023 17:50:18 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Russell King <linux@armlinux.org.uk>, 
	Richard Genoud <richard.genoud@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
	Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Peter Korsgaard <jacmet@sunsite.dk>, Timur Tabi <timur@kernel.org>
Subject: [PATCH] tty: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:50:11 -0600
Message-Id: <20230714175013.4064763-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
 drivers/tty/hvc/hvc_opal.c             | 2 +-
 drivers/tty/serial/8250/8250_early.c   | 1 -
 drivers/tty/serial/8250/8250_ingenic.c | 1 -
 drivers/tty/serial/8250/8250_omap.c    | 1 -
 drivers/tty/serial/amba-pl011.c        | 2 +-
 drivers/tty/serial/apbuart.c           | 3 ---
 drivers/tty/serial/atmel_serial.c      | 1 -
 drivers/tty/serial/fsl_linflexuart.c   | 2 +-
 drivers/tty/serial/fsl_lpuart.c        | 2 +-
 drivers/tty/serial/imx.c               | 1 -
 drivers/tty/serial/lantiq.c            | 3 ++-
 drivers/tty/serial/liteuart.c          | 3 +--
 drivers/tty/serial/ma35d1_serial.c     | 2 +-
 drivers/tty/serial/mps2-uart.c         | 1 -
 drivers/tty/serial/mxs-auart.c         | 2 +-
 drivers/tty/serial/pic32_uart.c        | 1 -
 drivers/tty/serial/qcom_geni_serial.c  | 1 -
 drivers/tty/serial/serial-tegra.c      | 1 -
 drivers/tty/serial/sh-sci.c            | 1 -
 drivers/tty/serial/sunhv.c             | 4 ++--
 drivers/tty/serial/sunsab.c            | 3 ++-
 drivers/tty/serial/sunsu.c             | 4 ++--
 drivers/tty/serial/sunzilog.c          | 4 ++--
 drivers/tty/serial/tegra-tcu.c         | 1 -
 drivers/tty/serial/uartlite.c          | 3 ---
 drivers/tty/serial/ucc_uart.c          | 3 ++-
 drivers/tty/serial/vt8500_serial.c     | 2 +-
 27 files changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 794c7b18aa06..992e199e0ea8 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -14,7 +14,7 @@
 #include <linux/console.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
 
diff --git a/drivers/tty/serial/8250/8250_early.c b/drivers/tty/serial/8250/8250_early.c
index 4299a8bd83d9..9837a27739fd 100644
--- a/drivers/tty/serial/8250/8250_early.c
+++ b/drivers/tty/serial/8250/8250_early.c
@@ -27,7 +27,6 @@
 #include <linux/init.h>
 #include <linux/console.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/serial_reg.h>
 #include <linux/serial.h>
 #include <linux/serial_8250.h>
diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index 617b8ce60d6b..4c4c4da73ad0 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index d48a82f1634e..26dd089d8e82 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -18,7 +18,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <linux/delay.h>
diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index c5c3f4674459..a1e594b79890 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -20,6 +20,7 @@
 #include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/console.h>
+#include <linux/platform_device.h>
 #include <linux/sysrq.h>
 #include <linux/device.h>
 #include <linux/tty.h>
@@ -36,7 +37,6 @@
 #include <linux/delay.h>
 #include <linux/types.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/sizes.h>
 #include <linux/io.h>
diff --git a/drivers/tty/serial/apbuart.c b/drivers/tty/serial/apbuart.c
index 915ee4b0d594..f3defc6da3df 100644
--- a/drivers/tty/serial/apbuart.c
+++ b/drivers/tty/serial/apbuart.c
@@ -22,9 +22,6 @@
 #include <linux/kthread.h>
 #include <linux/device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/serial_core.h>
diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 3467a875641a..7ac477344aa3 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -21,7 +21,6 @@
 #include <linux/tty_flip.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/atmel_pdc.h>
diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index 6fc21b6684e6..f697751c2ad5 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -11,7 +11,7 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/serial_core.h>
 #include <linux/slab.h>
 #include <linux/tty_flip.h>
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index 4d80fae20177..e1a8d5415718 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -18,9 +18,9 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/serial_core.h>
 #include <linux/slab.h>
diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 7341d060f85c..3ed5083a7108 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -25,7 +25,6 @@
 #include <linux/rational.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/io.h>
 #include <linux/dma-mapping.h>
 
diff --git a/drivers/tty/serial/lantiq.c b/drivers/tty/serial/lantiq.c
index bcaa479608d8..3adb60c683f7 100644
--- a/drivers/tty/serial/lantiq.c
+++ b/drivers/tty/serial/lantiq.c
@@ -17,7 +17,8 @@
 #include <linux/ioport.h>
 #include <linux/lantiq.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
 #include <linux/slab.h>
diff --git a/drivers/tty/serial/liteuart.c b/drivers/tty/serial/liteuart.c
index 80de3a42b67b..d881cdd2a58f 100644
--- a/drivers/tty/serial/liteuart.c
+++ b/drivers/tty/serial/liteuart.c
@@ -11,8 +11,7 @@
 #include <linux/litex.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
 #include <linux/slab.h>
diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 2604b4d9fb78..789593495a80 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -8,7 +8,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/iopoll.h>
 #include <linux/serial_core.h>
 #include <linux/slab.h>
diff --git a/drivers/tty/serial/mps2-uart.c b/drivers/tty/serial/mps2-uart.c
index 860d161fa594..5da88cbeec73 100644
--- a/drivers/tty/serial/mps2-uart.c
+++ b/drivers/tty/serial/mps2-uart.c
@@ -16,7 +16,6 @@
 #include <linux/console.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index a368f4293967..3974ca6ad86c 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -30,7 +30,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 
diff --git a/drivers/tty/serial/pic32_uart.c b/drivers/tty/serial/pic32_uart.c
index 196a4e678451..e308d5022b3f 100644
--- a/drivers/tty/serial/pic32_uart.c
+++ b/drivers/tty/serial/pic32_uart.c
@@ -11,7 +11,6 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/of_gpio.h>
 #include <linux/init.h>
diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 444c74eeab7d..5607b668588b 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -11,7 +11,6 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pm_opp.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index 1cf08b33456c..cbe641727f2a 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -20,7 +20,6 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pagemap.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 7c9457962a3d..115271d2f82d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -35,7 +35,6 @@
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
diff --git a/drivers/tty/serial/sunhv.c b/drivers/tty/serial/sunhv.c
index 7d38c33ef506..c671d674bce4 100644
--- a/drivers/tty/serial/sunhv.c
+++ b/drivers/tty/serial/sunhv.c
@@ -17,11 +17,11 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/hypervisor.h>
 #include <asm/spitfire.h>
-#include <asm/prom.h>
 #include <asm/irq.h>
 #include <asm/setup.h>
 
diff --git a/drivers/tty/serial/sunsab.c b/drivers/tty/serial/sunsab.c
index 48b39fdb0397..40eeaf835bba 100644
--- a/drivers/tty/serial/sunsab.c
+++ b/drivers/tty/serial/sunsab.c
@@ -33,7 +33,8 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <linux/io.h>
 #include <asm/irq.h>
diff --git a/drivers/tty/serial/sunsu.c b/drivers/tty/serial/sunsu.c
index fed052a0b931..58a4342ad0f9 100644
--- a/drivers/tty/serial/sunsu.c
+++ b/drivers/tty/serial/sunsu.c
@@ -37,11 +37,11 @@
 #include <linux/serial_reg.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <linux/io.h>
 #include <asm/irq.h>
-#include <asm/prom.h>
 #include <asm/setup.h>
 
 #include <linux/serial_core.h>
diff --git a/drivers/tty/serial/sunzilog.c b/drivers/tty/serial/sunzilog.c
index 0fbeb3dbd843..c8c71c56264c 100644
--- a/drivers/tty/serial/sunzilog.c
+++ b/drivers/tty/serial/sunzilog.c
@@ -33,11 +33,11 @@
 #include <linux/serio.h>
 #endif
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <linux/io.h>
 #include <asm/irq.h>
-#include <asm/prom.h>
 #include <asm/setup.h>
 
 #include <linux/serial_core.h>
diff --git a/drivers/tty/serial/tegra-tcu.c b/drivers/tty/serial/tegra-tcu.c
index 23500b342da7..65069daf36ec 100644
--- a/drivers/tty/serial/tegra-tcu.c
+++ b/drivers/tty/serial/tegra-tcu.c
@@ -7,7 +7,6 @@
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 679574893ebe..b225a78f6175 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -20,9 +20,6 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 404230c1ebb2..284b293fade6 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -17,15 +17,16 @@
  */
 
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/io.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/dma-mapping.h>
 
 #include <linux/fs_uart_pd.h>
diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index cc9157df732f..32433e9b3e5f 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -14,6 +14,7 @@
 #include <linux/irq.h>
 #include <linux/init.h>
 #include <linux/console.h>
+#include <linux/platform_device.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/serial_core.h>
@@ -21,7 +22,6 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/err.h>
 
 /*
-- 
2.40.1

