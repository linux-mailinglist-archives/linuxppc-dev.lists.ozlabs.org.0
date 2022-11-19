Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7E6630E87
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 12:47:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDsN74Kdzz3fL1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 22:47:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=heyquark.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=ash@heyquark.com; receiver=<UNKNOWN>)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDsKH0LBmz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 22:45:22 +1100 (AEDT)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 3F2CDCD8E7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 11:31:18 +0000 (UTC)
Received: (Authenticated sender: ash@heyquark.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 65874FF804;
	Sat, 19 Nov 2022 11:31:03 +0000 (UTC)
From: Ash Logan <ash@heyquark.com>
To: krzysztof.kozlowski+dt@linaro.org,
	paulus@samba.org,
	mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	robh+dt@kernel.org,
	benh@kernel.crashing.org,
	segher@kernel.crashing.org,
	pali@kernel.org
Subject: [PATCH v4 02/11] powerpc: wiiu: device tree
Date: Sat, 19 Nov 2022 22:30:32 +1100
Message-Id: <20221119113041.284419-3-ash@heyquark.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119113041.284419-1-ash@heyquark.com>
References: <20220628133144.142185-1-ash@heyquark.com>
 <20221119113041.284419-1-ash@heyquark.com>
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a device tree source file for the Nintendo Wii U video game console.

Signed-off-by: Ash Logan <ash@heyquark.com>
Co-developed-by: Roberto Van Eeden <rw-r-r-0644@protonmail.com>
Signed-off-by: Roberto Van Eeden <rw-r-r-0644@protonmail.com>
Co-developed-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
v1->v2: Style and formatting changes suggested by Rob Herring.
 License remains GPL-2.0 as the other powerpc dtses are the same, happy
 to change if there is a different preferred default.
v2->v3: Re-added address-cells accidentally removed in v2.
 Marked latte as a simple-bus, since it is.
v3->v4: Updated to match devicetree bindings. Model also changed to
 wup-101 in preparation for potentially different devices in future
 (cat-dev etc.) Chosen node removed.

 arch/powerpc/boot/dts/wiiu.dts | 319 +++++++++++++++++++++++++++++++++
 1 file changed, 319 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/wiiu.dts

diff --git a/arch/powerpc/boot/dts/wiiu.dts b/arch/powerpc/boot/dts/wiiu.dts
new file mode 100644
index 000000000000..ee25b0855374
--- /dev/null
+++ b/arch/powerpc/boot/dts/wiiu.dts
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nintendo Wii U Device Tree Source
+ *
+ * Copyright (C) 2022 The linux-wiiu Team
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "nintendo,wup-101";
+	compatible = "nintendo,wiiu";
+
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x02000000	/* MEM1 - 32MiB */
+		       0x08000000 0x00300000	/* MEM0 - 3MiB  */
+		       0x10000000 0x80000000>;	/* MEM2 - 2GiB  */
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* TODO: Add SMP */
+		PowerPC,espresso@0 {
+			device_type = "cpu";
+			reg = <0>;
+			clock-frequency = <1243125000>;		/* 1.243125GHz */
+			bus-frequency = <248625000>;		/* 248.625MHz core-to-bus 5x */
+			timebase-frequency = <62156250>;	/* 1/4 of the bus clock */
+			i-cache-size = <32768>; /* 32K icache */
+			i-cache-line-size = <32>;
+			i-cache-block-size = <32>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>; /* 32K dcache */
+			d-cache-line-size = <32>;
+			d-cache-block-size = <32>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_0>;
+			L2_0:l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				cache-size = <0x80000>; /* 512KB L2 */
+				cache-line-size = <64>;
+				cache-block-size = <32>;
+				cache-sets = <2048>;
+			};
+		};
+	};
+
+	soc {
+		compatible = "nintendo,latte", "simple-bus";
+		ranges = <0x0c000000 0x0c000000 0x00400000	/* Espresso-only registers */
+			  0x0d000000 0x0d000000 0x00200000	/* Latte AHB deivces */
+			  0x0d800000 0x0d800000 0x00800000>;	/* Latte SoC registers */
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		latte_gpu: gpu@c200000 {
+			compatible = "nintendo,latte-gpu7";
+			reg = <0x0c200000 0x80000>;
+			interrupts = <2>;
+			interrupt-parent = <&espresso_pic>;
+		};
+
+		espresso_pic: interrupt-controller@c000078 {
+			compatible = "nintendo,espresso-pic";
+			reg = <0x0c000078 0x18>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+		};
+
+		latte_dsp: dsp@c005000 {
+			compatible = "nintendo,latte-dsp";
+			reg = <0x0c005000 0x200>;
+		};
+
+		ehci_0: usb@d040000 {
+			compatible = "nintendo,latte-ehci", "usb-ehci";
+			reg = <0x0d040000 0x100>;
+			interrupts = <4>;
+			interrupt-parent = <&latte_pic>;
+			big-endian-regs;
+		};
+
+		ohci_0_0: usb@d050000 {
+			compatible = "nintendo,latte-ohci";
+			reg = <0x0d050000 0x100>;
+			interrupts = <5>;
+			interrupt-parent = <&latte_pic>;
+			big-endian-regs;
+		};
+
+		ohci_0_1: usb@d060000 {
+			compatible = "nintendo,latte-ohci";
+			reg = <0x0d060000 0x100>;
+			interrupts = <6>;
+			interrupt-parent = <&latte_pic>;
+			big-endian-regs;
+		};
+
+		ehci_1: usb@d120000 {
+			compatible = "nintendo,latte-ehci", "usb-ehci";
+			reg = <0x0d120000 0x100>;
+			interrupts = <16>;
+			interrupt-parent = <&latte_pic>;
+			big-endian-regs;
+		};
+
+		ohci_1_0: usb@d130000 {
+			compatible = "nintendo,latte-ohci";
+			reg = <0x0d130000 0x100>;
+			interrupts = <35>;
+			interrupt-parent = <&latte_pic>;
+			big-endian-regs;
+		};
+
+		ehci_2: usb@d140000 {
+			compatible = "nintendo,latte-ehci", "usb-ehci";
+			reg = <0x0d140000 0x100>;
+			interrupts = <36>;
+			interrupt-parent = <&latte_pic>;
+			big-endian-regs;
+		};
+
+		ohci_2_0: usb@d150000 {
+			compatible = "nintendo,latte-ohci";
+			reg = <0x0d150000 0x100>;
+			interrupts = <37>;
+			interrupt-parent = <&latte_pic>;
+
+			big-endian-regs;
+		};
+
+		sdcard_0: mmc@d070000 {
+			compatible = "nintendo,latte-sdhci","sdhci";
+			reg = <0x0d070000 0x200>;
+			interrupts = <7>;
+			interrupt-parent = <&latte_pic>;
+		};
+
+		wifi_0: mmc@d080000 {
+			compatible = "nintendo,latte-sdhci","sdhci";
+			reg = <0x0d080000 0x200>;
+			interrupts = <8>;
+			interrupt-parent = <&latte_pic>;
+		};
+
+		legacy_ipc: ipc@d800000 {
+			compatible = "nintendo,latte-ipc", "nintendo,hollywood-ipc";
+			reg = <0x0d800000 0x10>;
+			interrupts = <30 31>;
+			interrupt-parent = <&latte_pic>;
+		};
+
+		latte_otp: otp@d8001ec {
+			compatible = "nintendo,latte-otp";
+			reg = <0x0d8001ec 0x8>;
+		};
+
+		sata@d160400 {
+			compatible = "nintendo,latte-ahci";
+			reg = <0x0d160400 0x808>;
+
+			interrupt-parent = <&latte_pic>;
+			interrupts = <38 28>;
+		};
+
+		latte_pic: interrupt-controller@d800440 {
+			#interrupt-cells = <1>;
+			interrupt-controller;
+
+			compatible = "nintendo,latte-pic";
+			reg = <0x0d800440 0x30>;
+			interrupt-parent = <&espresso_pic>;
+			interrupts = <24>;
+		};
+
+		gpio: gpio@d8000c0 {
+			#gpio-cells = <2>;
+			compatible = "nintendo,latte-gpio", "nintendo,hollywood-gpio";
+
+			reg = <0x0d8000c0 0x40>;
+			gpio-controller;
+			/* TODO: There are actually 31 AHBALL GPIOs */
+			ngpios = <24>;
+
+			gpio-line-names =
+				"POWER", "DWIFI", "FAN", "DC_DC",
+				"", "Esp10WorkAround", "", "",
+				"PADPD", "", "EEP_CS", "EEP_CLK",
+				"EEP_MOSI", "EEP_MISO", "AVE_SCL", "AVE_SDA",
+				"DEBUG0", "DEBUG1", "DEBUG2", "DEBUG3",
+				"DEBUG4", "DEBUG5", "DEBUG6", "DEBUG7";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <10>;
+			interrupt-parent = <&latte_pic>;
+		};
+
+		gpio2: gpio@d800520 {
+			#gpio-cells = <2>;
+			compatible = "nintendo,latte-gpio", "nintendo,hollywood-gpio";
+
+			reg = <0x0d800520 0x40>;
+			gpio-controller;
+			ngpios = <7>;
+
+			gpio-line-names =
+				"FANSPEED", "SMC_SCL", "SMC_SDA", "DC_DC2",
+				"AVE_INT", "", "AVE_RESET";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <10>;
+			interrupt-parent = <&latte_pic>;
+		};
+	};
+
+	spi_gpio: spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cs-gpios = <&gpio 10 GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpio 11 GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+
+		eeprom@0 {
+			compatible = "atmel,at93c66";
+			reg = <0>;
+			spi-max-frequency = <1000000>;
+			spi-cs-high;
+			/* TODO: wiiubrew says this is 16-bit, but I only get the correct
+			 * values in 8-bit...
+			 */
+			data-size = <8>;
+			read-only;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			/* https://wiiubrew.org/wiki/Hardware/SEEPROM */
+			rng_seed: rng@12 { reg = <0x012 8>; };
+			ppc_pvr: pvr@20 { reg = <0x020 4>; };
+			seeprom_ver_str: sver-str@24 { reg = <0x024 6>; };
+			seeprom_ver: sver@2a { reg = <0x02A 2>; };
+			otp_ver: over@2c { reg = <0x02C 2>; };
+			otp_rev: orev@2e { reg = <0x02E 2>; };
+			otp_ver_str: over-str@30 { reg = <0x030 8>; };
+
+			bc_crc: bc-crc@38 { reg = <0x038 4>; };
+			bc_sz: bc-sz@3c { reg = <0x03C 2>; };
+			bc_ver: bc-ver@3e { reg = <0x03E 2>; };
+			bc_boardtype: boardtype@42 { reg = <0x042 2>; };
+			bc_boardrev: boardrev@44 { reg = <0x044 2>; };
+			bc_bootsource: bootsource@46 { reg = <0x046 2>; };
+			bc_ddr3size: ddr3size@48 { reg = <0x048 2>; };
+			bc_ddr3speed: ddr3speed@4a { reg = <0x04A 2>; };
+			bc_ppcclockmul: ppcclockmul@4c { reg = <0x04C 2>; };
+			bc_iopclockmul: iopclockmul@46 { reg = <0x04E 2>; };
+			bc_video1080p: video1080p@50 { reg = <0x050 2>; };
+			bc_ddr3vendor: ddr3vendor@52 { reg = <0x052 2>; };
+			bc_movpassivereset: movpassivereset@54 { reg = <0x054 2>; };
+			bc_syspllspd: syspllspd@56 { reg = <0x056 2>; };
+			bc_satadevice: satadevice@58 { reg = <0x058 2>; };
+			bc_consoletype: consoletype@5a { reg = <0x05A 2>; };
+			bc_deviceprescence: deviceprescence@5c { reg = <0x05C 2>; };
+
+			drive_key: drvkey@80 { reg = <0x080 16>; };
+			factory_key: fackey@90 { reg = <0x090 16>; };
+			shdd_key: shddkey@a0 { reg = <0x0A0 16>; };
+			usb_key_seed: usbkeyseed@b0 { reg = <0x0B0 16>; };
+			drive_key_flag: drvkeyf@c0 { reg = <0x0C0 2>; };
+			usb_key_flag: udbkeyf@c2 { reg = <0x0C2 2>; };
+			shdd_key_flag: shddkeyf@c4 { reg = <0x0C4 2>; };
+
+			sysprod_version: sp_ver@140 { reg = <0x140 4>; };
+			sysprod_eeprom_version: sp_ee_ver@144 { reg = <0x144 4>; };
+			sysprod_product_area: sp_parea@148 { reg = <0x148 4>; };
+			sysprod_game_region: sp_region@14c { reg = <0x14C 4>; };
+			sysprod_ntsc_pal: sp_ntscpal@150 { reg = <0x150 4>; };
+			sysprod_5ghz_country: sp_5ghz_c@154 { reg = <0x154 2>; };
+			sysprod_5ghz_country_rev: sp_5ghz_crev@156 { reg = <0x156 2>; };
+			sysprod_code: sp_code@158 { reg = <0x158 8>; };
+			sysprod_serial: sp_serial@160 { reg = <0x160 16>; };
+			sysprod_model: sp_model@170 { reg = <0x170 16>; };
+
+			prod_year: pyear@188 { reg = <0x188 2>; };
+			prod_date: pdate@18a { reg = <0x18A 2>; };
+			prod_time: ptime@18c { reg = <0x18C 2>; };
+
+			boot_params: boot_params@1c0 { reg = <0x1C0 48>; };
+		};
+	};
+
+	/* TODO make this gpio-keyed once hollywood-gpio supports interrupts */
+	gpio-keys {
+		poll-interval = <50>;
+		compatible = "gpio-keys-polled";
+
+		key-power {
+			label = "Power Button";
+			gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+			linux,code = <KEY_POWER>;
+		};
+	};
+};
-- 
2.38.1

