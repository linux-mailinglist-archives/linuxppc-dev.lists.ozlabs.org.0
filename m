Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3157E86000E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 18:51:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=baikalelectronics.ru header.i=@baikalelectronics.ru header.a=rsa-sha256 header.s=post header.b=UtkeAyN0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tggfx0hJfz3dWP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 04:51:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=baikalelectronics.ru header.i=@baikalelectronics.ru header.a=rsa-sha256 header.s=post header.b=UtkeAyN0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baikalelectronics.ru (client-ip=213.79.110.86; helo=post.baikalelectronics.com; envelope-from=sergey.semin@baikalelectronics.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 315 seconds by postgrey-1.37 at boromir; Fri, 23 Feb 2024 04:50:23 AEDT
Received: from post.baikalelectronics.com (post.baikalelectronics.com [213.79.110.86])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tggf745nYz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 04:50:23 +1100 (AEDT)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
	by post.baikalelectronics.com (Proxmox) with ESMTP id E050AE0ECC;
	Thu, 22 Feb 2024 20:44:58 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	baikalelectronics.ru; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:from:from:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=post;
	 bh=9lKQbTvvvBtu+/xIRzSEw0xWHHrnTA6OZ3oo1VxzsVo=; b=UtkeAyN0MCXM
	btzuqgDfBN+3fxVvjk6ptU4Iz3AHbqWViGOdaSun6cho0T6XalgPnyDigYf6iJAL
	LsSOVt7lRO2SZc4ZXDOXWbkGPQq51O6NFdgyGbxE5KEDqAITnSxExovf1IWGtOiu
	OGu125ttGi/FJHpghyfRJkTGtxFefig=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
	by post.baikalelectronics.com (Proxmox) with ESMTP id BE9C2E0DE6;
	Thu, 22 Feb 2024 20:44:58 +0300 (MSK)
Received: from localhost (10.8.30.70) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Thu, 22 Feb 2024 20:44:58 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Aneesh
 Kumar K.V <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand
	<frowand.list@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH RESEND v10 1/1] powerpc: dts: akebono: Harmonize EHCI/OHCI DT nodes name
Date: Thu, 22 Feb 2024 20:44:51 +0300
Message-ID: <20240222174456.25903-2-Sergey.Semin@baikalelectronics.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222174456.25903-1-Sergey.Semin@baikalelectronics.ru>
References: <20240222174456.25903-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.8.30.70]
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Serge Semin <Sergey.Semin@baikalelectronics.ru>, Serge Semin <fancer.lancer@gmail.com>, linuxppc-dev@lists.ozlabs.org
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
2.43.0


