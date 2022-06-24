Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D82559B57
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 16:19:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTzlR3hGpz3f6S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 00:19:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=baikalelectronics.ru header.i=@baikalelectronics.ru header.a=rsa-sha256 header.s=mail header.b=KeUXpB9b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baikalelectronics.ru (client-ip=87.245.175.230; helo=mail.baikalelectronics.com; envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=baikalelectronics.ru header.i=@baikalelectronics.ru header.a=rsa-sha256 header.s=mail header.b=KeUXpB9b;
	dkim-atps=neutral
Received: from mail.baikalelectronics.com (mail.baikalelectronics.com [87.245.175.230])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTzhP0wfJz3c87
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 00:16:53 +1000 (AEST)
Received: from mail (mail.baikal.int [192.168.51.25])
	by mail.baikalelectronics.com (Postfix) with ESMTP id E54E616C6;
	Fri, 24 Jun 2022 17:17:48 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com E54E616C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baikalelectronics.ru; s=mail; t=1656080268;
	bh=dQq5OIsnVRth+sqzHkFlLdBrOb42QdxbS+CEp9Nsxcw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=KeUXpB9bEA0u9yM7Z2Ev9snyCvK8y8lKnsRCFAiWur9+aSzfP+/uMp/3F131g9uAe
	 XVxjrqtrh9QIemz8UmkQzuU1Me9/FA1UrMTniWYthPE9bA32Rz8BOvbJd1r5dPwOI4
	 fT7ClKUUCylTGTFzMfmnQ+QUFVJ9Fdlh0dDLEdpM=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 24 Jun 2022 17:16:29 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson
	<bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Alexey
 Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, Rob
 Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, <linux-usb@vger.kernel.org>, Khuong Dinh
	<khuong@os.amperecomputing.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH RESEND v9 5/5] arm64: dts: apm: Harmonize DWC USB3 DT nodes name
Date: Fri, 24 Jun 2022 17:16:21 +0300
Message-ID: <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
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
Cc: devicetree@vger.kernel.org, Patrice Chotard <patrice.chotard@st.com>, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>, Paul Mackerras <paulus@samba.org>, linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In accordance with the DWC USB3 bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
named despite of the warning comment about possible backward
compatibility issues.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 4 ++--
 arch/arm64/boot/dts/apm/apm-storm.dtsi     | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index a83c82c50e29..832dd85b00bd 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -597,8 +597,8 @@ serial0: serial@10600000 {
 			interrupts = <0x0 0x4c 0x4>;
 		};
 
-		/* Do not change dwusb name, coded for backward compatibility */
-		usb0: dwusb@19000000 {
+		/* Node-name might need to be coded as dwusb for backward compatibility */
+		usb0: usb@19000000 {
 			status = "disabled";
 			compatible = "snps,dwc3";
 			reg =  <0x0 0x19000000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 0f37e77f5459..1520a945b7f9 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -923,8 +923,8 @@ sata3: sata@1a800000 {
 			phy-names = "sata-phy";
 		};
 
-		/* Do not change dwusb name, coded for backward compatibility */
-		usb0: dwusb@19000000 {
+		/* Node-name might need to be coded as dwusb for backward compatibility */
+		usb0: usb@19000000 {
 			status = "disabled";
 			compatible = "snps,dwc3";
 			reg =  <0x0 0x19000000 0x0 0x100000>;
@@ -933,7 +933,7 @@ usb0: dwusb@19000000 {
 			dr_mode = "host";
 		};
 
-		usb1: dwusb@19800000 {
+		usb1: usb@19800000 {
 			status = "disabled";
 			compatible = "snps,dwc3";
 			reg =  <0x0 0x19800000 0x0 0x100000>;
-- 
2.35.1

