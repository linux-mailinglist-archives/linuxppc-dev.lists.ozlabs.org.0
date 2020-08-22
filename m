Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C470E24E979
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 21:44:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYpkG6T0mzDqS3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Aug 2020 05:44:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lMivf1wO; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BYpXC3tLkzDqlr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Aug 2020 05:35:55 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id a26so6854643ejc.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 12:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOo6OExI5SkxrAvkzOSG6IHaD1P5CMxIl/oWMy9swpM=;
 b=lMivf1wOYV1BR4gSN/X+CGkVxmwDaZ8/e010AvH2JsGb6xbpw1MUeVKInYVZbHmy+B
 Pvq1ppkcBvFqeBjGa5m425wLyeexYxMyFWSS5Z9bHMGuia9FRKC7W5YS3AKsNvA0Onsu
 el/tWGvbk97BuQGOm3QxP/BqRFzux2D8r7EOg3TtZBjcNcEAQ+3Pj0iPK1V/y5omO+DW
 hIS944QNothaWf7KUeRhVWoiUcUMJx8wOfqj66UlH/qeffMKmHqjXKhEP2fIPx2Y/kdA
 Ri2utZ32tpC52hBWw6aZw3wE0F4a4FlVkHHxM6F6eieQ76oymjkAVNG2N+8v9XMpFooX
 F4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOo6OExI5SkxrAvkzOSG6IHaD1P5CMxIl/oWMy9swpM=;
 b=kvCYo1Tm5CpTa3Zjujbe8EJk2sQBAA5aWhQnB2RBd3QMLr+B4+cozQuHx+eVFDF8HJ
 zLdVxWIGenYPgIOtYfpnlK3m8pi668UHxnPqn4GWixkwZrknqXqofhRbJ/SKPO5itBLN
 T2/n7q7+7JdnDE7CjFBpmoeYQi0Np6QugpdukALCAwHNmbPjE/RkcwhdtWhUN/n5Omx0
 j2nu2xMGmYhC3aFVTqMdOKq48OICHQ5mX202Kvk3yFZPROHkmXemvvX1A5SaQzcjUV5S
 1+9qIgkpZVl0Shup5FqPTnV62HsSqZraxXXh5KT5VXdVNvKUfmeq9WwpWCz5tBFNvaZ7
 c32g==
X-Gm-Message-State: AOAM531839YzaWbf9yCX2ltFZ8MWZbc1bYD2SJ9mHQ64hcfJb723h94K
 nchAgcoAdT7+EHw+yVKbT2kBK9LzIChv5Q==
X-Google-Smtp-Source: ABdhPJzO1nWPvA8SwH9zWhBLda5c2nJeaoyI0FG7aaMp7Rc74Z158L9h0qmFsgAdfFcbrkXUyE/rvA==
X-Received: by 2002:a17:906:f8d0:: with SMTP id
 lh16mr4539683ejb.546.1598124952254; 
 Sat, 22 Aug 2020 12:35:52 -0700 (PDT)
Received: from debian64.daheim (p4fd09171.dip0.t-ipconnect.de.
 [79.208.145.113])
 by smtp.gmail.com with ESMTPSA id p13sm3434361edq.81.2020.08.22.12.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 12:35:51 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1k9ZIi-000Enw-2b; Sat, 22 Aug 2020 21:35:40 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] powerpc: apm82181: integrate bluestone.dts
Date: Sat, 22 Aug 2020 21:35:21 +0200
Message-Id: <57c9465d3b6aa9345bc89192173fbf29baf7473d.1598124791.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1598124791.git.chunkeey@gmail.com>
References: <cover.1598124791.git.chunkeey@gmail.com>
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

This patch tries to integrate the existing bluestone.dts into the
apm82181.dtsi framework.

The original bluestone.dts produces a  peculiar warning message.
> bluestone.dts:120.10-125.4: Warning (i2c_bus_reg):
>  /plb/opb/i2c@ef600700/sttm@4C: I2C bus unit address format error, expected "4c"
For now, this has been kept as-is.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 arch/powerpc/boot/dts/bluestone.dts | 458 +++++++---------------------
 1 file changed, 104 insertions(+), 354 deletions(-)

diff --git a/arch/powerpc/boot/dts/bluestone.dts b/arch/powerpc/boot/dts/bluestone.dts
index cc965a1816b6..b568fe7ae526 100644
--- a/arch/powerpc/boot/dts/bluestone.dts
+++ b/arch/powerpc/boot/dts/bluestone.dts
@@ -8,388 +8,138 @@
 
 /dts-v1/;
 
+#include "apm82181.dtsi"
+
 / {
-	#address-cells = <2>;
-	#size-cells = <1>;
 	model = "apm,bluestone";
 	compatible = "apm,bluestone";
-	dcr-parent = <&{/cpus/cpu@0}>;
 
 	aliases {
-		ethernet0 = &EMAC0;
 		serial0 = &UART0;
 		serial1 = &UART1;
 	};
+};
 
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			device_type = "cpu";
-			model = "PowerPC,apm821xx";
-			reg = <0x00000000>;
-			clock-frequency = <0>; /* Filled in by U-Boot */
-			timebase-frequency = <0>; /* Filled in by U-Boot */
-			i-cache-line-size = <32>;
-			d-cache-line-size = <32>;
-			i-cache-size = <32768>;
-			d-cache-size = <32768>;
-			dcr-controller;
-			dcr-access-method = "native";
-			next-level-cache = <&L2C0>;
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x00000000 0x00000000>; /* Filled in by U-Boot */
-	};
-
-	UIC0: interrupt-controller0 {
-		compatible = "ibm,uic";
-		interrupt-controller;
-		cell-index = <0>;
-		dcr-reg = <0x0c0 0x009>;
-		#address-cells = <0>;
-		#size-cells = <0>;
-		#interrupt-cells = <2>;
-	};
-
-	UIC1: interrupt-controller1 {
-		compatible = "ibm,uic";
-		interrupt-controller;
-		cell-index = <1>;
-		dcr-reg = <0x0d0 0x009>;
-		#address-cells = <0>;
-		#size-cells = <0>;
-		#interrupt-cells = <2>;
-		interrupts = <0x1e 0x4 0x1f 0x4>; /* cascade */
-		interrupt-parent = <&UIC0>;
-	};
+&CRYPTO {
+	status = "okay";
+};
 
-	UIC2: interrupt-controller2 {
-		compatible = "ibm,uic";
-		interrupt-controller;
-		cell-index = <2>;
-		dcr-reg = <0x0e0 0x009>;
-		#address-cells = <0>;
-		#size-cells = <0>;
-		#interrupt-cells = <2>;
-		interrupts = <0xa 0x4 0xb 0x4>; /* cascade */
-		interrupt-parent = <&UIC0>;
-	};
+&HWRNG {
+	status = "okay";
+};
 
-	UIC3: interrupt-controller3 {
-		compatible = "ibm,uic";
-		interrupt-controller;
-		cell-index = <3>;
-		dcr-reg = <0x0f0 0x009>;
-		#address-cells = <0>;
-		#size-cells = <0>;
-		#interrupt-cells = <2>;
-		interrupts = <0x10 0x4 0x11 0x4>; /* cascade */
-		interrupt-parent = <&UIC0>;
-	};
+&NOR {
+	status = "okay";
 
-	OCM: ocm@400040000 {
-		compatible = "ibm,ocm";
-		status = "okay";
-		cell-index = <1>;
-		/* configured in U-Boot */
-		reg = <4 0x00040000 0x8000>; /* 32K */
-	};
+	compatible = "amd,s29gl512n", "cfi-flash";
+	bank-width = <2>;
+	reg = <0x00000000 0x00000000 0x00400000>;
 
-	SDR0: sdr {
-		compatible = "ibm,sdr-apm821xx";
-		dcr-reg = <0x00e 0x002>;
+	partition@0 {
+		label = "kernel";
+		reg = <0x00000000 0x00180000>;
 	};
-
-	CPR0: cpr {
-		compatible = "ibm,cpr-apm821xx";
-		dcr-reg = <0x00c 0x002>;
+	partition@180000 {
+		label = "env";
+		reg = <0x00180000 0x00020000>;
 	};
-
-	L2C0: l2c {
-		compatible = "ibm,l2-cache-apm82181", "ibm,l2-cache";
-		dcr-reg = <0x020 0x008
-			   0x030 0x008>;
-		cache-line-size = <32>;
-		cache-size = <262144>;
-		interrupt-parent = <&UIC1>;
-		interrupts = <11 1>;
+	partition@1a0000 {
+		label = "u-boot";
+		reg = <0x001a0000 0x00060000>;
 	};
+};
 
-	plb {
-		compatible = "ibm,plb4";
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges;
-		clock-frequency = <0>; /* Filled in by U-Boot */
+&NAND {
+	status = "okay";
 
-		SDRAM0: sdram {
-			compatible = "ibm,sdram-apm821xx";
-			dcr-reg = <0x010 0x002>;
+	/* 2Gb Nand Flash */
+	nand {
+		partition@0 {
+			label = "firmware";
+			reg   = <0x00000000 0x00C00000>;
 		};
-
-		MAL0: mcmal {
-			compatible = "ibm,mcmal2";
-			descriptor-memory = "ocm";
-			dcr-reg = <0x180 0x062>;
-			num-tx-chans = <1>;
-			num-rx-chans = <1>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			interrupt-parent = <&UIC2>;
-			interrupts = <	/*TXEOB*/ 0x6 0x4
-					/*RXEOB*/ 0x7 0x4
-					/*SERR*/  0x3 0x4
-					/*TXDE*/  0x4 0x4
-					/*RXDE*/  0x5 0x4>;
+		partition@c00000 {
+			label = "environment";
+			reg   = <0x00C00000 0x00B00000>;
 		};
+		partition@1700000 {
+			label = "kernel";
+			reg   = <0x01700000 0x00E00000>;
+		};
+		partition@2500000 {
+			label = "root";
+			reg   = <0x02500000 0x08200000>;
+		};
+		partition@a700000 {
+			label = "device-tree";
+			reg   = <0x0A700000 0x00B00000>;
+		};
+		partition@b200000 {
+			label = "config";
+			reg   = <0x0B200000 0x00D00000>;
+		};
+		partition@bf00000 {
+			label = "diag";
+			reg   = <0x0BF00000 0x00C00000>;
+		};
+		partition@cb00000 {
+			label = "vendor";
+			reg   = <0x0CB00000 0x3500000>;
+		};
+	};
+};
 
-		POB0: opb {
-			compatible = "ibm,opb";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0xb0000000 0x00000004 0xb0000000 0x50000000>;
-			clock-frequency = <0>; /* Filled in by U-Boot */
-
-			EBC0: ebc {
-				compatible = "ibm,ebc";
-				dcr-reg = <0x012 0x002>;
-				#address-cells = <2>;
-				#size-cells = <1>;
-				clock-frequency = <0>; /* Filled in by U-Boot */
-				/* ranges property is supplied by U-Boot */
-				ranges = < 0x00000003 0x00000000 0xe0000000 0x8000000>;
-				interrupts = <0x6 0x4>;
-				interrupt-parent = <&UIC1>;
-
-				nor_flash@0,0 {
-					compatible = "amd,s29gl512n", "cfi-flash";
-					bank-width = <2>;
-					reg = <0x00000000 0x00000000 0x00400000>;
-					#address-cells = <1>;
-					#size-cells = <1>;
-					partition@0 {
-						label = "kernel";
-						reg = <0x00000000 0x00180000>;
-					};
-					partition@180000 {
-						label = "env";
-						reg = <0x00180000 0x00020000>;
-					};
-					partition@1a0000 {
-						label = "u-boot";
-						reg = <0x001a0000 0x00060000>;
-					};
-				};
-
-				ndfc@1,0 {
-					compatible = "ibm,ndfc";
-					reg = <0x00000003 0x00000000 0x00002000>;
-					ccr = <0x00001000>;
-					bank-settings = <0x80002222>;
-					#address-cells = <1>;
-					#size-cells = <1>;
-					/* 2Gb Nand Flash */
-					nand {
-						#address-cells = <1>;
-						#size-cells = <1>;
-
-						partition@0 {
-							label = "firmware";
-							reg   = <0x00000000 0x00C00000>;
-						};
-						partition@c00000 {
-							label = "environment";
-							reg   = <0x00C00000 0x00B00000>;
-						};
-						partition@1700000 {
-							label = "kernel";
-							reg   = <0x01700000 0x00E00000>;
-						};
-						partition@2500000 {
-							label = "root";
-							reg   = <0x02500000 0x08200000>;
-						};
-						partition@a700000 {
-							label = "device-tree";
-							reg   = <0x0A700000 0x00B00000>;
-						};
-						partition@b200000 {
-							label = "config";
-							reg   = <0x0B200000 0x00D00000>;
-						};
-						partition@bf00000 {
-							label = "diag";
-							reg   = <0x0BF00000 0x00C00000>;
-						};
-						partition@cb00000 {
-							label = "vendor";
-							reg   = <0x0CB00000 0x3500000>;
-						};
-					};
-				};
-			};
-
-			UART0: serial@ef600300 {
-				device_type = "serial";
-				compatible = "ns16550";
-				reg = <0xef600300 0x00000008>;
-				virtual-reg = <0xef600300>;
-				clock-frequency = <0>; /* Filled in by U-Boot */
-				current-speed = <0>; /* Filled in by U-Boot */
-				interrupt-parent = <&UIC1>;
-				interrupts = <0x1 0x4>;
-			};
-
-			UART1: serial@ef600400 {
-				device_type = "serial";
-				compatible = "ns16550";
-				reg = <0xef600400 0x00000008>;
-				virtual-reg = <0xef600400>;
-				clock-frequency = <0>; /* Filled in by U-Boot */
-				current-speed = <0>; /* Filled in by U-Boot */
-				interrupt-parent = <&UIC0>;
-				interrupts = <0x1 0x4>;
-			};
-
-			IIC0: i2c@ef600700 {
-				compatible = "ibm,iic";
-				reg = <0xef600700 0x00000014>;
-				interrupt-parent = <&UIC0>;
-				interrupts = <0x2 0x4>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				rtc@68 {
-					compatible = "st,m41t80";
-					reg = <0x68>;
-					interrupt-parent = <&UIC0>;
-					interrupts = <0x9 0x8>;
-				};
-				sttm@4C {
-					compatible = "adm,adm1032";
-					reg = <0x4C>;
-					interrupt-parent = <&UIC1>;
-					interrupts = <0x1E 0x8>; /* CPU_THERNAL_L */
-				};
-			};
-
-			IIC1: i2c@ef600800 {
-				compatible = "ibm,iic";
-				reg = <0xef600800 0x00000014>;
-				interrupt-parent = <&UIC0>;
-				interrupts = <0x3 0x4>;
-			};
+&UART0 {
+	status = "okay";
+};
 
-			RGMII0: emac-rgmii@ef601500 {
-				compatible = "ibm,rgmii";
-				reg = <0xef601500 0x00000008>;
-				has-mdio;
-			};
+&UART1 {
+	status = "okay";
+};
 
-			TAH0: emac-tah@ef601350 {
-				compatible = "ibm,tah";
-				reg = <0xef601350 0x00000030>;
-			};
+&IIC0 {
+	status = "okay";
+	rtc@68 {
+		compatible = "st,m41t80";
+		reg = <0x68>;
+		interrupt-parent = <&UIC0>;
+		interrupts = <0x9 0x8>;
+	};
+	sttm@4C {
+		compatible = "adm,adm1032";
+		reg = <0x4C>;
+		interrupt-parent = <&UIC1>;
+		interrupts = <0x1E 0x8>; /* CPU_THERNAL_L */
+	};
+};
 
-			EMAC0: ethernet@ef600c00 {
-				device_type = "network";
-				compatible = "ibm,emac-apm821xx", "ibm,emac4sync";
-				interrupt-parent = <&EMAC0>;
-				interrupts = <0x0 0x1>;
-				#interrupt-cells = <1>;
-				#address-cells = <0>;
-				#size-cells = <0>;
-				interrupt-map = </*Status*/ 0x0 &UIC2 0x10 0x4
-						 /*Wake*/   0x1 &UIC2 0x14 0x4>;
-				reg = <0xef600c00 0x000000c4>;
-				local-mac-address = [000000000000]; /* Filled in by U-Boot */
-				mal-device = <&MAL0>;
-				mal-tx-channel = <0>;
-				mal-rx-channel = <0>;
-				cell-index = <0>;
-				max-frame-size = <9000>;
-				rx-fifo-size = <16384>;
-				tx-fifo-size = <2048>;
-				phy-mode = "rgmii";
-				phy-map = <0x00000000>;
-				rgmii-device = <&RGMII0>;
-				rgmii-channel = <0>;
-				tah-device = <&TAH0>;
-				tah-channel = <0>;
-				has-inverted-stacr-oc;
-				has-new-stacr-staopc;
-			};
-		};
+&IIC1 {
+	status = "okay";
+};
 
-		PCIE0: pciex@d00000000 {
-			device_type = "pci";
-			#interrupt-cells = <1>;
-			#size-cells = <2>;
-			#address-cells = <3>;
-			compatible = "ibm,plb-pciex-apm821xx", "ibm,plb-pciex";
-			primary;
-			port = <0x0>; /* port number */
-			reg = <0x0000000d 0x00000000 0x20000000	/* Config space access */
-			       0x0000000c 0x08010000 0x00001000>;	/* Registers */
-			dcr-reg = <0x100 0x020>;
-			sdr-base = <0x300>;
+&RGMII0 {
+	status = "okay";
+};
 
-			/* Outbound ranges, one memory and one IO,
-			 * later cannot be changed
-			 */
-			ranges = <0x02000000 0x00000000 0x80000000 0x0000000e 0x00000000 0x00000000 0x80000000
-				  0x02000000 0x00000000 0x00000000 0x0000000f 0x00000000 0x00000000 0x00100000
-				  0x01000000 0x00000000 0x00000000 0x0000000f 0x80000000 0x00000000 0x00010000>;
+&TAH0 {
+	status = "okay";
+};
 
-			/* Inbound 2GB range starting at 0 */
-			dma-ranges = <0x42000000 0x0 0x0 0x0 0x0 0x0 0x80000000>;
+&MAL0 {
+	status = "okay";
+};
 
-			/* This drives busses 40 to 0x7f */
-			bus-range = <0x40 0x7f>;
+&EMAC0 {
+	status = "okay";
+	local-mac-address = [000000000000]; /* Filled in by U-Boot */
+	phy-mode = "rgmii";
+	phy-map = <0x00000000>;
+};
 
-			/* Legacy interrupts (note the weird polarity, the bridge seems
-			 * to invert PCIe legacy interrupts).
-			 * We are de-swizzling here because the numbers are actually for
-			 * port of the root complex virtual P2P bridge. But I want
-			 * to avoid putting a node for it in the tree, so the numbers
-			 * below are basically de-swizzled numbers.
-			 * The real slot is on idsel 0, so the swizzling is 1:1
-			 */
-			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
-			interrupt-map = <
-				0x0 0x0 0x0 0x1 &UIC3 0xc 0x4 /* swizzled int A */
-				0x0 0x0 0x0 0x2 &UIC3 0xd 0x4 /* swizzled int B */
-				0x0 0x0 0x0 0x3 &UIC3 0xe 0x4 /* swizzled int C */
-				0x0 0x0 0x0 0x4 &UIC3 0xf 0x4 /* swizzled int D */>;
-		};
+&PCIE0 {
+	status = "okay";
+};
 
-		MSI: ppc4xx-msi@C10000000 {
-			compatible = "amcc,ppc4xx-msi", "ppc4xx-msi";
-			reg = < 0xC 0x10000000 0x100
-				0xC 0x10000000 0x100>;
-			sdr-base = <0x36C>;
-			msi-data = <0x00004440>;
-			msi-mask = <0x0000ffe0>;
-			interrupts =<0 1 2 3 4 5 6 7>;
-			interrupt-parent = <&MSI>;
-			#interrupt-cells = <1>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			msi-available-ranges = <0x0 0x100>;
-			interrupt-map = <
-				0 &UIC3 0x18 1
-				1 &UIC3 0x19 1
-				2 &UIC3 0x1A 1
-				3 &UIC3 0x1B 1
-				4 &UIC3 0x1C 1
-				5 &UIC3 0x1D 1
-				6 &UIC3 0x1E 1
-				7 &UIC3 0x1F 1
-			>;
-		};
-	};
+&MSI {
+	status = "okay";
 };
-- 
2.28.0

