Return-Path: <linuxppc-dev+bounces-4571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3449FFE3B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:32:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgH5Pm9z2ytQ;
	Fri,  3 Jan 2025 05:32:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842747;
	cv=none; b=Q6uQ4zV8oVsa7k9CsUoYzgIXm11CUA3sCwPaowE1EAbCTk8Y+9234LQ3xJ8lQB3fX67ro9zDbazsXcZJFIeZucV1EJcuBk4Ljt0+2uL1UcRuAMWxTtxTxkcDUt/KgTKXJEdUrjZPykMIc/5fRdz+LzxAITdulXWiE9j3OdoS4apz2d+5PhFRFEg3Sre8EDp9KSwR6W+WIjLdCqp9X7Vy4KMHY0MxxZvg5zDe7vRIHgErl0KXd6vI4HGiwicQBWqsPdu4hE+JwUrknmY8mRU4WQ9txXz8aitEKfkjXVcD2hTjk/61QSBhS536zOvLlST/lZW+YA6EzVtbRFhozXxSgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842747; c=relaxed/relaxed;
	bh=jYlxsEtcaZpI2dUPUzCFkShkPSt5wPL9xP7MUcvnXI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfgnWd1NjCvNKGyvO3Np2TvMHZFQyHi80bcNkfoUbhaCxb4XNQAj6E8258Z6e/S4BD3KyP6m07gkqyXtTZjufwYghPDj5pyPVdyZ58nk9Jlb5mfOTXw1LWqmMmkwSyt53kFMmX7WOcmxdIsTPx4L2ID8T6q9Vj5d7rjDg82UoCC2p4broeYvPOp2QNvXlLHDcF4chTWFmTAFnS2YoPCHYeKGfFdPCPE0YRzA6NEqRWR3ynWB45JkRX2mR+TuxSJmPMPH+JRrsZFIDyed0HNigCE0S3g0L+/qynRNnQeXbVkf0H1HBfl5F6wxOFTUj1QgPVxQz3sy+vmTmg2Lhn9jTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k/geD2vc; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k/geD2vc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgF0nvnz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14F96A413EC;
	Thu,  2 Jan 2025 18:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4771C4CED6;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842741;
	bh=Xs4v5kLUj1KSNgPcP7PIf/NK10ub7qfWEP+nDuyiw5g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k/geD2vc6GAq5Azh6acwcGHvnwYocT3ihQFDmEc2ZiBDh/GUzsPwsErb4BWpPrTkq
	 qh2s4fcKXuHR8w4+DlVN4vGFfdOALiVdoicBa0jHp8uubDC8MrEtUlT3WqS//j9r4l
	 TUaFjhhJwYNWf4Yxwnn/MIZVJ3QN7evKqwsYJdc2reYsTN3ot1Y+o+KvmK+xkJXjux
	 31tkuQBwPgh4wN0DgRBnECR4vSua3NaZOSZ5aSqu7PMIerwv424IATH1KIGC9B6iYP
	 w371TzKCZzU92KBNRjSO2LQzvbYRiPzoQRrsp3ci2VMqh2evU+KboyOZ6Xrt3mxyma
	 p4DSyCdt/xHIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6ABAE77197;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:43 +0100
Subject: [PATCH 02/19] powerpc: dts: Extract mpc8315e.dtsi from
 mpc8315erdb.dts
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
Message-Id: <20250102-mpc83xx-v1-2-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=20835;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=qUjMMM6o2tcSsY8F4sdgspvgYdGx1PCnjRbfNBI8fWA=;
 b=+uDfnQblqnn3uCxWMtBw9ZBbN/B61OTH8ka2kNeFLicTC0OBjVLOPG8x5sb95PXySZVcjUkvJ
 8IA1axDz+Z0AWTCvjLFIzAyxrGCyTryGnNsA11vfqc820PFE7jbXALm
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

To make it easier to add other devices based on the MPC831{4,5}{,E}, put
the common parts into a dtsi file.

mpc8315erdb.dtb remains identical after this patch.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

Checkpatch (rightfully) complains about a lot of compatible strings that
were never documented in the bindings. Now sure what to do about them.
---
 arch/powerpc/boot/dts/mpc8315e.dtsi   | 356 ++++++++++++++++++++++++++++++++++
 arch/powerpc/boot/dts/mpc8315erdb.dts | 320 +-----------------------------
 2 files changed, 361 insertions(+), 315 deletions(-)

diff --git a/arch/powerpc/boot/dts/mpc8315e.dtsi b/arch/powerpc/boot/dts/mpc8315e.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..4830c8e5cd5c6858ea3a0c25e4a1f26fa87a7111
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc8315e.dtsi
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * MPC8315E family device tree. This file supports the following chips:
+ *
+ * MPC8314:  Without SATA controllers, without security engine
+ * MPC8314E: Without SATA controllers, with    security engine
+ * MPC8315:  With    SATA controllers, without security engine
+ * MPC8315E: With    SATA controllers, with    security engine
+ *
+ * Copyright 2007 Freescale Semiconductor Inc.
+ * Copyright 2024 J. Neuschäfer
+ */
+
+/dts-v1/;
+
+/ {
+	compatible = "fsl,mpc8315e";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases {
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		PowerPC,8315@0 {
+			device_type = "cpu";
+			reg = <0x0>;
+			d-cache-line-size = <32>;
+			i-cache-line-size = <32>;
+			d-cache-size = <16384>;
+			i-cache-size = <16384>;
+			timebase-frequency = <0>;	// from bootloader
+			bus-frequency = <0>;		// from bootloader
+			clock-frequency = <0>;		// from bootloader
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0 0>;
+	};
+
+	localbus@e0005000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		compatible = "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
+		reg = <0xe0005000 0x1000>;
+		interrupts = <77 0x8>;
+		interrupt-parent = <&ipic>;
+	};
+
+	immr@e0000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		device_type = "soc";
+		compatible = "fsl,mpc8315-immr", "simple-bus";
+		ranges = <0 0xe0000000 0x00100000>;
+		reg = <0xe0000000 0x00000200>;
+		bus-frequency = <0>;
+
+		wdt@200 {
+			device_type = "watchdog";
+			compatible = "mpc83xx_wdt";
+			reg = <0x200 0x100>;
+		};
+
+		i2c@3000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			cell-index = <0>;
+			compatible = "fsl-i2c";
+			reg = <0x3000 0x100>;
+			interrupts = <14 0x8>;
+			interrupt-parent = <&ipic>;
+			dfsrr;
+		};
+
+		spi@7000 {
+			cell-index = <0>;
+			compatible = "fsl,spi";
+			reg = <0x7000 0x1000>;
+			interrupts = <16 0x8>;
+			interrupt-parent = <&ipic>;
+			mode = "cpu";
+		};
+
+		dma@82a8 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "fsl,mpc8315-dma", "fsl,elo-dma";
+			reg = <0x82a8 4>;
+			ranges = <0 0x8100 0x1a8>;
+			interrupt-parent = <&ipic>;
+			interrupts = <71 8>;
+			cell-index = <0>;
+			dma-channel@0 {
+				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
+				reg = <0 0x80>;
+				cell-index = <0>;
+				interrupt-parent = <&ipic>;
+				interrupts = <71 8>;
+			};
+			dma-channel@80 {
+				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
+				reg = <0x80 0x80>;
+				cell-index = <1>;
+				interrupt-parent = <&ipic>;
+				interrupts = <71 8>;
+			};
+			dma-channel@100 {
+				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
+				reg = <0x100 0x80>;
+				cell-index = <2>;
+				interrupt-parent = <&ipic>;
+				interrupts = <71 8>;
+			};
+			dma-channel@180 {
+				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
+				reg = <0x180 0x28>;
+				cell-index = <3>;
+				interrupt-parent = <&ipic>;
+				interrupts = <71 8>;
+			};
+		};
+
+		usb@23000 {
+			compatible = "fsl-usb2-dr";
+			reg = <0x23000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&ipic>;
+			interrupts = <38 0x8>;
+			phy_type = "utmi";
+		};
+
+		enet0: ethernet@24000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			cell-index = <0>;
+			device_type = "network";
+			model = "eTSEC";
+			compatible = "gianfar";
+			reg = <0x24000 0x1000>;
+			ranges = <0x0 0x24000 0x1000>;
+			local-mac-address = [ 00 00 00 00 00 00 ];
+			interrupts = <32 0x8 33 0x8 34 0x8>;
+			interrupt-parent = <&ipic>;
+
+			mdio@520 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,gianfar-mdio";
+				reg = <0x520 0x20>;
+			};
+		};
+
+		enet1: ethernet@25000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			cell-index = <1>;
+			device_type = "network";
+			model = "eTSEC";
+			compatible = "gianfar";
+			reg = <0x25000 0x1000>;
+			ranges = <0x0 0x25000 0x1000>;
+			local-mac-address = [ 00 00 00 00 00 00 ];
+			interrupts = <35 0x8 36 0x8 37 0x8>;
+			interrupt-parent = <&ipic>;
+
+			mdio@520 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,gianfar-tbi";
+				reg = <0x520 0x20>;
+			};
+		};
+
+		serial0: serial@4500 {
+			cell-index = <0>;
+			device_type = "serial";
+			compatible = "fsl,ns16550", "ns16550";
+			reg = <0x4500 0x100>;
+			clock-frequency = <133333333>;
+			interrupts = <9 0x8>;
+			interrupt-parent = <&ipic>;
+		};
+
+		serial1: serial@4600 {
+			cell-index = <1>;
+			device_type = "serial";
+			compatible = "fsl,ns16550", "ns16550";
+			reg = <0x4600 0x100>;
+			clock-frequency = <133333333>;
+			interrupts = <10 0x8>;
+			interrupt-parent = <&ipic>;
+		};
+
+		crypto@30000 {
+			compatible = "fsl,sec3.3", "fsl,sec3.1", "fsl,sec3.0",
+				     "fsl,sec2.4", "fsl,sec2.2", "fsl,sec2.1",
+				     "fsl,sec2.0";
+			reg = <0x30000 0x10000>;
+			interrupts = <11 0x8>;
+			interrupt-parent = <&ipic>;
+			fsl,num-channels = <4>;
+			fsl,channel-fifo-len = <24>;
+			fsl,exec-units-mask = <0x97c>;
+			fsl,descriptor-types-mask = <0x3a30abf>;
+		};
+
+		sata@18000 {
+			compatible = "fsl,mpc8315-sata", "fsl,pq-sata";
+			reg = <0x18000 0x1000>;
+			cell-index = <1>;
+			interrupts = <44 0x8>;
+			interrupt-parent = <&ipic>;
+		};
+
+		sata@19000 {
+			compatible = "fsl,mpc8315-sata", "fsl,pq-sata";
+			reg = <0x19000 0x1000>;
+			cell-index = <2>;
+			interrupts = <45 0x8>;
+			interrupt-parent = <&ipic>;
+		};
+
+		gtm1: timer@500 {
+			compatible = "fsl,mpc8315-gtm", "fsl,gtm";
+			reg = <0x500 0x100>;
+			interrupts = <90 8 78 8 84 8 72 8>;
+			interrupt-parent = <&ipic>;
+			clock-frequency = <133333333>;
+		};
+
+		timer@600 {
+			compatible = "fsl,mpc8315-gtm", "fsl,gtm";
+			reg = <0x600 0x100>;
+			interrupts = <91 8 79 8 85 8 73 8>;
+			interrupt-parent = <&ipic>;
+			clock-frequency = <133333333>;
+		};
+
+		/* IPIC
+		 * interrupts cell = <intr #, sense>
+		 * sense values match linux IORESOURCE_IRQ_* defines:
+		 * sense == 8: Level, low assertion
+		 * sense == 2: Edge, high-to-low change
+		 */
+		ipic: interrupt-controller@700 {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			reg = <0x700 0x100>;
+			device_type = "ipic";
+		};
+
+		ipic-msi@7c0 {
+			compatible = "fsl,ipic-msi";
+			reg = <0x7c0 0x40>;
+			msi-available-ranges = <0 0x100>;
+			interrupts = <0x43 0x8
+				      0x4  0x8
+				      0x51 0x8
+				      0x52 0x8
+				      0x56 0x8
+				      0x57 0x8
+				      0x58 0x8
+				      0x59 0x8>;
+			interrupt-parent = < &ipic >;
+		};
+
+		pmc: power@b00 {
+			compatible = "fsl,mpc8315-pmc", "fsl,mpc8313-pmc",
+				     "fsl,mpc8349-pmc";
+			reg = <0xb00 0x100 0xa00 0x100>;
+			interrupts = <80 8>;
+			interrupt-parent = <&ipic>;
+			fsl,mpc8313-wakeup-timer = <&gtm1>;
+		};
+	};
+
+	pci0: pci@e0008500 {
+		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map = <
+				/* IDSEL 0x0E -mini PCI */
+				 0x7000 0x0 0x0 0x1 &ipic 18 0x8
+				 0x7000 0x0 0x0 0x2 &ipic 18 0x8
+				 0x7000 0x0 0x0 0x3 &ipic 18 0x8
+				 0x7000 0x0 0x0 0x4 &ipic 18 0x8
+
+				/* IDSEL 0x0F -mini PCI */
+				 0x7800 0x0 0x0 0x1 &ipic 17 0x8
+				 0x7800 0x0 0x0 0x2 &ipic 17 0x8
+				 0x7800 0x0 0x0 0x3 &ipic 17 0x8
+				 0x7800 0x0 0x0 0x4 &ipic 17 0x8
+
+				/* IDSEL 0x10 - PCI slot */
+				 0x8000 0x0 0x0 0x1 &ipic 48 0x8
+				 0x8000 0x0 0x0 0x2 &ipic 17 0x8
+				 0x8000 0x0 0x0 0x3 &ipic 48 0x8
+				 0x8000 0x0 0x0 0x4 &ipic 17 0x8>;
+		interrupt-parent = <&ipic>;
+		interrupts = <66 0x8>;
+		bus-range = <0x0 0x0>;
+		ranges = <0x02000000 0 0x90000000 0x90000000 0 0x10000000
+			  0x42000000 0 0x80000000 0x80000000 0 0x10000000
+			  0x01000000 0 0x00000000 0xe0300000 0 0x00100000>;
+		clock-frequency = <66666666>;
+		#interrupt-cells = <1>;
+		#size-cells = <2>;
+		#address-cells = <3>;
+		reg = <0xe0008500 0x100		/* internal registers */
+		       0xe0008300 0x8>;		/* config space access registers */
+		compatible = "fsl,mpc8349-pci";
+		device_type = "pci";
+	};
+
+	pci1: pcie@e0009000 {
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		device_type = "pci";
+		compatible = "fsl,mpc8315-pcie", "fsl,mpc8314-pcie";
+		reg = <0xe0009000 0x00001000>;
+		ranges = <0x02000000 0 0xa0000000 0xa0000000 0 0x10000000
+		          0x01000000 0 0x00000000 0xb1000000 0 0x00800000>;
+		bus-range = <0 255>;
+		interrupt-map-mask = <0xf800 0 0 7>;
+		interrupt-map = <0 0 0 1 &ipic 1 8
+				 0 0 0 2 &ipic 1 8
+				 0 0 0 3 &ipic 1 8
+				 0 0 0 4 &ipic 1 8>;
+		clock-frequency = <0>;
+	};
+
+	pci2: pcie@e000a000 {
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		device_type = "pci";
+		compatible = "fsl,mpc8315-pcie", "fsl,mpc8314-pcie";
+		reg = <0xe000a000 0x00001000>;
+		ranges = <0x02000000 0 0xc0000000 0xc0000000 0 0x10000000
+			  0x01000000 0 0x00000000 0xd1000000 0 0x00800000>;
+		bus-range = <0 255>;
+		interrupt-map-mask = <0xf800 0 0 7>;
+		interrupt-map = <0 0 0 1 &ipic 2 8
+				 0 0 0 2 &ipic 2 8
+				 0 0 0 3 &ipic 2 8
+				 0 0 0 4 &ipic 2 8>;
+		clock-frequency = <0>;
+	};
+};
diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index e09b37d7489d01bfd16a26e9786868f630fa0262..b39903c8813d194c104d1e22c6167d8a9cea0076 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -5,12 +5,10 @@
  * Copyright 2007 Freescale Semiconductor Inc.
  */
 
-/dts-v1/;
+#include "mpc8315e.dtsi"
 
 / {
 	compatible = "fsl,mpc8315erdb";
-	#address-cells = <1>;
-	#size-cells = <1>;
 
 	aliases {
 		ethernet0 = &enet0;
@@ -22,36 +20,11 @@ aliases {
 		pci2 = &pci2;
 	};
 
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		PowerPC,8315@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;
-			i-cache-line-size = <32>;
-			d-cache-size = <16384>;
-			i-cache-size = <16384>;
-			timebase-frequency = <0>;	// from bootloader
-			bus-frequency = <0>;		// from bootloader
-			clock-frequency = <0>;		// from bootloader
-		};
-	};
-
 	memory {
-		device_type = "memory";
 		reg = <0x00000000 0x08000000>;	// 128MB at 0
 	};
 
 	localbus@e0005000 {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		compatible = "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
-		reg = <0xe0005000 0x1000>;
-		interrupts = <77 0x8>;
-		interrupt-parent = <&ipic>;
-
 		// CS0 and CS1 are swapped when
 		// booting from nand, but the
 		// addresses are the same.
@@ -91,29 +64,7 @@ fs@400000 {
 	};
 
 	immr@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		compatible = "fsl,mpc8315-immr", "simple-bus";
-		ranges = <0 0xe0000000 0x00100000>;
-		reg = <0xe0000000 0x00000200>;
-		bus-frequency = <0>;
-
-		wdt@200 {
-			device_type = "watchdog";
-			compatible = "mpc83xx_wdt";
-			reg = <0x200 0x100>;
-		};
-
 		i2c@3000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			cell-index = <0>;
-			compatible = "fsl-i2c";
-			reg = <0x3000 0x100>;
-			interrupts = <14 0x8>;
-			interrupt-parent = <&ipic>;
-			dfsrr;
 			rtc@68 {
 				compatible = "dallas,ds1339";
 				reg = <0x68>;
@@ -128,86 +79,12 @@ mcu_pio: mcu@a {
 			};
 		};
 
-		spi@7000 {
-			cell-index = <0>;
-			compatible = "fsl,spi";
-			reg = <0x7000 0x1000>;
-			interrupts = <16 0x8>;
-			interrupt-parent = <&ipic>;
-			mode = "cpu";
-		};
-
-		dma@82a8 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8315-dma", "fsl,elo-dma";
-			reg = <0x82a8 4>;
-			ranges = <0 0x8100 0x1a8>;
-			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
-				reg = <0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x180 0x28>;
-				cell-index = <3>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-		};
-
-		usb@23000 {
-			compatible = "fsl-usb2-dr";
-			reg = <0x23000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			interrupt-parent = <&ipic>;
-			interrupts = <38 0x8>;
-			phy_type = "utmi";
-		};
-
-		enet0: ethernet@24000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <0>;
-			device_type = "network";
-			model = "eTSEC";
-			compatible = "gianfar";
-			reg = <0x24000 0x1000>;
-			ranges = <0x0 0x24000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <32 0x8 33 0x8 34 0x8>;
-			interrupt-parent = <&ipic>;
+		ethernet@24000 {
 			tbi-handle = <&tbi0>;
 			phy-handle = < &phy0 >;
 			fsl,magic-packet;
 
 			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-mdio";
-				reg = <0x520 0x20>;
-
 				phy0: ethernet-phy@0 {
 					interrupt-parent = <&ipic>;
 					interrupts = <20 0x8>;
@@ -227,192 +104,21 @@ tbi0: tbi-phy@11 {
 			};
 		};
 
-		enet1: ethernet@25000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <1>;
-			device_type = "network";
-			model = "eTSEC";
-			compatible = "gianfar";
-			reg = <0x25000 0x1000>;
-			ranges = <0x0 0x25000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <35 0x8 36 0x8 37 0x8>;
-			interrupt-parent = <&ipic>;
+		ethernet@25000 {
 			tbi-handle = <&tbi1>;
 			phy-handle = < &phy1 >;
 			fsl,magic-packet;
 
 			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-tbi";
-				reg = <0x520 0x20>;
-
 				tbi1: tbi-phy@11 {
 					reg = <0x11>;
 					device_type = "tbi-phy";
 				};
 			};
 		};
-
-		serial0: serial@4500 {
-			cell-index = <0>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4500 0x100>;
-			clock-frequency = <133333333>;
-			interrupts = <9 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		serial1: serial@4600 {
-			cell-index = <1>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4600 0x100>;
-			clock-frequency = <133333333>;
-			interrupts = <10 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		crypto@30000 {
-			compatible = "fsl,sec3.3", "fsl,sec3.1", "fsl,sec3.0",
-				     "fsl,sec2.4", "fsl,sec2.2", "fsl,sec2.1",
-				     "fsl,sec2.0";
-			reg = <0x30000 0x10000>;
-			interrupts = <11 0x8>;
-			interrupt-parent = <&ipic>;
-			fsl,num-channels = <4>;
-			fsl,channel-fifo-len = <24>;
-			fsl,exec-units-mask = <0x97c>;
-			fsl,descriptor-types-mask = <0x3a30abf>;
-		};
-
-		sata@18000 {
-			compatible = "fsl,mpc8315-sata", "fsl,pq-sata";
-			reg = <0x18000 0x1000>;
-			cell-index = <1>;
-			interrupts = <44 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		sata@19000 {
-			compatible = "fsl,mpc8315-sata", "fsl,pq-sata";
-			reg = <0x19000 0x1000>;
-			cell-index = <2>;
-			interrupts = <45 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		gtm1: timer@500 {
-			compatible = "fsl,mpc8315-gtm", "fsl,gtm";
-			reg = <0x500 0x100>;
-			interrupts = <90 8 78 8 84 8 72 8>;
-			interrupt-parent = <&ipic>;
-			clock-frequency = <133333333>;
-		};
-
-		timer@600 {
-			compatible = "fsl,mpc8315-gtm", "fsl,gtm";
-			reg = <0x600 0x100>;
-			interrupts = <91 8 79 8 85 8 73 8>;
-			interrupt-parent = <&ipic>;
-			clock-frequency = <133333333>;
-		};
-
-		/* IPIC
-		 * interrupts cell = <intr #, sense>
-		 * sense values match linux IORESOURCE_IRQ_* defines:
-		 * sense == 8: Level, low assertion
-		 * sense == 2: Edge, high-to-low change
-		 */
-		ipic: interrupt-controller@700 {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x700 0x100>;
-			device_type = "ipic";
-		};
-
-		ipic-msi@7c0 {
-			compatible = "fsl,ipic-msi";
-			reg = <0x7c0 0x40>;
-			msi-available-ranges = <0 0x100>;
-			interrupts = <0x43 0x8
-				      0x4  0x8
-				      0x51 0x8
-				      0x52 0x8
-				      0x56 0x8
-				      0x57 0x8
-				      0x58 0x8
-				      0x59 0x8>;
-			interrupt-parent = < &ipic >;
-		};
-
-		pmc: power@b00 {
-			compatible = "fsl,mpc8315-pmc", "fsl,mpc8313-pmc",
-				     "fsl,mpc8349-pmc";
-			reg = <0xb00 0x100 0xa00 0x100>;
-			interrupts = <80 8>;
-			interrupt-parent = <&ipic>;
-			fsl,mpc8313-wakeup-timer = <&gtm1>;
-		};
 	};
 
-	pci0: pci@e0008500 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-				/* IDSEL 0x0E -mini PCI */
-				 0x7000 0x0 0x0 0x1 &ipic 18 0x8
-				 0x7000 0x0 0x0 0x2 &ipic 18 0x8
-				 0x7000 0x0 0x0 0x3 &ipic 18 0x8
-				 0x7000 0x0 0x0 0x4 &ipic 18 0x8
-
-				/* IDSEL 0x0F -mini PCI */
-				 0x7800 0x0 0x0 0x1 &ipic 17 0x8
-				 0x7800 0x0 0x0 0x2 &ipic 17 0x8
-				 0x7800 0x0 0x0 0x3 &ipic 17 0x8
-				 0x7800 0x0 0x0 0x4 &ipic 17 0x8
-
-				/* IDSEL 0x10 - PCI slot */
-				 0x8000 0x0 0x0 0x1 &ipic 48 0x8
-				 0x8000 0x0 0x0 0x2 &ipic 17 0x8
-				 0x8000 0x0 0x0 0x3 &ipic 48 0x8
-				 0x8000 0x0 0x0 0x4 &ipic 17 0x8>;
-		interrupt-parent = <&ipic>;
-		interrupts = <66 0x8>;
-		bus-range = <0x0 0x0>;
-		ranges = <0x02000000 0 0x90000000 0x90000000 0 0x10000000
-			  0x42000000 0 0x80000000 0x80000000 0 0x10000000
-			  0x01000000 0 0x00000000 0xe0300000 0 0x00100000>;
-		clock-frequency = <66666666>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0008500 0x100		/* internal registers */
-		       0xe0008300 0x8>;		/* config space access registers */
-		compatible = "fsl,mpc8349-pci";
-		device_type = "pci";
-	};
-
-	pci1: pcie@e0009000 {
-		#address-cells = <3>;
-		#size-cells = <2>;
-		#interrupt-cells = <1>;
-		device_type = "pci";
-		compatible = "fsl,mpc8315-pcie", "fsl,mpc8314-pcie";
-		reg = <0xe0009000 0x00001000>;
-		ranges = <0x02000000 0 0xa0000000 0xa0000000 0 0x10000000
-		          0x01000000 0 0x00000000 0xb1000000 0 0x00800000>;
-		bus-range = <0 255>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0 0 0 1 &ipic 1 8
-				 0 0 0 2 &ipic 1 8
-				 0 0 0 3 &ipic 1 8
-				 0 0 0 4 &ipic 1 8>;
-		clock-frequency = <0>;
-
+	pcie@e0009000 {
 		pcie@0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -427,23 +133,7 @@ pcie@0 {
 		};
 	};
 
-	pci2: pcie@e000a000 {
-		#address-cells = <3>;
-		#size-cells = <2>;
-		#interrupt-cells = <1>;
-		device_type = "pci";
-		compatible = "fsl,mpc8315-pcie", "fsl,mpc8314-pcie";
-		reg = <0xe000a000 0x00001000>;
-		ranges = <0x02000000 0 0xc0000000 0xc0000000 0 0x10000000
-			  0x01000000 0 0x00000000 0xd1000000 0 0x00800000>;
-		bus-range = <0 255>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0 0 0 1 &ipic 2 8
-				 0 0 0 2 &ipic 2 8
-				 0 0 0 3 &ipic 2 8
-				 0 0 0 4 &ipic 2 8>;
-		clock-frequency = <0>;
-
+	pcie@e000a000 {
 		pcie@0 {
 			#address-cells = <3>;
 			#size-cells = <2>;

-- 
2.45.2



