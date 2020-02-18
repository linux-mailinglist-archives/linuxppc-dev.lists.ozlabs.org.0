Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20506162126
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 07:51:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MBNH1hLczDqTq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 17:51:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MBG25KqfzDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 17:46:18 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A7E4820363E;
 Tue, 18 Feb 2020 07:46:14 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9D9B62035DE;
 Tue, 18 Feb 2020 07:46:07 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AAD9E403DA;
 Tue, 18 Feb 2020 14:45:28 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] ASoC: dt-bindings: fsl_easrc: Add document for EASRC
Date: Tue, 18 Feb 2020 14:39:36 +0800
Message-Id: <a02af544c73914fe3a5ab2f35eb237ef68ee29e7.1582007379.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582007379.git.shengjiu.wang@nxp.com>
References: <cover.1582007379.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1582007379.git.shengjiu.wang@nxp.com>
References: <cover.1582007379.git.shengjiu.wang@nxp.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
IP module found on i.MX8MN.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,easrc.txt   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.txt

diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.txt b/Documentation/devicetree/bindings/sound/fsl,easrc.txt
new file mode 100644
index 000000000000..0e8153165e3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.txt
@@ -0,0 +1,57 @@
+NXP Asynchronous Sample Rate Converter (ASRC) Controller
+
+The Asynchronous Sample Rate Converter (ASRC) converts the sampling rate of a
+signal associated with an input clock into a signal associated with a different
+output clock. The driver currently works as a Front End of DPCM with other Back
+Ends Audio controller such as ESAI, SSI and SAI. It has four context to support
+four substreams within totally 32 channels.
+
+Required properties:
+- compatible:                Contains "fsl,imx8mn-easrc".
+
+- reg:                       Offset and length of the register set for the
+			     device.
+
+- interrupts:                Contains the asrc interrupt.
+
+- dmas:                      Generic dma devicetree binding as described in
+		             Documentation/devicetree/bindings/dma/dma.txt.
+
+- dma-names:                 Contains "ctx0_rx", "ctx0_tx",
+				      "ctx1_rx", "ctx1_tx",
+			              "ctx2_rx", "ctx2_tx",
+				      "ctx3_rx", "ctx3_tx".
+
+- clocks:                    Contains an entry for each entry in clock-names.
+
+- clock-names:               "mem" - Peripheral clock to driver module.
+
+- fsl,easrc-ram-script-name: The coefficient table for the filters
+
+- fsl,asrc-rate:             Defines a mutual sample rate used by DPCM Back
+			     Ends.
+
+- fsl,asrc-width:            Defines a mutual sample width used by DPCM Back
+			     Ends.
+
+Example:
+
+easrc: easrc@300C0000 {
+	compatible = "fsl,imx8mn-easrc";
+	reg = <0x0 0x300C0000 0x0 0x10000>;
+	interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&clk IMX8MN_CLK_ASRC_ROOT>;
+	clock-names = "mem";
+	dmas = <&sdma2 16 23 0> , <&sdma2 17 23 0>,
+	       <&sdma2 18 23 0> , <&sdma2 19 23 0>,
+	       <&sdma2 20 23 0> , <&sdma2 21 23 0>,
+	       <&sdma2 22 23 0> , <&sdma2 23 23 0>;
+	dma-names = "ctx0_rx", "ctx0_tx",
+		    "ctx1_rx", "ctx1_tx",
+		    "ctx2_rx", "ctx2_tx",
+		    "ctx3_rx", "ctx3_tx";
+	fsl,easrc-ram-script-name = "imx/easrc/easrc-imx8mn.bin";
+	fsl,asrc-rate  = <8000>;
+	fsl,asrc-width = <16>;
+	status = "disabled";
+};
-- 
2.21.0

