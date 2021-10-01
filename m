Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1D841E578
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 02:17:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HL9fn2SHFz3c6Y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 10:17:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
X-Greylist: delayed 410 seconds by postgrey-1.36 at boromir;
 Fri, 01 Oct 2021 10:16:25 AEST
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HL9dP3kxJz2ypF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 10:16:24 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CDB291A0D8C;
 Fri,  1 Oct 2021 02:09:31 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 72ADC1A0D85;
 Fri,  1 Oct 2021 02:09:31 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 A06BF40A77; Thu, 30 Sep 2021 17:09:30 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] powerpc/mpc85xx: remove "simple-bus" compatible from ifc
 node
Date: Thu, 30 Sep 2021 19:09:24 -0500
Message-Id: <20211001000924.15421-6-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
In-Reply-To: <20211001000924.15421-1-leoyang.li@nxp.com>
References: <20211001000924.15421-1-leoyang.li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The binding of ifc device has been updated.  Update dts to match
accordingly.

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi      | 2 +-
 arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/c293si-post.dtsi    | 2 +-
 arch/powerpc/boot/dts/fsl/p1010si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t2081si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi   | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
index 4f044b41a776..fb3200b006ad 100644
--- a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
@@ -50,7 +50,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi b/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
index 2a677fd323eb..5c53cee8755f 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <16 2 0 0 20 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
index b8e0edd1ac69..4da451e000d9 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	/* FIXME: Test whether interrupts are split */
 	interrupts = <16 2 0 0 20 2 0 0>;
 };
diff --git a/arch/powerpc/boot/dts/fsl/c293si-post.dtsi b/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
index bec0fc36849d..ee3b45806ee3 100644
--- a/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <19 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
index b540e58ff79e..2d2550729dcc 100644
--- a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <16 2 0 0 19 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
index d552044c5afc..c15a49df66e1 100644
--- a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
@@ -52,7 +52,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
index f58eb820eb5e..38703e58dd09 100644
--- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
@@ -52,7 +52,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
index ecbb447920bc..58ef8bf6045c 100644
--- a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
@@ -50,7 +50,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi b/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
index fcac73486d48..65f3e17c0d41 100644
--- a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
@@ -50,7 +50,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <25 2 0 0>;
 };
 
-- 
2.25.1

