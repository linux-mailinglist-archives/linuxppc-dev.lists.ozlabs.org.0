Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0E348343
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 21:57:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5LCW3C75z3bvs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 07:57:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=87.245.175.226;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
X-Greylist: delayed 334 seconds by postgrey-1.36 at boromir;
 Thu, 25 Mar 2021 07:57:11 AEDT
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F5LCC0GwJz30Cm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 07:57:10 +1100 (AEDT)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Alexey
 Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, Rob
 Herring <robh+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: [PATCH v7 3/7] powerpc: dts: akebono: Harmonize EHCI/OHCI DT nodes
 name
Date: Wed, 24 Mar 2021 23:48:32 +0300
Message-ID: <20210324204836.29668-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210324204836.29668-1-Sergey.Semin@baikalelectronics.ru>
References: <20210324204836.29668-1-Sergey.Semin@baikalelectronics.ru>
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
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
2.30.1

