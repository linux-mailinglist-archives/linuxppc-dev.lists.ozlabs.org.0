Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 782CC511302
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 09:55:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kp9zB2jxZz3bbS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 17:55:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=B1q+Beee;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=B1q+Beee; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp9xD3LZKz2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 17:53:52 +1000 (AEST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7468922249;
 Wed, 27 Apr 2022 09:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1651046025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gcuTyEAl8fBHDAyAKfO+ZMUc6CSNaKRTQvrLjq6mLNE=;
 b=B1q+Beee7HfLZkfm6FkYoks+RrPjBNjysiTOwYe6lQdWX3aoG/8Jw4NZjrNbBHHSgEAAHm
 3o0ChWtJiZeuSYBgvgcfSjRPcjs2wXQgZ8Ky1BRGMBRcQCYSXTgO6UAEFs0o/ZwNbNT9y2
 PnNBTGv0efFpFqMcrEQNgob1T1PDimo=
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 2/4] arm64: dts: freescale: reduce the interrup-map-mask
Date: Wed, 27 Apr 2022 09:53:36 +0200
Message-Id: <20220427075338.1156449-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427075338.1156449-1-michael@walle.cc>
References: <20220427075338.1156449-1-michael@walle.cc>
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
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Michael Walle <michael@walle.cc>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reduce the interrupt-map-mask of the external interrupt controller to
0xf to align with the devicetree schema.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 35d1939e690b..46cc8d45ca65 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -335,7 +335,7 @@ extirq: interrupt-controller@1ac {
 					<9 0 &gic GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 					<10 0 &gic GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
 					<11 0 &gic GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-map-mask = <0xffffffff 0x0>;
+				interrupt-map-mask = <0xf 0x0>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 4e7bd04d9798..3e8def8fe1b4 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -341,7 +341,7 @@ extirq: interrupt-controller@1ac {
 					<9 0 &gic GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 					<10 0 &gic GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
 					<11 0 &gic GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-map-mask = <0xffffffff 0x0>;
+				interrupt-map-mask = <0xf 0x0>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 18e529118476..33c5ad1b9b96 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -265,7 +265,7 @@ extirq: interrupt-controller@14 {
 					<9 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
 					<10 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
 					<11 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-map-mask = <0xffffffff 0x0>;
+				interrupt-map-mask = <0xf 0x0>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 1282b61da8a5..3f767994b02d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -305,7 +305,7 @@ extirq: interrupt-controller@14 {
 					<9 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
 					<10 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
 					<11 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-map-mask = <0xffffffff 0x0>;
+				interrupt-map-mask = <0xf 0x0>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 82bd8c0f318b..47ea854720ce 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -698,7 +698,7 @@ extirq: interrupt-controller@14 {
 					<9 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
 					<10 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
 					<11 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-map-mask = <0xffffffff 0x0>;
+				interrupt-map-mask = <0xf 0x0>;
 			};
 		};
 
-- 
2.30.2

