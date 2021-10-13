Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C342CDA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 00:15:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV6KL0bxjz3c7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 09:15:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=phobos-20191101 header.b=qyVpdHIc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=denx.de
 (client-ip=85.214.62.61; helo=phobos.denx.de; envelope-from=agust@denx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=qyVpdHIc; 
 dkim-atps=neutral
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV6GV4Yfvz2yPL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 09:12:34 +1100 (AEDT)
Received: from crub.agik.hopto.org (pd95f1d7c.dip0.t-ipconnect.de
 [217.95.29.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0173983619;
 Thu, 14 Oct 2021 00:05:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634162735;
 bh=ii9BG9EqksSCbuXPIWNXj6v8gddbB4AJcV5NiFPVTHI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qyVpdHIciw7YWFRYg2u9AcgoOaPBfHsWuLXucjobeUXm6BQ6bALWAoeCcw15/maF4
 UDpdXXl6LYYBDR7GbcRjeag7Dj/tAzM4pAxVwLAG2F7pADNN3ppc2ZejTAtauaDT7h
 bR2KlfQhL/7DAO7DuOrqHbtc9qPavON+Wb1wwilluH0GoiIrVTANbfj1FPbHn2f050
 WUJV452TYMlsCasM4Uqk5kcBpYdEfXTN+g51Fx+gAuamrsQ7Cs/s95hOJBEA+wzc/W
 nDxwN7srnm+Mi5aUIQNhhXcrnmrNXEeGLYsN7KNtvYFO5vxABcoicRDLCmZEoWvv66
 6J+asVDiLIwqA==
From: Anatolij Gustschin <agust@denx.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/5200: dts: fix localbus node warnings
Date: Thu, 14 Oct 2021 00:05:32 +0200
Message-Id: <20211013220532.24759-5-agust@denx.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211013220532.24759-1-agust@denx.de>
References: <20211013220532.24759-1-agust@denx.de>
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
Cc: devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix build warnings like:
localbus:ranges: 'oneOf' conditional failed, one must be fixed
...
Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 arch/powerpc/boot/dts/a3m071.dts    | 12 +++++-----
 arch/powerpc/boot/dts/a4m072.dts    | 20 ++++++++---------
 arch/powerpc/boot/dts/charon.dts    | 14 ++++++------
 arch/powerpc/boot/dts/cm5200.dts    |  7 ++++--
 arch/powerpc/boot/dts/digsy_mtc.dts | 16 ++++++++------
 arch/powerpc/boot/dts/lite5200.dts  |  4 ++--
 arch/powerpc/boot/dts/lite5200b.dts |  6 +++--
 arch/powerpc/boot/dts/media5200.dts | 20 +++++++++--------
 arch/powerpc/boot/dts/motionpro.dts | 32 +++++++++++++++------------
 arch/powerpc/boot/dts/mpc5200b.dtsi |  2 +-
 arch/powerpc/boot/dts/mucmc52.dts   | 34 +++++++++++++++--------------
 arch/powerpc/boot/dts/o2d.dts       | 10 +++++----
 arch/powerpc/boot/dts/o2d.dtsi      | 12 +++++-----
 arch/powerpc/boot/dts/o2d300.dts    | 10 +++++----
 arch/powerpc/boot/dts/o2dnt2.dts    | 10 +++++----
 arch/powerpc/boot/dts/o2i.dts       |  4 ++--
 arch/powerpc/boot/dts/o2mnt.dts     |  4 ++--
 arch/powerpc/boot/dts/o3dnt.dts     | 10 +++++----
 arch/powerpc/boot/dts/pcm030.dts    |  2 +-
 arch/powerpc/boot/dts/pcm032.dts    | 26 ++++++++++++----------
 arch/powerpc/boot/dts/tqm5200.dts   |  4 ++--
 arch/powerpc/boot/dts/uc101.dts     | 14 +++++++-----
 22 files changed, 151 insertions(+), 122 deletions(-)

diff --git a/arch/powerpc/boot/dts/a3m071.dts b/arch/powerpc/boot/dts/a3m071.dts
index 034cfd8aa95b..14e59aaa0ba7 100644
--- a/arch/powerpc/boot/dts/a3m071.dts
+++ b/arch/powerpc/boot/dts/a3m071.dts
@@ -87,15 +87,15 @@
 		};
 	};
 
-	localbus {
+	localbus@80000000 {
 		compatible = "fsl,mpc5200b-lpb","simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges = <0 0 0xfc000000 0x02000000
-			  3 0 0xe9000000 0x00080000
-			  5 0 0xe8000000 0x00010000>;
+		ranges = <0 0 0xfc000000 0x02000000>,
+			 <3 0 0xe9000000 0x00080000>,
+			 <5 0 0xe8000000 0x00010000>;
 
-		flash@0,0 {
+		flash@0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0 0x0 0x02000000>;
@@ -124,7 +124,7 @@
 			};
 		};
 
-		fpga@3,0 {
+		fpga@300000000 {
 			compatible = "anonymous,a3m071-fpga";
 			reg = <3 0x0 0x00080000
 			       5 0x0 0x00010000>;
diff --git a/arch/powerpc/boot/dts/a4m072.dts b/arch/powerpc/boot/dts/a4m072.dts
index d4270a2ec6c7..dede711957da 100644
--- a/arch/powerpc/boot/dts/a4m072.dts
+++ b/arch/powerpc/boot/dts/a4m072.dts
@@ -98,25 +98,25 @@
 		};
 	};
 
-	localbus {
+	localbus@80000000 {
 		compatible = "fsl,mpc5200b-lpb","simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges = <0 0 0xfe000000 0x02000000
-			  1 0 0x62000000 0x00400000
-			  2 0 0x64000000 0x00200000
-			  3 0 0x66000000 0x01000000
-			  6 0 0x68000000 0x01000000
-			  7 0 0x6a000000 0x00000004>;
-
-		flash@0,0 {
+		ranges = <0 0 0xfe000000 0x02000000>,
+			 <1 0 0x62000000 0x00400000>,
+			 <2 0 0x64000000 0x00200000>,
+			 <3 0 0x66000000 0x01000000>,
+			 <6 0 0x68000000 0x01000000>,
+			 <7 0 0x6a000000 0x00000004>;
+
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x02000000>;
 			bank-width = <2>;
 			#size-cells = <1>;
 			#address-cells = <1>;
 		};
-		sram0@1,0 {
+		sram0@100000000 {
 			compatible = "mtd-ram";
 			reg = <1 0x00000 0x00400000>;
 			bank-width = <2>;
diff --git a/arch/powerpc/boot/dts/charon.dts b/arch/powerpc/boot/dts/charon.dts
index ea6e76ae2545..2e3518909321 100644
--- a/arch/powerpc/boot/dts/charon.dts
+++ b/arch/powerpc/boot/dts/charon.dts
@@ -177,15 +177,15 @@
 		};
 	};
 
-	localbus {
+	localbus@80000000 {
 		compatible = "fsl,mpc5200-lpb","simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges = <	0 0 0xfc000000 0x02000000
-				1 0 0xe0000000 0x04000000 // CS1 range, SM501
-				3 0 0xe8000000 0x00080000>;
+		ranges = <0 0 0xfc000000 0x02000000>,
+			 <1 0 0xe0000000 0x04000000>, // CS1 range, SM501
+			 <3 0 0xe8000000 0x00080000>;
 
-		flash@0,0 {
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x02000000>;
 			bank-width = <4>;
@@ -194,7 +194,7 @@
 			#address-cells = <1>;
 		};
 
-		display@1,0 {
+		display@100000000 {
 			compatible = "smi,sm501";
 			reg = <1 0x00000000 0x00800000
 			       1 0x03e00000 0x00200000>;
@@ -203,7 +203,7 @@
 			little-endian;
 		};
 
-		mram0@3,0 {
+		mram0@300000000 {
 			compatible = "mtd-ram";
 			reg = <3 0x00000 0x80000>;
 			bank-width = <1>;
diff --git a/arch/powerpc/boot/dts/cm5200.dts b/arch/powerpc/boot/dts/cm5200.dts
index 66cae7be60c4..196f412f2c32 100644
--- a/arch/powerpc/boot/dts/cm5200.dts
+++ b/arch/powerpc/boot/dts/cm5200.dts
@@ -71,9 +71,12 @@
 		status = "disabled";
 	};
 
-	localbus {
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+
 		// 16-bit flash device at LocalPlus Bus CS0
-		flash@0,0 {
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x2000000>;
 			bank-width = <2>;
diff --git a/arch/powerpc/boot/dts/digsy_mtc.dts b/arch/powerpc/boot/dts/digsy_mtc.dts
index 57024a4c1e7d..28355f037e1b 100644
--- a/arch/powerpc/boot/dts/digsy_mtc.dts
+++ b/arch/powerpc/boot/dts/digsy_mtc.dts
@@ -103,12 +103,14 @@
 			 <0x01000000 0 0x00000000 0xa0000000 0 0x01000000>;
 	};
 
-	localbus {
-		ranges = <0 0 0xff000000 0x1000000
-			  4 0 0x60000000 0x0001000>;
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xff000000 0x1000000>,
+			 <4 0 0x60000000 0x0001000>;
 
 		// 16-bit flash device at LocalPlus Bus CS0
-		flash@0,0 {
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x1000000>;
 			bank-width = <2>;
@@ -134,21 +136,21 @@
 			};
 		};
 
-		can@4,0 {
+		can@400000000 {
 			compatible = "nxp,sja1000";
 			reg = <4 0x000 0x80>;
 			nxp,external-clock-frequency = <24000000>;
 			interrupts = <1 2 3>; // Level-low
 		};
 
-		can@4,100 {
+		can@400000100 {
 			compatible = "nxp,sja1000";
 			reg = <4 0x100 0x80>;
 			nxp,external-clock-frequency = <24000000>;
 			interrupts = <1 2 3>;  // Level-low
 		};
 
-		serial@4,200 {
+		serial@400000200 {
 			compatible = "nxp,sc28l92";
 			reg = <4 0x200 0x10>;
 			interrupts = <1 3 3>;
diff --git a/arch/powerpc/boot/dts/lite5200.dts b/arch/powerpc/boot/dts/lite5200.dts
index b9d8487813b4..4316669dc5bb 100644
--- a/arch/powerpc/boot/dts/lite5200.dts
+++ b/arch/powerpc/boot/dts/lite5200.dts
@@ -288,14 +288,14 @@
 			 <0x01000000 0 0x00000000 0xb0000000 0 0x01000000>;
 	};
 
-	localbus {
+	localbus@80000000 {
 		compatible = "fsl,mpc5200-lpb","simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
 
 		ranges = <0 0 0xff000000 0x01000000>;
 
-		flash@0,0 {
+		flash@0 {
 			compatible = "amd,am29lv652d", "cfi-flash";
 			reg = <0 0 0x01000000>;
 			bank-width = <1>;
diff --git a/arch/powerpc/boot/dts/lite5200b.dts b/arch/powerpc/boot/dts/lite5200b.dts
index 7e2d91c7cb66..f31825477703 100644
--- a/arch/powerpc/boot/dts/lite5200b.dts
+++ b/arch/powerpc/boot/dts/lite5200b.dts
@@ -121,10 +121,12 @@
 			 <0x01000000 0 0x00000000 0xb0000000 0 0x01000000>;
 	};
 
-	localbus {
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
 		ranges = <0 0 0xfe000000 0x02000000>;
 
-		flash@0,0 {
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x02000000>;
 			bank-width = <1>;
diff --git a/arch/powerpc/boot/dts/media5200.dts b/arch/powerpc/boot/dts/media5200.dts
index 96524ede16cd..e4bca32dbf10 100644
--- a/arch/powerpc/boot/dts/media5200.dts
+++ b/arch/powerpc/boot/dts/media5200.dts
@@ -102,26 +102,28 @@
 		interrupt-parent = <&mpc5200_pic>;
 	};
 
-	localbus {
-		ranges = < 0 0 0xfc000000 0x02000000
-			   1 0 0xfe000000 0x02000000
-			   2 0 0xf0010000 0x00010000
-			   3 0 0xf0020000 0x00010000 >;
-		flash@0,0 {
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xfc000000 0x02000000>,
+			 <1 0 0xfe000000 0x02000000>,
+			 <2 0 0xf0010000 0x00010000>,
+			 <3 0 0xf0020000 0x00010000>;
+		flash@0 {
 			compatible = "amd,am29lv28ml", "cfi-flash";
 			reg = <0 0x0 0x2000000>;                // 32 MB
 			bank-width = <4>;                       // Width in bytes of the flash bank
 			device-width = <2>;                     // Two devices on each bank
 		};
 
-		flash@1,0 {
+		flash@100000000 {
 			compatible = "amd,am29lv28ml", "cfi-flash";
 			reg = <1 0 0x2000000>;                  // 32 MB
 			bank-width = <4>;                       // Width in bytes of the flash bank
 			device-width = <2>;                     // Two devices on each bank
 		};
 
-		media5200_fpga: fpga@2,0 {
+		media5200_fpga: fpga@200000000 {
 			compatible = "fsl,media5200-fpga";
 			interrupt-controller;
 			#interrupt-cells = <2>;	// 0:bank 1:id; no type field
@@ -132,7 +134,7 @@
 			              1 1 3>;	// IRQ bank 1
 		};
 
-		uart@3,0 {
+		uart@300000000 {
 			compatible = "ti,tl16c752bpt";
 			reg = <3 0 0x10000>;
 			interrupt-parent = <&media5200_fpga>;
diff --git a/arch/powerpc/boot/dts/motionpro.dts b/arch/powerpc/boot/dts/motionpro.dts
index c23676093da8..09f0eaa4ad49 100644
--- a/arch/powerpc/boot/dts/motionpro.dts
+++ b/arch/powerpc/boot/dts/motionpro.dts
@@ -85,41 +85,45 @@
 		status = "disabled";
 	};
 
-	localbus {
-		ranges = <0 0 0xff000000 0x01000000
-			  1 0 0x50000000 0x00010000
-			  2 0 0x50010000 0x00010000
-			  3 0 0x50020000 0x00010000>;
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xff000000 0x01000000>,
+			 <1 0 0x50000000 0x00010000>,
+			 <2 0 0x50010000 0x00010000>,
+			 <3 0 0x50020000 0x00010000>;
 
 		// 8-bit DualPort SRAM on LocalPlus Bus CS1
-		kollmorgen@1,0 {
+		kollmorgen@100000000 {
 			compatible = "promess,motionpro-kollmorgen";
 			reg = <1 0 0x10000>;
 			interrupts = <1 1 0>;
 		};
 
 		// 8-bit board CPLD on LocalPlus Bus CS2
-		cpld@2,0 {
+		cpld@200000000 {
 			compatible = "promess,motionpro-cpld";
 			reg = <2 0 0x10000>;
 		};
 
 		// 8-bit custom Anybus Module on LocalPlus Bus CS3
-		anybus@3,0 {
+		anybus@300000000 {
 			compatible = "promess,motionpro-anybus";
 			reg = <3 0 0x10000>;
 		};
-		pro_module_general@3,0 {
-			compatible = "promess,pro_module_general";
-			reg = <3 0 3>;
-		};
-		pro_module_dio@3,800 {
+		/*
+		 * pro_module_general@300000000 {
+		 *	compatible = "promess,pro_module_general";
+		 *	reg = <3 0 3>;
+		 * };
+		 */
+		pro_module_dio@300000800 {
 			compatible = "promess,pro_module_dio";
 			reg = <3 0x800 2>;
 		};
 
 		// 16-bit flash device at LocalPlus Bus CS0
-		flash@0,0 {
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x01000000>;
 			bank-width = <2>;
diff --git a/arch/powerpc/boot/dts/mpc5200b.dtsi b/arch/powerpc/boot/dts/mpc5200b.dtsi
index ffa82c7e1055..5083661bce40 100644
--- a/arch/powerpc/boot/dts/mpc5200b.dtsi
+++ b/arch/powerpc/boot/dts/mpc5200b.dtsi
@@ -281,7 +281,7 @@
 			 <0x01000000 0 0x00000000 0xa0000000 0 0x01000000>;
 	};
 
-	localbus: localbus {
+	localbus: localbus@80000000 {
 		compatible = "fsl,mpc5200b-lpb","fsl,mpc5200-lpb","simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
diff --git a/arch/powerpc/boot/dts/mucmc52.dts b/arch/powerpc/boot/dts/mucmc52.dts
index e88a7bd4034d..0bf4f1a5bb19 100644
--- a/arch/powerpc/boot/dts/mucmc52.dts
+++ b/arch/powerpc/boot/dts/mucmc52.dts
@@ -111,12 +111,14 @@
 			 <0x01000000 0 0x00000000 0xa0000000 0 0x01000000>;
 	};
 
-	localbus {
-		ranges = <0 0 0xff800000 0x00800000
-			  1 0 0x80000000 0x00800000
-			  3 0 0x80000000 0x00800000>;
-
-		flash@0,0 {
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xff800000 0x00800000>,
+			 <1 0 0x80000000 0x00800000>,
+			 <3 0 0x80000000 0x00800000>;
+
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x00800000>;
 			bank-width = <4>;
@@ -157,61 +159,61 @@
 			};
 		};
 
-		simple100: gpio-controller-100@3,600100 {
+		simple100: gpio-controller-100@300600100 {
 			compatible = "manroland,mucmc52-aux-gpio";
 			reg = <3 0x00600100 0x1>;
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
-		simple104: gpio-controller-104@3,600104 {
+		simple104: gpio-controller-104@300600104 {
 			compatible = "manroland,mucmc52-aux-gpio";
 			reg = <3 0x00600104 0x1>;
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
-		simple200: gpio-controller-200@3,600200 {
+		simple200: gpio-controller-200@300600200 {
 			compatible = "manroland,mucmc52-aux-gpio";
 			reg = <3 0x00600200 0x1>;
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
-		simple201: gpio-controller-201@3,600201 {
+		simple201: gpio-controller-201@300600201 {
 			compatible = "manroland,mucmc52-aux-gpio";
 			reg = <3 0x00600201 0x1>;
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
-		simple202: gpio-controller-202@3,600202 {
+		simple202: gpio-controller-202@300600202 {
 			compatible = "manroland,mucmc52-aux-gpio";
 			reg = <3 0x00600202 0x1>;
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
-		simple203: gpio-controller-203@3,600203 {
+		simple203: gpio-controller-203@300600203 {
 			compatible = "manroland,mucmc52-aux-gpio";
 			reg = <3 0x00600203 0x1>;
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
-		simple204: gpio-controller-204@3,600204 {
+		simple204: gpio-controller-204@300600204 {
 			compatible = "manroland,mucmc52-aux-gpio";
 			reg = <3 0x00600204 0x1>;
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
-		simple206: gpio-controller-206@3,600206 {
+		simple206: gpio-controller-206@300600206 {
 			compatible = "manroland,mucmc52-aux-gpio";
 			reg = <3 0x00600206 0x1>;
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
-		simple207: gpio-controller-207@3,600207 {
+		simple207: gpio-controller-207@300600207 {
 			compatible = "manroland,mucmc52-aux-gpio";
 			reg = <3 0x00600207 0x1>;
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
-		simple20f: gpio-controller-20f@3,60020f {
+		simple20f: gpio-controller-20f@30060020f {
 			compatible = "manroland,mucmc52-aux-gpio";
 			reg = <3 0x0060020f 0x1>;
 			gpio-controller;
diff --git a/arch/powerpc/boot/dts/o2d.dts b/arch/powerpc/boot/dts/o2d.dts
index e0a8d3034417..fc7e8b46f058 100644
--- a/arch/powerpc/boot/dts/o2d.dts
+++ b/arch/powerpc/boot/dts/o2d.dts
@@ -16,11 +16,13 @@
 		reg = <0x00000000 0x08000000>;  // 128MB
 	};
 
-	localbus {
-		ranges = <0 0 0xfc000000 0x02000000
-			  3 0 0xe3000000 0x00100000>;
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xfc000000 0x02000000>,
+			 <3 0 0xe3000000 0x00100000>;
 
-		flash@0,0 {
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x02000000>;
 			bank-width = <2>;
diff --git a/arch/powerpc/boot/dts/o2d.dtsi b/arch/powerpc/boot/dts/o2d.dtsi
index b55a9e5bd828..898fe08a9fd0 100644
--- a/arch/powerpc/boot/dts/o2d.dtsi
+++ b/arch/powerpc/boot/dts/o2d.dtsi
@@ -73,12 +73,14 @@
 		};
 	};
 
-	localbus {
-		ranges = <0 0 0xff000000 0x01000000
-			  3 0 0xe3000000 0x00100000>;
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xff000000 0x01000000>,
+			 <3 0 0xe3000000 0x00100000>;
 
 		// flash device at LocalPlus Bus CS0
-		flash@0,0 {
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x01000000>;
 			bank-width = <1>;
@@ -100,7 +102,7 @@
 			};
 		};
 
-		csi@3,0 {
+		csi@300000000 {
 			compatible = "ifm,o2d-csi";
 			reg = <3 0 0x00100000>;
 			ifm,csi-clk-handle = <&gpt7>;
diff --git a/arch/powerpc/boot/dts/o2d300.dts b/arch/powerpc/boot/dts/o2d300.dts
index 55a25b700bed..f0faa73b786c 100644
--- a/arch/powerpc/boot/dts/o2d300.dts
+++ b/arch/powerpc/boot/dts/o2d300.dts
@@ -12,10 +12,12 @@
 	model = "ifm,o2d300";
 	compatible = "ifm,o2d";
 
-	localbus {
-		ranges = <0 0 0xfc000000 0x02000000
-			  3 0 0xe3000000 0x00100000>;
-		flash@0,0 {
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xfc000000 0x02000000>,
+			 <3 0 0xe3000000 0x00100000>;
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x02000000>;
 			bank-width = <2>;
diff --git a/arch/powerpc/boot/dts/o2dnt2.dts b/arch/powerpc/boot/dts/o2dnt2.dts
index c2eedbd1f5fc..ba2556fc227e 100644
--- a/arch/powerpc/boot/dts/o2dnt2.dts
+++ b/arch/powerpc/boot/dts/o2dnt2.dts
@@ -16,11 +16,13 @@
 		reg = <0x00000000 0x08000000>;  // 128MB
 	};
 
-	localbus {
-		ranges = <0 0 0xfc000000 0x02000000
-			  3 0 0xe3000000 0x00100000>;
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xfc000000 0x02000000>,
+			 <3 0 0xe3000000 0x00100000>;
 
-		flash@0,0 {
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x02000000>;
 			bank-width = <2>;
diff --git a/arch/powerpc/boot/dts/o2i.dts b/arch/powerpc/boot/dts/o2i.dts
index 3fb2e0ad7387..971be0d3b18e 100644
--- a/arch/powerpc/boot/dts/o2i.dts
+++ b/arch/powerpc/boot/dts/o2i.dts
@@ -12,8 +12,8 @@
 	model = "ifm,o2i";
 	compatible = "ifm,o2d";
 
-	localbus {
-		flash@0,0 {
+	localbus@80000000 {
+		flash@0 {
 			partition@60000 {
 				label = "kernel";
 				reg = <0x00060000 0x00260000>;
diff --git a/arch/powerpc/boot/dts/o2mnt.dts b/arch/powerpc/boot/dts/o2mnt.dts
index c5e0ba6e8f2b..42056a8fe35c 100644
--- a/arch/powerpc/boot/dts/o2mnt.dts
+++ b/arch/powerpc/boot/dts/o2mnt.dts
@@ -12,8 +12,8 @@
 	model = "ifm,o2mnt";
 	compatible = "ifm,o2d";
 
-	localbus {
-		flash@0,0 {
+	localbus@80000000 {
+		flash@0 {
 			partition@60000 {
 				label = "kernel";
 				reg = <0x00060000 0x00260000>;
diff --git a/arch/powerpc/boot/dts/o3dnt.dts b/arch/powerpc/boot/dts/o3dnt.dts
index e4c1bdd41271..7cfcc0a9c89b 100644
--- a/arch/powerpc/boot/dts/o3dnt.dts
+++ b/arch/powerpc/boot/dts/o3dnt.dts
@@ -16,11 +16,13 @@
 		reg = <0x00000000 0x04000000>;  // 64MB
 	};
 
-	localbus {
-		ranges = <0 0 0xfc000000 0x01000000
-			  3 0 0xe3000000 0x00100000>;
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xfc000000 0x01000000>,
+			 <3 0 0xe3000000 0x00100000>;
 
-		flash@0,0 {
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x01000000>;
 			bank-width = <2>;
diff --git a/arch/powerpc/boot/dts/pcm030.dts b/arch/powerpc/boot/dts/pcm030.dts
index 5cee474dcc4c..a4146b616b03 100644
--- a/arch/powerpc/boot/dts/pcm030.dts
+++ b/arch/powerpc/boot/dts/pcm030.dts
@@ -95,7 +95,7 @@
 			 <0x01000000 0 0x00000000 0xb0000000 0 0x01000000>;
 	};
 
-	localbus {
+	localbus@80000000 {
 		status = "disabled";
 	};
 
diff --git a/arch/powerpc/boot/dts/pcm032.dts b/arch/powerpc/boot/dts/pcm032.dts
index d00f13b62510..ea36ef5cdd02 100644
--- a/arch/powerpc/boot/dts/pcm032.dts
+++ b/arch/powerpc/boot/dts/pcm032.dts
@@ -92,17 +92,19 @@
 			 <0x01000000 0 0x00000000 0xb0000000 0 0x01000000>;
 	};
 
-	localbus {
-		ranges = <0 0 0xfe000000 0x02000000
-			  1 0 0xfc000000 0x02000000
-			  2 0 0xfbe00000 0x00200000
-			  3 0 0xf9e00000 0x02000000
-			  4 0 0xf7e00000 0x02000000
-			  5 0 0xe6000000 0x02000000
-			  6 0 0xe8000000 0x02000000
-			  7 0 0xea000000 0x02000000>;
-
-		flash@0,0 {
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xfe000000 0x02000000>,
+			 <1 0 0xfc000000 0x02000000>,
+			 <2 0 0xfbe00000 0x00200000>,
+			 <3 0 0xf9e00000 0x02000000>,
+			 <4 0 0xf7e00000 0x02000000>,
+			 <5 0 0xe6000000 0x02000000>,
+			 <6 0 0xe8000000 0x02000000>,
+			 <7 0 0xea000000 0x02000000>;
+
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x02000000>;
 			bank-width = <4>;
@@ -139,7 +141,7 @@
 			};
 		};
 
-		sram@2,0 {
+		sram@200000000 {
 			compatible = "mtd-ram";
 			reg = <2 0 0x00200000>;
 			bank-width = <2>;
diff --git a/arch/powerpc/boot/dts/tqm5200.dts b/arch/powerpc/boot/dts/tqm5200.dts
index 372177b19e60..24e97056b8e3 100644
--- a/arch/powerpc/boot/dts/tqm5200.dts
+++ b/arch/powerpc/boot/dts/tqm5200.dts
@@ -169,13 +169,13 @@
 		};
 	};
 
-	localbus {
+	localbus@80000000 {
 		compatible = "fsl,mpc5200-lpb","simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
 		ranges = <0 0 0xfc000000 0x02000000>;
 
-		flash@0,0 {
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x02000000>;
 			bank-width = <4>;
diff --git a/arch/powerpc/boot/dts/uc101.dts b/arch/powerpc/boot/dts/uc101.dts
index 2e34d019178b..c752712bcdbb 100644
--- a/arch/powerpc/boot/dts/uc101.dts
+++ b/arch/powerpc/boot/dts/uc101.dts
@@ -101,12 +101,14 @@
 		status = "disabled";
 	};
 
-	localbus {
-		ranges = <0 0 0xff800000 0x00800000
-			  1 0 0x80000000 0x00800000
-			  3 0 0x80000000 0x00800000>;
-
-		flash@0,0 {
+	localbus@80000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xff800000 0x00800000>,
+			 <1 0 0x80000000 0x00800000>,
+			 <3 0 0x80000000 0x00800000>;
+
+		flash@0 {
 			compatible = "cfi-flash";
 			reg = <0 0 0x00800000>;
 			bank-width = <2>;
-- 
2.17.1

