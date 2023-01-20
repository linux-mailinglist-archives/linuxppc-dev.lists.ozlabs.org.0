Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A9D675609
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 14:41:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz0yT2VPRz3fPs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 00:41:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=hTVFh3/n;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZKSz8BY+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=hTVFh3/n;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZKSz8BY+;
	dkim-atps=neutral
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz0qS3QTCz3fHK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 00:35:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221716; x=1705757716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RadYSxnPEsNw081BTc50G+mT/keKaPVINzosq7+I7zw=;
  b=hTVFh3/neYA118YGyAmHO37boY5fU6yfJmprhUTCDa6/lJpQepCXzlN1
   BED073+u+6jaJmyimKUJ4+H30MlfgfKSV9eJMaXyw7lKvLbBrTqX1+EF8
   maNeIfei3q/MEWGPo4biuBNn7KMKV3EQRK32TPjyhihneiLtvCX++/N8M
   NE8wZEtlW9bEMtNvqbZRU1Ed1extW0XPmIWMHJte4BepyUQxvPhnszVXP
   +s3UBFps5spojQQuAuaxtTbnvQ84ehJEZxsNd66KxG8IYDHtlie+BHIwH
   fP3EjdNi80DFo4EKCB8eLL6ABQ3Rrtpyr7+g8ElcZOeez8bL0HBV/4DCa
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561584"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 14:35:05 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 14:35:05 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 14:35:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221705; x=1705757705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RadYSxnPEsNw081BTc50G+mT/keKaPVINzosq7+I7zw=;
  b=ZKSz8BY+ZjDtLi8NIx3fL1VuvDK1e/4HuH70PCEC0GXl6R1xD3UCF5bT
   p6QW/YNSSb5mvivz2QtF+38vRYaINz6W4X89JYU5hkCvuTtqWrNztzKyX
   khdo5oOENVtyg3a9C37VoablSf1yS5wDnXiCiJ2rACfTGtIq9Lp1bIfzp
   FdamRQZrdMfhc5bBzxmSxc5Bj2Kd2mziMG3+4A2obM5YdpcQjMCphpvw6
   7rVWyKLogOvb5ZJ9PTbexRFq6klbbl/Bvc6SJnWZgYHaeYd3KFs1yt758
   nmnNmJ76W9ZbmFPPzRRkHES3ahIlKxWnD3Ydqi3/LS5shUVHWOp6Hcbwo
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561583"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:05 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E12B1280074;
	Fri, 20 Jan 2023 14:35:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 06/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH DC44 overlay
Date: Fri, 20 Jan 2023 14:34:51 +0100
Message-Id: <20230120133455.3962413-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Alexander Stein <alexander.stein@ew.tq-group.com>, soc@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add device tree overlay for LVDS display usage.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm/boot/dts/Makefile                    |  2 +
 ...1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts | 55 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d5105e8179431..774cc57274e20 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -806,9 +806,11 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-tsn.dtb \
 	ls1021a-twr.dtb
 
+ls1021a-tqmls1021a-mbls1021a-cdtech-dc44-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dtbo
 ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
 ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
 
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
 
diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts
new file mode 100644
index 0000000000000..ddc71bc597295
--- /dev/null
+++ b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+/*
+ * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&backlight_dcu {
+	status = "okay";
+};
+
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&display {
+	compatible = "cdtech,s070swv29hg-dc44";
+	status = "okay";
+
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&dcu_out>;
+		};
+	};
+};
+
+&i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	polytouch: touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&pca9554_0>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		/* LCD_PWR_EN -> TSC_WAKE */
+		wake-gpios = <&pca9554_1 4 GPIO_ACTIVE_HIGH>;
+		gain = <20>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+	};
+};
-- 
2.34.1

