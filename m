Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF46755FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 14:38:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz0vP300Jz3fK8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 00:38:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=jHZnVlpM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZapEei36;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=jHZnVlpM;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZapEei36;
	dkim-atps=neutral
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz0qR14M5z3fBV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 00:35:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221715; x=1705757715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=psso5MgGgSIvaVP6NyHAp4AmadrM9eyMSldzA9eaKjk=;
  b=jHZnVlpMcadlxa9zorLzVf40g6X9I0c+AYIlpPtpCU1sKkOny4KfGX6P
   KPsluYYwx5Tz3wnNlqoq5SyvVAD/BHHAqteg0mzf4vyQ4U2KAZs2SuQ1h
   ac+z234mSj/fQFIrZDYiO3CX1UVbR7ZGTIrpH/SWNGzqNVnusVgurCXj1
   8IP7s3yWPpNV4/mTSYrqn9nKNaSozhiV5L6Pg6GqtRozGYEw6GZmfypOq
   1VeUnL1Gz7l9NaNGBEQ6Dhz/QUXRk4zOgRpGuDxm8DfMqAnVLnEaIlgUt
   lJLkBBWiPKwS6a2s2EsaKXaeGa+l5TJu3QmHy3TfH14cAwwdLpfS9GlmY
   w==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561577"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 14:35:04 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 14:35:04 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 14:35:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221704; x=1705757704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=psso5MgGgSIvaVP6NyHAp4AmadrM9eyMSldzA9eaKjk=;
  b=ZapEei36E/6IcNsih7tZzlCrVYGCSo/sYE1TNE/GdXhE8bJSZo2AH0aY
   DrXHryFlKNU33yCzacYChUbkDJTMvuIyhRbUhWISKfmts42OIfVcbAPSi
   7oZn5XNb0CQSLDsbjMA+GWCwT1vFroZk1iWiAg6tHWYArsanM3+tdqD9E
   cx/68NjDC6UJqtJLaQrZURB3n2cL2JzyJzGmSKt7KXs4BlI8l2GLMTOXb
   P+mMOyPoqWb8QXyBSH/fA6oKUY1zDsQh45w1y+Kwj+ZpuSDftQEpSMI6n
   oxy5h1P7j8urYVNjIjSQDJNpDEW0RMIBfj1LCgaqMIzyw5KuEZD21wRP5
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561576"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:03 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 872BD280073;
	Fri, 20 Jan 2023 14:35:03 +0100 (CET)
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
Subject: [PATCH v2 03/10] ARM: dts: ls1021a: add TQMLS1021A flash partition layout
Date: Fri, 20 Jan 2023 14:34:48 +0100
Message-Id: <20230120133455.3962413-4-alexander.stein@ew.tq-group.com>
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

The bootloader does not add the partitions into DT, so add them manually
here.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
index 24ad4a76fe597..ea6734253ba88 100644
--- a/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
@@ -77,5 +77,36 @@ qflash0: flash@0 {
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			uboot@0 {
+				label = "U-Boot-PBL";
+				reg = <0x0 0xe0000>;
+			};
+
+			env@e0000 {
+				label = "U-Boot Environment";
+				reg = <0xe0000 0x10000>;
+			};
+
+			dtb@f0000 {
+				label = "DTB";
+				reg = <0xf0000 0x10000>;
+			};
+
+			linux@100000 {
+				label = "Linux";
+				reg = <0x100000 0x700000>;
+			};
+
+			rootfs@800000 {
+				label = "RootFS";
+				reg = <0x800000 0x3800000>;
+			};
+		};
 	};
 };
-- 
2.34.1

