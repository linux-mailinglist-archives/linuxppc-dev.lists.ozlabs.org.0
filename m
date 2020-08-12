Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A12A3243129
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 00:51:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRlLc5QyGzDqcq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 08:51:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s6Do/L46; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRl7Z2Dh5zDqcK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 08:41:59 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id g19so4028307ejc.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 15:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=njq5eKVEIouCXrHwJV8bHdCTvHNzR5PxozEB3QcOjTU=;
 b=s6Do/L46zu7ibSlY8cFuca58IaJ1lxdVu5aS6m4sQzTx1wEgwDEh8J+oGqIM3OMH+8
 5xIU09N+j4wNhBKs4jKzEXVqfFA7tHLHOISxQ3h8E4l7Eg40IvQOOwd59AA1RqoJLAdt
 3YvVgZIBbkuwbhw6OeAPfujFjZ820fizoUuFWXQG2YvDqfHAvvMlmlCssCoyLPSO1Xh6
 s/s1Ub6PKmUY3wyHgvBRevmrVTC7DEYOtkcNzgAY4+ub7JxYGAI+C2NuflhcJAVb6A1i
 V+H6U+yz4zte5IJ47YzzcG4/G7A6HYCbKoaVWkeoNtg/LqvFoOLZ/tyxJASxUFoKgHl1
 0FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=njq5eKVEIouCXrHwJV8bHdCTvHNzR5PxozEB3QcOjTU=;
 b=M09q3wkYKlmJ85eGO3f2HNYsNdWSNaU1vobuOiZSdCyzz59O4UEoD9Xr6Bmv5BWrpc
 VGKRVyUYA56dZ9hUBiLS7wD1KJ5eZxSm1RiYb+uBZ3g5YohTY8dg9wk96ZZEHNXySAer
 DocVPJD2hMcoCh343gPXV225TBdiPs+xNHpfiEGuluWaUxyxTJoZtn7BDbZLi9KyB4XF
 UlDBNC2Qgv3V163Ke8wMmBq07GrG0cEe4LEhAHzEI7f18Gg6G4JclCInDIam0vtL5mg2
 b4pKOn6Wt8BbU8spNeQ9Ed+YHax8cqqWazIFh1i0dvlv+R3DDROxQoQg/BA954NlocWx
 4iuQ==
X-Gm-Message-State: AOAM531S9zY9RAIhx4i1SV/ef+5+5AsoioWhDtOvldwFbMpUCmwDicRy
 SfJoMSnvykjaE5AMmdI5B5f7MrVh
X-Google-Smtp-Source: ABdhPJwqnsPICgXhzQpYDNT9TsBOsTsuGi6RERpYJgAHgYgdqCWYGTCpwn5W9ONkRGbJIrtoZDesbw==
X-Received: by 2002:a17:906:d18c:: with SMTP id
 c12mr1973664ejz.151.1597272115824; 
 Wed, 12 Aug 2020 15:41:55 -0700 (PDT)
Received: from debian64.daheim (pd9e293b6.dip0.t-ipconnect.de.
 [217.226.147.182])
 by smtp.gmail.com with ESMTPSA id y14sm2388339ejr.35.2020.08.12.15.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 15:41:54 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1k5zRR-005oDS-Qw; Thu, 13 Aug 2020 00:41:53 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH v1 1/4] powerpc: apm82181: create shared dtsi for APM
 bluestone
Date: Thu, 13 Aug 2020 00:41:50 +0200
Message-Id: <15a94dddc15d29bac02439beb77fd066771c747a.1597271958.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1597271958.git.chunkeey@gmail.com>
References: <cover.1597271958.git.chunkeey@gmail.com>
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

This patch adds an DTSI-File that can be used by various device-tree
files for APM82181-based devices.

Some of the nodes (like UART, PCIE, SATA) are used by the uboot and
need to stick with the naming-conventions of the old times'.
I've added comments whenever this was the case. But unfortunately,
this I've to point out that for this reason, there are some warning
messages when compiling the dtb:

> apm82181.dtsi:440.26-483.5: Warning (pci_bridge): /plb/pciex@d00000000: node name is not "pci" or "pcie"
> wd-mybooklive.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'

Signed-off-By: Chris Blake <chrisrblake93@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 arch/powerpc/boot/dts/apm82181.dtsi | 485 ++++++++++++++++++++++++++++
 1 file changed, 485 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/apm82181.dtsi

diff --git a/arch/powerpc/boot/dts/apm82181.dtsi b/arch/powerpc/boot/dts/apm82181.dtsi
new file mode 100644
index 000000000000..54a9a6fda4af
--- /dev/null
+++ b/arch/powerpc/boot/dts/apm82181.dtsi
@@ -0,0 +1,485 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Device Tree template include for various Bluestone (APM82181) boards.
+ *
+ * Copyright (c) 2010, Applied Micro Circuits Corporation
+ * Author: Tirumala R Marri <tmarri@apm.com>,
+ *	   Christian Lamparter <chunkeey@gmail.com>,
+ *	   Chris Blake <chrisrblake93@gmail.com>
+ */
+
+#include <dt-bindings/dma/dw-dmac.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <1>;
+	dcr-parent = <&{/cpus/cpu@0}>;
+	compatible = "apm,bluestone";
+
+	aliases {
+		ethernet0 = &EMAC0; /* needed for BSP u-boot */
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			model = "PowerPC,apm82181";
+			reg = <0x00000000>;
+			clock-frequency = <0>; /* Filled in by U-Boot */
+			timebase-frequency = <0>; /* Filled in by U-Boot */
+			i-cache-line-size = <32>;
+			d-cache-line-size = <32>;
+			i-cache-size = <32768>;
+			d-cache-size = <32768>;
+			dcr-controller;
+			dcr-access-method = "native";
+			next-level-cache = <&L2C0>;
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x00000000 0x00000000>; /* Filled in by U-Boot */
+	};
+
+	UIC0: interrupt-controller0 {
+		compatible = "apm,uic-apm82181", "ibm,uic";
+		interrupt-controller;
+		cell-index = <0>;
+		dcr-reg = <0x0c0 0x009>;
+		#address-cells = <0>;
+		#size-cells = <0>;
+		#interrupt-cells = <2>;
+	};
+
+	UIC1: interrupt-controller1 {
+		compatible = "apm,uic-apm82181", "ibm,uic";
+		interrupt-controller;
+		cell-index = <1>;
+		dcr-reg = <0x0d0 0x009>;
+		#address-cells = <0>;
+		#size-cells = <0>;
+		#interrupt-cells = <2>;
+		interrupts = <0x1e IRQ_TYPE_LEVEL_HIGH>,
+			     <0x1f IRQ_TYPE_LEVEL_HIGH>; /* cascade */
+		interrupt-parent = <&UIC0>;
+	};
+
+	UIC2: interrupt-controller2 {
+		compatible = "apm,uic-apm82181", "ibm,uic";
+		interrupt-controller;
+		cell-index = <2>;
+		dcr-reg = <0x0e0 0x009>;
+		#address-cells = <0>;
+		#size-cells = <0>;
+		#interrupt-cells = <2>;
+		interrupts = <0x0a IRQ_TYPE_LEVEL_HIGH>,
+			     <0x0b IRQ_TYPE_LEVEL_HIGH>; /* cascade */
+		interrupt-parent = <&UIC0>;
+	};
+
+	UIC3: interrupt-controller3 {
+		compatible = "apm,uic-apm82181","ibm,uic";
+		interrupt-controller;
+		cell-index = <3>;
+		dcr-reg = <0x0f0 0x009>;
+		#address-cells = <0>;
+		#size-cells = <0>;
+		#interrupt-cells = <2>;
+		interrupts = <0x10 IRQ_TYPE_LEVEL_HIGH>,
+			     <0x11 IRQ_TYPE_LEVEL_HIGH>; /* cascade */
+		interrupt-parent = <&UIC0>;
+	};
+
+	OCM1: ocm@400040000 {
+		compatible = "apm,ocm-apm82181", "ibm,ocm";
+		status = "okay";
+		cell-index = <1>;
+		/* configured in U-Boot */
+		reg = <4 0x00040000 0x8000>; /* 32K */
+	};
+
+	SDR0: sdr {
+		compatible = "apm,sdr-apm82181", "ibm,sdr-460ex";
+		dcr-reg = <0x00e 0x002>;
+	};
+
+	CPR0: cpr {
+		compatible = "apm,cpr-apm82181", "ibm,cpr-460ex";
+		dcr-reg = <0x00c 0x002>;
+	};
+
+	L2C0: l2c {
+		compatible = "ibm,l2-cache-apm82181", "ibm,l2-cache";
+		dcr-reg = <0x020 0x008
+			   0x030 0x008>;
+		cache-line-size = <32>;
+		cache-size = <262144>;
+		interrupt-parent = <&UIC1>;
+		interrupts = <0x0b IRQ_TYPE_EDGE_RISING>;
+	};
+
+	CPM0: cpm {
+		compatible = "ibm,cpm-apm821xx", "ibm,cpm";
+		cell-index = <0>;
+		dcr-reg = <0x160 0x003>;
+		pm-cpu = <0x02000000>;
+		pm-doze = <0x302570F0>;
+		pm-nap = <0x302570F0>;
+		pm-deepsleep = <0x302570F0>;
+		pm-iic-device = <&IIC0>;
+		pm-emac-device = <&EMAC0>;
+		unused-units = <0x00000100>;
+		idle-doze = <0x02000000>;
+		standby = <0xfeff791d>;
+	};
+
+	plb {
+		compatible = "apm,plb-apm82181", "ibm,plb-460ex", "ibm,plb4";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges; /* Filled in by U-Boot */
+		clock-frequency = <0>; /* Filled in by U-Boot */
+
+		SDRAM0: sdram {
+			compatible = "apm,sdram-apm82181", "ibm,sdram-460ex", "ibm,sdram-405gp";
+			dcr-reg = <0x010 0x002>;
+		};
+
+		RTC: rtc {
+			compatible = "ibm,rtc";
+			dcr-reg = <0x240 0x009>;
+			interrupts = <0x1a IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&UIC2>;
+			status = "disabled";
+		};
+
+		TRNG: trng@110000 {
+			compatible = "amcc,ppc460ex-rng", "ppc4xx-rng", "amcc, ppc4xx-trng";
+			reg = <4 0x00110000 0x100>;
+			interrupt-parent = <&UIC1>;
+			interrupts = <0x03 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		PKA: pka@114000 {
+			compatible = "ppc4xx-pka", "amcc,ppc4xx-pka", "amcc, ppc4xx-pka";
+			reg = <4 0x00114000 0x4000>;
+			interrupt-parent = <&UIC0>;
+			interrupts = <0x14 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+		};
+
+		CRYPTO: crypto@180000 {
+			compatible = "amcc,ppc460ex-crypto", "amcc,ppc4xx-crypto";
+			reg = <4 0x00180000 0x80400>;
+			interrupt-parent = <&UIC0>;
+			interrupts = <0x1d IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled"; /* hardware option */
+		};
+
+		MAL0: mcmal {
+			compatible = "ibm,mcmal-460ex", "ibm,mcmal2";
+			descriptor-memory = "ocm";
+			dcr-reg = <0x180 0x062>;
+			num-tx-chans = <1>;
+			num-rx-chans = <1>;
+			#address-cells = <0>;
+			#size-cells = <0>;
+			interrupt-parent = <&UIC2>;
+			interrupts = <0x06 IRQ_TYPE_LEVEL_HIGH>,
+				     <0x07 IRQ_TYPE_LEVEL_HIGH>,
+				     <0x03 IRQ_TYPE_LEVEL_HIGH>,
+				     <0x04 IRQ_TYPE_LEVEL_HIGH>,
+				     <0x05 IRQ_TYPE_LEVEL_HIGH>,
+				     <0x08 IRQ_TYPE_EDGE_FALLING>,
+				     <0x09 IRQ_TYPE_EDGE_FALLING>,
+				     <0x0c IRQ_TYPE_EDGE_FALLING>,
+				     <0x0d IRQ_TYPE_EDGE_FALLING>;
+			interrupt-names = "txeob", "rxeob", "serr",
+					  "txde", "rxde",
+					  "tx0coal", "tx1coal",
+					  "rx0coal", "rx1coal";
+		};
+
+		POB0: opb {
+			compatible = "ibm,opb-460ex", "ibm,opb";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0xb0000000 0x00000004 0xb0000000 0x50000000>;
+			clock-frequency = <0>; /* Filled in by U-Boot */
+
+			EBC0: ebc {
+				compatible = "ibm,ebc-460ex", "ibm,ebc";
+				dcr-reg = <0x012 0x002>;
+				#address-cells = <2>;
+				#size-cells = <1>;
+				clock-frequency = <0>; /* Filled in by U-Boot */
+				/* ranges property is supplied by U-Boot */
+				ranges = <0x00000003 0x00000000 0xe0000000 0x8000000>;
+				interrupts = <0x06 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&UIC1>;
+
+				nor_flash@0,0 {
+					compatible = "cfi-flash";
+					bank-width = <1>;
+					reg = <0x00000000 0x00000000 0x00100000>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					status = "disabled";
+				};
+
+				ndfc@1,0 {
+					compatible = "ibm,ndfc";
+					reg = <00000003 00000000 00002000>;
+					ccr = <0x00001000>;
+					bank-settings = <0x80002222>;
+					status = "disabled";
+
+					nand {
+						#address-cells = <1>;
+						#size-cells = <1>;
+					};
+				};
+			};
+
+			UART0: serial@ef600300 {
+				/*
+				 * AMCC's BSP u-boot scans for the "ns16550"
+				 * compatible, without it, u-boot wouldn't
+				 * set the required "clock-frequency".
+				 *
+				 * The hardware documentation states:
+				 * "Register compatibility with 16750 register set"
+				 */
+				compatible = "ns16750", "ns16550";
+				reg = <0xef600300 0x00000008>;
+				virtual-reg = <0xef600300>;
+				clock-frequency = <0>; /* Filled in by U-Boot */
+				interrupt-parent = <&UIC1>;
+				interrupts = <0x01 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			UART1: serial@ef600400 {
+				/* same "ns16750" as with UART0 */
+				compatible = "ns16750", "ns16550";
+				reg = <0xef600400 0x00000008>;
+				virtual-reg = <0xef600400>;
+				clock-frequency = <0>; /* Filled in by U-Boot */
+				interrupt-parent = <&UIC0>;
+				interrupts = <0x01 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			IIC0: i2c@ef600700 {
+				compatible = "ibm,iic-460ex", "ibm,iic";
+				reg = <0xef600700 0x00000014>;
+				interrupt-parent = <&UIC0>;
+				interrupts = <0x02 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			IIC1: i2c@ef600800 {
+				compatible = "ibm,iic-460ex", "ibm,iic";
+				reg = <0xef600800 0x00000014>;
+				interrupt-parent = <&UIC0>;
+				interrupts = <0x03 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			GPIO0: gpio@ef600b00 {
+				compatible = "ibm,ppc4xx-gpio";
+				reg = <0xef600b00 0x00000048>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				status = "disabled";
+			};
+
+			EMAC0: ethernet@ef600c00 {
+				device_type = "network";
+				compatible = "ibm,emac-apm821xx", "ibm,emac4sync";
+				interrupt-parent = <&EMAC0>;
+				interrupts = <0 1>;
+				#interrupt-cells = <1>;
+				#address-cells = <0>;
+				#size-cells = <0>;
+				interrupt-map = <0 &UIC2 0x10 IRQ_TYPE_LEVEL_HIGH>,
+						<1 &UIC2 0x14 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "status", "wake";
+
+				reg = <0xef600c00 0x000000c4>;
+				local-mac-address = [000000000000]; /* Filled in by U-Boot */
+				mal-device = <&MAL0>;
+				mal-tx-channel = <0>;
+				mal-rx-channel = <0>;
+				cell-index = <0>;
+				max-frame-size = <9000>;
+				rx-fifo-size = <16384>;
+				tx-fifo-size = <2048>;
+				phy-mode = "rgmii";
+				phy-map = <0x00000000>;
+				rgmii-device = <&RGMII0>;
+				rgmii-channel = <0>;
+				tah-device = <&TAH0>;
+				tah-channel = <0>;
+				has-inverted-stacr-oc;
+				has-new-stacr-staopc;
+				status = "disabled";
+			};
+
+			TAH0: emac-tah@ef601350 {
+				compatible = "ibm,tah-460ex", "ibm,tah";
+				reg = <0xef601350 0x00000030>;
+			};
+
+			RGMII0: emac-rgmii@ef601500 {
+				compatible = "ibm,rgmii-405ex", "ibm,rgmii";
+				reg = <0xef601500 0x00000008>;
+				has-mdio;
+			};
+		};
+
+		USBOTG0: usbotg@bff80000 {
+			compatible = "amcc,dwc-otg";
+			reg = <4 0xbff80000 0x10000>;
+			interrupt-parent = <&USBOTG0>;
+			interrupts = <0 1 2>;
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			#size-cells = <0>;
+			interrupt-map = <0 &UIC2 0x1c IRQ_TYPE_LEVEL_HIGH>,
+					<1 &UIC1 0x1a IRQ_TYPE_LEVEL_LOW>,
+					<2 &UIC0 0x0c IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "usb-otg", "high-power", "dma";
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		AHBDMA0: dma@bffd0800 {
+			compatible = "snps,dma-spear1340";
+			reg = <4 0xbffd0800 0x400>;
+			interrupt-parent = <&UIC0>;
+			interrupts = <0x19 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <3>;
+
+			dma-channels = <2>;
+			dma-masters = <3>;
+			block_size = <4095>;
+			data-width = <4>, <4>, <4>;
+			multi-block = <1>, <1>;
+
+			chan_allocation_order = <1>;
+			chan_priority = <1>;
+
+			snps,dma-protection-control =
+				<(DW_DMAC_HPROT1_PRIVILEGED_MODE |
+				  DW_DMAC_HPROT2_BUFFERABLE)>;
+			is_memcpy;
+		};
+
+		SATA0: sata@bffd1000 {
+			compatible = "amcc,sata-460ex";
+			reg = <4 0xbffd1000 0x800>;
+			interrupt-parent = <&UIC0>;
+			interrupts = <0x1a IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&AHBDMA0 0 0 1>;
+			dma-names = "sata-dma";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		SATA1: sata@bffd1800 {
+			compatible = "amcc,sata-460ex";
+			reg = <4 0xbffd1800 0x800>;
+			interrupt-parent = <&UIC0>;
+			interrupts = <0x1b IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&AHBDMA0 1 0 2>;
+			dma-names = "sata-dma";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		MSI: ppc4xx-msi@c10000000 {
+			compatible = "amcc,ppc4xx-msi", "ppc4xx-msi";
+			reg = <0xc 0x10000000 0x100
+			       0xc 0x10000000 0x100>;
+			sdr-base = <0x36C>;
+			msi-data = <0x00004440>;
+			msi-mask = <0x0000ffe0>;
+			interrupts =<0 1 2 3 4 5 6 7>;
+			interrupt-parent = <&MSI>;
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			#size-cells = <0>;
+			msi-available-ranges = <0x0 0x100>;
+			interrupt-map =
+				<0 &UIC3 0x18 IRQ_TYPE_EDGE_RISING>,
+				<1 &UIC3 0x19 IRQ_TYPE_EDGE_RISING>,
+				<2 &UIC3 0x1a IRQ_TYPE_EDGE_RISING>,
+				<3 &UIC3 0x1b IRQ_TYPE_EDGE_RISING>,
+				<4 &UIC3 0x1c IRQ_TYPE_EDGE_RISING>,
+				<5 &UIC3 0x1d IRQ_TYPE_EDGE_RISING>,
+				<6 &UIC3 0x1e IRQ_TYPE_EDGE_RISING>,
+				<7 &UIC3 0x1f IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+		};
+
+		PCIE0: pciex@d00000000 {
+			device_type = "pci"; /* see ppc4xx_pci_find_bridge */
+			#interrupt-cells = <1>;
+			#size-cells = <2>;
+			#address-cells = <3>;
+			compatible = "ibm,plb-pciex-apm821xx", "ibm,plb-pciex";
+			primary;
+			port = <0x0>; /* port number */
+			reg = <0x0000000d 0x00000000 0x20000000>, /* Config space access */
+			      <0x0000000c 0x08010000 0x00001000>; /* Registers */
+			dcr-reg = <0x100 0x020>;
+			sdr-base = <0x300>;
+
+			/*
+			 * Outbound ranges, one memory and one IO,
+			 * later cannot be changed
+			 */
+			ranges = <0x02000000 0x00000000 0x80000000 0x0000000e 0x00000000 0x00000000 0x80000000>,
+				 <0x02000000 0x00000000 0x00000000 0x0000000f 0x00000000 0x00000000 0x00100000>,
+				 <0x01000000 0x00000000 0x00000000 0x0000000f 0x80000000 0x00000000 0x00010000>;
+
+			/* Inbound 2GB range starting at 0 */
+			dma-ranges = <0x42000000 0x0 0x0 0x0 0x0 0x0 0x80000000>;
+
+			/* This drives busses 0x40 to 0x7f */
+			bus-range = <0x40 0x7f>;
+
+			/*
+			 * Legacy interrupts (note the weird polarity, the bridge seems
+			 * to invert PCIe legacy interrupts).
+			 * We are de-swizzling here because the numbers are actually for
+			 * port of the root complex virtual P2P bridge. But I want
+			 * to avoid putting a node for it in the tree, so the numbers
+			 * below are basically de-swizzled numbers.
+			 * The real slot is on idsel 0, so the swizzling is 1:1
+			 */
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map =
+				<0x0 0x0 0x0 0x1 &UIC3 0x0c IRQ_TYPE_LEVEL_HIGH>, /* swizzled int A */
+				<0x0 0x0 0x0 0x2 &UIC3 0x0d IRQ_TYPE_LEVEL_HIGH>, /* swizzled int B */
+				<0x0 0x0 0x0 0x3 &UIC3 0x0e IRQ_TYPE_LEVEL_HIGH>, /* swizzled int C */
+				<0x0 0x0 0x0 0x4 &UIC3 0x0f IRQ_TYPE_LEVEL_HIGH>; /* swizzled int D */
+			status = "disabled";
+		};
+	};
+};
-- 
2.28.0

