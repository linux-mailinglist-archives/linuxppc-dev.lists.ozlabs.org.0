Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98C679613
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 12:04:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1PHC6zS5z3cd7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 22:04:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=BUe7DzTR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=d0gANoG+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=BUe7DzTR;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=d0gANoG+;
	dkim-atps=neutral
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1PFG2jPLz308w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 22:02:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558146; x=1706094146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fSfwPgEMSrPA0W9QIT6UX0FJsOwhXbijwR82Z3R/5VI=;
  b=BUe7DzTRZMYHgQpSZoysu+JMkQp3opxcNtZ+AeSJYib6FYuPrARkdjn/
   a+HlFw9uAZ0Vw31A7oVHJ4UXBuvD7OQj1Znb3JYluLlPDSI2MGbMnTJ+x
   MJLl44GSaDYrx64YMHcUZftIDjQhhkaL+yTg4GQ5v2zF9vNOzP5l4o7uS
   6Oyyy/6dWggGyqcz2dR/QV9Pq1VA8h9+gFAqV7ZHIS33zyu/30c0+sYNs
   l1A1eHlwtZXkpp9eH5L2vZj2SZOr3SM4bQaejTSezAYaX4La5tBE7bNjj
   HQf11CC42dOD5TVpu5s8LKFZd1Jmh2cVkABd0H9P4Mtw6huOgkpNaz4lv
   w==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616610"
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
  bh=fSfwPgEMSrPA0W9QIT6UX0FJsOwhXbijwR82Z3R/5VI=;
  b=d0gANoG+xKmY7s4fVw1q1MeLmjyWI8pa30IcUZotENHJIiZJ6BqbMO1+
   vsr6fC8KP1CRQv3R9IPmCJJqTlsNHKg/1Bej1tOazBqh7HuhDfit/RxgU
   Bqnvu6L9hrrcXhwO4RLpd/x2WLQdfLcXu6n3lq4fVB8xlLCzbZYFTUD5j
   9zd0yngVtdtmosxEM7Ggzh9ZVwU890qqeJx4+nvpAgwF9RpGcLYogwNk3
   wHZMnTpX/nVZfOVlZcmD3BjDZPrBOF5z9ErIjXUXC5jBu2rDdEPuOuQXZ
   dS5vTlrBKVczxC44+7zz5brxslmHOuLnsE7GDLcQNB0+oasho3l7ht2XF
   w==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616609"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:16 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5C2B2280072;
	Tue, 24 Jan 2023 12:02:16 +0100 (CET)
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
Subject: [PATCH v3 01/10] dt-bindings: arm: fsl: add TQ-Systems LS1021A board
Date: Tue, 24 Jan 2023 12:02:04 +0100
Message-Id: <20230124110213.3221264-2-alexander.stein@ew.tq-group.com>
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
Cc: devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Alexander Stein <alexander.stein@ew.tq-group.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Schiffer <matthias.schiffer@tq-group.com>, soc@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMLS102xA is a SOM family using NXP LS1021A CPU family.
MBLS102xA is an evaluation mainboard for this SOM.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v3:
* Added Krzysztof's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 3ba354578e8f9..489d350c3bbbe 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1164,6 +1164,16 @@ properties:
               - fsl,ls1021a-twr
           - const: fsl,ls1021a
 
+      - description:
+          TQ-Systems TQMLS102xA is a series of socketable SOM featuring
+          LS102x system-on-chip variants. MBLS102xA mainboard can be used as
+          starterkit.
+        items:
+          - enum:
+              - tq,ls1021a-tqmls1021a-mbls102xa
+          - const: tq,ls1021a-tqmls1021a
+          - const: fsl,ls1021a
+
       - description: LS1028A based Boards
         items:
           - enum:
-- 
2.34.1

