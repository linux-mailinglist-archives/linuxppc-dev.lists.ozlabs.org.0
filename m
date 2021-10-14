Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA9D42E45B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 00:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVkty5KgYz3c6H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 09:42:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=phobos-20191101 header.b=ArLqd/si;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=denx.de
 (client-ip=85.214.62.61; helo=phobos.denx.de; envelope-from=agust@denx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=ArLqd/si; 
 dkim-atps=neutral
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVktB1sjzz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 09:42:08 +1100 (AEDT)
Received: from crub.agik.hopto.org (pd95f1d7c.dip0.t-ipconnect.de
 [217.95.29.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5D0F78365D;
 Fri, 15 Oct 2021 00:42:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634251322;
 bh=zRB+I8kPNF6m0GO3Ly86D9JEU5zOHzsmg6s6gQyNqzY=;
 h=From:To:Cc:Subject:Date:From;
 b=ArLqd/siH+WWjjmoW8KARkS0EhSZfbyc3tviR9+wPw3iSj3TDfU8Uh+FiHPvMRtFM
 1yTBz/5iBi5tr4vEuhqiBpOuPtunyuS6YQWFCuVk86EFR0KGJOFHvnX5Tl/2UHio8x
 f8qOPxBWVZ3FdrpJnML+ztaP2Apbf1jjkYlS1MsLl8kRrSnNKIbhblotsgtihchL/D
 fng/APFmHtgcQE0VBKLrWJFSYlfF5wrY15HenYJ7TaP5xx/Crj3EuR4iNZGJP12TFh
 08Do95MtLwQNq0gygFup1sZAsgwAQNe6zp0y9usITiic3ZNHDIFD9HtaXFHOg2ZiRC
 pH+F2vRMp5zPA==
From: Anatolij Gustschin <agust@denx.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/mpc512x: dts: fix PSC node warnings
Date: Fri, 15 Oct 2021 00:42:01 +0200
Message-Id: <20211014224201.24027-1-agust@denx.de>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rework PSC node description to fix build warnings like:
mpc5121.dtsi:397.13-406.5: Warning (spi_bus_bridge): /soc@80000000/psc@11400: node name for SPI buses should be 'spi'
mpc5121.dtsi:409.13-418.5: Warning (spi_bus_bridge): /soc@80000000/psc@11500: node name for SPI buses should be 'spi'
mpc5121.dtsi:457.13-466.5: Warning (spi_bus_bridge): /soc@80000000/psc@11900: node name for SPI buses should be 'spi'

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
Changes in v2:
 - extract PSC nodes to files which can be included
   separately and extended as needed

 arch/powerpc/boot/dts/ac14xx.dts            | 118 ++++++++--------
 arch/powerpc/boot/dts/mpc5121-psc0.dtsi     |  16 +++
 arch/powerpc/boot/dts/mpc5121-psc1.dtsi     |  15 ++
 arch/powerpc/boot/dts/mpc5121-psc10.dtsi    |  15 ++
 arch/powerpc/boot/dts/mpc5121-psc11.dtsi    |  15 ++
 arch/powerpc/boot/dts/mpc5121-psc2.dtsi     |  15 ++
 arch/powerpc/boot/dts/mpc5121-psc3.dtsi     |  15 ++
 arch/powerpc/boot/dts/mpc5121-psc4-spi.dtsi |  17 +++
 arch/powerpc/boot/dts/mpc5121-psc4.dtsi     |  15 ++
 arch/powerpc/boot/dts/mpc5121-psc5-spi.dtsi |  17 +++
 arch/powerpc/boot/dts/mpc5121-psc5.dtsi     |  15 ++
 arch/powerpc/boot/dts/mpc5121-psc6.dtsi     |  15 ++
 arch/powerpc/boot/dts/mpc5121-psc7.dtsi     |  15 ++
 arch/powerpc/boot/dts/mpc5121-psc8.dtsi     |  15 ++
 arch/powerpc/boot/dts/mpc5121-psc9-spi.dtsi |  17 +++
 arch/powerpc/boot/dts/mpc5121-psc9.dtsi     |  15 ++
 arch/powerpc/boot/dts/mpc5121.dtsi          | 148 +-------------------
 arch/powerpc/boot/dts/mpc5121ads.dts        |  42 +++---
 arch/powerpc/boot/dts/pdm360ng.dts          | 104 +++++++-------
 19 files changed, 371 insertions(+), 273 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc0.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc1.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc10.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc11.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc2.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc3.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc4-spi.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc4.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc5-spi.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc5.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc6.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc7.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc8.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc9-spi.dtsi
 create mode 100644 arch/powerpc/boot/dts/mpc5121-psc9.dtsi

diff --git a/arch/powerpc/boot/dts/ac14xx.dts b/arch/powerpc/boot/dts/ac14xx.dts
index 5d8877e1f4ad..0af3b0ab7550 100644
--- a/arch/powerpc/boot/dts/ac14xx.dts
+++ b/arch/powerpc/boot/dts/ac14xx.dts
@@ -15,8 +15,8 @@
 	#size-cells = <1>;
 
 	aliases {
-		serial0 = &serial0;
-		serial1 = &serial7;
+		serial0 = &psc3;
+		serial1 = &psc7;
 		spi4 = &spi4;
 		spi5 = &spi5;
 	};
@@ -294,62 +294,6 @@
 			status = "disabled";
 		};
 
-		/* PSC3 serial port A, aka ttyPSC0 */
-		serial0: psc@11300 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-			fsl,rx-fifo-size = <512>;
-			fsl,tx-fifo-size = <512>;
-		};
-
-		/* PSC4 in SPI mode */
-		spi4: psc@11400 {
-			compatible = "fsl,mpc5121-psc-spi", "fsl,mpc5121-psc";
-			fsl,rx-fifo-size = <768>;
-			fsl,tx-fifo-size = <768>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			num-cs = <1>;
-			cs-gpios = <&gpio_pic 25 0>;
-
-			flash: m25p128@0 {
-				compatible = "st,m25p128";
-				spi-max-frequency = <20000000>;
-				reg = <0>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-
-				partition@0 {
-					label = "spi-flash0";
-					reg = <0x00000000 0x01000000>;
-				};
-			};
-		};
-
-		/* PSC5 in SPI mode */
-		spi5: psc@11500 {
-			compatible = "fsl,mpc5121-psc-spi", "fsl,mpc5121-psc";
-			fsl,mode = "spi-master";
-			fsl,rx-fifo-size = <128>;
-			fsl,tx-fifo-size = <128>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			lcd@0 {
-				compatible = "ilitek,ili922x";
-				reg = <0>;
-				spi-max-frequency = <100000>;
-				spi-cpol;
-				spi-cpha;
-			};
-		};
-
-		/* PSC7 serial port C, aka ttyPSC2 */
-		serial7: psc@11700 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-			fsl,rx-fifo-size = <512>;
-			fsl,tx-fifo-size = <512>;
-		};
-
 		matrix_keypad@0 {
 			compatible = "gpio-matrix-keypad";
 			debounce-delay-ms = <5>;
@@ -393,3 +337,61 @@
 		};
 	};
 };
+
+/* PSC3 serial port A, aka ttyPSC0 */
+#include "mpc5121-psc3.dtsi"
+&psc3 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	fsl,rx-fifo-size = <512>;
+	fsl,tx-fifo-size = <512>;
+	status = "okay";
+};
+
+/* PSC7 serial port C, aka ttyPSC2 */
+#include "mpc5121-psc7.dtsi"
+&psc7 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	fsl,rx-fifo-size = <512>;
+	fsl,tx-fifo-size = <512>;
+	status = "okay";
+};
+
+/* PSC4 in SPI mode */
+#include "mpc5121-psc4-spi.dtsi"
+&spi4 {
+	status = "okay";
+	fsl,rx-fifo-size = <768>;
+	fsl,tx-fifo-size = <768>;
+	num-cs = <1>;
+	cs-gpios = <&gpio_pic 25 0>;
+
+	flash: m25p128@0 {
+		compatible = "st,m25p128";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "spi-flash0";
+			reg = <0x00000000 0x01000000>;
+		};
+	};
+};
+
+/* PSC5 in SPI mode */
+#include "mpc5121-psc5-spi.dtsi"
+&spi5 {
+	status = "okay";
+	fsl,mode = "spi-master";
+	fsl,rx-fifo-size = <128>;
+	fsl,tx-fifo-size = <128>;
+
+	lcd@0 {
+		compatible = "ilitek,ili922x";
+		reg = <0>;
+		spi-max-frequency = <100000>;
+		spi-cpol;
+		spi-cpha;
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc0.dtsi b/arch/powerpc/boot/dts/mpc5121-psc0.dtsi
new file mode 100644
index 000000000000..a2df388d864c
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc0.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	/* 512x PSCs are not 52xx PSC compatible */
+	psc0: psc@11000 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11000 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC0>,
+			 <&clks MPC512x_CLK_PSC0_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc1.dtsi b/arch/powerpc/boot/dts/mpc5121-psc1.dtsi
new file mode 100644
index 000000000000..41848f44c576
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc1.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	psc1: psc@11100 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11100 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC1>,
+			 <&clks MPC512x_CLK_PSC1_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc10.dtsi b/arch/powerpc/boot/dts/mpc5121-psc10.dtsi
new file mode 100644
index 000000000000..6d004a15baf1
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc10.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	psc10: psc@11a00 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11a00 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC10>,
+			 <&clks MPC512x_CLK_PSC10_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc11.dtsi b/arch/powerpc/boot/dts/mpc5121-psc11.dtsi
new file mode 100644
index 000000000000..9888ad50afc3
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc11.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	psc11: psc@11b00 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11b00 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC11>,
+			 <&clks MPC512x_CLK_PSC11_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc2.dtsi b/arch/powerpc/boot/dts/mpc5121-psc2.dtsi
new file mode 100644
index 000000000000..2b229a8cb4cf
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc2.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	psc2: psc@11200 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11200 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC2>,
+			 <&clks MPC512x_CLK_PSC2_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc3.dtsi b/arch/powerpc/boot/dts/mpc5121-psc3.dtsi
new file mode 100644
index 000000000000..972cd0af2ac7
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc3.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	psc3: psc@11300 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11300 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC3>,
+			 <&clks MPC512x_CLK_PSC3_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc4-spi.dtsi b/arch/powerpc/boot/dts/mpc5121-psc4-spi.dtsi
new file mode 100644
index 000000000000..d110a89d5e93
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc4-spi.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	spi4: spi@11400 {
+		compatible = "fsl,mpc5121-psc-spi", "fsl,mpc5121-psc";
+		reg = <0x11400 0x100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC9>,
+			 <&clks MPC512x_CLK_PSC9_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc4.dtsi b/arch/powerpc/boot/dts/mpc5121-psc4.dtsi
new file mode 100644
index 000000000000..0a3082318125
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc4.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	psc4: psc@11400 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11400 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC4>,
+			 <&clks MPC512x_CLK_PSC4_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc5-spi.dtsi b/arch/powerpc/boot/dts/mpc5121-psc5-spi.dtsi
new file mode 100644
index 000000000000..5651ccff02ad
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc5-spi.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	spi5: spi@11500 {
+		compatible = "fsl,mpc5121-psc-spi", "fsl,mpc5121-psc";
+		reg = <0x11500 0x100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC9>,
+			 <&clks MPC512x_CLK_PSC9_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc5.dtsi b/arch/powerpc/boot/dts/mpc5121-psc5.dtsi
new file mode 100644
index 000000000000..880ab45d6985
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc5.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	psc5: psc@11500 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11500 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC5>,
+			 <&clks MPC512x_CLK_PSC5_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc6.dtsi b/arch/powerpc/boot/dts/mpc5121-psc6.dtsi
new file mode 100644
index 000000000000..7ec67953cffb
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc6.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	psc6: psc@11600 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11600 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC6>,
+			 <&clks MPC512x_CLK_PSC6_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc7.dtsi b/arch/powerpc/boot/dts/mpc5121-psc7.dtsi
new file mode 100644
index 000000000000..e5ca588e4cfd
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc7.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	psc7: psc@11700 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11700 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC7>,
+			 <&clks MPC512x_CLK_PSC7_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc8.dtsi b/arch/powerpc/boot/dts/mpc5121-psc8.dtsi
new file mode 100644
index 000000000000..056d6bc019de
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc8.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	psc8: psc@11800 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11800 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC8>,
+			 <&clks MPC512x_CLK_PSC8_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc9-spi.dtsi b/arch/powerpc/boot/dts/mpc5121-psc9-spi.dtsi
new file mode 100644
index 000000000000..3c82804970eb
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc9-spi.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	spi9: spi@11900 {
+		compatible = "fsl,mpc5121-psc-spi", "fsl,mpc5121-psc";
+		reg = <0x11900 0x100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC9>,
+			 <&clks MPC512x_CLK_PSC9_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121-psc9.dtsi b/arch/powerpc/boot/dts/mpc5121-psc9.dtsi
new file mode 100644
index 000000000000..355190f974bd
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc5121-psc9.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+&soc {
+	psc9: psc@11900 {
+		compatible = "fsl,mpc5121-psc";
+		reg = <0x11900 0x100>;
+		interrupts = <40 0x8>;
+		fsl,rx-fifo-size = <16>;
+		fsl,tx-fifo-size = <16>;
+		clocks = <&clks MPC512x_CLK_PSC9>,
+			 <&clks MPC512x_CLK_PSC9_MCLK>;
+		clock-names = "ipg", "mclk";
+		status = "disabled";
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
index 3f66b91a8e3c..21674da8beb1 100644
--- a/arch/powerpc/boot/dts/mpc5121.dtsi
+++ b/arch/powerpc/boot/dts/mpc5121.dtsi
@@ -87,7 +87,7 @@
 		};
 	};
 
-	soc@80000000 {
+	soc: soc@80000000 {
 		compatible = "fsl,mpc5121-immr";
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -343,152 +343,6 @@
 			clock-names = "ipg";
 		};
 
-		/* 512x PSCs are not 52xx PSC compatible */
-
-		/* PSC0 */
-		psc@11000 {
-			compatible = "fsl,mpc5121-psc";
-			reg = <0x11000 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC0>,
-				 <&clks MPC512x_CLK_PSC0_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
-		/* PSC1 */
-		psc@11100 {
-			compatible = "fsl,mpc5121-psc";
-			reg = <0x11100 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC1>,
-				 <&clks MPC512x_CLK_PSC1_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
-		/* PSC2 */
-		psc@11200 {
-			compatible = "fsl,mpc5121-psc";
-			reg = <0x11200 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC2>,
-				 <&clks MPC512x_CLK_PSC2_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
-		/* PSC3 */
-		psc@11300 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-			reg = <0x11300 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC3>,
-				 <&clks MPC512x_CLK_PSC3_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
-		/* PSC4 */
-		psc@11400 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-			reg = <0x11400 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC4>,
-				 <&clks MPC512x_CLK_PSC4_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
-		/* PSC5 */
-		psc@11500 {
-			compatible = "fsl,mpc5121-psc";
-			reg = <0x11500 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC5>,
-				 <&clks MPC512x_CLK_PSC5_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
-		/* PSC6 */
-		psc@11600 {
-			compatible = "fsl,mpc5121-psc";
-			reg = <0x11600 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC6>,
-				 <&clks MPC512x_CLK_PSC6_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
-		/* PSC7 */
-		psc@11700 {
-			compatible = "fsl,mpc5121-psc";
-			reg = <0x11700 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC7>,
-				 <&clks MPC512x_CLK_PSC7_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
-		/* PSC8 */
-		psc@11800 {
-			compatible = "fsl,mpc5121-psc";
-			reg = <0x11800 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC8>,
-				 <&clks MPC512x_CLK_PSC8_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
-		/* PSC9 */
-		psc@11900 {
-			compatible = "fsl,mpc5121-psc";
-			reg = <0x11900 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC9>,
-				 <&clks MPC512x_CLK_PSC9_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
-		/* PSC10 */
-		psc@11a00 {
-			compatible = "fsl,mpc5121-psc";
-			reg = <0x11a00 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC10>,
-				 <&clks MPC512x_CLK_PSC10_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
-		/* PSC11 */
-		psc@11b00 {
-			compatible = "fsl,mpc5121-psc";
-			reg = <0x11b00 0x100>;
-			interrupts = <40 0x8>;
-			fsl,rx-fifo-size = <16>;
-			fsl,tx-fifo-size = <16>;
-			clocks = <&clks MPC512x_CLK_PSC11>,
-				 <&clks MPC512x_CLK_PSC11_MCLK>;
-			clock-names = "ipg", "mclk";
-		};
-
 		pscfifo@11f00 {
 			compatible = "fsl,mpc5121-psc-fifo";
 			reg = <0x11f00 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc5121ads.dts b/arch/powerpc/boot/dts/mpc5121ads.dts
index b407a50ee622..c87735ec0730 100644
--- a/arch/powerpc/boot/dts/mpc5121ads.dts
+++ b/arch/powerpc/boot/dts/mpc5121ads.dts
@@ -133,24 +133,6 @@
 			fsl,invert-drvvbus;
 			fsl,invert-pwr-fault;
 		};
-
-		/* PSC3 serial port A aka ttyPSC0 */
-		psc@11300 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-		};
-
-		/* PSC4 serial port B aka ttyPSC1 */
-		psc@11400 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-		};
-
-		/* PSC5 in ac97 mode */
-		ac97: psc@11500 {
-			compatible = "fsl,mpc5121-psc-ac97", "fsl,mpc5121-psc";
-			fsl,mode = "ac97-slave";
-			fsl,rx-fifo-size = <384>;
-			fsl,tx-fifo-size = <384>;
-		};
 	};
 
 	pci: pci@80008500 {
@@ -172,3 +154,27 @@
 				>;
 	};
 };
+
+/* PSC3 serial port A aka ttyPSC0 */
+#include "mpc5121-psc3.dtsi"
+&psc3 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	status = "okay";
+};
+
+/* PSC4 serial port B aka ttyPSC1 */
+#include "mpc5121-psc4.dtsi"
+&psc4 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	status = "okay";
+};
+
+/* PSC5 in ac97 mode */
+#include "mpc5121-psc5.dtsi"
+&psc5 {
+	compatible = "fsl,mpc5121-psc-ac97", "fsl,mpc5121-psc";
+	status = "okay";
+	fsl,mode = "ac97-slave";
+	fsl,rx-fifo-size = <384>;
+	fsl,tx-fifo-size = <384>;
+};
diff --git a/arch/powerpc/boot/dts/pdm360ng.dts b/arch/powerpc/boot/dts/pdm360ng.dts
index 67c3b9db75d7..23e797d8887e 100644
--- a/arch/powerpc/boot/dts/pdm360ng.dts
+++ b/arch/powerpc/boot/dts/pdm360ng.dts
@@ -132,64 +132,68 @@
 		usb@4000 {
 			fsl,invert-pwr-fault;
 		};
+	};
+};
 
-		psc@11000 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-		};
-
-		psc@11100 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-		};
-
-		psc@11200 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-		};
-
-		psc@11300 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-		};
+#include "mpc5121-psc0.dtsi"
+#include "mpc5121-psc1.dtsi"
+#include "mpc5121-psc2.dtsi"
+#include "mpc5121-psc3.dtsi"
+#include "mpc5121-psc4.dtsi"
+#include "mpc5121-psc6.dtsi"
+#include "mpc5121-psc8.dtsi"
+#include "mpc5121-psc11.dtsi"
+/* Select PSC UART mode */
+&psc0 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	status = "okay";
+};
 
-		psc@11400 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-		};
+&psc1 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	status = "okay";
+};
 
-		psc@11500 {
-			status = "disabled";
-		};
+&psc2 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	status = "okay";
+};
 
-		psc@11600 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-		};
+&psc3 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	status = "okay";
+};
 
-		psc@11700 {
-			status = "disabled";
-		};
+&psc4 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	status = "okay";
+};
 
-		psc@11800 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-		};
+&psc6 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	status = "okay";
+};
 
-		psc@11900 {
-			compatible = "fsl,mpc5121-psc-spi", "fsl,mpc5121-psc";
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			/* ADS7845 touch screen controller */
-			ts@0 {
-				compatible = "ti,ads7846";
-				reg = <0x0>;
-				spi-max-frequency = <3000000>;
-				/* pen irq is GPIO25 */
-				interrupts = <78 0x8>;
-			};
-		};
+&psc8 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	status = "okay";
+};
 
-		psc@11a00 {
-			status = "disabled";
-		};
+&psc11 {
+	compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
+	status = "okay";
+};
 
-		psc@11b00 {
-			compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
-		};
+#include "mpc5121-psc9-spi.dtsi"
+&spi9 {
+	status = "okay";
+
+	/* ADS7845 touch screen controller */
+	ts@0 {
+		compatible = "ti,ads7846";
+		reg = <0x0>;
+		spi-max-frequency = <3000000>;
+		/* pen irq is GPIO25 */
+		interrupts = <78 0x8>;
 	};
 };
-- 
2.17.1

