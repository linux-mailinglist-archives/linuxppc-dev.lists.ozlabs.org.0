Return-Path: <linuxppc-dev+bounces-4588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEC89FFE75
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:34:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgV0Xycz30VS;
	Fri,  3 Jan 2025 05:32:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842757;
	cv=none; b=Cuuzk7lMRDxqzkFmCjKYmVv9Oqf/LPuoge0b2lYiTqwoqaWlPkrRGa7NfZXbA+2DdaZ4TMVnVzF+rl777+n8pUgHxD+0V+S8eevgDbQ1dVP5E3CkXQ5dYEo9tJUESqutZ30CiZs0Xhg9s3nhpyCwE+trQAyVcRb03cBXDZHzUv+z3jvHBRB5YRZbFLhS3ETT6w6JkB5JO5tqgEUgFHxLuFHzM71/DmjT7Y07frZoTnGT9dm++sJvhzyEitdcI80qAWY8eNI5+GqKW+o1fmm/Ngn40q8VpF/nPSmTBvfF3aNmjyLAFdOFmt1xmX6GjdVYm360+JnbO8V+iezdovUV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842757; c=relaxed/relaxed;
	bh=W74nhchn98DXNjgn4x/9hOQOii9e72N9z0OQ8XTmHfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmHkQazJ++Us/DOPXtP+lSk48DR2EpK0thmUN1qUzpQWR1Pfq3wvJXXyoOfveE/T/qb3iSJ4NUOAU4O/IvwE+6GY6iO0MsxLkdIy371TXgLICgdP5dbHIOW2Ta/LAxGYdZhj/jZoEEQx4h5P2y1A9iYJfbNVjGvBH5rHcJWrbejAs1kI9ehAx76s0q7cSzUTMbR0J7lwqrpB4eqFcZ5QuPZpoI46Y5R6Q2yNEtDE3EW4gWKuhBthFfLorLoGqJ8kZbOcvnKvc9pLrqCozoYaJarNNTPBhxt5EeW5nCIvZ/Dngd8DVS5hwOSCvCSAryih5i7te/BouO2qHbWjpDUDSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IHQAMGF9; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IHQAMGF9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgP21W3z30Qy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61E855C5DD0;
	Thu,  2 Jan 2025 18:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7F2EC19422;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=IFjPVFxBBj8AklhWMTuCv3+fgmDzrflrU7pIzGZfZxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IHQAMGF95tDIqHNoh0tpu9WweWRe6GD1v0SE2L6ZL8NZyH59zOIfo19Gyys0/fL8T
	 fcEo1ObFs5gemxu62ki8006ZVOM7ZLdtdYMVuVVTy95e32L9PoVnKJ9Hu3eBog/IcC
	 lyf9o2hC0WWHzksApjIrjiSrHjzoXm4/qJ7yytDZU2FbgHSDTPE2t+MsfXf4oCmIgg
	 LBmWMDODaoCaOFUcNZEfIlpgEl4zkqvuzqxD09AOyxEvfu2lyHDp+RCozuEWgasOTo
	 /Bvd3yfrCcfpDkZSNdJZUCVClYTFhs3gis6wJJL0BAJK+n/pdkwHAIu/zQPQTuWO5K
	 tvUnlYzOc0GzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFD5E77188;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:57 +0100
Subject: [PATCH 16/19] powerpc: dts: Add LANCOM NWAPP2 board devicetree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-16-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=8029;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=ZKOoalO4wmhQEAwxw29HUheREeAXcDDs75lwK/wrODY=;
 b=+jeoW7i1ak3Bn5aA7D719CI2NoS8bUwteML/RwSvhKc9oJRv2rTcoj8oRl6e/El4TejDwyZd0
 rsXEKhiclnkCyPOhl1JFSi470/dXtl3IfQvBXXd5q5jqAFcPzaoAlvI
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

What works so far:
- serial port
- LEDs
- Ethernet
- PCIe (port 1 tested)
- Flash access

What doesn't work:
- Access of the YAFFS file system preinstalled by the original firmware
  (mainline Linux does not include the YAFFS file system)
- Writing NAND flash from Linux and reading the same from U-Boot
  (there is some issue related to ECC)

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

Note: This patch requires the following patchset as it defines bindings
used in lancom-nwapp2.dts:

  [PATCH v2 0/3] gpio: 74HC595 / 74x164 shift register improvements
---
 arch/powerpc/boot/dts/Makefile          |   1 +
 arch/powerpc/boot/dts/lancom-nwapp2.dts | 276 ++++++++++++++++++++++++++++++++
 2 files changed, 277 insertions(+)

diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
index 6aee895d5baaa2c978d4b1c82a6d198d9e166ea2..43e20d8b776b1716a91e6ec8e135c0a45c8e8c77 100644
--- a/arch/powerpc/boot/dts/Makefile
+++ b/arch/powerpc/boot/dts/Makefile
@@ -6,5 +6,6 @@ dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.
 
 dtb-$(CONFIG_MPC831x) += \
 	kmeter1.dtb \
+	lancom-nwapp2.dtb \
 	mpc8313erdb.dtb \
 	mpc8315erdb.dtb
diff --git a/arch/powerpc/boot/dts/lancom-nwapp2.dts b/arch/powerpc/boot/dts/lancom-nwapp2.dts
new file mode 100644
index 0000000000000000000000000000000000000000..d46d94c27ecb91db32c8acb4136cb6e8d0df52f5
--- /dev/null
+++ b/arch/powerpc/boot/dts/lancom-nwapp2.dts
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2024 J. Neuschäfer
+//
+// LANCOM NWAPP2, marketed as:
+// - LANCOM L-321agn Wireless (R2)
+// - LANCOM L-322agn dual Wireless (R2)
+// - LANCOM L-322E Wireless
+#include "mpc8314e.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	compatible = "lancom,nwapp2", "fsl,mpc8314e";
+	model = "LANCOM NWAPP2";
+
+	memory {
+		reg = <0x00000000 0x08000000>;	// 128MB at 0
+	};
+
+	aliases {
+		serial0 = &serial0;
+		pci1 = &pci1;
+		pci2 = &pci2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-watchdog {
+		compatible = "linux,wdt-gpio";
+		gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
+		hw_algo = "toggle";
+		hw_margin_ms = <1000>;
+		always-running;
+	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 10 GPIO_ACTIVE_HIGH>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		reset-button {
+			label = "Reset Button";
+			linux,code = <KEY_SETUP>;
+			gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led_power_red: led-0 {
+			label = "red:power";
+			gpios = <&expander 0 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led_power_green: led-1 {
+			label = "green:power";
+			gpios = <&expander 1 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led_wlan_link_red: led-2 {
+			label = "red:wlan-link";
+			gpios = <&expander 2 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led_wlan_link_green: led-3 {
+			label = "green:wlan-link";
+			gpios = <&expander 3 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led_wlan_data_red: led-4 {
+			label = "red:wlan-data";
+			gpios = <&expander 4 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led_eth_red: led-10 {
+			label = "red:eth";
+			gpios = <&expander 10 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led_power_top_red: led-12 {
+			label = "red:power-top";
+			gpios = <&expander 12 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led_power_top_green: led-13 {
+			label = "green:power-top";
+			gpios = <&expander 13 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led_wlan_top_red: led-14 {
+			label = "red:wlan-top";
+			gpios = <&expander 14 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led_wlan_top_green: led-15 {
+			label = "green:wlan-top";
+			gpios = <&expander 15 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+	};
+
+	led-power {
+		label = "multicolor:power";
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_POWER;
+		leds = <&led_power_red>, <&led_power_green>;
+	};
+
+	led-wlan-link {
+		label = "multicolor:wlan-link";
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_WLAN;
+		leds = <&led_wlan_link_red>, <&led_wlan_link_green>;
+	};
+
+	led-wlan-data {
+		label = "multicolor:wlan-data";
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_MULTI>;
+		leds = <&led_wlan_data_red>;
+	};
+
+	led-eth {
+		label = "multicolor:eth";
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_MULTI>;
+		leds = <&led_eth_red>;
+	};
+
+	led-power-top {
+		label = "multicolor:power-top";
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_POWER;
+		leds = <&led_power_top_red>, <&led_power_top_green>;
+	};
+
+	led-wlan-top {
+		label = "multicolor:wlan-top";
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_MULTI>;
+		leds = <&led_wlan_top_red>, <&led_wlan_top_green>;
+	};
+};
+
+&gpio {
+	gpio-line-names =
+		/*  0 -  7 */ "DEBUG#", "RESET_BTN#", "", "EXP_LATCH", "", "", "", "PCIE_RST#",
+		/*  8 - 15 */ "", "", "BOARD_RST", "", "", "", "", "",
+		/* 16 - 23 */ "", "", "WDT_TOGGLE", "", "", "", "PHY_RST#", "",
+		/* 24 - 31 */ "", "", "", "", "", "", "", "";
+};
+
+&localbus {
+	status = "okay";
+	ranges = <0x0 0x0 0xfe000000 0x00008000>;
+
+	nand@0,0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "fsl,mpc8315-fcm-nand",
+			     "fsl,elbc-fcm-nand";
+		reg = <0x0 0x0 0x2000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "loader1";
+				reg = <0x0 0x8000>;
+				read-only;
+			};
+
+			partition@8000 {
+				label = "loader2";
+				reg = <0x8000 0x78000>;
+				read-only;
+			};
+
+			// 0x80000:0xf80000 is designated "loader spare" by
+			// vendor firmware, but we re-use it for our purposes.
+
+			partition@80000 {
+				label = "u-boot-env";
+				reg = <0x80000 0x80000>;
+			};
+
+			partition@100000 {
+				label = "loader-spare";
+				reg = <0x100000 0xf00000>;
+			};
+
+			partition@1000000 {
+				label = "fs";
+				reg = <0x1000000 0xf000000>;
+				/* YAFFS2 filesystem */
+			};
+		};
+	};
+};
+
+&enet0 {
+	status = "okay";
+	phy-handle = <&phy>;
+	phy-mode = "rgmii-id";
+};
+
+&mdio0 {
+	status = "okay";
+	compatible = "fsl,gianfar-mdio";
+
+	phy: ethernet-phy@1 {
+		/* Atheros AR8032 */
+		reg = <1>;
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reset-gpios = <&gpio 22 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pci1 {
+	status = "okay";
+	ranges = <0x02000000 0 0x88000000 0x88000000 0 0x02000000>,
+		 <0x01000000 0 0x00000000 0xc9080000 0 0x00800000>;
+};
+
+&pci2 {
+	status = "okay";
+	ranges = <0x02000000 0 0x88000000 0x8c000000 0 0x02000000>,
+		 <0x01000000 0 0x00000000 0xc9900000 0 0x00800000>;
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&spi {
+	status = "okay";
+	/*
+	 * The GPIO expander doesn't really use a chip select.
+	 * Instead pin 3 is connected to the latch clock input, which triggers
+	 * the transfer of bits from the shift register to the output pins on
+	 * rising edges. Specifying it as a active-low chip select works
+	 * because the CS# is driven high after the serial transfer is done.
+	 */
+	cs-gpios = <&gpio 3 GPIO_ACTIVE_LOW>;
+
+	expander: gpio-controller@0 {
+		reg = <0>;
+		compatible = "onnn,74hc595a";
+		spi-max-frequency = <5000000>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		registers-number = <2>;
+	};
+};

-- 
2.45.2



