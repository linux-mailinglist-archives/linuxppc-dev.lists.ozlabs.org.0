Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313757380E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 15:55:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjfJQ0tPSz3cGj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 23:55:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NPugggpN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NPugggpN;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjfHn1Dgrz3bZP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 23:54:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 958BEB81FE7;
	Wed, 13 Jul 2022 13:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051ECC34114;
	Wed, 13 Jul 2022 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657720463;
	bh=/tvxZwralFJ4cZXdPkXxJEQCgvBw9Ua4U7XdiklwROc=;
	h=From:To:Cc:Subject:Date:From;
	b=NPugggpNWrapctlNOMvCLfTS/6nQRBp4qtBMpShlx6IuKz8VtqvV92KmfK6a055Tb
	 LiJm0Itggmfb7TuXYij4Qj6U/BGcO0EHimH0uvGiXoRZJ7NEHvEROtj1fYTQlSfPxK
	 R/tWGZ91pxAnfu7R8AQykRLoxbSlFGaVYImN/9d2g5A+SbMhW2DvPn9ogQ/BGfCmR9
	 Hvik6QiYCSrsweYDeehsB7cCqGeCVaf5oiWomt2MANb/k699X3JxZDTJXczafFUY/o
	 18S9t443e72R5l29VEEe9usJERuwbaF9WLxXASWJNiX/TKwYBa4SMiBkto4yLcAk0N
	 udxMjiowqC0vQ==
Received: by pali.im (Postfix)
	id 3B1619D9; Wed, 13 Jul 2022 15:54:20 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] powerpc: dts: turris1x.dts: Add CPLD reboot node
Date: Wed, 13 Jul 2022 15:44:29 +0200
Message-Id: <20220713134429.18748-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CPLD firmware can reset board by writing value 0x01 at CPLD memory offset
0x0d. Define syscon-reboot node for this reset support.

Fixes: 54c15ec3b738 ("powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/boot/dts/turris1x.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
index c76b628cf026..12e08271e61f 100644
--- a/arch/powerpc/boot/dts/turris1x.dts
+++ b/arch/powerpc/boot/dts/turris1x.dts
@@ -332,7 +332,7 @@
 			 * Turris CPLD firmware is open source and available at:
 			 * https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_CPLD.v
 			 */
-			compatible = "cznic,turris1x-cpld", "fsl,p1021rdb-pc-cpld", "simple-bus";
+			compatible = "cznic,turris1x-cpld", "fsl,p1021rdb-pc-cpld", "simple-bus", "syscon";
 			reg = <0x3 0x0 0x30>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -352,6 +352,14 @@
 				gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
 			};
 
+			reboot@d {
+				compatible = "syscon-reboot";
+				reg = <0x0d 0x01>;
+				offset = <0x0d>;
+				mask = <0x01>;
+				value = <0x01>;
+			};
+
 			led-controller@13 {
 				/*
 				 * LEDs are controlled by CPLD firmware.
-- 
2.20.1

