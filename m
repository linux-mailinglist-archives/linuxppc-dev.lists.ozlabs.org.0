Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F04F559B52
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 16:18:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTzkN3ddqz3dy6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 00:18:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=baikalelectronics.ru header.i=@baikalelectronics.ru header.a=rsa-sha256 header.s=mail header.b=L5euMlCp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baikalelectronics.ru (client-ip=87.245.175.230; helo=mail.baikalelectronics.com; envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=baikalelectronics.ru header.i=@baikalelectronics.ru header.a=rsa-sha256 header.s=mail header.b=L5euMlCp;
	dkim-atps=neutral
Received: from mail.baikalelectronics.com (mail.baikalelectronics.com [87.245.175.230])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTzhJ4pxbz3cBw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 00:16:48 +1000 (AEST)
Received: from mail (mail.baikal.int [192.168.51.25])
	by mail.baikalelectronics.com (Postfix) with ESMTP id 9680F16C3;
	Fri, 24 Jun 2022 17:17:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com 9680F16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baikalelectronics.ru; s=mail; t=1656080267;
	bh=VjyxAcMepOyqZqRyUPoUg9jWo9vWfhMdZZrNXa6WyMQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=L5euMlCpTuEQcfs5UusI5OsW5uZNWnKV33aAJu/oXI9mhXHpPLTEyUGi6SizUaYyj
	 o0n4kjJlu+4dd+dVue1lN0bp8KZzoQ+rGJ4IPhjNNW1wHZcKDlQ6lqd6//2V7v0J07
	 4WiHKrdkJSjxbsNREPkv5V622DNb9/4pGZLeUnQE=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 24 Jun 2022 17:16:28 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson
	<bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Alexey
 Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, Rob
 Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, <linux-usb@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: [PATCH RESEND v9 3/5] powerpc: dts: akebono: Harmonize EHCI/OHCI DT nodes name
Date: Fri, 24 Jun 2022 17:16:19 +0300
Message-ID: <20220624141622.7149-4-Sergey.Semin@baikalelectronics.ru>
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
Cc: devicetree@vger.kernel.org, Khuong Dinh <khuong@os.amperecomputing.com>, linux-arm-msm@vger.kernel.org, Patrice Chotard <patrice.chotard@st.com>, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In accordance with the Generic EHCI/OHCI bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
nodes are correctly named.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/powerpc/boot/dts/akebono.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/boot/dts/akebono.dts b/arch/powerpc/boot/dts/akebono.dts
index df18f8dc4642..343326c30380 100644
--- a/arch/powerpc/boot/dts/akebono.dts
+++ b/arch/powerpc/boot/dts/akebono.dts
@@ -126,7 +126,7 @@ SATA0: sata@30000010000 {
 			interrupts = <93 2>;
 		};
 
-		EHCI0: ehci@30010000000 {
+		EHCI0: usb@30010000000 {
 			compatible = "ibm,476gtr-ehci", "generic-ehci";
 			reg = <0x300 0x10000000 0x0 0x10000>;
 			interrupt-parent = <&MPIC>;
@@ -140,14 +140,14 @@ SD0: sd@30000000000 {
 			interrupt-parent = <&MPIC>;
 		};
 
-		OHCI0: ohci@30010010000 {
+		OHCI0: usb@30010010000 {
 			compatible = "ibm,476gtr-ohci", "generic-ohci";
 			reg = <0x300 0x10010000 0x0 0x10000>;
 			interrupt-parent = <&MPIC>;
 			interrupts = <89 1>;
 			};
 
-		OHCI1: ohci@30010020000 {
+		OHCI1: usb@30010020000 {
 			compatible = "ibm,476gtr-ohci", "generic-ohci";
 			reg = <0x300 0x10020000 0x0 0x10000>;
 			interrupt-parent = <&MPIC>;
-- 
2.35.1

