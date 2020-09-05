Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FE925EB76
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 00:28:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkThx1cHBzDqVJ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 08:28:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d;
 helo=mail-ej1-x62d.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e8IIp6yQ; dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkTCr5LhMzDqgr
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 08:06:48 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id q13so13043760ejo.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Sep 2020 15:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQcY8qlVKNfYD7HLqc8hwd/dxJeX8W7zGLkN1rSU3qU=;
 b=e8IIp6yQD4nMdUL3Tg91PRreLTfFbZuE00LznAovhPYPPd1rDlFBQupH2DYgaQ8mGS
 XE6+xACPkGPRYZ/sIxnokS0cBccV+HwLVYpy3xQSs6CZpAH7/aPxZRUyNQV45R4Q3i3S
 rFggKgSLJaf9Kh35oq3cHXPu7nrIxkfLwNrHvwvf4wceXvSB/bGuHwXDB0brZeCWRRnc
 cPJ6iq6j4Cp1U/S2nUhZ5/cSoFUN+1GI6dWqz+J76TSpzDgNxGcbCfjFfPhX+WDSngEg
 ZpBzLc2RXByjdY57HXSehMVzRckFBWJlEMD+4o7gpv6ce48F2htGilQjKmUtVHBg6oew
 j+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQcY8qlVKNfYD7HLqc8hwd/dxJeX8W7zGLkN1rSU3qU=;
 b=Of3qORRtyFUptG9D/kHjJtyXNNAw25NwyB3scIw4fgl4GdRCbcvQxkv6a2BWceoPBw
 cqO+u5UoTh7e40OEFDRsL+mqx6NRFn69Tc68f+TIoTRb8x/zvW/T3UVIgGtenya8zGb6
 Y9HK5X6NThSkkEyIbpOgiDiA8xIHLsGU4B9gtzsZn18TEof4tPCer24XMHZQpiWfC4QB
 jDaWcSfprMSDSvJLXt0x1E33q3FoEqN7kJNpLvWA4pnR1bKSt5Nu7Hn4vBKByoga0k60
 NrSbyv1ziL24Vm43Gg4cYC60iRRT+8E+6QF4VgiuJFuUpWtuwM6KLF/9WFx77cPQT4tn
 E7nA==
X-Gm-Message-State: AOAM5329QidydbQ1QRqYeHVRosmZnjA1eoTupSxP+EWi7hLYwsRI/C1r
 yQSKyu8OZo1MMvh8yF6nFj9FtjLhkFA=
X-Google-Smtp-Source: ABdhPJzgqOdviWnuS865/m7RGQItMXR31kJnxPWv6opxSVU7ezXa4fxNFEeNcvbALGQJtIsbjbhSTQ==
X-Received: by 2002:a17:906:71cc:: with SMTP id
 i12mr9278731ejk.507.1599343603998; 
 Sat, 05 Sep 2020 15:06:43 -0700 (PDT)
Received: from debian64.daheim (pd9e292e7.dip0.t-ipconnect.de.
 [217.226.146.231])
 by smtp.gmail.com with ESMTPSA id l7sm10551304ejc.25.2020.09.05.15.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 15:06:43 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1kEgKL-000FIv-Ti; Sun, 06 Sep 2020 00:06:29 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/5] powerpc: apm82181: add Meraki MR24 AP
Date: Sun,  6 Sep 2020 00:06:14 +0200
Message-Id: <c7f3d868a3571f41035e2975c436822e69b54417.1599343429.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599343429.git.chunkeey@gmail.com>
References: <cover.1599343429.git.chunkeey@gmail.com>
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
Cc: Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Chris Blake <chrisrblake93@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch adds the device-tree definitions for Meraki MR24
Accesspoint devices.

Board: MR24 - Meraki MR24 Cloud Managed Access Point
CPU: APM82181 SoC 800 MHz (PLB=200 OPB=100 EBC=100)
Flash size: 32MiB
RAM Size: 128MiB
Wireless: Atheros AR9380 5.0GHz + Atheros AR9380 2.4GHz
EPHY: 1x Gigabit Atheros AR8035

Ready to go images and install instruction can be found @OpenWrt.

Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
rfc v1 -> v2:
	- use new led naming scheme
	- space-vs-tab snafu cleanup
	- remove led-aliases (openwrt specific)
	- overhauled commit message
v2 -> v3:
	- added interrupt-properties legacy pci interrupt signalling
	  to fix wifi
---
 arch/powerpc/boot/dts/meraki-mr24.dts      | 237 +++++++++++++++++++++
 arch/powerpc/platforms/44x/ppc44x_simple.c |   1 +
 2 files changed, 238 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/meraki-mr24.dts

diff --git a/arch/powerpc/boot/dts/meraki-mr24.dts b/arch/powerpc/boot/dts/meraki-mr24.dts
new file mode 100644
index 000000000000..f91c243e7678
--- /dev/null
+++ b/arch/powerpc/boot/dts/meraki-mr24.dts
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device Tree Source for Meraki MR24 (Ikarem)
+ *
+ * Copyright (C) 2016 Chris Blake <chrisrblake93@gmail.com>
+ *
+ * Based on Cisco Meraki GPL Release r23-20150601 MR24 DTS
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include "apm82181.dtsi"
+
+/ {
+	model = "Meraki MR24 Access Point";
+	compatible = "meraki,mr24";
+
+	aliases {
+		serial0 = &UART1;
+	};
+
+	chosen {
+		stdout-path = "/plb/opb/serial@ef600400";
+	};
+};
+
+&CRYPTO {
+	status = "okay";
+};
+
+&HWRNG {
+	status = "okay";
+};
+
+&NAND {
+	status = "okay";
+
+	/* 32 MiB NAND Flash */
+	nand {
+		partition@0 {
+			label = "u-boot";
+			reg = <0x00000000 0x00150000>;
+			read-only;
+		};
+
+		partition@150000 {
+			/*
+			 * The u-boot environment size is one NAND
+			 * block (16KiB). u-boot allocates four NAND
+			 * blocks (64KiB) in order to have spares
+			 * around for bad block management
+			 */
+			label = "u-boot-env";
+			reg = <0x00150000 0x00010000>;
+			read-only;
+		};
+
+		partition@160000 {
+			/*
+			 * redundant u-boot environment.
+			 * has to be kept it in sync with the
+			 * data in "u-boot-env".
+			 */
+			label = "u-boot-env-redundant";
+			reg = <0x00160000 0x00010000>;
+			read-only;
+		};
+
+		partition@170000 {
+			label = "oops";
+			reg = <0x00170000 0x00010000>;
+		};
+
+		partition@180000 {
+			label = "ubi";
+			reg = <0x00180000 0x01e80000>;
+		};
+	};
+};
+
+&UART1 {
+	status = "okay";
+};
+
+&GPIO0 {
+	status = "okay";
+};
+
+&IIC0 {
+	status = "okay";
+	/* Boot ROM is at 0x52-0x53, do not touch */
+	/* Unknown chip at 0x6e, not sure what it is */
+};
+
+&EMAC0 {
+	status = "okay";
+
+	phy-mode = "rgmii-id";
+	phy-map = <0x2>;
+	phy-address = <0x1>;
+	phy-handle = <&phy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy: phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+		};
+	};
+};
+
+&POB0 {
+	leds {
+		compatible = "gpio-leds";
+
+		status: power-green {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&GPIO0 18 GPIO_ACTIVE_LOW>;
+		};
+
+		failsafe: power-amber {
+			function = LED_FUNCTION_FAULT;
+			color = <LED_COLOR_ID_AMBER>;
+			gpios = <&GPIO0 19 GPIO_ACTIVE_LOW>;
+		};
+
+		lan {
+			function = LED_FUNCTION_WAN;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&GPIO0 17 GPIO_ACTIVE_LOW>;
+		};
+
+		/* signal strength indicator */
+		ssi-0 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&GPIO0 23 GPIO_ACTIVE_LOW>;
+		};
+
+		ssi-1 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&GPIO0 22 GPIO_ACTIVE_LOW>;
+		};
+
+		ssi-2 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&GPIO0 21 GPIO_ACTIVE_LOW>;
+		};
+
+		ssi-3 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&GPIO0 20 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	keys {
+		compatible = "gpio-keys";
+
+		reset {
+			/* Label as per Meraki's "MR24 Installation Guide" */
+			label = "Factory Reset Button";
+			linux,code = <KEY_RESTART>;
+			interrupt-parent = <&UIC1>;
+			interrupts = <0x15 IRQ_TYPE_EDGE_FALLING>;
+			gpios = <&GPIO0 16 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+};
+
+&PCIE0 {
+	status = "okay";
+	/*
+	 * relevant lspci topology:
+	 *
+	 *	-+-[0000:40]---00.0-[41-7f]----00.0-[42-45]--+-02.0-[43]----00.0
+	 *	                                             +-03.0-[44]----00.0
+	 *
+	 */
+
+	bridge@40,0 {
+		reg = <0x00400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		bridge@41,0 {
+			/* IDT PES3T3 PCI Express Switch */
+			compatible = "pci111d,8039";
+			reg = <0x00410000 0 0 0 0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+
+			bridge@42,2 {
+				compatible = "pci111d,8039";
+				reg = <0x00421000 0 0 0 0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+
+				wifi0: wifi@43,0 {
+					/* Atheros AR9380 2.4GHz */
+					compatible = "pci168c,0030";
+					reg = <0x00430000 0 0 0 0>;
+					interrupts = <3>; /* INTC */
+				};
+			};
+
+			bridge@42,3 {
+				compatible = "pci111d,8039";
+				reg = <0x00421800 0 0 0 0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+
+				wifi1: wifi@44,0 {
+					/* Atheros AR9380 5GHz */
+					compatible = "pci168c,0030";
+					reg = <0x00440000 0 0 0 0>;
+					interrupts = <4>; /* INTD */
+				};
+			};
+		};
+	};
+};
+
+&MSI {
+	status = "okay";
+};
diff --git a/arch/powerpc/platforms/44x/ppc44x_simple.c b/arch/powerpc/platforms/44x/ppc44x_simple.c
index 1122702c804a..7d479928fd48 100644
--- a/arch/powerpc/platforms/44x/ppc44x_simple.c
+++ b/arch/powerpc/platforms/44x/ppc44x_simple.c
@@ -60,6 +60,7 @@ static char *board[] __initdata = {
 	"amcc,taishan",
 	"amcc,yosemite",
 	"mosaixtech,icon",
+	"meraki,mr24",
 	"wd,mybooklive",
 };
 
-- 
2.28.0

