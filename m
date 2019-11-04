Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8242AEE503
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 17:46:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Jb63jZXzF45y
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 03:46:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 476JR86S5mzF3yt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 03:39:16 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71D7F328;
 Mon,  4 Nov 2019 08:39:14 -0800 (PST)
Received: from e119886-lin.cambridge.arm.com (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49E7E3F71A;
 Mon,  4 Nov 2019 08:39:12 -0800 (PST)
From: Andrew Murray <andrew.murray@arm.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 6/7] powerpc: dts: Use IRQ flags for legacy PCI IRQ
 interrupts
Date: Mon,  4 Nov 2019 16:38:20 +0000
Message-Id: <20191104163834.8932-7-andrew.murray@arm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191104163834.8932-1-andrew.murray@arm.com>
References: <20191104163834.8932-1-andrew.murray@arm.com>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace magic numbers used to describe legacy PCI IRQ interrupts
with #define.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 arch/powerpc/boot/dts/bluestone.dts       | 12 +++--
 arch/powerpc/boot/dts/charon.dts          | 12 +++--
 arch/powerpc/boot/dts/digsy_mtc.dts       | 12 +++--
 arch/powerpc/boot/dts/haleakala.dts       | 12 +++--
 arch/powerpc/boot/dts/holly.dts           | 42 ++++++++--------
 arch/powerpc/boot/dts/hotfoot.dts         | 12 +++--
 arch/powerpc/boot/dts/kuroboxHD.dts       | 28 ++++++-----
 arch/powerpc/boot/dts/kuroboxHG.dts       | 28 ++++++-----
 arch/powerpc/boot/dts/lite5200.dts        | 12 +++--
 arch/powerpc/boot/dts/lite5200b.dts       | 22 +++++----
 arch/powerpc/boot/dts/media5200.dts       | 26 +++++-----
 arch/powerpc/boot/dts/mpc5121ads.dts      | 20 ++++----
 arch/powerpc/boot/dts/mpc8308rdb.dts      | 12 +++--
 arch/powerpc/boot/dts/mpc8313erdb.dts     | 20 ++++----
 arch/powerpc/boot/dts/mpc832x_mds.dts     | 60 ++++++++++++-----------
 arch/powerpc/boot/dts/mpc832x_rdb.dts     | 22 +++++----
 arch/powerpc/boot/dts/mpc8349emitxgp.dts  |  8 +--
 arch/powerpc/boot/dts/mpc836x_mds.dts     | 60 ++++++++++++-----------
 arch/powerpc/boot/dts/mpc836x_rdk.dts     | 16 +++---
 arch/powerpc/boot/dts/mucmc52.dts         | 12 +++--
 arch/powerpc/boot/dts/mvme5100.dts        | 48 +++++++++---------
 arch/powerpc/boot/dts/pcm030.dts          | 22 +++++----
 arch/powerpc/boot/dts/pcm032.dts          | 22 +++++----
 arch/powerpc/boot/dts/pq2fads.dts         | 28 ++++++-----
 arch/powerpc/boot/dts/socrates.dts        |  8 +--
 arch/powerpc/boot/dts/storcenter.dts      | 28 ++++++-----
 arch/powerpc/boot/dts/stx_gp3_8560.dts    | 36 +++++++-------
 arch/powerpc/boot/dts/taishan.dts         | 20 ++++----
 arch/powerpc/boot/dts/tqm5200.dts         | 12 +++--
 arch/powerpc/boot/dts/tqm8540.dts         | 16 +++---
 arch/powerpc/boot/dts/tqm8541.dts         | 16 +++---
 arch/powerpc/boot/dts/tqm8555.dts         | 16 +++---
 arch/powerpc/boot/dts/tqm8560.dts         | 16 +++---
 arch/powerpc/boot/dts/virtex440-ml510.dts | 43 ++++++++--------
 arch/powerpc/boot/dts/xcalibur1501.dts    | 13 +++--
 arch/powerpc/boot/dts/xpedite5200.dts     |  8 +--
 36 files changed, 437 insertions(+), 363 deletions(-)

diff --git a/arch/powerpc/boot/dts/bluestone.dts b/arch/powerpc/boot/dts/bluestone.dts
index cc965a1816b6..851b6f764ec3 100644
--- a/arch/powerpc/boot/dts/bluestone.dts
+++ b/arch/powerpc/boot/dts/bluestone.dts
@@ -8,6 +8,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	#address-cells = <2>;
 	#size-cells = <1>;
@@ -359,12 +361,12 @@
 			 * below are basically de-swizzled numbers.
 			 * The real slot is on idsel 0, so the swizzling is 1:1
 			 */
-			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map-mask = <0x0 0x0 0x0 IRQ_INT_ALL>;
 			interrupt-map = <
-				0x0 0x0 0x0 0x1 &UIC3 0xc 0x4 /* swizzled int A */
-				0x0 0x0 0x0 0x2 &UIC3 0xd 0x4 /* swizzled int B */
-				0x0 0x0 0x0 0x3 &UIC3 0xe 0x4 /* swizzled int C */
-				0x0 0x0 0x0 0x4 &UIC3 0xf 0x4 /* swizzled int D */>;
+				0x0 0x0 0x0 IRQ_INTA &UIC3 0xc 0x4 /* swizzled int A */
+				0x0 0x0 0x0 IRQ_INTB &UIC3 0xd 0x4 /* swizzled int B */
+				0x0 0x0 0x0 IRQ_INTC &UIC3 0xe 0x4 /* swizzled int C */
+				0x0 0x0 0x0 IRQ_INTD &UIC3 0xf 0x4 /* swizzled int D */>;
 		};
 
 		MSI: ppc4xx-msi@C10000000 {
diff --git a/arch/powerpc/boot/dts/charon.dts b/arch/powerpc/boot/dts/charon.dts
index 408b486b13df..0e2fe2511c46 100644
--- a/arch/powerpc/boot/dts/charon.dts
+++ b/arch/powerpc/boot/dts/charon.dts
@@ -11,6 +11,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "anon,charon";
 	compatible = "anon,charon";
@@ -217,11 +219,11 @@
 		device_type = "pci";
 		compatible = "fsl,mpc5200-pci";
 		reg = <0xf0000d00 0x100>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0xc000 0 0 1 &mpc5200_pic 0 0 3
-				 0xc000 0 0 2 &mpc5200_pic 0 0 3
-				 0xc000 0 0 3 &mpc5200_pic 0 0 3
-				 0xc000 0 0 4 &mpc5200_pic 0 0 3>;
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
+		interrupt-map = <0xc000 0 0 IRQ_INTA &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTB &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTC &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTD &mpc5200_pic 0 0 3>;
 		clock-frequency = <0>; // From boot loader
 		interrupts = <2 8 0 2 9 0 2 10 0>;
 		bus-range = <0 0>;
diff --git a/arch/powerpc/boot/dts/digsy_mtc.dts b/arch/powerpc/boot/dts/digsy_mtc.dts
index 0e5e9d3acf79..292492af7b96 100644
--- a/arch/powerpc/boot/dts/digsy_mtc.dts
+++ b/arch/powerpc/boot/dts/digsy_mtc.dts
@@ -9,6 +9,8 @@
 
 /include/ "mpc5200b.dtsi"
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 &gpt0 { gpio-controller; fsl,has-wdt; };
 &gpt1 { gpio-controller; };
 
@@ -90,11 +92,11 @@
 	};
 
 	pci@f0000d00 {
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0xc000 0 0 1 &mpc5200_pic 0 0 3
-				 0xc000 0 0 2 &mpc5200_pic 0 0 3
-				 0xc000 0 0 3 &mpc5200_pic 0 0 3
-				 0xc000 0 0 4 &mpc5200_pic 0 0 3>;
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
+		interrupt-map = <0xc000 0 0 IRQ_INTA &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTB &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTC &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTD &mpc5200_pic 0 0 3>;
 		clock-frequency = <0>; // From boot loader
 		interrupts = <2 8 0 2 9 0 2 10 0>;
 		bus-range = <0 0>;
diff --git a/arch/powerpc/boot/dts/haleakala.dts b/arch/powerpc/boot/dts/haleakala.dts
index cb16dad43c92..c03bce619c32 100644
--- a/arch/powerpc/boot/dts/haleakala.dts
+++ b/arch/powerpc/boot/dts/haleakala.dts
@@ -10,6 +10,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -270,12 +272,12 @@
 			 * below are basically de-swizzled numbers.
 			 * The real slot is on idsel 0, so the swizzling is 1:1
 			 */
-			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map-mask = <0x0 0x0 0x0 IRQ_INT_ALL>;
 			interrupt-map = <
-				0x0 0x0 0x0 0x1 &UIC2 0x0 0x4 /* swizzled int A */
-				0x0 0x0 0x0 0x2 &UIC2 0x1 0x4 /* swizzled int B */
-				0x0 0x0 0x0 0x3 &UIC2 0x2 0x4 /* swizzled int C */
-				0x0 0x0 0x0 0x4 &UIC2 0x3 0x4 /* swizzled int D */>;
+				0x0 0x0 0x0 IRQ_INTA &UIC2 0x0 0x4 /* swizzled int A */
+				0x0 0x0 0x0 IRQ_INTB &UIC2 0x1 0x4 /* swizzled int B */
+				0x0 0x0 0x0 IRQ_INTC &UIC2 0x2 0x4 /* swizzled int C */
+				0x0 0x0 0x0 IRQ_INTD &UIC2 0x3 0x4 /* swizzled int D */>;
 		};
 	};
 };
diff --git a/arch/powerpc/boot/dts/holly.dts b/arch/powerpc/boot/dts/holly.dts
index 02bd304c7d38..984cf22c8ed9 100644
--- a/arch/powerpc/boot/dts/holly.dts
+++ b/arch/powerpc/boot/dts/holly.dts
@@ -12,6 +12,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "41K7339";
 	compatible = "ibm,holly";
@@ -152,30 +154,30 @@
 		clock-frequency = <133333332>;
 		interrupt-parent = <&MPIC>;
 		interrupts = <0x17 0x2>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		/*----------------------------------------------------+
 		| The INTA, INTB, INTC, INTD are shared.
 		+----------------------------------------------------*/
 		interrupt-map = <
-			0x800 0x0 0x0 0x1 &RT0 0x24 0x0
-			0x800 0x0 0x0 0x2 &RT0 0x25 0x0
-			0x800 0x0 0x0 0x3 &RT0 0x26 0x0
-			0x800 0x0 0x0 0x4 &RT0 0x27 0x0
-
-			0x1000 0x0 0x0 0x1 &RT0 0x25 0x0
-			0x1000 0x0 0x0 0x2 &RT0 0x26 0x0
-			0x1000 0x0 0x0 0x3 &RT0 0x27 0x0
-			0x1000 0x0 0x0 0x4 &RT0 0x24 0x0
-
-			0x1800 0x0 0x0 0x1 &RT0 0x26 0x0
-			0x1800 0x0 0x0 0x2 &RT0 0x27 0x0
-			0x1800 0x0 0x0 0x3 &RT0 0x24 0x0
-			0x1800 0x0 0x0 0x4 &RT0 0x25 0x0
-
-			0x2000 0x0 0x0 0x1 &RT0 0x27 0x0
-			0x2000 0x0 0x0 0x2 &RT0 0x24 0x0
-			0x2000 0x0 0x0 0x3 &RT0 0x25 0x0
-			0x2000 0x0 0x0 0x4 &RT0 0x26 0x0
+			0x800 0x0 0x0 IRQ_INTA &RT0 0x24 0x0
+			0x800 0x0 0x0 IRQ_INTB &RT0 0x25 0x0
+			0x800 0x0 0x0 IRQ_INTC &RT0 0x26 0x0
+			0x800 0x0 0x0 IRQ_INTD &RT0 0x27 0x0
+
+			0x1000 0x0 0x0 IRQ_INTA &RT0 0x25 0x0
+			0x1000 0x0 0x0 IRQ_INTB &RT0 0x26 0x0
+			0x1000 0x0 0x0 IRQ_INTC &RT0 0x27 0x0
+			0x1000 0x0 0x0 IRQ_INTD &RT0 0x24 0x0
+
+			0x1800 0x0 0x0 IRQ_INTA &RT0 0x26 0x0
+			0x1800 0x0 0x0 IRQ_INTB &RT0 0x27 0x0
+			0x1800 0x0 0x0 IRQ_INTC &RT0 0x24 0x0
+			0x1800 0x0 0x0 IRQ_INTD &RT0 0x25 0x0
+
+			0x2000 0x0 0x0 IRQ_INTA &RT0 0x27 0x0
+			0x2000 0x0 0x0 IRQ_INTB &RT0 0x24 0x0
+			0x2000 0x0 0x0 IRQ_INTC &RT0 0x25 0x0
+			0x2000 0x0 0x0 IRQ_INTD &RT0 0x26 0x0
 			>;
 
 		RT0: router@1180 {
diff --git a/arch/powerpc/boot/dts/hotfoot.dts b/arch/powerpc/boot/dts/hotfoot.dts
index b93bf2d9dd5b..d086b881197f 100644
--- a/arch/powerpc/boot/dts/hotfoot.dts
+++ b/arch/powerpc/boot/dts/hotfoot.dts
@@ -10,6 +10,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -277,15 +279,15 @@
 			dma-ranges = <0x42000000 0x0 0x0 0x0 0x0 0x80000000>;
 
 			interrupt-parent = <&UIC0>;
-			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+			interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 			interrupt-map = <
 				/* IDSEL 3 -- slot1 (optional) 27/29 A/B IRQ2/4 */
-				0x1800 0x0 0x0 0x1 &UIC0 0x1b 0x8
-				0x1800 0x0 0x0 0x2 &UIC0 0x1d 0x8
+				0x1800 0x0 0x0 IRQ_INTA &UIC0 0x1b 0x8
+				0x1800 0x0 0x0 IRQ_INTB &UIC0 0x1d 0x8
 
 				/* IDSEL 4 -- slot0, 26/28 A/B IRQ1/3 */
-				0x2000 0x0 0x0 0x1 &UIC0 0x1a 0x8
-				0x2000 0x0 0x0 0x2 &UIC0 0x1c 0x8
+				0x2000 0x0 0x0 IRQ_INTA &UIC0 0x1a 0x8
+				0x2000 0x0 0x0 IRQ_INTB &UIC0 0x1c 0x8
 				>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/kuroboxHD.dts b/arch/powerpc/boot/dts/kuroboxHD.dts
index 0a4545159e80..d709fe5efd49 100644
--- a/arch/powerpc/boot/dts/kuroboxHD.dts
+++ b/arch/powerpc/boot/dts/kuroboxHD.dts
@@ -20,6 +20,8 @@ XXXX add flash parts, rtc, ??
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "KuroboxHD";
 	compatible = "linkstation";
@@ -124,23 +126,23 @@ XXXX add flash parts, rtc, ??
 			bus-range = <0 255>;
 			clock-frequency = <133333333>;
 			interrupt-parent = <&mpic>;
-			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+			interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 			interrupt-map = <
 				/* IDSEL 11 - IRQ0 ETH */
-				0x5800 0x0 0x0 0x1 &mpic 0x0 0x1
-				0x5800 0x0 0x0 0x2 &mpic 0x1 0x1
-				0x5800 0x0 0x0 0x3 &mpic 0x2 0x1
-				0x5800 0x0 0x0 0x4 &mpic 0x3 0x1
+				0x5800 0x0 0x0 IRQ_INTA &mpic 0x0 0x1
+				0x5800 0x0 0x0 IRQ_INTB &mpic 0x1 0x1
+				0x5800 0x0 0x0 IRQ_INTC &mpic 0x2 0x1
+				0x5800 0x0 0x0 IRQ_INTD &mpic 0x3 0x1
 				/* IDSEL 12 - IRQ1 IDE0 */
-				0x6000 0x0 0x0 0x1 &mpic 0x1 0x1
-				0x6000 0x0 0x0 0x2 &mpic 0x2 0x1
-				0x6000 0x0 0x0 0x3 &mpic 0x3 0x1
-				0x6000 0x0 0x0 0x4 &mpic 0x0 0x1
+				0x6000 0x0 0x0 IRQ_INTA &mpic 0x1 0x1
+				0x6000 0x0 0x0 IRQ_INTB &mpic 0x2 0x1
+				0x6000 0x0 0x0 IRQ_INTC &mpic 0x3 0x1
+				0x6000 0x0 0x0 IRQ_INTD &mpic 0x0 0x1
 				/* IDSEL 14 - IRQ3 USB2.0 */
-				0x7000 0x0 0x0 0x1 &mpic 0x3 0x1
-				0x7000 0x0 0x0 0x2 &mpic 0x3 0x1
-				0x7000 0x0 0x0 0x3 &mpic 0x3 0x1
-				0x7000 0x0 0x0 0x4 &mpic 0x3 0x1
+				0x7000 0x0 0x0 IRQ_INTA &mpic 0x3 0x1
+				0x7000 0x0 0x0 IRQ_INTB &mpic 0x3 0x1
+				0x7000 0x0 0x0 IRQ_INTC &mpic 0x3 0x1
+				0x7000 0x0 0x0 IRQ_INTD &mpic 0x3 0x1
 			>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/kuroboxHG.dts b/arch/powerpc/boot/dts/kuroboxHG.dts
index 0e758b347cdb..5b392aca3a63 100644
--- a/arch/powerpc/boot/dts/kuroboxHG.dts
+++ b/arch/powerpc/boot/dts/kuroboxHG.dts
@@ -20,6 +20,8 @@ XXXX add flash parts, rtc, ??
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "KuroboxHG";
 	compatible = "linkstation";
@@ -124,23 +126,23 @@ XXXX add flash parts, rtc, ??
 			bus-range = <0 255>;
 			clock-frequency = <133333333>;
 			interrupt-parent = <&mpic>;
-			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+			interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 			interrupt-map = <
 				/* IDSEL 11 - IRQ0 ETH */
-				0x5800 0x0 0x0 0x1 &mpic 0x0 0x1
-				0x5800 0x0 0x0 0x2 &mpic 0x1 0x1
-				0x5800 0x0 0x0 0x3 &mpic 0x2 0x1
-				0x5800 0x0 0x0 0x4 &mpic 0x3 0x1
+				0x5800 0x0 0x0 IRQ_INTA &mpic 0x0 0x1
+				0x5800 0x0 0x0 IRQ_INTB &mpic 0x1 0x1
+				0x5800 0x0 0x0 IRQ_INTC &mpic 0x2 0x1
+				0x5800 0x0 0x0 IRQ_INTD &mpic 0x3 0x1
 				/* IDSEL 12 - IRQ1 IDE0 */
-				0x6000 0x0 0x0 0x1 &mpic 0x1 0x1
-				0x6000 0x0 0x0 0x2 &mpic 0x2 0x1
-				0x6000 0x0 0x0 0x3 &mpic 0x3 0x1
-				0x6000 0x0 0x0 0x4 &mpic 0x0 0x1
+				0x6000 0x0 0x0 IRQ_INTA &mpic 0x1 0x1
+				0x6000 0x0 0x0 IRQ_INTB &mpic 0x2 0x1
+				0x6000 0x0 0x0 IRQ_INTC &mpic 0x3 0x1
+				0x6000 0x0 0x0 IRQ_INTD &mpic 0x0 0x1
 				/* IDSEL 14 - IRQ3 USB2.0 */
-				0x7000 0x0 0x0 0x1 &mpic 0x3 0x1
-				0x7000 0x0 0x0 0x2 &mpic 0x3 0x1
-				0x7000 0x0 0x0 0x3 &mpic 0x3 0x1
-				0x7000 0x0 0x0 0x4 &mpic 0x3 0x1
+				0x7000 0x0 0x0 IRQ_INTA &mpic 0x3 0x1
+				0x7000 0x0 0x0 IRQ_INTB &mpic 0x3 0x1
+				0x7000 0x0 0x0 IRQ_INTC &mpic 0x3 0x1
+				0x7000 0x0 0x0 IRQ_INTD &mpic 0x3 0x1
 			>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/lite5200.dts b/arch/powerpc/boot/dts/lite5200.dts
index cb2782dd6132..8ab828853f4b 100644
--- a/arch/powerpc/boot/dts/lite5200.dts
+++ b/arch/powerpc/boot/dts/lite5200.dts
@@ -8,6 +8,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "fsl,lite5200";
 	compatible = "fsl,lite5200";
@@ -275,11 +277,11 @@
 		device_type = "pci";
 		compatible = "fsl,mpc5200-pci";
 		reg = <0xf0000d00 0x100>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0xc000 0 0 1 &mpc5200_pic 0 0 3
-				 0xc000 0 0 2 &mpc5200_pic 0 0 3
-				 0xc000 0 0 3 &mpc5200_pic 0 0 3
-				 0xc000 0 0 4 &mpc5200_pic 0 0 3>;
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
+		interrupt-map = <0xc000 0 0 IRQ_INTA &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTB &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTC &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTD &mpc5200_pic 0 0 3>;
 		clock-frequency = <0>; // From boot loader
 		interrupts = <2 8 0 2 9 0 2 10 0>;
 		bus-range = <0 0>;
diff --git a/arch/powerpc/boot/dts/lite5200b.dts b/arch/powerpc/boot/dts/lite5200b.dts
index 2b86c81f9048..4913accba301 100644
--- a/arch/powerpc/boot/dts/lite5200b.dts
+++ b/arch/powerpc/boot/dts/lite5200b.dts
@@ -8,6 +8,8 @@
 
 /include/ "mpc5200b.dtsi"
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 &gpt0 { fsl,has-wdt; };
 &gpt2 { gpio-controller; };
 &gpt3 { gpio-controller; };
@@ -103,16 +105,16 @@
 	};
 
 	pci@f0000d00 {
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0xc000 0 0 1 &mpc5200_pic 0 0 3 // 1st slot
-				 0xc000 0 0 2 &mpc5200_pic 1 1 3
-				 0xc000 0 0 3 &mpc5200_pic 1 2 3
-				 0xc000 0 0 4 &mpc5200_pic 1 3 3
-
-				 0xc800 0 0 1 &mpc5200_pic 1 1 3 // 2nd slot
-				 0xc800 0 0 2 &mpc5200_pic 1 2 3
-				 0xc800 0 0 3 &mpc5200_pic 1 3 3
-				 0xc800 0 0 4 &mpc5200_pic 0 0 3>;
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
+		interrupt-map = <0xc000 0 0 IRQ_INTA &mpc5200_pic 0 0 3 // 1st slot
+				 0xc000 0 0 IRQ_INTB &mpc5200_pic 1 1 3
+				 0xc000 0 0 IRQ_INTC &mpc5200_pic 1 2 3
+				 0xc000 0 0 IRQ_INTD &mpc5200_pic 1 3 3
+
+				 0xc800 0 0 IRQ_INTA &mpc5200_pic 1 1 3 // 2nd slot
+				 0xc800 0 0 IRQ_INTB &mpc5200_pic 1 2 3
+				 0xc800 0 0 IRQ_INTC &mpc5200_pic 1 3 3
+				 0xc800 0 0 IRQ_INTD &mpc5200_pic 0 0 3>;
 		clock-frequency = <0>; // From boot loader
 		interrupts = <2 8 0 2 9 0 2 10 0>;
 		bus-range = <0 0>;
diff --git a/arch/powerpc/boot/dts/media5200.dts b/arch/powerpc/boot/dts/media5200.dts
index 61cae9dcddef..a92e46f7e962 100644
--- a/arch/powerpc/boot/dts/media5200.dts
+++ b/arch/powerpc/boot/dts/media5200.dts
@@ -9,6 +9,8 @@
 
 /include/ "mpc5200b.dtsi"
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 &gpt0 { fsl,has-wdt; };
 
 / {
@@ -80,21 +82,21 @@
 	};
 
 	pci@f0000d00 {
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0xc000 0 0 1 &media5200_fpga 0 2 // 1st slot
-				 0xc000 0 0 2 &media5200_fpga 0 3
-				 0xc000 0 0 3 &media5200_fpga 0 4
-				 0xc000 0 0 4 &media5200_fpga 0 5
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
+		interrupt-map = <0xc000 0 0 IRQ_INTA &media5200_fpga 0 2 // 1st slot
+				 0xc000 0 0 IRQ_INTB &media5200_fpga 0 3
+				 0xc000 0 0 IRQ_INTC &media5200_fpga 0 4
+				 0xc000 0 0 IRQ_INTD &media5200_fpga 0 5
 
-				 0xc800 0 0 1 &media5200_fpga 0 3 // 2nd slot
-				 0xc800 0 0 2 &media5200_fpga 0 4
-				 0xc800 0 0 3 &media5200_fpga 0 5
-				 0xc800 0 0 4 &media5200_fpga 0 2
+				 0xc800 0 0 IRQ_INTA &media5200_fpga 0 3 // 2nd slot
+				 0xc800 0 0 IRQ_INTB &media5200_fpga 0 4
+				 0xc800 0 0 IRQ_INTC &media5200_fpga 0 5
+				 0xc800 0 0 IRQ_INTD &media5200_fpga 0 2
 
-				 0xd000 0 0 1 &media5200_fpga 0 4 // miniPCI
-				 0xd000 0 0 2 &media5200_fpga 0 5
+				 0xd000 0 0 IRQ_INTA &media5200_fpga 0 4 // miniPCI
+				 0xd000 0 0 IRQ_INTB &media5200_fpga 0 5
 
-				 0xe000 0 0 1 &media5200_fpga 0 5 // CoralIP
+				 0xe000 0 0 IRQ_INTA &media5200_fpga 0 5 // CoralIP
 				>;
 		ranges = <0x42000000 0 0x80000000 0x80000000 0 0x20000000
 			  0x02000000 0 0xa0000000 0xa0000000 0 0x10000000
diff --git a/arch/powerpc/boot/dts/mpc5121ads.dts b/arch/powerpc/boot/dts/mpc5121ads.dts
index b407a50ee622..9aeb924ab52f 100644
--- a/arch/powerpc/boot/dts/mpc5121ads.dts
+++ b/arch/powerpc/boot/dts/mpc5121ads.dts
@@ -7,6 +7,8 @@
 
 #include "mpc5121.dtsi"
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "mpc5121ads";
 	compatible = "fsl,mpc5121ads", "fsl,mpc5121";
@@ -154,21 +156,21 @@
 	};
 
 	pci: pci@80008500 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 				/* IDSEL 0x15 - Slot 1 PCI */
-				 0xa800 0x0 0x0 0x1 &cpld_pic 0x0 0x8
-				 0xa800 0x0 0x0 0x2 &cpld_pic 0x1 0x8
-				 0xa800 0x0 0x0 0x3 &cpld_pic 0x2 0x8
-				 0xa800 0x0 0x0 0x4 &cpld_pic 0x3 0x8
+				 0xa800 0x0 0x0 IRQ_INTA &cpld_pic 0x0 0x8
+				 0xa800 0x0 0x0 IRQ_INTB &cpld_pic 0x1 0x8
+				 0xa800 0x0 0x0 IRQ_INTC &cpld_pic 0x2 0x8
+				 0xa800 0x0 0x0 IRQ_INTD &cpld_pic 0x3 0x8
 
 				/* IDSEL 0x16 - Slot 2 MiniPCI */
-				 0xb000 0x0 0x0 0x1 &cpld_pic 0x4 0x8
-				 0xb000 0x0 0x0 0x2 &cpld_pic 0x5 0x8
+				 0xb000 0x0 0x0 IRQ_INTA &cpld_pic 0x4 0x8
+				 0xb000 0x0 0x0 IRQ_INTB &cpld_pic 0x5 0x8
 
 				/* IDSEL 0x17 - Slot 3 MiniPCI */
-				 0xb800 0x0 0x0 0x1 &cpld_pic 0x6 0x8
-				 0xb800 0x0 0x0 0x2 &cpld_pic 0x7 0x8
+				 0xb800 0x0 0x0 IRQ_INTA &cpld_pic 0x6 0x8
+				 0xb800 0x0 0x0 IRQ_INTB &cpld_pic 0x7 0x8
 				>;
 	};
 };
diff --git a/arch/powerpc/boot/dts/mpc8308rdb.dts b/arch/powerpc/boot/dts/mpc8308rdb.dts
index af2ed8380a86..0e9031b1a22b 100644
--- a/arch/powerpc/boot/dts/mpc8308rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8308rdb.dts
@@ -8,6 +8,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	compatible = "fsl,mpc8308rdb";
 	#address-cells = <1>;
@@ -281,11 +283,11 @@
 		ranges = <0x02000000 0 0xa0000000 0xa0000000 0 0x10000000
 		          0x01000000 0 0x00000000 0xb1000000 0 0x00800000>;
 		bus-range = <0 0>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0 0 0 1 &ipic 1 8
-				 0 0 0 2 &ipic 1 8
-				 0 0 0 3 &ipic 1 8
-				 0 0 0 4 &ipic 1 8>;
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
+		interrupt-map = <0 0 0 IRQ_INTA &ipic 1 8
+				 0 0 0 IRQ_INTB &ipic 1 8
+				 0 0 0 IRQ_INTC &ipic 1 8
+				 0 0 0 IRQ_INTD &ipic 1 8>;
 		interrupts = <0x1 0x8>;
 		interrupt-parent = <&ipic>;
 		clock-frequency = <0>;
diff --git a/arch/powerpc/boot/dts/mpc8313erdb.dts b/arch/powerpc/boot/dts/mpc8313erdb.dts
index a8315795b2c9..99513c9a76eb 100644
--- a/arch/powerpc/boot/dts/mpc8313erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8313erdb.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "MPC8313ERDB";
 	compatible = "MPC8313ERDB", "MPC831xRDB", "MPC83xxRDB";
@@ -327,19 +329,19 @@
 
 		pci0: pci@e0008500 {
 			cell-index = <1>;
-			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+			interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 			interrupt-map = <
 					/* IDSEL 0x0E -mini PCI */
-					 0x7000 0x0 0x0 0x1 &ipic 18 0x8
-					 0x7000 0x0 0x0 0x2 &ipic 18 0x8
-					 0x7000 0x0 0x0 0x3 &ipic 18 0x8
-					 0x7000 0x0 0x0 0x4 &ipic 18 0x8
+					 0x7000 0x0 0x0 IRQ_INTA &ipic 18 0x8
+					 0x7000 0x0 0x0 IRQ_INTB &ipic 18 0x8
+					 0x7000 0x0 0x0 IRQ_INTC &ipic 18 0x8
+					 0x7000 0x0 0x0 IRQ_INTD &ipic 18 0x8
 
 					/* IDSEL 0x0F - PCI slot */
-					 0x7800 0x0 0x0 0x1 &ipic 17 0x8
-					 0x7800 0x0 0x0 0x2 &ipic 18 0x8
-					 0x7800 0x0 0x0 0x3 &ipic 17 0x8
-					 0x7800 0x0 0x0 0x4 &ipic 18 0x8>;
+					 0x7800 0x0 0x0 IRQ_INTA &ipic 17 0x8
+					 0x7800 0x0 0x0 IRQ_INTB &ipic 18 0x8
+					 0x7800 0x0 0x0 IRQ_INTC &ipic 17 0x8
+					 0x7800 0x0 0x0 IRQ_INTD &ipic 18 0x8>;
 			interrupt-parent = <&ipic>;
 			interrupts = <66 0x8>;
 			bus-range = <0x0 0x0>;
diff --git a/arch/powerpc/boot/dts/mpc832x_mds.dts b/arch/powerpc/boot/dts/mpc832x_mds.dts
index 3af073f01e71..38a0772e9c66 100644
--- a/arch/powerpc/boot/dts/mpc832x_mds.dts
+++ b/arch/powerpc/boot/dts/mpc832x_mds.dts
@@ -20,6 +20,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "MPC8323EMDS";
 	compatible = "MPC8323EMDS", "MPC832xMDS", "MPC83xxMDS";
@@ -374,49 +376,49 @@
 	};
 
 	pci0: pci@e0008500 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 				/* IDSEL 0x11 AD17 */
-				 0x8800 0x0 0x0 0x1 &ipic 20 0x8
-				 0x8800 0x0 0x0 0x2 &ipic 21 0x8
-				 0x8800 0x0 0x0 0x3 &ipic 22 0x8
-				 0x8800 0x0 0x0 0x4 &ipic 23 0x8
+				 0x8800 0x0 0x0 IRQ_INTA &ipic 20 0x8
+				 0x8800 0x0 0x0 IRQ_INTB &ipic 21 0x8
+				 0x8800 0x0 0x0 IRQ_INTC &ipic 22 0x8
+				 0x8800 0x0 0x0 IRQ_INTD &ipic 23 0x8
 
 				/* IDSEL 0x12 AD18 */
-				 0x9000 0x0 0x0 0x1 &ipic 22 0x8
-				 0x9000 0x0 0x0 0x2 &ipic 23 0x8
-				 0x9000 0x0 0x0 0x3 &ipic 20 0x8
-				 0x9000 0x0 0x0 0x4 &ipic 21 0x8
+				 0x9000 0x0 0x0 IRQ_INTA &ipic 22 0x8
+				 0x9000 0x0 0x0 IRQ_INTB &ipic 23 0x8
+				 0x9000 0x0 0x0 IRQ_INTC &ipic 20 0x8
+				 0x9000 0x0 0x0 IRQ_INTD &ipic 21 0x8
 
 				/* IDSEL 0x13 AD19 */
-				 0x9800 0x0 0x0 0x1 &ipic 23 0x8
-				 0x9800 0x0 0x0 0x2 &ipic 20 0x8
-				 0x9800 0x0 0x0 0x3 &ipic 21 0x8
-				 0x9800 0x0 0x0 0x4 &ipic 22 0x8
+				 0x9800 0x0 0x0 IRQ_INTA &ipic 23 0x8
+				 0x9800 0x0 0x0 IRQ_INTB &ipic 20 0x8
+				 0x9800 0x0 0x0 IRQ_INTC &ipic 21 0x8
+				 0x9800 0x0 0x0 IRQ_INTD &ipic 22 0x8
 
 				/* IDSEL 0x15 AD21*/
-				 0xa800 0x0 0x0 0x1 &ipic 20 0x8
-				 0xa800 0x0 0x0 0x2 &ipic 21 0x8
-				 0xa800 0x0 0x0 0x3 &ipic 22 0x8
-				 0xa800 0x0 0x0 0x4 &ipic 23 0x8
+				 0xa800 0x0 0x0 IRQ_INTA &ipic 20 0x8
+				 0xa800 0x0 0x0 IRQ_INTB &ipic 21 0x8
+				 0xa800 0x0 0x0 IRQ_INTC &ipic 22 0x8
+				 0xa800 0x0 0x0 IRQ_INTD &ipic 23 0x8
 
 				/* IDSEL 0x16 AD22*/
-				 0xb000 0x0 0x0 0x1 &ipic 23 0x8
-				 0xb000 0x0 0x0 0x2 &ipic 20 0x8
-				 0xb000 0x0 0x0 0x3 &ipic 21 0x8
-				 0xb000 0x0 0x0 0x4 &ipic 22 0x8
+				 0xb000 0x0 0x0 IRQ_INTA &ipic 23 0x8
+				 0xb000 0x0 0x0 IRQ_INTB &ipic 20 0x8
+				 0xb000 0x0 0x0 IRQ_INTC &ipic 21 0x8
+				 0xb000 0x0 0x0 IRQ_INTD &ipic 22 0x8
 
 				/* IDSEL 0x17 AD23*/
-				 0xb800 0x0 0x0 0x1 &ipic 22 0x8
-				 0xb800 0x0 0x0 0x2 &ipic 23 0x8
-				 0xb800 0x0 0x0 0x3 &ipic 20 0x8
-				 0xb800 0x0 0x0 0x4 &ipic 21 0x8
+				 0xb800 0x0 0x0 IRQ_INTA &ipic 22 0x8
+				 0xb800 0x0 0x0 IRQ_INTB &ipic 23 0x8
+				 0xb800 0x0 0x0 IRQ_INTC &ipic 20 0x8
+				 0xb800 0x0 0x0 IRQ_INTD &ipic 21 0x8
 
 				/* IDSEL 0x18 AD24*/
-				 0xc000 0x0 0x0 0x1 &ipic 21 0x8
-				 0xc000 0x0 0x0 0x2 &ipic 22 0x8
-				 0xc000 0x0 0x0 0x3 &ipic 23 0x8
-				 0xc000 0x0 0x0 0x4 &ipic 20 0x8>;
+				 0xc000 0x0 0x0 IRQ_INTA &ipic 21 0x8
+				 0xc000 0x0 0x0 IRQ_INTB &ipic 22 0x8
+				 0xc000 0x0 0x0 IRQ_INTC &ipic 23 0x8
+				 0xc000 0x0 0x0 IRQ_INTD &ipic 20 0x8>;
 		interrupt-parent = <&ipic>;
 		interrupts = <66 0x8>;
 		bus-range = <0x0 0x0>;
diff --git a/arch/powerpc/boot/dts/mpc832x_rdb.dts b/arch/powerpc/boot/dts/mpc832x_rdb.dts
index b6257186528e..2e74f104ac93 100644
--- a/arch/powerpc/boot/dts/mpc832x_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc832x_rdb.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "MPC8323ERDB";
 	compatible = "MPC8323ERDB", "MPC832xRDB", "MPC83xxRDB";
@@ -327,22 +329,22 @@
 	};
 
 	pci0: pci@e0008500 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 				/* IDSEL 0x10 AD16 (USB) */
-				 0x8000 0x0 0x0 0x1 &ipic 17 0x8
+				 0x8000 0x0 0x0 IRQ_INTA &ipic 17 0x8
 
 				/* IDSEL 0x11 AD17 (Mini1)*/
-				 0x8800 0x0 0x0 0x1 &ipic 18 0x8
-				 0x8800 0x0 0x0 0x2 &ipic 19 0x8
-				 0x8800 0x0 0x0 0x3 &ipic 20 0x8
-				 0x8800 0x0 0x0 0x4 &ipic 48 0x8
+				 0x8800 0x0 0x0 IRQ_INTA &ipic 18 0x8
+				 0x8800 0x0 0x0 IRQ_INTB &ipic 19 0x8
+				 0x8800 0x0 0x0 IRQ_INTC &ipic 20 0x8
+				 0x8800 0x0 0x0 IRQ_INTD &ipic 48 0x8
 
 				/* IDSEL 0x12 AD18 (PCI/Mini2) */
-				 0x9000 0x0 0x0 0x1 &ipic 19 0x8
-				 0x9000 0x0 0x0 0x2 &ipic 20 0x8
-				 0x9000 0x0 0x0 0x3 &ipic 48 0x8
-				 0x9000 0x0 0x0 0x4 &ipic 17 0x8>;
+				 0x9000 0x0 0x0 IRQ_INTA &ipic 19 0x8
+				 0x9000 0x0 0x0 IRQ_INTB &ipic 20 0x8
+				 0x9000 0x0 0x0 IRQ_INTC &ipic 48 0x8
+				 0x9000 0x0 0x0 IRQ_INTD &ipic 17 0x8>;
 
 		interrupt-parent = <&ipic>;
 		interrupts = <66 0x8>;
diff --git a/arch/powerpc/boot/dts/mpc8349emitxgp.dts b/arch/powerpc/boot/dts/mpc8349emitxgp.dts
index bcf68a0a7b55..f218331e0c17 100644
--- a/arch/powerpc/boot/dts/mpc8349emitxgp.dts
+++ b/arch/powerpc/boot/dts/mpc8349emitxgp.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "MPC8349EMITXGP";
 	compatible = "MPC8349EMITXGP", "MPC834xMITX", "MPC83xxMITX";
@@ -222,11 +224,11 @@
 	};
 
 	pci0: pci@e0008600 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 				/* IDSEL 0x0F - PCI Slot */
-				0x7800 0x0 0x0 0x1 &ipic 20 0x8 /* PCI_INTA */
-				0x7800 0x0 0x0 0x2 &ipic 21 0x8 /* PCI_INTB */
+				0x7800 0x0 0x0 IRQ_INTA &ipic 20 0x8
+				0x7800 0x0 0x0 IRQ_INTB &ipic 21 0x8
 				 >;
 		interrupt-parent = <&ipic>;
 		interrupts = <67 0x8>;
diff --git a/arch/powerpc/boot/dts/mpc836x_mds.dts b/arch/powerpc/boot/dts/mpc836x_mds.dts
index f4ca12ec57f1..7c5fd0d87df9 100644
--- a/arch/powerpc/boot/dts/mpc836x_mds.dts
+++ b/arch/powerpc/boot/dts/mpc836x_mds.dts
@@ -12,6 +12,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "MPC8360MDS";
 	compatible = "MPC8360EMDS", "MPC836xMDS", "MPC83xxMDS";
@@ -418,50 +420,50 @@
 	};
 
 	pci0: pci@e0008500 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 
 				/* IDSEL 0x11 AD17 */
-				 0x8800 0x0 0x0 0x1 &ipic 20 0x8
-				 0x8800 0x0 0x0 0x2 &ipic 21 0x8
-				 0x8800 0x0 0x0 0x3 &ipic 22 0x8
-				 0x8800 0x0 0x0 0x4 &ipic 23 0x8
+				 0x8800 0x0 0x0 IRQ_INTA &ipic 20 0x8
+				 0x8800 0x0 0x0 IRQ_INTB &ipic 21 0x8
+				 0x8800 0x0 0x0 IRQ_INTC &ipic 22 0x8
+				 0x8800 0x0 0x0 IRQ_INTD &ipic 23 0x8
 
 				/* IDSEL 0x12 AD18 */
-				 0x9000 0x0 0x0 0x1 &ipic 22 0x8
-				 0x9000 0x0 0x0 0x2 &ipic 23 0x8
-				 0x9000 0x0 0x0 0x3 &ipic 20 0x8
-				 0x9000 0x0 0x0 0x4 &ipic 21 0x8
+				 0x9000 0x0 0x0 IRQ_INTA &ipic 22 0x8
+				 0x9000 0x0 0x0 IRQ_INTB &ipic 23 0x8
+				 0x9000 0x0 0x0 IRQ_INTC &ipic 20 0x8
+				 0x9000 0x0 0x0 IRQ_INTD &ipic 21 0x8
 
 				/* IDSEL 0x13 AD19 */
-				 0x9800 0x0 0x0 0x1 &ipic 23 0x8
-				 0x9800 0x0 0x0 0x2 &ipic 20 0x8
-				 0x9800 0x0 0x0 0x3 &ipic 21 0x8
-				 0x9800 0x0 0x0 0x4 &ipic 22 0x8
+				 0x9800 0x0 0x0 IRQ_INTA &ipic 23 0x8
+				 0x9800 0x0 0x0 IRQ_INTB &ipic 20 0x8
+				 0x9800 0x0 0x0 IRQ_INTC &ipic 21 0x8
+				 0x9800 0x0 0x0 IRQ_INTD &ipic 22 0x8
 
 				/* IDSEL 0x15 AD21*/
-				 0xa800 0x0 0x0 0x1 &ipic 20 0x8
-				 0xa800 0x0 0x0 0x2 &ipic 21 0x8
-				 0xa800 0x0 0x0 0x3 &ipic 22 0x8
-				 0xa800 0x0 0x0 0x4 &ipic 23 0x8
+				 0xa800 0x0 0x0 IRQ_INTA &ipic 20 0x8
+				 0xa800 0x0 0x0 IRQ_INTB &ipic 21 0x8
+				 0xa800 0x0 0x0 IRQ_INTC &ipic 22 0x8
+				 0xa800 0x0 0x0 IRQ_INTD &ipic 23 0x8
 
 				/* IDSEL 0x16 AD22*/
-				 0xb000 0x0 0x0 0x1 &ipic 23 0x8
-				 0xb000 0x0 0x0 0x2 &ipic 20 0x8
-				 0xb000 0x0 0x0 0x3 &ipic 21 0x8
-				 0xb000 0x0 0x0 0x4 &ipic 22 0x8
+				 0xb000 0x0 0x0 IRQ_INTA &ipic 23 0x8
+				 0xb000 0x0 0x0 IRQ_INTB &ipic 20 0x8
+				 0xb000 0x0 0x0 IRQ_INTC &ipic 21 0x8
+				 0xb000 0x0 0x0 IRQ_INTD &ipic 22 0x8
 
 				/* IDSEL 0x17 AD23*/
-				 0xb800 0x0 0x0 0x1 &ipic 22 0x8
-				 0xb800 0x0 0x0 0x2 &ipic 23 0x8
-				 0xb800 0x0 0x0 0x3 &ipic 20 0x8
-				 0xb800 0x0 0x0 0x4 &ipic 21 0x8
+				 0xb800 0x0 0x0 IRQ_INTA &ipic 22 0x8
+				 0xb800 0x0 0x0 IRQ_INTB &ipic 23 0x8
+				 0xb800 0x0 0x0 IRQ_INTC &ipic 20 0x8
+				 0xb800 0x0 0x0 IRQ_INTD &ipic 21 0x8
 
 				/* IDSEL 0x18 AD24*/
-				 0xc000 0x0 0x0 0x1 &ipic 21 0x8
-				 0xc000 0x0 0x0 0x2 &ipic 22 0x8
-				 0xc000 0x0 0x0 0x3 &ipic 23 0x8
-				 0xc000 0x0 0x0 0x4 &ipic 20 0x8>;
+				 0xc000 0x0 0x0 IRQ_INTA &ipic 21 0x8
+				 0xc000 0x0 0x0 IRQ_INTB &ipic 22 0x8
+				 0xc000 0x0 0x0 IRQ_INTC &ipic 23 0x8
+				 0xc000 0x0 0x0 IRQ_INTD &ipic 20 0x8>;
 		interrupt-parent = <&ipic>;
 		interrupts = <66 0x8>;
 		bus-range = <0 0>;
diff --git a/arch/powerpc/boot/dts/mpc836x_rdk.dts b/arch/powerpc/boot/dts/mpc836x_rdk.dts
index a0cc1953484d..e42529e48341 100644
--- a/arch/powerpc/boot/dts/mpc836x_rdk.dts
+++ b/arch/powerpc/boot/dts/mpc836x_rdk.dts
@@ -10,6 +10,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -445,16 +447,16 @@
 			  0x01000000 0 0xe0300000 0xe0300000 0 0x00100000>;
 		interrupts = <66 8>;
 		interrupt-parent = <&ipic>;
-		interrupt-map-mask = <0xf800 0 0 7>;
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
 		interrupt-map = </* miniPCI0 IDSEL 0x14 AD20 */
-				 0xa000 0 0 1 &ipic 18 8
-				 0xa000 0 0 2 &ipic 19 8
+				 0xa000 0 0 IRQ_INTA &ipic 18 8
+				 0xa000 0 0 IRQ_INTB &ipic 19 8
 
 				 /* PCI1 IDSEL 0x15 AD21 */
-				 0xa800 0 0 1 &ipic 19 8
-				 0xa800 0 0 2 &ipic 20 8
-				 0xa800 0 0 3 &ipic 21 8
-				 0xa800 0 0 4 &ipic 18 8>;
+				 0xa800 0 0 IRQ_INTA &ipic 19 8
+				 0xa800 0 0 IRQ_INTB &ipic 20 8
+				 0xa800 0 0 IRQ_INTC &ipic 21 8
+				 0xa800 0 0 IRQ_INTD &ipic 18 8>;
 		sleep = <&pmc 0x00010000>;
 		/* filled by u-boot */
 		bus-range = <0 0>;
diff --git a/arch/powerpc/boot/dts/mucmc52.dts b/arch/powerpc/boot/dts/mucmc52.dts
index c6c66306308d..f9e5520b11ab 100644
--- a/arch/powerpc/boot/dts/mucmc52.dts
+++ b/arch/powerpc/boot/dts/mucmc52.dts
@@ -9,6 +9,8 @@
 
 /include/ "mpc5200b.dtsi"
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 /* Timer pins that need to be in GPIO mode */
 &gpt0 { gpio-controller; };
 &gpt1 { gpio-controller; };
@@ -98,13 +100,13 @@
 	};
 
 	pci@f0000d00 {
-		interrupt-map-mask = <0xf800 0 0 7>;
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
 		interrupt-map = <
 				/* IDSEL 0x10 */
-				0x8000 0 0 1 &mpc5200_pic 0 3 3
-				0x8000 0 0 2 &mpc5200_pic 0 3 3
-				0x8000 0 0 3 &mpc5200_pic 0 2 3
-				0x8000 0 0 4 &mpc5200_pic 0 1 3
+				0x8000 0 0 IRQ_INTA &mpc5200_pic 0 3 3
+				0x8000 0 0 IRQ_INTB &mpc5200_pic 0 3 3
+				0x8000 0 0 IRQ_INTC &mpc5200_pic 0 2 3
+				0x8000 0 0 IRQ_INTD &mpc5200_pic 0 1 3
 				>;
 		ranges = <0x42000000 0 0x60000000 0x60000000 0 0x10000000
 			  0x02000000 0 0x90000000 0x90000000 0 0x10000000
diff --git a/arch/powerpc/boot/dts/mvme5100.dts b/arch/powerpc/boot/dts/mvme5100.dts
index a7eb6d25903d..29c56e56e50a 100644
--- a/arch/powerpc/boot/dts/mvme5100.dts
+++ b/arch/powerpc/boot/dts/mvme5100.dts
@@ -10,6 +10,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "MVME5100";
 	compatible = "MVME5100";
@@ -96,7 +98,7 @@
 		bus-range = <0 255>;
 		clock-frequency = <33333333>;
 		interrupt-parent = <&mpic>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 
 			/*
@@ -109,46 +111,46 @@
 			 * "spurious" i8259 interrupts to be fielded.
 			 */
 			// IDSEL 11 - iPMC712 PCI/ISA Bridge
-			0x5800 0x0 0x0 0x1 &mpic 0x0 0x2
-			0x5800 0x0 0x0 0x2 &mpic 0x0 0x2
-			0x5800 0x0 0x0 0x3 &mpic 0x0 0x2
-			0x5800 0x0 0x0 0x4 &mpic 0x0 0x2
+			0x5800 0x0 0x0 IRQ_INTA &mpic 0x0 0x2
+			0x5800 0x0 0x0 IRQ_INTB &mpic 0x0 0x2
+			0x5800 0x0 0x0 IRQ_INTC &mpic 0x0 0x2
+			0x5800 0x0 0x0 IRQ_INTD &mpic 0x0 0x2
 
 			/* IDSEL 12 - Not Used */
 
 			/* IDSEL 13 - Universe VME Bridge */
-			0x6800 0x0 0x0 0x1 &mpic 0x5 0x1
-			0x6800 0x0 0x0 0x2 &mpic 0x6 0x1
-			0x6800 0x0 0x0 0x3 &mpic 0x7 0x1
-			0x6800 0x0 0x0 0x4 &mpic 0x8 0x1
+			0x6800 0x0 0x0 IRQ_INTA &mpic 0x5 0x1
+			0x6800 0x0 0x0 IRQ_INTB &mpic 0x6 0x1
+			0x6800 0x0 0x0 IRQ_INTC &mpic 0x7 0x1
+			0x6800 0x0 0x0 IRQ_INTD &mpic 0x8 0x1
 
 			/* IDSEL 14 - ENET 1 */
-			0x7000 0x0 0x0 0x1 &mpic 0x2 0x1
+			0x7000 0x0 0x0 IRQ_INTA &mpic 0x2 0x1
 
 			/* IDSEL 15 - Not Used */
 
 			/* IDSEL 16 - PMC Slot 1 */
-			0x8000 0x0 0x0 0x1 &mpic 0x9 0x1
-			0x8000 0x0 0x0 0x2 &mpic 0xa 0x1
-			0x8000 0x0 0x0 0x3 &mpic 0xb 0x1
-			0x8000 0x0 0x0 0x4 &mpic 0xc 0x1
+			0x8000 0x0 0x0 IRQ_INTA &mpic 0x9 0x1
+			0x8000 0x0 0x0 IRQ_INTB &mpic 0xa 0x1
+			0x8000 0x0 0x0 IRQ_INTC &mpic 0xb 0x1
+			0x8000 0x0 0x0 IRQ_INTD &mpic 0xc 0x1
 
 			/* IDSEL 17 - PMC Slot 2 */
-			0x8800 0x0 0x0 0x1 &mpic 0xc 0x1
-			0x8800 0x0 0x0 0x2 &mpic 0x9 0x1
-			0x8800 0x0 0x0 0x3 &mpic 0xa 0x1
-			0x8800 0x0 0x0 0x4 &mpic 0xb 0x1
+			0x8800 0x0 0x0 IRQ_INTA &mpic 0xc 0x1
+			0x8800 0x0 0x0 IRQ_INTB &mpic 0x9 0x1
+			0x8800 0x0 0x0 IRQ_INTC &mpic 0xa 0x1
+			0x8800 0x0 0x0 IRQ_INTD &mpic 0xb 0x1
 
 			/* IDSEL 18 - Not Used */
 
 			/* IDSEL 19 - ENET 2 */
-			0x9800 0x0 0x0 0x1 &mpic 0xd 0x1
+			0x9800 0x0 0x0 IRQ_INTA &mpic 0xd 0x1
 
 			/* IDSEL 20 - PMCSPAN (PCI-X) */
-			0xa000 0x0 0x0 0x1 &mpic 0x9 0x1
-			0xa000 0x0 0x0 0x2 &mpic 0xa 0x1
-			0xa000 0x0 0x0 0x3 &mpic 0xb 0x1
-			0xa000 0x0 0x0 0x4 &mpic 0xc 0x1
+			0xa000 0x0 0x0 IRQ_INTA &mpic 0x9 0x1
+			0xa000 0x0 0x0 IRQ_INTB &mpic 0xa 0x1
+			0xa000 0x0 0x0 IRQ_INTC &mpic 0xb 0x1
+			0xa000 0x0 0x0 IRQ_INTD &mpic 0xc 0x1
 
 		>;
 
diff --git a/arch/powerpc/boot/dts/pcm030.dts b/arch/powerpc/boot/dts/pcm030.dts
index b1bc731f7afd..d1a6b4deb258 100644
--- a/arch/powerpc/boot/dts/pcm030.dts
+++ b/arch/powerpc/boot/dts/pcm030.dts
@@ -10,6 +10,8 @@
 
 /include/ "mpc5200b.dtsi"
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 &gpt0 { fsl,has-wdt; };
 &gpt2 { gpio-controller; };
 &gpt3 { gpio-controller; };
@@ -80,16 +82,16 @@
 	};
 
 	pci@f0000d00 {
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0xc000 0 0 1 &mpc5200_pic 0 0 3 // 1st slot
-				 0xc000 0 0 2 &mpc5200_pic 1 1 3
-				 0xc000 0 0 3 &mpc5200_pic 1 2 3
-				 0xc000 0 0 4 &mpc5200_pic 1 3 3
-
-				 0xc800 0 0 1 &mpc5200_pic 1 1 3 // 2nd slot
-				 0xc800 0 0 2 &mpc5200_pic 1 2 3
-				 0xc800 0 0 3 &mpc5200_pic 1 3 3
-				 0xc800 0 0 4 &mpc5200_pic 0 0 3>;
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
+		interrupt-map = <0xc000 0 0 IRQ_INTA &mpc5200_pic 0 0 3 // 1st slot
+				 0xc000 0 0 IRQ_INTB &mpc5200_pic 1 1 3
+				 0xc000 0 0 IRQ_INTC &mpc5200_pic 1 2 3
+				 0xc000 0 0 IRQ_INTD &mpc5200_pic 1 3 3
+
+				 0xc800 0 0 IRQ_INTA &mpc5200_pic 1 1 3 // 2nd slot
+				 0xc800 0 0 IRQ_INTB &mpc5200_pic 1 2 3
+				 0xc800 0 0 IRQ_INTC &mpc5200_pic 1 3 3
+				 0xc800 0 0 IRQ_INTD &mpc5200_pic 0 0 3>;
 		ranges = <0x42000000 0 0x80000000 0x80000000 0 0x20000000
 			  0x02000000 0 0xa0000000 0xa0000000 0 0x10000000
 			  0x01000000 0 0x00000000 0xb0000000 0 0x01000000>;
diff --git a/arch/powerpc/boot/dts/pcm032.dts b/arch/powerpc/boot/dts/pcm032.dts
index c259c6b3ac5a..f60d45713469 100644
--- a/arch/powerpc/boot/dts/pcm032.dts
+++ b/arch/powerpc/boot/dts/pcm032.dts
@@ -10,6 +10,8 @@
 
 /include/ "mpc5200b.dtsi"
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 &gpt0 { fsl,has-wdt; };
 &gpt2 { gpio-controller; };
 &gpt3 { gpio-controller; };
@@ -79,16 +81,16 @@
 	};
 
 	pci@f0000d00 {
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0xc000 0 0 1 &mpc5200_pic 0 0 3 // 1st slot
-				 0xc000 0 0 2 &mpc5200_pic 1 1 3
-				 0xc000 0 0 3 &mpc5200_pic 1 2 3
-				 0xc000 0 0 4 &mpc5200_pic 1 3 3
-
-				 0xc800 0 0 1 &mpc5200_pic 1 1 3 // 2nd slot
-				 0xc800 0 0 2 &mpc5200_pic 1 2 3
-				 0xc800 0 0 3 &mpc5200_pic 1 3 3
-				 0xc800 0 0 4 &mpc5200_pic 0 0 3>;
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
+		interrupt-map = <0xc000 0 0 IRQ_INTA &mpc5200_pic 0 0 3 // 1st slot
+				 0xc000 0 0 IRQ_INTB &mpc5200_pic 1 1 3
+				 0xc000 0 0 IRQ_INTC &mpc5200_pic 1 2 3
+				 0xc000 0 0 IRQ_INTD &mpc5200_pic 1 3 3
+
+				 0xc800 0 0 IRQ_INTA &mpc5200_pic 1 1 3 // 2nd slot
+				 0xc800 0 0 IRQ_INTB &mpc5200_pic 1 2 3
+				 0xc800 0 0 IRQ_INTC &mpc5200_pic 1 3 3
+				 0xc800 0 0 IRQ_INTD &mpc5200_pic 0 0 3>;
 		ranges = <0x42000000 0 0x80000000 0x80000000 0 0x20000000
 			  0x02000000 0 0xa0000000 0xa0000000 0 0x10000000
 			  0x01000000 0 0x00000000 0xb0000000 0 0x01000000>;
diff --git a/arch/powerpc/boot/dts/pq2fads.dts b/arch/powerpc/boot/dts/pq2fads.dts
index b6666215ed63..35ba9f975981 100644
--- a/arch/powerpc/boot/dts/pq2fads.dts
+++ b/arch/powerpc/boot/dts/pq2fads.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "pq2fads";
 	compatible = "fsl,pq2fads";
@@ -83,25 +85,25 @@
 		#size-cells = <2>;
 		#address-cells = <3>;
 		clock-frequency = <66000000>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 		                /* IDSEL 0x16 */
-		                 0xb000 0x0 0x0 0x1 &PCI_PIC 0
-		                 0xb000 0x0 0x0 0x2 &PCI_PIC 1
-		                 0xb000 0x0 0x0 0x3 &PCI_PIC 2
-		                 0xb000 0x0 0x0 0x4 &PCI_PIC 3
+		                 0xb000 0x0 0x0 IRQ_INTA &PCI_PIC 0
+		                 0xb000 0x0 0x0 IRQ_INTB &PCI_PIC 1
+		                 0xb000 0x0 0x0 IRQ_INTC &PCI_PIC 2
+		                 0xb000 0x0 0x0 IRQ_INTD &PCI_PIC 3
 
 		                /* IDSEL 0x17 */
-		                 0xb800 0x0 0x0 0x1 &PCI_PIC 4
-		                 0xb800 0x0 0x0 0x2 &PCI_PIC 5
-		                 0xb800 0x0 0x0 0x3 &PCI_PIC 6
-		                 0xb800 0x0 0x0 0x4 &PCI_PIC 7
+		                 0xb800 0x0 0x0 IRQ_INTA &PCI_PIC 4
+		                 0xb800 0x0 0x0 IRQ_INTB &PCI_PIC 5
+		                 0xb800 0x0 0x0 IRQ_INTC &PCI_PIC 6
+		                 0xb800 0x0 0x0 IRQ_INTD &PCI_PIC 7
 
 		                /* IDSEL 0x18 */
-		                 0xc000 0x0 0x0 0x1 &PCI_PIC 8
-		                 0xc000 0x0 0x0 0x2 &PCI_PIC 9
-		                 0xc000 0x0 0x0 0x3 &PCI_PIC 10
-		                 0xc000 0x0 0x0 0x4 &PCI_PIC 11>;
+		                 0xc000 0x0 0x0 IRQ_INTA &PCI_PIC 8
+		                 0xc000 0x0 0x0 IRQ_INTB &PCI_PIC 9
+		                 0xc000 0x0 0x0 IRQ_INTC &PCI_PIC 10
+		                 0xc000 0x0 0x0 IRQ_INTD &PCI_PIC 11>;
 
 		interrupt-parent = <&PIC>;
 		interrupts = <18 8>;
diff --git a/arch/powerpc/boot/dts/socrates.dts b/arch/powerpc/boot/dts/socrates.dts
index 00a56e8e367c..f4e529bb9118 100644
--- a/arch/powerpc/boot/dts/socrates.dts
+++ b/arch/powerpc/boot/dts/socrates.dts
@@ -8,6 +8,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "abb,socrates";
 	compatible = "abb,socrates";
@@ -332,12 +334,12 @@
 		reg = <0xe0008000 0x1000>;
 		clock-frequency = <66666666>;
 
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 				/* IDSEL 0x11 */
-				 0x8800 0x0 0x0 1 &mpic 5 1
+				 0x8800 0x0 0x0 IRQ_INTA &mpic 5 1
 				/* IDSEL 0x12 */
-				 0x9000 0x0 0x0 1 &mpic 4 1>;
+				 0x9000 0x0 0x0 IRQ_INTA &mpic 4 1>;
 		interrupt-parent = <&mpic>;
 		interrupts = <24 2>;
 		bus-range = <0x0 0x0>;
diff --git a/arch/powerpc/boot/dts/storcenter.dts b/arch/powerpc/boot/dts/storcenter.dts
index 99f6f544dc5f..e42c57a0a375 100644
--- a/arch/powerpc/boot/dts/storcenter.dts
+++ b/arch/powerpc/boot/dts/storcenter.dts
@@ -13,6 +13,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "StorCenter";
 	compatible = "iomega,storcenter";
@@ -116,23 +118,23 @@
 		bus-range = <0 0xff>;
 		clock-frequency = <97553800>;
 		interrupt-parent = <&mpic>;
-		interrupt-map-mask = <0xf800 0 0 7>;
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
 		interrupt-map = <
 			/* IDSEL 13 - IDE */
-			0x6800 0 0 1 &mpic 0 1
-			0x6800 0 0 2 &mpic 0 1
-			0x6800 0 0 3 &mpic 0 1
-			0x6800 0 0 4 &mpic 0 1
+			0x6800 0 0 IRQ_INTA &mpic 0 1
+			0x6800 0 0 IRQ_INTB &mpic 0 1
+			0x6800 0 0 IRQ_INTC &mpic 0 1
+			0x6800 0 0 IRQ_INTD &mpic 0 1
 			/* IDSEL 14 - USB */
-			0x7000 0 0 1 &mpic 0 1
-			0x7000 0 0 2 &mpic 0 1
-			0x7000 0 0 3 &mpic 0 1
-			0x7000 0 0 4 &mpic 0 1
+			0x7000 0 0 IRQ_INTA &mpic 0 1
+			0x7000 0 0 IRQ_INTB &mpic 0 1
+			0x7000 0 0 IRQ_INTC &mpic 0 1
+			0x7000 0 0 IRQ_INTD &mpic 0 1
 			/* IDSEL 15 - ETH */
-			0x7800 0 0 1 &mpic 0 1
-			0x7800 0 0 2 &mpic 0 1
-			0x7800 0 0 3 &mpic 0 1
-			0x7800 0 0 4 &mpic 0 1
+			0x7800 0 0 IRQ_INTA &mpic 0 1
+			0x7800 0 0 IRQ_INTB &mpic 0 1
+			0x7800 0 0 IRQ_INTC &mpic 0 1
+			0x7800 0 0 IRQ_INTD &mpic 0 1
 		>;
 	};
 
diff --git a/arch/powerpc/boot/dts/stx_gp3_8560.dts b/arch/powerpc/boot/dts/stx_gp3_8560.dts
index d1ab698eef36..78c92101fbf6 100644
--- a/arch/powerpc/boot/dts/stx_gp3_8560.dts
+++ b/arch/powerpc/boot/dts/stx_gp3_8560.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "stx,gp3";
 	compatible = "stx,gp3-8560", "stx,gp3";
@@ -257,32 +259,32 @@
 	};
 
 	pci0: pci@fdf08000 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 
 			/* IDSEL 0x0c */
-			0x6000 0 0 1 &mpic 1 1
-			0x6000 0 0 2 &mpic 2 1
-			0x6000 0 0 3 &mpic 3 1
-			0x6000 0 0 4 &mpic 4 1
+			0x6000 0 0 IRQ_INTA &mpic 1 1
+			0x6000 0 0 IRQ_INTB &mpic 2 1
+			0x6000 0 0 IRQ_INTC &mpic 3 1
+			0x6000 0 0 IRQ_INTD &mpic 4 1
 
 			/* IDSEL 0x0d */
-			0x6800 0 0 1 &mpic 4 1
-			0x6800 0 0 2 &mpic 1 1
-			0x6800 0 0 3 &mpic 2 1
-			0x6800 0 0 4 &mpic 3 1
+			0x6800 0 0 IRQ_INTA &mpic 4 1
+			0x6800 0 0 IRQ_INTB &mpic 1 1
+			0x6800 0 0 IRQ_INTC &mpic 2 1
+			0x6800 0 0 IRQ_INTD &mpic 3 1
 
 			/* IDSEL 0x0e */
-			0x7000 0 0 1 &mpic 3 1
-			0x7000 0 0 2 &mpic 4 1
-			0x7000 0 0 3 &mpic 1 1
-			0x7000 0 0 4 &mpic 2 1
+			0x7000 0 0 IRQ_INTA &mpic 3 1
+			0x7000 0 0 IRQ_INTB &mpic 4 1
+			0x7000 0 0 IRQ_INTC &mpic 1 1
+			0x7000 0 0 IRQ_INTD &mpic 2 1
 
 			/* IDSEL 0x0f */
-			0x7800 0 0 1 &mpic 2 1
-			0x7800 0 0 2 &mpic 3 1
-			0x7800 0 0 3 &mpic 4 1
-			0x7800 0 0 4 &mpic 1 1>;
+			0x7800 0 0 IRQ_INTA &mpic 2 1
+			0x7800 0 0 IRQ_INTB &mpic 3 1
+			0x7800 0 0 IRQ_INTC &mpic 4 1
+			0x7800 0 0 IRQ_INTD &mpic 1 1>;
 
 		interrupt-parent = <&mpic>;
 		interrupts = <24 2>;
diff --git a/arch/powerpc/boot/dts/taishan.dts b/arch/powerpc/boot/dts/taishan.dts
index 803f1bff7fa8..8d6ee99c1507 100644
--- a/arch/powerpc/boot/dts/taishan.dts
+++ b/arch/powerpc/boot/dts/taishan.dts
@@ -12,6 +12,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	#address-cells = <2>;
 	#size-cells = <1>;
@@ -404,19 +406,19 @@
 			/* Inbound 2GB range starting at 0 */
 			dma-ranges = <0x42000000 0x0 0x0 0x0 0x0 0x0 0x80000000>;
 
-			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+			interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 			interrupt-map = <
 				/* IDSEL 1 */
-				0x800 0x0 0x0 0x1 &UIC0 0x17 0x8
-				0x800 0x0 0x0 0x2 &UIC0 0x18 0x8
-				0x800 0x0 0x0 0x3 &UIC0 0x19 0x8
-				0x800 0x0 0x0 0x4 &UIC0 0x1a 0x8
+				0x800 0x0 0x0 IRQ_INTA &UIC0 0x17 0x8
+				0x800 0x0 0x0 IRQ_INTB &UIC0 0x18 0x8
+				0x800 0x0 0x0 IRQ_INTC &UIC0 0x19 0x8
+				0x800 0x0 0x0 IRQ_INTD &UIC0 0x1a 0x8
 
 				/* IDSEL 2 */
-				0x1000 0x0 0x0 0x1 &UIC0 0x18 0x8
-				0x1000 0x0 0x0 0x2 &UIC0 0x19 0x8
-				0x1000 0x0 0x0 0x3 &UIC0 0x1a 0x8
-				0x1000 0x0 0x0 0x4 &UIC0 0x17 0x8
+				0x1000 0x0 0x0 IRQ_INTA &UIC0 0x18 0x8
+				0x1000 0x0 0x0 IRQ_INTB &UIC0 0x19 0x8
+				0x1000 0x0 0x0 IRQ_INTC &UIC0 0x1a 0x8
+				0x1000 0x0 0x0 IRQ_INTD &UIC0 0x17 0x8
 			>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/tqm5200.dts b/arch/powerpc/boot/dts/tqm5200.dts
index 9ed0bc78967e..37db22b31e53 100644
--- a/arch/powerpc/boot/dts/tqm5200.dts
+++ b/arch/powerpc/boot/dts/tqm5200.dts
@@ -8,6 +8,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "tqc,tqm5200";
 	compatible = "tqc,tqm5200";
@@ -192,11 +194,11 @@
 		device_type = "pci";
 		compatible = "fsl,mpc5200-pci";
 		reg = <0xf0000d00 0x100>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0xc000 0 0 1 &mpc5200_pic 0 0 3
-				 0xc000 0 0 2 &mpc5200_pic 0 0 3
-				 0xc000 0 0 3 &mpc5200_pic 0 0 3
-				 0xc000 0 0 4 &mpc5200_pic 0 0 3>;
+		interrupt-map-mask = <0xf800 0 0 IRQ_INT_ALL>;
+		interrupt-map = <0xc000 0 0 IRQ_INTA &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTB &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTC &mpc5200_pic 0 0 3
+				 0xc000 0 0 IRQ_INTD &mpc5200_pic 0 0 3>;
 		clock-frequency = <0>; // From boot loader
 		interrupts = <2 8 0 2 9 0 2 10 0>;
 		bus-range = <0 0>;
diff --git a/arch/powerpc/boot/dts/tqm8540.dts b/arch/powerpc/boot/dts/tqm8540.dts
index 9c1eb9779108..d83dd9420da0 100644
--- a/arch/powerpc/boot/dts/tqm8540.dts
+++ b/arch/powerpc/boot/dts/tqm8540.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "tqc,tqm8540";
 	compatible = "tqc,tqm8540";
@@ -320,17 +322,17 @@
 		device_type = "pci";
 		reg = <0xe0008000 0x1000>;
 		clock-frequency = <66666666>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 				/* IDSEL 28 */
-				 0xe000 0 0 1 &mpic 2 1
-				 0xe000 0 0 2 &mpic 3 1
-				 0xe000 0 0 3 &mpic 6 1
-				 0xe000 0 0 4 &mpic 5 1
+				 0xe000 0 0 IRQ_INTA &mpic 2 1
+				 0xe000 0 0 IRQ_INTB &mpic 3 1
+				 0xe000 0 0 IRQ_INTC &mpic 6 1
+				 0xe000 0 0 IRQ_INTD &mpic 5 1
 
 				/* IDSEL 11 */
-				 0x5800 0 0 1 &mpic 6 1
-				 0x5800 0 0 2 &mpic 5 1
+				 0x5800 0 0 IRQ_INTA &mpic 6 1
+				 0x5800 0 0 IRQ_INTB &mpic 5 1
 				 >;
 
 		interrupt-parent = <&mpic>;
diff --git a/arch/powerpc/boot/dts/tqm8541.dts b/arch/powerpc/boot/dts/tqm8541.dts
index 44595cf675d0..a8b2a3fd99f7 100644
--- a/arch/powerpc/boot/dts/tqm8541.dts
+++ b/arch/powerpc/boot/dts/tqm8541.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "tqc,tqm8541";
 	compatible = "tqc,tqm8541";
@@ -300,17 +302,17 @@
 		device_type = "pci";
 		reg = <0xe0008000 0x1000>;
 		clock-frequency = <66666666>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 				/* IDSEL 28 */
-				 0xe000 0 0 1 &mpic 2 1
-				 0xe000 0 0 2 &mpic 3 1
-				 0xe000 0 0 3 &mpic 6 1
-				 0xe000 0 0 4 &mpic 5 1
+				 0xe000 0 0 IRQ_INTA &mpic 2 1
+				 0xe000 0 0 IRQ_INTB &mpic 3 1
+				 0xe000 0 0 IRQ_INTC &mpic 6 1
+				 0xe000 0 0 IRQ_INTD &mpic 5 1
 
 				/* IDSEL 11 */
-				 0x5800 0 0 1 &mpic 6 1
-				 0x5800 0 0 2 &mpic 5 1
+				 0x5800 0 0 IRQ_INTA &mpic 6 1
+				 0x5800 0 0 IRQ_INTB &mpic 5 1
 				 >;
 
 		interrupt-parent = <&mpic>;
diff --git a/arch/powerpc/boot/dts/tqm8555.dts b/arch/powerpc/boot/dts/tqm8555.dts
index 54f3e82907d6..8d5bf40d1871 100644
--- a/arch/powerpc/boot/dts/tqm8555.dts
+++ b/arch/powerpc/boot/dts/tqm8555.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "tqc,tqm8555";
 	compatible = "tqc,tqm8555";
@@ -300,17 +302,17 @@
 		device_type = "pci";
 		reg = <0xe0008000 0x1000>;
 		clock-frequency = <66666666>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 				/* IDSEL 28 */
-				 0xe000 0 0 1 &mpic 2 1
-				 0xe000 0 0 2 &mpic 3 1
-				 0xe000 0 0 3 &mpic 6 1
-				 0xe000 0 0 4 &mpic 5 1
+				 0xe000 0 0 IRQ_INTA &mpic 2 1
+				 0xe000 0 0 IRQ_INTB &mpic 3 1
+				 0xe000 0 0 IRQ_INTC &mpic 6 1
+				 0xe000 0 0 IRQ_INTD &mpic 5 1
 
 				/* IDSEL 11 */
-				 0x5800 0 0 1 &mpic 6 1
-				 0x5800 0 0 2 &mpic 5 1
+				 0x5800 0 0 IRQ_INTA &mpic 6 1
+				 0x5800 0 0 IRQ_INTB &mpic 5 1
 				 >;
 
 		interrupt-parent = <&mpic>;
diff --git a/arch/powerpc/boot/dts/tqm8560.dts b/arch/powerpc/boot/dts/tqm8560.dts
index 7415cb69f60d..ec113cbf7a0f 100644
--- a/arch/powerpc/boot/dts/tqm8560.dts
+++ b/arch/powerpc/boot/dts/tqm8560.dts
@@ -8,6 +8,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "tqc,tqm8560";
 	compatible = "tqc,tqm8560";
@@ -373,17 +375,17 @@
 		device_type = "pci";
 		reg = <0xe0008000 0x1000>;
 		clock-frequency = <66666666>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 				/* IDSEL 28 */
-				 0xe000 0 0 1 &mpic 2 1
-				 0xe000 0 0 2 &mpic 3 1
-				 0xe000 0 0 3 &mpic 6 1
-				 0xe000 0 0 4 &mpic 5 1
+				 0xe000 0 0 IRQ_INTA &mpic 2 1
+				 0xe000 0 0 IRQ_INTB &mpic 3 1
+				 0xe000 0 0 IRQ_INTC &mpic 6 1
+				 0xe000 0 0 IRQ_INTD &mpic 5 1
 
 				/* IDSEL 11 */
-				 0x5800 0 0 1 &mpic 6 1
-				 0x5800 0 0 2 &mpic 5 1
+				 0x5800 0 0 IRQ_INTA &mpic 6 1
+				 0x5800 0 0 IRQ_INTB &mpic 5 1
 				 >;
 
 		interrupt-parent = <&mpic>;
diff --git a/arch/powerpc/boot/dts/virtex440-ml510.dts b/arch/powerpc/boot/dts/virtex440-ml510.dts
index 3b736ca26ddc..4c2c63f199a2 100644
--- a/arch/powerpc/boot/dts/virtex440-ml510.dts
+++ b/arch/powerpc/boot/dts/virtex440-ml510.dts
@@ -11,6 +11,9 @@
  */
 
 /dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -353,7 +356,7 @@
 
 			#interrupt-cells = <1>;
 			interrupt-parent = <&xps_intc_0>;
-			interrupt-map-mask = <0xff00 0x0 0x0 0x7>;
+			interrupt-map-mask = <0xff00 0x0 0x0 IRQ_INT_ALL>;
 			interrupt-map = <
 				/* IRQ mapping for pci slots and ALI M1533
 				 * periperhals. In total there are 5 interrupt
@@ -373,17 +376,17 @@
 				 */
 
 				/* IDSEL 0x16 / dev=6, bus=0 / PCI slot 3 */
-				0x3000 0 0 1 &xps_intc_0 3 2
-				0x3000 0 0 2 &xps_intc_0 2 2
-				0x3000 0 0 3 &xps_intc_0 5 2
-				0x3000 0 0 4 &xps_intc_0 4 2
+				0x3000 0 0 IRQ_INTA &xps_intc_0 3 2
+				0x3000 0 0 IRQ_INTB &xps_intc_0 2 2
+				0x3000 0 0 IRQ_INTC &xps_intc_0 5 2
+				0x3000 0 0 IRQ_INTD &xps_intc_0 4 2
 
 				/* IDSEL 0x13 / dev=3, bus=1 / PCI slot 4 */
 				/*
-				0x11800 0 0 1 &xps_intc_0 5 0 2
-				0x11800 0 0 2 &xps_intc_0 4 0 2
-				0x11800 0 0 3 &xps_intc_0 3 0 2
-				0x11800 0 0 4 &xps_intc_0 2 0 2
+				0x11800 0 0 IRQ_INTA &xps_intc_0 5 0 2
+				0x11800 0 0 IRQ_INTB &xps_intc_0 4 0 2
+				0x11800 0 0 IRQ_INTC &xps_intc_0 3 0 2
+				0x11800 0 0 IRQ_INTD &xps_intc_0 2 0 2
 				*/
 
 				/* According to the datasheet + schematic
@@ -394,29 +397,29 @@
 				 * commented out.
 				 */
 				/* IDSEL 0x15 / dev=5, bus=0 / PCI slot 5 */
-				0x2800 0 0 1 &xps_intc_0 4 2
+				0x2800 0 0 IRQ_INTA &xps_intc_0 4 2
 				/*
-				0x2800 0 0 2 &xps_intc_0 3 2
-				0x2800 0 0 3 &xps_intc_0 2 2
-				0x2800 0 0 4 &xps_intc_0 5 2
+				0x2800 0 0 IRQ_INTB &xps_intc_0 3 2
+				0x2800 0 0 IRQ_INTC &xps_intc_0 2 2
+				0x2800 0 0 IRQ_INTD &xps_intc_0 5 2
 				*/
 
 				/* IDSEL 0x12 / dev=2, bus=1 / PCI slot 6 */
 				/*
-				0x11000 0 0 1 &xps_intc_0 4 0 2
-				0x11000 0 0 2 &xps_intc_0 3 0 2
-				0x11000 0 0 3 &xps_intc_0 2 0 2
-				0x11000 0 0 4 &xps_intc_0 5 0 2
+				0x11000 0 0 IRQ_INTA &xps_intc_0 4 0 2
+				0x11000 0 0 IRQ_INTB &xps_intc_0 3 0 2
+				0x11000 0 0 IRQ_INTC &xps_intc_0 2 0 2
+				0x11000 0 0 IRQ_INTD &xps_intc_0 5 0 2
 				*/
 
 				/* IDSEL 0x11 / dev=1, bus=0 / AC97 audio */
-				0x0800 0 0 1 &i8259 7 2
+				0x0800 0 0 IRQ_INTA &i8259 7 2
 
 				/* IDSEL 0x1b / dev=11, bus=0 / IDE */
-				0x5800 0 0 1 &i8259 14 2
+				0x5800 0 0 IRQ_INTA &i8259 14 2
 
 				/* IDSEL 0x1f / dev 15, bus=0 / 2x USB 1.1 */
-				0x7800 0 0 1 &i8259 7 2
+				0x7800 0 0 IRQ_INTA &i8259 7 2
 			>;
 			ali_m1533 {
 				#size-cells = <1>;
diff --git a/arch/powerpc/boot/dts/xcalibur1501.dts b/arch/powerpc/boot/dts/xcalibur1501.dts
index 46c25bda9515..90730a4f195e 100644
--- a/arch/powerpc/boot/dts/xcalibur1501.dts
+++ b/arch/powerpc/boot/dts/xcalibur1501.dts
@@ -7,6 +7,9 @@
  */
 
 /dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "xes,xcalibur1501";
 	compatible = "xes,xcalibur1501", "xes,MPC8572";
@@ -668,13 +671,13 @@
 		clock-frequency = <33333333>;
 		interrupt-parent = <&mpic>;
 		interrupts = <26 2>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 			/* IDSEL 0x0 */
-			0x0 0x0 0x0 0x1 &mpic 0x0 0x1
-			0x0 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x0 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x0 0x0 0x0 0x4 &mpic 0x3 0x1
+			0x0 0x0 0x0 IRQ_INTA &mpic 0x0 0x1
+			0x0 0x0 0x0 IRQ_INTB &mpic 0x1 0x1
+			0x0 0x0 0x0 IRQ_INTC &mpic 0x2 0x1
+			0x0 0x0 0x0 IRQ_INTD &mpic 0x3 0x1
 			>;
 		pcie@0 {
 			reg = <0x0 0x0 0x0 0x0 0x0>;
diff --git a/arch/powerpc/boot/dts/xpedite5200.dts b/arch/powerpc/boot/dts/xpedite5200.dts
index 840ea84bbb59..ea6d0e936faa 100644
--- a/arch/powerpc/boot/dts/xpedite5200.dts
+++ b/arch/powerpc/boot/dts/xpedite5200.dts
@@ -8,6 +8,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 / {
 	model = "xes,xpedite5200";
 	compatible = "xes,xpedite5200", "xes,MPC8548";
@@ -448,11 +450,11 @@
 		device_type = "pci";
 		reg = <0xef008000 0x1000>;
 		clock-frequency = <33333333>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+		interrupt-map-mask = <0xf800 0x0 0x0 IRQ_INT_ALL>;
 		interrupt-map = <
 				/* IDSEL */
-				 0xe000 0 0 1 &mpic 2 1
-				 0xe000 0 0 2 &mpic 3 1>;
+				 0xe000 0 0 IRQ_INTA &mpic 2 1
+				 0xe000 0 0 IRQ_INTB &mpic 3 1>;
 
 		interrupt-parent = <&mpic>;
 		interrupts = <24 2>;
-- 
2.21.0

