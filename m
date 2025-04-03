Return-Path: <linuxppc-dev+bounces-7437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6089BA7A966
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Apr 2025 20:30:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZT9KS6kWSz3024;
	Fri,  4 Apr 2025 05:30:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743705052;
	cv=none; b=Av7VgBpS1fkASaly7hUSzr2IcLGoUmmWSPenXzsGHrNcEFySj9qTnobTzFgBQAV9qAo3RQXRAjeDgawJlPKFoGlaXAYP6Zvn1drO35Dz5HRLhYsIyq2/Bc1dfTEIE1P3L5CdDNRa6OnULg+98KAyRtWGYjQK1JuSSMkVYlNthnwGI2bg1XiiSsnFb43OeqaBvyiiM9G9R+QYx63saPkjXreWmdWTrZRVglZwizGVtn79AQsMT+R7626UxAY2ODJOq3or8Jl7H3FT9Fil4gvSatDDlMmehBhmRJAvNi8JvXQtNrPWL6jndj959rEF8mZ+l6/iY3Uv2WmOVxlxZon0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743705052; c=relaxed/relaxed;
	bh=UdDp1sO0IopfH7Iy+tgmsR53cIFBoLuTkzWc5BMhUC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d8sN9b3e7jaZ1av3Y5Q+XDRX7fd4lUwcee3+O7aL4+jSeIs/u/4d+5ENLbNQJS/0xc+FgTTZliump5/6ToAYB/rahY1FEld8E5Mdbw5rFevXXLA7b3rcQtHZA7KbAczTJWEUIt5znL1R9CMDypWDIK1vYgH4b0vPVZzlcr2befCjU04235MY5iJhwpwPvI1b4K015lmi63N0zA5S3ijLh3KMldY2NsNr6dkVtRl6T+431nH9osP/4Sk4ObVm5N01AXbRL/qRyOYfzaBE6hSm7aITCdf0CG1HGL268vtPSw9lrk/LtH9msB7ASfb6+R6Q0HpjC7SHPxnWfmoasbcUOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=N8pW6y6H; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b1; helo=out-177.mta0.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=N8pW6y6H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b1; helo=out-177.mta0.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 665 seconds by postgrey-1.37 at boromir; Fri, 04 Apr 2025 05:30:52 AEDT
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZT9KS04BLz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 05:30:50 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743705031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UdDp1sO0IopfH7Iy+tgmsR53cIFBoLuTkzWc5BMhUC0=;
	b=N8pW6y6HFbeE9hCyE1ExGSseCusV1hXW05RIrKkHvLtrxfI0VTomHeIxrLZT6ZmnQ3pmZh
	lSJXxwl818uHQhTcRf7gnBYyXmnKddjhdtmAQLXBkvJhnGvL1/TCvKqwoRYKfZBYrMzjjA
	ZKlIFMCwdhALDB+60jfyWeIu+JHt1/4=
From: Sean Anderson <sean.anderson@linux.dev>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [RFC net-next PATCH 13/13] powerpc: dts: Add compatible strings for Lynx PCSs
Date: Thu,  3 Apr 2025 14:30:23 -0400
Message-Id: <20250403183023.1948676-1-sean.anderson@linux.dev>
In-Reply-To: <20250403181907.1947517-1-sean.anderson@linux.dev>
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This adds appropriate compatible strings for Lynx PCSs on PowerPC QorIQ
platforms. This also changes the node name to avoid warnings from
ethernet-phy.yaml.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi             | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi             | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-2.dtsi             | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-3.dtsi             | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi              | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi              | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi              | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi              | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi              | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi              | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi             | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi             | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi              | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi              | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi              | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi              | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi              | 3 ++-
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi              | 3 ++-
 20 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
index 7e70977f282a..61d52044e7b4 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
@@ -66,7 +66,8 @@ mdio@e1000 {
 		reg = <0xe1000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy0: ethernet-phy@0 {
+		pcsphy0: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
index 5f89f7c1761f..78d6e49655f4 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
@@ -70,7 +70,8 @@ mdio@f1000 {
 		reg = <0xf1000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy6: ethernet-phy@0 {
+		pcsphy6: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
index 71eb75e82c2e..5ffd1c2efaee 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
@@ -73,7 +73,8 @@ mdio@e3000 {
 		reg = <0xe3000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy1: ethernet-phy@0 {
+		pcsphy1: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
index fb7032ddb7fc..e0325f09ce5f 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
@@ -70,7 +70,8 @@ mdio@f3000 {
 		reg = <0xf3000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy7: ethernet-phy@0 {
+		pcsphy7: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-2.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-2.dtsi
index 6b3609574b0f..8e6f6c5f0f2e 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-2.dtsi
@@ -38,7 +38,8 @@ mdio@e1000 {
 		reg = <0xe1000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy0: ethernet-phy@0 {
+		pcsphy0: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-3.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-3.dtsi
index 28ed1a85a436..2cd3f0688cb1 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-3.dtsi
@@ -38,7 +38,8 @@ mdio@e3000 {
 		reg = <0xe3000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy1: ethernet-phy@0 {
+		pcsphy1: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
index 1089d6861bfb..9f8c38a629cb 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
@@ -62,7 +62,8 @@ mdio@e1000 {
 		reg = <0xe1000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy0: ethernet-phy@0 {
+		pcsphy0: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
index a95bbb4fc827..248a57129d40 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
@@ -69,7 +69,8 @@ mdio@e3000 {
 		reg = <0xe3000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy1: ethernet-phy@0 {
+		pcsphy1: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
index 7d5af0147a25..73cef28db890 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
@@ -69,7 +69,8 @@ mdio@e5000 {
 		reg = <0xe5000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy2: ethernet-phy@0 {
+		pcsphy2: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
index 61e5466ec854..4657b6a8fb78 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
@@ -69,7 +69,8 @@ mdio@e7000 {
 		reg = <0xe7000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy3: ethernet-phy@0 {
+		pcsphy3: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
index 3ba0cdafc069..ac322e5803c2 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
@@ -62,7 +62,8 @@ mdio@e9000 {
 		reg = <0xe9000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy4: ethernet-phy@0 {
+		pcsphy4: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
index 51748de0a289..68ffa2c65e03 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
@@ -69,7 +69,8 @@ mdio@eb000 {
 		reg = <0xeb000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy5: ethernet-phy@0 {
+		pcsphy5: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
index ee4f5170f632..caf28fcbd55c 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
@@ -70,7 +70,8 @@ mdio@f1000 {
 		reg = <0xf1000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy14: ethernet-phy@0 {
+		pcsphy14: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
index 83d2e0ce8f7b..6128b9fb5381 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
@@ -70,7 +70,8 @@ mdio@f3000 {
 		reg = <0xf3000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy15: ethernet-phy@0 {
+		pcsphy15: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
index 3132fc73f133..a7dffe6bbe5b 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
@@ -62,7 +62,8 @@ mdio@e1000 {
 		reg = <0xe1000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy8: ethernet-phy@0 {
+		pcsphy8: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
index 75e904d96602..d0ad92f2ca2d 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
@@ -69,7 +69,8 @@ mdio@e3000 {
 		reg = <0xe3000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy9: ethernet-phy@0 {
+		pcsphy9: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
index 69f2cc7b8f19..b4b893eead2a 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
@@ -69,7 +69,8 @@ mdio@e5000 {
 		reg = <0xe5000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy10: ethernet-phy@0 {
+		pcsphy10: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
index b3aaf01d7da0..6c15a6ff0926 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
@@ -69,7 +69,8 @@ mdio@e7000 {
 		reg = <0xe7000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy11: ethernet-phy@0 {
+		pcsphy11: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
index 18e020432807..14fa4d067ffd 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
@@ -62,7 +62,8 @@ mdio@e9000 {
 		reg = <0xe9000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy12: ethernet-phy@0 {
+		pcsphy12: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
index 55f329d13f19..64737187a577 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
@@ -69,7 +69,8 @@ mdio@eb000 {
 		reg = <0xeb000 0x1000>;
 		fsl,erratum-a011043; /* must ignore read errors */
 
-		pcsphy13: ethernet-phy@0 {
+		pcsphy13: ethernet-pcs@0 {
+			compatible = "fsl,lynx-pcs";
 			reg = <0x0>;
 		};
 	};
-- 
2.35.1.1320.gc452695387.dirty


