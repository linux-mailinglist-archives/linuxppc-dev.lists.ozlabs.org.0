Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BDFB46A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 06:56:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XW6B3GgpzF452
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 14:56:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=biwen.li@nxp.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XW164P2YzF42V
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 14:51:52 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5460D20010A;
 Tue, 17 Sep 2019 06:51:48 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B02C720065B;
 Tue, 17 Sep 2019 06:51:43 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B782F402AD;
 Tue, 17 Sep 2019 12:51:37 +0800 (SGT)
From: Biwen Li <biwen.li@nxp.com>
To: leoyang.li@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com
Subject: [v2,
 2/3] arm: dts: ls1021a: fix that FlexTimer cannot wakeup system in
 deep sleep
Date: Tue, 17 Sep 2019 12:41:18 +0800
Message-Id: <20190917044119.21895-2-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190917044119.21895-1-biwen.li@nxp.com>
References: <20190917044119.21895-1-biwen.li@nxp.com>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Biwen Li <biwen.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch fix a bug that FlexTimer cannot
wakeup system in deep sleep.

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- None

 arch/arm/boot/dts/ls1021a.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index e3973b611c3a..377bb4717584 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -1000,12 +1000,13 @@
 			compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
 			reg = <0x0 0x1ee2140 0x0 0x8>;
 			#fsl,rcpm-wakeup-cells = <2>;
+			fsl,rcpm-scfg = <&scfg 0x0 0x51c>; /* SCFG_SPARECR8 */
 		};
 
 		ftm_alarm0: timer0@29d0000 {
 			compatible = "fsl,ls1021a-ftm-alarm";
 			reg = <0x0 0x29d0000 0x0 0x10000>;
-			fsl,rcpm-wakeup = <&rcpm 0x0 0x20000000>;
+			fsl,rcpm-wakeup = <&rcpm 0x0 0x30000000>; /* FlexTimer1 and OCRAM1 are not powerdown during LPM20(sleep) */
 			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 			big-endian;
 		};
-- 
2.17.1

