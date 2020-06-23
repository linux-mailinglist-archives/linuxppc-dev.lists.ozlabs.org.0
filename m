Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D8720530A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 15:05:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rmj80GDSzDqLr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 23:05:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rmfN05vhzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 23:02:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Lrdx9+Vh; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49rmfM4ct7z9s6w; Tue, 23 Jun 2020 23:02:51 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49rmfM30w9z9sRf; Tue, 23 Jun 2020 23:02:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592917371;
 bh=7OQWHjAL4WR13EqfARGMTS7Rm8FyLmUHJy2dO/H0evU=;
 h=From:To:Cc:Subject:Date:From;
 b=Lrdx9+VhlD7kSxxR7H2BITASB7Vc09qzAS8jqA9Czum/+BwXlDkDhZBcs/qNpiyp9
 OC+mDYFgx3nk7b0tSTI7DqqMFB1qNSQaCeMMCQ5TcQVjuk1PJjUTxT+5YAVhFwm93E
 /irNbj/nXzEF5jBgAYPuBwERdgVmBARt1IHpr1x3vhDyxg1EfUa4a489psG75RHJoJ
 CXoqC+KnNH3q77eh0o6f1HjZDuo1qXm3fu2Hczl4qN1CMi8CglB+SP/fiC1MwO0GHS
 c6xA0fnIFgwR5BbnRAX1K3RR9PvRCqSSRZ1IkrXkjfVC4xhFTXcY1huItFi3JNmB7H
 2CKcJf9XtxcSA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/boot/dts: Fix dtc "pciex" warnings
Date: Tue, 23 Jun 2020 23:03:20 +1000
Message-Id: <20200623130320.405852-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: sfr@canb.auug.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_OF_ALL_DTBS=y, as set by eg. allmodconfig, we see lots of
warnings about our dts files, such as:

  arch/powerpc/boot/dts/glacier.dts:492.26-532.5:
  Warning (pci_bridge): /plb/pciex@d00000000: node name is not "pci"
  or "pcie"

The node name should not particularly matter, it's just a name, and
AFAICS there's no kernel code that cares whether nodes are *named*
"pciex" or "pcie". So shutup these warnings by converting to the name
dtc wants.

As always there's some risk this could break something obscure that
does rely on the name, in which case we can revert.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/boot/dts/akebono.dts     | 8 ++++----
 arch/powerpc/boot/dts/bluestone.dts   | 2 +-
 arch/powerpc/boot/dts/canyonlands.dts | 4 ++--
 arch/powerpc/boot/dts/currituck.dts   | 6 +++---
 arch/powerpc/boot/dts/glacier.dts     | 4 ++--
 arch/powerpc/boot/dts/haleakala.dts   | 2 +-
 arch/powerpc/boot/dts/icon.dts        | 4 ++--
 arch/powerpc/boot/dts/katmai.dts      | 6 +++---
 arch/powerpc/boot/dts/kilauea.dts     | 4 ++--
 arch/powerpc/boot/dts/makalu.dts      | 4 ++--
 arch/powerpc/boot/dts/redwood.dts     | 6 +++---
 11 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/boot/dts/akebono.dts b/arch/powerpc/boot/dts/akebono.dts
index cd9d66041a3f..df18f8dc4642 100644
--- a/arch/powerpc/boot/dts/akebono.dts
+++ b/arch/powerpc/boot/dts/akebono.dts
@@ -248,7 +248,7 @@ FPGA0: fpga@ebc00000 {
 			};
 		};
 
-		PCIE0: pciex@10100000000 {
+		PCIE0: pcie@10100000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -288,7 +288,7 @@ PCIE0: pciex@10100000000 {
 				0x0 0x0 0x0 0x4 &MPIC 48 0x2 /* int D */>;
 		};
 
-		PCIE1: pciex@20100000000 {
+		PCIE1: pcie@20100000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -328,7 +328,7 @@ PCIE1: pciex@20100000000 {
 				0x0 0x0 0x0 0x4 &MPIC 56 0x2 /* int D */>;
 		};
 
-		PCIE2: pciex@18100000000 {
+		PCIE2: pcie@18100000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -368,7 +368,7 @@ PCIE2: pciex@18100000000 {
 				0x0 0x0 0x0 0x4 &MPIC 64 0x2 /* int D */>;
 		};
 
-		PCIE3: pciex@28100000000 {
+		PCIE3: pcie@28100000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/bluestone.dts b/arch/powerpc/boot/dts/bluestone.dts
index cc965a1816b6..aa1ae94cd776 100644
--- a/arch/powerpc/boot/dts/bluestone.dts
+++ b/arch/powerpc/boot/dts/bluestone.dts
@@ -325,7 +325,7 @@ EMAC0: ethernet@ef600c00 {
 			};
 		};
 
-		PCIE0: pciex@d00000000 {
+		PCIE0: pcie@d00000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/canyonlands.dts b/arch/powerpc/boot/dts/canyonlands.dts
index 0d6ac92d0f5e..c5fbb08e0a6e 100644
--- a/arch/powerpc/boot/dts/canyonlands.dts
+++ b/arch/powerpc/boot/dts/canyonlands.dts
@@ -461,7 +461,7 @@ PCIX0: pci@c0ec00000 {
 			interrupt-map = < 0x0 0x0 0x0 0x0 &UIC1 0x0 0x8 >;
 		};
 
-		PCIE0: pciex@d00000000 {
+		PCIE0: pcie@d00000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -503,7 +503,7 @@ PCIE0: pciex@d00000000 {
 				0x0 0x0 0x0 0x4 &UIC3 0xf 0x4 /* swizzled int D */>;
 		};
 
-		PCIE1: pciex@d20000000 {
+		PCIE1: pcie@d20000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/currituck.dts b/arch/powerpc/boot/dts/currituck.dts
index b6d87b9c2cef..aea8af810106 100644
--- a/arch/powerpc/boot/dts/currituck.dts
+++ b/arch/powerpc/boot/dts/currituck.dts
@@ -122,7 +122,7 @@ rtc@68 {
 			};
 		};
 
-		PCIE0: pciex@10100000000 {		// 4xGBIF1
+		PCIE0: pcie@10100000000 {		// 4xGBIF1
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -160,7 +160,7 @@ PCIE0: pciex@10100000000 {		// 4xGBIF1
 				0x0 0x0 0x0 0x4 &MPIC 49 0x2 /* int D */>;
 		};
 
-		PCIE1: pciex@30100000000 {		// 4xGBIF0
+		PCIE1: pcie@30100000000 {		// 4xGBIF0
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -197,7 +197,7 @@ PCIE1: pciex@30100000000 {		// 4xGBIF0
 				0x0 0x0 0x0 0x4 &MPIC 41 0x2 /* int D */>;
 		};
 
-		PCIE2: pciex@38100000000 {		// 2xGBIF0
+		PCIE2: pcie@38100000000 {		// 2xGBIF0
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/glacier.dts b/arch/powerpc/boot/dts/glacier.dts
index a7a802f4ffdd..e84ff1afb58c 100644
--- a/arch/powerpc/boot/dts/glacier.dts
+++ b/arch/powerpc/boot/dts/glacier.dts
@@ -489,7 +489,7 @@ PCIX0: pci@c0ec00000 {
 			interrupt-map = < 0x0 0x0 0x0 0x0 &UIC1 0x0 0x8 >;
 		};
 
-		PCIE0: pciex@d00000000 {
+		PCIE0: pcie@d00000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -531,7 +531,7 @@ PCIE0: pciex@d00000000 {
 				0x0 0x0 0x0 0x4 &UIC3 0xf 0x4 /* swizzled int D */>;
 		};
 
-		PCIE1: pciex@d20000000 {
+		PCIE1: pcie@d20000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/haleakala.dts b/arch/powerpc/boot/dts/haleakala.dts
index cb16dad43c92..f81ce8786d59 100644
--- a/arch/powerpc/boot/dts/haleakala.dts
+++ b/arch/powerpc/boot/dts/haleakala.dts
@@ -237,7 +237,7 @@ EMAC0: ethernet@ef600900 {
 			};
 		};
 
-		PCIE0: pciex@a0000000 {
+		PCIE0: pcie@a0000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/icon.dts b/arch/powerpc/boot/dts/icon.dts
index 2e6e3a7b2604..fbaa60b8f87a 100644
--- a/arch/powerpc/boot/dts/icon.dts
+++ b/arch/powerpc/boot/dts/icon.dts
@@ -315,7 +315,7 @@ PCIX0: pci@c0ec00000 {
 			interrupt-map = <0x0 0x0 0x0 0x0 &UIC1 19 0x8>;
 		};
 
-		PCIE0: pciex@d00000000 {
+		PCIE0: pcie@d00000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -356,7 +356,7 @@ PCIE0: pciex@d00000000 {
 				0x0 0x0 0x0 0x4 &UIC3 0x3 0x4 /* swizzled int D */>;
 		};
 
-		PCIE1: pciex@d20000000 {
+		PCIE1: pcie@d20000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/katmai.dts b/arch/powerpc/boot/dts/katmai.dts
index 02629e119b87..a8f353229fb7 100644
--- a/arch/powerpc/boot/dts/katmai.dts
+++ b/arch/powerpc/boot/dts/katmai.dts
@@ -319,7 +319,7 @@ PCIX0: pci@c0ec00000 {
 			>;
 		};
 
-		PCIE0: pciex@d00000000 {
+		PCIE0: pcie@d00000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -360,7 +360,7 @@ PCIE0: pciex@d00000000 {
 				0x0 0x0 0x0 0x4 &UIC3 0x3 0x4 /* swizzled int D */>;
 		};
 
-		PCIE1: pciex@d20000000 {
+		PCIE1: pcie@d20000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -401,7 +401,7 @@ PCIE1: pciex@d20000000 {
 				0x0 0x0 0x0 0x4 &UIC3 0x7 0x4 /* swizzled int D */>;
 		};
 
-		PCIE2: pciex@d40000000 {
+		PCIE2: pcie@d40000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/kilauea.dts b/arch/powerpc/boot/dts/kilauea.dts
index 2a3413221cc1..a709fb47a180 100644
--- a/arch/powerpc/boot/dts/kilauea.dts
+++ b/arch/powerpc/boot/dts/kilauea.dts
@@ -322,7 +322,7 @@ EMAC1: ethernet@ef600a00 {
 			};
 		};
 
-		PCIE0: pciex@a0000000 {
+		PCIE0: pcie@a0000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -363,7 +363,7 @@ PCIE0: pciex@a0000000 {
 				0x0 0x0 0x0 0x4 &UIC2 0x3 0x4 /* swizzled int D */>;
 		};
 
-		PCIE1: pciex@c0000000 {
+		PCIE1: pcie@c0000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/makalu.dts b/arch/powerpc/boot/dts/makalu.dts
index bf8fe1629392..c473cd911bca 100644
--- a/arch/powerpc/boot/dts/makalu.dts
+++ b/arch/powerpc/boot/dts/makalu.dts
@@ -268,7 +268,7 @@ EMAC1: ethernet@ef600a00 {
 			};
 		};
 
-		PCIE0: pciex@a0000000 {
+		PCIE0: pcie@a0000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -309,7 +309,7 @@ PCIE0: pciex@a0000000 {
 				0x0 0x0 0x0 0x4 &UIC2 0x3 0x4 /* swizzled int D */>;
 		};
 
-		PCIE1: pciex@c0000000 {
+		PCIE1: pcie@c0000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/redwood.dts b/arch/powerpc/boot/dts/redwood.dts
index f3e046fb49e2..f38035a1f4a1 100644
--- a/arch/powerpc/boot/dts/redwood.dts
+++ b/arch/powerpc/boot/dts/redwood.dts
@@ -235,7 +235,7 @@ EMAC0: ethernet@ef600a00 {
 				has-new-stacr-staopc;
 			};
 		};
-		PCIE0: pciex@d00000000 {
+		PCIE0: pcie@d00000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -276,7 +276,7 @@ PCIE0: pciex@d00000000 {
 				0x0 0x0 0x0 0x4 &UIC3 0x3 0x4 /* swizzled int D */>;
 		};
 
-		PCIE1: pciex@d20000000 {
+		PCIE1: pcie@d20000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -317,7 +317,7 @@ PCIE1: pciex@d20000000 {
 				0x0 0x0 0x0 0x4 &UIC3 0x7 0x4 /* swizzled int D */>;
 		};
 
-		PCIE2: pciex@d40000000 {
+		PCIE2: pcie@d40000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
-- 
2.25.1

