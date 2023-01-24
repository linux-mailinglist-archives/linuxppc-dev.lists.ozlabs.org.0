Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8C7679635
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 12:08:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1PNV26Wpz3cdl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 22:08:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=JHFn17GK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=nfe1c8B3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=JHFn17GK;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=nfe1c8B3;
	dkim-atps=neutral
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1PFL1s4Gz3c8b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 22:02:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558150; x=1706094150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Lfr/oH4GT9ZPy5cQIRAJOqX6mMsqobCIWK3XrP/hkY=;
  b=JHFn17GKZnINg+eOWdRo5daP1FpVDyMn2LRuwBKW4Q/2mEqxUUeuVPPY
   Pb6q2bKCphdC+qElwrUMHJZgQ107vRQLzplLM3xRSE29sUSBWomg0n8ak
   G+7SwtfTw2oU86QLcRYTq4jexaC2gfLtAGSlSsRkmAJHhXi3WSPfKA94K
   t13Mb91mWVtetJ6J0CPY+tKlXujEhZHKWo9afF3NYNa2Zsd/jqNLTr70O
   hu+J7IgVgiIBGZqhQU86hFWndTfbwBG9lwN1q/cffJ0tvT9l7OXngF6zS
   65QWPHpiPYD1lHllM6rdG8T1UxUWpkNVsZz1/NW5QkoBHLLp3OluBQoij
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616623"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:02:18 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 24 Jan 2023 12:02:18 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:02:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558138; x=1706094138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Lfr/oH4GT9ZPy5cQIRAJOqX6mMsqobCIWK3XrP/hkY=;
  b=nfe1c8B3/QzQK+Xamdfxk+14F/HuUQfVPSSrsM/2p6Q/EhndbobWNbNG
   BujGUeOLvVnWSI9oMN3f8LK18wvtC4hwUNJn6TyvVckoHhBJ26MHB2EjL
   ogTstDzmp5z8Xju/1ublXDETiA0Xk8pOs51O9PnBMboigWChJkZcQGZxC
   q1QGq5Vczer1+9eJCZ3Jq2Q0V9xJhrwi05Ng+jNJqVjfNGmROLvi6THWl
   oTlHV9jRr16AoMXOX0j5B4ZhjUZ0+zZHJUdoc7OFaSXwXyHudJskTrwFb
   ntW8Gdzrp8HOE6DejH6zjeHGsJXe6IPbOsQzMWpy/R7jYpEnIcT1GnKuB
   A==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616621"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:18 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D02A2280072;
	Tue, 24 Jan 2023 12:02:17 +0100 (CET)
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
Subject: [PATCH v3 05/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA HDMI overlay
Date: Tue, 24 Jan 2023 12:02:08 +0100
Message-Id: <20230124110213.3221264-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
References: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
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

Add device tree overlay for HDMI usage.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* None

Changes in v2:
* None

 arch/arm/boot/dts/Makefile                    |  2 ++
 .../ls1021a-tqmls1021a-mbls1021a-hdmi.dtso    | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 626f7172c74e9..f9f75c5325808 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -806,8 +806,10 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-tsn.dtb \
 	ls1021a-twr.dtb
 
+ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
 ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
 
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
 
 dtb-$(CONFIG_SOC_VF610) += \
diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
new file mode 100644
index 0000000000000..f5ca22643c08e
--- /dev/null
+++ b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
@@ -0,0 +1,36 @@
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
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&sii9022a_in>;
+		};
+	};
+};
+
+&hdmi_out {
+	status = "okay";
+};
+
+&sii9022a {
+	status = "okay";
+
+	ports {
+		port@0 {
+			sii9022a_in: endpoint {
+				remote-endpoint = <&dcu_out>;
+			};
+		};
+	};
+};
-- 
2.34.1

