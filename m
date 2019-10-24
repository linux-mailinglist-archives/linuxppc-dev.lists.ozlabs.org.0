Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43647E2D60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 11:31:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zMSv0zs6zDqTY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 20:31:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zMMD5wZ2zDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 20:26:47 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id ACF15200874;
 Thu, 24 Oct 2019 11:26:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0325320086D;
 Thu, 24 Oct 2019 11:26:37 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B4780402C4;
 Thu, 24 Oct 2019 17:26:28 +0800 (SGT)
From: Ran Wang <ran.wang_1@nxp.com>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Mark Rutland <mark.rutland@arm.com>,
 Pavel Machek <pavel@ucw.cz>, Huang Anson <anson.huang@nxp.com>
Subject: [PATCH v10 2/3] Documentation: dt: binding: fsl: Add 'little-endian'
 and update Chassis define
Date: Thu, 24 Oct 2019 17:26:43 +0800
Message-Id: <20191024092644.26583-2-ran.wang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191024092644.26583-1-ran.wang_1@nxp.com>
References: <20191024092644.26583-1-ran.wang_1@nxp.com>
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
Cc: Li Biwen <biwen.li@nxp.com>, Len Brown <len.brown@intel.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ran Wang <ran.wang_1@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

By default, QorIQ SoC's RCPM register block is Big Endian. But
there are some exceptions, such as LS1088A and LS2088A, are
Little Endian. So add this optional property to help identify
them.

Actually LS2021A and other Layerscapes won't totally follow Chassis
2.1, so separate them from powerpc SoC.

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Change in v10:
	- None

Change in v9:
	- None

Change in v8:
	- None.

Change in v7:
	- None.

Change in v6:
	- None.

Change in v5:
	- Add 'Reviewed-by: Rob Herring <robh@kernel.org>' to commit message.
	- Rename property 'fsl,#rcpm-wakeup-cells' to '#fsl,rcpm-wakeup-cells'.
	please see https://lore.kernel.org/patchwork/patch/1101022/

Change in v4:
	- Adjust indectation of 'ls1021a, ls1012a, ls1043a, ls1046a'.

Change in v3:
	- None.

Change in v2:
	- None.

 Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
index e284e4e..5a33619 100644
--- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
@@ -5,7 +5,7 @@ and power management.
 
 Required properites:
   - reg : Offset and length of the register set of the RCPM block.
-  - fsl,#rcpm-wakeup-cells : The number of IPPDEXPCR register cells in the
+  - #fsl,rcpm-wakeup-cells : The number of IPPDEXPCR register cells in the
 	fsl,rcpm-wakeup property.
   - compatible : Must contain a chip-specific RCPM block compatible string
 	and (if applicable) may contain a chassis-version RCPM compatible
@@ -20,6 +20,7 @@ Required properites:
 	* "fsl,qoriq-rcpm-1.0": for chassis 1.0 rcpm
 	* "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
 	* "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
+	* "fsl,qoriq-rcpm-2.1+": for chassis 2.1+ rcpm
 
 All references to "1.0" and "2.0" refer to the QorIQ chassis version to
 which the chip complies.
@@ -27,14 +28,19 @@ Chassis Version		Example Chips
 ---------------		-------------------------------
 1.0				p4080, p5020, p5040, p2041, p3041
 2.0				t4240, b4860, b4420
-2.1				t1040, ls1021
+2.1				t1040,
+2.1+				ls1021a, ls1012a, ls1043a, ls1046a
+
+Optional properties:
+ - little-endian : RCPM register block is Little Endian. Without it RCPM
+   will be Big Endian (default case).
 
 Example:
 The RCPM node for T4240:
 	rcpm: global-utilities@e2000 {
 		compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
 		reg = <0xe2000 0x1000>;
-		fsl,#rcpm-wakeup-cells = <2>;
+		#fsl,rcpm-wakeup-cells = <2>;
 	};
 
 * Freescale RCPM Wakeup Source Device Tree Bindings
@@ -44,7 +50,7 @@ can be used as a wakeup source.
 
   - fsl,rcpm-wakeup: Consists of a phandle to the rcpm node and the IPPDEXPCR
 	register cells. The number of IPPDEXPCR register cells is defined in
-	"fsl,#rcpm-wakeup-cells" in the rcpm node. The first register cell is
+	"#fsl,rcpm-wakeup-cells" in the rcpm node. The first register cell is
 	the bit mask that should be set in IPPDEXPCR0, and the second register
 	cell is for IPPDEXPCR1, and so on.
 
-- 
2.7.4

