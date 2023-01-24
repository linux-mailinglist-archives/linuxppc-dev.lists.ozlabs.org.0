Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8145679625
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 12:05:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1PKG3QnZz3fFb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 22:05:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=pdK0neHt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZjP66V4m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=pdK0neHt;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZjP66V4m;
	dkim-atps=neutral
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1PFJ5gTNz308w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 22:02:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558149; x=1706094149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3O/hcxsf8awVeb5swPJncgu6itPwN+2RWGdGMMGB5rY=;
  b=pdK0neHtn+8VOMuBthLIHiPx2SRvLgy0JEur+9gs7kSrqBLpZWlpw739
   q+jctyHi7pHvfT6V6b4EyT17ucj0v+6ivWbZ7gIx2+7mI4qNJhaktKiCq
   JvV5Y7DkkG9RUU6LIOhxGbjuX6y3GU9EAKWNWfehq/ReP5cB6QwpeUrcc
   vvLB9OHCGgDnA7Z75OR1qj6kEOQbia6QsMISRNlm8nWXvqejLQbgTz6+h
   FBDofU+D4ob5WvZmnNVUKHS7pLrZY+UF5s3SE/irh4+ZCip8bX3kvxv8s
   e9Gak1yW1uaxp+ie4JWfgIDtViI7pfu9nyZMyu2OdNicRoo98PniRDP0h
   g==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616614"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:02:17 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 24 Jan 2023 12:02:17 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:02:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558137; x=1706094137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3O/hcxsf8awVeb5swPJncgu6itPwN+2RWGdGMMGB5rY=;
  b=ZjP66V4mx5r2NY7vShHKtjjSSmVYcKH3yIIPjJf9/SN9odY2npYXyBCY
   Jf62ru45YJsuu+kxWrPiIneYpD4TNr/Ey3Z+mKs22N6qdpEzig83FNsZ/
   dMeSwCKNdlnTJa/M06NlWb2NMn/ZwDNbIWzJ+ssvOY+FeHsNYWRfLqO/N
   OjSrhZ/l7SVFdQq5FXHtuj1OKPq5IdcXFPCjBB1nP+ZzdRx9Qr1YwPYPT
   B0miyl3rlwFtTdVsWFAQis9Xd2BAuNtGe72rRM1b9yCWtQ7d58USVLz5I
   FPiM/0U5c7yj3oxXtwGZdzXZLpVn/DG1DzJGy+lXyi/aVTZ3O0DqcKgJa
   w==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616613"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:17 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2E3C4280073;
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
Subject: [PATCH v3 03/10] ARM: dts: ls1021a: add TQMLS1021A flash partition layout
Date: Tue, 24 Jan 2023 12:02:06 +0100
Message-Id: <20230124110213.3221264-4-alexander.stein@ew.tq-group.com>
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

The bootloader does not add the partitions into DT, so add them manually
here.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* None

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

