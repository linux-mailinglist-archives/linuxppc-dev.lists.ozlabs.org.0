Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C31B51130D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 09:56:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kp9zr07x2z3byZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 17:56:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=vETvq7iI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=vETvq7iI; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp9xD3PRbz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 17:53:52 +1000 (AEST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DC3E922248;
 Wed, 27 Apr 2022 09:53:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1651046025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJ+JVV6J1GmFzoijuIZAOgNfLf+/ye6hsTvF19I8ivU=;
 b=vETvq7iISJndT7F2b1obdYRc8p/yqR1iv39ldM3clYK6VQ7AmXbIHg42Zr7xBnJZvTUgk5
 ugTbLhIEDKtfBWRxn4JfGBphdwcwUQQG43GUnCj6Q0SqBYgJ6PRftzQ6n3U5CmiT6nvMQB
 sXPcNm1o6eHwf8A4KLLLxV+8Ql+oSao=
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 1/4] ARM: dts: ls1021a: reduce the interrupt-map-mask
Date: Wed, 27 Apr 2022 09:53:35 +0200
Message-Id: <20220427075338.1156449-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427075338.1156449-1-michael@walle.cc>
References: <20220427075338.1156449-1-michael@walle.cc>
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
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Michael Walle <michael@walle.cc>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reduce the interrupt-map-mask of the external interrupt controller to
7 to align with the devicetree schema.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm/boot/dts/ls1021a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 2e69d6eab4d1..5354104cae12 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -192,7 +192,7 @@ extirq: interrupt-controller@1ac {
 					<3 0 &gic GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
 					<4 0 &gic GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
 					<5 0 &gic GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-map-mask = <0xffffffff 0x0>;
+				interrupt-map-mask = <0x7 0x0>;
 			};
 		};
 
-- 
2.30.2

